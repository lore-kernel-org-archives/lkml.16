Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31185274678;
	Fri, 25 Apr 2025 15:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745593360; cv=none; b=f97SPOhoVGfJe5lH5UJxjQf6yjdNNQ9b3xu/WXcJQlgalmqXl5eezB4RB0RJ9Oo2DO4XervvJr+nQfLfHydhxknizF3u3rJ3PfpR3TbgD+kaWEh8uQV0aP+nHUK+cIHr/IwTgw8CabTKXXlROVyCH/rhJ2G2yXzsg54qDBfkGlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745593360; c=relaxed/simple;
	bh=dxmjWywiK0Xyl1oGWV/pydlU53vhd1+AcfgyENDB0jE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FCBkDItrZmcBYd93/T3TPA955kpaAZ0Bl/QahMDL6Xd2Lcrn291cmNprERtW6n3wrO1NAcpPLzuTkQZZtlt2jKYXxbWONUpol/zu4wcDRd0vwy3KW5FCzRbeMnwmwgCQXbqMlUM3A1VUngk2XLnfofx7xiRpz8Cex7SZszBNIqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHPUBc3H; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHPUBc3H"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso3038039b3a.0;
        Fri, 25 Apr 2025 08:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745593358; x=1746198158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tWJq6XlOyiQDY9fEz34q6TpB8T/RU7UR54sdkDEpSg=;
        b=mHPUBc3HheRqxa4cOdkuJ+w28l8WXsERgvOuse52ZSKDezhrFMjm27g69KpesosJsM
         OefFGspn7LcQ84Oa8tvdvEZf9NstIQqcEPTxT/EJR6yRV4AWPfs89097IJf+J1UCTAmG
         jt2XxgXRD6iVBHzNFdQi3OgFw5tIiIFF80qSYI9jTKP1TUF8C7UESJm9lA7oQLxtJ1hm
         0AsaH8/4lmXcS1us34Sl2Q+meO8qjqxWSUynkFDtkcRWf1UUJu0MzlBUvP/pZFaghaSQ
         B2HmZHc5MXF1+ShfmQGQBIYV+AUU+L/Yw70s80XVFDCZ8ebbw3SMiBolZTvuQDKVh2rT
         huIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745593358; x=1746198158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tWJq6XlOyiQDY9fEz34q6TpB8T/RU7UR54sdkDEpSg=;
        b=kggy5b4Vhw33ZjiSkSVVn+rZkz7Iz80vOKJqv/h05CNQ/aysLVsw/7LmuS/2CPcepH
         L4n06FVHAwsSClF1v0+Q8/FY6pAECI80wLHP/RcGSml36tqsTtMLiwNmfpfjOCK2ZJJv
         uVPVbXl3W4r1mniz9AN0tonu+wxU9Rq+civMob2TRc5uVGEseEX504t8IX2ukI/BaOZt
         fErERSS8TBzGVmdjvL+ZLbNfG4xMm9+E+SCF8eh3OOSBzncklTPQeyabnyvGyAKcy/se
         r3vKHRXpitB1541BK++MtpnUN+0v6OI3zG8GviAwYHUlbKfdIGyaW+KGiANYszoUums5
         35UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTUsvnn24+q9wq47YdKlDrJv7IQjfQDcROuMHH07byGUyhiFIQcxC2LsmwwCVLoxc2w4dnZerdU6OZTNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTdvM8PDdL9Pl7TOKLFj9qIHzpfZPMlic/83j5+Fl/1T3FhU2U
	Bux7noTI87GDsn5owctO36Xgb02UhrNFirx+xb5Slq4hOqvEK1kq
X-Gm-Gg: ASbGncszJ3pA2L9MiFHbiYUGFCxTt4WgSBBsyFusCHaPICbMWW+33wJ8RNCOM7srZnU
	HRFjbuhsInAeBXsqlFq6yepjPwjOYI5OlB1IZczlZmccZHuZ6q8lrBLzIfyy4WebF+jQ3TcKv0B
	EGNkZoB0LNtoppLNNzi49+Q6k5f19yV55D7mWZd7MNhJtRwinA3vO2Q1Oh7iWeHNaogkPXxC0pw
	eV7X64gc9ltWZtKqiCASsGjChgtwbtPEjg78vKTJWSpji0SrjM0Z+5cOYgYLetPgp+uV2VupG1e
	+RNVdvQkAnv0ojW1wiQiAkya27Rw2h6SYCfeCdJyY3xgZKB+hAdR
X-Google-Smtp-Source: AGHT+IHTtYhjS2JIBkQcm0mKs0zc9Y3HQI5vNbYB2tTsjnKaosMTzLOoX8dqIc5SryHq4WGWl8GeJg==
X-Received: by 2002:a05:6a20:394f:b0:1f5:7007:9ea5 with SMTP id adf61e73a8af0-2045b6981dfmr3922340637.2.1745593358409;
        Fri, 25 Apr 2025 08:02:38 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f76f45bcsm2996984a12.13.2025.04.25.08.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:02:38 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 25 Apr 2025 19:02:23 +0400
Subject: [PATCH v5 2/2] ARM: dts: vt8500: Add VIA APC Rock/Paper board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-apc_paper_binding-v5-2-3aef49e97332@gmail.com>
References: <20250425-apc_paper_binding-v5-0-3aef49e97332@gmail.com>
In-Reply-To: <20250425-apc_paper_binding-v5-0-3aef49e97332@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745593359; l=2603;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=dxmjWywiK0Xyl1oGWV/pydlU53vhd1+AcfgyENDB0jE=;
 b=PxBRFd+DlojZ4UuFSxtTkoHa3ihmZ8vGszUhdjVd8fvssBYzBTNSzR87aR80bopVOFFfEd9Me
 g5o2t+bOzVOBu8dOaCXjoXuj0ASUJKLmYVJYYyCBF7GaH7t5CJ6KtX7
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

