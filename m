Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC1C17A30F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344715; cv=none; b=qbapmHvsBcDIUWpKAcq8bVFAj7i2KMfSRrXmUxrI2kodTm1h502bfdBvxessn3PV18qOVfWOuOxKKfZONhAq4YUX+suc20ivnIXzIJG/fA7hpJ0Fzt42m2lkaYAsJTKLWpH3D8BwCzxUsy8P/yBEgnuawSlBaJrbc/OOEhpD7iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344715; c=relaxed/simple;
	bh=iWq9f/iFnS0KxMlXLxgcT+1AH8kfkIjtjbz3fyWT6Us=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KKu3q/7Am3qTkUJ7GpdQ6Aiw+A3Ec8oYlLwPRB4K5l8WnVQhfAkAxmDbrWrfTZWO5c67Uw7W4eHe/K+2jgzuHVZ8ABVRxzBoXwgtDvuWBLXSFtRDvFvb7/P+avtQSvtwAqk5+4+qEZeQx9E/VOH8jnddIjsGMJJjJpm6F8fdze8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EM7TdPOK; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EM7TdPOK"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750344711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l3nM082bM78TtBWdFK27NatUNhqNWPO8Kx/xITC8UGs=;
	b=EM7TdPOKpvU+MJQ5gqoIAob74dfFrYeIh7KJnKLuRa1HyJGqLxI7AxuWdpwg1WUqCht6bE
	e32VwPk2JrAyZDIyLKO+UHkSyhlVzSEWZbeK0iXIHgJdaT9qM8eGnmujin2bPtZdHreHEq
	EUnfdEvIQdgjvxGezOf52Xi0PHoxLmk=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] drm: Use strscpy() instead of strscpy_pad()
Date: Thu, 19 Jun 2025 16:51:36 +0200
Message-ID: <20250619145136.174064-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

kzalloc() already zero-initializes the destination buffers, making
strscpy() sufficient for safely copying the names. The additional
NUL-padding performed by strscpy_pad() is unnecessary.

If the destination buffer has a fixed length, strscpy() automatically
determines its size using sizeof() when the argument is omitted. This
makes the explicit size arguments unnecessary.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/gpu/drm/drm_property.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index 596272149a35..47f2891f3f06 100644
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -128,7 +128,7 @@ struct drm_property *drm_property_create(struct drm_device *dev,
 	property->num_values = num_values;
 	INIT_LIST_HEAD(&property->enum_list);
 
-	strscpy_pad(property->name, name, DRM_PROP_NAME_LEN);
+	strscpy(property->name, name);
 
 	list_add_tail(&property->head, &dev->mode_config.property_list);
 
@@ -421,7 +421,7 @@ int drm_property_add_enum(struct drm_property *property,
 	if (!prop_enum)
 		return -ENOMEM;
 
-	strscpy_pad(prop_enum->name, name, DRM_PROP_NAME_LEN);
+	strscpy(prop_enum->name, name);
 	prop_enum->value = value;
 
 	property->values[index] = value;
-- 
2.49.0

