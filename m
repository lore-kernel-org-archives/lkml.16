Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A62624BD0C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749740414; cv=none; b=i+YeVBnnQzQE0sfvVMmLU24z3BrIvXW1ABP6WeqMHm5Rymp7Uy8+QMuB62TLiBX34/CuiddY/qNhw9hIMGNYeI9HX0B4GKN7AFQFWlsOza26nifPUJe43QmdbDRF3ygZ8eyMA4gzkMA3ycQmJVVOA4V/XtbRB9MhLguLIFCzyvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749740414; c=relaxed/simple;
	bh=UEDgyf5sR2DOjr490U2Y9uTi0O6qMSmE33WZO50UEuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S2yOoAD1TMcBYTAMPq+BEShEB1mVdqesvUR400lEApW/UD53KaZY6yLCKokIrcxpNd42VVq+Me7yavqVSu7fHU8amCIq0fPtwTa5C+wtFXOyURT80BmhFM5YQk9sFMpv177RkfsMNLds4R7RpDnMYcAg/9WnlT4vTa4pXE8Ny1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=L8cDBqiE; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="L8cDBqiE"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4e62619afso138929f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749740410; x=1750345210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxvHpJ/jLR2SLY4sVqp7FxybSyqWdedSjHtBGZuRV/U=;
        b=L8cDBqiEqxpM6j1PnxgUk2SYBGVPEy0a8Evdme2JbLGrDxpXpKz/O3UMVmXvFegJfv
         osCIwedUSD/07If142WuWTGrZk/ZeJNOec68ohZV7sdzPaJ3yLsi+s7ma58rWCldPXgj
         cjPRuLrQ8IxjyJe7IIwqNqW/ywPVb3aN6qkYxjNr+TrdgZNgWt9KQkRwU205Fan8optJ
         ibKC9fpRoztIp/Vwpmn77IgTjFostkBK0uDa5sekuTD94ZmrUmAMLaPLjsVdm2ak/ijD
         RG3pAV1eGjbux4lqsECiW7mvLTcJxwK9Mg3ERzTtaQRqvgNybUlDZsjmjXqTM1qXPc4u
         TXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749740410; x=1750345210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxvHpJ/jLR2SLY4sVqp7FxybSyqWdedSjHtBGZuRV/U=;
        b=hmNsD7DI8Veu1rXqYkniOVtOqEfgJSoT/nbtmMu0u9lzYqyvkmA/6h5NvkYsOLgFEg
         216FJMdzDy6MaSzzfitmyeBfUcHX0qViojyeOKZeL2YKx3HbaQpExOLpqMbuW3AH/waK
         P/dqpNmKAwdt+SHyh8F1B0Sc9abYEd4vc6BAfDyyX3dXqaY08l9AivqSoz8IJrH6TLkB
         vKfbvvybrOGYnfTEg+1i/6oywuXG1WHnygYNqBXowfJfynE4UlSPTsC+FIyiQ5lOF5JW
         pGAz5Ke9CCbE9eRYyECICw3q0QnVLZbxrCOiwEqPU0wlTzdGua72OR7imOM9NI/Fslzu
         jWhQ==
X-Gm-Message-State: AOJu0YwMXCY7ERKw1YGvPF5axuF6kYeftbD6k1SWURhlPVqX5gPXJ22k
	+viJ6kYlT+metsM9JeRGcifed7na50vK6CI0MFcHUnjcsfpbIOkma3nwX7JJ/g3o7C0=
X-Gm-Gg: ASbGncvDfRGB0haAoOl5oe/xNugS1iK54ovq9ltvmeCBkL2BZNhvPHp7vN8WInoM1ow
	yAoMUnVyMz4/kcQhlCwZgIb7g5ZvykmRxIGtmbK3zLR+TqEN25eHfJBNfdwgH5E1w+djZwCXT9L
	ivBC7BHxIawngRf7j0HlVwmdgDIA5M5bqwK3TL27xzuzWkno0Ix3CzUg0IfY78kqljD/A19IWwN
	p496gP5pqXkfo9UtoiWknT6EovcwmUS0YYpRDykduOMgJ8pBiULf4Tz1rdy+/3KnuwwGWw+KqOU
	Bsu1ZyK0alJZmzMB62rGppJ1A8RQsHGWNFuYwNXS3xp9MXyTkpn/4EDFa8zSRIlyFAl3nw==
X-Google-Smtp-Source: AGHT+IHsElLaIZvGcIh+StpvFXvoYZI/iG4C7lC/hP2aO+itlbKoQzyKW+xmnRb5tTorqwGYkUKDIg==
X-Received: by 2002:a5d:64ca:0:b0:3a4:d30a:7633 with SMTP id ffacd0b85a97d-3a558a219bfmr2775708f8f.15.1749740410251;
        Thu, 12 Jun 2025 08:00:10 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:e05f:7af3:1bf9:f101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25f207sm22980815e9.35.2025.06.12.08.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:00:10 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/2] RISC-V: sbi: turn sbi_ecall into variadic macro
Date: Thu, 12 Jun 2025 16:57:54 +0200
Message-ID: <20250612145754.2126147-3-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612145754.2126147-2-rkrcmar@ventanamicro.com>
References: <20250612145754.2126147-2-rkrcmar@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Counting the arguments to sbi_ecall() and padding with zeros gets old
pretty quick.  It's also harder to distinguish a tailing 0 argument and
the padding.  The patch changes sbi_ecall() to accept anything between 1
and 8 integer arguments.

Those who can count are also given sbi_ecall1() to sbi_ecall8(), which
the variadic magic uses under the hood.  The error messages upon a
programmer error are a bit hairy, as expected of macros, and the
static_assert is there to improve them a bit.

The final goal would be avoid clobbering registers that are not used in
the ecall, but we first have to fix the code generation around
tracepoints if sbi_ecall is expected to be used in paths where
performance is critical.

Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 341e74238aa0..c62db61bd018 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -10,6 +10,7 @@
 #include <linux/types.h>
 #include <linux/cpumask.h>
 #include <linux/jump_label.h>
+#include <linux/build_bug.h>
 
 #ifdef CONFIG_RISCV_SBI
 enum sbi_ext_id {
@@ -465,9 +466,40 @@ struct sbiret __sbi_ecall(unsigned long arg0, unsigned long arg1,
 			  unsigned long arg2, unsigned long arg3,
 			  unsigned long arg4, unsigned long arg5,
 			  int fid, int ext);
-#define sbi_ecall(e, f, a0, a1, a2, a3, a4, a5)	\
+
+#define sbi_ecall1(e) \
+		__sbi_ecall(0, 0, 0, 0, 0, 0, 0, e)
+#define sbi_ecall2(e, f) \
+		__sbi_ecall(0, 0, 0, 0, 0, 0, f, e)
+#define sbi_ecall3(e, f, a0) \
+		__sbi_ecall(a0, 0, 0, 0, 0, 0, f, e)
+#define sbi_ecall4(e, f, a0, a1) \
+		__sbi_ecall(a0, a1, 0, 0, 0, 0, f, e)
+#define sbi_ecall5(e, f, a0, a1, a2) \
+		__sbi_ecall(a0, a1, a2, 0, 0, 0, f, e)
+#define sbi_ecall6(e, f, a0, a1, a2, a3) \
+		__sbi_ecall(a0, a1, a2, a3, 0, 0, f, e)
+#define sbi_ecall7(e, f, a0, a1, a2, a3, a4) \
+		__sbi_ecall(a0, a1, a2, a3, a4, 0, f, e)
+#define sbi_ecall8(e, f, a0, a1, a2, a3, a4, a5) \
 		__sbi_ecall(a0, a1, a2, a3, a4, a5, f, e)
 
+#define __sbi_count_args_magic(_, a, b, c, d, e, f, g, h, N, ...) N
+#define __sbi_count_args(...) \
+	__sbi_count_args_magic(_, ## __VA_ARGS__, 8, 7, 6, 5, 4, 3, 2, 1, 0)
+#define __sbi_count_args2(...) \
+	(sizeof((unsigned long[]){0, ## __VA_ARGS__}) / sizeof(unsigned long) - 1)
+#define __sbi_concat_expanded(a, b) a ## b
+#define __sbi_concat(n) __sbi_concat_expanded(sbi_ecall, n)
+
+/* sbi_ecall selects the appropriate sbi_ecall1 to sbi_ecall8 */
+#define sbi_ecall(...)  \
+	({ \
+		static_assert(__sbi_count_args2(__VA_ARGS__) <= 8); \
+		__sbi_concat(__sbi_count_args(__VA_ARGS__)) \
+				(__VA_ARGS__); \
+	})
+
 #ifdef CONFIG_RISCV_SBI_V01
 void sbi_console_putchar(int ch);
 int sbi_console_getchar(void);
-- 
2.49.0

