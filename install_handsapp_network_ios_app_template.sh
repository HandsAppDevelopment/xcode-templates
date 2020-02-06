#!/usr/bin/env bash

set -o errexit
set -o errtrace

TEMPLATE_DIR=${HOME}/"Library/Developer/Xcode/Templates/Project Templates/HandsApp"
PARENT_TEMPLATE_NAME="HandsApp iOS App.xctemplate"
TEMPLATE_NAME="HandsApp Network iOS App.xctemplate"

if [ ! -d "$TEMPLATE_DIR" ]; then
  echo "Didn't find a directory for the templates, so creating it..."
  mkdir -p "${TEMPLATE_DIR}"
  echo "Created $TEMPLATE_DIR"
fi

if [ -d "$TEMPLATE_DIR/$TEMPLATE_NAME" ]; then
  echo "Delete previously created templates..."
  rm -rf "$TEMPLATE_DIR/$TEMPLATE_NAME"
  echo "Deleted $TEMPLATE_DIR/$TEMPLATE_NAME"
fi

if [ -d "$TEMPLATE_DIR/$PARENT_TEMPLATE_NAME" ]; then
  echo "Delete previously created templates..."
  rm -rf "$TEMPLATE_DIR/$PARENT_TEMPLATE_NAME"
  echo "Deleted $TEMPLATE_DIR/$PARENT_TEMPLATE_NAME"
fi

echo "Copying template files..."
cp -rf "./$PARENT_TEMPLATE_NAME" "$TEMPLATE_DIR"
cp -rf "./$TEMPLATE_NAME" "$TEMPLATE_DIR"

echo "Done."
