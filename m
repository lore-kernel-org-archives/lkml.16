Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5812153D3;
	Wed,  7 May 2025 07:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602884; cv=none; b=KZDqivyTx1WPMJjpFmYlSsqJDKNrKzpCtuUcHzsUEQR7rjs7xwmBkeCVEDBbMt8jioT58ReDjwR5NyxD//p4ZxjWRwCaRxJu2nPHZkC2jtfUa0wQ+QLEAkIXCC89bhu27d1CylhAYVvBPv+4BfMoFEbOAECMUi2pvnRDCSXJpK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602884; c=relaxed/simple;
	bh=quCNk1faeQKjRAEpgmno53rSVnZoYWSifrHmScTLPzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LaL7tRQK4XKjXhqL3qeshgbxmDNiQMRyj41BkgVdA2t+AfjFFqbMNMMsiqq2SYcUHAMq+2vWlrWieUpFM6u0+bqDS4sRMR49fHwubOauIAu7WML42x5dslrUGm8T7u6oQvOEPpz/DxsxkZVEkl0Eu9bCk+qSq8h0JCNX+2rjMPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=V4/Rzx6a; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="V4/Rzx6a"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5476weVZ030426;
	Wed, 7 May 2025 09:27:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	hJlHhbxitP8LDlQxS4M+ZJIc/lDJOqTIWiKvF63v4os=; b=V4/Rzx6aYv+LIW4k
	l0W3mmOIrli4D/c2XwYBWzy1bCnrP9yae1/b++EtrKL1JpaissS0KnR1Xy1LuR6Q
	m8gnEKm5caOV5DH80JihyXgHrtjFFKZ3n9RA9HQj/1MDBEG6G2n6bpEu1Gzm1jWG
	TY5NdzP2RlXem79EwyAAsSLMb/YhWt8gRM2UyKpBW502Qd0DV1/R5Ql9RV73A+OP
	lGXpEP/s8/ZgOuNbQmjIBXyvZJKoPatfKXu8lHPqxiadImC49BBdjDOuMSXVdPAS
	85DeCZpxtyyUJS+aUAMFFLabB5ECeUakyusZ31Ffn/2q+1LI9VQVPYjfjBqEP+jU
	faXprw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46dbf3eprn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 09:27:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 61CAA40057;
	Wed,  7 May 2025 09:26:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3AAA2AAE37F;
	Wed,  7 May 2025 09:25:19 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 May
 2025 09:25:18 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 7 May 2025 09:25:17 +0200
Subject: [PATCH v13 4/4] MAINTAINERS: add entry for STM32 OCTO MEMORY
 MANAGER driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-upstream_ospi_v6-v13-4-32290b21419a@foss.st.com>
References: <20250507-upstream_ospi_v6-v13-0-32290b21419a@foss.st.com>
In-Reply-To: <20250507-upstream_ospi_v6-v13-0-32290b21419a@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
CC: <christophe.kerello@foss.st.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01

Add myself as STM32 OCTO MEMORY MANAGER maintainer.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b82704950184bd71623ff41fc4df31e4c7fe87..32abd09c0e4309709998f91882c7983d1b53a80c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22881,6 +22881,12 @@ L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/busses/i2c-stm32*
 
+ST STM32 OCTO MEMORY MANAGER
+M:	Patrice Chotard <patrice.chotard@foss.st.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/memory-controllers/st,stm32mp25-omm.yaml
+F:	drivers/memory/stm32_omm.c
+
 ST STM32 SPI DRIVER
 M:	Alain Volmat <alain.volmat@foss.st.com>
 L:	linux-spi@vger.kernel.org

-- 
2.25.1

