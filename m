Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9428F26FD9F;
	Tue, 27 May 2025 13:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748351147; cv=none; b=uy54Z1duKv6i0QQ/3y+6WH2otYKzC9iZyPr+7Frzn+FBZrTatdnIHixTHSQHXWv79dZvSiD6KLGgBb7xQVU1H0RNLLs0SdZL2/d+rFCqRc3/2h6O+ghkGlxrw1Vmgyv++VIoO9cqh3wLWqAyxSm1hsjfPPH7vkozmx1bEjYBGuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748351147; c=relaxed/simple;
	bh=tfK2vFYXbubmVMowBTPZzLi7dGOBSxcbDClqW03nlnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Y/y344JBsBR7UZzDIapJOxYHSFo0yWb98ueTRwrW/WyGFcT8IbqzwuEoxwnCstD9mpspGdMZ64XKmVE4WhsbhZoq7KVKt4TXX3y71aFJGJkWhEkXFzTlzZWnp4GdEc+1zMOTN8BV1+zbdKXcWv4F0WFlizFisN6B4Su73Fui4I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Euo7B2GK; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Euo7B2GK"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RCaRqv028208;
	Tue, 27 May 2025 15:05:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	U2k4Kt+zguDD1NIcj7jjrhOaWN1xKwqC+/1mHTke1NI=; b=Euo7B2GKs7ey3ZQB
	A+k5TZJu/4mO6iuvjFXFp97E6vGjqkybbPgXx/u3o/1Y96IBhxChqb4hu16ZbB4E
	Bo2F15hyBVqro4eLdcxvFI48jzSJ5T3SPeGp60bVDkDY9Lk50wWJ9m3hizoIj9gZ
	8EUvtaebHetSqs00lqaopCMshJSIP5AdVWXPBFYpwiuajSlLPzADn6m9GQpFkXWb
	S8LRSuF2NN+cmR/1lwjDPXOsRvIo3mFqHYfyvmnnHQHtm9HXWmV8D5K0feoyGtS5
	YJgt48suOKMWZHPRS7/NW6z+QgKWAz37exo7JDcVtGhkhT/azrOAfvG+oqEM3Pdy
	6AjdkQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u3hk4edh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 15:05:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0EC0E4004F;
	Tue, 27 May 2025 15:04:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 48C18AE0788;
	Tue, 27 May 2025 15:03:48 +0200 (CEST)
Received: from localhost (10.48.86.139) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 15:03:48 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 27 May 2025 15:03:18 +0200
Subject: [PATCH 2/5] ARM: dts: stm32: use 'typec' generic name for
 stusb1600 on stm32mp15xx-dkx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250527-stm32mp157f-dk2-v1-2-8aef885a4928@foss.st.com>
References: <20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com>
In-Reply-To: <20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01

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

