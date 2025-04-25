Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3AB253348;
	Fri, 25 Apr 2025 13:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588000; cv=none; b=YvkAL0eEGp9+HFqE77iQwWLb4MPv4YXSVjjnF5/CK1KCGwJX51jANcpBjeoWeCgbSrIfASiSLv+nBV1r32Ypn90pKaVqD5xJRquqdzc49yHsng+iNzRR4QjCFD91jloUxsKhXlag+i4Y1mSWFE/nMDa+i9bAKH91GCJqGI5wXIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588000; c=relaxed/simple;
	bh=f6XbPZl25l06W4/0lWNhLm+SfMVWRp7cUP5Uz+CFH/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KrEiZcqdq/D1tfIiuy8LO1aXJufNnYI43HnHTxT6QHBFK61BqkJV///IqFyCiQ4MF1sxuQQACz0klQjJXk8EBsLRl3gSHnJ7GEUII6rmDa3JcgSuSY819uJcaQDxJoDuxkNbCOKmCP5cOWE8XNTRU45zHSe7dgYqqLfiCICUd7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bEqZYcDO; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEqZYcDO"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22c3407a87aso34937425ad.3;
        Fri, 25 Apr 2025 06:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587997; x=1746192797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAm79y7QM3RPmANHIVUvLRyIejFe0GX7u7Y2voDxIv4=;
        b=bEqZYcDOFH7fkjteOrtj+IvVujRuHnVV+RD1asnpQc74Gi/Kf8DGJru4vP6F5GLgzF
         TZi3/1uINa9b6aQZs3K0BDoqclRW/aZpcfoZTdVbP5e68EuL/e48QTUsRn3fd/Viz4/Y
         5r8u2zOZQVoubNZGTX9zKHDF5iNWlLUNmXu+Oy2SZ6clb7PsXTOoULrOKJxs/r9tGIB3
         0bPMCy8W1/wFhQrS1zplVs/gyyF9ue+0tJN7JphciLq3ySaugme9ldZMSe424JkvlXjU
         9TNO98EcbkMXLn5zqJ5AKd7Cx65Y9q56MCuJayuaBAiYTuFYPIZOB3ODEs8VV5qx8wh6
         BWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587997; x=1746192797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAm79y7QM3RPmANHIVUvLRyIejFe0GX7u7Y2voDxIv4=;
        b=UgCwTNvxbMdaO/mAnWyqKC2V8RSUOPL29p2v1ydMy9i2iR6wzjHKgwsaHGAUK8SBZ9
         CzK2+rd0bDQimFD4AVWgPFoMBX6EVdRhKaNqQrIyXL8imWtqaVZT0hbPSTJO13HxL28r
         FKokUYKhh46sIc3fGmKwLlZK8qt69RjA6K2vh22BDXs0h0ujD9q8WuC7JZ9gXXsyQmeu
         F9GFmI3L4LD6Y3nrr2wxEjHVkXNVhwDhMXVChu8Wn1H+WR58aCOXMFLgkRNvbs6x0XNL
         4LN0MDnyJRboZKXs+RwcuvDQ79Obo+2sD0IGRz42mAJf+Lpl7RxQUvknc9CEKjq6Vo/g
         xycA==
X-Forwarded-Encrypted: i=1; AJvYcCV/ob7xc1FPn0LlLZtJS1Kmab3f+pUE/xDj/QOirpvjBD7+gfNNHs0mz9N61Jyz8UrbNRaUZOHjDC5emm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ4kh+vc3ZOY0RfmZaF56oR9Ew0N7MFXvdA2UhkWWmjOTYPK0b
	HUQEW/RJeUFXdtHELwYhAVMND2rlly41RsfkcViLSUwxrJnazK8M
X-Gm-Gg: ASbGncutGzVLgVghnUpU0AV5GUa3v1N5vI1SeH2bD6BfNbGPlumflX+z8dOJMU6urUv
	PLIU1hneh+iaaQiwPUEwV2jJNDIMiueQ2sIHadQv0HWBo6Y3xymsg7zmVgCVHU0as6Um3DKtYgO
	Fwb13a4/yrsbe8JJoORHry9tBBNxV6Yrl0p3nAgVCtze55KgfegeVeKaFvo5wi9hvKiYmPaAmHc
	04U9qNDzslntlUF3/YjtOgmupyCfxkm8qPUz1G8FaRMBjrlCtiFfwO4yzGioTY3CLf4rK0GsTZj
	xzEOpBfdcyR9JPeyfsztsw6F7V4OCZRXWcLiE5EwFnblnDv5pSjj
X-Google-Smtp-Source: AGHT+IFRCKNYLsTMn88S6eE8HozK3R4+9MF2EBm/8JjtspNKvuzU41OY7WQh0WJF+EnTGfyFFHPRJg==
X-Received: by 2002:a17:902:ef44:b0:21f:6bda:e492 with SMTP id d9443c01a7336-22dbf63dbdbmr41128025ad.35.1745587997277;
        Fri, 25 Apr 2025 06:33:17 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e766bsm31834165ad.149.2025.04.25.06.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:33:16 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 25 Apr 2025 17:32:57 +0400
Subject: [PATCH v3 2/2] ARM: dts: vt8500: Add VIA APC Rock/Paper board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-apc_paper_binding-v3-2-846b0855420e@gmail.com>
References: <20250425-apc_paper_binding-v3-0-846b0855420e@gmail.com>
In-Reply-To: <20250425-apc_paper_binding-v3-0-846b0855420e@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745587999; l=2604;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=f6XbPZl25l06W4/0lWNhLm+SfMVWRp7cUP5Uz+CFH/s=;
 b=OFwQv0Vi8+yfi8ZdAsJ39FrNTl87PTpaXCOwzfb7PZ0G/XoCqvaHmBOltA4csm4m/yHq+q/PZ
 IongmfZc8HxCfCMFYpGpo3sRqrFiT3wTbn7fqygskGZIkvd953XfY/G
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
index 255f4403af91c1d6a22416ab694b8eab44bf98a2..c5a2e57d53af4babe40fe2d79b2f8d9c1ae1b8db 100644
--- a/arch/arm/boot/dts/vt8500/Makefile
+++ b/arch/arm/boot/dts/vt8500/Makefile
@@ -4,4 +4,5 @@ dtb-$(CONFIG_ARCH_VT8500) += \
 	wm8505-ref.dtb \
 	wm8650-mid.dtb \
 	wm8750-apc8750.dtb \
-	wm8850-w70v2.dtb
+	wm8850-w70v2.dtb \
+	wm8950a-apc-rock.dtb
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

