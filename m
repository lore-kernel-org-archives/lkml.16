Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFC61DDC1E;
	Wed,  7 May 2025 05:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746594440; cv=none; b=fWkMg7IUUPSeLlfsSpxk3ckP6z2HIlFkQRrh/m4x6mYsrRIpLMREJPUyGCeNHldLmmNNhr36oFkfia8zp4Cz2y2e/SaKlDZ3syNT7ye88CQi0lJ9u5QZfb2hQl6plJ2+07gEEk2GM51DQ/KzyfObqs1FkrSIQUwIVTveM85HSlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746594440; c=relaxed/simple;
	bh=sZ/ABV6gSSW+142kA65SyRZuaPtGximO6kt3dOzDW64=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r1nOlIGP9DnO5/L/GAvYt2/4xnzJ6kZbSFuOKuhECwSv06BGR+NDda1EmTNIMuGpNdYC4CjLtSnRzD5znhSUDhpI8+otp9+P5/uZ5VCF8Y9pd5zmx1H7puW3mw5s2DcgYPlYqmPDrXR6gbTFq6UtgmMeKZ90ezp2iCtluzeYcj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Gy3v3vkj; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Gy3v3vkj"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 547576SC1275461
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 00:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746594426;
	bh=e1gzbKQ5W8TsSlAR2NJvnPpyJD/XJunargVbzrDXq+I=;
	h=From:To:CC:Subject:Date;
	b=Gy3v3vkj65LSNGtV+UzbDlwPTsPRHhXQwAaNzjOUxF8oMLMLYxWb3aXZOxY9xXAOJ
	 FuZAIksmEo4/11+a18Wgghwy1KjLcz0ivnndvY+lvBhsBc75ZwMpnzkUvhCWfdoIeO
	 qz/jxZU7DGAVYAzL1KmLlj1fK8NjTylF2MlbBz/U=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 547576D6023522
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 May 2025 00:07:06 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 May 2025 00:07:06 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 May 2025 00:07:06 -0500
Received: from prasanth-server.dhcp.ti.com (prasanth-server.dhcp.ti.com [172.24.227.142])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 547572KY114274;
	Wed, 7 May 2025 00:07:03 -0500
From: Prasanth Babu Mantena <p-mantena@ti.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>
Subject: [PATCH v2] arm64: dts: ti: k3-j721e-common-proc-board: Enable OSPI1 on J721E
Date: Wed, 7 May 2025 10:37:01 +0530
Message-ID: <20250507050701.3007209-1-p-mantena@ti.com>
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

Fixes: cb27354b38f3b ("arm64: dts: ti: k3-j721e: Add DT nodes for few peripherials")
Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
---
Test log : https://gist.github.com/PrasanthBabuMantena/9dda540dce88282117de7e0e945e24ca
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index e3d0ef6913b2..45311438315f 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -573,6 +573,7 @@ &usb1 {
 &ospi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_fss0_ospi1_pins_default>;
+	status = "okay";
 
 	flash@0 {
 		compatible = "jedec,spi-nor";
-- 
2.34.1

