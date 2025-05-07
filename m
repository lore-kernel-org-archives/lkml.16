Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DDAF4E2
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 00:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746577474; cv=none; b=YOJxBBjSLnFu4oFxbCgyWiHlA2MLsAGk6SsVNcET+0AIHiDqbn6CoRqeY6pmwXhd12ub6zn/7EnghsIvaGC/CFkic+Q35gWQaTkCxbXC1w9g5BRFawQCueoELKxmrsXh0NOLknyKchnoyBR6OSKexEhaATAeU3xJNQl29bVSSGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746577474; c=relaxed/simple;
	bh=mgRHUO5kly8vgVg2eQnOQsu6uX+8Zl1l2MUALqAAMnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=abwYMngJ57PFzbrbDUg//DhW3G7alb+P/arVU/I5By1Q6erVXZIDCung56RTDU2zXZEz29BFtvOggaJnyid64HXeYDcJGSR0R2JFIC0cZCk5robB+8mfLHKKxQVU6JIk76j/QkkJDSDB7xqnLlx+R2O4vytfhB/OObky5Ow0V1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=HF+/InVA; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="HF+/InVA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=409FBbvDS2Us+ovAjAHcsc9xHm8JBy90GPNyffM0qoU=; b=HF+/InVAf8DFiG1p
	Xcz9dHF2r4H4tNXgV6XwSdKDucX1f/Ja/RjPdahEDpJaiS1UAkqK4nUrkSRJOvwtZhCvIil4o4tA3
	tnLO61iOm2iX+7DAtrHD2J2a7jZVvhbjq/kLwLuIdegBEJfHtQD/7cx1HE7/13Z0F7pidxbSRBupn
	kY286Ll7J7blspcexphXgTYdW+xcAmL+dIM6Q0RIs4CAyYM/vQIbg57NeWjVq4+OD68tsc2g8OJgO
	RjnxdtXEA5a9e7OXIPJQ1zXWDwDgk3e3QSlnbpU32ymhpO3JWcZgmKlcit377WJcvXXb9/qoyb4jX
	X6ab79rpey9mq7HGRA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uCSaI-0021Kc-2M;
	Wed, 07 May 2025 00:24:26 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com,
	kenneth.feng@amd.com,
	christian.koenig@amd.com
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/3] drm/amd/pm/smu11: Remove unused smu_v11_0_get_dpm_level_range
Date: Wed,  7 May 2025 01:24:24 +0100
Message-ID: <20250507002425.93421-3-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507002425.93421-1-linux@treblig.org>
References: <20250507002425.93421-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The last use of smu_v11_0_get_dpm_level_range() was removed in 2020 by
commit 46a301e14e8a ("drm/amd/powerplay: drop unnecessary Navi1x specific
APIs")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h  |  5 ---
 .../gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c    | 39 -------------------
 2 files changed, 44 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h
index ed8304d82831..56ae555bb52a 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h
@@ -281,11 +281,6 @@ int smu_v11_0_set_single_dpm_table(struct smu_context *smu,
 				   enum smu_clk_type clk_type,
 				   struct smu_11_0_dpm_table *single_dpm_table);
 
-int smu_v11_0_get_dpm_level_range(struct smu_context *smu,
-				  enum smu_clk_type clk_type,
-				  uint32_t *min_value,
-				  uint32_t *max_value);
-
 int smu_v11_0_get_current_pcie_link_width_level(struct smu_context *smu);
 
 uint16_t smu_v11_0_get_current_pcie_link_width(struct smu_context *smu);
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
index 25fabf336a64..78e4186d06cc 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -2059,45 +2059,6 @@ int smu_v11_0_set_single_dpm_table(struct smu_context *smu,
 	return 0;
 }
 
-int smu_v11_0_get_dpm_level_range(struct smu_context *smu,
-				  enum smu_clk_type clk_type,
-				  uint32_t *min_value,
-				  uint32_t *max_value)
-{
-	uint32_t level_count = 0;
-	int ret = 0;
-
-	if (!min_value && !max_value)
-		return -EINVAL;
-
-	if (min_value) {
-		/* by default, level 0 clock value as min value */
-		ret = smu_v11_0_get_dpm_freq_by_index(smu,
-						      clk_type,
-						      0,
-						      min_value);
-		if (ret)
-			return ret;
-	}
-
-	if (max_value) {
-		ret = smu_v11_0_get_dpm_level_count(smu,
-						    clk_type,
-						    &level_count);
-		if (ret)
-			return ret;
-
-		ret = smu_v11_0_get_dpm_freq_by_index(smu,
-						      clk_type,
-						      level_count - 1,
-						      max_value);
-		if (ret)
-			return ret;
-	}
-
-	return ret;
-}
-
 int smu_v11_0_get_current_pcie_link_width_level(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
-- 
2.49.0

