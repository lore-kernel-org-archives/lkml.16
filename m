Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C7A2EA744
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 20:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750450939; cv=none; b=X9IAWJucVoCs6M6VbGDCqz4D34nAVTOMKZTCC8bgaFqlAhCx0q98LIXRFMuXx07QXbcv0+QjKz2J7J7rS8uFJYYtoRYw/X1LAy1bUrTeoGHs7ZX/YvDrUtSnLHfpf0Rcxy/VqysjbB6g/VbM+yYx1T3Q80NqLM7sOOAvQfGyji4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750450939; c=relaxed/simple;
	bh=A1P6kxgEJNmX9GHIO3H26K7yk2m8/f23Gd0ZQ/RNXe8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LsxmFguQrpa3sLSR9JQXaEE+SJydyevf/QMJxxrxULyPWjEY4ekbuE7JROHiQH2L4nw/h23wYhpskY6yI+HTS9q0hy28sVOiWOOhlD/JZaLtro4VaekRei1ggf2x6nXXoet4AdBhSVVpbSZm9C3uFCRRcNVFYA+aYZtUHRS2U30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=IJcGlLKN; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="IJcGlLKN"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234d366e5f2so30033465ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 13:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750450936; x=1751055736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+zRP05sT2nYVu63jmc+xv4tV8ecuFPHchJnn/1sRt8=;
        b=IJcGlLKNpZDUo0nQZZSsi2+ser5BqKkICIQ4V+FqrPFOs4ZxdGqZIP0jIDSw2m7W27
         ewio/yG/bddPnzcQRSKwj/7Wmaq16X7Lhw0ODBpI9Ur7HuYCbcuwPnz2xjF+mCqpOy6i
         T7ttqtrijIrTi77j7b3rxIxJYO3MOyDPf0zwCt3mVipd2ID6pEFLNeDkT8bZ8SveCDPq
         ZU/JtBxjzjNI03d3AH2V9IABwY4TkTc5M8slfpLgA1kqmCXNCEvHGRR1Pc2Why7BGzlR
         nHGO15dM6uzCHsYJF6ribSD+xhZgfw2TftBg6ou34+VUnLqCwPHkKaQCOSgNppRsmpdw
         VUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750450936; x=1751055736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+zRP05sT2nYVu63jmc+xv4tV8ecuFPHchJnn/1sRt8=;
        b=L4ZcLIiN0eH80SLPs4ZGQX8b1d9GCH8jVTKFqqmg2+mwMyRtwExPG/OWjo9pkpO8WH
         GHKBxzbECM/ZcFs+N+s2sZmtpMVxyDKQ+DspgpEsny/8iPFqkmV+0K7aIfL3Tutks9tu
         O8tvksW7zcxK/rSL4CBVJj5Sg6AkUcsMtAELukQaTCFXfTXCdYjuccjTaJ1UIbcdT71k
         d5d5MhPp+f319rSQBAg7adpYIG3Zr4darxJQUkAvVZWE6Ng7IStf9XCEXcrvYJRYSUeK
         GjAUA7GdPtQjWTY3tV5AVoEZygdzzXMXUAqD9ovTPBwkjT0jYGx01a4omUzsXETfKVQi
         V8UA==
X-Forwarded-Encrypted: i=1; AJvYcCX6ZqQb2MWoP0+OspkNKznVSMttMD8IwQy6iIm6+U78fsqL7pFj/ddNSWZ7igyKXPp/lxRnPYDiD3xguLw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx750VrEaci79MUMfuKcPmg4QEahkv/R0OIa7VZK+OP35uCZmVG
	eXuP2GlDkRDyzLvIxnabWg/NC4WvGIVHpTRtKtwupCjHvAHo/FumSFiDB/kPFS7uMpp8KQEsxpR
	+LymJ
X-Gm-Gg: ASbGncvScF1PWTomnCYJ9LJDv/dXnr9o+/DmYZIGiKtBVaSJQVwqueuB3xHJ7/IYFC3
	sTHmIrj2P1BIMj+mMeYFESZ45yLr9RLzXtpctiDwFtwkSSGPcp1P9+1/co9IhsOutRbsbU4eF0t
	eFog06/I6NMxLindL8nPH78VIRWCU4qBTTiiV2flZ++xjU0qlV/8aEg5IpsRca9Ees+nViEClDA
	mrVVy8ybd8G4+96pWii4CL+n0ZRco/mQVOnC9kzAk3MR8yHXXvxA/qnWKbI5DUu9dNFDz9+yswG
	1+z9Jxw6q+oYu+uGwa7vZ3FO/x4+cMXMJnYOb6fQKUBWj3p8ZMaDUe6lP0RjRn566AAudKf5MVJ
	s1PQBRFKF8Rjn16eFX9jxQdjg+2Q/aVxEQg==
X-Google-Smtp-Source: AGHT+IGxF3Y7GuTw7cF2rLjoHJi9Q+J10U0wcLkyab0NxUAfAKaXxRxyLreJ/M4k337d4xGl2V1n6g==
X-Received: by 2002:a17:903:40ca:b0:235:f4f7:a633 with SMTP id d9443c01a7336-237d9917e38mr65455185ad.28.1750450935857;
        Fri, 20 Jun 2025 13:22:15 -0700 (PDT)
Received: from alexghiti.eu.rivosinc.com (alexghiti.eu.rivosinc.com. [141.95.202.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860fb58sm24239005ad.99.2025.06.20.13.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 13:22:15 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 20 Jun 2025 20:21:57 +0000
Subject: [PATCH v5 1/3] riscv: Fix typo EXRACT -> EXTRACT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250620-dev-alex-insn_duplicate_v5_manual-v5-1-d865dc9ad180@rivosinc.com>
References: <20250620-dev-alex-insn_duplicate_v5_manual-v5-0-d865dc9ad180@rivosinc.com>
In-Reply-To: <20250620-dev-alex-insn_duplicate_v5_manual-v5-0-d865dc9ad180@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Andrew Jones <ajones@ventanamicro.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1555;
 i=alexghiti@rivosinc.com; h=from:subject:message-id;
 bh=A1P6kxgEJNmX9GHIO3H26K7yk2m8/f23Gd0ZQ/RNXe8=;
 b=owGbwMvMwCGWYr9pz6TW912Mp9WSGDJCD71PWD2XoWjx0cuV9YUOOycnx6/eWvbgZ/k7Y6ZNB
 YnVb641dJSyMIhxMMiKKbIomCd0tdifrZ/959J7mDmsTCBDGLg4BWAiYtsZ/nBOqzx68FDIy/8S
 7cybFgRz7FzHYt7dzGNquHxz0tw38vMYGa66Znaku/smceTExJS7u2zin8rvVLfAPthwZhZPqLc
 mCwA=
X-Developer-Key: i=alexghiti@rivosinc.com; a=openpgp;
 fpr=DC049C97114ED82152FE79A783E4BA75438E93E3

Simply fix a typo.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/insn.h | 2 +-
 arch/riscv/kernel/vector.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 09fde95a5e8f75ac6ee741ded7c6beaa57677d13..2a589a58b2917d67efcb18792b05f5e640bda37f 100644
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
index 184f780c932d443d81eecac7a6fb8070ee7a5824..901e67adf57608385e6815be1518e70216236eda 100644
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
2.34.1

