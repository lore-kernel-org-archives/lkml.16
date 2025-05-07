Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5EB2920B9
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626097; cv=none; b=nKPl2pSQFmj8pjTEJYdGfpphY/p4X8OPrBfmsOmQ9kvj0s7FjceVFbet3D1BlHinbymnUbnTfSQXOXbOXRPSCaEKDaxTKbxLJN8sZXCOimoMgpCSLm09+kdb34vLjRdwLORozMJKNuit1gZ/Tqa5Soh44+yoz8ujVkculjr7ecs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626097; c=relaxed/simple;
	bh=MSBogAmC93iuq+s2NndTMsxfeTyPfdqsnwm3RGXnAVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gvq3MPWD5cdSkDplkFn97GzG5tzIDCCaALoxmozlHNBq9VmwITbKLVdUgPOIqGSJGfo+Ez5EEccG241pRRghW0W7ZMdF2tqbDw4KLFsO4Qa+khbGHyE5pilPct5ZWVdwCUr0j29U8ImnCqU2HhXWAtfRWMecDyrrRmIZXeRaXbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngcK+oby; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngcK+oby"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so28917325e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746626093; x=1747230893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzdvmCLce4oUcBREEUqYsUXlRBTvwlUXQiKFXpxsJBU=;
        b=ngcK+oby6gq+LLUdKFoHgJFZLC6Q4MVulEQQeqBowm2WxLo44O6/Vmeun0a/VK16ii
         eyQhuZxkF4A9wXWhqtEUVcGc+YD1x3VT0Ntk+CfHMQWKt4Ivc98FbbDdFBCmZZ1ZnNDi
         Gr9PleuWpo5YFxQycot8wgMd60RFvU8z77zhD/5VIfzfCwoWRkrjhM6kLxUSU+KM/KYo
         ITUVxCCmyszEBvrL1c2avSJMw7D4XiK4WsSoA7lO/nxP9/ZsKM5ONS/8AgtLDuLALico
         D5bo1Ate8bRxtlPYctMYQhiTSweERhwU7BVFHhqNgMGDL0aeLi76ZsqLJX202s3mRCsA
         COeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746626093; x=1747230893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzdvmCLce4oUcBREEUqYsUXlRBTvwlUXQiKFXpxsJBU=;
        b=Q4j1NfFJNUP+o1UiPm8MIs7IR0zAHiEJYLYjdSw9FXxU3/LenjSwmByVxMYGBAi3yG
         LYO49639y7bzp9E5aXcfh/Do4/QL9GPX10PoQENwZuYyqC2VWC2f3uVSIHVwHoITonUO
         hPaGeUuBFUwZCsnc6GQXqsKfFIKOhRZkcYtexeyOX1wka3CA+ww0zK2NKlRgrIHcPkYQ
         c9I35sKjStoQRvuOjSGXZPGUdj3r4PZhScEgWE60n4tWkqfAqpcMrYD1Cx8her104omJ
         yXa/DPb8K0tLQVkyQ0HpF1k+rkxwlKcsZuix+OIkspx/TFChN+RMDlGXjbq/kuVHVnJZ
         /bTA==
X-Forwarded-Encrypted: i=1; AJvYcCVrBlyc6FFFhOvj3V9bDE4ZfRt0arXPeB6YspCSkjF+ti2RF6ImKCfnw9UOy8ihb2alPSh3+BOUUbqI6nY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3P1rWm6qrATRxF7r9MIWC770Kwsn8oflieA5FPi2iDDTCF48S
	2muug3HlKx1nHAAxwb5sOhvcEmwisYOiC416/KtlfBciExKcq3v+
X-Gm-Gg: ASbGncv/FhJBhquMALHjHlgJP2cpGqCS6OvcFQISlEGwFgZWj/T8GhCeQbXCzxgvCqC
	9CZnb9c55Y4esVKoBacp3TF90R71/4oj1xliRKV2H+RDrBE3g+beUGDCpvdSUujWjygyKKujCUJ
	NUhb/C0DAizfwYeL8+l0uMvWGUtiF50D9no+UXQ2krS4bcROzDerf4mvldJVMrJOkmGlFWIo3hi
	j8NvjzqsTPgZJ+ZStcKGk0kM6GeEcr+yeYK7JTKGP2Hx7MXw6Uhi639PHuuP8wPV536NnbUDFEK
	OwCW1jLyzLiKfmK3lNCzWc5QlkI4wqFkrg9WDkJHpVDvTR3SbWQV
X-Google-Smtp-Source: AGHT+IGG3bL+HhaYPGibrPLd/2a7+yGl8/1xq0TZv315cjbB4Waj3XNS0Wp4HEItbsdlFXjWXRoA/g==
X-Received: by 2002:a05:600c:1d08:b0:43d:abd:ad0e with SMTP id 5b1f17b1804b1-441d44c7e3cmr26903405e9.18.1746626093462;
        Wed, 07 May 2025 06:54:53 -0700 (PDT)
Received: from fedora.. ([94.73.35.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:54:52 -0700 (PDT)
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
Subject: [PATCH v5 15/16] drm/vkms: Allow to update the connector status
Date: Wed,  7 May 2025 15:54:30 +0200
Message-ID: <20250507135431.53907-16-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507135431.53907-1-jose.exposito89@gmail.com>
References: <20250507135431.53907-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Implement the drm_connector_funcs.detect() callback to update the
connector status by returning the status stored in the configuration.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_connector.c | 28 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.h |  3 +++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index 48b10cba322a..89fa8d9d739b 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -5,9 +5,37 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 
+#include "vkms_config.h"
 #include "vkms_connector.h"
 
+static enum drm_connector_status vkms_connector_detect(struct drm_connector *connector,
+						       bool force)
+{
+	struct drm_device *dev = connector->dev;
+	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
+	struct vkms_connector *vkms_connector;
+	enum drm_connector_status status;
+	struct vkms_config_connector *connector_cfg;
+
+	vkms_connector = drm_connector_to_vkms_connector(connector);
+
+	/*
+	 * The connector configuration might not exist if its configfs directory
+	 * was deleted. Therefore, use the configuration if present or keep the
+	 * current status if we can not access it anymore.
+	 */
+	status = connector->status;
+
+	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
+		if (connector_cfg->connector == vkms_connector)
+			status = vkms_config_connector_get_status(connector_cfg);
+	}
+
+	return status;
+}
+
 static const struct drm_connector_funcs vkms_connector_funcs = {
+	.detect = vkms_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index c9149c1b7af0..90f835f70b3b 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -5,6 +5,9 @@
 
 #include "vkms_drv.h"
 
+#define drm_connector_to_vkms_connector(target) \
+	container_of(target, struct vkms_connector, base)
+
 /**
  * struct vkms_connector - VKMS custom type wrapping around the DRM connector
  *
-- 
2.49.0

