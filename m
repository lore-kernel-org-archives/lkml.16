Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0833155A21;
	Thu,  3 Apr 2025 03:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743651518; cv=none; b=k392jvBxxPtl5vFPlyCH0v1ognFqcK8e4t4OUS7bxxlhgsoLAbi68jghYaMNyAeRJk0GZ+3ibbmAqvvf4a5i+SQ/N+r5To8bjaPMq0PyU3QI45rLJnKxAct9LZVIhrCboADAEdMnXqXHBt4gtDrWUUfX29t9PHeWX+5wxeL3J6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743651518; c=relaxed/simple;
	bh=qQtNoeFqDw/OB4yXO0pCIhbzwtneAeeVzV5cVe/wLsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rcfJ7CqvVe3t7J1RNISAyPSYSmFWehoykrpmKaD5kC9yrCs4GK+TDXJB6oZpzJVW9LvipQyEbqrIk3m338rFt6yHfbnlRTY1M5OkoqZpVY+w8fl/DFtpyVscJlIvpv572YPbCY1+vppabaRn6DCZI1BNXymv8/0DHsTv3DqayBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=dYO/aihA; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="dYO/aihA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=MGndv
	tMPEokiBrxHHMnhfjH0BcuiAuDizFZG9VwssFg=; b=dYO/aihA/IOkosTD8Gya/
	rOmaNCNYNlQzcib9xmKmhF7m3EXqp1gBa/VOo3VngRkzk5vh+qWKwxVcft8oKPfO
	/36gpU0z86RrfHVwy0UJnWSFobP5NidQ7UIK1Nt0KoN7n+cXxAyCLoiV8C7JFT+X
	DCvACAKAunDXmGJPfRSt9o=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBHWgmNAu5n7FfDDg--.28713S11;
	Thu, 03 Apr 2025 11:38:06 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: hjc@rock-chips.com,
	mripard@kernel.org,
	naoki@radxa.com,
	stephen@radxa.com,
	cristian.ciocaltea@collabora.com,
	neil.armstrong@linaro.org,
	Laurent.pinchart@ideasonboard.com,
	yubing.zhang@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 9/9] arm64: dts: rockchip: Enable DP2HDMI for ROCK 5 ITX
Date: Thu,  3 Apr 2025 11:37:37 +0800
Message-ID: <20250403033748.245007-10-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403033748.245007-1-andyshrk@163.com>
References: <20250403033748.245007-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHWgmNAu5n7FfDDg--.28713S11
X-Coremail-Antispam: 1Uf129KBjvJXoW7CrykKw18Xw43uF4kZw1fZwb_yoW8tF4rpF
	nFvrs5Kr97uryaqw1FvF1kZF1DKrs5ua93Jr1aqry0yFW7Xa4kK3Wrur9YqF1jvFyxZ3ya
	yr4kXa4293WDXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jrWrAUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAwkXmft-c-LwgAAsv

From: Andy Yan <andy.yan@rock-chips.com>

The HDMI0(Port next to Headphone Jack) is drived by DP1 on rk3588
via RA620(a dp2hdmi converter).

Add related dt nodes to enable it.

Note: ROCKCHIP_VOP2_EP_DP1 is defined as 11 in dt-binding header,
but it will trigger a dtc warning like "graph node unit address
error, expected "b"" if we use it directly after endpoint, so we
use "b" instead here.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v3:
- Add RA620 into bridge chain.

 .../boot/dts/rockchip/rk3588-rock-5-itx.dts   | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index 67b8863292487..bb61633a5b995 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -57,6 +57,29 @@ analog-sound {
 			  "Headphone", "Headphones";
 	};
 
+	bridge {
+		compatible = "radxa,ra620";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&dp1_out_con>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_con_in>;
+				};
+			};
+		};
+	};
+
 	gpio-leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -73,6 +96,17 @@ hdd-led2 {
 		};
 	};
 
+	hdmi0-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+
 	hdmi1-con {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -268,6 +302,24 @@ &cpu_l3 {
 	cpu-supply = <&vdd_cpu_lit_s0>;
 };
 
+&dp1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&dp1m0_pins>;
+};
+
+&dp1_in {
+	dp1_in_vp2: endpoint {
+		remote-endpoint = <&vp2_out_dp1>;
+	};
+};
+
+&dp1_out {
+	dp1_out_con: endpoint {
+		remote-endpoint = <&hdmi_bridge_in>;
+	};
+};
+
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
 	status = "okay";
@@ -1262,3 +1314,10 @@ vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
 		remote-endpoint = <&hdmi1_in_vp1>;
 	};
 };
+
+&vp2 {
+	vp2_out_dp1: endpoint@b {
+		reg = <ROCKCHIP_VOP2_EP_DP1>;
+		remote-endpoint = <&dp1_in_vp2>;
+	};
+};
-- 
2.43.0

