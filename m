Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792CD2BD5A8;
	Mon, 16 Jun 2025 11:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073010; cv=none; b=iRoi76zOFkph4sM7+BqiKgaZrDJdBQoWLauRb6wF6BGGbKL+/0Ez3rsMaUBKiDjUgfanimHHNulnO3NYgD3rkhMyMXTP71GBgNoqiulUHVJAsGy8CLmYcfkgliXMl+gC4S3S3feup8vjHyLu7VndzvktCE3HgyUPXPCJpDaSkcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073010; c=relaxed/simple;
	bh=cn13MD+YqkkW+ZeWZc6YLX1Q9LAquq/3iQjwn6K8z9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JeH/6Hz7gLIojV8W5K/6LY0eotRcdNriERS23fZvsCRQ+9xKWnOnjz0YoxjS1bq6/95MlYSlm8QsKn+2x37ks70XpCM6+NWSCm57N4o7Jagw0aL4I0okWeBtKTQiX5tD+UyxpJe25NrGnFvkq3ubKEkQ0AyYfAm0d5xugXTrzRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=qmZw4031; arc=none smtp.client-ip=216.150.161.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="qmZw4031"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=2356; q=dns/txt;
  s=NAESA-Selector1; t=1750073008; x=1781609008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cn13MD+YqkkW+ZeWZc6YLX1Q9LAquq/3iQjwn6K8z9Q=;
  b=qmZw4031VUOFEH04WJ4PHvba2H1pdJsZ0WSa8J3n5blicbIBFlP9ys9R
   NN1kpli7c55MwDqsRlaxtf+/e7Y3qlQt0XLAsuSqub8F4ovIEJin8xqSv
   eic7nv8/D5zeAo39SaZmSBTrqdhEYtjrQ3rPfVMfrzxf13DjbKnmzgRom
   UZ+IUomxNH7z2UcsR7deP9i7SYSrEp+0BwWI9OcrTuRQWhmhQt3JC9w5c
   tmYtTPuxro9aD9IxSCogaJ0tWy4DYa8wRzGUVLY1YZYJ2QM3D8U+n61Gb
   maS5GCjAiGKHrgV9Xb9NGCuCz10Yj+2mPEYWS5cHAfKvQ6fYDHqf5W3Sh
   A==;
X-CSE-ConnectionGUID: k75QcjoyQx2pmRDPyu10NA==
X-CSE-MsgGUID: 8LBG/hAzSkGKbaTkaesCCw==
X-IronPort-AV: E=Sophos;i="6.16,241,1744092000"; 
   d="scan'208";a="86117911"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa03out.arrow.com with ESMTP; 16 Jun 2025 05:23:27 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Mon, 16 Jun 2025 16:53:16 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/7] riscv: dts: eswin: add HiFive Premier P550 board device tree
Date: Mon, 16 Jun 2025 16:53:16 +0530
Message-Id: <20250616112316.3833343-8-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250616112316.3833343-1-pinkesh.vaghela@einfochips.com>
References: <20250616112316.3833343-1-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Jun 2025 11:23:16.0865 (UTC) FILETIME=[0E55E710:01DBDEB1]

From: Min Lin <linmin@eswincomputing.com>

Add minimal device tree for HiFive Premier P550 Development board

Currently the data populated in this DT file is for UART.

Signed-off-by: Min Lin <linmin@eswincomputing.com>
Co-developed-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 arch/riscv/boot/dts/Makefile                  |  1 +
 arch/riscv/boot/dts/eswin/Makefile            |  2 ++
 .../dts/eswin/eic7700-hifive-premier-p550.dts | 29 +++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 arch/riscv/boot/dts/eswin/Makefile
 create mode 100644 arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 64a898da9aee..29a97a663ea2 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += allwinner
 subdir-y += canaan
+subdir-y += eswin
 subdir-y += microchip
 subdir-y += renesas
 subdir-y += sifive
diff --git a/arch/riscv/boot/dts/eswin/Makefile b/arch/riscv/boot/dts/eswin/Makefile
new file mode 100644
index 000000000000..224101ae471e
--- /dev/null
+++ b/arch/riscv/boot/dts/eswin/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_ESWIN) += eic7700-hifive-premier-p550.dtb
diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
new file mode 100644
index 000000000000..131ed1fc6b2e
--- /dev/null
+++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2024, Beijing ESWIN Computing Technology Co., Ltd.
+ */
+
+/dts-v1/;
+
+#include "eic7700.dtsi"
+
+/ {
+	compatible = "sifive,hifive-premier-p550", "eswin,eic7700";
+	model = "SiFive HiFive Premier P550";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
-- 
2.25.1

