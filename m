Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC3B2868B3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615661; cv=none; b=t/O/BSXByWTDsNhPln0PlT6g4anRMNzWAaA0E6PZ0wUkNgfW1bmEyp9Av/yvADGX/zqrxVZi4Oz1Q5vGLzZunM1odUDniQ8a0jHtNOS4K44h9oWDy3e2KZC1tmeohQ+l3WGztQ6cFCI+XLW+E7CVeJrDqqhavXrNCcxF546ErCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615661; c=relaxed/simple;
	bh=3RwMRyp8fXMT0ekrMhYvr10mmIyqSJ+HSm2qdURO4ps=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F1O8ZQ9KAT2Gmnt6xbGywsibcHUwwbjKwLuGx+I4bV/2Q4fN4R1zkDF+Tu5g94snqGHFgxrUS2FBENd5Iz4pTBO5qMcnfznxcsQfEfu6D8QqhPpM7E+4adz0U+Hq/Sd4/Em7s1Ry5FJeWcjBXWl2UVnMvBqvyKCBDeqTMxkmUAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ey7uKWX4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ey7uKWX4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615659; x=1783151659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3RwMRyp8fXMT0ekrMhYvr10mmIyqSJ+HSm2qdURO4ps=;
  b=Ey7uKWX4IA5WlkgQBK+hFjZGE/IkXj4tBR+CaDVNW9v2nLaf6yhwySc5
   loR6DnTiihAzvf10ReGZYxiXjS3AWeNNERGH+klfGHEOGVtJo96U68c2/
   ITalm4nkz4Nn4J+8SUYhW0AytVlUzuxxoJVU+Lcu56Km8hehe4y2KXjR3
   hkzbCtJ6gpTMKLNHLFRqvRA9uX0aQr9dj/R838Dp3ZahQj15v8LcjQzUZ
   caUqLVHUYTyzfo7PFBzBgLoiwgvW5gEo8ji/KRrFMVN+5EbI1Xm1+oP9/
   8FqLmeHcGz0aUb3Gj3XswskuNscV99xlQdUbxY3/83YCnh5hZdivX4FM8
   A==;
X-CSE-ConnectionGUID: oI0M2TTqSlOolcfJyo6YSQ==
X-CSE-MsgGUID: EW6mMNeOTKqtfBoCddAHGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494558"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494558"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:16 -0700
X-CSE-ConnectionGUID: r9sUPqNERrOEdYYEoEP/WQ==
X-CSE-MsgGUID: EDcc4uMETdWK9rdj/PE7rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924217"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:14 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 1857244433;
	Fri,  4 Jul 2025 10:54:12 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/80] drm/panfrost: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:11 +0300
Message-Id: <20250704075411.3218059-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index 563f16bae543..0dd62e8b2fa7 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -203,7 +203,6 @@ static int panfrost_perfcnt_disable_locked(struct panfrost_device *pfdev,
 	panfrost_mmu_as_put(pfdev, perfcnt->mapping->mmu);
 	panfrost_gem_mapping_put(perfcnt->mapping);
 	perfcnt->mapping = NULL;
-	pm_runtime_mark_last_busy(pfdev->dev);
 	pm_runtime_put_autosuspend(pfdev->dev);
 
 	return 0;
@@ -279,7 +278,6 @@ void panfrost_perfcnt_close(struct drm_file *file_priv)
 	if (perfcnt->user == pfile)
 		panfrost_perfcnt_disable_locked(pfdev, file_priv);
 	mutex_unlock(&perfcnt->lock);
-	pm_runtime_mark_last_busy(pfdev->dev);
 	pm_runtime_put_autosuspend(pfdev->dev);
 }
 
-- 
2.39.5

