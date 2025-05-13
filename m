Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3208F1DDC37;
	Tue, 13 May 2025 15:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747149736; cv=none; b=OUhEFxUSOPWaCSPEYflfMLIVTldnLOIvbESNEUN1GY9LcogPdLdg0+4i1fUMpbnholFq0Lbvke2//708oowXEJjGuAXQUbz9LI3z0qUlBXeBp1tMC8/w0HKF7H+bj96iYflH0JN1QdFP2wPKGPotkvxI4hFmVWYgORapMj32RLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747149736; c=relaxed/simple;
	bh=XkVFIrVzXVaXc65hfYDgo0j/VX5OMcZI52m72KWvTtY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qUsRNTytrlly8uqLhj1X9OfEpbSFSc/4ZwMoq5CLinekY69LEiy1wgnS0kQ03Str6G4FpBCJqCrJ7rLfeLwkAc1PP8y3G15IPDRi5txrCzK2aIoZb6c+KTKqyu1M4OSMFNocwL9LHgUUJwGpkhGHpBd7iD12NMbYNh5kS47bdmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwiIT/Gp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwiIT/Gp"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so66217795e9.3;
        Tue, 13 May 2025 08:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747149732; x=1747754532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7HOlMAg4ITw5NVtu1FU2SCoRgaRsj5LUWrw5KUtfOSU=;
        b=HwiIT/GpQcRV2iVctu4ejrBAT6ysX8VBE3Kyy+nRodbbhaV03/q2+6WGi+xaxgY4DJ
         E+aH1OxFgfVoA2k5l5Wocy57i9Pbdbgye3YyqN8dttu84gkMX/D2fj65ML+x1xRM4c75
         z2R7UvSNDHbrTYC+R2pAFjYTG+rVYdDgnm76LDPX0BHzNMSmgKChItnGSd+N9MxXS4NB
         HriHYocsHimX6Fzyv3oh2ukHKSx+bPuX/FU4/rN3pN5BM3La/4TKcrzKY8Dvx1m6fHU/
         HDQRSahKUCEni1CbDBKxEiC+KnyHly5jM8mBe38EuHWVS3zh9r4GGPNVPPWD9vIyzx7u
         oEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747149732; x=1747754532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HOlMAg4ITw5NVtu1FU2SCoRgaRsj5LUWrw5KUtfOSU=;
        b=hu4kDno4LIjTmUwuASV4eKd5Tmmp1a74ZzfJh5fSzKaOYCuFQvhf+eJQ2Uyb8dAUs6
         ZA9pg7A5KH4mM5gwBfLAzWIe7PP+6b6iHOn5PK6hnkmRTNOY4HzxVwnVDBEkyy5K+XaY
         ubeCK1atxt6kYQpyHmaO09M8w7CxJG2UK+plrMubc/056JCT/Ljxd+hzlBgAVn1I9p8o
         rbN9HtdEq0+GF/HzmFN5Vu6P8mPjc5KJC6KuOv1KJV/xaINxdC+o9bY4ReWMFBG5llWZ
         jtJccPdj3aN+FZki9/BYiXnRxTqlWtP8Uxjs/HDTtn/VVCfcBp8XtekhdH/mypDJo1ii
         dRgA==
X-Forwarded-Encrypted: i=1; AJvYcCUBULh5h6Sh/TOGdFOig5QN6jZKCpPG8Qvmq2uUIvTJSj73ZYzO3QWOtggkO12qTxLzckHNLjc/NLij@vger.kernel.org, AJvYcCXxgT0n0/PVxZH8RtjOCrGh36aTb9L8nZugpMnoKCSTAXl5hQqHjR2w9A9unGqAYj1Drme/FNSR8am/Wywt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2MtfLizhTfwZ03DHXTKgGolASUn007neNDGibTJtBQjJpa21m
	BSXWAe8yGBPoBkkhzYeyvOzv294WNz4S10pyKJzg6LwsW6lhvzFH
X-Gm-Gg: ASbGncuLyMbLe4MYjlNu3tRm46uHcD15607LTX/Th0p0TGGDcJa6Wir3ZdQhj632ex0
	8Yqqjdmoy/Kci5uJDS3QUQDt8NKV+G1QBJ9YWQrdWsmIL0ZYJiiQsSaeJ9nh4CS28tAZ35MP90P
	5Mn1sSHnp0LA7s54szj3y/hPZogVSLUdLu9EsvBjXUTArL6Fdj1ENkl1RYO4Bp/8kweB38H55AP
	Yf/mXKPmY6SdNGh8CNyxo92gNal+yLI4EfTodrPXCyWd1kIj9dgx5CM9sQAq9a+HDNHdVM4GV4e
	+tYOTh0dSNnlAc9DO+wcpabCwzKmFx0OMr3V9aowMZRHS8KMoViNhzdwdR26l4PLUJcFUffX9G4
	E/Rh4neUauR24V6z82NLTznpjjGjE763kP4lzRDCmMiK5FRwb9r25BjP8Vg==
X-Google-Smtp-Source: AGHT+IEg6PWgzF4jLLpPihZcPfaWsfwoK2cBnNIZhlc1AU9QDfK1ahFTXtyBWf5ovWIPZUOzXx90cQ==
X-Received: by 2002:a05:6000:1889:b0:3a2:377:500c with SMTP id ffacd0b85a97d-3a203775382mr9139211f8f.16.1747149732220;
        Tue, 13 May 2025 08:22:12 -0700 (PDT)
Received: from partp-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec0e4sm16384170f8f.40.2025.05.13.08.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:22:11 -0700 (PDT)
From: Parth Pancholi <parth105105@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Parth Pancholi <parth.pancholi@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: dts: ti: k3-j784s4-j742s2-main-common: Add ACSPCIE1 node
Date: Tue, 13 May 2025 17:21:55 +0200
Message-Id: <20250513152155.1590689-1-parth105105@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Parth Pancholi <parth.pancholi@toradex.com>

The ACSPCIE1 module on TI's J784S4 SoC is capable of driving the reference
clock required by the PCIe Endpoint device. It is an alternative to on-
board and external reference clock generators.
Add the device-tree node for the same.

Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>
---
v3: Split SoC support; board-specific changes to follow with Toradex Aquila AM69 upstream addition.
v2: https://lore.kernel.org/all/20250404101234.2671147-1-parth105105@gmail.com/
v1: https://lore.kernel.org/all/20250320122259.525613-1-parth105105@gmail.com/
---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 363d68fec387..d17f365947ed 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -131,6 +131,11 @@ acspcie0_proxy_ctrl: clock-controller@1a090 {
 			compatible = "ti,j784s4-acspcie-proxy-ctrl", "syscon";
 			reg = <0x1a090 0x4>;
 		};
+
+		acspcie1_proxy_ctrl: clock-controller@1a094 {
+			compatible = "ti,j784s4-acspcie-proxy-ctrl", "syscon";
+			reg = <0x1a094 0x4>;
+		};
 	};
 
 	main_ehrpwm0: pwm@3000000 {
-- 
2.34.1

