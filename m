Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922E1293B6C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745339058; cv=none; b=DGO0TuLPe0OXyJJAUj63jk4TyhBD70GgpU0+1xKNtIF5CG62afrR62KLAJ8xAMWcnDFe8GKZEGJmnbdgSfKrRw24DVgZEpMcksklItMDIdc48KSIWbvcOLJS93crKbYG7i1G3WKwpzafxqq20ntZIJqST5KUfY/YsYT5xgQeokA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745339058; c=relaxed/simple;
	bh=1SwPGQZnvxHgzAriM+OX/+KD6D61uAEZmkyHnr7YLVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IJD9yid8L+7245h0NU3EEHXcB+q9es6XNMXmtenI5V2a2Rh2voyf4Xw2DfXMPHnGSJX2xJTnmI9ucoPOHoU1113ol2pVneallNA/RdDnAAZe7NYPMmK+u0nFFB0hGFetE/YXAzecWdTwTd/CxyEzcdeO76RLFSRKCUXpZ0eG6Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Z91MF5N5; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Z91MF5N5"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736b350a22cso4373055b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745339055; x=1745943855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1WNhT7IxU5Eh/j55bJL3pNAqccf1l3Drk5qswQXMsw=;
        b=Z91MF5N5qnwNn4PTnURdJ3rXSMcQaoFNkSGb4AukfRhgTHVpyh6Lk2W1Dz2tDIbFzp
         OX+Y2gLGGpwLt2hcNOfik/zhb8Yr/SApgujMrwbpNgPJmuP4qunEu1dmi38CKxrFu1sg
         jOeYXdQMEs9SYUHVVcwyViF/Dhrvycr/e8AqaEYWSFhzl/oNXtdv/bjREqtrY7d7oPAb
         qHBuyv4+Hvkj6n0ct/Ecy5NWPOvdqTmEqyfYe6GETUvqmVuvoXWpLXEkQ0v355YSWvD2
         kOwOVyONvnf784zweqWMmk4uxrxhuFqEfhPvnWcJK3/oKuVO+rhtUP6URdZM6k+SyGvE
         utdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745339055; x=1745943855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1WNhT7IxU5Eh/j55bJL3pNAqccf1l3Drk5qswQXMsw=;
        b=HjuZ9hnKQc/Shpc9n8xcQ2YtbpBydu737vR3FL/cCZhgH9xVXlL+eXLaSP9GVsPECx
         SCfD3YChPRDUDMndIIUTXmHmLJLruXi+VPCLWq7cEJgnCEnlrcLG9mkVqP2Uw9MxOLXa
         dhsbp9B9p2k68KmvmJaiU0PiUac6mqubH5S6rlPIztqZaf6FDfdDHCpiBDD9/d9uf8kI
         2at3gXZEe3+5FB4aBiT0dJZ5D2zpzTSEyqNQxKK+/IXwH1WH84B3+EOxDMf6AJJzF47N
         +AIzHCPypqda9MEzdiM6UmRorxkDNOpjjeTDzed7HlI0sMroM3KyjJ/Ity+w1MVn4+Qf
         eqYw==
X-Forwarded-Encrypted: i=1; AJvYcCXoE85jaHcKDXGX4XSKbr0nkN+ObZ8sRCaWTw8uBrs6P8TYj38oy1a0EZ+i+bEXP1cPIDDAJx8b6WmRAlc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+4CGavk9eCGI6dSpyCEG4GPDjPcj40q58gA034V5+l+63TGUU
	9AfWY9sBHDcvMQMg3lcY5jJj+muXO7syMrhTVEHCufsupxAm/BjAW+YV/5QG9zs=
X-Gm-Gg: ASbGncvuGqIeCN/ssng30lrrejMzGxbye+CUC60piYssssHgTLzT3AFTIdFlz/GBF+l
	EWRshW4LVs75kG5z2DW/GF33PynD9q5iq3ohq1g5lFBiqyVaRHMyuhamMi0fCIddV77zgFjh9of
	ulCmcpAtsT1SwgNPtE81PuKVbig8YpoBrnpL53DcJOf/rrpZ7qsjOAwla6bmuum1p222V76YAZy
	rIazK1dy8qqAv6wWgEioJ9+j8rX+BDd1Y3u9APj4vOpAoJg+CMc6zI/JqncYOwO0tupxOOyqNJk
	8jU3yZCoFlpMoJ571VmQolhzQH3u7+RtnKQub3W21ES31jZqJbaY
X-Google-Smtp-Source: AGHT+IH4yOfP0IqJKdZ6mYEYPFLQ595Vgf0k+QWsP9/Syy4+PU0hfb7Rc2GCNPIAlZUfc78JP644pQ==
X-Received: by 2002:a05:6a00:3911:b0:736:5753:12f7 with SMTP id d2e1a72fcca58-73dc145740amr23785110b3a.3.1745339054816;
        Tue, 22 Apr 2025 09:24:14 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e13e1sm8850825b3a.46.2025.04.22.09.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:24:14 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 3/5] riscv: misaligned: use get_user() instead of __get_user()
Date: Tue, 22 Apr 2025 18:23:10 +0200
Message-ID: <20250422162324.956065-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422162324.956065-1-cleger@rivosinc.com>
References: <20250422162324.956065-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that we can safely handle user memory accesses while in the
misaligned access handlers, use get_user() instead of __get_user() to
have user memory access checks.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/traps_misaligned.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 4354c87c0376..97c674d7d34f 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -268,7 +268,7 @@ static unsigned long get_f32_rs(unsigned long insn, u8 fp_reg_offset,
 	int __ret;					\
 							\
 	if (user_mode(regs)) {				\
-		__ret = __get_user(insn, (type __user *) insn_addr); \
+		__ret = get_user(insn, (type __user *) insn_addr); \
 	} else {					\
 		insn = *(type *)insn_addr;		\
 		__ret = 0;				\
-- 
2.49.0

