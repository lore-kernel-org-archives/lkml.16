Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A8928C2A2
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746637316; cv=none; b=fQb9Gieb2BcvD3MVPA7n3eoj23naWwxoHu+KJZmz3yQS/n1eA0XOuhEqsKuzBtBAiaYJWEcGNPrOg42tw2izJBouVb7bDMu5LGWbIdgUVv9jDncR7s2KZoSQzmN5uvi7ZaOTMRHO+9hfVy6Z1stCgjOU33ClYCpjC4SwftrsyQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746637316; c=relaxed/simple;
	bh=VRzZAEAI6kBQhdsGc32Wu7dxtOabpXZl0Q/8VndG94M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fnb+YNyOjbfR354AUZ0KhW7ydk89QsOV89adEckji0bnd2GhwI6l7grU3G0mhJtZyKolBzlh7f3wStHLWKeqxmH6Lp3f2zpz3Uebr3/z8+URWFvyv+qPPlKmR+qFOVhbAy4jwexoRYDe9oZYsCFK8nSUvZ7mqfReTktLHWmPKN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=eSa4KocY; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="eSa4KocY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=ZfQuhl755N9ABQ2hDF6Pyo8eByft1E9/Y4DOUPbzRLQ=; b=eSa4KocYubTuaFmW
	8kSpMbvTFNWz4wNi0bdHijDlUzF//40z7iUECqZje6Uljrtm1u8a9qEcmYkmZbwlTJ4u/2Lb0MHQh
	z5ol+oJhQ/NGAs0jmmDaZT2nzDU4r2ofhqpIfAsYq8zC2mkuKimlnHlHoJHqvlWGnqBJX7rC+SBla
	ouvE6JR8aX/6AhDhCZbVcMCaHwjznMi2FbQSs24OsC8/tjYT5FkoxrYB9RVvluAxMOo6eX9BJKAek
	8XDxAWJuCkbvvBOnxM3td20vSoEJuybvsYTOldeMtROwT4p8uMUpmtN2ofDlGx70EEtM085QHSQML
	P/DegdxvJ6cdvaJdQg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uCi9U-002EIU-0L;
	Wed, 07 May 2025 17:01:48 +0000
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
Subject: [PATCH 3/3] drm/amd/pm: Remove remainder of mode2_reset_is_support
Date: Wed,  7 May 2025 18:01:45 +0100
Message-ID: <20250507170145.102508-4-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507170145.102508-1-linux@treblig.org>
References: <20250507170145.102508-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The previous patch removed smu_mode2_reset_is_support()
which was the only function to call through the mode2_reset_is_support()
method pointer.

Remove the remaining functions that were assigned to it
and the pointer itself.

See discussion at:
https://lore.kernel.org/all/DM4PR12MB5165D85BD85BC8FC8BF7A3B48E88A@DM4PR12MB5165.namprd12.prod.outlook.com/

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h           | 4 ----
 drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 6 ------
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c      | 6 ------
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c    | 6 ------
 4 files changed, 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index a5ba37f57650..eb0a97dde71c 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -1229,10 +1229,6 @@ struct pptable_funcs {
 	 * @mode1_reset_is_support: Check if GPU supports mode1 reset.
 	 */
 	bool (*mode1_reset_is_support)(struct smu_context *smu);
-	/**
-	 * @mode2_reset_is_support: Check if GPU supports mode2 reset.
-	 */
-	bool (*mode2_reset_is_support)(struct smu_context *smu);
 
 	/**
 	 * @mode1_reset: Perform mode1 reset.
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index 19a25fdc2f5b..115e3fa456bc 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -3089,11 +3089,6 @@ static int sienna_cichlid_stb_get_data_direct(struct smu_context *smu,
 	return 0;
 }
 
-static bool sienna_cichlid_is_mode2_reset_supported(struct smu_context *smu)
-{
-	return true;
-}
-
 static int sienna_cichlid_mode2_reset(struct smu_context *smu)
 {
 	int ret = 0, index;
@@ -3229,7 +3224,6 @@ static const struct pptable_funcs sienna_cichlid_ppt_funcs = {
 	.get_default_config_table_settings = sienna_cichlid_get_default_config_table_settings,
 	.set_config_table = sienna_cichlid_set_config_table,
 	.get_unique_id = sienna_cichlid_get_unique_id,
-	.mode2_reset_is_support = sienna_cichlid_is_mode2_reset_supported,
 	.mode2_reset = sienna_cichlid_mode2_reset,
 };
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
index 83163d7c7f00..38fbe0ddc4e6 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
@@ -1976,11 +1976,6 @@ static bool aldebaran_is_mode1_reset_supported(struct smu_context *smu)
 	return true;
 }
 
-static bool aldebaran_is_mode2_reset_supported(struct smu_context *smu)
-{
-	return true;
-}
-
 static int aldebaran_set_mp1_state(struct smu_context *smu,
 				   enum pp_mp1_state mp1_state)
 {
@@ -2086,7 +2081,6 @@ static const struct pptable_funcs aldebaran_ppt_funcs = {
 	.set_pp_feature_mask = smu_cmn_set_pp_feature_mask,
 	.get_gpu_metrics = aldebaran_get_gpu_metrics,
 	.mode1_reset_is_support = aldebaran_is_mode1_reset_supported,
-	.mode2_reset_is_support = aldebaran_is_mode2_reset_supported,
 	.smu_handle_passthrough_sbr = aldebaran_smu_handle_passthrough_sbr,
 	.mode1_reset = aldebaran_mode1_reset,
 	.set_mp1_state = aldebaran_set_mp1_state,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
index c478b3be37af..c529859c83ab 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
@@ -2849,11 +2849,6 @@ static bool smu_v13_0_6_is_mode1_reset_supported(struct smu_context *smu)
 	return true;
 }
 
-static bool smu_v13_0_6_is_mode2_reset_supported(struct smu_context *smu)
-{
-	return true;
-}
-
 static int smu_v13_0_6_smu_send_hbm_bad_page_num(struct smu_context *smu,
 						 uint32_t size)
 {
@@ -3586,7 +3581,6 @@ static const struct pptable_funcs smu_v13_0_6_ppt_funcs = {
 	.get_pm_metrics = smu_v13_0_6_get_pm_metrics,
 	.get_thermal_temperature_range = smu_v13_0_6_get_thermal_temperature_range,
 	.mode1_reset_is_support = smu_v13_0_6_is_mode1_reset_supported,
-	.mode2_reset_is_support = smu_v13_0_6_is_mode2_reset_supported,
 	.mode1_reset = smu_v13_0_6_mode1_reset,
 	.mode2_reset = smu_v13_0_6_mode2_reset,
 	.wait_for_event = smu_v13_0_wait_for_event,
-- 
2.49.0

