Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F41233149;
	Thu,  1 May 2025 04:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746074666; cv=none; b=uH+8nHSehSNxCUgNpCyIfqVq+Mz6bObP03Y05MPF01MGrctjZgIca7WFqEPNhnVoM4QwfPspKU7bcMZ8MYXEQIPWJd4tJ5cHSwN2tqeM2x/o8/nBzuEg0Hv3uVNxzT9AK1WvVWm2jnRg/PGY4BnYDekGLB6UOlDa0OBnlLD4EBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746074666; c=relaxed/simple;
	bh=/LzP27Kr7PItlbaBuhA2H/AWoUL7f41PHi1KHFImP2Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LAZgOJbzi4ggIu47Dt5g24Ygo6Z2779PreE4T+SdVtpHsEa7CZpwFJqaELFFh2VbPCKEkIL/PcnDLOuZd+9afe1Z9XLke+P70aHRKCDwpfDSIogvl7qrpIx3g442kB6UF/cxwuQ8Jkd2yzKpGEzsR5BTsJmBTeJ207Bc1GSKuxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=OEkw6Tbx; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="OEkw6Tbx"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B22CE25EF5;
	Thu,  1 May 2025 06:44:23 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PAlZ3cr2ZZX3; Thu,  1 May 2025 06:44:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746074663; bh=/LzP27Kr7PItlbaBuhA2H/AWoUL7f41PHi1KHFImP2Y=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=OEkw6TbxGDtroVG2dOqG4y/dgWTkRXTvBnJXLEqMtQyasWVYLTgYKwoi5ikD2I8nL
	 jYu1PyjJ3wFhu1GP2xRob6s6gr0t++gG4us6008D3SU8delOSy+TbYwyldlriyjgSM
	 18IM3hRT/GzjOUNrQr+1QNw8RdN90cbY87CLeIE5zIJRiaztTG+42XJAjDFRKjxDFZ
	 ZFlumOJpk9YzaACLEMy2wCPsl5Y1EThmScYIZkj2Pa3T8k6bkunEDaebN80CZhqbe5
	 gLsTlE2FgUa/YQLs3vshDgEOKPoc6UZTNDvLSfTIyRGpxiMiT6qLOZKPk9OVbGSfHu
	 mVJQ+BivgSD5A==
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
	Binbin Zhou <zhoubinbin@loongson.cn>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>
Subject: [PATCH 4/4] LoongArch: dts: Add initial devicetree for CTCISZ Ninenine Pi
Date: Thu,  1 May 2025 04:42:40 +0000
Message-ID: <20250501044239.9404-6-ziyao@disroot.org>
In-Reply-To: <20250501044239.9404-2-ziyao@disroot.org>
References: <20250501044239.9404-2-ziyao@disroot.org>
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
 .../boot/dts/ls2k0300-ctcisz-nineninepi.dts   | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 arch/loongarch/boot/dts/ls2k0300-ctcisz-nineninepi.dts

diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts/Makefile
index 15d5e14fe418..e55df9f385af 100644
--- a/arch/loongarch/boot/dts/Makefile
+++ b/arch/loongarch/boot/dts/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 dtb-y = loongson-2k0500-ref.dtb loongson-2k1000-ref.dtb loongson-2k2000-ref.dtb
+dtb-y += ls2k0300-ctcisz-nineninepi.dtb
diff --git a/arch/loongarch/boot/dts/ls2k0300-ctcisz-nineninepi.dts b/arch/loongarch/boot/dts/ls2k0300-ctcisz-nineninepi.dts
new file mode 100644
index 000000000000..a67a8ce4211e
--- /dev/null
+++ b/arch/loongarch/boot/dts/ls2k0300-ctcisz-nineninepi.dts
@@ -0,0 +1,41 @@
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
+	compatible = "ctcisz,ninenine-pi", "loongson,ls2k0300";
+	model = "CTCISZ Ninenine Pi";
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

