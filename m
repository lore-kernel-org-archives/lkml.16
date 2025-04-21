Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE3F2A1BF
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745244896; cv=none; b=n1WcD7LZjTSuRh7puQPC0xKuVNgVSA/cX3V15K/zuGx5lSFZalfZR2CY6FXlM3eeq5hQVO2bUwmyOrFzYqiSeCXCwguhWGwpSg7TTSwyaTYXCxOAVz1973O/VZaLaSgkOr9DlPnQURFmQKEmU2EF1VpmAbZW2l7FazHwRGrPF84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745244896; c=relaxed/simple;
	bh=MiHZ0TZLJAnpgW7IuP7V1rNCVEWEj2CMr1JZ0gSvWd0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HXeHwci2L4TWH2GvzDAnP5+FMjswtrKMPQXokr6PCZszDWXEcThCjI7sC3Qte7h65JN1O1538lGDIGFaXe+TC5UE+sH8P3nk1pxq9zCBzDCJg6J2ixuTUXnA8UM/gcORB9nAq5GrFCc36ILrEJCgD5vrxGmdURriGl8kGkKOjJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=DUxLKrMS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="DUxLKrMS"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso43944715e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745244892; x=1745849692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iId3OO4iPPoDitEFGGflVRfgetsV2ygJtDXi0T0AxTY=;
        b=DUxLKrMSTJO2QAKjvNsZArojkfz5cOYedE2hlOXSEqGAo8F+moisG/cOkqNIhWCbrU
         nrRmJzw0D84IOA+ZG0CNMnRPVuh3gdRkh7pL2FyCmnR/dlMJrdOqM8Z0mTVHm16YwcvG
         fk2hZc7Qk8H0dpY5LACh2ehgwX3965+dgiHcHbp6PVUlPXF7C2xFmnYsdqv63T/3ijBX
         cObfyIvbU4BeBQJPE2+CunfR4fG0e7OxW0fS5lkg6jlQ5S05FAoaZVBwi1Aji1rdNw2B
         leE+n0FZVMXmyul1pIybwQr8qAu6rNFDa9MDF1kPmDRQU5EweowfuIdc1LBKk0n8M78P
         BBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745244892; x=1745849692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iId3OO4iPPoDitEFGGflVRfgetsV2ygJtDXi0T0AxTY=;
        b=HwxhnokbJiK1gZwW8p/+vnhUCKPKU9nZ9L2XtPHdrDe3f82w7irvDdkOAdRyuA1nNy
         /hFlDFmzbgwVpPynmZuZrqkrPNX3jhiTPZf1Vry3PBH2S6HdKajJ1Gszucuvtv0DLbg6
         OoG1ZS/wlXCFkUOqB9WOnYGgb1aVAFuTMVNMoxJEWn593AHIBclMZWsBgZdRtXrvkel9
         QNRlpb3YY71/3YNKLKNidEiU1XjtMYeEcaVRUBOilGKfp0fGKAWxMYFcsM31jSp6IemU
         TgYVsSu/QMFyX7RtxEkvEd1/HZvEZDdtXA0JTzDWN41JHLwIEzfQyVXk9IqNFvOUy1sK
         zDPw==
X-Forwarded-Encrypted: i=1; AJvYcCVAw4fz915/jTlq+Pu6H4lmD+dD92cALf478m7LwDbEFr+OAjYBkpN9PgrmEhJ7lhhkrAS9klhG4mmGGDs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3F/jP3vZ3dfPaePe48AUbIn4IbyJe1OQiciQam2mfrYTEw4xA
	9fdabgnfCZ/rGkvHPl0uZQDD1vmmEV1Y55efkr1TEN7cDcTg/w2Nu/IIodnfXi8=
X-Gm-Gg: ASbGncvkxW1Oqg2s0OIAG8j+xECOSxYrttuGMjLNC1sMNZ26oE8+zaFjotc95PB3E4n
	XO0OhmOQ4xAyQwxQ8X1s8GbP71PbOv2ha1OUdMLq8fM045l5sH58k/hZq6cjtiUbDJ0nUl1BsWO
	5XqBVOBwqJlqSpFEOsdMLLMQM12MH/5/T7JfR+3V86Ixh93FMWw6hRygOPOi+GCp2YfvDvaYw0i
	tBIgEtwLLaBenlLT/LPOHANHCUwLqJROcRbKa4p8QwBP6pYf23WE+I8BIpSygpJEnYeCZGXNbSz
	meplCf/729RF56VUwYrttVQJ/9Sac54pzUnBpjf1z0Ld/4XLAg5O323y9pVS9S31xqwR49YTYUM
	9l1bendlS
X-Google-Smtp-Source: AGHT+IG7GDN4v2GYmvAvZdURoHs4uth6LMLhvKJsf8zWUpG9THKVhntnk/wGfEVNyfGlNchCxTCbDw==
X-Received: by 2002:a05:600c:4ecc:b0:43c:f969:13c0 with SMTP id 5b1f17b1804b1-4406ac17729mr92801105e9.29.1745244892524;
        Mon, 21 Apr 2025 07:14:52 -0700 (PDT)
Received: from localhost.localdomain (176-147-145-44.abo.bbox.fr. [176.147.145.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4403605892fsm116767405e9.2.2025.04.21.07.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 07:14:51 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: hwprobe: export Zabha extension
Date: Mon, 21 Apr 2025 16:14:13 +0200
Message-Id: <20250421141413.394444-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export Zabha through the hwprobe syscall.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index f60bf5991755..a4998ad2dfe0 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -271,6 +271,10 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZICBOM`: The Zicbom extension is supported, as
        ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZABHA`: The Zabha extension is supported as
+       ratified in commit 49f49c842ff9 ("Update to Rafified state") of
+       riscv-zabha.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
      :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
      mistakenly classified as a bitmask rather than a value.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 3c2fce939673..fca15f2bf6f3 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -81,6 +81,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICBOM	(1ULL << 55)
 #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
 #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
+#define		RISCV_HWPROBE_EXT_ZABHA		(1ULL << 58)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 249aec8594a9..ed3123396a96 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -96,6 +96,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		 * presence in the hart_isa bitmap, are made.
 		 */
 		EXT_KEY(ZAAMO);
+		EXT_KEY(ZABHA);
 		EXT_KEY(ZACAS);
 		EXT_KEY(ZALRSC);
 		EXT_KEY(ZAWRS);
-- 
2.39.2

