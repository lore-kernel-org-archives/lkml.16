Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FEF35280
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744762704; cv=none; b=qWX0kpptC8thPkwDtFrkRLqrhqJ3yt12XjZj1jVdnSLK1ZZyVahbdgRwMmQ1GDlgOXK+1jkKq9qKIowJkvsFhlrdIIn4CzIwK9VROle56YOoyu7nAiIFK9sX33EAVB1Y8YZvn9rBC/1n+MzKqeD9KQTr8rMgQO8pr6oe1Bn1bG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744762704; c=relaxed/simple;
	bh=Wqjf8MiF/JedM/GbG2WBnj+HTu47AspLOdmi+obilKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qDrIDZ1XPeA8yrpiMwD9vc1jbKjVie9+4gVkzrXULUd9Cc1ihYefKMMne2W29I4peLWmQBjj/faPzF136d/QHYvMP+ZvrvwYn+vbX8RN2UiIN6aHd/ymhzKNIAVlDVkvTzOZaRMJYBy/MBGP99wo/IyYgyDIWYREvD9bFR+7PYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=KQo1zEY+; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="KQo1zEY+"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30332dfc820so6868345a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 17:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1744762702; x=1745367502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FHHVQpsIbnuDeKLq5XWbb0Gf2JvVP4rP5NZ4ZE1yCzU=;
        b=KQo1zEY+kE2r+jVTshUPdSf5jmwM7BpyzoXO4X0vbLuVGm4IFY+uxE5jBHJGt37B+x
         8uXk5sFZ6L2tRieyKj3SWjqLfaLlnIt0rzO4ogDPIMtKp0KaRnFWdbEPMIj5ZGtDteEy
         Not8M6sVnxpSCKDzUDUpXvbNh+2TM1i8wH1RQ7pfI8dZmxjuya19MtNtt/7ru/QcfsR4
         46fq3PYYjw7CCFUy+HU2teyoqgGmfpXlHQxG7pDM08uiXYoQVnkGPjeXGx2rG31PQOIV
         DiD6Mpk7rj97ctpQytJK0DbJnXXjMClusp4M/LW2sZab/of8qz5DX5e8IoFEcRHnNYmt
         38ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744762702; x=1745367502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHHVQpsIbnuDeKLq5XWbb0Gf2JvVP4rP5NZ4ZE1yCzU=;
        b=ivYO1ed4XQAPlXr5mxt4SukGWY8+puh/srFyKC7MeCfH9NwlZUHv5631VKBGH6wDTR
         74TYXUmm+jAIBuzI3k2sryNRCUYCVKEo9dwHho+9SUJXq5lOKJ3qfaMX5BFSU7b93bU/
         bjz+OJoR53/oigZ8pXWO6mQocHyjM1SuKOMhaSrDk8ozOxSg9QJdYX/NA/izaBwjOB/s
         pjIOt1C/Jzif6LM2DMoIrMBqt2XzzVVM9EfWbai5NWHbn964yY2oY26m7Zi6agyL75Zf
         dT/kr6aAQeVfq0X8z8AzxH4H2mDSJXRrjpJ16L9cabikGOpHKX8rSMmWaPbhA5Qnyc4k
         JTtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzpQH5bIyIOd5dFccqqspJFdSskTvOdblC9SFBfcind1sVHwg80FYhk1UrKb+hKaizEeWtOqG2uMVjFDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJbTPgru7IrtRiJqK6QOASX441r0veSHL8J1G3SDOY7K0pZRJV
	ykuhB94dG0THSqeAwLsHJ2FxrNJdW/+V3BOzjaZc7p6s30DJsp02e08pceo22gQ=
X-Gm-Gg: ASbGncut8RsgWUvUXfd8HsKrLD2DVPTrlaRYTA0QWv3YDbTHvddyWqV0rOakOGQJZFE
	Eg134LbTP1KTR9bHqPxMLwI/9mriPKf42+ZMvfGrg+hVt5ihmCOmjkEwqNFdSQdOnV+moRVe1Ks
	tusOBFzMaVRVuCG43sOXIo4+KoXj9hGFX+pUDdZactMEgKrK2oHMkInMLp9krn24SjY66/MVPcK
	S4Lom+r2EOhy66Ms/8vVzs7NBd301KHWYr18Vw9vwglRHIsuY9aZdhlDAqJ++KnuHWb0MXs1tmS
	/XBCkzQdrz5IZHKWAMTIDykR0QOoF3TVaIYt807o6Z+XQt2aH7Ar1MJr6JlZsY7+5aDxAmN3T9w
	aJtka96XsFS3G+ytEyVAWPXRscid9kS8FtCnzpQ==
X-Google-Smtp-Source: AGHT+IGQXrJZHPMM6LWgvsAdy/QqF14UAcREUTDQh9qmmvkciafZVu0XO4QDGktN8+p6wVAyj4lUMg==
X-Received: by 2002:a17:90b:2b88:b0:301:98fc:9b5a with SMTP id 98e67ed59e1d1-3085ee93fdcmr1396898a91.6.1744762702268;
        Tue, 15 Apr 2025 17:18:22 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:ef0:9d76:c8a5:f522])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613cb073sm211726a91.45.2025.04.15.17.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 17:18:21 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH] arm64: dts: nuvoton: Add USB Hosts
Date: Tue, 15 Apr 2025 17:18:18 -0700
Message-ID: <20250416001818.2067486-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The npcm 8xx chip has 2 EHCI and 2 OHCI hosts with driver support
already existing in the kernel.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index ccebcb11c05e..b2595f5c146b 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -63,6 +63,34 @@ mc: memory-controller@f0824000 {
 			status = "disabled";
 		};
 
+		ehci0: usb@f0828100 {
+			compatible = "nuvoton,npcm750-ehci";
+			reg = <0x0 0xf0828100 0x0 0xf00>;
+			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		ehci1: usb@f082a100 {
+			compatible = "nuvoton,npcm750-ehci";
+			reg = <0x0 0xf082a100 0x0 0xf00>;
+			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		ohci0: usb@f0829000 {
+			compatible = "generic-ohci";
+			reg = <0x0 0xf0829000 0x0 0x1000>;
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		ohci1: usb@f082b000 {
+			compatible = "generic-ohci";
+			reg = <0x0 0xf082b000 0x0 0x1000>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		apb {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.49.0.604.gff1f9ca942-goog

