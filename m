Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC217DA6D
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 03:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748575381; cv=none; b=NGRTejDwB2JOaibr6IqvlQ93wJdy/Kt5CqNhTzeakKcEcu6VhrFfrQVw/x3AZi4IG2hrD1mkF33NhGSZ59ey7PzI7q1g7jcRN5BmUSrDkO1ExyV2NBeErwymUMBYMjNTkXY8T8ViJtFZ3W9URt5s0arxU/SuWXWLEKj4UM2huSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748575381; c=relaxed/simple;
	bh=IHZ0jPUmIITD+3HR0rfkeKuEgX/0b0vnXiDoxDtJtqU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=rqbjbnStVgPg9Epj+CAL7hLRSrystpietV1pNx0x6K23mfmOSHozXc71P7nJDy7QHPrSh2tNjL8Gp120OzKzVPEzDdcQt4qfZRuzkvqPpCcLBp3H/GTkkjUoUv/f42+9OHzlhn9M4b+J45mCkZ0is5J55nstdlsR5UCdyjNUe94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2pDrhhf; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2pDrhhf"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af6a315b491so1335850a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 20:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748575379; x=1749180179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7wM1U4tWGX5o3ldRteBTkSHAy3K2Ji8GZf7I8eaIg24=;
        b=A2pDrhhfVZ7P7DcQMfEJhYdNAbgjr/VDdkdlwF7zQlFwrn3lbgSpbsyD3Xil4Qc4R1
         kXmVNOTVa+Xlt5LdravEpbay5d+orzonxEIdUt4eTbQvebdK4ptXmSbaJucLbaQvqAaE
         mp/3n0PfkwgnHhVXhPmaKPX3/xJHdPKkjcw02OdEgKmvayLuw9W/n12SW3HasNL8J/5j
         CGJy/nK8CuZrK2In8GT1aN9nDYLZGhDOGXLHdsPIfSYg+vIUABpkkNTc2SuswSCSbKne
         gEZfnRcFOzi3Y5XeVmFv2YDDCye27x40vG7851hS0Od6HN/8jOfcuaKWY4WHng8JkzL1
         kWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748575379; x=1749180179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7wM1U4tWGX5o3ldRteBTkSHAy3K2Ji8GZf7I8eaIg24=;
        b=gzk+svXSTIoiOu/LkVveK0NFXIgRlm6WQSYlz/aLDKVuJ2YlLsN42YzNGztQGb+0eb
         hqTqcG7b8y4Boomo0hZ71olGkHPRBIcs1KuPNoW5KMzvKF51q/VKwUoSj712s/3c88xA
         uJpXfCZxdr9yGrLpTtl8Mm71scOEbxiOTMgPT8xFxY93yi69P4S4UDJjGMREa5jKBc+z
         gHABMzdB3VD7jCz6Af9q2zqzaGEZDrwhUAP0VyZM0mUIBFyUKTvULxTUJvYw5+UMqfng
         4y6YGUfgi1ty7sMEIUIHHghh6Y/vJOuYFxtLTmhB57ev86AKLktz5FeRKhe0j6UxPdF+
         4c5A==
X-Forwarded-Encrypted: i=1; AJvYcCXBnroM4V7+KLsamADc8khpycfzTjyaQnbVd3OJRfjRKA/c465GveRp3Zi5lAbN+9jMc27c0sWY0QQgHnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9o16YkI1L0E1qr0d3rF5lEdvrABqAa4OkV3kOXA45oiHMf/YC
	/9xsiQm/6Sh7bHSOScYjKW7R9xaGYURp1Bp5TNFkzdjtu/WXspLhZWHb
X-Gm-Gg: ASbGncuGXQW+y6NFM8PsO+t8fI61uK0JWZNjm/dJIJu2dEt5Qp6DW+v09kkhZYiEwbE
	T8jh21tDUfYn6ADH9G67BUD0PuQo2bFLJMc0+ujLjhWWmqx6yVtFDVaddhOjuxyoFC0vgs3WkCB
	H6U7zefxpLFN5KDpnRMhkidMkeZQcLz3FQrDHfO8kLtN0weZXOzkYrWU6Un1+DlYzz572bTfJLM
	s0lrZUGTH7wy/uOk0g2kubksPtbFqLkQPj+DtG/ep4N5co3UgCp8lpW1GLt9r/PlQ8X7Otyezu2
	qE2U+wd2Mpzl5YgirWu0NyC+DTCKDVIryUJZHxo2HQVY
X-Google-Smtp-Source: AGHT+IFEDEelWj+6CI2BfcsYVRx9/81+DL2Rd8LyW7YcCbMOY3xavrgN5hBI2UG7v3u945J7lg1gig==
X-Received: by 2002:a17:902:f642:b0:234:de0a:b36e with SMTP id d9443c01a7336-23539648068mr9327765ad.49.1748575378042;
        Thu, 29 May 2025 20:22:58 -0700 (PDT)
Received: from gmail.com ([116.237.135.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd3535sm19089905ad.120.2025.05.29.20.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 20:22:57 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: use generic MMIO accessors
Date: Fri, 30 May 2025 11:22:51 +0800
Message-ID: <20250530032252.3092502-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISC-V IO just reads/writes the memory location directly, so remove
those __raw_read/write* definitions and use the generic accessors
instead.
The __io_reads_ins and __io_writes_outs macros are updated accordingly,
as they don't have access to the generic accessors.
Simplifies the code with no functional change.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 arch/riscv/include/asm/io.h   |  4 +--
 arch/riscv/include/asm/mmio.h | 65 -----------------------------------
 2 files changed, 2 insertions(+), 67 deletions(-)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index a0e51840b9db..6cee9d083d3c 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -68,7 +68,7 @@
 			ctype *buf = buffer;					\
 										\
 			do {							\
-				ctype x = __raw_read ## len(addr);		\
+				ctype x = *(const volatile ctype __force *)addr;\
 				*buf++ = x;					\
 			} while (--count);					\
 		}								\
@@ -85,7 +85,7 @@
 			const ctype *buf = buffer;				\
 										\
 			do {							\
-				__raw_write ## len(*buf++, addr);		\
+				*(volatile ctype __force *)addr = *buf++;	\
 			} while (--count);					\
 		}								\
 		afence;								\
diff --git a/arch/riscv/include/asm/mmio.h b/arch/riscv/include/asm/mmio.h
index 06cadfd7a237..61286ee65f0b 100644
--- a/arch/riscv/include/asm/mmio.h
+++ b/arch/riscv/include/asm/mmio.h
@@ -15,71 +15,6 @@
 #include <asm/fence.h>
 #include <asm/mmiowb.h>
 
-/* Generic IO read/write.  These perform native-endian accesses. */
-#define __raw_writeb __raw_writeb
-static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
-{
-	asm volatile("sb %0, 0(%1)" : : "r" (val), "r" (addr));
-}
-
-#define __raw_writew __raw_writew
-static inline void __raw_writew(u16 val, volatile void __iomem *addr)
-{
-	asm volatile("sh %0, 0(%1)" : : "r" (val), "r" (addr));
-}
-
-#define __raw_writel __raw_writel
-static inline void __raw_writel(u32 val, volatile void __iomem *addr)
-{
-	asm volatile("sw %0, 0(%1)" : : "r" (val), "r" (addr));
-}
-
-#ifdef CONFIG_64BIT
-#define __raw_writeq __raw_writeq
-static inline void __raw_writeq(u64 val, volatile void __iomem *addr)
-{
-	asm volatile("sd %0, 0(%1)" : : "r" (val), "r" (addr));
-}
-#endif
-
-#define __raw_readb __raw_readb
-static inline u8 __raw_readb(const volatile void __iomem *addr)
-{
-	u8 val;
-
-	asm volatile("lb %0, 0(%1)" : "=r" (val) : "r" (addr));
-	return val;
-}
-
-#define __raw_readw __raw_readw
-static inline u16 __raw_readw(const volatile void __iomem *addr)
-{
-	u16 val;
-
-	asm volatile("lh %0, 0(%1)" : "=r" (val) : "r" (addr));
-	return val;
-}
-
-#define __raw_readl __raw_readl
-static inline u32 __raw_readl(const volatile void __iomem *addr)
-{
-	u32 val;
-
-	asm volatile("lw %0, 0(%1)" : "=r" (val) : "r" (addr));
-	return val;
-}
-
-#ifdef CONFIG_64BIT
-#define __raw_readq __raw_readq
-static inline u64 __raw_readq(const volatile void __iomem *addr)
-{
-	u64 val;
-
-	asm volatile("ld %0, 0(%1)" : "=r" (val) : "r" (addr));
-	return val;
-}
-#endif
-
 /*
  * Unordered I/O memory access primitives.  These are even more relaxed than
  * the relaxed versions, as they don't even order accesses between successive
-- 
2.43.0

