Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834EC14A62A;
	Sat, 12 Apr 2025 05:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744435651; cv=none; b=Sjfbsr1JfV1PQlbaqOFAAAsqzZ9UCrYlJeH1STekGjhohw8jMAu4beOpoFS74ytQIlwYxnxUjiiGagKw62r8isZnrv97Mn1owBxi6BYI63V3RjFL4R2Q8G8qoGAGUmIUk2nccjVQJlSIHo4MV8ccVfPopuNQezngqrRFkLJgI74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744435651; c=relaxed/simple;
	bh=zkvzYebiBzBS3Get6P3RaFDuvlQZ62vQh8rk5pTc6ng=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eVoy0vVv/WajfasTg4C1ri8vEwxcP1T2iTYiZz6LTonS6PVsXMSvnVKF/2IuLbz02MCpy8E8/vWos5kWCFWWkJVbDoEa7sRWMXOFI14alHbXu2K8cyPhWvzaoaIDKHLCj5L8zObPk5YFDuYlT0vtAsQLO03c6q9mEhN3N+v4aSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FIfi1hs/; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FIfi1hs/"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53C5RKKY1613848
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Apr 2025 00:27:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744435640;
	bh=CnT9MxsvWv9TvC83CCl7GaR17zDfazPzlImDwFTNB2o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FIfi1hs//YjW5MazA8AL9XWEoD91VS6UPS+9dgAyko2qpt6Wgy8PqFwxa9my2CkXs
	 gSJVD9c8QY4FCpziuhGDKc7phND5GlMMl/Inmc/G9bb4h9NtZrTLrS5x10k39bx1fb
	 qWLQJhiZJf6IM603/GjuamhcTYQdbsL3pUkcuLAE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53C5RKOR006750
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 12 Apr 2025 00:27:20 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 12
 Apr 2025 00:27:20 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 12 Apr 2025 00:27:20 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53C5RCVS121011;
	Sat, 12 Apr 2025 00:27:17 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 1/2] arm64: dts: ti: k3-j722s-main: don't disable serdes0 and serdes1
Date: Sat, 12 Apr 2025 10:57:11 +0530
Message-ID: <20250412052712.927626-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250412052712.927626-1-s-vadapalli@ti.com>
References: <20250412052712.927626-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Since serdes0 and serdes1 are the child nodes of serdes_wiz0 and
serdes_wiz1 respectively, and, given that serdes_wiz0 and serdes_wiz1
are already disabled, it is not necessary to disable serdes0 and serdes1.

Moreover, having serdes_wiz0/serdes_wiz1 enabled and serdes0/serdes1
disabled is not a working configuration.

Hence, remove 'status = "disabled"' from the serdes0 and serdes1 nodes.

Suggested-by: Udit Kumar <u-kumar1@ti.com>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch depends on the following series:
https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
as indicated in the cover-letter.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index beda9e40e931..562dfbdf449d 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -52,8 +52,6 @@ serdes0: serdes@f000000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			#clock-cells = <1>;
-
-			status = "disabled"; /* Needs lane config */
 		};
 	};
 
@@ -92,8 +90,6 @@ serdes1: serdes@f010000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			#clock-cells = <1>;
-
-			status = "disabled"; /* Needs lane config */
 		};
 	};
 
-- 
2.34.1

