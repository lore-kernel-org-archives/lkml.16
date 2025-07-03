Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5815B2F272F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 18:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751567690; cv=none; b=m3gIh2Ys6WHSxlrooZOHpsgDqUyCXpPPhXZW1GsxV7OTndF4Sy8QM6tTdjadAc+UdQ/AyrnBQ4Hv9nwzHsrK03BI3+ui06UZbeQYa7iz1ZsQnhhCj32TSfrei5t6CwztUEJ8iTloZF5h4VUi68+SyJsqgl5CA3DOlmVmFbscb+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751567690; c=relaxed/simple;
	bh=bDZvxl9Xe6x2DBmna5WFdeUtvHa3VGAXRUVqmCbgMh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sooD2/BwQ7rJqCedmK0R1n0WbQ3eXDdc1FDWPkBFuwxqy6uiSEC62/p/u1b9qLqW5nxfeBQSXV9y78MhMbe5zWFbKormTJ3YbO1jVvQ26hUudYs+sBnf8EOS3mimU7hFzbQDahGosbV/68seF1LUaLSVJhkemgKnnwVEUA85eLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBXB5E/A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBXB5E/A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB042C4CEF1;
	Thu,  3 Jul 2025 18:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751567690;
	bh=bDZvxl9Xe6x2DBmna5WFdeUtvHa3VGAXRUVqmCbgMh8=;
	h=From:To:Cc:Subject:Date:From;
	b=KBXB5E/AlNPTHFI2uVIqAIZ8xtl2jEMJdNKUt9x7wU7xvyx0D1zD3NeyNdFdEPeTQ
	 kE2NPm5/5nLIunr3a/7cQx9O7KffTVL5AZoWhU5JdBtjfDq3msfwOoU86NQnDQLJ2P
	 ZZ1GctqR44x9iPkvi8vb80i9K2tI12YHfNm3iwWdFjPu7DK9luuL7WcRHugK5sI7UK
	 5ptEkiTYLtBT8C4ubbn6eMClY+46cnDTo37AuecM1uhvBtqVvOi/zulncHRaqWIupB
	 hMdjWJ0zZgA1cGb+Eg24PpjPh5p39MjvKWAFhWpdb9khGDwfAUmWUWwohzW3lKLL8z
	 NexAskl4ARGMA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/simpledrm: Use of_reserved_mem_region_to_resource() for "memory-region"
Date: Thu,  3 Jul 2025 13:34:47 -0500
Message-ID: <20250703183447.2073902-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the newly added of_reserved_mem_region_to_resource() function to
handle "memory-region" properties.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/gpu/drm/sysfb/simpledrm.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index a1c3119330de..c8856e6645e2 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -4,7 +4,7 @@
 #include <linux/clk.h>
 #include <linux/of_clk.h>
 #include <linux/minmax.h>
-#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
@@ -180,22 +180,17 @@ simplefb_get_format_of(struct drm_device *dev, struct device_node *of_node)
 static struct resource *
 simplefb_get_memory_of(struct drm_device *dev, struct device_node *of_node)
 {
-	struct device_node *np;
-	struct resource *res;
+	struct resource r, *res;
 	int err;
 
-	np = of_parse_phandle(of_node, "memory-region", 0);
-	if (!np)
+	err = of_reserved_mem_region_to_resource(of_node, 0, &r);
+	if (err)
 		return NULL;
 
-	res = devm_kzalloc(dev->dev, sizeof(*res), GFP_KERNEL);
+	res = devm_kmemdup(dev->dev, &r, sizeof(r), GFP_KERNEL);
 	if (!res)
 		return ERR_PTR(-ENOMEM);
 
-	err = of_address_to_resource(np, 0, res);
-	if (err)
-		return ERR_PTR(err);
-
 	if (of_property_present(of_node, "reg"))
 		drm_warn(dev, "preferring \"memory-region\" over \"reg\" property\n");
 
-- 
2.47.2

