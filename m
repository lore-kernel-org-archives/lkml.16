Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33EF281528;
	Tue,  3 Jun 2025 09:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748941497; cv=none; b=BjnRTvlB4f895CRPF1FzWbslyca4UWtv8QwLsBT/imrhcYxgUFAF5BEW7ZenIJTsSnEid6EddKDDvfvIdfipQVqLN9SjDw4acQzzw2ve16ummpSxQ/LAK8sZpMQ+6i2reSB7/mb0FR03Wgaf8ReC60E0Cmkl/f5ArnISugsu60I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748941497; c=relaxed/simple;
	bh=15WfJbsM9MIWLJVvDVE3ETZoCq7f0lcWsNmREBZd9W8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tCMJxJWb5RwcHPB4DkAInhBlzZFsXgwukS5/Mdk6+Dh3Pjh6bdEGupYInmyytTOjkraeNK6D70tzsk9GTDLeaWPJ/QZWrjkyBIqY/1GEU1dNapLWIoy/IjEYPBJz8poWdAliLN1EbCSGxK4K+gZwZnYVepMyRG/0wDaiLZth+Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=X/wjvKB6; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="X/wjvKB6"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55388UHu006945;
	Tue, 3 Jun 2025 11:04:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	BqsmLtll0RdQ6R1NoZ+5laIhIOqbT81HDIchGbSKfvg=; b=X/wjvKB6yk9AgSgM
	mLeDDb2fYpYYtS4V5AyCq9CWqhkDNTqzcR3c0jsZSEd9cLSXhe0n/nCcnxvtqvr0
	pItdicnuiw/wXO9VrAdcTzSQxnyReG4RTXH2Fvhp2VtgUiyDzHrImR8ngzVYynMP
	ZwDLypYdqlotRQtRc4cHy9nf0oLh+u/7bZg/aOM9qOU9CnpsqtuACJrDI8wKlOQS
	0VEbKYK0g8ns2hr+wfdngJe/Jo150/r1Ay2OX9uDLfwZ6HoDpw9H+qaNmeSeDRPG
	54lmCu4++F9MCffbvi/iQi1y4oL9w5WAo5ui+mARO/ir8Zj50Uys3mpItQuZCspS
	tjGyTA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g90ay76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 11:04:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 887A840060;
	Tue,  3 Jun 2025 11:03:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D8E766CF2B2;
	Tue,  3 Jun 2025 11:02:35 +0200 (CEST)
Received: from localhost (10.48.87.237) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 11:02:35 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 3 Jun 2025 11:02:12 +0200
Subject: [PATCH v2 6/7] dt-bindings: arm: stm32: add STM32MP157F-DK2 board
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250603-stm32mp157f-dk2-v2-6-5be0854a9299@foss.st.com>
References: <20250603-stm32mp157f-dk2-v2-0-5be0854a9299@foss.st.com>
In-Reply-To: <20250603-stm32mp157f-dk2-v2-0-5be0854a9299@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>,
        Conor Dooley
	<conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01

From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

Add the "st,stm32mp157f-dk2" compatible string to the STM32 SoC
bindings. The MP157F is functionally similar to the MP157C.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 408532504a24d5e570c738b16de30dcf8deead6a..ad144c02eb7edf4fc2191ab0af244342dcaa59d5 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -121,6 +121,7 @@ properties:
               - st,stm32mp157a-dk1-scmi
               - st,stm32mp157c-dk2
               - st,stm32mp157c-dk2-scmi
+              - st,stm32mp157f-dk2
           - const: st,stm32mp157
 
       - items:

-- 
2.25.1

