Received: from lf-1-19.ptr.blmpb.com (lf-1-19.ptr.blmpb.com [103.149.242.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417841CDFCC
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.149.242.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738922088; cv=none; b=FNRg27/pyD+3Q8Hp9c0D7p4RJa+ti6GASdwKV06KUyH8FtDSSJ6MsprUz3+Vze2OzjjMWG8lVvO+x6EUSeOhsjFYYgwBRCnqvulWxVkXdi1mfju1T37r4cZDQlUZsGhYuTWu3E7wFCFIZRG5lNfbNTIlwQthMVywpCKwfWmURaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738922088; c=relaxed/simple;
	bh=agaQceQd1bDu4sOTVHXeeG0BKQ3+Zt0nmWgpIyNwVzw=;
	h=Date:Message-Id:Content-Type:Cc:Mime-Version:Subject:To:From; b=E/MoLiXXNZN17abV6ONn3ACbIuBE6fAHNfU1+DUW2Ull9fYBvg+BFqDxyWeniUSeAZNvwUZP3O9U2/GLu54BPrv4iv2vnb2s9xfx2LeuBTeSVWbXuyov1gY3izQtMWaQ9/Qjz9bkPiDWHOSaYzNwZbknKDOPmOCBBN62uFR04lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=Ext4D7g2; arc=none smtp.client-ip=103.149.242.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="Ext4D7g2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1738921152;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=nmICg0JeV9q0TueMgSa31FvUhRcU9+mUNKRb/fAv+c4=;
 b=Ext4D7g2kPHU3YeMoyg7w2U5doYWuKL65p5hQ+TumzUUIjwY/gsZn5W1oos5unnOzjQJ+2
 jUlCuQPgHV5b/WholkhRwGAbHdJn6TVTXM/sA+aPMy+OV/CRpMgc1IOfbaG78XaLlq6PK7
 BxIzAxf89c1UX2pGJ+v4YLyZTyibfV2WkUKsSLbDEJ79URlLIi6EKZtYWceaD0995Kwf2W
 YczpLFsyG4MqWHDNQvtjjwkiWYCL3oXvjwdj081Wh0fBCp4b6D0y+i540kbte3zMd3rTV5
 booSEJXZZbpDdMQnbcsl8Hljzahk6xeSQKc3k865TQ2xudjDCCsF95KsxEX4fA==
Date: Fri,  7 Feb 2025 17:36:18 +0800
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.34.1
X-Lms-Return-Path: <lba+267a5d4be+30baf8+vger.kernel.org+sandie.cao@deepcomputing.io>
Message-Id: <20250207093618.126636-1-sandie.cao@deepcomputing.io>
Received: from roma-MacBookPro.. ([113.110.140.128]) by smtp.feishu.cn with ESMTPS; Fri, 07 Feb 2025 17:39:09 +0800
Content-Type: text/plain; charset=UTF-8
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: [PATCH] riscv: dts: starfive: fml13v01: enable pcie1
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
To: "Conor Dooley" <conor@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>

Starfive Soc common defines GPIO28 as pcie1 reset, GPIO21 as pcie1 wakeup;
But the FML13V01 board uses GPIO21 as pcie1 reset, GPIO28 as pcie1 wakeup;
redefine pcie1 gpio and enable pcie1 for pcie based Wi-Fi.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../jh7110-deepcomputing-fml13v01.dts         | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
index 30b0715196b6..8d9ce8b69a71 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
@@ -11,6 +11,40 @@ / {
 	compatible = "deepcomputing,fml13v01", "starfive,jh7110";
 };
 
+&pcie1 {
+	perst-gpios = <&sysgpio 21 GPIO_ACTIVE_LOW>;
+	phys = <&pciephy1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_pins>;
+	status = "okay";
+};
+
+&sysgpio {
+	pcie1_pins: pcie1-0 {
+		clkreq-pins {
+			pinmux = <GPIOMUX(29, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_NONE)>;
+			bias-pull-down;
+			drive-strength = <2>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		wake-pins {
+			pinmux = <GPIOMUX(28, GPOUT_HIGH,
+					      GPOEN_DISABLE,
+					      GPI_NONE)>;
+			bias-pull-up;
+			drive-strength = <2>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &usb0 {
 	dr_mode = "host";
 	status = "okay";

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.34.1
