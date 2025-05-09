Received: from out28-97.mail.aliyun.com (out28-97.mail.aliyun.com [115.124.28.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1AF28EA70;
	Fri,  9 May 2025 10:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746785674; cv=none; b=nn08XlZ0gbC5GsfPTZ4Os2jhFSAb546AHJeZ/F5K1i+LZ+6EH1X6iu6njFrodClso196oiLRODZyc9sD7bVChse6V0rxZ4TwwKkDCFXO7iSpsM2EO3g8Q0RohsQpNH8R/IdXZxgtz3B29BM4KM793XNrnHiXQYE20lKOerNTK5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746785674; c=relaxed/simple;
	bh=OPI3XWOcoAfdU78DG4/m7qB4wRfz4OQy+nIL5AYV1TQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W2rjtfXcS3uJiJ4RKHwPjNs6bW05QdRW7B+etRjIlsezoja60Lxphb4cgvRObmNAtzw9yYXLrchOKY+OtD/F/MHFciVRTrkwn+9lbWpWRp2h5yoLoPRhGUW0t/hk3pNKb0X7ZRc9fKNU3a+SbwgfeZ6QG+k2sJhL/jWDwwROLt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coolkit.cn; spf=pass smtp.mailfrom=coolkit.cn; dkim=pass (1024-bit key) header.d=coolkit.cn header.i=@coolkit.cn header.b=D2GUopRL; arc=none smtp.client-ip=115.124.28.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coolkit.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coolkit.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coolkit.cn header.i=@coolkit.cn header.b="D2GUopRL"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=coolkit.cn; s=default;
	t=1746785667; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=i2nwrgDlfYmW5GMiHsd3skowwRM2D4RoRU7n5JUMis8=;
	b=D2GUopRL3269sQw6s0vTkFEVEASTWeZBlNYnRZ3zypMQRC1WoOIrzb9kLH2ac7u5RinijCVAz9KKWGeCNkkdIkuC6r7m3+acskgsYk/GJN92225aVz0w+Cbm84s3bzhcVensUo1NJd03AFhlI6uxrEmth85MHPwCmuTLJEY9PlY=
Received: from ubuntu-z.lan(mailfrom:hao.zhang@coolkit.cn fp:SMTPD_---.cjsv3ce_1746785664 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 09 May 2025 18:14:27 +0800
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
	Hao Zhang <hao.zhang@coolkit.cn>
Subject: [PATCH v2 2/2] ARM: dts: rockchip: Sonoff-iHost: correct IO domain voltages
Date: Fri,  9 May 2025 18:14:19 +0800
Message-Id: <20250509101419.460473-3-hao.zhang@coolkit.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509101419.460473-1-hao.zhang@coolkit.cn>
References: <20250509101419.460473-1-hao.zhang@coolkit.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify the corresponding vccio according to the schematic of
Sonoff iHost. This change aligns the device tree with the actual
hardware design and improves peripheral stability.

Signed-off-by: Hao Zhang <hao.zhang@coolkit.cn>
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

