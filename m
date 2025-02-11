Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DE41FA164
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272165; cv=none; b=Sfzmiapy/S3W6gdRIv1eOU7hwsMvDwi3pNx++oJa06V32wQl/ijU3uwcs2kakCx4G1bqB2NstkrfTCFFFvNPU0zuCGwm7vb03ZVGl3cABGPr6LdcZE2pzxnzAV0Bb0yOugWQ8l/sKPNzbwJMDLaqvKpmK6StKe55jiD+lPf50Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272165; c=relaxed/simple;
	bh=1cgEehn7yaWYfdZlUoyVzhMQP1yObaWyvnl9hlUMx3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CoY/fsAQLtEVVgPIca1FypVOUs845paOMbaq2gOKjloqz3TrGW5CpZTj0jJEKmIP/wUcTLGsY9UPTJD6cAPiKTAqGW+VdSrJUXnbbgao78BDvzpaxzBBXrV/Bu1CRhKHDYkqdt3gfTl8H/YuXJpavD1fGsu/iyh4wBD18eIpSWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGUul6jj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGUul6jj"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43618283dedso54115055e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739272162; x=1739876962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0Gp3OVIpEw4+ISZmLwuTXl1/B9vTRIzRehit5QWGf8=;
        b=nGUul6jjD9/Br3D7USn3ZbPDar9oZVe55Pm3cTrl/3ANB2ejAHpeEAg/jUGPeYIFyU
         SoM1uBMovWNnlfwmTll8LMVhfe8G8Qh7zVEPNHuIoHFc6jGjaFBh0c8m1FM2rWg2ZtvH
         OVCj9G3csnxl5GRKOvDAA1B/eZ9g85kZMFlbLngs75ktsYj/qZpfgdKH1G+YxM0v4ov4
         Q2lSAoD0nLjzjpzg62Vx/3azPo2SJXQ7I+d8yKS8/vfE2K5/YrLjbjw8PBmTxIHGmK1L
         fM2R42tgtIOdJYmRfhdMcrUKK7GjkMa2WhBO6p1aCSg3oimehubXju62wY4GQynBDJO9
         GcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739272162; x=1739876962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W0Gp3OVIpEw4+ISZmLwuTXl1/B9vTRIzRehit5QWGf8=;
        b=j2GXHOQ/KRO2JS6kHfhagpkYFVwxtBLNMC//MZDAUgIJc8g/2JZ4+YIEQi1LLJ5agA
         qZ8N6Q3TlyHFuyMWx7zqJ3akOjd2kkzdb1CLQ8qwZH5EQ//F+Guhbg5vPtAbyFW+xgVr
         LQszCVi551FxHZ0riG4BC72ViJ9KAzgVDh0i86uvMfdtBPSDyIP4+BFYOgh6wCMGAee9
         0KVFBk+t3OH61HtGdP5jnsRwktN/SIlb+RvRWdt8/+7P9kqPgfF0NTYb4Tj25geOclrn
         MeCH7yYXPCtBChgitqwjoamtSzL/z+01Os8mzHbu860h1tEjw9SqcRhL9z/WYQd8Z0uq
         yQkw==
X-Forwarded-Encrypted: i=1; AJvYcCXuc6+x6YDXLsdaHbvmhv8FaL0IBktm7mAaU9V0ON7DUVFJmDmBnRTWcp5gNNgsVKfCQtTKir7qf3YQsao=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqcEEJvkWXCaOG6dO5tP8LKJSqe0RvrNosCGv4v4QtxJKuCGBE
	Ge4Yo0PSMszxWxus5wB8Vj8rlmXHjHX4tCDNnDY21RpbXasTY+C/
X-Gm-Gg: ASbGncs5h5SdS0HJkm3z7hP/fJAZsa4afEm5x3TUpsEG+bCdXdp36dzyWS7xuvK4WdN
	C0BqVFF0Q5XjQnF8x3pLN4VT2mpCRIiqdPb4fORj5L5syIuzajn4B8FRLjabbTSMu18qNnS3hyU
	6uMiNbTQwp/u6wxOAGgB3yiKMXq4R1p2nvy645sp4WSoMCvjmuP4nlgBr4kmaG3tf74lL6EJ+n9
	n6uLRqvaRYT78BJm07ssx3+Vbp0ddE1V12Ba8/VqofwZztfUgTqH2mSj3FCQpy7unefYLq4zxaV
	9RDgwagEhy15NmfR
X-Google-Smtp-Source: AGHT+IHxO8sxD6ByWF8Vz/3btBqccYzxj5h/r13NKofQMWlSJ2LWLuz7YcIp8j0DEqyrs5/QM0e0gg==
X-Received: by 2002:a05:6000:1f89:b0:38c:5c9a:eaca with SMTP id ffacd0b85a97d-38dc8d9b8ffmr14516579f8f.3.1739272161939;
        Tue, 11 Feb 2025 03:09:21 -0800 (PST)
Received: from fedora.. ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 03:09:21 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com,
	simona@ffwll.ch,
	melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
	Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH v2 04/15] drm/vkms: Add KUnit test scaffolding
Date: Tue, 11 Feb 2025 12:09:01 +0100
Message-ID: <20250211110912.15409-5-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211110912.15409-1-jose.exposito89@gmail.com>
References: <20250211110912.15409-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the required boilerplate to start creating KUnit test.

To run the tests:

    $ ./tools/testing/kunit/kunit.py run \
      --kunitconfig=drivers/gpu/drm/vkms/tests

Co-developed-by: Arthur Grillo <arthurgrillo@riseup.net>
Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/Kconfig                  | 15 +++++++++++++++
 drivers/gpu/drm/vkms/Makefile                 |  1 +
 drivers/gpu/drm/vkms/tests/.kunitconfig       |  4 ++++
 drivers/gpu/drm/vkms/tests/Makefile           |  3 +++
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 19 +++++++++++++++++++
 5 files changed, 42 insertions(+)
 create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_config_test.c

diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
index 9def079f685b..d4665e913de7 100644
--- a/drivers/gpu/drm/vkms/Kconfig
+++ b/drivers/gpu/drm/vkms/Kconfig
@@ -14,3 +14,18 @@ config DRM_VKMS
 	  a VKMS.
 
 	  If M is selected the module will be called vkms.
+
+config DRM_VKMS_KUNIT_TESTS
+	tristate "KUnit tests for VKMS." if !KUNIT_ALL_TESTS
+	depends on DRM_VKMS && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds unit tests for VKMS. This option is not useful for
+	  distributions or general kernels, but only for kernel
+	  developers working on VKMS.
+
+	  For more information on KUnit and unit tests in general,
+	  please refer to the KUnit documentation in
+	  Documentation/dev-tools/kunit/.
+
+	  If in doubt, say "N".
diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 6b0615c424f2..45ef4b89379e 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -10,3 +10,4 @@ vkms-y := \
 	vkms_connector.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
+obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += tests/
diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vkms/tests/.kunitconfig
new file mode 100644
index 000000000000..70e378228cbd
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
@@ -0,0 +1,4 @@
+CONFIG_KUNIT=y
+CONFIG_DRM=y
+CONFIG_DRM_VKMS=y
+CONFIG_DRM_VKMS_KUNIT_TESTS=y
diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
new file mode 100644
index 000000000000..b78371d08aa9
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += vkms_config_test.o
diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
new file mode 100644
index 000000000000..1177e62e19cb
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <kunit/test.h>
+
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
+
+static struct kunit_case vkms_config_test_cases[] = {
+	{}
+};
+
+static struct kunit_suite vkms_config_test_suite = {
+	.name = "vkms-config",
+	.test_cases = vkms_config_test_cases,
+};
+
+kunit_test_suite(vkms_config_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Kunit test for vkms config utility");
-- 
2.48.1

