Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7614C2BEC27
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634159; cv=none; b=esUNJHSCDkBYlS0QK8Z8aiQIJj4dm7beJWaS4GmyOQVAAMk8vl03bdeupJXD2vJK8FKNGwG2Z2X9rqMZhqEiB/kzuEst4CoKHk/nlzsYXaFFlnFCKieR2M3docFsQmyaqwsIfTUzPJgXS45QLHlwQiU9GMm3JffqzT84IGvfNkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634159; c=relaxed/simple;
	bh=Sp08vMMklIHnRXWMXpzERONvQrNfVAASIS5bX53L948=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b4U65pFG5/xtkM/JsqtxRSkqVSlxbSS3V3JY9vRr1Ub7c1clTC0hZb8NTklXQTST+UPJo5F74KMj9DP8gcFxo/TbOShGa+3MYb3eKPcgfFKnyRePaSGR1WUagN1Ouopeji/umOmljWLHYOFxfXPl/mp4xg3+0XZiXuzxNH+sJ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=FzZt6HVT; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="FzZt6HVT"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso32042675e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 05:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744634156; x=1745238956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zt8QGDo/J4nI2rhGhXp0zTShJlIWRjHlpTKLd9eSTsQ=;
        b=FzZt6HVTFVHmqOkKFUzAtgCfzHisltnKBQ3oyK+RvCjQ3tT+iRmAMpTESsgti0x+FH
         FKKoI/Ng/MCpQpNrqTqA7Pg9atMN84VW4qfu+jIZ9civ0PAZH6FgFt9PPD1NeqbesIa8
         hRI3L1HAuiMD5n/SKLeWv5dqkG3Hs9FsWTIPQVVKzyKzstoH+3aN0k7CyETqxu4VG/h3
         02JkM1AFVgfjHAW8rX3VtIXICQcSDMCEWq1cz+mAZtWAaJ42Tb0tZjvRDDdR58yPjdYy
         WL3Gc7NWO2HuAlY+Y2PKb4WXKCLPI1lazlMv5okMP+EZMnDZWrlwTKBNVMmls6TP35HZ
         BkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634156; x=1745238956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zt8QGDo/J4nI2rhGhXp0zTShJlIWRjHlpTKLd9eSTsQ=;
        b=L/+zTKagwiEqN4NLmB7CCPimjH1n4CMz3MkKhIyxfIHcX5E2MDshhK1f137PJ5hN0h
         qrLt8Y35PUA2HB4EfK06KYmiB8XPiTsfsx3DT0dCKMQMT1QkKEyT+FVUVgVhP3i+Ms8b
         gh/pNqOvh9LwGT1Y4moLYBHwDrYrYTXg4LW73kHSVfoONDfKOSf054XTGVQW7QoR+N+O
         5/48ACAU/xy2C10vowgmdWEDoUUvF4oWIHLyIxXu2UZslfMtNef5nWPqEohCvhtxxiSs
         sEtomhUNCoYeEltF/yRogk40MWZkMfWe0iGSEydLaexaiXDz49b9hkA/7g4x9jUtspB5
         fF8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVR/2yD6VxQe1sja0ZklwpkNxtlQgP09mSEgDNXSiBMP4Vs5R/NFuG44hVZPaJFpgeWQUtrohAexRlFZYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrDbqp8wx3m4q8SlEMEaqmTi/WzY3FaWnozZDIs4/Rzb2PhwAi
	H4sLH0Pf4x4HQ0H8D7EoC+P9iwPoNPadnHL7PzQmjC6uhqnuUTFtMCUx2Yw55v4=
X-Gm-Gg: ASbGncsZzRBDaFnjWgTEGiUCIK6eToSAWI7dAaqbnXy0oJrdjTAj5iBvs64PJmq8Cnn
	BwPqaPZEp553CpxiMXMX4t508fJgJemM/iITKGWXhF1QdjX7dsq9V/5osaQvwmb3E8KcDiXgfQk
	ZWWqOAd4FcIr2cngH2w9qsz7XaguMNCDooIGIfaziCMoaAnQx+MKdNpmXLb8Tm9iGnEHrnt1d+T
	ebwFKISr78xIJ9u8U8V/lS71ha9ENMaN7H9EjmZ3zj782MLBTGqNn+DA1S4dm2/pcBmZom4x9wg
	s3b4iZy7Ht1F3Is0GB0x0nUOoRfkV9JOnc2mD7kuBQ==
X-Google-Smtp-Source: AGHT+IGzY8okLdys0tOKhwvB5BGgGvxVyHB5y3oW1MGsgoMkAqQECk7mk6Y/4ZzNlCEdPu9BMIDa/w==
X-Received: by 2002:a05:6000:40dd:b0:391:13ef:1b1b with SMTP id ffacd0b85a97d-39eaaea8457mr8319959f8f.30.1744634155589;
        Mon, 14 Apr 2025 05:35:55 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9780a0sm11003166f8f.50.2025.04.14.05.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:35:54 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 2/5] riscv: misaligned: enable IRQs while handling misaligned accesses
Date: Mon, 14 Apr 2025 14:34:42 +0200
Message-ID: <20250414123543.1615478-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414123543.1615478-1-cleger@rivosinc.com>
References: <20250414123543.1615478-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We can safely reenable IRQs if they were enabled in the previous
context. This allows to access user memory that could potentially
trigger a page fault.

Fixes: b686ecdeacf6 ("riscv: misaligned: Restrict user access to kernel memory")
Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/traps.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 55d9f3450398..3eecc2addc41 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -206,6 +206,11 @@ enum misaligned_access_type {
 static void do_trap_misaligned(struct pt_regs *regs, enum misaligned_access_type type)
 {
 	irqentry_state_t state = irqentry_enter(regs);
+	bool enable_irqs = !regs_irqs_disabled(regs);
+
+	/* Enable interrupts if they were enabled in the interrupted context. */
+	if (enable_irqs)
+		local_irq_enable();
 
 	if (type ==  MISALIGNED_LOAD) {
 		if (handle_misaligned_load(regs))
@@ -217,6 +222,9 @@ static void do_trap_misaligned(struct pt_regs *regs, enum misaligned_access_type
 				      "Oops - store (or AMO) address misaligned");
 	}
 
+	if (enable_irqs)
+		local_irq_disable();
+
 	irqentry_exit(regs, state);
 }
 
-- 
2.49.0

