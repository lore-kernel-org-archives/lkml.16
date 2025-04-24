Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182AD221DAB;
	Thu, 24 Apr 2025 08:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484275; cv=none; b=rOELP00PiQ1zLW22eRXGzRAXaH8aVrzH9x4JdPD6PXQLzkj9345licYWb1L3JPB/gqMta6o7seFr76IITUXjZFlzmCzQA9UYbxDLwEiVEblkQ8NLlbR3OyMyDvxmXFuoRS6L0/933LosvnQ2WhOXw0rsfL5e07OWMLPk3h22Da0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484275; c=relaxed/simple;
	bh=nk81WDgRzvPU5k8WHoJfcyhF1SMmi8nKKdUbnY9Iewo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ReSjQAg+zgx4cd9zkYV3//o+P+K6ryZIVYl/KUblEZ4I8FTmbH8Eq30uXTHUVz0LB2LCbrHDT42q2NTl09fspwbOcV8U+zhkIXvXFlAru1MhhEkAgfvlkIuUv/5v6k3hDlpjwMg118Muw5KbycP7OzQXfmWIGQ7CBk/VQ6hfyi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ijIDI++5; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ijIDI++5"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53O8iMvY2574670
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 03:44:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745484262;
	bh=Gyc2hJedNBMQB3mtMI7n6IC+t7jRMFsAPdQTaHcDrtc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ijIDI++5Y3Wvcd9H7mRWvCEhAXcv8c27qs5qqeDcTwXD/L/nruhkktqbMJJBbb0n1
	 7IaHaz9ojoACClJ4S4qb1oZau8/btMqQJ7tOCgv6QvfbrBYVnfVzVwBYgdZ8WVcs4p
	 bjX7n1KC8JRLT3PKmfYhDjzq4hjOwRq2xNNbVgOE=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53O8iMRi004759
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Apr 2025 03:44:22 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Apr 2025 03:44:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Apr 2025 03:44:22 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53O8iLnI058454;
	Thu, 24 Apr 2025 03:44:21 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <u-kumar1@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devarsht@ti.com>,
        <j-choudhary@ti.com>
Subject: [PATCH 3/4] arm64: dts: ti: k3-am68-sk-som: Reserve 1008MiB of global CMA
Date: Thu, 24 Apr 2025 14:14:14 +0530
Message-ID: <20250424084415.66457-4-j-choudhary@ti.com>
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

Reserve 1008MiB of global CMA pool which is also marked as re-usable
so that OS can also use this region if peripheral drivers are not
using it.

AM68-SK has different multimedia components such as Camera, Dual-
Display and H264 Video Codec which uses CMA for buffer allocations.
Assuming the worst case scenario where all three run in parallel,
below is the calculation:

1) IMX390 camera sensor 1920x1080
-> 1920 width x 1080 height x 2 bytesperpixel x 4 buffers :
   15.820 MiB which is ~16MiB
   AM68-SK can support 8 cameras so ~128MiB

2) 1920x1080 HDMI
-> 1920 width x 1080 height x 4 bytesperpixel x 2 buffers :
   15.820 MiB which is ~16MiB

3) 2560x1440@60fps DSI via DisplayPort0
-> 2560 width x 1440 height x 4 bytesperpixel x 2 buffers :
   28.125 MiB which is ~29 MiB

4) H264 Video Codec 1920x1080 resolution:
-> For 1080p resolution codec application, we require ~98-100 MiB
   per channel. We require ~800MiB for 8 channel codec application.

Total comes about 973MiB. Adding 32MiB for other peripherals and
and additional 3MiB for rounding it off to 1008MiB.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi b/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
index 4ca2d4e2fb9b..2b02575549eb 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
@@ -22,6 +22,14 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		/* global cma region */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x00 0x3f000000>;
+			linux,cma-default;
+		};
+
 		secure_ddr: optee@9e800000 {
 			reg = <0x00 0x9e800000 0x00 0x01800000>;
 			no-map;
-- 
2.34.1

