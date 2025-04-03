Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BD824BBF6;
	Thu,  3 Apr 2025 12:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743681813; cv=none; b=os6WYIuJBdQPjhAUFNi5lhVH4CLXq40bro8zoA1gxak+eVmbm2R7J1Tnb/lkFJqiwg/5CzqJrvjHU19evv94uXzlnx2gmGZzZuRLL2LLNQOdMLlxv/a+vxDsbbujpGDwKgsJZsN8A0V750nwHw85lrE+jwmsR8EfhGxVUbkUJKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743681813; c=relaxed/simple;
	bh=az2Qux8EuEl6zJujC01wHUk/kJPwlJmZNuB5E6KcJC4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cbCGneelJvoOYsmzpSAuCUMFyeihRpFtxSYfiUO/r8zrCyjpKewPvvAyhkASaEgoNeQm/lMC2+26ey9d4kSRzX9GEwYpGmX8zYTPOX1gvMgv8DRpJYEYqpCOfrI7egUd2XXk6WJB1CxpR1V3jG2PmSN5t90B9RN1807fjp3e5XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=fmgdhuOA; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="fmgdhuOA"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533BhN16024322;
	Thu, 3 Apr 2025 14:02:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	jE/f+A75h9vw3QQPDkFAG+6fnAHISqE/y2SZB6E3XDY=; b=fmgdhuOAs0hMIasm
	GcH0g4okvOMJV5hcHiviCFHBLF3UzNbCCLdgbbVUTU2w6AjsYinYxl7fibTnnehb
	284oUALSG5ImeCFSsY+C7MlnpeMSRglxP9+bfNSibGMUQi81N6VT0473gdBhmmEx
	uXFTWIQoPh2FOsa7VbIKxJCWfhRhsbauuDZRG9RRM3VhofQshNgAIVa5F4phyW4A
	42oMQZkebtiGUMIIi13+V0Bx/FpNCWa2cDu+8zk5PlPDq6Nox3wocQochWVhnF5Q
	lj6Sci8hkFdQf9XHFmal/OHPeoZbpc6xZ4a5fg+5GrZgsIOPEnFfb3uD2PweTOD6
	QJ7vag==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45s2c7ea49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 14:02:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 95B4740083;
	Thu,  3 Apr 2025 14:01:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C1A18E316A;
	Thu,  3 Apr 2025 14:00:12 +0200 (CEST)
Received: from localhost (10.48.87.151) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 14:00:12 +0200
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
Subject: [PATCH 1/2] ARM: dts: stm32: add vrefint calibration on stm32mp13
Date: Thu, 3 Apr 2025 13:59:53 +0200
Message-ID: <20250403115954.1061528-2-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403115954.1061528-1-olivier.moysan@foss.st.com>
References: <20250403115954.1061528-1-olivier.moysan@foss.st.com>
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

Describe vrefint calibration cell to be retrieved through bsec,
on STM32MP13x SoCs family.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index 8512a6e46b33..3cc5623d52ca 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1018,6 +1018,9 @@ part_number_otp: part_number_otp@4 {
 				reg = <0x4 0x2>;
 				bits = <0 12>;
 			};
+			vrefint: vrefin-cal@52 {
+				reg = <0x52 0x2>;
+			};
 			ts_cal1: calib@5c {
 				reg = <0x5c 0x2>;
 			};
-- 
2.25.1

