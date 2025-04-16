Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B2922E004;
	Wed, 16 Apr 2025 06:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744785809; cv=none; b=pwSeH0yRluI4f0uyuYsdtnc5Xwy7iAzrtxvkREAmuUKCyITO0HXLAML9y28llS8QDXoWsQwOENTuJZl+SFis2ohi+aOpTRy502CqO/sDLVCm+NOPF2FmiugL4UnL/WNuHEBsfQWUcVWm/78nw/ccYwbh/0yr/qPtsU1knxIkAYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744785809; c=relaxed/simple;
	bh=3fxTh2/IW45q1FIh85eFha6W/n2T/3ziJzmCR16YX+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YyG6zqcBtrTAJ4tNWkIzPDgRZKDeMV5SMaxRSQwOZFvj0X/pTD/W4S9bwETCqF8KOhnSp8zPwOmgHS0LXCb3b59VxnrfdRkyZGFE0NJEZwiEg3QElJNNvbJiY9ChH5Xkio9w34XrjvSuYISfR1FuLapWuaWH6ToqrJ3NOQnrGtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMTfEoTc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMTfEoTc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1024C4CEE2;
	Wed, 16 Apr 2025 06:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744785808;
	bh=3fxTh2/IW45q1FIh85eFha6W/n2T/3ziJzmCR16YX+c=;
	h=From:To:Cc:Subject:Date:From;
	b=KMTfEoTcPQtmfDXORRmyBAJ4SiLXvcDP3abUGTVrC/4wLWH8aAWlePEBkIKHX3j4E
	 POaEnPNUlKobt7eBUtRos1N+VpHY9luWZE6rKHARZYsZPxT2aq67FLlo9Taf48+qlW
	 DfbzePm0DzvQjvYvXQR5y2AWp3ta0V6zWsYN9ey2FPyRorM/izc+GQ02UcQqsZkJ7d
	 5o6dgT/ifWSm1EmNiZoitaCempRsAxKf/ioiukXcnFIBm6CbEpPZu/+7eKkgNtZcDp
	 sIwsG8oLbkHR/fjoZnjqrjNncGk6YwzwMNNhN9fLlcAlkzPbYbEIRFf2iixguo+uwa
	 0+czBCLXsiTvA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u4wUD-00000002jyH-3Qul;
	Wed, 16 Apr 2025 14:43:05 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Andy Shevchenko" <andriy.shevchenko@intel.com>,
	David Airlie <airlied@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scripts/kernel-doc.py: don't create *.pyc files
Date: Wed, 16 Apr 2025 14:42:57 +0800
Message-ID: <432f17b785d35122753d4b210874d78ee84e1bb5.1744785773.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

As reported by Andy, kernel-doc.py is creating a __pycache__
directory at build time.

Disable creation of __pycache__ for the libraries used by
kernel-doc.py, when excecuted via the build system or via
scripts/find-unused-docs.sh.

Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Closes: https://lore.kernel.org/linux-doc/Z_zYXAJcTD-c3xTe@black.fi.intel.com/
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/gpu/drm/Makefile      | 2 +-
 drivers/gpu/drm/i915/Makefile | 2 +-
 include/drm/Makefile          | 2 +-
 scripts/find-unused-docs.sh   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index ed54a546bbe2..1469d64f8783 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -236,7 +236,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
       cmd_hdrtest = \
 		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
-		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
+		$(KERNELDOC) PYTHONDONTWRITEBYTECODE=1 -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
 		touch $@
 
 $(obj)/%.hdrtest: $(src)/%.h FORCE
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index ed05b131ed3a..bb873f9cc2aa 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -408,7 +408,7 @@ obj-$(CONFIG_DRM_I915_GVT_KVMGT) += kvmgt.o
 #
 # Enable locally for CONFIG_DRM_I915_WERROR=y. See also scripts/Makefile.build
 ifdef CONFIG_DRM_I915_WERROR
-    cmd_checkdoc = $(srctree)/scripts/kernel-doc -none -Werror $<
+    cmd_checkdoc = $(KERNELDOC) PYTHONDONTWRITEBYTECODE=1 -none -Werror $<
 endif
 
 # header test
diff --git a/include/drm/Makefile b/include/drm/Makefile
index a7bd15d2803e..6088ea458f44 100644
--- a/include/drm/Makefile
+++ b/include/drm/Makefile
@@ -11,7 +11,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
       cmd_hdrtest = \
 		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
-		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
+		$(KERNELDOC) PYTHONDONTWRITEBYTECODE=1 -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
 		touch $@
 
 $(obj)/%.hdrtest: $(src)/%.h FORCE
diff --git a/scripts/find-unused-docs.sh b/scripts/find-unused-docs.sh
index ee6a50e33aba..d6d397fbf917 100755
--- a/scripts/find-unused-docs.sh
+++ b/scripts/find-unused-docs.sh
@@ -54,7 +54,7 @@ for file in `find $1 -name '*.c'`; do
 	if [[ ${FILES_INCLUDED[$file]+_} ]]; then
 	continue;
 	fi
-	str=$(scripts/kernel-doc -export "$file" 2>/dev/null)
+	str=$(PYTHONDONTWRITEBYTECODE=1 scripts/kernel-doc -export "$file" 2>/dev/null)
 	if [[ -n "$str" ]]; then
 	echo "$file"
 	fi
-- 
2.49.0

