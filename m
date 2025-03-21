Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A685C1F12ED
	for <linux-kernel@vger.kernel.org>; Fri, 21 Mar 2025 10:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.211.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742554365; cv=none; b=BQ59Y3iZf89tx17FDBR024LgshIPcXZmO1e6wkYCHKcrnwROB9U9+2uFfcwAktrW03jVtQYO90LsDshCjtBNtjsjYdxj16c2zNdytfowVNgaXXN6E6XB9fPXNTEjJw50H6L0w/Yejp+Y9PBUC6wwZiouzMsftej4REUCxoj0rtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742554365; c=relaxed/simple;
	bh=FHCzrGVVWQLOPgQ8Qae45KDYp5M2UOzxJNcPvzeo39k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJRXFy6IA3OBktL/rTtODvTwCvqIfXyt0NJx76J9me9GYHhGK8mnmv37Zw101pX3v73BKQ4t3nsJ2BNP84kC2WmKAtdl1rWQR2YmRa6iAQ94f7up6VF6Mf+lSYwh3N7ncRMSQZNWVBfYi2gzODGhjsufANcyOZSC8xh7EFlE7+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; spf=pass smtp.mailfrom=swemel.ru; dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b=AP3kvIiN; arc=none smtp.client-ip=95.143.211.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swemel.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b="AP3kvIiN"
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1742554359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NSAxc1sckwn4a/NgjFoPyCdK+dCnzN2lGLwSBJfJBg8=;
	b=AP3kvIiN7T33aadtGaCDsmaSm+e0zdBDDviIHoZVVPzYvr1aHEJw0oBQxpBDmNt0NVD77U
	rsAkSUKyNVBS1l33P5oEsfzbuZrhZ8YeYtSrPkPtUSVMwb0z2ANQZnPOsIYt7gPsl37+sb
	Y5Oq2i/HKAaxTwrip1YCKXntHZwlUIc=
To: Kenneth Feng <kenneth.feng@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Ma Jun <Jun.Ma2@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
	Yang Wang <kevinyang.wang@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 1/5] drm/amd/pm: Prevent division by zero
Date: Fri, 21 Mar 2025 13:52:31 +0300
Message-ID: <20250321105239.10096-2-arefev@swemel.ru>
In-Reply-To: <20250321105239.10096-1-arefev@swemel.ru>
References: <20250321105239.10096-1-arefev@swemel.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The user can set any speed value.
If speed is greater than UINT_MAX/8, division by zero is possible.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: c05d1c401572 ("drm/amd/swsmu: add aldebaran smu13 ip support (v3)")
Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index fbbdfa54f6a2..b508d475d2e1 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -1229,7 +1229,7 @@ int smu_v13_0_set_fan_speed_rpm(struct smu_context *smu,
 	uint32_t tach_period;
 	int ret;
 
-	if (!speed)
+	if (!speed || speed > UINT_MAX/8)
 		return -EINVAL;
 
 	ret = smu_v13_0_auto_fan_control(smu, 0);
-- 
2.43.0

