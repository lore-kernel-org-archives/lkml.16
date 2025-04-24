Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526932701B1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745494003; cv=none; b=fSX75Uu104bdQnLI8ZlPK+pXiZo1ZN3//s0HtKkoK5sdtpdaUlpQFFNqHh3kCoczZGS8H48+3QjTu56xMe/w9MYJmtbCvJPxpnkUz2FLUCr/o8N4/lAduWjU2N8oNWpRcrKwsVaAIbeEmqK26ymeBm8ASZfjCfd2nSVTXSKa6aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745494003; c=relaxed/simple;
	bh=A+RYlcmQmsEmIG25G70lkCafpndJRI9Esoh9VrB89Vs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y2W78aVZDlI49kng2nMimHuxIoMbRnOJUEFeLpPlUqJ+QL5jlJJVbpbIZ8RAdeWClQ4QFpuW43dXFRlvfULTP8NdjR7K8VcOvU5Gn+ci9mzm1+W0Ad4ZI8neoRwtK/W0o9KckaWcCb0qChdwy8JAm/eL0D0KoOCU5gzUkwlZaKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeHn4zay; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeHn4zay"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2734EC4CEE3;
	Thu, 24 Apr 2025 11:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745494002;
	bh=A+RYlcmQmsEmIG25G70lkCafpndJRI9Esoh9VrB89Vs=;
	h=From:To:Cc:Subject:Date:From;
	b=oeHn4zay9DfEUn5bcf5MU7u9XX60Lw+zmMzqOyUquvijfGKed8fHmWTMDlw21oz7g
	 MYzjR6fzhsS6vRzMwti10RZBhbHSi2UUjaX+fe5A+F71ZEesP9UgFs9/1Dj7wXGOMh
	 VZifZuCzJ61aovvWuSPisiuvgwZzxo0hWBh6SpcuM/SMQqj1mxbqxCKjwzBqeZw1nZ
	 x1gmytDIXhtEPP2/nPpwFAjO5+gtHHCkKCe8tZdVVOrw1Cde5EstmLPDP2n55H/d9m
	 Es/YbHg3ZA/UnIPahBVoAkb0b9ce5s9l/SCQyPIa9P+bq7kBXlbpSmTJH2dr5QBQlA
	 AUGRyHWec/5fQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Florent Tomasin <florent.tomasin@arm.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panthor: fix building without CONFIG_DEBUG_FS
Date: Thu, 24 Apr 2025 13:25:47 +0200
Message-Id: <20250424112637.3432563-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When debugfs is disabled, including panthor_gem.h causes warnings
about a non-static global function defined in a header:

In file included from drivers/gpu/drm/panthor/panthor_drv.c:30:
drivers/gpu/drm/panthor/panthor_gem.h:222:6: error: no previous prototype for 'panthor_gem_debugfs_set_usage_flags' [-Werror=missing-prototypes]
  222 | void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {};

This could be changed to a static inline function, but as the normal
one is also static inline, just move the #ifdef check in there.
The #ifdef is still needed to avoid accessing a struct member that
does not exist without debugfs.

Fixes: a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM objects over DebugFS")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/panthor/panthor_gem.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 4641994ddd7f..693842e10dee 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -209,17 +209,14 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 
 void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
 
-#ifdef CONFIG_DEBUG_FS
 void panthor_gem_debugfs_print_bos(struct panthor_device *pfdev,
 				   struct seq_file *m);
 static inline void
 panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags)
 {
+#ifdef CONFIG_DEBUG_FS
 	bo->debugfs.flags = usage_flags | PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
-}
-
-#else
-void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {};
 #endif
+}
 
 #endif /* __PANTHOR_GEM_H__ */
-- 
2.39.5

