# grz-cli Container

A lightweight Docker container for [grz-cli](https://github.com/BfArM-MVH/grz-tools/blob/main/packages/grz-cli/README.md), a command-line tool for validating, encrypting, and uploading submissions to a genomDE Model Project GDC (Genome Data Center).

## Version

Current version: 1.5.0 (with `grz-check` 0.2.0)

### nextflow

Based on the default, `grz-cli` only flavor, there is an additional container available which includes some tools needed when running in a [Nextflow](https://www.nextflow.io/) workflow. To use it, prepend the tag with `nextflow-`, e.g., `nextflow-1.5.0`.

## Usage

```bash
docker run --rm -it ghcr.io/mhh-humangenetik/grz-cli:1.5.0
```

## License

See [LICENSE](LICENSE) file for details. The license only covers this container definition and not the software contained within.