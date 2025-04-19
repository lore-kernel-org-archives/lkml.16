Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568251D63C7;
	Sat, 19 Apr 2025 12:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745064855; cv=none; b=TSuWF3xMCQVzzHSXIQpha84B6+n9l7ntIzDNrtVJOpZfU8Ul8j/rfZwntQPuca7tvJM8gap9W1f5o3jOJjoCfKI5xPxnXAgKkRHuu+E4Rv661CHVjMH3kbNfEw+QpxFMfXq8M2xWAz+BhGFc4jB/H0eMi8N84zYAWI7ptH8gVnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745064855; c=relaxed/simple;
	bh=ksxUsrCYTXRreBcDyiaFxrxtFUBYIdL/jw99PaZ4F+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rqkirWiASLfZWldCrqBWbYe+M/zii47NEvjZ8KSBA8ufP3sxYji5ZTaBqIj5+1TjS6o4gUamFQN+eUvruxykLQctrRRVi97qRzUVfcP4Tm8iIJAoK3BQ4glpu8lDWCqgedA7omW2oUOcXoVovAFpWToOiDJjNYEQXviAi0g2BbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hD3GOCcH; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hD3GOCcH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=qgCIG
	/KUeTm5AFeThSZkpuDFjJWXcCxfvkAjBpN4Wug=; b=hD3GOCcHiZB95qiOjtxkM
	3nhQg3Bz/zoy76B2Uzuy5GYO3QAgqz4hqIrT6GKhZ0wTY4G77iHarKwC3TMHtgns
	c7kIpciqII22EvOhq02LtuHJ65RDb0nwQ4EPEdJkJo5Ve2aPQsK35RSgJ8iAc6o4
	mQXT0+wNvR1klqX0emc86I=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBn3XtnkwNoWWZ+BA--.31074S3;
	Sat, 19 Apr 2025 20:13:32 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	inux-rockchip@lists.infradead.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH 2/3] arm64: dts: rockchip: Enable HDMI1 on Cool Pi CM5 EVB
Date: Sat, 19 Apr 2025 20:13:17 +0800
Message-ID: <20250419121326.388298-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250419121326.388298-1-andyshrk@163.com>
References: <20250419121326.388298-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBn3XtnkwNoWWZ+BA--.31074S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF18Jry8ArWkGw1xZFW8Zwb_yoW8WrykpF
	nxArZagFn7ury7trn0yF1xAF1Ykws5u393Gw13Zry3tF17WF1ktw17Wrn5tFyDAFy7Zayf
	ZF4kJF1j9F1DtF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_dgAUUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gg0XmgDkx0IRQAAsY

Enable the second HDMI output port on Cool Pi CM5 EVB

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 .../dts/rockchip/rk3588-coolpi-cm5-evb.dts    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
index 3beeb0616455e..4e1b05c698ded 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
@@ -34,6 +34,17 @@ hdmi0_con_in: endpoint {
 		};
 	};
 
+	hdmi1-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi1_con_in: endpoint {
+				remote-endpoint = <&hdmi1_out_con>;
+			};
+		};
+	};
+
 	leds: leds {
 		compatible = "gpio-leds";
 
@@ -133,10 +144,32 @@ hdmi0_out_con: endpoint {
 	};
 };
 
+&hdmi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmim2_tx1_cec &hdmim0_tx1_hpd &hdmim1_tx1_scl &hdmim1_tx1_sda>;
+	status = "okay";
+};
+
+&hdmi1_in {
+	hdmi1_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_hdmi1>;
+	};
+};
+
+&hdmi1_out {
+	hdmi1_out_con: endpoint {
+		remote-endpoint = <&hdmi1_con_in>;
+	};
+};
+
 &hdptxphy0 {
 	status = "okay";
 };
 
+&hdptxphy1 {
+	status = "okay";
+};
+
 /* M.2 E-Key */
 &pcie2x1l1 {
 	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
@@ -265,3 +298,10 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi0_in_vp0>;
 	};
 };
+
+&vp1 {
+	vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI1>;
+		remote-endpoint = <&hdmi1_in_vp1>;
+	};
+};
-- 
2.43.0

