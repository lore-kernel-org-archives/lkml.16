Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDF81A08DF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 06:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612604; cv=none; b=U6F9v5HUNR7bGk4hOG/BVAAcbPyElBOYO5GSPFI5DKuygnVVcHuHg8USzJ+fkKO6L3dEyVQXx9ip1IWRyU4VzZXG/T9cp1i2NLy6NjpakLKBHHy+XsK0bxASny1rFGdIbEcqOtJgZyP0xUxg0H2hldHevB5OfPlcp3M6FGZzzJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612604; c=relaxed/simple;
	bh=tf694kECYu/EWPbbQ45vsQ6LcGLLICsZok3e/DD7KDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eux4yVUQ1fAGMOxfQuUfQMtfB7H1idTpi23gqbHQLSxJ0gUNDxkEngkSaB5cvvKhOVc2N1VFzbQ5LXv2kvDNjokYcgrcPdptVhWGF6iw275vZ3M2bIamIhP9iru5PEd6gfaGrFX9wxaifHcx00Fqah0V2vQ8wgFqp12U6KJfUhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowABHhQ3xrPxn6qzlCA--.18678S2;
	Mon, 14 Apr 2025 14:36:34 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: kenneth.feng@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH RESEND] drm/amd/pm/powerplay/smumgr/fiji_smumgr: Fix wrong return value of fiji_populate_smc_boot_level()
Date: Mon, 14 Apr 2025 14:36:11 +0800
Message-ID: <20250414063611.2100-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABHhQ3xrPxn6qzlCA--.18678S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF43Wr4xZw43CF4kCF47CFg_yoW5GF15pr
	WDXrZIv39YyanrJrnrtFs2qr4S9FyxJFW8G3y7C34rZw1UtrW8Zr40ya4ayF48GFyIkws3
	X342gFWUGr4Ika7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8D7aUUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAgMA2f8nB469QAAsd

The return value of fiji_populate_smc_boot_level() is always 0, which
represent the failure of the function. The result of phm_find_boot_level()
should be recored and return. An error handling is also needed to
phm_find_boot_level() to reset the boot level when the function fails.
A proper implementation can be found in tonga_populate_smc_boot_level().

Fixes: dcaf3483ae46 ("drm/amd/pm/powerplay/smumgr/fiji_smumgr: Remove unused variable 'result'")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 .../drm/amd/pm/powerplay/smumgr/fiji_smumgr.c | 23 +++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
index 5e43ad2b2956..7d0cb3741b94 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
@@ -1600,19 +1600,28 @@ static int fiji_populate_smc_uvd_level(struct pp_hwmgr *hwmgr,
 static int fiji_populate_smc_boot_level(struct pp_hwmgr *hwmgr,
 		struct SMU73_Discrete_DpmTable *table)
 {
+	int result = 0;
 	struct smu7_hwmgr *data = (struct smu7_hwmgr *)(hwmgr->backend);
 
 	table->GraphicsBootLevel = 0;
 	table->MemoryBootLevel = 0;
 
 	/* find boot level from dpm table */
-	phm_find_boot_level(&(data->dpm_table.sclk_table),
-			    data->vbios_boot_state.sclk_bootup_value,
-			    (uint32_t *)&(table->GraphicsBootLevel));
+	result = phm_find_boot_level(&(data->dpm_table.sclk_table),
+				     data->vbios_boot_state.sclk_bootup_value,
+				     (uint32_t *)&(table->GraphicsBootLevel));
+	if (result) {
+		table->GraphicsBootLevel = 0;
+		return 0;
+	}
 
-	phm_find_boot_level(&(data->dpm_table.mclk_table),
-			    data->vbios_boot_state.mclk_bootup_value,
-			    (uint32_t *)&(table->MemoryBootLevel));
+	result = phm_find_boot_level(&(data->dpm_table.mclk_table),
+				     data->vbios_boot_state.mclk_bootup_value,
+				     (uint32_t *)&(table->MemoryBootLevel));
+	if (result) {
+		table->MemoryBootLevel = 0;
+		return 0;
+	}
 
 	table->BootVddc  = data->vbios_boot_state.vddc_bootup_value *
 			VOLTAGE_SCALE;
@@ -1625,7 +1634,7 @@ static int fiji_populate_smc_boot_level(struct pp_hwmgr *hwmgr,
 	CONVERT_FROM_HOST_TO_SMC_US(table->BootVddci);
 	CONVERT_FROM_HOST_TO_SMC_US(table->BootMVdd);
 
-	return 0;
+	return result;
 }
 
 static int fiji_populate_smc_initailial_state(struct pp_hwmgr *hwmgr)
-- 
2.42.0.windows.2

