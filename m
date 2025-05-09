Received: from out198-21.us.a.mail.aliyun.com (out198-21.us.a.mail.aliyun.com [47.90.198.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D8127465C;
	Fri,  9 May 2025 09:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746784728; cv=none; b=BjZPl6ng0BIWGJbMX6rS/qXnj7NVTNsQTt5DtQYap6x1m+RS0fRg++nJ0Yg5u1tKFbRueVAnFlykWmKdzgWRBL3h41O5B6vvRFip1g3p2+TrL41kIYSyi4xfLXgnyIDdjCncuossESSfoxY5RF0rHvKWg+OX96OmCcOKT8XRL0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746784728; c=relaxed/simple;
	bh=VWX7G/DVxq26xmeDCflJUO8sJLSsHFqKs/EofwXfRKM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TXf8EVeWPg2Z1M/iY7m/DjBRGm90JpfeXx6jDsHPMm4efKQsOLC7/+zqWvvlXV1KWtTkrvgsccAUi0xbyoBkrLU7eaxGlpKM4Xu7G7eTuHu2uzNiIr96EpU9/Uu6vXafLv3TAodwWQOXVnNuNhSNm09KxDsrSMZI2thg2qsCBDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coolkit.cn; spf=pass smtp.mailfrom=coolkit.cn; dkim=pass (1024-bit key) header.d=coolkit.cn header.i=@coolkit.cn header.b=c/OdzP7L; arc=none smtp.client-ip=47.90.198.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coolkit.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coolkit.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coolkit.cn header.i=@coolkit.cn header.b="c/OdzP7L"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=coolkit.cn; s=default;
	t=1746784703; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=3ZXjjEkHeGITH9J2fWd0u7vufG50QXwj93RzEehOzDM=;
	b=c/OdzP7LPWrz+RwL8YwjFdg/VDy6rw5eHCeSPhCXd9rNngdHp6NciMArZBUIiv0AHoXo2RYi8Av9nFlUeEmZudgCiRMgsL8zjVlVoDgGhH4cXN6Ry9Yiq8+dR92YT3o7pEBKB9SCMyRKlz0PNSO99/OwuStFVLvm+bW9GwLQp44=
Received: from ubuntu-z.lan(mailfrom:hao.zhang@coolkit.cn fp:SMTPD_---.cjnlknc_1746781026 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 09 May 2025 16:57:09 +0800
From: Hao Zhang <hao.zhang@coolkit.cn>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tim@feathertop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"hao.zhang" <hao.zhang@coolkit.cn>
Subject: [PATCH 2/2] ARM: dts: rockchip: Sonoff-iHost: correct IO domain voltages
Date: Fri,  9 May 2025 16:56:57 +0800
Message-Id: <20250509085657.309934-3-hao.zhang@coolkit.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509085657.309934-1-hao.zhang@coolkit.cn>
References: <20250509085657.309934-1-hao.zhang@coolkit.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "hao.zhang" <hao.zhang@coolkit.cn>

Modify the corresponding vccio according to the schematic of
Sonoff iHost. This change aligns the device tree with the actual
hardware design and improves peripheral stability.

Signed-off-by: hao.zhang <hao.zhang@coolkit.cn>
---
 arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi b/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi
index 088a069bb1a8..1aedcd3a2167 100644
--- a/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi
@@ -323,15 +323,15 @@ wifi_enable_h: wifi-enable-h {
 };
 
 &pmu_io_domains {
-	pmuio0-supply = <&vcc1v8_pmu>;
+	pmuio0-supply = <&vcc3v3_sys>;
 	pmuio1-supply = <&vcc3v3_sys>;
 	vccio1-supply = <&vcc_1v8>;
 	vccio2-supply = <&vccio_sd>;
 	vccio3-supply = <&vcc3v3_sd>;
-	vccio4-supply = <&vcc_dovdd>;
-	vccio5-supply = <&vcc_1v8>;
-	vccio6-supply = <&vcc_1v8>;
-	vccio7-supply = <&vcc_dovdd>;
+	vccio4-supply = <&vcc_3v3>;
+	vccio5-supply = <&vcc_3v3>;
+	vccio6-supply = <&vcc_3v3>;
+	vccio7-supply = <&vcc_1v8>;
 	status = "okay";
 };
 
-- 
2.34.1

