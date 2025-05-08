Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB63019D891
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708789; cv=none; b=pZjDpO3TMeZHfGQ2+uaTRCT7pGZZCO4MAyl3UXI4UZQfg7sx3LmDDVvNZij7qRc8N/4NHzJZtaJbnfL4JfClEASM2hQfU332AspXAL6DUm/tLdQP0ZBj7Iyl9oXC7LqXetElJ7h+9qOExF2B2s0baKdJWExMBD8o2BigU7INJI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708789; c=relaxed/simple;
	bh=euZ0Zj5ymVvdjh/3qOybPwtuZ+o3GzvdIi2/M+/nE94=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZgSMh22mjhh4YSNvVecb2vmOq84ksFBgXBAA/CWrnuFbCJ6JsrGSwe5yEDbc6vDabJrjxmO2V7NWyVGvVBR//JfStiNeG5UqYh8XFaj7vKMtwC6Q0B75b8+wDbRjzeD7V7UMU9YqrILEjh74BajJ7W9LKrxWkFasqQnnG98EwYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=XuAPBInV; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="XuAPBInV"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso6629805e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746708785; x=1747313585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh7Nh/LNhUg5Xl+qiW1/QFk8dwafIYEiWF4enwv0UK4=;
        b=XuAPBInVOh8vOZ0JoRbZlweRshl2MR0cgRDvj6kGUVJTDyPLyDgZ/3zFEj0Pk/royw
         LGvoPTO+kA0MYx5HLfbWbvmRr1OyDNAs12RmzD+Z95FZ8kmWievsmc/f1GlAK0iVypE5
         l79uwp6G7SGKfEpSfmzYj33v56kTnZE/TebigloazKh3G24PIuaaV/fVNn9HQxiYF3zy
         bd0weOcFncXSpAcnEx8owhvGkGq+o+TvAGQXbvZhAeSdAJc75ZNtd0CpTnNnm6JI6sP7
         NUiia3gqTfgt0zg1+EdR2vgiFZuwn0/9M44tpJAj3BB6cNPvmfwapnIOCANvfDQFLsbh
         XMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746708785; x=1747313585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vh7Nh/LNhUg5Xl+qiW1/QFk8dwafIYEiWF4enwv0UK4=;
        b=OH/His4xriZWTi1WuKHkca5FpsDJZRwi53cM+CFFMB+U5gQysdm0n20jzTbqhe7i/i
         rz6jfX+pHDzoBkTvCqLAW7mnAEbqeahrHfsC4ZRVXaIEVPhTQYzikKu0a5uFPKnT9os7
         qNFzPIGACSMpO/UqFuxF0hZSinSgi+aY8iRl3z6o77TYtkGjueciHfbMxkG4yc1ql9Xz
         c9XtiqUN7d+72lft0WprU70+6lDy3pNAzA8WHuJnA3yvzoVLTZQMRkRU1rbTgQRub5+x
         cVtH2KHRf+efaBpHc5os74BLxs0ACXgcxgunBVqD4TwCMquJz6q00Tb2BWC9GOZVko97
         7+Fw==
X-Forwarded-Encrypted: i=1; AJvYcCX7699FST3bjBjO/gVcLLM4/f1WEV2wmM67U4LrCyMt2OSIfaiMRqRDk5/xY01aMAWvZ0UlNv0/LVykYtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTvnwrirAibGpZi/0ur6nesLlsGoNCKAOnW6RkULsWnVdcDv/j
	sPjCwSXlRYWFfh1s3DAj1NKxsDIQCg0vvqYiXbvZbkjq5L+9bdRNb3eEB3A6LOpHkjvk9PX46dj
	/
X-Gm-Gg: ASbGncuadBSpMxGYd+cY1Fvi5QA1fr7DPlAmOAyPX+GY7yOVP7z4VMEDQydvB7q1//5
	FbS2of8oz2fw+noRX4LMXG6/3C02CllGa9XcjyytTU0MAN8QMGovhTQVhwcELmiY1eMPezg1dC8
	7z3TkdzDypzk2AexamgOTAFQl3pwt/jANZk+I2/spK88a4xP0BHpuN7deZkinG9IhLZX/SKOR/2
	aUtKu7URleQlfQQM7o6C/n8PwodvXRT8u2eEUGcR2mfEL2abLRgqYGkVWF/rcyAcXM737lAUWIl
	pT4TnXKfhuwKdAOkLDxj0USdSt+c/ei+JpB48XzvMKKuf9915Cc=
X-Google-Smtp-Source: AGHT+IFR8QCSoAU+f4KSrfc+O+GL0KH+EcLDchKk/zyNXpj2HtkBA6LUoeVtjpf2wnryhRhOk+2CgA==
X-Received: by 2002:a05:600c:3150:b0:439:5f04:4f8d with SMTP id 5b1f17b1804b1-442d02ef128mr29446975e9.12.1746708785138;
        Thu, 08 May 2025 05:53:05 -0700 (PDT)
Received: from alex-rivos.lan ([2001:861:3382:ef90:e3eb:2939:f761:f7f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f238sm36021615e9.11.2025.05.08.05.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 05:53:04 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 1/3] riscv: Fix typo EXRACT -> EXTRACT
Date: Thu,  8 May 2025 14:52:00 +0200
Message-Id: <20250508125202.108613-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250508125202.108613-1-alexghiti@rivosinc.com>
References: <20250508125202.108613-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Simply fix a typo.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/insn.h | 2 +-
 arch/riscv/kernel/vector.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 09fde95a5e8f..2a589a58b291 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -352,7 +352,7 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
 	({typeof(x) x_ = (x); RV_X(x_, RVFDQ_FL_FS_WIDTH_OFF, \
 				   RVFDQ_FL_FS_WIDTH_MASK); })
 
-#define RVV_EXRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
+#define RVV_EXTRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
 
 /*
  * Get the immediate from a J-type instruction.
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 184f780c932d..901e67adf576 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -93,7 +93,7 @@ bool insn_is_vector(u32 insn_buf)
 		return true;
 	case RVV_OPCODE_VL:
 	case RVV_OPCODE_VS:
-		width = RVV_EXRACT_VL_VS_WIDTH(insn_buf);
+		width = RVV_EXTRACT_VL_VS_WIDTH(insn_buf);
 		if (width == RVV_VL_VS_WIDTH_8 || width == RVV_VL_VS_WIDTH_16 ||
 		    width == RVV_VL_VS_WIDTH_32 || width == RVV_VL_VS_WIDTH_64)
 			return true;
-- 
2.39.2

