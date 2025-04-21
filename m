Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0C721B9F2;
	Mon, 21 Apr 2025 21:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745271996; cv=none; b=MgZDrVp4BhVShtFXl2HReDejZ+9k6tHUmLaPxx3oJVF3223z6qaexg8e9OBIsIA3mJEO5XUZSIJMT8xVn6g7PD4LAnXb439WKeZ6ybc0jT+hGDR4jgdPK3R0o/VtOJJ82OtLaORdLEPaMN68SLNq4wdqZQSgluXHoDb7BxdJqx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745271996; c=relaxed/simple;
	bh=e0ZqC6Nn3HeIDnozdGIzF+RsmezvmFpIsQvxOpkiJu4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FzrRI53Q2DIOGi8QJLK3MevAR2AkYVx5DRFffNFeN2tlS1a21k5IbE4quS6XfhBEBz/ckGwpNq+qUH0Nr719wYHyvVqcxexOqWPokBj2SJlPm9ZyEMQ/nkaUZbjSHI0H6xBUwUgTs9U9whaj7OjFrXYeGyOp4+lJr1ORjtQzo+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aWJRR4Y7; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aWJRR4Y7"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LLkN3H1015468
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 16:46:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745271983;
	bh=lGttv+NBrT9eqq/71c1noEG3ZN3neG1td+1SdEjXLm0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aWJRR4Y7YhjWDfCvYM4HA1PzHuj9NOxiKvIhPP4Fb5NS/5Lu6g/tF/KzZT/c5Mvs9
	 qU1OBcQ10TwrAYqf+sO/DIW7FSk2mQu0OdJUrcv8lq9rgVMo6yT4LHR0//MnD4Iraw
	 K+ywypdNQyjX4ay8/+DThEF2Le+IFkFLlfFn5bwI=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LLkNVD118850
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 16:46:23 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 16:46:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 16:46:22 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LLkLqM038764;
	Mon, 21 Apr 2025 16:46:22 -0500
From: Andrew Davis <afd@ti.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Jan Kiszka
	<jan.kiszka@siemens.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 2/3] arm64: dts: ti: k3-am65-main: add system controller compatible
Date: Mon, 21 Apr 2025 16:46:19 -0500
Message-ID: <20250421214620.3770172-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250421214620.3770172-1-afd@ti.com>
References: <20250421214620.3770172-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Jan Kiszka <jan.kiszka@siemens.com>

Now that the TI K3 AM654 system controller bindings also cover the usage
in the main domain, add its compatible to address dtbs_check complaints:

  k3-am654-base-board.dtb: scm-conf@100000: compatible: ['syscon', 'simple-mfd'] is too short

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Andrew Davis <afd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 94a812a1355ba..6d3c467d7038c 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -479,7 +479,7 @@ sdhci1: mmc@4fa0000 {
 	};
 
 	scm_conf: scm-conf@100000 {
-		compatible = "syscon", "simple-mfd";
+		compatible = "ti,am654-system-controller", "syscon", "simple-mfd";
 		reg = <0 0x00100000 0 0x1c000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.39.2

