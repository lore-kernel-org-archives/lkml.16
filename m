Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E671AA1DA;
	Mon,  5 May 2025 11:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746444469; cv=none; b=qu5qQOxRfWYpOvmjV95PHNUp6+C0tKTfSm1cguwcTrj1LvVuLUcNFBroRfgfg97VKOQTd9+hKaEttyyZXMTNlGZoPO8ua80PLjtK1kh8jofQkxJ/eAS1QYui3mYTgcA+7u3my8/fggTXoGVr0Gz+zKGMNELAgBtHiFOejYkaKD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746444469; c=relaxed/simple;
	bh=0j11keJOqiT7AKZQ6nfStMKruXoFyCHgWTRBln2Mvmk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DrQbTnoOH3S/MHA9X21GUOyRdB3lmpURhsFkjwZm2fJec/YGssf6hc1Ph3PQgdzc/u2D4KAkINCl2iCUfC/+w1jp/sUhhcuSjBiAPpROwVdE0ltfXzo2rIjlx4jwIMUlK1rapdiI/baCTVx/vA3FosuTQkd2+7i9MdFT+2WD4qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xqPHvnCe; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xqPHvnCe"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545BRbvl749119
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 06:27:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746444457;
	bh=7VAE1l1tpUe5n89B57iDz0Xbo2ff8Z270c0+Wxzb41E=;
	h=From:To:CC:Subject:Date;
	b=xqPHvnCefJpaNzVTFRUbNh9JqxFlmrjuAhxWI8HIX09m2S5otd4n+VbhRI14cO03W
	 /fKKMSaZcKNYGZdR0BARJPbPrTp3v+LHOyFZ9kn2+AFXHlqcmHftpH4zcDfOy3dL2j
	 iam6zIBJc84l8JYm858A50I0R5dX+gUggG0ivw7s=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545BRb4t001198
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 06:27:37 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 06:27:36 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 06:27:36 -0500
Received: from prasanth-server.dhcp.ti.com (prasanth-server.dhcp.ti.com [172.24.227.142])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545BRX86029127;
	Mon, 5 May 2025 06:27:33 -0500
From: Prasanth Babu Mantena <p-mantena@ti.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-j721e-common-proc-board: Enable OSPI1 on J721E
Date: Mon, 5 May 2025 16:57:31 +0530
Message-ID: <20250505112731.2515734-1-p-mantena@ti.com>
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

J721E SoM has MT25QU512AB Serial NOR flash connected to
OSPI1 controller. Enable ospi1 node in device tree.

Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
---
Test log : https://gist.github.com/PrasanthBabuMantena/9dda540dce88282117de7e0e945e24ca
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index e3d0ef6913b2..3112b351c052 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -571,6 +571,7 @@ &usb1 {
 };
 
 &ospi1 {
+	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_fss0_ospi1_pins_default>;
 
-- 
2.34.1

