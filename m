Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CFF28ECD2;
	Fri,  9 May 2025 10:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746785675; cv=none; b=raLVxiu2LW0RC2MHeNStQUUVyCmTAxdS+qvb5OPE1zwDeZXOhzHlDn8VglWpiO2RqCdJjJkWphcuMHeBE1pjEqJYLq19g0vfJcClVwe2m4La1EVhXCTjpVgzLw83AAPGHDY6WijaJKNnTGwlHj319HLfSwj/+YlywEQV/l88R3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746785675; c=relaxed/simple;
	bh=R3vnkjN+ASY/SbYqCquRQHrPKm8EfxBUCQMcvUi7KtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eg7z0DC2ugSpz7vJNqEUYYy0/1dRe5X1CL+jQ8WYr9jccsi1jhOKdiPearTPGys8i635RTPOa5Ou4iRNRp+jTzQ4CUIqax2MlhLsSvidB+3AdIR8+6MYcleS0s8haS6eMT1l/eSn0YUEOZFCuRtDg+b+U+TdylXf6+Zv7Ie6whc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=duw3Fya2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="duw3Fya2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746785671;
	bh=R3vnkjN+ASY/SbYqCquRQHrPKm8EfxBUCQMcvUi7KtI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=duw3Fya2Ql+BPAbJDcuoxAEiOW2z77mOhkskwqxZyJ5lfbns8TXi6Vpnx3x1VI4lw
	 qiKHC91tF4abx34Xpfb7RAVbt2IOr6Q8AYQEWc7bU043HFruav5Cca4MlO0n0n//12
	 QKSDeqyGrZryXbekywVKjRa/HVOhzvWJ6KMpcNY0WMrYZdF2KZAdh2uWhzRTRmbcfd
	 r9MeatL6NixOBJ8YIPJ9+YFB/ca63SndygrXLVuhrAcbvKrapXalpHX8RrZ5oBVfu4
	 Fv5GeVw99mGzms5VZNRGD0uU2L5nZnbhyrdIKJt+nR/MT5I7APSsLD4qgEr6X8NmnU
	 p2qOGT9mLH0gg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DDCC917E09BE;
	Fri,  9 May 2025 12:14:29 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 09 May 2025 12:12:48 +0200
Subject: [PATCH v6 2/5] drm/panfrost: Drop duplicated Mediatek supplies
 arrays
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-mt8370-enable-gpu-v6-2-2833888cb1d3@collabora.com>
References: <20250509-mt8370-enable-gpu-v6-0-2833888cb1d3@collabora.com>
In-Reply-To: <20250509-mt8370-enable-gpu-v6-0-2833888cb1d3@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746785666; l=4157;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=R3vnkjN+ASY/SbYqCquRQHrPKm8EfxBUCQMcvUi7KtI=;
 b=jGPkOxwSIA9wn8AvKqHdSHECc1gmU6zCddwHvpmkh2tzo+xz2IbHmcUQaleAoMb3FicW9++sa
 jS2gQM6Yzc1CWuP2nSH2v0aCOzIEnlq/+eKwzmYDJVVTiG3zB5LodiK
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

In the panfrost driver, the platform data of several Mediatek SoC
declares and uses custom supplies array definitions
(mediatek_mt8192_supplies, mediatek_mt8183_b_supplies), that are the
same as default_supplies (used by default platform data).

So drop these duplicated definitions and use default_supplies instead.
Also, rename mediatek_mt8183_supplies to a more generic name too
(legacy_supplies).

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index f1ec3b02f15a0029d20c7d81046ded59854e885c..7b899a9b2120c608e61dab9ca831ab8e907e8139 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -797,19 +797,18 @@ static const struct panfrost_compatible amlogic_data = {
  * On new devicetrees please use the _b variant with a single and
  * coupled regulators instead.
  */
-static const char * const mediatek_mt8183_supplies[] = { "mali", "sram", NULL };
+static const char * const legacy_supplies[] = { "mali", "sram", NULL };
 static const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
 static const struct panfrost_compatible mediatek_mt8183_data = {
-	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies) - 1,
-	.supply_names = mediatek_mt8183_supplies,
+	.num_supplies = ARRAY_SIZE(legacy_supplies) - 1,
+	.supply_names = legacy_supplies,
 	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
 	.pm_domain_names = mediatek_mt8183_pm_domains,
 };
 
-static const char * const mediatek_mt8183_b_supplies[] = { "mali", NULL };
 static const struct panfrost_compatible mediatek_mt8183_b_data = {
-	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
-	.supply_names = mediatek_mt8183_b_supplies,
+	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
+	.supply_names = default_supplies,
 	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
 	.pm_domain_names = mediatek_mt8183_pm_domains,
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
@@ -817,8 +816,8 @@ static const struct panfrost_compatible mediatek_mt8183_b_data = {
 
 static const char * const mediatek_mt8186_pm_domains[] = { "core0", "core1" };
 static const struct panfrost_compatible mediatek_mt8186_data = {
-	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
-	.supply_names = mediatek_mt8183_b_supplies,
+	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
+	.supply_names = default_supplies,
 	.num_pm_domains = ARRAY_SIZE(mediatek_mt8186_pm_domains),
 	.pm_domain_names = mediatek_mt8186_pm_domains,
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
@@ -826,20 +825,19 @@ static const struct panfrost_compatible mediatek_mt8186_data = {
 
 /* MT8188 uses the same power domains and power supplies as MT8183 */
 static const struct panfrost_compatible mediatek_mt8188_data = {
-	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
-	.supply_names = mediatek_mt8183_b_supplies,
+	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
+	.supply_names = default_supplies,
 	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
 	.pm_domain_names = mediatek_mt8183_pm_domains,
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
 	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
 };
 
-static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
 static const char * const mediatek_mt8192_pm_domains[] = { "core0", "core1", "core2",
 							   "core3", "core4" };
 static const struct panfrost_compatible mediatek_mt8192_data = {
-	.num_supplies = ARRAY_SIZE(mediatek_mt8192_supplies) - 1,
-	.supply_names = mediatek_mt8192_supplies,
+	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
+	.supply_names = default_supplies,
 	.num_pm_domains = ARRAY_SIZE(mediatek_mt8192_pm_domains),
 	.pm_domain_names = mediatek_mt8192_pm_domains,
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),

-- 
2.49.0

