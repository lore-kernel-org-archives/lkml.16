Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D74221ABD1
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743159786; cv=none; b=RSS3iZDvK0qf3n1XWf3kbAOgV8nMAPTyauqGRBt25U7qrsPfrPzV25gr5ux/z21XkK8mNLafuJ8dQHVGw+S2n8DVpFvTVtsLnyrnDupOhihxNAv7cQW5roCkDrUanm0LRfLiQ/Bygs4yzaBG0Yo8LnFvivuxLvDSaYPpri/hLwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743159786; c=relaxed/simple;
	bh=FOFWiAYSyx44KVxMf8ZVYfZw2/T0gUlKOs0RhszDu0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ihKc8XIQ3RIMwv5Nn5BpHu4T/NBYqtzlIoHfi7IRoAg9TGtPIEeTQXmG4P0dJ7kuW1lm2NsEVfacwSK29vpxV91G3qwr+KsBuvD2IB0d2h/BFLjLym/HqTC58bLbO5FBQwmfR4rBVHLTVahIVv3XKYbOFKJjO+YXea6lFqObkII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZlXwEPS2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZlXwEPS2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743159782;
	bh=FOFWiAYSyx44KVxMf8ZVYfZw2/T0gUlKOs0RhszDu0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZlXwEPS2LocAW8WUtqhJFw1KPezF+mBfTVBdGEEnC/X7RlwkpiXvoED8NF3lLRgCN
	 lEK2uoIj2vCi2WGn8W+fMx/Mh2ZWs/VS3sVvZ7m/WFAVTCEOgjtAcns2mbC1nkrJ+f
	 LSoIp5NENjVR7E1SSqDMca05i623B7Bk0kyn5RGuv092gDnaxoCXcMBwdLE/ASAvDa
	 oiRJ1NJkE9CGXNC4+L19DjA8tCLmobN2a5dfLkGQ8+BfQS5UuL280ikwTTPADDdxbv
	 +V8VwotuDoBe33RBuKm0jL4bgOeO02Xg/NCCncyW4E9N/kijlQi+ZDSeOx7ZxuzOuj
	 9hszRTdxsHAhA==
Received: from debian.. (unknown [171.76.87.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 46B7F17E1062;
	Fri, 28 Mar 2025 12:02:59 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	lumag@kernel.org,
	quic_abhinavk@quicinc.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] drm/ci: uprev mesa
Date: Fri, 28 Mar 2025 16:32:33 +0530
Message-ID: <20250328110239.993685-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250328110239.993685-1-vignesh.raman@collabora.com>
References: <20250328110239.993685-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current s3cp implementation does not work anymore after the
migration, and instead of fixing it and propagating the fix down to us,
it's simpler to directly use curl. Uprev mesa [1][2] to adapt these
changes. Also replace broken s3cp command with a curl wrapper call in
drm-ci.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34120
[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34244

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/build-igt.sh   | 2 +-
 drivers/gpu/drm/ci/build.sh       | 6 +++---
 drivers/gpu/drm/ci/gitlab-ci.yml  | 6 ++++--
 drivers/gpu/drm/ci/image-tags.yml | 2 +-
 drivers/gpu/drm/ci/lava-submit.sh | 2 +-
 5 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ci/build-igt.sh b/drivers/gpu/drm/ci/build-igt.sh
index eddb5f782a5e..caa2f4804ed5 100644
--- a/drivers/gpu/drm/ci/build-igt.sh
+++ b/drivers/gpu/drm/ci/build-igt.sh
@@ -71,4 +71,4 @@ tar -cf artifacts/igt.tar /igt
 # Pass needed files to the test stage
 S3_ARTIFACT_NAME="igt.tar.gz"
 gzip -c artifacts/igt.tar > ${S3_ARTIFACT_NAME}
-ci-fairy s3cp --token-file "${S3_JWT_FILE}" ${S3_ARTIFACT_NAME} https://${PIPELINE_ARTIFACTS_BASE}/${KERNEL_ARCH}/${S3_ARTIFACT_NAME}
+s3_upload ${S3_ARTIFACT_NAME} https://${PIPELINE_ARTIFACTS_BASE}/${KERNEL_ARCH}/
diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 284873e94d8d..6fb74c51abe2 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -148,13 +148,13 @@ if [[ "$UPLOAD_TO_MINIO" = "1" ]]; then
 
     ls -l "${S3_JWT_FILE}"
     for f in $FILES_TO_UPLOAD; do
-        ci-fairy s3cp --token-file "${S3_JWT_FILE}" /kernel/$f \
-                https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/$f
+        s3_upload /kernel/$f \
+                https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/
     done
 
     S3_ARTIFACT_NAME="kernel-files.tar.zst"
     tar --zstd -cf $S3_ARTIFACT_NAME install
-    ci-fairy s3cp --token-file "${S3_JWT_FILE}" ${S3_ARTIFACT_NAME} https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/${S3_ARTIFACT_NAME}
+    s3_upload ${S3_ARTIFACT_NAME} https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/
 
     echo "Download vmlinux.xz from https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/vmlinux.xz"
 fi
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 6850ce99a673..e54e382bf5fb 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -1,6 +1,6 @@
 variables:
   DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa
-  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 82ab58f6c6f94fa80ca7e1615146f08356e3ba69
+  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha f73132f1215a37ce8ffc711a0136c90649aaf128
 
   UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git
   TARGET_BRANCH: drm-next
@@ -20,8 +20,10 @@ variables:
           rm download-git-cache.sh
           set +o xtrace
   S3_JWT_FILE: /s3_jwt
+  S3_JWT_HEADER_FILE: /s3_jwt_header
   S3_JWT_FILE_SCRIPT: |-
       echo -n '${S3_JWT}' > '${S3_JWT_FILE}' &&
+      echo -n "Authorization: Bearer ${S3_JWT}" > '${S3_JWT_HEADER_FILE}' &&
       unset CI_JOB_JWT S3_JWT  # Unsetting vulnerable env variables
   S3_HOST: s3.freedesktop.org
   # This bucket is used to fetch the kernel image
@@ -253,7 +255,7 @@ make git archive:
     - tar -cvzf ../$CI_PROJECT_NAME.tar.gz .
 
     # Use id_tokens for JWT auth
-    - ci-fairy s3cp --token-file "${S3_JWT_FILE}" ../$CI_PROJECT_NAME.tar.gz https://$S3_HOST/${S3_GITCACHE_BUCKET}/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME/$CI_PROJECT_NAME.tar.gz
+    - s3_upload ../$CI_PROJECT_NAME.tar.gz https://$S3_HOST/${S3_GITCACHE_BUCKET}/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME/
 
 
 # Sanity checks of MR settings and commit logs
diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
index c04ba0e69935..53fe34b86578 100644
--- a/drivers/gpu/drm/ci/image-tags.yml
+++ b/drivers/gpu/drm/ci/image-tags.yml
@@ -1,5 +1,5 @@
 variables:
-   CONTAINER_TAG: "20250307-mesa-uprev"
+   CONTAINER_TAG: "20250328-mesa-uprev"
    DEBIAN_X86_64_BUILD_BASE_IMAGE: "debian/x86_64_build-base"
    DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
 
diff --git a/drivers/gpu/drm/ci/lava-submit.sh b/drivers/gpu/drm/ci/lava-submit.sh
index f22720359b33..a1e8b34fb2d4 100755
--- a/drivers/gpu/drm/ci/lava-submit.sh
+++ b/drivers/gpu/drm/ci/lava-submit.sh
@@ -54,7 +54,7 @@ cp artifacts/ci-common/init-*.sh results/job-rootfs-overlay/
 cp "$SCRIPTS_DIR"/setup-test-env.sh results/job-rootfs-overlay/
 
 tar zcf job-rootfs-overlay.tar.gz -C results/job-rootfs-overlay/ .
-ci-fairy s3cp --token-file "${S3_JWT_FILE}" job-rootfs-overlay.tar.gz "https://${JOB_ROOTFS_OVERLAY_PATH}"
+s3_upload job-rootfs-overlay.tar.gz "https://${JOB_ARTIFACTS_BASE}"
 
 # Prepare env vars for upload.
 section_switch variables "Environment variables passed through to device:"
-- 
2.47.2

