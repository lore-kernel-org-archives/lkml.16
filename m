Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D84292926;
	Tue, 15 Apr 2025 11:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715951; cv=none; b=sdniiZGRcrrv6holtQwJN4sK97GhQgiQkl1HumZU24TVlagF/1UvJoeqG0sX/oToxp+GAQOFkX2qAmIS9jub1hrX4FZovVewZUEIuid2IoM/iLfkx6rgYZ5aL2a46W/VYimVZsAT1qnmo/Zy/hPyuWlzjqYKhYHLQ0nlsPoL/xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715951; c=relaxed/simple;
	bh=3FEQn9pdx3rTfTXp4lu8m61whoJlpJ2IYTpRR5tSsso=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y/T9qzwgVR7cZcj6niqWQohRcdhcQ/lxWuTHcZEKkAUYvsSxq2oStyuR0d2VW4+/HpBYqWxWLLb7kIAyycQ2kt82WgUCozt72YFBNS359jHvuvToeKCEc8zvh1/TvA1fZVoOiGAflwBG4SMndSEGImhbRIMGAeN+sTSG7ajv/hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=qWLvaPMA; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="qWLvaPMA"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F7RY1A002730;
	Tue, 15 Apr 2025 13:18:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=hVtqs8Vv0HUnb0Ez+Qkit5
	ofDEeHme3L4CqxhioE4KQ=; b=qWLvaPMASIBb6v52ZYZUcHFERdRS5LH/je/muW
	XUFNmbk9ZnPCw89gAYB/wwPEr3j2lWBGzO2xuEfK2ssQI39syGPDJtkzjk2jO7B9
	kmgc2S1+6l/dCI74xoApm5TOBXhSbsCnr75MUyDr433ygwPrvjTwzhJ9ezn1Cx/8
	eaD1iEZRsQMHXm5kCAR3xNMAb/F6EBpXlmSbG3vE3muq4mgiD8/ajRuhkW/9DFms
	wngLUDLSyYaWgzGKgF8CvMltgBPqy5Onf8B/Ing49w1me/YyvIhxoRgJrnAJ1lZb
	ZWvtLuRVgDXf675AhQJ/KSJ3dkq/Sjodh2JXfLi1OZNmAtUQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45yfh1vvwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 13:18:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0715040049;
	Tue, 15 Apr 2025 13:17:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A08D96F1F27;
	Tue, 15 Apr 2025 13:17:07 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 13:17:07 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <maz@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH v2 0/6] Fix interrupt controller node for STM32MP2 SoCs
Date: Tue, 15 Apr 2025 13:16:48 +0200
Message-ID: <20250415111654.2103767-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01

Fix GIC compatible and register access for STM32MP2
This serie replaces the original stm32mp25 patch:
 "arm64: dts: st: Adjust interrupt-controller for aarch64"

Changes in v2:
   - Apply fixes to stm32mp21 and stm32mp23 SoCs family

Christian Bruel (6):
  arm64: dts: st: Adjust interrupt-controller for stm32mp25 SoCs
  arm64: dts: st: Use 128kB size for aliased GIC400 register access on
    stm32mp25 SoCs
  arm64: dts: st: Adjust interrupt-controller for stm32mp21 SoCs
  arm64: dts: st: Use 128kB size for aliased GIC400 register access on
    stm32mp21 SoCs
  arm64: dts: st: Adjust interrupt-controller for stm32mp23 SoCs
  arm64: dts: st: Use 128kB size for aliased GIC400 register access on
    stm32mp23 SoCs

 arch/arm64/boot/dts/st/stm32mp211.dtsi | 8 ++++----
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 9 ++++-----
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 9 ++++-----
 3 files changed, 12 insertions(+), 14 deletions(-)

-- 
2.34.1

