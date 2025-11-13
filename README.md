# grz-cli Container

A lightweight Docker container for [svtopo](https://github.com/PacificBiosciences/SVTopo), a command-line tool for complex structural variant visualization for HiFi sequencing data .

## Version

Current version: 0.3.0

### nextflow

Based on the default, `svtopo` only flavor, there is an additional container available which includes some tools needed when running in a [Nextflow](https://www.nextflow.io/) workflow. To use it, prepend the tag with `nextflow-`, e.g., `nextflow-1.5.0`.

## Usage

```bash
docker run --rm -it ghcr.io/mhh-humangenetik/svtopo:0.3.0 svtopo
```

## License

See [LICENSE](LICENSE) file for details. The license only covers this container definition and not the software contained within.