# Final build fix

The frontend uses React 18.3.1 with react-scripts 5.0.1, ESLint 8.57.1, and explicit AJV 8 / ajv-keywords 5 compatibility packages. The Docker build also installs those AJV packages explicitly before running the production build and disables CRA's ESLint webpack plugin. The deployment script now stops on a non-zero Docker build/start result instead of reporting success after a failed build.
