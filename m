Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A45221DB2;
	Thu, 24 Apr 2025 08:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484276; cv=none; b=TbwzrPCtB82ysR9s8WU8WKr4OM26JINNngqxv7IYbsKFY6l1HxrODfREGHhxE9YKso3yiYzINwBelgI8ICVkbFXY6eGzEKihJL8Myg8NCMi5I/S/Ou3w6O7OAduJyRGpV9qqo6YKoy8P0hCbdOZSjrh2hyfSruHTngWbvqBAIUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484276; c=relaxed/simple;
	bh=si7HH3FZ+zRXBsOldQvyZuozyV6cdA4cJ6hDozQW7qk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DnaDJUY1UfVfvvoqIvpCbT5/1Y+vgCCLHTrQnPQrThuUnrD++0P6EVfj1skpMOEe9hOuzyzXToleSR8Oar4hvoc2GNh58b8U2wX3fqo3JlDFxC7NrDrxaAUAhNmuX/m9g55NUiwVZZPBBlVHJKF7sjnXIhtzRKzhNRRMdeEALrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LNYKVPM+; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LNYKVPM+"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53O8iO3D1804379
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 03:44:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745484264;
	bh=mqD3JFg+NSuqkMavjFnAVMGsxZrDKdqG5Hr37LsOgLs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LNYKVPM+PydDwbUQ5bSZL9cyNBWjcoDH9DZ2Wx10q+pCKU3onN4pljOmTaduxhazY
	 q38wqJ+vEbvEGLUpqlLXHhhcI254npUugRi4T3IvAHZNLKg56FHb6/zPFOvzYDYbkP
	 Q7hMqoqWQesCiZ8Vm5vaxjvA0rtR1A9X+8AV+g70=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53O8iOY1059199
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Apr 2025 03:44:24 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Apr 2025 03:44:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Apr 2025 03:44:24 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53O8iMjK067284;
	Thu, 24 Apr 2025 03:44:23 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <u-kumar1@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devarsht@ti.com>,
        <j-choudhary@ti.com>
Subject: [PATCH 4/4] arm64: dts: ti: k3-am69-sk: Reserve 1904MiB of global CMA
Date: Thu, 24 Apr 2025 14:14:15 +0530
Message-ID: <20250424084415.66457-5-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250424084415.66457-1-j-choudhary@ti.com>
References: <20250424084415.66457-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Reserve 1904MiB of global CMA pool which is also marked as re-usable
so that OS can also use this region if peripheral drivers are not
using it.

AM69-SK has different multimedia components such as Camera, Dual-
Display and H264 Video Codec which uses CMA for buffer allocations.
Assuming the worst case scenario where all three run in parallel,
below is the calculation:

1) IMX390 camera sensor 1920x1080
-> 1920 width x 1080 height x 2 bytesperpixel x 4 buffers :
   15.820 MiB which is ~16MiB
   AM69-SK can support 12 cameras so ~192MiB

2) 3840x2160@60fps MHDP via DisplayPort0
-> 3840 width x 2160 height x 4 bytesperpixel x 2 buffers :
   63.281 MiB which is ~64 MiB

3) 1920x1080@60fps HDMI
-> 1920 width x 1080 height x 4 bytesperpixel x 2 buffers :
   15.820 MiB which is ~16MiB

4) H264 Video Codec 1920x1080 resolution:
-> For 1080p resolution codec application, we require ~98-100 MiB
   per channel. We require ~1600MiB for 16 channel codec application.

Total comes about 1872MiB. Adding 32MiB for other peripherals to
get 1904MiB.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am69-sk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index b85227052f97..37228ec64852 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -44,6 +44,14 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		/* global cma region */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x00 0x77000000>;
+			linux,cma-default;
+		};
+
 		secure_ddr: optee@9e800000 {
 			reg = <0x00 0x9e800000 0x00 0x01800000>;
 			no-map;
-- 
2.34.1

