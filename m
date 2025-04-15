Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FEF27B51B;
	Tue, 15 Apr 2025 11:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744716003; cv=none; b=T79FfLwlElXuLLzwtxpwAlt4DqIXoq0Nh7Qxm/R5wdXFn5Z40RJIXbyhIzwoto0KAWexW67PhNOHYsmMsRYk+dgdeIz3mHAd5onH4ED9OsOT7Y4TrCNqMWHFyuIZnkzyHoNrQy8HdMeGA5I97u21RB4DNIeUTSFNVSOU+efg8gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744716003; c=relaxed/simple;
	bh=vJet5eXHKscSTCir5pP/v36BvWMvi+Mge6C98sKtWF8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uq4mPWs0W2nYF61TPbmnnMwg3oyx3pyugFvoZAWQtyhE0Eq0mYlmDiHlShJWILnmNhl4V7PBVS2ciFcVCKE5q3zqJIe+7kjd+i3iqcbd2CLWot8OpniZGyB/bp1LwX9t4xsrRdS97fI2Jooy2WU3mNTwjPtPJ/c2w8sIGuJGAgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=J30kttT2; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="J30kttT2"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F7B8LD023886;
	Tue, 15 Apr 2025 13:19:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	0SdfsqttsoqnkLSHVYtLWqH4z823DOc7YuHAnk+opa8=; b=J30kttT2slNxBEwv
	MQO3WrONweQqnYGKj5HLOZCzOThC/pR1GqTGFx7BaablaoPWGbd1rL6ssFYB14YN
	tEDDhbw2MgVj7hkEoAzVV4rfN4JPz55B7XtsY6PgX7oJMlDrp2ZFFN/8B0CAbnvm
	kR8VuOPq03JwNxl0LQRcnuQouamGpF86pA8LSe5JH8F5KvhWcNoFXhnaCn0FFpnR
	MpSfigxurjLDvx6y6unFSU+wRaTV7t0PG7SFZiUnJ9H3SwzjXga9kynmOMP0m6UK
	RWha3LuMJWFFyBXL2LZS42xe/9HyfnbHW9RqV0zw6ne6OiEBTv7TvVv1AddPmvqE
	Yqjg/w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45ydkmd6m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 13:19:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 77EB24002D;
	Tue, 15 Apr 2025 13:18:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 210CC9D22C1;
	Tue, 15 Apr 2025 13:18:18 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 13:18:17 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <maz@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH v2 5/6] arm64: dts: st: Adjust interrupt-controller for stm32mp23 SoCs
Date: Tue, 15 Apr 2025 13:16:53 +0200
Message-ID: <20250415111654.2103767-6-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415111654.2103767-1-christian.bruel@foss.st.com>
References: <20250415111654.2103767-1-christian.bruel@foss.st.com>
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

Use gic-400 compatible and remove address-cells = <1> for aarch64

Fixes: e9b03ef21386e ("arm64: dts: st: introduce stm32mp23 SoCs family")
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 8820d219a33e..3f73cf1d443d 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -1201,13 +1201,12 @@ exti2: interrupt-controller@46230000 {
 		};
 
 		intc: interrupt-controller@4ac10000 {
-			compatible = "arm,cortex-a7-gic";
+			compatible = "arm,gic-400";
 			reg = <0x4ac10000 0x1000>,
 			      <0x4ac20000 0x2000>,
 			      <0x4ac40000 0x2000>,
 			      <0x4ac60000 0x2000>;
 			#interrupt-cells = <3>;
-			#address-cells = <1>;
 			interrupt-controller;
 		};
 	};
-- 
2.34.1

