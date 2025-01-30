Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C871EF0AB;
	Thu, 30 Jan 2025 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738258216; cv=pass; b=Z2N4CaPKP1A1/MWG7+0YeGhCU4J7N8JZFvV0jELgVameE+DXrFW9eaB324YPQNzyAOaUIR79d6rkQ0g4Mh3jyBXkgEk9CyyCjU6wNpf8T5Vt4JRwUVyDmEA7AuzBOJgluS5zaPxpHL3PlYkEMRQ3I8/aZCuYjT67IdUbKBItDOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738258216; c=relaxed/simple;
	bh=1fgguBGZqx6t+pTxfQu9adrSJCSSJkTXqTPvFN/QrYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OGOw11Hu9+f55h/lPNtG9Q4lWMFGegM/ikWPaV+k+eSc7pkSmxAibf3YKJ1FU6a++3cQUMwzRHZFQfvoWTKs/5b4Z8/IsT7mxGklFuuzYfUoM9FWIGuE72gIYRCgCiWcOCpvWsWFGuzlQwWXecMSh70zykSKWrj3wPcyJhRNi28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=kgsFQRXk; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="kgsFQRXk"
ARC-Seal: i=1; a=rsa-sha256; t=1738258188; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VQAKzV9mcUTO6J8jy5cc+UMQyftB3RHW95WiG7yLlMh06/WLVOAr+LIRuGC6/Fh45zxpHkEJA5dZotRn1YRRkI0SuKWFV2gpUujEPlUnVzDSgKMsbX5ARPmpDAY+JNaurEHatw0ovCXg+7LTRPgYTc1QIPIKlF/a60VjUC4Fu40=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738258188; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oe9yz0LUgW/HyWP7QYNCqzc/hVt9PtaAICLV4Q8wDfo=; 
	b=i9C7pnx4rUKNzocCoYHPAHenweKpOK2qYTYpp4u7ugE0rt0Yk5Rm6R9iQwpECXZzOcXojJiVnWtHvgzPaHt7nhuM3UJ9JPeU0jraJusKZPfEnZE8Y+8RNbxodYZnqNWJyOre9WPTDBuAXdMaZuZON51EwKLUr8/1RpsAqaE7IK4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738258188;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=oe9yz0LUgW/HyWP7QYNCqzc/hVt9PtaAICLV4Q8wDfo=;
	b=kgsFQRXk1Pl9A90mfMshBGa9FRinEQx17r3QHzoZYjLCtLmD0libdXyjGuTkebzq
	J2UeyUGrQXry5OE7+TXCc6tCh5doFm9p+WjELyGSdsAHriBGD4+UrfARDVmvAXU9pgs
	D3BHQeGpRlyP1IGJ1RV+BYOmM0FGCQP1ajM7SkmQ=
Received: by mx.zohomail.com with SMTPS id 1738258170262965.1122189634012;
	Thu, 30 Jan 2025 09:29:30 -0800 (PST)
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
Subject: [PATCH v10 5/5] drm/panthor: Fix race condition when gathering fdinfo group samples
Date: Thu, 30 Jan 2025 17:28:13 +0000
Message-ID: <20250130172851.941597-6-adrian.larumbe@collabora.com>
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

Commit e16635d88fa0 ("drm/panthor: add DRM fdinfo support") failed to
protect access to groups with an xarray lock, which could lead to
use-after-free errors.

Fixes: e16635d88fa0 ("drm/panthor: add DRM fdinfo support")
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index f3c6ca4dc11c..6d49b4f40f58 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2865,6 +2865,7 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
 	if (IS_ERR_OR_NULL(gpool))
 		return;
 
+	xa_lock(&gpool->xa);
 	xa_for_each(&gpool->xa, i, group) {
 		mutex_lock(&group->fdinfo.lock);
 		pfile->stats.cycles += group->fdinfo.data.cycles;
@@ -2873,6 +2874,7 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
 		group->fdinfo.data.time = 0;
 		mutex_unlock(&group->fdinfo.lock);
 	}
+	xa_unlock(&gpool->xa);
 }
 
 static void group_sync_upd_work(struct work_struct *work)
-- 
2.47.1

