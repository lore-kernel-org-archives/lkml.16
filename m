Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8531A01C6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 13:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748872341; cv=none; b=a3bRy5Yk1asAOpsPxpEMJrQNJ0/bqcsXByp7SkNiaU8D8IuU/Bbxbzf0jgYqOiaq9mn2/yq6xPwzHwCwy4AMidUdbcqNWIve7EQQgSGSc5PKaJIB27YP1HVtbWZ8XIN0oc3xRAJkLznSEurzpNi4YDvkW+nz/xVBc9M7rHIQN3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748872341; c=relaxed/simple;
	bh=L+m/igXlK4ID594l0yNTHEFJR1ds//pLQu7kOfxfW2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BHXO8SF9O/ZmA7d4GCkucFrKwqe+C/PauRJ9sedLAMrA1xmNRWwFfGf3Nlxre3FTce8J1veLKhB+Mfe0duRZPVw1R0xUP6Epk0SGj1shqa35jft/FYAIVeBH8F01PhBVyT/edwBhmrycgijz0wHQygQ8r7eV11d1HLxbs/SkaGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=EIXbOIjG; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="EIXbOIjG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=WydCDlKnGQA2FYSf6N3259lRM2izOqqWzsrL/A03+NY=; b=EIXbOIjGyDqvxRXo
	h41Q2xX7ROAGoVo9kjNT24OCB6gBJBxxK26dY9OzcJx5qGq1+/Y7ed6EwEp/3j88ZLCcTvh/BXHxw
	tCx6X3GaI24MebsBrNRpbamPkrD2ohc2i4OwuqOuQ3hS823jaCMvgVNc1+V0UGlsUjMj8nVANdhHX
	VWgPl/enUFWzruc1qBj8RW5SMACMOYsnVnEXRpXmbDN0wuDFlErgiJ/L13VceTpcHAM6nhjJUhhto
	t/5LhKXXq/1uU2S0f8fDO2LxU0/QA2O8L471S3kJoLEulBzqPp0JrmbTHGAGQXbo54U0LqkFMGX0k
	GXGRQkmplNUtG01UdQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uM5aA-007CLX-31;
	Mon, 02 Jun 2025 13:52:06 +0000
From: linux@treblig.org
To: dmitry.baryshkov@oss.qualcomm.com,
	lumag@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 2/3] drm/sysfs: Remove unused drm_class_device_(un)register
Date: Mon,  2 Jun 2025 14:52:00 +0100
Message-ID: <20250602135201.207466-3-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602135201.207466-1-linux@treblig.org>
References: <20250602135201.207466-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

drm_class_device_register() and drm_class_device_unregister() have been
unused since
commit ed89fff97382 ("drm/ttm: drop sysfs directory")

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_sysfs.c | 32 --------------------------------
 include/drm/drm_sysfs.h     |  4 ----
 2 files changed, 36 deletions(-)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 60c1f26edb6f..db92ee73cca7 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -548,35 +548,3 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
 	put_device(kdev);
 	return ERR_PTR(r);
 }
-
-/**
- * drm_class_device_register - register new device with the DRM sysfs class
- * @dev: device to register
- *
- * Registers a new &struct device within the DRM sysfs class. Essentially only
- * used by ttm to have a place for its global settings. Drivers should never use
- * this.
- */
-int drm_class_device_register(struct device *dev)
-{
-	if (!drm_class || IS_ERR(drm_class))
-		return -ENOENT;
-
-	dev->class = drm_class;
-	return device_register(dev);
-}
-EXPORT_SYMBOL_GPL(drm_class_device_register);
-
-/**
- * drm_class_device_unregister - unregister device with the DRM sysfs class
- * @dev: device to unregister
- *
- * Unregisters a &struct device from the DRM sysfs class. Essentially only used
- * by ttm to have a place for its global settings. Drivers should never use
- * this.
- */
-void drm_class_device_unregister(struct device *dev)
-{
-	return device_unregister(dev);
-}
-EXPORT_SYMBOL_GPL(drm_class_device_unregister);
diff --git a/include/drm/drm_sysfs.h b/include/drm/drm_sysfs.h
index 96a5d858404b..7695873a9456 100644
--- a/include/drm/drm_sysfs.h
+++ b/include/drm/drm_sysfs.h
@@ -3,13 +3,9 @@
 #define _DRM_SYSFS_H_
 
 struct drm_device;
-struct device;
 struct drm_connector;
 struct drm_property;
 
-int drm_class_device_register(struct device *dev);
-void drm_class_device_unregister(struct device *dev);
-
 void drm_sysfs_hotplug_event(struct drm_device *dev);
 void drm_sysfs_connector_hotplug_event(struct drm_connector *connector);
 void drm_sysfs_connector_property_event(struct drm_connector *connector,
-- 
2.49.0

