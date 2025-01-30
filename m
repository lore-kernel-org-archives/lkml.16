Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0501E8837;
	Thu, 30 Jan 2025 13:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738244921; cv=pass; b=XAAzYojxBF06G52hUYeNXfq1hkWSYqOOLz01ElbE/RabzAmsJcDhBIDm07YG7Dn9LQXn4ZCaJmADRdo4/o9tNG/trys0ydBsiJmDYAGe/leW5UOD7fxVXhG5r/jH5Jga449uVm9jl8ehJiq+Rp8sc10+0bNJiHcIS/ba7t3GpOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738244921; c=relaxed/simple;
	bh=fBqXAtzs6QN6quiaF3KRms23QJNKKNCTBt/bJH8nRmY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=silNlw4Z9tJorzQuKM3/KTRhQz2aJUdfRa0sfvDjpXuGbU/FfNAaIit6c4ebzGPwkMDaJgz9O2rjZWPpuGVKyXyVxTslyzuRkeexKiJrJhes3gBVSKK0IEqgkOGnzYcro9GQVmKY0NNj/sHTjJTBT26aEiPXq+6Ik1vAodhF0Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outer-limits.org; spf=none smtp.mailfrom=outer-limits.org; dkim=pass (2048-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b=a2KEv3V9; dkim=permerror (0-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b=iPk2tVIM; arc=pass smtp.client-ip=85.215.255.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b="a2KEv3V9";
	dkim=permerror (0-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b="iPk2tVIM"
ARC-Seal: i=1; a=rsa-sha256; t=1738244911; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=TIA63vBT7rKpG1G6VzBLcSdE0xESa59hIW2U8WVyWG6v7KkUF3X14NmnwrnwJeBEJ3
    7u9u/cDPR6HXdMrWV26FmCZe36tTyMXNmHKl7vELXdBKlNOdj8BoLjYw2KnFcpcCa2hq
    VW8gX6ZvLHLB7+LFTJVg6aN4Itr4dw+Ej5Qz0ni61AlwwZaNtFoLCjVVEqlIui7Cbb4j
    IjU3fDqhu6wrOm1iAn3L8fU0SZrk5FPW5/gtdkpKtRYx9vlsdLC4KK/iBbN0evs7pL4L
    wyUTR4cZRaohdZUXnXN8NHp6rGC29oY1iZgP/QjdBfLVvbBxGRvhiGz27DyMzUjdGVS0
    4pOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1738244911;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=c+pct5eTLJu+tDVO/h4Oy3MGmLbc1PWBsbBsTWtZMZY=;
    b=CVC3nLYN9A5VrrCJpgXuNj9a9roUbyillEOOlVjcGNCMWqdo1tlK9PtlnS1siXMzgX
    lcet5px9Vyy+b06jkLn7+U8ZVewzZYYVc0vmLAMEc1LONc/HNhy2v4VQUXhcQssFVwZl
    aXbsnM7+/ln0mU0vKs2JdcJOS0UB4k4aSbejZYIyTN5J+ImJnEW24zi8Jc7X0yejf1Xh
    19K4XdKl5FIqVkmi991WkiLPWk11vmZnq6J8l1d++ZYP9d0ZnaAlib99bJqMNuID8p5m
    N5yfYiwtASUR/sKTVyatBeEz34wF+HlvcuN89VJS3yDv6MteiuC6UPpjJq2DD+fZYsxm
    tDaQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1738244911;
    s=strato-dkim-0002; d=outer-limits.org;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=c+pct5eTLJu+tDVO/h4Oy3MGmLbc1PWBsbBsTWtZMZY=;
    b=a2KEv3V9cjlt8c1PaeQl28oOU6hLMvb44keABbdOvSrZscOzfFjlfrd8gj4Jst2dUU
    tb4lEQaISSF5dScLwzqkJKiJJxUgDN0hz6d+p/JXGRcA5+3NXJLV6pKdoEgMBeTQh6hN
    lovkT2ucdFQ82eDmdPXrs1t4PFZyKoWvQvPXtPGE0nsv4F84tpnMKHAoHTorDC6fv2fG
    o79F+sA8NhQ/ie4oxGeqZ63JtTR2ScFsdfveOwMTZHVg7nkJbPH1T5AWDikX0+WotKIi
    1ju0GZIEU3r5KfFy83wS3lWJlFW+p8JKeqlaCzrEUq60/O+Fcoer9BFm0+kp6NYZ4AVF
    ucVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1738244911;
    s=strato-dkim-0003; d=outer-limits.org;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=c+pct5eTLJu+tDVO/h4Oy3MGmLbc1PWBsbBsTWtZMZY=;
    b=iPk2tVIMW8k1y90oZDfVB6ANkeA1OKhOKk9dMgq96zkcAiZw32fYVUq7jMgQon4lHy
    z6UtNyzsen2RUP5fQLDA==
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBEHcVJSv9P5mRTGd2ImeA=="
Received: from ws2104.lan.kalrayinc.com
    by smtp.strato.de (RZmta 51.2.17 AUTH)
    with ESMTPSA id J1a25110UDmVUAO
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 30 Jan 2025 14:48:31 +0100 (CET)
From: Julian Vetter <julian@outer-limits.org>
To: Arnd Bergmann <arnd@arndb.de>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Vetter <julian@outer-limits.org>
Subject: [PATCH] parisc: Remove memcpy_fromio
Date: Thu, 30 Jan 2025 14:48:25 +0100
Message-Id: <20250130134825.2646380-1-julian@outer-limits.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Fully migrate parisc to the IO functions from lib/iomem_copy.c. In a
recent patch the functions memset_io and memcpy_toio were removed, but
the memcpy_fromio was kept, because for very short sequences it does
half word accesses, whereas the functions in lib/iomem_copy.c do byte
accesses until the memory is naturally aligned and then do machine word
accesses. But I don't think the single half-word access merits keeping
the arch specific implementation, so, remove it as well.

Signed-off-by: Julian Vetter <julian@outer-limits.org>
---
 arch/parisc/include/asm/io.h      |  3 --
 arch/parisc/kernel/parisc_ksyms.c |  1 -
 arch/parisc/lib/io.c              | 61 -------------------------------
 3 files changed, 65 deletions(-)

diff --git a/arch/parisc/include/asm/io.h b/arch/parisc/include/asm/io.h
index 3143cf29ce27..61173a2b38e4 100644
--- a/arch/parisc/include/asm/io.h
+++ b/arch/parisc/include/asm/io.h
@@ -135,9 +135,6 @@ static inline void gsc_writeq(unsigned long long val, unsigned long addr)
 
 #define pci_iounmap			pci_iounmap
 
-void memcpy_fromio(void *dst, const volatile void __iomem *src, int count);
-#define memcpy_fromio memcpy_fromio
-
 /* Port-space IO */
 
 #define inb_p inb
diff --git a/arch/parisc/kernel/parisc_ksyms.c b/arch/parisc/kernel/parisc_ksyms.c
index 1c366b0d3134..509146a52725 100644
--- a/arch/parisc/kernel/parisc_ksyms.c
+++ b/arch/parisc/kernel/parisc_ksyms.c
@@ -43,7 +43,6 @@ EXPORT_SYMBOL($global$);
 #endif
 
 #include <asm/io.h>
-EXPORT_SYMBOL(memcpy_fromio);
 
 extern void $$divI(void);
 extern void $$divU(void);
diff --git a/arch/parisc/lib/io.c b/arch/parisc/lib/io.c
index 6e81200dc87a..3c7e617f5a93 100644
--- a/arch/parisc/lib/io.c
+++ b/arch/parisc/lib/io.c
@@ -12,67 +12,6 @@
 #include <linux/module.h>
 #include <asm/io.h>
 
-/*
-** Copies a block of memory from a device in an efficient manner.
-** Assumes the device can cope with 32-bit transfers.  If it can't,
-** don't use this function.
-**
-** CR16 counts on C3000 reading 256 bytes from Symbios 896 RAM:
-**	27341/64    = 427 cyc per int
-**	61311/128   = 478 cyc per short
-**	122637/256  = 479 cyc per byte
-** Ergo bus latencies dominant (not transfer size).
-**      Minimize total number of transfers at cost of CPU cycles.
-**	TODO: only look at src alignment and adjust the stores to dest.
-*/
-void memcpy_fromio(void *dst, const volatile void __iomem *src, int count)
-{
-	/* first compare alignment of src/dst */ 
-	if ( (((unsigned long)dst ^ (unsigned long)src) & 1) || (count < 2) )
-		goto bytecopy;
-
-	if ( (((unsigned long)dst ^ (unsigned long)src) & 2) || (count < 4) )
-		goto shortcopy;
-
-	/* Then check for misaligned start address */
-	if ((unsigned long)src & 1) {
-		*(u8 *)dst = readb(src);
-		src++;
-		dst++;
-		count--;
-		if (count < 2) goto bytecopy;
-	}
-
-	if ((unsigned long)src & 2) {
-		*(u16 *)dst = __raw_readw(src);
-		src += 2;
-		dst += 2;
-		count -= 2;
-	}
-
-	while (count > 3) {
-		*(u32 *)dst = __raw_readl(src);
-		dst += 4;
-		src += 4;
-		count -= 4;
-	}
-
- shortcopy:
-	while (count > 1) {
-		*(u16 *)dst = __raw_readw(src);
-		src += 2;
-		dst += 2;
-		count -= 2;
-	}
-
- bytecopy:
-	while (count--) {
-		*(char *)dst = readb(src);
-		src++;
-		dst++;
-	}
-}
-
 /*
  * Read COUNT 8-bit bytes from port PORT into memory starting at
  * SRC.
-- 
2.34.1

