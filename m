Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA321FB3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744762438; cv=none; b=Dh6q/ZYAvzkTrqoLFWjy3De2vYLB12HOyFn0qCLmVQpcZtFr2Fa840PNOEguxcaoLvLWtEOmc5+PS8DU2AC4aQeXZqyp+FpXjtpzny6cTpnCSEUGUf3wKRCz2Um4Pe1hF7mOBMv3JUePzau6EjLPZWLbTdr3BwjoUzA847z1bME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744762438; c=relaxed/simple;
	bh=0fuGOmb+qatmclqZbJkK38ISLNsb9lHUwwxPGIhTLTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fRJHTmUOZhcrJVSm1WRlI6Zeoj3S4bn3ot/6oqvbO4WqQ+aifKl6LW67XyyAtyH+chEb6JArOFpydpmgrDl7unkQJvrTomx+6Gm+69Jq5vsQUZeiQWPbcwYyRE0XWhWmUSc1zas3mhXX+2oQWuv/vYx/txXKI2TClT5PGhIoY5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=1qyf0xgF; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="1qyf0xgF"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7396f13b750so6331314b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 17:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1744762436; x=1745367236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Hrq/5jnsaS2UvAtZ8/+V6NwQKUrA7NpnKCyv2FlWdc=;
        b=1qyf0xgFsR3c8PciAmF9TrQTaVaQkDWr5AX4m11lqVi9imh+t9SmwNrSNH3DlmuuVq
         ODDHBQuKHjsQo7qBvpRqA9M7Zq0zslYg+XMmykgnchPUjJqqYHfTxnxaMIOqIps5k64D
         ogX3YwXXQ8LgpGbH6i/0wJ2jjONeR8RnzGoKxGEwv7s0ITu3tlhe0+YBchfI6ZsAEkuL
         Zq2G6P4oJPt5rE56DxQcSdtiFPAYy/VglTniPGw3MUHl7t8s1J7d0Vk2E0fJ8L9/CIb1
         sYr2yjAKGaHFP7OiLvR/hdYQNhQOvcDexlAfejjLr5U4Wann5LSM3IAbGLbQCqVWUQE2
         /rGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744762436; x=1745367236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Hrq/5jnsaS2UvAtZ8/+V6NwQKUrA7NpnKCyv2FlWdc=;
        b=aW3IfWzpj92ZQt2QjydBcz371fFa5v6uPdmdHNh70MHG5pipGTHXxmA8EMnSNfPtEp
         3BDiSwME3eUOgbossUI0KambPrZV6/aXP21n/ObK/zKbCXChTEzvnSPAZhEC+KWx3G1I
         4dIAxWmDXlDWbC//9hC0uWZYwB4AIHhThoy95mKmFSGK2zUMrr0RmjE4tpW9p7L4f1zS
         4CeO4jDWqzqwHZpMuMXafCNLxZYaEj4i+MQTab53Kzmn1sz4MI2kW8nTq6ZTJnOF+dZR
         uIFn+jnuf/xGH4WFkigg4wMcSXUuVJ6DQjjgSO11dtAfd5taVr9IyHTcG6m4YMNCbu0S
         L5lg==
X-Forwarded-Encrypted: i=1; AJvYcCUI1t6cOAk7BZ3TmsD4LW4pnhq3nCOZIuusii5PGB6x51JUh3DziI6X0XmiaB3EAACDGWPGzPd1np+x3AQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoMyK0FRwasVxdXNpByW3Q2/VAuQJqohan5HrNQbECm1eh0lqb
	ZJHJ0pQ1hh/RltUTwhhISYchTBXS1KS5VCeAjfAkDZ/TFntPUGPM2f0XDtWhWeid95d6PJsVxQo
	mNUk=
X-Gm-Gg: ASbGncuMLfbdIxt/daZKQGEIGPNkF7NZqjzo8QXjxfHNdoawtXhOKKVoJ9ZCLExXGU1
	HW/+0ra7jHrRkOozjaDZ8GUWFGRbp7IcRTq0+wr71GWHeOWWaB2m+oQDJX9k3uUbSGIcRqQ4of8
	7IYT0yWKUsbav+wLexNHgo9wqcw6WJizsZNMB9eiVwHAU5dk0mOw44reckt61h1ksca8M19LLBM
	bddaD/Bh1LB9y/SkAB5Fpf4agh5cbQaXLLetxhjKg3GBYKfDypCe0iN7g9xdoxIF/Ld1zrZeRL2
	RA+C1iJPUnQuEIgmK97lkmouNC+eUK82KbH4W/PKg+Y1cqtZbsj4ksWjEhadTMjIbi6Pc8trCON
	tIOsMKhykKIzbDpp+yvAgZe1Eh9Mul8nHBZyYdg==
X-Google-Smtp-Source: AGHT+IFuikzPoPqd7B8f1cnRj42JNiLHhSl7BeBI58QZ7SkDEfmP4xHkdJrszDfHnU7WZaegvbF/OA==
X-Received: by 2002:a05:6a00:ad0:b0:730:99cb:7c2f with SMTP id d2e1a72fcca58-73c1f922615mr1633304b3a.6.1744762435765;
        Tue, 15 Apr 2025 17:13:55 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:ef0:9d76:c8a5:f522])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f1040sm9413386b3a.98.2025.04.15.17.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 17:13:55 -0700 (PDT)
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
Subject: [PATCH] arm64: dts: nuvoton: Add EDAC controller
Date: Tue, 15 Apr 2025 17:13:49 -0700
Message-ID: <20250416001350.2066008-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have the driver support but need a common node for all the 8xx
platforms that contain this device.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 4da62308b274..ccebcb11c05e 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -56,6 +56,13 @@ clk: rstc: reset-controller@f0801000 {
 			#clock-cells = <1>;
 		};
 
+		mc: memory-controller@f0824000 {
+			compatible = "nuvoton,npcm845-memory-controller";
+			reg = <0x0 0xf0824000 0x0 0x2000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		apb {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.49.0.604.gff1f9ca942-goog

