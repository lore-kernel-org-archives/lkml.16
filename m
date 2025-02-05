Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFD8229B27
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 08:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738743442; cv=none; b=uaXXwk+kFKcmZMpqTIiacLoZRUyr1/ZkCN/klavSddEv682p40Is6guGh0dJDKASZAqdrz97khkrS8onmqklQhp3QzRN7RkTw5UBRYOBqYeQcneXX6a/XsnqVo5MjOwdTkcREuJqZXYwTYGNfFy3vtDMn9sViMSBdiv1prJHT4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738743442; c=relaxed/simple;
	bh=TwcKijoDdvB2KESuaUkAlxu5ofJu4K0qwDbtn1z0Cik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eNMpq8WtnvwYjJbmIM3s1kY5nunxrUK4vz5MOPD/pF4LrlTCfJOpSXCdYbDGeMJRVWm3aikfYZ/CtG64mvRro9zpwFYuN+rt6K28NdzMph3QVKVB5jfts8slwP3GS/NzUZEGMlM6CiJyEtaeLwZHteih00ErfZuLTB36AKn7vcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QB0bpXcU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QB0bpXcU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738743438;
	bh=TwcKijoDdvB2KESuaUkAlxu5ofJu4K0qwDbtn1z0Cik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QB0bpXcUGT4xIO9nWGQPdhAQRe0o6xvQ3MYVZXqP23z5JK4Mf/tzMD7R0CxRcwt7g
	 ZcZ/Dvrk5RzGIpO7U9FZRbERReksXqm4UvYBjzF5EtciQmQRchnhot2B4Wwlavf0KZ
	 6mWoa6/fcHH5I8/zC5bHyO4p0HJHI0/xjATeH1GAPRmcLTMDjhjDAQnXYyAyqRcviP
	 yn4jYtunmCVFxM2DQ/lWrrkIpIZr6cIg9TLgwT99iG10VSmtfh+5XupvfgInHbzGYO
	 0u3Cu8NrIBdkEKWmeosj/SDnQUmL5oDqQrjJN+DmOo6DqLBPZtuFiNozpc78VcBysa
	 kRRnP1UGoXu4Q==
Received: from localhost.localdomain (unknown [171.76.83.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E6F2017E153C;
	Wed,  5 Feb 2025 09:17:15 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	jani.nikula@linux.intel.com,
	dmitry.baryshkov@linaro.org,
	mripard@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] drm/ci: update gitlab rules
Date: Wed,  5 Feb 2025 13:46:47 +0530
Message-ID: <20250205081652.1928927-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205081652.1928927-1-vignesh.raman@collabora.com>
References: <20250205081652.1928927-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update gitlab rules to include scheduled pipelines.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - No changes. 

---
 drivers/gpu/drm/ci/build.yml     |   1 -
 drivers/gpu/drm/ci/gitlab-ci.yml | 116 +++++++++++++------------------
 drivers/gpu/drm/ci/test.yml      |  26 +++----
 3 files changed, 63 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
index a2baa00a20db..274f118533a7 100644
--- a/drivers/gpu/drm/ci/build.yml
+++ b/drivers/gpu/drm/ci/build.yml
@@ -1,6 +1,5 @@
 .build:
   extends:
-    - .build-rules
     - .container+build-rules
   stage: build-only
   artifacts:
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 48ab2de9c90b..f04aabe8327c 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -41,6 +41,7 @@ variables:
   # Python scripts for structured logger
   PYTHONPATH: "$PYTHONPATH:$CI_PROJECT_DIR/install"
 
+
 default:
   id_tokens:
     S3_JWT:
@@ -67,6 +68,7 @@ default:
       export S3_JWT="$(<${S3_JWT_FILE})" &&
       rm "${S3_JWT_FILE}"
 
+
 include:
   - project: 'freedesktop/ci-templates'
     ref: 16bc29078de5e0a067ff84a1a199a3760d3b3811
@@ -126,33 +128,27 @@ stages:
   - rockchip
   - software-driver
 
+
 # YAML anchors for rule conditions
 # --------------------------------
 .rules-anchors:
   rules:
-    # Pipeline for forked project branch
-    - if: &is-forked-branch '$CI_COMMIT_BRANCH && $CI_PROJECT_NAMESPACE != "mesa"'
-      when: manual
-    # Forked project branch / pre-merge pipeline not for Marge bot
-    - if: &is-forked-branch-or-pre-merge-not-for-marge '$CI_PROJECT_NAMESPACE != "mesa" || ($GITLAB_USER_LOGIN != "marge-bot" && $CI_PIPELINE_SOURCE == "merge_request_event")'
-      when: manual
-    # Pipeline runs for the main branch of the upstream Mesa project
-    - if: &is-mesa-main '$CI_PROJECT_NAMESPACE == "mesa" && $CI_COMMIT_REF_NAME == $CI_DEFAULT_BRANCH && $CI_COMMIT_BRANCH'
-      when: always
-    # Post-merge pipeline
-    - if: &is-post-merge '$CI_PROJECT_NAMESPACE == "mesa" && $CI_COMMIT_BRANCH'
-      when: on_success
-    # Post-merge pipeline, not for Marge Bot
-    - if: &is-post-merge-not-for-marge '$CI_PROJECT_NAMESPACE == "mesa" && $GITLAB_USER_LOGIN != "marge-bot" && $CI_COMMIT_BRANCH'
-      when: on_success
+    # do not duplicate pipelines on merge pipelines
+    - if: $CI_COMMIT_BRANCH && $CI_OPEN_MERGE_REQUESTS && $CI_PIPELINE_SOURCE == "push"
+      when: never
+    # merge pipeline
+    - if: &is-merge-attempt $GITLAB_USER_LOGIN == "marge-bot" && $CI_PIPELINE_SOURCE == "merge_request_event"
+    # post-merge pipeline
+    - if: &is-post-merge $GITLAB_USER_LOGIN == "marge-bot" && $CI_PIPELINE_SOURCE == "push"
     # Pre-merge pipeline
-    - if: &is-pre-merge '$CI_PIPELINE_SOURCE == "merge_request_event"'
-      when: on_success
-    # Pre-merge pipeline for Marge Bot
-    - if: &is-pre-merge-for-marge '$GITLAB_USER_LOGIN == "marge-bot" && $CI_PIPELINE_SOURCE == "merge_request_event"'
-      when: on_success
+    - if: &is-pre-merge $CI_PIPELINE_SOURCE == "merge_request_event"
     # Push to a branch on a fork
-    - &is-fork-push '$CI_PROJECT_NAMESPACE != "mesa" && $CI_PIPELINE_SOURCE == "push"'
+    - if: &is-fork-push $CI_PROJECT_NAMESPACE != "mesa" && $CI_PIPELINE_SOURCE == "push"
+    # nightly pipeline
+    - if: &is-scheduled-pipeline $CI_PIPELINE_SOURCE == "schedule"
+    # pipeline for direct pushes that bypassed the CI
+    - if: &is-direct-push $CI_PROJECT_NAMESPACE == "mesa" && $CI_PIPELINE_SOURCE == "push" && $GITLAB_USER_LOGIN != "marge-bot"
+
 
 # Rules applied to every job in the pipeline
 .common-rules:
@@ -160,39 +156,48 @@ stages:
     - if: *is-fork-push
       when: manual
 
+
 .never-post-merge-rules:
   rules:
     - if: *is-post-merge
       when: never
 
-# Rule to filter for only scheduled pipelines.
-.scheduled_pipeline-rules:
-  rules:
-    - if: &is-scheduled-pipeline '$CI_PIPELINE_SOURCE == "schedule"'
-      when: on_success
-
-# Generic rule to not run the job during scheduled pipelines. Jobs that aren't
-# something like a nightly run should include this rule.
-.no_scheduled_pipelines-rules:
-  rules:
-    - if: *is-scheduled-pipeline
-      when: never
 
-# When to automatically run the CI for build jobs
-.build-rules:
-  rules:
-    - !reference [.no_scheduled_pipelines-rules, rules]
-    - !reference [.never-post-merge-rules, rules]
-    # Run automatically once all dependency jobs have passed
-    - when: on_success
-
-# When to automatically run the CI for container jobs
 .container+build-rules:
   rules:
-    - !reference [.no_scheduled_pipelines-rules, rules]
+    - !reference [.common-rules, rules]
+    # Run when re-enabling a disabled farm, but not when disabling it
+    - !reference [.disable-farm-mr-rules, rules]
+    # Never run immediately after merging, as we just ran everything
     - !reference [.never-post-merge-rules, rules]
+    # Build everything in merge pipelines, if any files affecting the pipeline
+    # were changed
+    - if: *is-merge-attempt
+      changes: &all_paths
+      - drivers/gpu/drm/ci/**/*
+      when: on_success
+    # Same as above, but for pre-merge pipelines
+    - if: *is-pre-merge
+      changes:
+        *all_paths
+      when: manual
+    # Skip everything for pre-merge and merge pipelines which don't change
+    # anything in the build
+    - if: *is-merge-attempt
+      when: never
+    - if: *is-pre-merge
+      when: never
+    # Build everything after someone bypassed the CI
+    - if: *is-direct-push
+      when: on_success
+    # Build everything in scheduled pipelines
+    - if: *is-scheduled-pipeline
+      when: on_success
+    # Allow building everything in fork pipelines, but build nothing unless
+    # manually triggered
     - when: manual
 
+
 .ci-deqp-artifacts:
   artifacts:
     name: "${CI_PROJECT_NAME}_${CI_JOB_NAME}"
@@ -206,31 +211,7 @@ stages:
       - _build/meson-logs/strace
 
 
-.container-rules:
-  rules:
-    - !reference [.no_scheduled_pipelines-rules, rules]
-    - !reference [.never-post-merge-rules, rules]
-    # Run pipeline by default in the main project if any CI pipeline
-    # configuration files were changed, to ensure docker images are up to date
-    - if: *is-post-merge
-      changes:
-      - drivers/gpu/drm/ci/**/*
-      when: on_success
-    # Run pipeline by default if it was triggered by Marge Bot, is for a
-    # merge request, and any files affecting the pipeline were changed
-    - if: *is-pre-merge-for-marge
-      when: on_success
-    # Run pipeline by default in the main project if it was not triggered by
-    # Marge Bot, and any files affecting the pipeline were changed
-    - if: *is-post-merge-not-for-marge
-      when: on_success
-    # Allow triggering jobs manually in other cases
-    - when: manual
-
-
-
 # Git archive
-
 make git archive:
   extends:
     - .fdo.ci-fairy
@@ -313,6 +294,7 @@ mr-label-maker-test:
     - pip install git+https://gitlab.freedesktop.org/freedesktop/mr-label-maker
     - mr-label-maker --dry-run --mr $CI_MERGE_REQUEST_IID
 
+
 # Jobs that need to pass before spending hardware resources on further testing
 .required-for-hardware-jobs:
   needs:
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index c5c786bf419b..6a1e059858e5 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -1,16 +1,11 @@
-.test-rules:
-  rules:
-    - !reference [.no_scheduled_pipelines-rules, rules]
-    - !reference [.collabora-farm-rules, rules]
-    - !reference [.google-freedreno-farm-rules, rules]
-    - when: on_success
-
 .lava-test:
   extends:
-    - .test-rules
-    - .build-rules
     - .container+build-rules
   timeout: "1h30m"
+  rules:
+    - !reference [.scheduled_pipeline-rules, rules]
+    - !reference [.collabora-farm-rules, rules]
+    - when: on_success
   script:
     # Note: Build dir (and thus install) may be dirty due to GIT_STRATEGY
     - rm -rf install
@@ -74,8 +69,11 @@
   extends:
     - .baremetal-test-arm64
     - .use-debian/baremetal_arm64_test
-    - .test-rules
   timeout: "1h30m"
+  rules:
+    - !reference [.scheduled_pipeline-rules, rules]
+    - !reference [.google-freedreno-farm-rules, rules]
+    - when: on_success
   variables:
     FDO_CI_CONCURRENT: 10
     HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
@@ -444,13 +442,15 @@ panfrost:g12b:
 virtio_gpu:none:
   stage: software-driver
   timeout: "1h30m"
+  rules:
+    - !reference [.scheduled_pipeline-rules, rules]
+    - when: on_success
   variables:
     CROSVM_GALLIUM_DRIVER: llvmpipe
     DRIVER_NAME: virtio_gpu
     GPU_VERSION: none
   extends:
     - .test-gl
-    - .test-rules
   tags:
     - kvm
   script:
@@ -465,12 +465,14 @@ virtio_gpu:none:
 vkms:none:
   stage: software-driver
   timeout: "1h30m"
+  rules:
+    - !reference [.scheduled_pipeline-rules, rules]
+    - when: on_success
   variables:
     DRIVER_NAME: vkms
     GPU_VERSION: none
   extends:
     - .test-gl
-    - .test-rules
   tags:
     - kvm
   script:
-- 
2.43.0

