Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E07292928;
	Tue, 15 Apr 2025 11:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715952; cv=none; b=dY9fpcNjLeOmCyy4jKBTuED6Hym1NqTZR/r46c+nwaxOfnc6gh8Wys93xw7epvX5iUPkH7ot4ZYLn0pU7SFyv1M8tQE9CgB8d6cE7E2GamuIcm9Qt66yNR+2U40kra/HPt3uAfe+IrlNBoZQLZeIzv5bvpM5e1nzpD7VGK30Z8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715952; c=relaxed/simple;
	bh=AK1CuzXFXZEoDdcQTxxxti2oixvCdbLZgLGX7/FLE1Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cwIpUqfHK3SC9aXVoHjWiBOSA0lLUXUgClVynm8nez3G5R0ssKAf8fN3U9JVNSQZwvzDMIkLaBKhAtJZN6gBDS/wNTWy7FbImkFq8aPgJAfWwJ6cEkfXJbMJ4+wdsue0RT8j3AWW+QoSuhn4eeyuBVfw6eJLyk/zguyvj9dIlQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=cod8n22J; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="cod8n22J"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F72Q0a021604;
	Tue, 15 Apr 2025 13:18:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	8uCnm0EMQjNm1h5+L8Dhq/0jgdfQ1th5txaTffecQEY=; b=cod8n22J+Ng621aZ
	u9PIqF5ftCR1vJYTJEoY6TmgoVjn5wnWs8zKFcLfJXDTxIT0ybZ83C39+ZzY/xm5
	1wauxcNOSw6nT3dI6x6MdPGxZM0sJ/+LtUdr0t/uqXmu/bdGlP7VeIoPFGuOa424
	+zp+JWHpbqrhAoQsjqE+dOeYdJouXeM0Ug77fuOaNuoQODIT3kMENiDDZb27hTck
	9XBhuj12bvioKeO80/XERumKJ9OOq5ghVSes+jGw4Ra357Mpptgrq3k5G9MXQx0t
	7SWk3NYQNZptnkgbp9/GzbCU9YVIa0JJBc9LfNfRJbFLWD5LHSsweSjj4104VuP/
	sYHTNQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4601r4aqe4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 13:18:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3704D4004F;
	Tue, 15 Apr 2025 13:17:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F4CA985E9D;
	Tue, 15 Apr 2025 13:17:12 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 13:17:12 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <maz@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH v2 3/6] arm64: dts: st: Adjust interrupt-controller for stm32mp21 SoCs
Date: Tue, 15 Apr 2025 13:16:51 +0200
Message-ID: <20250415111654.2103767-4-christian.bruel@foss.st.com>
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

Use gic-400 compatible for aarch64

Fixes: 7a57b1bb1afbf ("arm64: dts: st: introduce stm32mp21 SoCs family")
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp211.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index 6dd1377f3e1d..52a8209471b8 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -116,7 +116,7 @@ syscfg: syscon@44230000 {
 		};
 
 		intc: interrupt-controller@4ac10000 {
-			compatible = "arm,cortex-a7-gic";
+			compatible = "arm,gic-400";
 			reg = <0x4ac10000 0x0 0x1000>,
 			      <0x4ac20000 0x0 0x2000>,
 			      <0x4ac40000 0x0 0x2000>,
-- 
2.34.1

