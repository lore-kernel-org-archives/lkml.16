Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B1124167D;
	Thu, 19 Jun 2025 06:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750315203; cv=none; b=NyF/zQ8fnha7DTNV5N2vgOQLyEuLeKSGBQu5BtHLrf+ATF3HV7tTOvFAZiNLfm9uLNNWCUJi4kF3P4Rwkev5wa1qgWeW1txRrZ7o/nWUikL+VpQ1avLGy6HGW2FMTSO4rimxE2ncYZ0salj5P2douWoEiZO4IbJ5QvPuMGF+O8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750315203; c=relaxed/simple;
	bh=4MOTPL+eD9R/a8ShunIQD4Ak8F19x2srD1y1ZM5qBns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C5ysfBdBo1OheSibJXpw+FmDyvLQcF4w43YVa+oLhd8c43reUbANzcnAnuAPtGb6IgEvV5+kP82jUOazworh+K22Ojbvp2mKG+zNyUJveH+/fOtDHKacNXvhNkDpfmIWLDsXl5kbuUnutSrWg8QXsOVdRLHs2VLBWpjKnXqeWq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bUG5HHSY; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bUG5HHSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=xp
	tJ5nlr75MekjpYY473ZW53Q3YMWO/bs6PyrYC1z1Q=; b=bUG5HHSY7FF7NspWRv
	PkP93TfuJt5Fv8+05P23ZTtp0G5l96uZgRXudnKAxTbtWciuhR495YBu3LotJd9c
	TLc0A/1Y5p/tIcJGBS7qKbjAll8BWnAl56bO6LroXnI0d8USeLfzl4jLseiOu8n3
	KKcODqiCzf7+Z22J/+kv61rr0=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD312OGsFNoUtqyAQ--.3973S11;
	Thu, 19 Jun 2025 14:39:19 +0800 (CST)
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
Subject: [PATCH v4 9/9] arm64: dts: rockchip: Enable DP2HDMI for ROCK 5 ITX
Date: Thu, 19 Jun 2025 14:38:55 +0800
Message-ID: <20250619063900.700491-10-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619063900.700491-1-andyshrk@163.com>
References: <20250619063900.700491-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD312OGsFNoUtqyAQ--.3973S11
X-Coremail-Antispam: 1Uf129KBjvJXoW7CrykKw18Xw43uF4kCF18uFg_yoW8tFW8pF
	nF9rs5KryxuryYqw1YyF1kZF4DKrs5ua93Jr1aqry0yFW7Xas5K3WrWr9YqF1jvF1xXw4a
	yr4kXa4j93WDXFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2XdbUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0g5xXmhTsFoIBwAAst

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

(no changes since v3)

Changes in v3:
- Add RA620 into bridge chain.

 .../boot/dts/rockchip/rk3588-rock-5-itx.dts   | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index 7de17117df7ae..903ad42f97177 100644
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
@@ -1261,3 +1313,10 @@ vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
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

