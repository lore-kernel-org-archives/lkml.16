Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9DF28F939;
	Fri, 11 Apr 2025 08:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360011; cv=none; b=lfCN3Mm5lRgFLmRSxfJNmoH3QWo+nbq4M/1t6vZS3bY89yO605n1tcSv3njHR8dONEyRzOv4KGMjxea5NGUPGTukaGOWsXS25mEZ5igjrLk+g35W9w+hVxv5dzRnslP80lqzp+z2hSyReUxEc88lI3HNf/sKzCsMygs80m0QMXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360011; c=relaxed/simple;
	bh=H3klUBMECUk/ddkJDOPJsAISpbibU2JouidwR9BKVBI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gMXHKvHjbFTJdSuSpaAU1umPJKCuUVTyBwUTiVDF6ck0VJzhxHEXVQ/woS0QAsPnquz3SZhcG9ZNJ0VZS/y3AmAfQUG3N36Oh/tyL2wLPJJLw/7r8WwYb5wW0VZbnN5Mf+TVm0o3CIhzQcl6xZ/+SebNxgKZN9vCFfIpYbN0P84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=I2foo0S7; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="I2foo0S7"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53B8QfTb1392056
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 03:26:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744360001;
	bh=NOYt58RiGC5bUv1bOmPvQCAdmWARYOFCeTU9PYsfNYU=;
	h=From:To:CC:Subject:Date;
	b=I2foo0S77yekuSJn0jX2huJaWMI2RXsz5BDQyqN9NwHPO+wTLfn9E7K7mjEYLUOPK
	 nMGSP4rhQQoaCj8ybfDs2kkxgrO+xgELpGjcW9wMeTB7YmL0Cl0dpd+u2e16fm9wpM
	 bO3ib3QLUTp6pPEPc/FfnEkslJEUuatW+sRPEdYQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53B8QfN4039979
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 03:26:41 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 03:26:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 03:26:41 -0500
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [172.24.227.92])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53B8QcGl124342;
	Fri, 11 Apr 2025 03:26:38 -0500
From: Anurag Dutta <a-dutta@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <u-kumar1@ti.com>, <vaishnav.a@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-j721e-common-proc-board: Add bootph-all to HBMC nodes
Date: Fri, 11 Apr 2025 13:56:37 +0530
Message-ID: <20250411082637.2271746-1-a-dutta@ti.com>
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

Add bootph-all to HBMC controller and hyperflash nodes for successful
hyperflash boot on j721e-evm.

Signed-off-by: Anurag Dutta <a-dutta@ti.com>
---

Test logs : https://gist.github.com/anuragdutta731/90a492589557c2ec2881e1de50a62006

 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index 4421852161dd..9ada749f16ba 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -570,6 +570,13 @@ &usb1 {
 	maximum-speed = "high-speed";
 };
 
+&hbmc {
+	bootph-all;
+	flash@0,0 {
+		bootph-all;
+	};
+};
+
 &ospi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_fss0_ospi1_pins_default>;
-- 
2.34.1

