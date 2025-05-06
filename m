Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8B81DE2C9;
	Tue,  6 May 2025 20:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746562028; cv=none; b=ol62Apg24fW7ACQx1//WV44774VRAJjr5xaao9gh19IaiZwlSK4gdSd/7z4yYTLlDCCTikqcVDtW/7JOpYJcuFnxI+odiyNog2FIaHCiHKuGmiHSlK8AgX+kXVQFVG9FpdDVi/G7/YPxUsGwgcVI6UmvguyfKd5JRrrhteoRjGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746562028; c=relaxed/simple;
	bh=np1yhCpp/qpjWGPuT2g9hwqJ7HuHqaWY+xGRBXC7yJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R4EeUHZYroAaeMX1OecJu1aFgdJSpjnxsMbLW4mOOgNccGj+5KJmRAYPTzSR/Ie4EFLwZIt29P534eMU9gRAdJhGOzBdX8sionI5TdG7gmSLRSGbP/8jQKDfwoYsV48rxP9CQhSNdItzdz/RD8Tv06Ol7noOkS07ng4Eb0LzWJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCuakODT; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCuakODT"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2241053582dso95268445ad.1;
        Tue, 06 May 2025 13:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746562026; x=1747166826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZxCy7mrct22eBjkvKCaCp8i27n4yjdKKChzB9Nlcrw=;
        b=mCuakODTArWwyJStrZwTroLuKqwZ4cbExcu6c2Ph1HkfPqIznAk0sH5JAicBNdNgFk
         +9Im9XmsaCDIgSmww5mVTrNB5gEILQJuDnFNquR7polUTTXkNDrRercp5ePhZGYXg8O+
         CS0hNO4Dv/jtEyu6tCzTcLI6Ctdoh/MgMjzub5rsSSNINx6zVK0iFIUwoo8jtomlqUMG
         LxSbQWd7l/xVKGqHhtiSaLFAQ1gGowdIoMcxEhKfbJ0z19Rfzj1pmApSexRsQRXVQtBS
         2fqDV3yrg6J9qKMdfWITtPWRhTHhrNY21KT7QzqQcQFf6nnkNSNQgj25dPi2BISgSrqB
         tORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746562026; x=1747166826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZxCy7mrct22eBjkvKCaCp8i27n4yjdKKChzB9Nlcrw=;
        b=vkjlXc0x15wUW4xZ582PFoZQqfScRlKEH8RZqVDCIZhZA9007bbhvkjXURY+UX8mhR
         Y4oT8cdt/WBebKuUaWOflj+ALgTtQnMG4tU4f8jY0CdlpGDdZhAHASiGGAszOo3y3JYM
         rZIW97U4UWVweqqX+KuI0TWcWSBvwDv6L42wlKx8R1Y6SJxYPav3Q+MCVKOmd0yu035L
         2Nc149QKwolmwv6S3C22XhPoqmKFP8WdGcXmOUyAmhxP2As+Vgz308mx4OYb/07wU+p1
         YjfM0TDbOpDegpn8NDLxxoQVTl86/hWC+hBs+xdXHUFkifSdmOZCavgT/o/kCj0Iw6O+
         S7hg==
X-Forwarded-Encrypted: i=1; AJvYcCWB6Evfl9jpTX7zz+ru0mMT0anrku+bRJRk2soB2LLU1opk7+dFwqy2dUmPQy3MxwrAxWCrP95hklEwD1fe@vger.kernel.org, AJvYcCWMqID0B+FLnDnBChBfDJgB+fs0C/cJ0Z/7Sr6EPzD/NNmuYh8Z3h9t6S70FHGOSwIdfYuC3pfhiKcQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ4JqkiCeLbNQo5BrKmhgeJjy8Bf0NJRJji+Fi3QG6TpwNDHJh
	8CdD0T3KGUWprmiDgReT+s/xFKGd2ZKiBZmL7DmQys/E8LF19pvBTyfx7dxtyLo=
X-Gm-Gg: ASbGnctLkw6D65CcTs5JdYZczt1A0zGQ3dVr0MFPKyNa9htOk9udveAKi+ZURUxVF5A
	aM02qBEA9ePof19FPja7uvIE7yNrdtNkTsM1/xY2wzW7OaG0TZVXXTDv1wFgYxxevRhXkkcF+R5
	BDbyMGKd8B1YEXGS/7nmWe+qKmM4HJ5i5oW2c3rkRlsJzENVWLOEg2IqHBoAuNodAiuuaE5HXFy
	D7YyhtEeKmTBX8xLil9CRYbae28TtJEwvEal/VVIOeqrOCa4HCy3VLVCIo5W4cP3RIuKVhqyGFG
	QaqJ0Rc+ZjhJXYIYSWMhsoT+uqPkoLgsVxJzrccJnVP6c+Q1LaLK8ItCJxGgnY0=
X-Google-Smtp-Source: AGHT+IHgty+nWlNjvTn6uA89Smf4WEwkFQeboQPPyPj2tQrZt5RL3JsInUt016uy2gN0K4G0GCNLdw==
X-Received: by 2002:a17:902:e784:b0:21f:1202:f2f5 with SMTP id d9443c01a7336-22e5ea70a93mr7009825ad.8.1746562026263;
        Tue, 06 May 2025 13:07:06 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e97absm78378635ad.62.2025.05.06.13.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:07:05 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 07 May 2025 00:06:14 +0400
Subject: [PATCH 3/3] ARM: dts: vt8500: list all four timer interrupts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-vt8500-timer-updates-v1-3-6b76f7f340a6@gmail.com>
References: <20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com>
In-Reply-To: <20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746562005; l=3301;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=np1yhCpp/qpjWGPuT2g9hwqJ7HuHqaWY+xGRBXC7yJw=;
 b=acj9oqY6ajaVU5Jdm/+NS52srXwXFDErkKw/vH45g0NmZPqUHKsdDmqsG39gjwMEAfZdC+dIX
 Kxa/8yKPuWGBEKPxh2MZY5a0osj9FK/0b0OPvbVxF9Ahurk+TAxBM3O
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

VIA/WonderMedia SoC timer can generate up to four interrupts corresponding
to four timer match registers (firing when the 32-bit freerunning clock
source counter matches either of the match registers, respectively).

List all four interrupts in device trees.

This also enables the system event timer to use a match register other
than 0, which can then in turn be used as a system watchdog (watchdog
function is not available on other channels)

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/vt8500.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8505.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8850.dtsi | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index 2ba021585d4889f29777a12473964c29f999f3a0..d1dd37220d41becece5d24fbb19aa71b01723e35 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -111,7 +111,7 @@ clkuart3: uart3 {
 		timer@d8130100 {
 			compatible = "via,vt8500-timer";
 			reg = <0xd8130100 0x28>;
-			interrupts = <36>;
+			interrupts = <36>, <37>, <38>, <39>;
 		};
 
 		usb@d8007900 {
diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index 99c064c916b2279797f71261ca9306e9dcd4bbd8..2b1819f0c5412648a83cd3eeb495f68d2e4100ef 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -209,7 +209,7 @@ clksdhc: sdhc {
 		timer@d8130100 {
 			compatible = "via,vt8500-timer";
 			reg = <0xd8130100 0x28>;
-			interrupts = <36>;
+			interrupts = <36>, <37>, <38>, <39>;
 		};
 
 		usb@d8007100 {
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 0d6c7bd87f7dcce0eef056d04c38ab1de5d52639..042eec78c085d19fc97d7f0f9721399c0716ff74 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -181,7 +181,7 @@ clksdhc: sdhc {
 		timer@d8130100 {
 			compatible = "via,vt8500-timer";
 			reg = <0xd8130100 0x28>;
-			interrupts = <36>;
+			interrupts = <36>, <37>, <38>, <39>;
 		};
 
 		usb@d8007900 {
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index 0158c0ba5dd110957eac38775d3bf3ebd2ab4154..56342aa1d993a43e7ee766f93151c6d456496262 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -253,7 +253,7 @@ pwm: pwm@d8220000 {
 		timer@d8130100 {
 			compatible = "via,vt8500-timer";
 			reg = <0xd8130100 0x28>;
-			interrupts = <36>;
+			interrupts = <36>, <37>, <38>, <39>;
 		};
 
 		usb@d8007900 {
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index c4bfb4d30aad0358b39cbf30edf0c63e32167bbd..03e72f28d31b1cfdcfa71ede93b8943971bae4e3 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -240,7 +240,7 @@ pwm: pwm@d8220000 {
 		timer@d8130100 {
 			compatible = "via,vt8500-timer";
 			reg = <0xd8130100 0x28>;
-			interrupts = <36>;
+			interrupts = <36>, <37>, <38>, <39>;
 		};
 
 		usb@d8007900 {

-- 
2.49.0

