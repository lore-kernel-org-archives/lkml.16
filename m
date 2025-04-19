Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC8E1D54E3;
	Sat, 19 Apr 2025 12:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745064854; cv=none; b=NAjQN//vsuMzZwEH2xALxLSPi9YfTebmE7blhZq/q9Q3Zg9kruXhH1iJZ/q76l6AdTcap3RUeLVDASpa6JFZJB2sZCmV7LJLbqkBfvNQsUk4/JXHa3gPA//bxPfQp9nIZwHOLly+tnu5XXLacsDVEEKzMFwstjMuWb7WPeVGkuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745064854; c=relaxed/simple;
	bh=I7qa9vuX0I6+HNe8+54ACizziZ7dFnTzJOAzznaDicE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YuDrKeYikHKFVAVfdmcw17KxEIuXEMp3Q39OZCe2yFRDTo3W5PaqpDTaHCrCtXfsxcxiLjq8HqPXW4h8cizKCfI5y8SWoKgmzP+rV8BhRgITiJWPhztVtssC3BhgQIoAYIIpICnS3rf+zAFs8i5oBWznSlDWJAgW9j4RshUVL2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=pw8xGmfA; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="pw8xGmfA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=7yijT
	+gdpaYs2r1XU6nJ4ndIOkwOZMdtGf1e/aQOrxU=; b=pw8xGmfA246B8PoU43Nkq
	/kWzzId4XKkEVU6HT/eWAGqBru+wsa51ut1jACxiJJiC2uDYLoxrirc9m6E/sDK2
	jdt1yIN0t6Wpf4qu8mgg2RLfG0Fyw39jnkgqlBqijeGaHIp6FqeBKBQIqpqhdoIc
	Cy1pyx+7SptNP0rivelTtE=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBn3XtnkwNoWWZ+BA--.31074S4;
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
Subject: [PATCH 3/3] arm64: dts: rockchip: Enable HDMI audio outputs for Cool Pi CM5 EVB
Date: Sat, 19 Apr 2025 20:13:18 +0800
Message-ID: <20250419121326.388298-3-andyshrk@163.com>
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
X-CM-TRANSID:_____wBn3XtnkwNoWWZ+BA--.31074S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrWxJFy5try3ArW7JFyUtrb_yoWDtrc_ta
	y7W3W0yFWfuF4UG3srJayUJrWxK397WFW5Ja4xZFWDCas5tanrJFWrJFW3Xw1DWFy29F4x
	Aa1qyrn7CwnFkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRJEf5UUUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAE0XmgDj2JzwgABs1

Enable audio outputs for two HDMI ports on Cool Pi CM5 EVB

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 .../boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
index 4e1b05c698ded..d44c7329ccc73 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
@@ -132,6 +132,10 @@ &hdmi0 {
 	status = "okay";
 };
 
+&hdmi0_sound {
+	status = "okay";
+};
+
 &hdmi0_in {
 	hdmi0_in_vp0: endpoint {
 		remote-endpoint = <&vp0_out_hdmi0>;
@@ -162,6 +166,10 @@ hdmi1_out_con: endpoint {
 	};
 };
 
+&hdmi1_sound {
+	status = "okay";
+};
+
 &hdptxphy0 {
 	status = "okay";
 };
@@ -170,6 +178,14 @@ &hdptxphy1 {
 	status = "okay";
 };
 
+&i2s5_8ch {
+	status = "okay";
+};
+
+&i2s6_8ch {
+	status = "okay";
+};
+
 /* M.2 E-Key */
 &pcie2x1l1 {
 	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
-- 
2.43.0

