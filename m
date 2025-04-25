Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD2C78F4B;
	Fri, 25 Apr 2025 14:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745591663; cv=none; b=rV/RYDiU72dzsOpWaPwm/yx51rGGe87m/hIdViy7s56D8gMkuPC9MuU34CZWrOt45LgRj31x3X+Os4E2TwAVjzbT242AFwf0T8MK38YJ7vQ1YUeiuQaqFMxPrIJu52R0GGrZ8cxiRQlEAeXWZtFlQ1ZPTdK/FdpsZLRxYEgIa7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745591663; c=relaxed/simple;
	bh=dxmjWywiK0Xyl1oGWV/pydlU53vhd1+AcfgyENDB0jE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mZrO8qzc7goYm4/Btdd+LgE9CdT6F7qtpmhpQXv78s/GVwQHZeWQsElwok4cGXcXzxnvtgJI7vaXZOhjIFtD1rwFZ2NI1NUo4omqCaTDz6yiApglsrdM+28AwrKHpvfZBnvaNDo9MtvNWPHROKItN8wte+0eLQinoLnpvMWC1S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3xpt4dP; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3xpt4dP"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2243803b776so40023625ad.0;
        Fri, 25 Apr 2025 07:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745591661; x=1746196461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tWJq6XlOyiQDY9fEz34q6TpB8T/RU7UR54sdkDEpSg=;
        b=Y3xpt4dPliZZndaFagpWX7S3pBOI2tRzZCOktB38pnBMOReeaXymZmL8whtgOj2HGw
         GXZ2ja534gAQaPGZop7KzMJInDthwGrZoJFTKdoRVfWxp5DWisjQ+hTwQkhYrVrd/LAJ
         4tNhDM60WlEqvGtmH2Q+PDsvzmZT8Sec3p3/d2w7tFX6KsqIPSvGk1MPrgY8n3yAsQfy
         D57RdI8F/BvfLgltZ4AL/En5waIoGXWBbRWmEyyxhP1ChCa/eJZyRMY8nax6gqhmVKZi
         ABX8jGyNoyqfKkWAXOiSTZuu+MsB9AgwEt0vk52569iY6dR2wSZ0BI/z0GtenwcH5rfh
         2ucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745591661; x=1746196461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tWJq6XlOyiQDY9fEz34q6TpB8T/RU7UR54sdkDEpSg=;
        b=VQulhOn0vXN4TR+LQYgo/W8Th5WiwRmvH79FuwYJLLPipQuUZbefiBD3n9OKmAVf8Q
         28KbWyXiSz38bjpC6I6PZGRpxOaOvRgNsr7w1B5R9cjt7+ukUnWs3RcHXXrfvlDZyy8z
         a0dfiM8MZWercoVwhomYt1Sjpc3uzUU9Y5ORAvaRDTO6pHc3RGwvIVY7wIyMpy9WjyKi
         9lXHBEw4o/EjZ5IpsvP5ao0+IkI2c0Ae9TDeKkHeAOXA/Fg95j7VSil0Eo+0XzwgQKI8
         eIyNIjQ8AW8VbaJx56RarJ2jgv0p5pjBp3F2NQCUW0b99lH5RxEgI6+Lqsuz/bCrbLkH
         0XNA==
X-Forwarded-Encrypted: i=1; AJvYcCXSOIMHvtuCb/6zk/u+46a4f0iKvhgmjBIQkmINWdhm3OICZ8V0bs8VtFi+5b8xfBB2FvXfdVV2gv3U2sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaenDvoNAhkuakpZxeiuH2N4WlII72WyaIvgiucJl5ERcm0cIT
	HeIj99rgV3fbIEZrxdzSaeIeA+49y9tp1xJApf0wyvj1qlKzu9Z3D+7xLSixXLk=
X-Gm-Gg: ASbGncvaXUO5gzSNVisObj07YXJLO+uQkx9Eqhv4pDfZAm/+Hfl5ghp8qKnabHh1ovE
	cRm65GFyRBdHgU2SU11ic6a3aMXIEIiMpd8WHF3mqKAuOfjxiVbQcrYqkbnh1xub1LrUc8vNcBi
	XpkYWwThA2gnyNwcDBC5nsKHb1HAIMCeSI62G4VS2xS41gRbY9fPsoPa9jwLfLWQXtX7BQsqzZ9
	OlV6tIzKTx/CkODQiTHNI02okXvHh/7n3BBC2UtAZD4pMGyqPL+7sBZUMAZnjzNYYYF/udXUumT
	BaUf3lmY74py37IzHJ6CwFvCpAF4h5Qm9wRnQcsb4c+gARsG6HgO
X-Google-Smtp-Source: AGHT+IEU0GV52aKMbgW3P/kjXtOrQ1JtVfrrWBFeROicqQ5bV8dmN7cDixmkQXRl7zWJEGMK+bSwLA==
X-Received: by 2002:a17:902:d2c8:b0:224:10a2:cad5 with SMTP id d9443c01a7336-22dbf4c8508mr41907325ad.10.1745591661178;
        Fri, 25 Apr 2025 07:34:21 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5216c35sm32860695ad.233.2025.04.25.07.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:34:20 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 25 Apr 2025 18:34:14 +0400
Subject: [PATCH v4 2/2] ARM: dts: vt8500: Add VIA APC Rock/Paper board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-apc_paper_binding-v4-2-0ec2d0febe21@gmail.com>
References: <20250425-apc_paper_binding-v4-0-0ec2d0febe21@gmail.com>
In-Reply-To: <20250425-apc_paper_binding-v4-0-0ec2d0febe21@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745591663; l=2603;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=dxmjWywiK0Xyl1oGWV/pydlU53vhd1+AcfgyENDB0jE=;
 b=sTNaqM2U+dP1CoAz8PAv3Jd62z7GBeFLFgjCyco+k8uSfsLW3hshOnAwbkJcvqd9QcgZ8c9io
 61Mc7w12CLNBAL2i7Bkm3gm8NcclYY/oRWxBhXxTagW5WgBJoXagIHp
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

APC Rock is a development board based on WonderMedia WM8590 released
around 2013. Paper is the same board, but with the VGA port left
unpopulated, and shipped with a recycled cardboard case

Its hardware includes:
* Single-core Cortex-A9 CPU at 800 MHz
* 512MB DDR3 RAM
* 4GB NAND flash
* 8MB SPI NOR flash
* ARM Mali-400 GPU
* HDMI output (type A) capable of 1080p
* VGA output (on Rock, but not on Paper)
* 2x USB 2.0 type A
* 1x USB 2.0 OTG (microUSB connector)
* microSD slot
* 10/100M Ethernet
* 3.5mm minijack connector with combined headphones/mic
* Half-height miniPCIe slot (with only USB 2.0 signals)

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/Makefile            |  3 ++-
 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts | 21 +++++++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8950.dtsi         | 11 +++++++++++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/vt8500/Makefile b/arch/arm/boot/dts/vt8500/Makefile
index 255f4403af91c1d6a22416ab694b8eab44bf98a2..6fd29c41f3660d29d0368e4f8772d46b0a3c414c 100644
--- a/arch/arm/boot/dts/vt8500/Makefile
+++ b/arch/arm/boot/dts/vt8500/Makefile
@@ -4,4 +4,5 @@ dtb-$(CONFIG_ARCH_VT8500) += \
 	wm8505-ref.dtb \
 	wm8650-mid.dtb \
 	wm8750-apc8750.dtb \
-	wm8850-w70v2.dtb
+	wm8850-w70v2.dtb \
+	wm8950-apc-rock.dtb
diff --git a/arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts b/arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts
new file mode 100644
index 0000000000000000000000000000000000000000..58b3c8deb4f20ae072bf1381f1dfa5e5adeb414a
--- /dev/null
+++ b/arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2025 Alexey Charkov <alchark@gmail.com>
+ */
+
+/dts-v1/;
+/include/ "wm8950.dtsi"
+
+/ {
+	model = "VIA APC Rock";
+	compatible = "via,apc-rock", "wm,wm8950";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x20000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/vt8500/wm8950.dtsi b/arch/arm/boot/dts/vt8500/wm8950.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..31fba05d3c3e70b21a64d08b5cdf645102a1faf3
--- /dev/null
+++ b/arch/arm/boot/dts/vt8500/wm8950.dtsi
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2025 Alexey Charkov <alchark@gmail.com>
+ */
+
+/* No differences have been discovered vs. WM8850, but chip markings differ */
+/include/ "wm8850.dtsi"
+
+/ {
+	compatible = "wm,wm8950";
+};

-- 
2.49.0

