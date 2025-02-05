Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368CE22A4ED;
	Wed,  5 Feb 2025 10:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738750528; cv=none; b=nJZT4/8IxGZ3M5AIscye6N+TOoB5nW2m2YFD7kHCLyuiC/VQ//Upfo1THHZwK9nyhZA/CoITKpM7TCsZR3eu75v34UKW+vBkH+QZc2S/98ggqMcjpqOa+qtVC7QI5m28kAbyuYwueYi7dyAncJF5kKR1+Rmo9w+axzo6PQl94/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738750528; c=relaxed/simple;
	bh=OX/ctnigpgu43lTK7xFJcSkeJZlHrN45vDpeKZLrJHE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=CNiPcyjRszUmr4aoVT/LWevhgLfbfrvaXR7nmF7GvAnO+uLsmou5sydQ2nOns+hNMR2BM2CRHSHHG+sFMQtUPVlqdnF1BGc7o4SJ6YN/LY0ALN3LO+LTSx7gPe3CCVDWH+F7s9APxa607gJM+Aafwv9kLIkY1Krd6dUAm7634Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E71JHkwh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E71JHkwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738750526; x=1770286526;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OX/ctnigpgu43lTK7xFJcSkeJZlHrN45vDpeKZLrJHE=;
  b=E71JHkwhQE5GVmXDJD7Urj4G2i3t+Yt3kAc0VepcsXDRqe0iDiLRubhX
   z3nUpkE4CE0o+EhBRnofDWkWfD4d4u5nFNuJbjWTXAWlaVIploWl79vmq
   qtUqHFE6QclBvfjHpqYWraZAzkKB7i/NM77MXCE7Mu2qoAhHGRw+wll/k
   7LYYVRAAfpWBXq+HkLinO6VNO0Fy+wHFV/JKRaSpkZninAZppbC2lD9H8
   iBQ9sxODoXfrviORID88UGN1ZQr+k+J96OQK+3F0M9SX7OYE6IDxDQt2T
   n/HvaIHlPmULqDUqEQoZMes0+VMDbtcEACB8el1PaEZaov6wtO/j5ppqz
   w==;
X-CSE-ConnectionGUID: ABMWvrqjR4uyCIqoS3jIFQ==
X-CSE-MsgGUID: h8C7WsB4RByOcbQ7wBPePQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50700206"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="50700206"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 02:15:26 -0800
X-CSE-ConnectionGUID: 7L7ExEuNSTqGNIlqMBV76A==
X-CSE-MsgGUID: 2lTpRANCS/6zhV1TYERXNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110708642"
Received: from pg15swiplab1181.png.altera.com ([10.244.232.167])
  by orviesa010.jf.intel.com with ESMTP; 05 Feb 2025 02:15:23 -0800
From: niravkumar.l.rabara@intel.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	niravkumar.l.rabara@intel.com,
	nirav.rabara@altera.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: socfpga: agilex5: add qspi flash node
Date: Wed,  5 Feb 2025 18:11:53 +0800
Message-Id: <20250205101153.1778622-1-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>

Add Micron qspi nor flash node for Intel SoCFPGA Agilex5.

Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
---

changes in v2:
  * Removed unexpected properties to fix dts build warnings.

Link to v1:https://lore.kernel.org/all/20250108112834.2880709-1-niravkumar.l.rabara@intel.com/
 
 .../boot/dts/intel/socfpga_agilex5_socdk.dts  | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
index c533e5a3a610..5eda77242c5d 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
@@ -25,6 +25,37 @@ &osc1 {
 	clock-frequency = <25000000>;
 };
 
+&qspi {
+	status = "okay";
+	flash@0 {
+		compatible = "micron,mt25qu02g", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		m25p,fast-read;
+		cdns,read-delay = <2>;
+		cdns,tshsl-ns = <50>;
+		cdns,tsd2d-ns = <50>;
+		cdns,tchsh-ns = <4>;
+		cdns,tslch-ns = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			qspi_boot: partition@0 {
+				label = "u-boot";
+				reg = <0x0 0x04200000>;
+			};
+
+			root: partition@4200000 {
+				label = "root";
+				reg = <0x04200000 0x0be00000>;
+			};
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
-- 
2.25.1

