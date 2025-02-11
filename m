Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14A11FCFDF
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272171; cv=none; b=OVcLq/yzfUMkJhFL9dHpYHQZELXdvtUwE6SeugF7LvKR2h8ydHHnPIxwj5HGMCLh0kRKVmjnOWhUN6n+7Ke9YPkMFBP0i4JFWlj/WzDQceKm4emJEAT+1DFpylq782hNoKFE1fYZLJzP+oIjvGAHr28ZgVY42xo4siONkTfZoqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272171; c=relaxed/simple;
	bh=ibI6Tffdl3D8vvHvriJzc7ymXYpxEJLtdrm7KyUcsic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MoED6C30HD+5js7u/qHBuUuWjPskqpqTYwzfRSR7j7zk1HSioa7ccqeVmNUQ8GhPqSrc7aCGw2mSgV8UBihuLx5I9qLpCvX+VhaCKH/DrN9iW7r732NTCnRGH/lc4DcYB5wQ/bVAhBkqJ3mx3oeAFiN7tPps9heHqMGgN55W5gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDKRZsfA; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDKRZsfA"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38dd935a267so2072595f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739272168; x=1739876968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ht9ZYJCKi3pSkXQH9HmuvB26RHJWpzU2MzuZ6pZw6lg=;
        b=SDKRZsfABUus4u+rWbOCzAA0CSCLUpN4GYf75sG9flafccjL3v3Q6UvtyiuqudM1ek
         DE29DimIVEo1m+ni5yqe62+MMAZBLv1N08C20SiHJs+as1cSXB+5MbtsE/fIgyu8+aEq
         Z2fkWCSm3h7jfu2JvmjaaMuFkJXCYt70JmnX4tK9XhuwxfbnY6ajHJOQw21OJwRy/y7U
         xdAtO5q5C+tr+TuU2L3VGPgjTfmVWZGiFhUQLKNKvCencSOHX7glOoPd7G0A81SJiqvu
         uuSPVWtQuFiRrBEK07rqzO5c8sOf/XlBZxmWhGGaePB6E4uR+nj3y0Ax9m8WYg0nzrh+
         kuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739272168; x=1739876968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ht9ZYJCKi3pSkXQH9HmuvB26RHJWpzU2MzuZ6pZw6lg=;
        b=C4B1n4YCqIt/ZEqtaHzCNxKhgyREkiuAxbBZmcobux2Yfq/ilripgqIutrnnuGDou7
         1tKPimaRCFGuY7tMamn0QxP3RhpeBsyEReJhFAl7B/LNTvuZ4qkRyX+gtzBub4V1mGQE
         jezAg0xm9Cl2GeeTZmSJhF/36oFa3d3M8t0QpHDv/pVYadTOl75W7s84jMErAbPrclbk
         6rdS5M6ufWWnCuV2fW1kH10MLZrkAEFjyidDoliBQDZxKeC/98cAgBs0dbIdkiH2hFyq
         PQ/h2UsG/iuXMSDGgx46dgwcZhQQ1+ILMfiJ/Vihsb7GcewkW7Nr40zFOtFs4PJDAxIs
         xj3g==
X-Forwarded-Encrypted: i=1; AJvYcCUIDfovwlknpFhepYILiUffY81KCVuaRsxI5EkWJo57RyWkEhj7DHu2VbGY/tFsOiVerXlYykrMmlD/PCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFeBKXnJ9cjXzLO8we5GuOw5Wh38lFgr1gg28IoYw8HXUNeiex
	hIgGat1xWk1UsstTocdlJU+XFeYtLGub8yb3vZfPryPMsL3hbWtr
X-Gm-Gg: ASbGncuYTzcztkpGqL22uX1bR9P7jnSzc0vFy7G0UXMqGEVvciPSuGERPH1he8GUqvQ
	YoOuXQskvvAVzGNt/hL+++qP5mnfd2nkWk7d/UJtSCavByEm1Xnjov3hQTf5Wo8ov2uOqbwNrDz
	9HWEFzdvUthtrZX/p0aoBslXMmJ3L/h1ZxxYfh37VD8Qt3w4CoN7f0sEQs4/QJuoM058wyNw7nM
	S7tzFulBu1S6q40S7af5hnWzI+RzU8J0JNZAQ19ZMsBauKTQHzgGsn2UahjXzcUO92VjqWfeBWF
	U4ACwPa1ISkvmF0R
X-Google-Smtp-Source: AGHT+IE3r+36gyMVrHDbD9UHJvKxqbwN9H602g5n7dACf3knhXILuBi9Jj4prEWWCMO9MZ7h+Gndlw==
X-Received: by 2002:a05:6000:186f:b0:38d:e250:d962 with SMTP id ffacd0b85a97d-38de250db12mr4478466f8f.30.1739272167690;
        Tue, 11 Feb 2025 03:09:27 -0800 (PST)
Received: from fedora.. ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 03:09:27 -0800 (PST)
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
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 08/15] drm/vkms: Add a validation function for VKMS configuration
Date: Tue, 11 Feb 2025 12:09:05 +0100
Message-ID: <20250211110912.15409-9-jose.exposito89@gmail.com>
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

As the configuration will be used by userspace, add a validator to avoid
creating a broken DRM device.

For the moment, the function always returns true, but rules will be
added in future patches.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c |  2 ++
 drivers/gpu/drm/vkms/vkms_config.c            |  5 +++++
 drivers/gpu/drm/vkms/vkms_config.h            | 10 ++++++++++
 drivers/gpu/drm/vkms/vkms_drv.h               |  2 +-
 drivers/gpu/drm/vkms/vkms_output.c            |  3 +++
 5 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 92798590051b..6e07139d261c 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -54,6 +54,8 @@ static void vkms_config_test_default_config(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, config->writeback, params->enable_writeback);
 	KUNIT_EXPECT_EQ(test, config->overlay, params->enable_overlay);
 
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
 	vkms_config_destroy(config);
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 11b0e539920b..67f71d29596e 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -47,6 +47,11 @@ void vkms_config_destroy(struct vkms_config *config)
 	kfree(config);
 }
 
+bool vkms_config_is_valid(struct vkms_config *config)
+{
+	return true;
+}
+
 static int vkms_config_show(struct seq_file *m, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index fcaa909fb2e0..0376dceaf6be 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -67,6 +67,16 @@ vkms_config_get_device_name(struct vkms_config *config)
 	return config->dev_name;
 }
 
+/**
+ * vkms_config_is_valid() - Validate a configuration
+ * @config: Configuration to validate
+ *
+ * Returns:
+ * Whether the configuration is valid or not.
+ * For example, a configuration without primary planes is not valid.
+ */
+bool vkms_config_is_valid(struct vkms_config *config);
+
 /**
  * vkms_config_register_debugfs() - Register a debugfs file to show the device's
  * configuration
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index a74a7fc3a056..95afc39ce985 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -204,7 +204,7 @@ struct vkms_config;
 struct vkms_device {
 	struct drm_device drm;
 	struct platform_device *platform;
-	const struct vkms_config *config;
+	struct vkms_config *config;
 };
 
 /*
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 068a7f87ecec..414cc933af41 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -16,6 +16,9 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	int writeback;
 	unsigned int n;
 
+	if (!vkms_config_is_valid(vkmsdev->config))
+		return -EINVAL;
+
 	/*
 	 * Initialize used plane. One primary plane is required to perform the composition.
 	 *
-- 
2.48.1

