Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D70F1EBA14;
	Tue,  1 Apr 2025 12:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743510243; cv=none; b=fLAPLYjNXb/+ogr5sVNhsHJfoG9/rVg4pYjCV+Hn9JajRTCm1b0malZXZHPb2pSU4+BImxz9TADtuN/iNAe6HYP4Tnn0w406nAoz14vHjz52uNn08Rc8GbDMnBqVFrjNwUt2zoE21TgFOm2CvZUueIM1ZN1T6PGInEUuQhpdXw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743510243; c=relaxed/simple;
	bh=9Q98KqvJA/ktaNjA4btZsY1SHLBRzDRkvw39WcCRzP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CxRBX0gQmxY8eKhGYacff2MJdR3DznCNzLwQpXoZ3f6xeKhZ+D1GdFF/QR/XMnb73HlLYy/6tLITKL0+shFj+g/4g3AaD0ZcqWXQwhdCa+gAVB0XOPx7ZjZqlaajmo9my1M2DCDjC6L/MFqJlmXM65GrWK8G176SiegMvU1CfTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=YTUwn2V2; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="YTUwn2V2"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531B8cHM008240;
	Tue, 1 Apr 2025 14:23:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	6+aM4v81IIJ0lXB9aqI4mX4YkHUFBD7dtY0uixMWUn8=; b=YTUwn2V2Rmy9Df2T
	I4dA9j7MrfHxLvZkXkryjXRDP65ccBGfiWePeSNeyjmwMOJuEWht2sbKMc9fROoA
	4eW97tmUmw29sjsNv+xayekyKBp9LOeEBJuxJ9FrZi2Y7Xh5xkdFKT/cf+HHtrgp
	vPkypxnD8XZfLzjS3bcNELBNf+9JywvfjynG5HJafQBATCROssYFFcu/fQHYVUrd
	/qXCN4XlyHUeey6iSHVdyDP3qBOpqMtClijnke7swLsnF+lBOdXWT2iAPiiDNUBM
	8moC6ccVhFKbC0WUPHA9rKxfQk7sdPHUbRtak1U0Kj7sajuMDiUnyQCJ8xwtG7/0
	kGKIMw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45p935w9jd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 14:23:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9A64040051;
	Tue,  1 Apr 2025 14:22:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DDBC78A0456;
	Tue,  1 Apr 2025 14:21:48 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 14:21:48 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 1 Apr 2025 14:21:45 +0200
Subject: [PATCH v7 1/7] MAINTAINERS: add entry for STM32 OCTO MEMORY
 MANAGER driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250401-upstream_ospi_v6-v7-1-0ef28513ed81@foss.st.com>
References: <20250401-upstream_ospi_v6-v7-0-0ef28513ed81@foss.st.com>
In-Reply-To: <20250401-upstream_ospi_v6-v7-0-0ef28513ed81@foss.st.com>
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
	<will@kernel.org>
CC: <christophe.kerello@foss.st.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_05,2025-03-27_02,2024-11-22_01

Add myself as STM32 OCTO MEMORY MANAGER maintainer.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b7e1f9c30f3e45fb85b0d0f58b56db84d986061..830245c8d583c422e869dfe4b5a184faaf52b559 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22766,6 +22766,12 @@ L:	linux-i2c@vger.kernel.org
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

