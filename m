Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9531024BC1A;
	Thu, 12 Jun 2025 13:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734920; cv=none; b=t1ztwf/IV/XfXH0TaMDB7La07gb5eIeYMTkDwD7NaREICpBjZYYhgjqYSCi796YpHYS2x/a5Btm585wCvfpsXYvmM5tKRS7zVpFMbPR5y6h6gB0pBXQilYqTyYmyN5miGfq4/tpnbtAjZ+Wb9UxqKvRLk4TH5SnnNPgDHy1Ppks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734920; c=relaxed/simple;
	bh=KPdk18C2Mmn0bNodvsmhNM54MGwCa/8PptymjW3SDLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fww6wFX8fVIuZQYYBJO6D3zeCjuqbE5KtR+zqUUB+gUf4t1RZYTYs9r2AnfwZZG7v/T6Bj5iQIHQQn9fZNJKx0rV2YxcQhoPr6cpt6N4v/4yqkRBGOk7pdVzsPkQbV14UXOFhmf4X77hB2ZYlaVx0VyZW7XdPMBSG9RwXVG05YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNpBmFnt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNpBmFnt"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d7b50815so7850415e9.2;
        Thu, 12 Jun 2025 06:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749734917; x=1750339717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekGeHvNSL1SlOKhiP/GYIMa5Q3fMVm07N8k+F21EM8c=;
        b=eNpBmFntyTIZ6l2+uO7xNIbQM5AHYaLVY2rfX4TFe08yjy5+FdHd/Yn+A3hYUSNsTb
         kokFY4dAd+o+kdvVde5W0sxWx1gIcNWJj1+KxC4+DG/DhrsDho24Lxpi2Hd7qYaC2UMl
         wkRvZFM1Iobn6z9pi5JlIN72H5ouNTs7AIBObHTAC46QwyLbZar/Ma3TszWjo3rOE7Og
         Iy180csEj+DcEiq2zpYUQHNBKQyLdEyI2r3LRn7/BS2G6pUnCgwoqIotMhRU4lq/iKG1
         dZfIBgspUTGCEEv5/TJZC8J7GfjMAMlc8o6019y+esYR8DyNyIyj+fXMAMz05ic5emRd
         X7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734917; x=1750339717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekGeHvNSL1SlOKhiP/GYIMa5Q3fMVm07N8k+F21EM8c=;
        b=b7svIL2b44RkIx+fTI7//GszIyVIfecAxUUCnSojXGInl7EZR5EW/TDRTD6qWxCmvd
         Mj6cqNJ6m7I5oRwsyusdh2hAhJJuOh0EdIL5c7gvL3thKi8w6lS3yYghUaCXDRahITmI
         nPazLTQVjJUN7cUuh5lG1hynhvQchGSXAnpECZFHC0Wvr4OV2Rj3eFQlVphi/cvrVjVC
         75ER/97EVRL39eb1Avi+nJQT/y4B1GM1ZtIoCX+yMS6EH2HkQj2B/e3UHBB/eWCCnF23
         unuQwCOwG+zliGDHi+4hrINcAg6W4FkYBd4JAeBLVK0lhU4MiX+w8mvAJqho35M7R9Ba
         KI8A==
X-Forwarded-Encrypted: i=1; AJvYcCU84/edki9HF0H0hpw9GQr1kBCf+oyjNh8sIRFOKrSJb6i+LhrlTJfy50ppd3iOzPjGD80sl+TOBgXh@vger.kernel.org, AJvYcCWwrFgGFaXHNc5Z8G/pgpucXZqarzXpLkDuB2Z7S+h1+FwVXsD6gN1TrLsS2zo/9noZh/Ps5iZ2pMuliQsY@vger.kernel.org
X-Gm-Message-State: AOJu0YxhMoVRBYC3R4Th+dmxGlaOFBGgJ4ula3UvzKpf0ig1Vt2NXSOD
	dF3zKiUEXRoaIzK1o2I7qmwgGli254B4FpILmSjVQS4hhii2hdFPykRj
X-Gm-Gg: ASbGncvxCf8keZHBI1G7hZP2tMoPDE2S5KGQ1M1Y0JkpjjkVkNleginXVpwBOkxWbhe
	HibMxd2hi81AENuwVa7czltIlXIw5MmnzdHcO2NVrnJ/9/pdzVjyFvlS1nUn5Hrs1EMTTG0WRzr
	5QdfEzLRQdfh+fHnTmA3pOkZ/kaDRYhbqrB6jUmwZkBPSTOIt5dqkHqFTOnBSAtOrOoXTgtVmNN
	8wj0auttP2XawLxHIKGwjMG8aTgCeZdN5UhgAyAwpEzhIprUGs1UxBNJAY76ObZS2DVf4IbV1+m
	V6oL4/xZcu5C62lRihk0pwRqCBlB7Mc6zJHZ8Z0wEAj6nMR2iV7Nv4TglZ726i57Afg4VEuKBOo
	=
X-Google-Smtp-Source: AGHT+IEKmn4RY6c+gClx41nLsTgX4Xhg6moGyMTvcwXAQsiQquwBWP5O0+rXDnZmBQl7NLCd6MAESg==
X-Received: by 2002:a05:600c:628c:b0:453:78f:faa8 with SMTP id 5b1f17b1804b1-4532b89b7cbmr36923045e9.6.1749734916493;
        Thu, 12 Jun 2025 06:28:36 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b653d5sm1982809f8f.86.2025.06.12.06.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:28:36 -0700 (PDT)
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
Subject: [PATCH v8 3/6] arm64: dts: sophgo: Add Duo Module 01
Date: Thu, 12 Jun 2025 15:28:11 +0200
Message-ID: <20250612132844.767216-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
References: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Duo Module 01 is a compact module with integrated SG2000,
WI-FI6/BTDM5.4, and eMMC.
Add only support for UART and SDHCI.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
new file mode 100644
index 000000000000..32c988f3c58f
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01";
+	compatible = "milkv,duo-module-01", "sophgo,sg2000";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&emmc {
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+};
+
+/* Wi-Fi */
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	no-mmc;
+	no-sd;
+	non-removable;
+};
-- 
2.49.0

