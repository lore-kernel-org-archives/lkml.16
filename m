Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CDA22CBF7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013695; cv=none; b=uwfFKKT2iCXvGf4uC0glTdbY6Zvd/wY2hF+KOsC7Z/l8bWl46fiBDiENl8rGPCC78VdInD7VHO2RBu1LDlOmqUM2ZTKtjbE/+dE8poCqx5S/F9zJCKUDfN44WISm40JytJ/8UPW4pNZKj6jAxsxWS4QPzJG+Wx8oPXERCoaN+hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013695; c=relaxed/simple;
	bh=UaHEGZDcjpFQM+/91kkr8nzcxY1detjrCFlN+Zq5nB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TX68tznB/zS2rRwwUIZIPTXrLT4Zv1r+OvQSMRGK3kKqAxQVYz7Jq40xLqhsyznVHu/NVkC6scnpwu5Lcu6FJJBag7m+qbIMjhtGq5wDlbUW1I7PUX5DZBFa1RR17fDWS02gFtgn5y+RNeI/A8oJY9cjkm38KYQmVaGPrMG3IVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STAbgTLl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STAbgTLl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43690d4605dso26303005e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744013692; x=1744618492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xK4w0zRijqvJSQy92+j3ZDq7C+G47BlmHwixThFbhJo=;
        b=STAbgTLlbIIrwW1hWQBewWcHOUo1+MKywO0xfWwoHPboWL9O025HBCdGmsLgakIC5S
         jCyBvsHOw8xb3pkjnh4VhCPVbG9uItdjnWdXLOU8M6B1gzENJxwj7O4e9Doj9la8SndE
         ZLxPMnZfkDoMXJTvJff7kDU9AASdQ+BQXdVEFcmqnAH2QPAtIdk6O7WFZhyLdxkOr73I
         CT7s+7uKkWzEvMYr2zrLgLNG+9X/jeg3NUXbIwykzdAOv8LlJhjJRQS7bNz18QvrU3dg
         2AHEyNi0DFIpVUhVkC+JCytwigvBq8nOaxX1b+oGSKeEDcRCF5bjO5YPRNoH7lFG4tiS
         VE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013692; x=1744618492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xK4w0zRijqvJSQy92+j3ZDq7C+G47BlmHwixThFbhJo=;
        b=UbACEvKha3XcgL7HryNPT9mOA0zXe53yIbvwjjJuAGpYrwJzviJLobdm7shUmFmxqY
         JaELw2B+KGa45Y32UeUihCqinPTGvE2/SUSs5GpRv7Guxaf7vQ709PS9Z6o3Z3wpJgQ2
         oCO93/MYURh3Vgvx9nwEJzuL6tjIbO4Y3Bzr+5Bz7xZ1yTC8nYuYqI3Oc2Ta7RpMD3ef
         NB1fDk4enQm3vHFqSyfMy0bUH/R6tOyr1aok9o7Bw9SmLNMFCbdJaTa4y/AbREXodOz4
         M/0Z+XXoiqSjnl1ebraAQW+8/+fodYFtHjP0Wdkc+RFLbqRz0w+w9j4iRugHbGHSULP8
         R+8g==
X-Forwarded-Encrypted: i=1; AJvYcCXWKPOmk9qVzC6Vjx8b96yA5y814lNi6s9qNf/Sw+SAx62rr3VnoiuNTPuAgoc/ptl+GAdzLCvBAi3E0ic=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDuWTIBQ6js3HBQ7Z/+aP68dKL3jDeRLUsu3bPeJ6FmnT9ZKBS
	mkUPG/h5+9eXLKfyGGBLLIBQIU9RPgTsY4rSg6GRItuuJCQzncYy
X-Gm-Gg: ASbGncsiKSmeNrni8I04oat1OnonJ1aBrXwEtYd6Qdv/dQwQWF2OFVSdBoOpAZ6zxOI
	9s6xmDBhvr6PLtcq3FOmpA0MOV54ZT3E6F/rYp1uDfXjh8+lTDBEU16CTQvWhGRDLpij8s8zltK
	NqJVr9tnyUcIaeB6XlyFuVr6e4DzJmxbbq7W6XF5a+Af2a1sXGHNk1kizitd+FVRMvS/la/S1PG
	bNWVq1BWUfyiBNQ2leZ2Rd1Nzdi7d93H9tp8Z9GcpoBGttrZT0hue4H+QoKuMyUGSDG5BvRo6nh
	QnLYGH6CMq82BOKNNjCEIcnhOmkjDaM2D7o4rOAwl0u0
X-Google-Smtp-Source: AGHT+IGsQmQgOtBj5506Lq6aE02Cl59kHYz8T4g9MsZc1IMQIr6Edi6OTut4/mxeXQ0ztbCMSJbOSQ==
X-Received: by 2002:a05:600c:3111:b0:43c:ef13:7e5e with SMTP id 5b1f17b1804b1-43ecf9c4691mr96175985e9.26.1744013691702;
        Mon, 07 Apr 2025 01:14:51 -0700 (PDT)
Received: from fedora.. ([94.73.34.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:14:50 -0700 (PDT)
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
Subject: [PATCH v4 16/16] drm/vkms: Allow to configure connector status via configfs
Date: Mon,  7 Apr 2025 10:14:25 +0200
Message-ID: <20250407081425.6420-17-jose.exposito89@gmail.com>
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

When a connector is created, add a `status` file to allow to update the
connector status to:

 - 1 connector_status_connected
 - 2 connector_status_disconnected
 - 3 connector_status_unknown

If the device is enabled, updating the status hot-plug or unplugs the
connector.

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
2.48.1

