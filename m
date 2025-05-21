Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CF1186294
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 23:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747869554; cv=none; b=r1u5ILHVq9qAZMA2+7o5P6VzLyF4J/cv/6DjaixEjjiMaE1G46TToiAeuNdR/wbdXvDOEj85vbJdcW6juss9t0FAXC4XkYvwsusmt23lyiJ7nJJl5IMKOgGLUvYlwMKNxd7hilE9k9Up1XVJpcEpVG4AGKbFJfteyVb1PMYiqKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747869554; c=relaxed/simple;
	bh=iWq9f/iFnS0KxMlXLxgcT+1AH8kfkIjtjbz3fyWT6Us=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=axwEpbe5s9aMNJ3ZYrXJSpHNF9mYT4uFzmrxdZ53YD8PLImq4KsdxzSxA2MBx0DB8V9gd15SgipcpxpVvh+Ga8nckcNvaV8g/50oNvFEw8fbHM6zMNxKFSI5mUNRJqAYcDZCd5RuWSZXzrUqRSdLzdfFDFd952E9m0ckRsmU8fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SLQPXRM4; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SLQPXRM4"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747869548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l3nM082bM78TtBWdFK27NatUNhqNWPO8Kx/xITC8UGs=;
	b=SLQPXRM4c2ybnviDAzkg3dcZX/UufqeoocZCLJ9yfGe3WM/k5apJrn8p3DiKZAd7Pp1vGV
	neWg4i35MAnuqBiftk9UoRWk1KwXUEUJk5n0xfJNQ+QuNdhM8xuKus72eoweVcWtsbhGYm
	ho3n+P/xsrJh529idIISqWdnFPcsV9w=
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
Date: Thu, 22 May 2025 01:18:40 +0200
Message-ID: <20250521231841.8088-1-thorsten.blum@linux.dev>
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

