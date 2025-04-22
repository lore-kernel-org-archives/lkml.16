Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D2A290BAF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310441; cv=none; b=JaKsZ4DmYiImUKk05RgLJ4qL7WoH+CEKgqUDO9l746tkZI7IB0Pr3C01ACPt4N2J+hU4Ab0hUvdxEIHMT48Up8RBEauzLdVSFaZlQ38bwRHtl/QeK2wDDidW59aFWdUTz6BwOksoUC+bOhhp0HYqzao+uqfC+/R17MFSSugUA7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310441; c=relaxed/simple;
	bh=RTx+HnoIXEQkRJd/nDQjtn2NnXrBxY1VcXeuIlhDK78=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UVx7plAAQxtGHBbkNdTjUqQ5LDKKlCgTPpnhoyZBc0rPT1vo23oVk8J5r4EJf+1ONmWRffmF6BwsUIhOVyn3PdyFBCVsoexWu2g6AgOxnPaEIeGW6CWtA2DyXwB0GEQ/lTYIXMqhjUtnFqLCJ5/LuxSeCWbLLc+v0z1XeQdN7rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=d/WXT1JI; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="d/WXT1JI"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so44710595e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745310437; x=1745915237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2nnnGh2oXeC0IbaXY+fafQ44YKw6BKWItIZxE22UTc=;
        b=d/WXT1JIx/RiTcQsWEZaD0gUoHn6AT9f+rYczdPU+M19nNoQVkHtM639vSrrXQ4zbu
         sH6CYxINeqaMBksfay7LEBf/zYlSd60+CUTdcgRC6vbmAMh2eJTpAKYlRNegnwNiiRzl
         w7awPYhJaqyiaBFbFabp6dPpa4DwYUZ0745B2v//sj3gh56dPrNY/z6jqryUF9lyW12u
         oG2M1AKP5RY7qvu7i92Nz7UxGXjz/6NkKAsg7/7FiAkLQDQwRu76cH8ryMQlLHueLJS/
         a/IW4mzgCYI6koEQ5LS/Z0OYkJDEOiQBTWH2TFS9CKdesVt2P37ttTTuSy9FkFe2g3g1
         yEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310437; x=1745915237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2nnnGh2oXeC0IbaXY+fafQ44YKw6BKWItIZxE22UTc=;
        b=kYlBNSdosAvPaWJetgN8KiKoeLTmRRXQuFNeymdDtGLo0v7722Spt2uKppxXIr2wkf
         fhuoM+tAvv8QleLgsO2Y9oopjjGi0dDbWZ/LMOmj4xsX02ETucUF238VWi7dRlJYM7Ny
         MU3RlgYUCIhDmLOCcWTvYhYTSwBoiX292hUt01XQjQyCu+AkIOVxHCcfB14d6/EfL4Jp
         SJ+p2nWMwi0Lwrqib9kF8UXUEmTV1e3qWbyJEvsDaF95EsSaVATDmzqH9iE4LfzCCJhP
         hkb6MYVjK+kTeeJru+bZwnbGBA9F17pOHMb2jPcV4UNP45SJ2ZvYktSJ1z5UpZxQZFo0
         ZoMA==
X-Forwarded-Encrypted: i=1; AJvYcCXgpTNeAUWjMw8o2ZxzbzmRrRai/keqHd6F+3wck5ge3nkbQE6vXJ3RRahDRGkre0ytbL+WjMpiOAan+YQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi4mORKvSFFZBAfki5mJ5F595Cp0YM8BZgA1vtE2sAfRJahGsg
	jOT5w1251LU7LdVVox7MJhQzG80KU8iZxFxJDRZ2O6nHuVygrOaGSbkAxz4/VuQ=
X-Gm-Gg: ASbGnctl29nraEQTbV7oMAo4Zjnuv1cGM40A6HLgee8OczYo8GBEXZcOJ62Q8774kSM
	9TJiFH1O95fTjzuVxbNP1q/D/ESICbNo7Hic1tl0FF4SUeWtfgNJk9UHAFOjPPOVmtBKd5ino9T
	n40WOiccFz5yiiznJ4Y7iLFPdlU5VGenH5adzKd04B1yYOAaCuutEv8G36rCtsxp2h8h14PAiyS
	a8gKvWSUFwzXPEv6GX0jEw4GCJYFNufd6ZwOb2Y7BcQpb38uBCAJFvPBWx5rm698ROXpG1+AN/l
	/4Kk/M/+rZvJoFGYZ83v7Ejn3WqwJ7FOQBnCAW8IFMt2VYBJVk6moadi/v++
X-Google-Smtp-Source: AGHT+IEAXQjlvVXuUS+hvcD4d/xsSZzW3BjuYaxD4G0D6IJrYehsEjbaj37l5/daqRdzRScEtV0rfA==
X-Received: by 2002:a05:600c:5110:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-4406aba758cmr110202625e9.19.1745310437275;
        Tue, 22 Apr 2025 01:27:17 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:9fbe:20e3:2fc3:8d19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5bbd35sm163735605e9.22.2025.04.22.01.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:27:16 -0700 (PDT)
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 1/3] riscv: Fix typo EXRACT -> EXTRACT
Date: Tue, 22 Apr 2025 10:25:43 +0200
Message-Id: <20250422082545.450453-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250422082545.450453-1-alexghiti@rivosinc.com>
References: <20250422082545.450453-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simply fix a typo.

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

