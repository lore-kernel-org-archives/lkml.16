Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA820253350
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739287752; cv=none; b=SLMPO8iDTdN5J9wE0YAY/EsQiByHXeNLoqIGuT9NZRb94yoIhZv700TwPz4voHIEveXhCPqh/+5msBE66LO7/iyWXJNGu1262kQABhO8RauRMRpmBxLBmqTTnw1oK5lDkkjHec8EnNAFMGgr4QSZMNAdHRi3yBUN9SKDSAtZGDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739287752; c=relaxed/simple;
	bh=9ImZhNZMfj/n/lXvGitqWNX++l9PGN6TFqRxw2UCdpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QiYI4nUeHYTir5udCd0JYozatUWWpaav+FCuAh/K68fOjyof5UojTxMUQbYebJ3JLyg1ILPOcslLpCYacu9rUuniJxzpHlA/v6QC01hTZWUf8/WP2AVPCyGiiTEgneqGLBHCz9pGwtDGxrQmNUcK4PTRkg/EW6za9Vxeh+lv3oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=j6wLSaG2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="j6wLSaG2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739287748;
	bh=9ImZhNZMfj/n/lXvGitqWNX++l9PGN6TFqRxw2UCdpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j6wLSaG2EGmIPnktg7E1dS+Li0krKcy/H13jZbbuUN3pjPc/LS4cNUCJSLBxvYkRS
	 fbIRuJVM6TKu24Fvq8wjC1vrph76Vlg2hce8rPf4nqzhXvz+iI2t2ni+PU1MWXDhSG
	 QHEyDbGYcbV63xKTLwLgXw0M4ouh9cN1sOmWMzcQO6phYoWAqp8xcm9UPdruPVSz6i
	 EU+yOlH79AmKI8ZwFyWekGAsRhnOa7jkCxHb8Us4CT2QP1bkK7w78oCP4d0QSuxDuO
	 3BqlTILGZxQbCvlGKSVzIclydUkICdA1DwnhtM7VWYajzn66qZFzibRNLd4BSfQS3S
	 rZ4wg6tZUVgbg==
Received: from localhost.localdomain (unknown [171.76.80.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4593117E0CA2;
	Tue, 11 Feb 2025 16:29:03 +0100 (CET)
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
	jani.nikula@linux.intel.com,
	dmitry.baryshkov@linaro.org,
	mripard@kernel.org,
	boqun.feng@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] drm/ci: enable lockdep detection
Date: Tue, 11 Feb 2025 20:58:06 +0530
Message-ID: <20250211152812.54018-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250211152812.54018-1-vignesh.raman@collabora.com>
References: <20250211152812.54018-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have enabled PROVE_LOCKING (which enables LOCKDEP) in drm-ci.
This will output warnings when kernel locking errors are encountered
and will continue executing tests. To detect if lockdep has been
triggered, check the debug_locks value in /proc/lockdep_stats after
the tests have run. When debug_locks is 0, it indicates that lockdep
has detected issues and turned itself off. Check this value, and if
lockdep is detected, exit with an error and configure it as a warning
in GitLab CI.

GitLab CI ignores exit codes other than 1 by default. Pass the correct
exit code with variable FF_USE_NEW_BASH_EVAL_STRATEGY set to true or
exit on failure.

Also update the documentation.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Lockdep failures are reported as pipeline warnings,
    and the documentation is updated.

---
 Documentation/gpu/automated_testing.rst |  4 ++++
 drivers/gpu/drm/ci/igt_runner.sh        | 11 +++++++++++
 drivers/gpu/drm/ci/test.yml             | 19 ++++++++++++++++---
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
index 6d7c6086034d..62aa3ede02a5 100644
--- a/Documentation/gpu/automated_testing.rst
+++ b/Documentation/gpu/automated_testing.rst
@@ -115,6 +115,10 @@ created (eg. https://gitlab.freedesktop.org/janedoe/linux/-/pipelines)
 5. The various jobs will be run and when the pipeline is finished, all jobs
 should be green unless a regression has been found.
 
+6. Warnings in the pipeline indicate that lockdep
+(see Documentation/locking/lockdep-design.rst) issues have been detected
+during the tests.
+
 
 How to update test expectations
 ===============================
diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index 68b042e43b7f..2a0599f12c58 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -85,5 +85,16 @@ deqp-runner junit \
    --limit 50 \
    --template "See $ARTIFACTS_BASE_URL/results/{{testcase}}.xml"
 
+# Check if /proc/lockdep_stats exists
+if [ -f /proc/lockdep_stats ]; then
+    # If debug_locks is 0, it indicates lockdep is detected and it turns itself off.
+    debug_locks=$(grep 'debug_locks:' /proc/lockdep_stats | awk '{print $2}')
+    if [ "$debug_locks" -eq 0 ] && [ "$ret" -eq 0 ]; then
+        echo "Warning: LOCKDEP issue detected. Please check dmesg logs for more information."
+        cat /proc/lockdep_stats
+        ret=101
+    fi
+fi
+
 cd $oldpath
 exit $ret
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 0eab020a33b9..3af735dbf6bd 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -1,6 +1,8 @@
 .lava-test:
   extends:
     - .container+build-rules
+  variables:
+    FF_USE_NEW_BASH_EVAL_STRATEGY: 'true'
   timeout: "1h30m"
   rules:
     - !reference [.scheduled_pipeline-rules, rules]
@@ -13,6 +15,9 @@
     - mv -n install/* artifacts/.
     # Override it with our lava-submit.sh script
     - ./artifacts/lava-submit.sh
+  allow_failure:
+    exit_codes:
+      - 101
 
 .lava-igt:arm32:
   extends:
@@ -88,9 +93,14 @@
     - igt:arm64
   tags:
     - $RUNNER_TAG
+  allow_failure:
+    exit_codes:
+      - 101
 
 .software-driver:
   stage: software-driver
+  variables:
+    FF_USE_NEW_BASH_EVAL_STRATEGY: 'true'
   timeout: "1h30m"
   rules:
     - !reference [.scheduled_pipeline-rules, rules]
@@ -108,6 +118,9 @@
     - debian/x86_64_test-gl
     - testing:x86_64
     - igt:x86_64
+  allow_failure:
+    exit_codes:
+      - 101
 
 .msm-sc7180:
   extends:
@@ -153,7 +166,7 @@ msm:apq8016:
     BM_KERNEL_EXTRA_ARGS: clk_ignore_unused
     RUNNER_TAG: google-freedreno-db410c
   script:
-    - ./install/bare-metal/fastboot.sh
+    - ./install/bare-metal/fastboot.sh || exit $?
 
 msm:apq8096:
   extends:
@@ -167,7 +180,7 @@ msm:apq8096:
     GPU_VERSION: apq8096
     RUNNER_TAG: google-freedreno-db820c
   script:
-    - ./install/bare-metal/fastboot.sh
+    - ./install/bare-metal/fastboot.sh || exit $?
 
 msm:sdm845:
   extends:
@@ -181,7 +194,7 @@ msm:sdm845:
     GPU_VERSION: sdm845
     RUNNER_TAG: google-freedreno-cheza
   script:
-    - ./install/bare-metal/cros-servo.sh
+    - ./install/bare-metal/cros-servo.sh || exit $?
 
 msm:sm8350-hdk:
   extends:
-- 
2.43.0

