Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E37520469E;
	Sun, 18 May 2025 08:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747555531; cv=none; b=kSJYziCryTxnF1gbOSpWsdJd2PEUWXGP1W5RZb1Y9uLuBYI+WUGB+ml7n+drQulD7D2jXdAZ802/GEpFh2L++1coIG+G88Bx9K6IVzTLOEXFCAyKitwS6+AHuN6CqutIeH930pLvhCjR4+gNbEU1Q6Zksaw0r0EKEmp33AhL5sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747555531; c=relaxed/simple;
	bh=kUum+s06Epp4NTsR7VML30ERzpyL7pQgoo6iAkUvDtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3tBq+xAnWNxKUanyD4eKRw7NPaqrDAbTGVatxjeYa7bES8CiXaq9q9NKqcDEcZ5qna05nHXS7mVZ/Nsy2QKp1DZ5ytkiVcNdwr2sVv5JvFEUGWpPr3BEvcGAt93rIriT5ntmqPtrdSiee+crK/qKLZ/WbGvaD8eMxXhBmsy97Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=YUAWNiCW; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="YUAWNiCW"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C815625EF1;
	Sun, 18 May 2025 10:05:28 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qb1e6sMMhXKr; Sun, 18 May 2025 10:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747555526; bh=kUum+s06Epp4NTsR7VML30ERzpyL7pQgoo6iAkUvDtI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YUAWNiCWhPA2gzMy0dxj4Q6AKUTWCA6elOc4a706RKhAOV4l98pvrz/spEjEFMxMl
	 OCiFKH7UTyPnOkRjKOJxUZ3g6F60u/CkN+kLIfGmWlDgq/5qP/FqZWMbbniWqGCpp/
	 8Hlul6jf5TsiikqyBtapGKj/aTKTf36gjHeRXPKDep/X9xl8/HJWJETj9bIfzNGsxn
	 hM3BFzEQwu+4zFLMkKsDjMIR+DoVM/LmkbvFyjY6wNRArLgixFGIKtSlSoZjTKPGse
	 dltQWI+6GBGIaqyGb/DruXCMK4Y+i8Ah2b55MDWmcBmN598APodhXyMRF0e4INUA+/
	 Y30GVn5+uWTgQ==
From: Yao Zi <ziyao@disroot.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Yao Zi <ziyao@disroot.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Junhao Xie <bigfoot@classfun.cn>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>
Subject: [PATCH v2 4/4] LoongArch: dts: Add initial devicetree for CTCISZ Forever Pi
Date: Sun, 18 May 2025 08:03:56 +0000
Message-ID: <20250518080356.43885-5-ziyao@disroot.org>
In-Reply-To: <20250518080356.43885-1-ziyao@disroot.org>
References: <20250518080356.43885-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable UART0 as it's the boot UART used by firmware.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/loongarch/boot/dts/Makefile              |  1 +
 .../boot/dts/ls2k0300-ctcisz-forever-pi.dts   | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 arch/loongarch/boot/dts/ls2k0300-ctcisz-forever-pi.dts

diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts/Makefile
index 15d5e14fe418..9fff9e8be3de 100644
--- a/arch/loongarch/boot/dts/Makefile
+++ b/arch/loongarch/boot/dts/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 dtb-y = loongson-2k0500-ref.dtb loongson-2k1000-ref.dtb loongson-2k2000-ref.dtb
+dtb-y += ls2k0300-ctcisz-forever-pi.dtb
diff --git a/arch/loongarch/boot/dts/ls2k0300-ctcisz-forever-pi.dts b/arch/loongarch/boot/dts/ls2k0300-ctcisz-forever-pi.dts
new file mode 100644
index 000000000000..a033c086461f
--- /dev/null
+++ b/arch/loongarch/boot/dts/ls2k0300-ctcisz-forever-pi.dts
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Yao Zi <ziyao@disroot.org>
+ */
+
+/dts-v1/;
+
+#include "loongson-2k0300.dtsi"
+
+/ {
+	compatible = "ctcisz,forever-pi", "loongson,ls2k0300";
+	model = "CTCISZ Forever Pi";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@200000 {
+		device_type = "memory";
+		reg = <0 0x00200000 0 0x0ee00000>,
+		      <0 0x90000000 0 0x10000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0 0x02000000>;
+			linux,cma-default;
+		};
+	};
+};
+
+&uart0 {
+	clock-frequency = <100000000>;
+	status = "okay";
+};
-- 
2.49.0

