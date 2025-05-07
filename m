Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA9121A45D
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626098; cv=none; b=BxJspx2ppoJ8FVUb2V9rm3RKVT/EaOHaE3NgVC2UBbAlE0l9AJdTY3bsYpPaA0vu2HdrbIRCnucsGlFTnVjlkEP4AHw7ChWa9MhOG5N3SQAt3hKEwpdqBqQO0oe0oyh3NL8IJOlJH/vZ3WvEmLM/h+uLo9aNOjsIF8UeHlRgB3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626098; c=relaxed/simple;
	bh=mget9A7HVaZW5gwOaONn0lHraNo+Pe3tfA8h7YGoa4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hFlpbAFBEq+rMTyn6r+CMEb8S3GCuFWFKv3MBuMFkiIc3apy3tsnEd/yT2mvCbgka/Jo9xfHORIm/ykacORZplWvpt/qPR2v35DHjpDxEK7noMrjFE/zgvhN+pi1fd11DOMrOM3H1I3wO/VmWKvEx53bRsRupDNmgW/Y6GvbVKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9DM2M5i; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9DM2M5i"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so47554655e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746626095; x=1747230895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWH4UBR5sUqGo9LtpqRAJPm/Evlyrb/fSWQLAWS3kVY=;
        b=V9DM2M5i9NZeZvh22flibgTWvxZ/f0oDnKRQusO0/f7TyINwVFqaoX42yGnUusIv2j
         jaPHizN6lHxzoIjW60RtU6AV2DmE7hkp1MRHWXfeYHyFGKvtE4UUhlUg6UHjFas5jzkj
         T4T4YY+x5AsG8kuvvSt3q2/3U6diz+7sko6l5xrbs9eBDHCBUpkmcKf6iM7HTzOX9k6N
         foISoND0CAymBxjv9OjvHSS+pEKtuJdACGblo5nVTk5dENkR/apRCoIzWvRPdCOQ/nTT
         xiEET3MoArTswT35NNLfImN39BPjAjU7abMla3RggxidzoYtfE7fyz4SMFYQJEv0rU7V
         Qg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746626095; x=1747230895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWH4UBR5sUqGo9LtpqRAJPm/Evlyrb/fSWQLAWS3kVY=;
        b=ugttFejICiliyRcoDdsqBX8KMFLW1AzSwtlV9l1bRjv1UGRIvCwxtnZ1RRvoBCjB2U
         dsHKiNmZevM3I+NwwxEMukX9FwxQzCKdBj4CmQz8cZ0HrpGrcuEFvY2X6LhVwNb/tNDF
         EVJI4d5OFzeIN/dPuCBsS/2pqCZ/TbHuQHVhNmSBUx3R0oD1dNYsXTpRRHlmbbK+ce5e
         9fDSSIodn76LxHJeUO5iVpCpW31f/mYlpzhCjokCL3RtZ9qPr9hMLSUxv/WYAgnw4zEe
         o/KG3BL4pNgBOL1xG1GHsfp2rqIn/VpY4nzj0ugEvt5Ji6k/APypQj2X5XxJGR5TfNng
         Zc1A==
X-Forwarded-Encrypted: i=1; AJvYcCUUjhiT3lPVpgJGV9B8t5OVy//3MHJn+/jc9lUOo+do686AOqEG7H00RgS7gOwyiIUM6DqVK3m6+QNC9vE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYx1SDVlMTuMarHocexPZXZJstfM/kklLfI7wZKBXFZrSJLHSt
	L10PFEU0nwINCiZLJNLXU3BDe50DZPBiyqYU0ZcMTseNNq05csG6
X-Gm-Gg: ASbGncvIf9aXnRi7EpMekKczh9bc+EHBaAVMuqRaN2tc485cCqeeiZkcDNjIDpxSeuy
	HzqZJgec4Eadc8zrbScRNovgIFFM60/U0kv/fdepkxNmNZXtCRs/I2SloS6PRSLx43SzUete26W
	FWFqOXYU5chqhYjq+ug3DgjjtkDw2luEgD69Px4HZJezDPCvQ1wZaFRDfr2/ELHMe0dWwK7eSCx
	To6PO4tiiJRIucGUxDQNARdpCqu40KFBnvgqbgvWQmQjqm1lidjRkq/z1osbU97DBUGbMEW1KvC
	C9zKECZH1qWVtdDrKXSbgIRb19r7qH2WgbnurBZ4+A==
X-Google-Smtp-Source: AGHT+IF80fmLVPbtDN3yjIpualYTNgWYYcwvkaJ7VTuW/EM6ksm+G1Qlmrwr48Na58FQ8fjTwc/qvg==
X-Received: by 2002:a05:600c:5307:b0:43d:585f:ebf5 with SMTP id 5b1f17b1804b1-441d44bc56emr27403975e9.1.1746626094564;
        Wed, 07 May 2025 06:54:54 -0700 (PDT)
Received: from fedora.. ([94.73.35.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:54:53 -0700 (PDT)
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
Subject: [PATCH v5 16/16] drm/vkms: Allow to configure connector status via configfs
Date: Wed,  7 May 2025 15:54:31 +0200
Message-ID: <20250507135431.53907-17-jose.exposito89@gmail.com>
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

When a connector is created, add a `status` file to allow to update the
connector status to:

 - 1 connector_status_connected
 - 2 connector_status_disconnected
 - 3 connector_status_unknown

If the device is enabled, updating the status hot-plug or unplugs the
connector.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst            |  5 +++
 drivers/gpu/drm/vkms/vkms_configfs.c  | 48 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.c |  7 ++++
 drivers/gpu/drm/vkms/vkms_connector.h |  6 ++++
 4 files changed, 66 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index c551241fe873..7c54099b1dc6 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -108,6 +108,11 @@ Last but not least, create one or more connectors::
 
   sudo mkdir /config/vkms/my-vkms/connectors/connector0
 
+Connectors have 1 configurable attribute:
+
+- status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
+  as those exposed by the "status" property of a connector)
+
 To finish the configuration, link the different pipeline items::
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 8e90acbebd6a..07ab794e1052 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -7,6 +7,7 @@
 #include "vkms_drv.h"
 #include "vkms_config.h"
 #include "vkms_configfs.h"
+#include "vkms_connector.h"
 
 /* To avoid registering configfs more than once or unregistering on error */
 static bool is_configfs_registered;
@@ -512,6 +513,52 @@ static const struct config_item_type encoder_group_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static ssize_t connector_status_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_connector *connector;
+	enum drm_connector_status status;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	scoped_guard(mutex, &connector->dev->lock)
+		status = vkms_config_connector_get_status(connector->config);
+
+	return sprintf(page, "%u", status);
+}
+
+static ssize_t connector_status_store(struct config_item *item,
+				      const char *page, size_t count)
+{
+	struct vkms_configfs_connector *connector;
+	enum drm_connector_status status;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	if (kstrtouint(page, 10, &status))
+		return -EINVAL;
+
+	if (status != connector_status_connected &&
+	    status != connector_status_disconnected &&
+	    status != connector_status_unknown)
+		return -EINVAL;
+
+	scoped_guard(mutex, &connector->dev->lock) {
+		vkms_config_connector_set_status(connector->config, status);
+
+		if (connector->dev->enabled)
+			vkms_trigger_connector_hotplug(connector->dev->config->dev);
+	}
+
+	return (ssize_t)count;
+}
+
+CONFIGFS_ATTR(connector_, status);
+
+static struct configfs_attribute *connector_item_attrs[] = {
+	&connector_attr_status,
+	NULL,
+};
+
 static void connector_release(struct config_item *item)
 {
 	struct vkms_configfs_connector *connector;
@@ -531,6 +578,7 @@ static struct configfs_item_operations connector_item_operations = {
 };
 
 static const struct config_item_type connector_item_type = {
+	.ct_attrs	= connector_item_attrs,
 	.ct_item_ops	= &connector_item_operations,
 	.ct_owner	= THIS_MODULE,
 };
diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index 89fa8d9d739b..b0a6b212d3f4 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -87,3 +87,10 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
 
 	return connector;
 }
+
+void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev)
+{
+	struct drm_device *dev = &vkmsdev->drm;
+
+	drm_kms_helper_hotplug_event(dev);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index 90f835f70b3b..35f2adf97e32 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -26,4 +26,10 @@ struct vkms_connector {
  */
 struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev);
 
+/**
+ * struct vkms_device *vkmsdev() - Update the device's connectors status
+ * @vkmsdev: VKMS device to update
+ */
+void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev);
+
 #endif /* _VKMS_CONNECTOR_H_ */
-- 
2.49.0

