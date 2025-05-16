Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E32878F5D
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747404553; cv=none; b=WDR9nwi4R7yv0RbAUrDxham1+pidLirlKtw3bXckQgL9+KS4BYUy9DpQJjBJ47yjWGwbRJh2MrEj+NYvGDUYr+vSB0HGyASKpCCMv24S4xg+e4dO01xa+cl5hMkN2WVw8d3L5j0w0cOioOyzbB3hePz6+OeTsWh30wOvS5DG3+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747404553; c=relaxed/simple;
	bh=euZ0Zj5ymVvdjh/3qOybPwtuZ+o3GzvdIi2/M+/nE94=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tqUBggweduiV0OXIQpcrNU6eV0UovDQAHuH031Q0FJJt2g7A6Q4q+WmS7oTgFAZpMcH1BBTDZXuxCHVOPEQ171wyiiFVSUWPUe9dxSnzqReScrCTiZB2swtBISTqYigz14oeHh4oSUp8Kf8cW0AyBxCobDyvkJTFyzcn8ALXLBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=VcVClzVu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="VcVClzVu"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so15713385e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747404549; x=1748009349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh7Nh/LNhUg5Xl+qiW1/QFk8dwafIYEiWF4enwv0UK4=;
        b=VcVClzVu/PMNjU6i2aiGwFpsAeEd6geVPtQHTiYnIi/XH4SdnAzdW4ZaoOQDy46dA+
         z/hqlqDKNTFHC+78/IomrC9lV7gpKizeIND0QYlBHBn6ghtLq94Q6wP+nB5ubXrN2Rnt
         25cE/DigxBYWuN55U1hIAblbJFoBKbNaSOnYpx7NwFu8gPsczUyRdFGWaOixVSHErG1J
         lpEfpx2/YxCJiQtPUGCqwA8YLPp7z2JjDiK4R87Elug4wHx2nS1tOSD+d+j8MDRFO49G
         BRKUo/r1V0T4k3iuCBAJr55Tr7bQrFdQqSSuz9evt0+QmQBJjcUygeivTMm9zOGnjkOI
         75dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747404549; x=1748009349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vh7Nh/LNhUg5Xl+qiW1/QFk8dwafIYEiWF4enwv0UK4=;
        b=QRJvOUNAmiNeLuZi4jD+5os6B8BDo7n/7NXxJya8LLXtmPIpYcmNSg3iXnPyWDDBnc
         a/E58MMCPs+0SYZfTtunt1CxjZy/tdzPapLSmD0McuO9nE8+FeyXZOhvUlHczx5bq7nY
         Ev8Nx/aU4RHaaOS3hscZMvPicN6bu84uk+B0IoUgf3sCwbTBV0WVoSaCQSk4SX29FrT4
         tbSgVa7Si4hAUadfYWyu1HW6NVYWFBY93OjqZ81w/2BegvJIW/tkqjN5xRNx7jM6Dfbl
         9nRyTwcxcI0ScdqBBQSfTtLlup5dYdlNm9oKfJWGyNjK00Cy+6uIMUMeCUx5366U5j7c
         1frg==
X-Forwarded-Encrypted: i=1; AJvYcCWnVMCXoS0zSmuZPsUSyYzC5ZLvUlBoIYVUZd6VNOB/Yz09/C43aHe2EqPfOGokL5lrh8eE119xAF/vfcU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzetnb4TEyrqpbkAVgcZM/jDYnU79qUYiuH0u/2eH5gkBtkqGA
	Fd4msWPyxB/l1QRDlXZGTr3hoNsSDbiz6YoM6yS6KDrEFpFrmcH1lDXEZXjq82YbdGQ=
X-Gm-Gg: ASbGncuobInwIJuVx1N8UTBzMv9C23xePdJqBj8Y60hRE26FpRPRQKqU2vkA1FW8Z0b
	BX87c/dp/Dte3H2fHVIhz5kpKSSmGUW9LlEmV6ixBzKEqWpPUq+O0rAEuvakJzKciTW39M0dWOV
	I4n4S38wrfOiueh8fMU9pnmdVPXxbv1Uh0faNF1ExVHgrJGR/oIgCQTA5OwrmCSaeApC8PQ9qZy
	9S37GekBpRERJYlsBB7s/Zfu8JvZr82wQb7mdEiUzPP5WJNdjZ0hEOPNbnQ0Fs/u1U9mZEoZvG/
	pth7a9ZQRnqQCGMAdSLp9cX+LkJEGuyjQ+KOypPLK+3gYZ4gMUz5itojoLd+JQ==
X-Google-Smtp-Source: AGHT+IGcNulM7sZqj+PyskZzsBcL0kYBhlh4zFQiDSGNh6LWyJKYUr6QraGKOEQ7UWTVlqgDlJSF9A==
X-Received: by 2002:a05:6000:1866:b0:3a3:4a1a:de6f with SMTP id ffacd0b85a97d-3a35feab1bdmr2405504f8f.26.1747404548777;
        Fri, 16 May 2025 07:09:08 -0700 (PDT)
Received: from alex-rivos.lan ([2001:861:3382:ef90:b6d5:4f19:6a91:78f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d1f9sm2911696f8f.1.2025.05.16.07.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 07:09:08 -0700 (PDT)
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
Subject: [PATCH v4 1/3] riscv: Fix typo EXRACT -> EXTRACT
Date: Fri, 16 May 2025 16:08:03 +0200
Message-Id: <20250516140805.282770-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250516140805.282770-1-alexghiti@rivosinc.com>
References: <20250516140805.282770-1-alexghiti@rivosinc.com>
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

