Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B8D1D79A0
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 21:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738533557; cv=none; b=Ks6w3qeJU6i3dHxFzI/r0IR4egVeL9b5dk+W+rmuH4yPXiBVlGEVma/dvYA7ESD1fTX7MRx3NQjHJ9++bER5WU3E2+RE0GiVZw6y9rXUtMNSK1TZzniloInxE2/uT5Mwa0tZOQvzL7YPPgSraZ9kuIYbivmlvf6OAYtboI21l1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738533557; c=relaxed/simple;
	bh=mUgzQZqAip+YzACXh1otvofWTp5lxqmT36MO3dvp91M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jBlRjd6bEwEYnFuJ83G2M/++DKofabD4ZrkWhzXdDPbRbaEbuE2UTPkGlKRrRhWOUObwAS7FUXF0Z596F1AXeFvwWWCI/NXIS2u4Q3pdt01xwoJisVTuKmK2ifhc/3flKx0WevJ8oDDFlAq1UGnqLIw2p5LD3I6tFbcOJrxps9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=XAY1wUM5; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="XAY1wUM5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=EiBopR9dtV9yxHm9Kvdf5kaAuKnjm8bl8Embt4vm7VY=; b=XAY1wUM5bsBuhHCn
	IDc+NMVbaI72ZwsfOIWxm9bF+WIQKAh8Mr8R6zwMWgOtofWWe8fiGXRUiPN5jwd69VR6HQTsnohMZ
	RoJjjulwBD1dOH502cazwuq+DhOxowqLdq/cnwzkAt8WPqd13V04ChNnKd9x2fviG+tiVo+sJdpQf
	cP1IsDtakV+oBxH+SWZ2jEGvnMTOo6vpcXevDd9JoqPE6/Hap/bon/3zI5j0KnxkdgtZrjF1/BQZm
	OqY674Ed1xTjx5eQzyiWdZ2I8IlBwmzvLDUqCqi41AfVy+Ux7ZzaZHq3lRJZ4ANS4oxbKbH2062ht
	3uZPP1rkCa9210i0yA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tehzZ-00D9GV-1s;
	Sun, 02 Feb 2025 21:59:01 +0000
From: linux@treblig.org
To: patrik.r.jakobsson@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com,
	Rodrigo.Siqueira@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 6/7] drm/amd/display: Remove unused get_max_support_fbc_buffersize
Date: Sun,  2 Feb 2025 21:58:55 +0000
Message-ID: <20250202215856.252439-7-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250202215856.252439-1-linux@treblig.org>
References: <20250202215856.252439-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

get_max_support_fbc_buffersize() is unused since 2021's
commit 94f0d0c80cf3 ("drm/amd/display/dc/dce110/dce110_compressor: Remove
unused function 'dce110_get_required_compressed_surfacesize")
removed it's only caller.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../drm/amd/display/dc/dce110/dce110_compressor.c   | 13 -------------
 .../drm/amd/display/dc/dce110/dce110_compressor.h   |  2 --
 2 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_compressor.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_compressor.c
index d241ee13b293..59a0961b49da 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_compressor.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_compressor.c
@@ -409,19 +409,6 @@ void dce110_compressor_destroy(struct compressor **compressor)
 	*compressor = NULL;
 }
 
-void get_max_support_fbc_buffersize(unsigned int *max_x, unsigned int *max_y)
-{
-	*max_x = FBC_MAX_X;
-	*max_y = FBC_MAX_Y;
-
-	/* if (m_smallLocalFrameBufferMemory == 1)
-	 * {
-	 *	*max_x = FBC_MAX_X_SG;
-	 *	*max_y = FBC_MAX_Y_SG;
-	 * }
-	 */
-}
-
 static const struct compressor_funcs dce110_compressor_funcs = {
 	.power_up_fbc = dce110_compressor_power_up_fbc,
 	.enable_fbc = dce110_compressor_enable_fbc,
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_compressor.h b/drivers/gpu/drm/amd/display/dc/dce110/dce110_compressor.h
index 26c7335a1cbf..223c57941e92 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_compressor.h
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_compressor.h
@@ -75,7 +75,5 @@ void dce110_compressor_program_lpt_control(struct compressor *cp,
 
 bool dce110_compressor_is_lpt_enabled_in_hw(struct compressor *cp);
 
-void get_max_support_fbc_buffersize(unsigned int *max_x, unsigned int *max_y);
-
 #endif
 
-- 
2.48.1

