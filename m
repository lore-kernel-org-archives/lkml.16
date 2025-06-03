Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836C2281366;
	Tue,  3 Jun 2025 09:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748941487; cv=none; b=a0C25Ax6G3kCXlzyGyF2w2hNJlJQsozXqRxOI33E2PQD/bO7fyh//tzpcU+1nglV03kkhODN1uqTJxEk2fKmGqXAif2dQmkBBXuPVMlW/nyo2IvtBGQQi2NRzBuTi1fWCjBBY4jhM+7onoQIEuhMc8ZnAe/06Z6KIKsB8xcK30k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748941487; c=relaxed/simple;
	bh=tfK2vFYXbubmVMowBTPZzLi7dGOBSxcbDClqW03nlnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Xvr71kcSo74CDecxvjTdvYoz8DGm34tfsH/Wuj0qCQKw316pxZAiXlats1sKo9UKhU+DWWtFCi7/GCHid7P2B0iYluhHTR1/quKB3T1xTb3Ok5kvApgijPDRRIM2ZTpWcepnCTuv+gjFcjkWhAbj/IOgH12HrhGjMbLvrrBiSYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=g9+2raUN; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="g9+2raUN"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5538lLnp017178;
	Tue, 3 Jun 2025 11:04:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	U2k4Kt+zguDD1NIcj7jjrhOaWN1xKwqC+/1mHTke1NI=; b=g9+2raUNK7Qpjjsi
	64z9/MQ/pvsvQrEZVHvh5sR4AW8z5F/bvrejgXpP2gDdpIZ6SDOhuRSJFqNK4675
	URD4Ncnp/2mrLUOjbni7w05XO9q90ZWxlTlfygxDTwJPCwPIE2FMKY4D+ffWWLNM
	+2cIuCpb8oc72hwa+WztipISRBl7zcXW+yHqpeGgs0qaxqBLAMCK75Qh6cDWaNXZ
	cUWLRDZa6oCBXPLx/8JnDFWePcK0h8GizknAzZO1l9YFBvM0J+1CW6UgxwNA+YGM
	2fKSR1fiEfjU5sYC3BtMz6ooQhRpx8v11eeoLhMPloKvIO5oQRT/Cf5v9rG6D23n
	jIpvcA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g932uv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 11:04:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 901A140081;
	Tue,  3 Jun 2025 11:03:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DE1E96CEEDA;
	Tue,  3 Jun 2025 11:02:32 +0200 (CEST)
Received: from localhost (10.48.87.237) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 11:02:32 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 3 Jun 2025 11:02:08 +0200
Subject: [PATCH v2 2/7] ARM: dts: stm32: use 'typec' generic name for
 stusb1600 on stm32mp15xx-dkx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250603-stm32mp157f-dk2-v2-2-5be0854a9299@foss.st.com>
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
	<himanshu.bhavani@siliconsignals.io>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01

Adopt generic node name 'typec' for stusb1600, which is the USB Type-C
controller on stm32mp157x Discovery Kits.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index a5511b1f0ce306feea5d8657721b078161d01a36..276ed2c9be71cc59891e9b06cb057ce4ff8a143e 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -254,7 +254,7 @@ &i2c4 {
 	/delete-property/dmas;
 	/delete-property/dma-names;
 
-	stusb1600@28 {
+	stusb1600: typec@28 {
 		compatible = "st,stusb1600";
 		reg = <0x28>;
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;

-- 
2.25.1

