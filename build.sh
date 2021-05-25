if [ -z "$SLEEPY_DURATION" ]; then
  SLEEPY_DURATION="100"
fi

echo "Sleeping for $SLEEPY_DURATION seconds..."
sleep $SLEEPY_DURATION

if [ -z "$NETLIFY_API_HOST" ]; then
  NETLIFY_API_HOST="api.netlify.com"
fi

if [ -z "$BUILD_HOOK_ID" ]; then
  BUILD_HOOK_ID="NO_BUILD_HOOK_ID_PROVIDED"
fi

cat index.html.template | \
  sed "s/NETLIFY_API_HOST/$NETLIFY_API_HOST/g;s/BUILD_HOOK_ID/$BUILD_HOOK_ID/g" | \
  tee index.html
