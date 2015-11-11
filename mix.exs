defmodule Riak.Mixfile do
  use Mix.Project

  def project do
    [ app: :riak,
      version: "1.0.0",
      elixir: "~> 1.0",
      deps: deps,
      build_per_environment: false,
      name: "Riak Elixir Client",
      source_url: "https://github.com/drewkerrigan/riak-elixir-client",
      description: description,
      package: package ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [ :pooler ],
      included_applications: [ :riakc ] ]
  end

  defp deps do
    [ {:earmark, only: :dev},
      {:ex_doc, only: :dev},
      {:linguist, "~> 0.1"},
      {:pooler, "1.5.0-2-ge4dd951", github: "seth/pooler", override: true},
      {:meck, github: "eproxus/meck", tag: "0.8.2", override: true},
      {:riak_pb, github: "basho/riak_pb", override: true, tag: "2.1.0.7", compile: "./rebar get-deps compile deps_dir=../"},
      {:riakc, "2.1.1-12-g400ca72", github: "basho/riak-erlang-client"} ]
  end

  defp description do
    """
    A Riak client written in Elixir.
    """
  end

  defp package do
    [ files: [ "lib", "mix.exs", "README*", "LICENSE*", "THANKS*", "test", "examples" ],
      contributors: [ "Drew Kerrigan", "Eduardo Gurgel" ],
      licenses: [ "Apache 2.0" ],
      links: %{"GitHub" => "https://github.com/drewkerrigan/riak-elixir-client"} ]
  end
end
