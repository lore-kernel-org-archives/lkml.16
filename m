Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F3122FF4E;
	Mon,  9 Jun 2025 23:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749512518; cv=none; b=QR0ORHbPOsS7lXUyum3+KWj+PyujNygjXHK/nixEOSqJOlapkn77F/vwZ851r7m7Q8oUZ16U0aARfltot+stG8te23qPCh5IBAe/8MF9zvIsltmxVK+0zYW7Gti1n6lTAWGQJnZfe3VewWATP0P5Y0sygwXLtiwffgQzRKpV0Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749512518; c=relaxed/simple;
	bh=hmPduejP80SEZYrzL0CO06DrhaexK+gwyvfe6CwhzqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RtSqyzh3alyizRun6BbQXwCnxXBPtpcSuANGvrVqlp/7IOV+hIomZL9TSMet3kTaD0B4zxz7KRfiQUBt4lZHsXTnx7ZXm2LgBib1FSuDpf38+bzgW3/0c0iiVdJHzLRui1gomdIX5J1pN4Oz0oIxsJKRC337q9NDXuu4S1xehLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsPa7jJJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsPa7jJJ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so38427195e9.1;
        Mon, 09 Jun 2025 16:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749512513; x=1750117313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqgDsCG6KOcBqitJq9JMX849ZPDRQzOs3fqgijVu2+M=;
        b=QsPa7jJJJ9OVKmWkIyeQozRxh4q9Vimhnk8rJ0FBcpQCaEw3c7erVN+ZK4xoEBeG6e
         kYyMDO6Pk6hSd7LMkLN72uLPMmlgC6YqnEhZz+O1UgvbYIPyZMHZynZPwM768m2cKOjP
         FYzQPlslEsbnrVW47lG/F6KG3avA6ArXdYb/CQYcHi1mNL28I0pGfoh0VqdDh6thPoFl
         yr949T9fbdMNXPdCOFhmLWB3YoKxCJ5yOgfOD4+KzBiy0OD9swdMBPLxQqW7jUGpuOGM
         wbXOL8nteMYLCBC0vqwVlpDyaoVX0b7+K2EtLiHWxPEaYi+gAIa5hNLyxWZuR823u0Dl
         zb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749512513; x=1750117313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqgDsCG6KOcBqitJq9JMX849ZPDRQzOs3fqgijVu2+M=;
        b=VxXut68M7yAmH+Rdu3HeLC2Tu53Ra23jsn8pf//Azdh9Ku7toHmCBkvhHKAQrMry7Q
         NneuvC3RMkfgg4M8+o+i2e1rPg+G3K+rvo3rC9daaCsITl8IeCn4a+RfKmY39ZxLcs2C
         /HXtTidK7fYf91xRV/5o1xfY1JHf7HdjpfaHJ1935b6/DkuqlEUqhVN4dfuKwOVnd1q8
         mVBJ6ELddahtkx4lB67IPwjclTASUhZ3GAjlzOxl1/j/SF7TM3ujmZ5591qZ74yFY7JB
         uUODpGyFm6NbmCLTZ4B11rqj2/1I5dutx3e37+Xsl8fFe2wi5JsUXdGEJnylIZACKQ3D
         XKTA==
X-Forwarded-Encrypted: i=1; AJvYcCUDa52NhLzy7i1zGaJSc3TbJxDYEMCD6zVZJ6vvXCToOp3UdgMGP2+qplro/EgsoRJJNwSG5tudKQtX+Bem@vger.kernel.org, AJvYcCVilWa+KS5xZZw8aVIVmu4cPG71bxWyNjxviAXXQkJyQpr635rdAhe+7/uL6mYvvVZXrjIWLOtH6G+N@vger.kernel.org
X-Gm-Message-State: AOJu0YxWmJou13rczvxSalsfY3uQwyBQpDIlsHOppXYTi3xKYQBF8RoY
	G95qQL0zuI5fprQA7COHDmxXb9zKASaDGzyCzffWKgVGZfd136y55Hkg
X-Gm-Gg: ASbGncs/a+zYtuKa1LnB/HGz9uYix38fhp9zOjCBz5n3GH4zMF6NAWII3SJYLA5Zvt7
	hrxiBkIEGtAxyDd4YqDxzLdv2OmfMJncIiISgDt8cNyetFFzEGrUkmxBrVDQNm2Bay0bjn+mUpe
	h7RMaIZFiLGui5hNIKv/6F5sfdU808sMgdQFfwsPceM0T5QfL45Vj9ePIDmBwvm/XlfuAR7+vhS
	vXflBhJZf2iHnRuxNniDHmRQf62va+j69lFYq4T61lGjx+rUSOhcqwFao2/oYrlQ+XU00+Xp7hj
	521PS6w3Iwc73JHVW4leHbb2PBRzTvE/uSLvjKmZe5ubA36X8r5Iku3xqMc4xQe3qdNs9Bc9Rgg
	=
X-Google-Smtp-Source: AGHT+IG5E01PKSBDa2CpXIcLDEcgVeBGbKs91/xwnRq5LzqDPbtpo47hhaQbCqu4sMTtO6Hc0+CScQ==
X-Received: by 2002:a05:6000:250f:b0:3a4:dd00:9af3 with SMTP id ffacd0b85a97d-3a531cc1d47mr13174436f8f.56.1749512512569;
        Mon, 09 Jun 2025 16:41:52 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm10849846f8f.71.2025.06.09.16.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:41:52 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 4/6] arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
Date: Tue, 10 Jun 2025 01:41:15 +0200
Message-ID: <20250609234125.722923-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
References: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Duo Module 01 Evaluation Board contains Sophgo Duo Module 01
SMD SoM, Ethernet+USB switch, microSD slot, etc...
Add only support for UART0 (console) and microSD slot.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/boot/dts/Makefile                  |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  2 ++
 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 79b73a21ddc2..3a32b157ac8c 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -28,6 +28,7 @@ subdir-y += realtek
 subdir-y += renesas
 subdir-y += rockchip
 subdir-y += socionext
+subdir-y += sophgo
 subdir-y += sprd
 subdir-y += st
 subdir-y += synaptics
diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
new file mode 100644
index 000000000000..94f52cd7d994
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
new file mode 100644
index 000000000000..b1f8a5787861
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "sg2000-milkv-duo-module-01.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01 Evaluation Board";
+	compatible = "milkv,duo-module-01-evb", "milkv,duo-module-01", "sophgo,sg2000";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sdhci0 {
+	bus-width = <4>;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	pinctrl-0 = <&sdhci0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.49.0

