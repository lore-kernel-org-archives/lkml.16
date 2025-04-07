Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1498322B8D7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013693; cv=none; b=UZoQgXrgwC1fUphx47IsbPuvHFkj8s3NWj+wqnAYRCK7pvKJQOHcY9xPU5Zd0FLDiFydJm7J+cFdT7RkNyxCyz3MHk7CrpqqJHOENhHgOD4nOelT4Tyn2cO6O3aRoUoDeAH9ACYHWUiY+w1dogL7Sgv0mX+nR2NhBJXNtRHwcLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013693; c=relaxed/simple;
	bh=tHLRch/pNbAPUwCypXIU0Msmm9PT7vJclyYGUr0D7F8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sw2RDxlCAuy0ZMhpswl1KqLk/MS2WRGkD77/IeuY6v6JZvN0bl/AxyZezS5rxF367dNC2ph/xSMO4isahxBT0S7iT5ER9zkwv7JJpqoa9qdf7SLxmpMyO+xIL6WwUVd9FsnYZ6BcD6Sa2R4Gz+XNXu0Xt2AUiEgRUpF6B3/TuHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtABukxQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtABukxQ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf257158fso27278885e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744013690; x=1744618490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnVpWku238hbA4Nkq9IkwuoRE17xKzZpiURAgcmw2aY=;
        b=XtABukxQSVSpO62X+IEyHTvD0bL/T3Wl2AlLZmoOb8/NlPQ/+6FVmwSc0dFnj5XSiu
         GSM1eObpOm+QCjNTAlyp6ouLU4eSQK7JC3osQ49+dmEj8Q57oWb98uXJqh3Hc8n0A6wa
         naM1/I8RZPIQ1tYJxqE9yUwLVMjHnRlawoucYsXT4g94jlezMxN0HfmSJFLYWVaIiX3H
         5jZ/KRhrR7l72bC9rxC0VyoKPVaS82a+RxhOLRP9kpg6rnZfahnC2ZX5Xu1Ad+fq/5VI
         tBFaB+MHSM08dDqNvB+7rr8hmQgPvOfB8tAlSPFGcigRbVT88uZvV7gMdgK90COPBJLX
         8Byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013690; x=1744618490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnVpWku238hbA4Nkq9IkwuoRE17xKzZpiURAgcmw2aY=;
        b=e6Ir0el2gAkU6Yte9G0OwMtSQga6svynOvoFR6FvJeBYHsg9678P2m7WOju4cDkqR6
         0fXiGOhXfH9VkKVSZf1TfSfxEtdinpToqNJ3Xy7bJg6CLt5zK18XNTzx36GgH1JdVzYW
         c8tftz/46TNmYhtfjs2sveLoSF6f4CLjNcQ/yPReOjhP3QLkK/5hdBmXEXdW7kQkZcpC
         +tKwqgHu5kzsewqGdUJoGc7GjYNJ53Xowe8oiWVsF38F3Mijx0dUCtxVv0ZrPZvTY8o+
         3TAXxtMlIISHmq2lEZPi6pHTb+guiZktJxTWUPXdvvhF3txCZG0oyqR6G/pvn9J9wRMs
         D9/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHwibc3ZhQrpRUPfb+15bj+spJC9zSW6v+4PYgDakHASAvbXfvkFqM8Y2etHMOEwvZsFn+DKtwfuSflsk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv5JZ25+O/RAikui/YeSrmKxXm7acWTOvTX1YeyntXX6JpNfhH
	sIRByXx6iilrjWfeDF0ahOwqOVi76rlG2FlbWj96h4AEWcVPqTse
X-Gm-Gg: ASbGnct8N7ozEKvJGF/MptpJQcGOPdzssvMNOejkiiwqir7zYFj7nAgJw1X8aXwb5xi
	0MkZuQZ41XitT8VK/zCbZJeImrxlvHz3fx96nJiZ9Gon7GBLXNPt/EAGUd3ipfvA5pilNu7rPJ3
	/A3mD4qESpfsFV8TF+6BdqN24VTiMDpYuEv/S+eMxDSf1J5jvyy8VYeBGTEqM7nGeIQ1dIpqi+n
	dNlAQT048mEmSEpmD/FvDdOzDLm/oAvCzDeGyVw+rKu78JpAzbDI+tvvS2EK8ckDqHAEQ0util/
	5n/gYyohC+J8+K8qFBbxFi3jaFdt2mrjE0f68jSg7P6bhcilKJqzQzA=
X-Google-Smtp-Source: AGHT+IHhKBmlY7br9pm8f5WIAoCtogRB7yIZ1AoNbNEUAWye6mIWcwnEpvMXHGsAgQU+b+HjhSrsiw==
X-Received: by 2002:a05:6000:1847:b0:38d:de45:bf98 with SMTP id ffacd0b85a97d-39cb3575870mr8506590f8f.8.1744013690345;
        Mon, 07 Apr 2025 01:14:50 -0700 (PDT)
Received: from fedora.. ([94.73.34.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:14:49 -0700 (PDT)
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
Subject: [PATCH v4 15/16] drm/vkms: Allow to update the connector status
Date: Mon,  7 Apr 2025 10:14:24 +0200
Message-ID: <20250407081425.6420-16-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407081425.6420-1-jose.exposito89@gmail.com>
References: <20250407081425.6420-1-jose.exposito89@gmail.com>
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
2.48.1

