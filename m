Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142591F0E20;
	Thu, 15 May 2025 13:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747314870; cv=none; b=rXUyWNL5MdMKCyT2KK/29oiZ/QO6Dglnw9DXi7mv/gk7NOmOBq4gaIYTq737nMPs6sE/uy5kN91v3w7Mms5F8+3Uioi7gVG+gwPsB8MdlWtfvy1xC8GhRjRgkJwBZQfMWpAhoUzaeAasaN7vZdTUZ+dLo6wbydPyLxUbsZ4+Jr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747314870; c=relaxed/simple;
	bh=tDVIzqyabDievvIYkMS0sbufd/l/EByy2cvQaN9+QVM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fvHtniJ6FggPn7HcsTAkLYZwXFsEofMuptXA+r9zr4L/saHx5MAiP5o8nNAKHXDGY0qcyKTw3OWIQ/SqoUj9U/2S9C6JOHE4kejbUm6vzL+7cFTUwtYqxj15T3BieRW9nAyuMGhXs6s4MOFRh6KKFnmmxbC38fRewzQWcF6iAkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=59ashyF+; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="59ashyF+"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FBPdNk029562;
	Thu, 15 May 2025 15:14:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	NAS7AYYGOitchQOYiqBu5iY1SE87tPP2eKQTXou91Jg=; b=59ashyF+2iD+hePr
	R3yKnaygAXOQpabwxtAhNakxQ1T8vgAQHfDhS3vE9Fn7VFsMB4ktna8VU5+YQM6E
	jrYf7U9hlb1+EcKNnJ48P0XtcNBBTO2YWwzEMNh/p7ryz9Gc2SfrsFCuCyXt5lsH
	hiGW67INgmCe4ouNmluz9gDwwP7Akb8LlvQOtW/MXOo6xYgV20cjhTZPrGZ9rPrw
	JRfmd0dISjUUcwuFFQFLq2FWAUoHr+I17cohh5DoAetJ3sBVA6mz0VVK2pGerlrB
	MyDEf15mMPHZuHqmrHf7caBY7uxPFMT/BTFBCivAHX0kA1faFaPd4UXkBpxS4W0Y
	IfNpRA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46mbdx8spt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 15:14:15 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4239240057;
	Thu, 15 May 2025 15:13:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7DDC9B3D254;
	Thu, 15 May 2025 15:12:44 +0200 (CEST)
Received: from localhost (10.48.86.182) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 15:12:44 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: Patrick Delaunay <patrick.delaunay@foss.st.com>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH 2/2] arm64: dts: st: remove empty line in stm32mp251.dtsi
Date: Thu, 15 May 2025 15:12:40 +0200
Message-ID: <20250515151238.2.Ia426b4ef1d1200247a950ef9abd54a94dc520acb@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515151238.1.I85271ddb811a7cf73532fec90de7281cb24ce260@changeid>
References: <20250515151238.1.I85271ddb811a7cf73532fec90de7281cb24ce260@changeid>
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
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_05,2025-05-14_03,2025-03-28_01

Remove unnecessary empty line in stm32mp251.dtsi

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 74c5f85b800f..5d54be027254 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1495,7 +1495,6 @@ gpioz: gpio@46200000 {
 				st,bank-ioport = <11>;
 				status = "disabled";
 			};
-
 		};
 
 		exti2: interrupt-controller@46230000 {
-- 
2.25.1

