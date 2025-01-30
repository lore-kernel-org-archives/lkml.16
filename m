Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFA21EF090;
	Thu, 30 Jan 2025 17:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738258190; cv=pass; b=TPQVWVOXKINgxEm1fsKKVyKzgTdu5Mwax4a31+0YEeuxQUbXrvoWDg1KTZV+mj1yLRHy7EjS4sfYPv50gmUSRdIv16U2FFtJRP9bobjdNrcg8kct9WYmFE4vA3uYP0GIqA0Wk86EwwxSwK5G6XON7deQj6d355ETY/gmtU9ay1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738258190; c=relaxed/simple;
	bh=WPgPlRMCC9RXZMMybf1yjyC0MgVeFUjNWsuEItR5Cfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sn+3Oce4Xuae7LKM3T/j4paUYsod+ceTWdiFQkEQSoZ0ksKlaDAfy7ow0QbWXW24I6RI/29V1pMB1ib6X+6AKibMXvMdI+QAt1x7nt9hVL+TZ8VAFKoP7UfuhVhlDrFuui5Q3BwrFnlT1hmFL8ZyZj61KOEr2FUUvxMhI47V25k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=bD97INN/; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="bD97INN/"
ARC-Seal: i=1; a=rsa-sha256; t=1738258161; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bbIcmJM9h6rRy30JmGFykvnn5plTBbtjEWYUPrcfJ9FPqjsZlwW/+3y3Fr37Vk4heCYR5o3C4wNZieKj7LewLd6+k/ovX5evqqPfztXdLpW7MtgouO5AMa/763EsAGhlXYILm5wJKMLEjRVOABs+lFOgKWSU5wCZw6Y9wLHOFTI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738258161; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WecdrsCmMp75CaXmESnd3WuWIXHueLuOQCyE/Ugf6pY=; 
	b=jgl5RDD1LwIY67AsL6NH8DZqkWaFK36d8FaxF3LF5Fui3p3aNorLc+31vWs+AFEDslyw6iuz4Xg/MIoI0r30M0nQ7UUj/YtBT1xkER/ZKTBe011xwtkAybC8ZThywijDmVXfOtC1q20/++IY8CzMOmUWjzvxGfH0OFI/xbrVPvU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738258161;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WecdrsCmMp75CaXmESnd3WuWIXHueLuOQCyE/Ugf6pY=;
	b=bD97INN//H4VD98XgEEpBiVJuTzzvCajPh2sRKUVX8T7h87U4SZI9rMnq9z/tQS8
	u4Wj8H+kthK/o2va1MVJKzLVtd0L9DHk/gB2NJQCWR+DS8Y/ogJejTzJurZVOxhu9PM
	JqHyx3Fo9vOtI/9r32S4+6QqzXoS+WEbPiwR4jdY=
Received: by mx.zohomail.com with SMTPS id 1738258158032668.901835177617;
	Thu, 30 Jan 2025 09:29:18 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel@collabora.com,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v10 2/5] drm/file: Add fdinfo helper for printing regions with prefix
Date: Thu, 30 Jan 2025 17:28:10 +0000
Message-ID: <20250130172851.941597-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250130172851.941597-1-adrian.larumbe@collabora.com>
References: <20250130172851.941597-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is motivated by the desire of some drivers (eg. Panthor) to print the
size of internal memory regions with a prefix that reflects the driver
name, as suggested in the previous documentation commit.

That means adding a new argument to print_size and making it available for
DRM users.

Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/drm_file.c | 27 +++++++++++++++++++--------
 include/drm/drm_file.h     |  5 +++++
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index cb5f22f5bbb6..f584abcd13cb 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -830,8 +830,12 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
 }
 EXPORT_SYMBOL(drm_send_event);
 
-static void print_size(struct drm_printer *p, const char *stat,
-		       const char *region, u64 sz)
+
+void drm_fdinfo_print_size(struct drm_printer *p,
+			   const char *prefix,
+			   const char *stat,
+			   const char *region,
+			   u64 sz)
 {
 	const char *units[] = {"", " KiB", " MiB"};
 	unsigned u;
@@ -842,8 +846,10 @@ static void print_size(struct drm_printer *p, const char *stat,
 		sz = div_u64(sz, SZ_1K);
 	}
 
-	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
+	drm_printf(p, "%s-%s-%s:\t%llu%s\n",
+		   prefix, stat, region, sz, units[u]);
 }
+EXPORT_SYMBOL(drm_fdinfo_print_size);
 
 /**
  * drm_print_memory_stats - A helper to print memory stats
@@ -858,15 +864,20 @@ void drm_print_memory_stats(struct drm_printer *p,
 			    enum drm_gem_object_status supported_status,
 			    const char *region)
 {
-	print_size(p, "total", region, stats->private + stats->shared);
-	print_size(p, "shared", region, stats->shared);
-	print_size(p, "active", region, stats->active);
+	const char *prefix = "drm";
+
+	drm_fdinfo_print_size(p, prefix, "total", region,
+			      stats->private + stats->shared);
+	drm_fdinfo_print_size(p, prefix, "shared", region, stats->shared);
+	drm_fdinfo_print_size(p, prefix, "active", region, stats->active);
 
 	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
-		print_size(p, "resident", region, stats->resident);
+		drm_fdinfo_print_size(p, prefix, "resident", region,
+				      stats->resident);
 
 	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
-		print_size(p, "purgeable", region, stats->purgeable);
+		drm_fdinfo_print_size(p, prefix, "purgeable", region,
+				      stats->purgeable);
 }
 EXPORT_SYMBOL(drm_print_memory_stats);
 
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index f0ef32e9fa5e..001ae553e8c3 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -494,6 +494,11 @@ struct drm_memory_stats {
 
 enum drm_gem_object_status;
 
+void drm_fdinfo_print_size(struct drm_printer *p,
+				  const char *prefix,
+				  const char *stat,
+				  const char *region,
+				  u64 sz);
 void drm_print_memory_stats(struct drm_printer *p,
 			    const struct drm_memory_stats *stats,
 			    enum drm_gem_object_status supported_status,
-- 
2.47.1

