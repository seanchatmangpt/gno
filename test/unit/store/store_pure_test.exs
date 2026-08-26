defmodule Gno.StorePureTest do
  @moduledoc """
  Pure, non-live-server tests for `Gno.Store` module-attribute helpers and
  `Gno.Store.Adapter`'s default (non-overridden) callback implementations.

  These exercise real compiled data (the `@adapter_classes` module attribute,
  parsed from the real `priv/vocabs/gno_store_adapter.ttl` vocab file at
  compile time) and real `Grax.schema/1` lookups -- no network/live triple
  store required, unlike `test/unit/store/store_test.exs` (`Gno.StoreCase`).
  """

  use GnoCase, async: true

  alias Gno.Store.Adapters.{Fuseki, GraphDB, Oxigraph, Qlever}

  describe "Store.adapter_classes/0" do
    test "returns the known store adapter class IRIs parsed from the real vocab file" do
      classes = Store.adapter_classes()

      assert is_list(classes)
      refute Enum.empty?(classes)
      assert Enum.all?(classes, &match?(%RDF.IRI{}, &1))

      assert MapSet.new(classes) ==
               MapSet.new([
                 RDF.iri("https://w3id.org/gno/store/adapter/Fuseki"),
                 RDF.iri("https://w3id.org/gno/store/adapter/GraphDB"),
                 RDF.iri("https://w3id.org/gno/store/adapter/Oxigraph"),
                 RDF.iri("https://w3id.org/gno/store/adapter/Qlever")
               ])
    end
  end

  describe "Store.adapters/0" do
    test "returns the real adapter modules" do
      adapters = Store.adapters()

      assert MapSet.new(adapters) ==
               MapSet.new([Fuseki, GraphDB, Oxigraph, Qlever])
    end

    test "each returned adapter is a real Grax schema module resolvable from its class IRI" do
      classes = Store.adapter_classes()
      adapters = Store.adapters()

      assert length(adapters) == length(classes)

      for class <- classes do
        assert Grax.schema(class) in adapters
      end
    end
  end

  describe "Gno.Store.Adapter.default_dataset_endpoint_segment/1" do
    test "returns {:ok, \"\"} for an adapter struct with no :dataset field" do
      assert Gno.Store.Adapter.default_dataset_endpoint_segment(%Qlever{}) == {:ok, ""}
      assert Gno.Store.Adapter.default_dataset_endpoint_segment(%Oxigraph{}) == {:ok, ""}
    end

    test "returns {:ok, dataset} for an adapter struct with a :dataset value set" do
      assert Gno.Store.Adapter.default_dataset_endpoint_segment(%GraphDB{dataset: "x"}) ==
               {:ok, "x"}

      assert Gno.Store.Adapter.default_dataset_endpoint_segment(%Fuseki{dataset: "my-dataset"}) ==
               {:ok, "my-dataset"}
    end

    test "returns an InvalidEndpointError for an adapter struct with :dataset explicitly nil" do
      assert {:error, %Gno.Store.InvalidEndpointError{}} =
               Gno.Store.Adapter.default_dataset_endpoint_segment(%GraphDB{dataset: nil})
    end
  end
end
