Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280AD24CEFD;
	Thu,  3 Apr 2025 12:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743681815; cv=none; b=iZdZZZwJZsl+kZ/TNA6Kl8bssOcXjKtnYiLAt+VES+B63hwRuO7X1obtogxdtCdHx+Aj/yVZ6PfWzyomI7OIGYNy3T/DsQGwPJXYhQV10EZFSFlD6ODky+j82ec3+pdEsEqnzkqyaKvj+a+22T+HJzcefvHRg6l0A2u0b2zXWdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743681815; c=relaxed/simple;
	bh=CgpxV5zjoVtbxeoCoP19OwywxVbyma4tLpVmpv4f9wE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TQNzMieTgdql4qNwq9aHb5oBpSF/7GYLBn0cA6PK09EDMTDmFX+Z+crcjxffJMmNr8x0RD7NLHFVoi/NFFpDqEuQDV9jPqidDnLfTlS0r7zB4fnV/r7D/xnLGqpVM78waQFol5AiD8Rb6vax5teoQ5Ay2vFw7n2FvivswO+k6pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=zlxgjrBE; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="zlxgjrBE"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533BgbZu010583;
	Thu, 3 Apr 2025 14:03:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=8m5hxedZPYuA8gq9KPkzlA
	oP1ev25Kezn0E2Hh0fGw8=; b=zlxgjrBE3HY+eChJOvKwqgPNoSbZyEL4kL+0vq
	64iD3ukrZJaVjDs3WN9weJKSbYhvAlXEq8y/qvpEP8QtlNeDWN6baukmWeS1WSQv
	T9d3GSr1Zfmh+isctuCbUMgYR0TP3tUZEE5cS1qLX3GU5b2ZK/Vrg3dtcTJLqxlb
	7HX96HU/h6FljGvv48g4OAVNT5hu5tk5lt2ouDjFTvr1XMDng2tl+o2LKdKSf/dq
	Gr2TwnNm7dXFdIevpNcDWoUguEMKKrvxu159Hb/0/Hsu/WO/CEBpAxY5ql4FQYjf
	nJepm5f0OJ1TCsUPyusAupJN/gfUaGVOCSCW/297XPqIYFpA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45s2cte9ef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 14:03:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9605240084;
	Thu,  3 Apr 2025 14:01:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A2BC8E3169;
	Thu,  3 Apr 2025 14:00:11 +0200 (CEST)
Received: from localhost (10.48.87.151) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 14:00:11 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: <fabrice.gasnier@foss.st.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: Olivier Moysan <olivier.moysan@foss.st.com>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] ARM: dts: stm32: add vrefint calibration on stm32mp13
Date: Thu, 3 Apr 2025 13:59:52 +0200
Message-ID: <20250403115954.1061528-1-olivier.moysan@foss.st.com>
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
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01

Add vrefint calibration data in STM32MP13 device tree to support
STM32 ADC internal channel VREFINT.

Olivier Moysan (2):
  ARM: dts: stm32: add vrefint calibration on stm32mp13
  ARM: dts: stm32: add vrefint support to adc on stm32mp13

 arch/arm/boot/dts/st/stm32mp131.dtsi | 5 +++++
 arch/arm/boot/dts/st/stm32mp133.dtsi | 2 ++
 2 files changed, 7 insertions(+)


base-commit: 65954899a157832f68536b488194cf698248a26e
-- 
2.25.1

