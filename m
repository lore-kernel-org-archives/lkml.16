Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5321EF0A9;
	Fri, 11 Apr 2025 06:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744352077; cv=none; b=c2dwKgUPj5HGSiROWwviRrjbRy7GKqUOHIbOqK2gjJU84lTbR02EQ2n7eaDEVVjuYkGhooL/6/57y9yDmv/2q6WxWHqoS+QATgNWAAy/v1oEL1cNrydlovwEZfSfUtnVcpPGZmNpZrDaYkQfNPvZq85ebgr7GJTM9cS03JuTbFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744352077; c=relaxed/simple;
	bh=6Pz6qbZUB9jFFWb2hChiEIlNWXnhLRv+znDSnhvmRGA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RAqH1f9pYYrwePFtYV+r5Ka9X/+KVvCDG5OdO8p3xv/v9p6PIlgRw9u7NUhC4Dy4/ZKBIL9wWpx82CAM4CcVffHlTQA0PCZyIKLb5uA4rvAEwCiGVdQrl77kdqfpQYEPyZX2eFqgXnVTb50VCUxZAr8MW7sa/oQMlOs02pkP0uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=a8nbw4Xi; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="a8nbw4Xi"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53B6EUEX1494544
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 01:14:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744352070;
	bh=UvWjqBEy/nSwJWz3Cjfu0A4a0HNM2atj88S6PzvyLWs=;
	h=From:To:CC:Subject:Date;
	b=a8nbw4XizWxxgxQiYq2bkLKS+YMXYrrES8lG9u0yzW2Wad2Q+uxW39CkxvItPlK+4
	 V1MzHhGT4GwAPKh6nBzgV6tCpqzcFeyQO+W5e63/KyHzk/QlxCQMMDW9ciiNdTcHL6
	 EaRWfQ0XcLI0QhGrb/mRx9Wfdfh/RFaQ6KIOLPgU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53B6EUZw003976
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 01:14:30 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 01:14:29 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 01:14:29 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53B6EQXN072119;
	Fri, 11 Apr 2025 01:14:26 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-j784s4-evm-usxgmii-exp1-exp2: drop pinctrl-names
Date: Fri, 11 Apr 2025 11:44:25 +0530
Message-ID: <20250411061425.640718-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The "pinctrl-names" property is not required since it doesn't have an
associated pinctrl configuration. Hence, drop it.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on linux-next tagged next-20250411.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtso | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtso b/arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtso
index d5f8c8531923..424628c63c2d 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtso
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtso
@@ -24,7 +24,6 @@ aliases {
 };
 
 &main_cpsw0 {
-	pinctrl-names = "default";
 	status = "okay";
 };
 
-- 
2.34.1

