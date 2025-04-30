Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945FC248F5B;
	Wed, 30 Apr 2025 16:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746032136; cv=none; b=MsPw6LHCZ15Szw9t+JVJGjZjtbFMw1ZsBi5rHIAs5QMvO70LizuEha0TAJwweg5NRRu87AJGYCURWHUaRx2REXCnGVpsFqosGNfEwcHjwgwCNEEprZ+6CulcxW9/UbNvl2am8lbT4q2FFts0pdqONoIyEKzxRgwuDwnCRMFS1Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746032136; c=relaxed/simple;
	bh=rsgOWhO2pu5zyjIx/PgkLniM/48Uoogtx/sgdnziwVE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DJTxI4LU75+HDMhT9flBljDrBStdl6j67GpXYoGECLvuh9oS7/Hqt3h9TPaxrcmta6kITMNfRaU6fGKzcKbmhmsxu+5TWcmQ52hniH28zXCM/WggEYNUt0HIPJY+zyKKqA4xNX6p+5LXm7yXuImotLd7wsEplLwMGz7XcOc1y0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=4zoqto9U; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="4zoqto9U"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UCgokD017061;
	Wed, 30 Apr 2025 18:55:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	vpyb+c9mE+Q+2Mh2tz1ExittWKkMDszFfcq8RuscDGI=; b=4zoqto9UJncUOg75
	9z2dpfdzXwjTwUtgbx5g+D/oHwmZR+OoCcV7CvNGUAtuM4Kz1ZxYf9fDE9r0klZv
	qoz7orVwMJbwyPBBJWXePQiSOub9SY/8AILGNkN5cAZZaDgNKjQkn1MtMactH1PZ
	lIUCjIpDukcjdZXzluY3Fgd6n6jNxywtz6UAFvDWZBCsxUXVKl4V6aiVpeM6pR4O
	5t9WT1SMSWyCMadALu1xveazPI3v2BR7Njr7mtX3UQgt2G/Kr/U9WtUc1BI0P4p3
	9bODKuCCMAQ3oZ6+I+owWWU/mihkysKCYePfSYGu82xD1H3jHgr0f/YmJZ4IHZxR
	VpF54g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46b6tnm8e7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 18:55:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A812A4004A;
	Wed, 30 Apr 2025 18:54:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1992DA47AC0;
	Wed, 30 Apr 2025 18:53:30 +0200 (CEST)
Received: from localhost (10.252.20.195) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 18:53:29 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>
CC: <linux-sound@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: stm32: sai: skip useless iterations on kernel rate loop
Date: Wed, 30 Apr 2025 18:52:08 +0200
Message-ID: <20250430165210.321273-2-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250430165210.321273-1-olivier.moysan@foss.st.com>
References: <20250430165210.321273-1-olivier.moysan@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_05,2025-04-24_02,2025-02-21_01

the frequency of the kernel clock must be greater than or equal to the
bitclock rate. When searching for a convenient kernel clock rate in
stm32_sai_set_parent_rate() function, it is useless to continue the loop
below bitclock rate, as it will result in a invalid kernel clock rate.
Change the loop output condition.

Fixes: b1d2e4067dc6 ("ASoC: stm32: sai: add stm32mp25 support")
Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 sound/soc/stm/stm32_sai_sub.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index e8c1abf1ae0a..4d018b4bc3f0 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -409,11 +409,11 @@ static int stm32_sai_set_parent_rate(struct stm32_sai_sub_data *sai,
 				     unsigned int rate)
 {
 	struct platform_device *pdev = sai->pdev;
-	unsigned int sai_ck_rate, sai_ck_max_rate, sai_curr_rate, sai_new_rate;
+	unsigned int sai_ck_rate, sai_ck_max_rate, sai_ck_min_rate, sai_curr_rate, sai_new_rate;
 	int div, ret;
 
 	/*
-	 * Set maximum expected kernel clock frequency
+	 * Set minimum and maximum expected kernel clock frequency
 	 * - mclk on or spdif:
 	 *   f_sai_ck = MCKDIV * mclk-fs * fs
 	 *   Here typical 256 ratio is assumed for mclk-fs
@@ -423,13 +423,16 @@ static int stm32_sai_set_parent_rate(struct stm32_sai_sub_data *sai,
 	 *   Set constraint MCKDIV * FRL <= 256, to ensure MCKDIV is in available range
 	 *   f_sai_ck = sai_ck_max_rate * pow_of_two(FRL) / 256
 	 */
+	sai_ck_min_rate = rate * 256;
 	if (!(rate % SAI_RATE_11K))
 		sai_ck_max_rate = SAI_MAX_SAMPLE_RATE_11K * 256;
 	else
 		sai_ck_max_rate = SAI_MAX_SAMPLE_RATE_8K * 256;
 
-	if (!sai->sai_mclk && !STM_SAI_PROTOCOL_IS_SPDIF(sai))
+	if (!sai->sai_mclk && !STM_SAI_PROTOCOL_IS_SPDIF(sai)) {
+		sai_ck_min_rate = rate * sai->fs_length;
 		sai_ck_max_rate /= DIV_ROUND_CLOSEST(256, roundup_pow_of_two(sai->fs_length));
+	}
 
 	/*
 	 * Request exclusivity, as the clock is shared by SAI sub-blocks and by
@@ -472,7 +475,7 @@ static int stm32_sai_set_parent_rate(struct stm32_sai_sub_data *sai,
 		/* Try a lower frequency */
 		div++;
 		sai_ck_rate = sai_ck_max_rate / div;
-	} while (sai_ck_rate > rate);
+	} while (sai_ck_rate >= sai_ck_min_rate);
 
 	/* No accurate rate found */
 	dev_err(&pdev->dev, "Failed to find an accurate rate");
-- 
2.25.1

