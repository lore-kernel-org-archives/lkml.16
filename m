Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438BF78F45;
	Fri, 11 Apr 2025 20:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744404002; cv=none; b=pNv1dyZL4mABKU/5WUw3M+ZqcggWMAMiJa/kZ38ONAftZtkaBtd0j8zNdloxRDONcNA18ET+ZIzxCSeXeOXuafo1HUo+WNh8E/A9QfaIeb7jcEHVTAekoC6cI2gdXhhu5j8qGymGc++hoNZe46miIOsoEhQtL+mEZ+/kpZ83QGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744404002; c=relaxed/simple;
	bh=Gb7+rQZylHexPLfPVg0wOaXxBH4ap5Ib4yZV2uci4MM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E/gwJMnvnZ/UgZhZZbBE+SdanMLEKLqMIQc1MBihK/X++mtKpC32yz8iM2nWMw5jRmSwYLRmDM+cqynzEtHCYN2yLzmW+kf9QNM0TwPceHTnSTGWE9rYPPj1berkuud2q9EcZGaQKfBniSMXVARQWVAjF7VKSzp+cVK9FzjybOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=glMI/ezE; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="glMI/ezE"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BKdqV01656208
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 15:39:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744403992;
	bh=hOmi94CwEA715ZAOzg9DxMrScwf/c4xhyVVMxCeC+aM=;
	h=From:To:CC:Subject:Date;
	b=glMI/ezE3ujz02cssORcqwu2dz/Opdfuw2OBQibw5sSkZq2m3CXJAJ472YHWKEVqP
	 o6xYbo/SOjFiiTK4VDG/e6nB/tKiQ5+w2yf3rweOo98bAh8FpS/yFScmBWnUYUnSJd
	 jw8rocCxZn74O1xlXV3t3ENAzItQgsrjQ8nzht7g=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BKdqvc113039
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 15:39:52 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 15:39:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 15:39:52 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BKdpkJ095890;
	Fri, 11 Apr 2025 15:39:51 -0500
From: Nishanth Menon <nm@ti.com>
To: Jared McArthur <j-mcarthur@ti.com>,
        Robert Nelson
	<robertcnelson@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
CC: Roger Quadros <rogerq@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Tero
 Kristo <kristo@kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-am67a-beagley-ai: Add bootph for main_gpio1
Date: Fri, 11 Apr 2025 15:39:50 -0500
Message-ID: <20250411203950.2859356-1-nm@ti.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

main_gpio1 controls the voltage for the SDcard from 3.3v to 1.8v.
This is required for proper operation of SDcard through various boot
stages.

Fixes: c5e615963bbe ("arm64: dts: ti: Add k3-am67a-beagley-ai")
Signed-off-by: Nishanth Menon <nm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index 9be6bba28c26..bf9b23df1da2 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
@@ -309,6 +309,7 @@ &cpsw_port1 {
 };
 
 &main_gpio1 {
+	bootph-all;
 	status = "okay";
 };
 
-- 
2.47.0

