Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD891B3940
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744034541; cv=none; b=WdK4oDQ0bGmreJjbg3TIE+g6a3Sb7nl0rLiYvKk0m68X5nzm5dv+X+UiQ3uCbQQ++M3PhubgUpnvBZtndN0zPbf4SJwbXLt6BdsNuFrpoonUL/0zxjvZS30WCdu+K0huhh95WPwo/+6Y7qbmwdSP4/200yN92KHMQDArjslT2wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744034541; c=relaxed/simple;
	bh=agYoneohJ+mttfGAgaNnSdMq5RKMY/WZd3OkEmZus0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=etlynhtHuZJ3+AYElWJmDFlsd6NJj345gIZVp/HAf0e4YarlJYHZ67nfMP+UPoxsx/9ghcf7xWcwG80EWzBkgt4M1uT40rn4i6CgcKiLpeZJTCbk7wlgjEbsnRQng1VWNW/7UG8QDKHAcVJrMX6LhUgOSc0bkaPJFPuAfT1Drsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hbBKCSac; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hbBKCSac"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744034536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O7RBa4axGhmBePDdEFsFyWJE7Ktbo1O3sCu5uta1lZ4=;
	b=hbBKCSacqnBmKjTiOJDw5I7YYPkU+WVj4RcCQCMBbFLJ5N9UnlKkLQZFiUmSfVluEYqwE1
	vjiAtHmTBUSXSyQ5MkAfRHRM2D5/A+Y3UMGduhcLWsC90QbPfWMdJAPwZ6j/oKzJucztHG
	yrMlYTXbZDbxxtnrXFyv7JLYQJtPQn8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-208-c9AKPgVpOvSNHt0nPkQyvQ-1; Mon,
 07 Apr 2025 10:02:15 -0400
X-MC-Unique: c9AKPgVpOvSNHt0nPkQyvQ-1
X-Mimecast-MFC-AGG-ID: c9AKPgVpOvSNHt0nPkQyvQ_1744034532
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E33B7180AF65;
	Mon,  7 Apr 2025 14:02:11 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.175])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7BEE3192C7C3;
	Mon,  7 Apr 2025 14:02:06 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Ryosuke Yasuoka <ryasuoka@redhat.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Wei Yang <richard.weiyang@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-mm@kvack.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v3 2/2] drm/panic: Add support to scanout buffer as array of pages
Date: Mon,  7 Apr 2025 15:42:26 +0200
Message-ID: <20250407140138.162383-3-jfalempe@redhat.com>
In-Reply-To: <20250407140138.162383-1-jfalempe@redhat.com>
References: <20250407140138.162383-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Some drivers like virtio-gpu, don't map the scanout buffer in the
kernel. Calling vmap() in a panic handler is not safe, and writing an
atomic_vmap() API is more complex than expected [1].
So instead, pass the array of pages of the scanout buffer to the
panic handler, and map only one page at a time to draw the pixels.
This is obviously slow, but acceptable for a panic handler.

[1] https://lore.kernel.org/dri-devel/20250305152555.318159-1-ryasuoka@redhat.com/

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Simona Vetter <simona@ffwll.ch>
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v3:
 * Replace DRM_WARN_ONCE with pr_debug_once (Simona Vetter)

 drivers/gpu/drm/drm_panic.c | 142 ++++++++++++++++++++++++++++++++++--
 include/drm/drm_panic.h     |  12 ++-
 2 files changed, 147 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index ab42a2b1567d0..ed27d1ef4a9ca 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/font.h>
+#include <linux/highmem.h>
 #include <linux/init.h>
 #include <linux/iosys-map.h>
 #include <linux/kdebug.h>
@@ -154,6 +155,90 @@ static void drm_panic_blit_pixel(struct drm_scanout_buffer *sb, struct drm_rect
 				sb->set_pixel(sb, clip->x1 + x, clip->y1 + y, fg_color);
 }
 
+static void drm_panic_write_pixel16(void *vaddr, unsigned int offset, u16 color)
+{
+	u16 *p = vaddr + offset;
+
+	*p = color;
+}
+
+static void drm_panic_write_pixel24(void *vaddr, unsigned int offset, u32 color)
+{
+	u8 *p = vaddr + offset;
+
+	*p++ = color & 0xff;
+	color >>= 8;
+	*p++ = color & 0xff;
+	color >>= 8;
+	*p = color & 0xff;
+}
+
+static void drm_panic_write_pixel32(void *vaddr, unsigned int offset, u32 color)
+{
+	u32 *p = vaddr + offset;
+
+	*p = color;
+}
+
+static void drm_panic_write_pixel(void *vaddr, unsigned int offset, u32 color, unsigned int cpp)
+{
+	switch (cpp) {
+	case 2:
+		drm_panic_write_pixel16(vaddr, offset, color);
+		break;
+	case 3:
+		drm_panic_write_pixel24(vaddr, offset, color);
+		break;
+	case 4:
+		drm_panic_write_pixel32(vaddr, offset, color);
+		break;
+	default:
+		pr_debug_once("Can't blit with pixel width %d\n", cpp);
+	}
+}
+
+/*
+ * The scanout buffer pages are not mapped, so for each pixel,
+ * use kmap_local_page_try_from_panic() to map the page, and write the pixel.
+ * Try to keep the map from the previous pixel, to avoid too much map/unmap.
+ */
+static void drm_panic_blit_page(struct page **pages, unsigned int dpitch,
+				unsigned int cpp, const u8 *sbuf8,
+				unsigned int spitch, struct drm_rect *clip,
+				unsigned int scale, u32 fg32)
+{
+	unsigned int y, x;
+	unsigned int page = ~0;
+	unsigned int height = drm_rect_height(clip);
+	unsigned int width = drm_rect_width(clip);
+	void *vaddr = NULL;
+
+	for (y = 0; y < height; y++) {
+		for (x = 0; x < width; x++) {
+			if (drm_draw_is_pixel_fg(sbuf8, spitch, x / scale, y / scale)) {
+				unsigned int new_page;
+				unsigned int offset;
+
+				offset = (y + clip->y1) * dpitch + (x + clip->x1) * cpp;
+				new_page = offset >> PAGE_SHIFT;
+				offset = offset % PAGE_SIZE;
+				if (new_page != page) {
+					if (!pages[new_page])
+						continue;
+					if (vaddr)
+						kunmap_local(vaddr);
+					page = new_page;
+					vaddr = kmap_local_page_try_from_panic(pages[page]);
+				}
+				if (vaddr)
+					drm_panic_write_pixel(vaddr, offset, fg32, cpp);
+			}
+		}
+	}
+	if (vaddr)
+		kunmap_local(vaddr);
+}
+
 /*
  * drm_panic_blit - convert a monochrome image to a linear framebuffer
  * @sb: destination scanout buffer
@@ -177,6 +262,10 @@ static void drm_panic_blit(struct drm_scanout_buffer *sb, struct drm_rect *clip,
 	if (sb->set_pixel)
 		return drm_panic_blit_pixel(sb, clip, sbuf8, spitch, scale, fg_color);
 
+	if (sb->pages)
+		return drm_panic_blit_page(sb->pages, sb->pitch[0], sb->format->cpp[0],
+					   sbuf8, spitch, clip, scale, fg_color);
+
 	map = sb->map[0];
 	iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->format->cpp[0]);
 
@@ -209,6 +298,35 @@ static void drm_panic_fill_pixel(struct drm_scanout_buffer *sb,
 			sb->set_pixel(sb, clip->x1 + x, clip->y1 + y, color);
 }
 
+static void drm_panic_fill_page(struct page **pages, unsigned int dpitch,
+				unsigned int cpp, struct drm_rect *clip,
+				u32 color)
+{
+	unsigned int y, x;
+	unsigned int page = ~0;
+	void *vaddr = NULL;
+
+	for (y = clip->y1; y < clip->y2; y++) {
+		for (x = clip->x1; x < clip->x2; x++) {
+			unsigned int new_page;
+			unsigned int offset;
+
+			offset = y * dpitch + x * cpp;
+			new_page = offset >> PAGE_SHIFT;
+			offset = offset % PAGE_SIZE;
+			if (new_page != page) {
+				if (vaddr)
+					kunmap_local(vaddr);
+				page = new_page;
+				vaddr = kmap_local_page_try_from_panic(pages[page]);
+			}
+			drm_panic_write_pixel(vaddr, offset, color, cpp);
+		}
+	}
+	if (vaddr)
+		kunmap_local(vaddr);
+}
+
 /*
  * drm_panic_fill - Fill a rectangle with a color
  * @sb: destination scanout buffer
@@ -225,6 +343,10 @@ static void drm_panic_fill(struct drm_scanout_buffer *sb, struct drm_rect *clip,
 	if (sb->set_pixel)
 		return drm_panic_fill_pixel(sb, clip, color);
 
+	if (sb->pages)
+		return drm_panic_fill_page(sb->pages, sb->pitch[0], sb->format->cpp[0],
+					   clip, color);
+
 	map = sb->map[0];
 	iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->format->cpp[0]);
 
@@ -714,16 +836,24 @@ static void draw_panic_plane(struct drm_plane *plane, const char *description)
 	if (!drm_panic_trylock(plane->dev, flags))
 		return;
 
+	ret = plane->helper_private->get_scanout_buffer(plane, &sb);
+
+	if (ret || !drm_panic_is_format_supported(sb.format))
+		goto unlock;
+
+	/* One of these should be set, or it can't draw pixels */
+	if (!sb.set_pixel && !sb.pages && iosys_map_is_null(&sb.map[0]))
+		goto unlock;
+
 	drm_panic_set_description(description);
 
-	ret = plane->helper_private->get_scanout_buffer(plane, &sb);
+	draw_panic_dispatch(&sb);
+	if (plane->helper_private->panic_flush)
+		plane->helper_private->panic_flush(plane);
 
-	if (!ret && drm_panic_is_format_supported(sb.format)) {
-		draw_panic_dispatch(&sb);
-		if (plane->helper_private->panic_flush)
-			plane->helper_private->panic_flush(plane);
-	}
 	drm_panic_clear_description();
+
+unlock:
 	drm_panic_unlock(plane->dev, flags);
 }
 
diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
index f4e1fa9ae607a..a00bf3cbf62f1 100644
--- a/include/drm/drm_panic.h
+++ b/include/drm/drm_panic.h
@@ -39,6 +39,16 @@ struct drm_scanout_buffer {
 	 */
 	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
 
+	/**
+	 * @pages: Optional, if the scanout buffer is not mapped, set this field
+	 * to the array of pages of the scanout buffer. The panic code will use
+	 * kmap_local_page_try_from_panic() to map one page at a time to write
+	 * all the pixels. This array shouldn't be allocated from the
+	 * get_scanoutbuffer() callback.
+	 * The scanout buffer should be in linear format.
+	 */
+	struct page **pages;
+
 	/**
 	 * @width: Width of the scanout buffer, in pixels.
 	 */
@@ -57,7 +67,7 @@ struct drm_scanout_buffer {
 	/**
 	 * @set_pixel: Optional function, to set a pixel color on the
 	 * framebuffer. It allows to handle special tiling format inside the
-	 * driver.
+	 * driver. It takes precedence over the @map and @pages fields.
 	 */
 	void (*set_pixel)(struct drm_scanout_buffer *sb, unsigned int x,
 			  unsigned int y, u32 color);
-- 
2.49.0

