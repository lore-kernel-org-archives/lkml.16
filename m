Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3529D134BD;
	Wed, 21 May 2025 15:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747840007; cv=none; b=nmnMrSWfh9dalzZVYq8EqFRj71weTsgW6vQ+Fzv0rOUq/CsJe42x4IedSEsfM9DmVuLWeRadZ5FdU9Nmzx+NwN/zt7pRwZCtplQuOSc9DZ+9EuOBzGgDJWaiTEVNYcXHrSs5aLTDcTgX3pPor3nWlwVEow8gocJRKuFXeycHjoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747840007; c=relaxed/simple;
	bh=6POffHNMxF5zDAyB/sle0MsWVwycDB4/2T1r2zXqonk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tNvF50dCZWUj69Aqfaz55B4do0tgWBZbzKo57cg4SmPTe422da1rAhY9w0/7a0kCBmzry2+4DnCX84yVdYrEqkjWBp3GeDWsf2D2NM1Ty2beO8PrN1YyqQS0xlOhItUBA6kB2Fv3OBh74bWYoSW1U2Ckh8G+22eOJPHaiY5UJVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Mufg19jE; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Mufg19jE"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LDfwNR031547;
	Wed, 21 May 2025 17:06:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=TSmPZSUiriMz96Sywv4sxQ
	EnAqY0Qa0OY4Z7gR1h+jw=; b=Mufg19jELB0oRxHfJfird2T2YhK7gJVi4aLfNc
	4yEaZ8LYgEvcuZctFGz/dUGudj5zyUOaLf+HX32vk8G0Wh84sfnhU5dTJ0LfLIRA
	bh73dNmI16LJNUIniQSjUN73lw0fNoWSpT0Oyc3t96OYKQQ6/HUfnbyYwnNepLSH
	1ErfL7rzfKX2BwbC+kB1VvAU+l5hYNu6B6lJoUB3DE7K3GtxjrewVELE/623PAiT
	RHSTncXTXfy9u+IzSeOcyyAvT/8GhxdHOHsueHaYgsjQRSxZyWsCgNRK2U4fnsdf
	l7Uu4CChn+FPBYrIte6aykDu4LDxAcM/Y6uTLRAsFveizp8w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwf44txt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 17:06:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 275A640049;
	Wed, 21 May 2025 17:05:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C4A76A2AB8E;
	Wed, 21 May 2025 17:04:25 +0200 (CEST)
Received: from localhost (10.252.24.31) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 17:04:25 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Olivier Moysan <olivier.moysan@foss.st.com>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] ARM: dts: stm32: add system-clock-direction-out on stm32mp15xx-dkx
Date: Wed, 21 May 2025 17:04:18 +0200
Message-ID: <20250521150418.488152-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01

The commit 5725bce709db
("ASoC: simple-card-utils: Unify clock direction by clk_direction")
corrupts the audio on STM32MP15 DK sound cards.
The parent clock is not correctly set, because set_sai_ck_rate() is not
executed in stm32_sai_set_sysclk() callback.
This occurs because set_sysclk() is called with the wrong direction,
SND_SOC_CLOCK_IN instead of SND_SOC_CLOCK_OUT.

Add system-clock-direction-out property in SAI2A endpoint node of
STM32MP15XX-DKX device tree, to specify the MCLK clock direction.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index a5511b1f0ce3..c74e36676d1b 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -515,6 +515,7 @@ sai2a_endpoint: endpoint {
 				remote-endpoint = <&cs42l51_tx_endpoint>;
 				dai-format = "i2s";
 				mclk-fs = <256>;
+				system-clock-direction-out;
 				dai-tdm-slot-num = <2>;
 				dai-tdm-slot-width = <32>;
 			};
-- 
2.25.1

