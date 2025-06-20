Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314B227FD41;
	Fri, 20 Jun 2025 10:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750413629; cv=none; b=YNo9J5aOFXZYgOXFujn+2MX+z7a/ToGWHsNcMKde4aDncottGpRWIHIT2+XMBD9UELv+X/tgz41zP1l7S3KsgAjm3ohGqq4pDl1f72wtCJyjle3uzOQCpxy2rTMANqNo4v0S0JXfMpVOJtrwhG1bXPIqEl5/Wt7dSkuvO+F7kbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750413629; c=relaxed/simple;
	bh=R+p0EaDC0lgqSxTQLjz9IbRSroUob7sVUhViBG86vag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n5FVMeaJSCvilrCBt0wHUhvy9xQ/b4zilxEXx7I23UX9fWfn1pj2abi2yukSC9xTfPAoLd5bfiEBbXu95UY319QE/enwI7Zr1NamvqFwLzlS94LK75URaXcSCkon2b3N68ATdeC7kFe3ulkiggVP20qlcTj3FDQd/fu67MsH/K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c02:2eb0:2d06:fb3f:ec9:50ac])
	by smtp.qiye.163.com (Hmail) with ESMTP id 195ff8217;
	Fri, 20 Jun 2025 18:00:16 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Yao Zi <ziyao@disroot.org>,
	Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/1] arm64: dts: rockchip: rk3528: Add CPU frequency scaling support
Date: Fri, 20 Jun 2025 18:00:10 +0800
Message-Id: <20250620100010.1291658-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250620100010.1291658-1-amadeus@jmu.edu.cn>
References: <20250620100010.1291658-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGksZVkhJGUkaSU8dSENDTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtJQUkeGUtBSR9LTUEdGUgdQR4YQkFOSxoYWVdZFhoPEh
	UdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQktLWQY+
X-HM-Tid: 0a978cc825cc03a2kunm2902750c11af80
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mkk6Kzo6NjE4HioLLTEICzMu
	SCoKCzNVSlVKTE5LT0pITUpMTUpOVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0lBSR4ZS0FJH0tNQR0ZSB1BHhhCQU5LGhhZV1kIAVlBT0pMSzcG

By default, the CPUs on RK3528 operates at 1.5GHz. Add CPU frequency and
voltage mapping to the device tree to enable dynamic scaling via cpufreq.

The OPP values come from downstream kernel[1]. Both 408MHz and 600MHz
frequencies use the normal PLL, so use the corresponding highest voltage.

The voltage used for other frequencies can't be less than above (875mV).
Therefore, 816MHz to 1200MHz also uses the corresponding highest voltage.

The remaining 1416MHz to 2016MHz use a voltage close to actual frequency.

[1] https://github.com/rockchip-linux/kernel/blob/develop-5.10/arch/arm64/boot/dts/rockchip/rk3528.dtsi

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 64 ++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 829f980ea353..5cb7f10b79ed 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -53,6 +53,7 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			enable-method = "psci";
 			clocks = <&scmi_clk SCMI_CLK_CPU>;
+			operating-points-v2 = <&cpu_opp_table>;
 		};
 
 		cpu1: cpu@1 {
@@ -61,6 +62,7 @@ cpu1: cpu@1 {
 			device_type = "cpu";
 			enable-method = "psci";
 			clocks = <&scmi_clk SCMI_CLK_CPU>;
+			operating-points-v2 = <&cpu_opp_table>;
 		};
 
 		cpu2: cpu@2 {
@@ -69,6 +71,7 @@ cpu2: cpu@2 {
 			device_type = "cpu";
 			enable-method = "psci";
 			clocks = <&scmi_clk SCMI_CLK_CPU>;
+			operating-points-v2 = <&cpu_opp_table>;
 		};
 
 		cpu3: cpu@3 {
@@ -77,6 +80,67 @@ cpu3: cpu@3 {
 			device_type = "cpu";
 			enable-method = "psci";
 			clocks = <&scmi_clk SCMI_CLK_CPU>;
+			operating-points-v2 = <&cpu_opp_table>;
+		};
+	};
+
+	cpu_opp_table: opp-table-cpu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-408000000 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-microvolt = <875000 875000 1100000>;
+			clock-latency-ns = <40000>;
+			opp-suspend;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <875000 875000 1100000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <875000 875000 1100000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <875000 875000 1100000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <900000 900000 1100000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-1416000000 {
+			opp-hz = /bits/ 64 <1416000000>;
+			opp-microvolt = <925000 925000 1100000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-1608000000 {
+			opp-hz = /bits/ 64 <1608000000>;
+			opp-microvolt = <975000 975000 1100000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <1037500 1037500 1100000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-2016000000 {
+			opp-hz = /bits/ 64 <2016000000>;
+			opp-microvolt = <1100000 1100000 1100000>;
+			clock-latency-ns = <40000>;
 		};
 	};
 
-- 
2.25.1

