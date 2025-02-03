Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D94F2046A2;
	Mon,  3 Feb 2025 14:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592299; cv=pass; b=ZDKocs1JXtPR0KMho19CQXGBk/PYyA20x7xlnuHwiUX2BNEAtsP+UY5+NUB5qa7usBu5Cf/zAYNef2Mt+NpGaFeFS9uo9rtvRzRiVgrxSogkCm2iXBaOjaXwwHes+ozLjrLxMi7gcz4ib3FF/ZzrvT8/p7wHN4YLviwpgpV8zOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592299; c=relaxed/simple;
	bh=+OIJLbwmbRBq/6x/XEMioIyjMHXSo65wOIRrkNqktwM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=B1zfpSiEmK8RvRL+my4pr0DIPZ9u/ZjPUrweNMGDGkShrxhtszRszbAFRo5TB6r6zMzCSiyoPXVJ1mDMhhUccij6RGiF02tXc+toS9BhxDSoMOLZuPTiPey6L/3E+I4CDUOHQ9Y8oPbJhqTTMQaLDgnZgg472lRDh2zkcu5pxG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outer-limits.org; spf=none smtp.mailfrom=outer-limits.org; dkim=pass (2048-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b=nOtWyHqu; dkim=permerror (0-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b=ywuXFvMX; arc=pass smtp.client-ip=81.169.146.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b="nOtWyHqu";
	dkim=permerror (0-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b="ywuXFvMX"
ARC-Seal: i=1; a=rsa-sha256; t=1738592287; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Yh6k7SlfBzetURdHUt5Afcle/68U30OfP54PfRfiDq6m/ClmKyJk9IInXvQsb/Fb4a
    e1jRIxnoC9yn660olLSZUzeX4InKD6XckyBp65tjKOAKEkuOKZVN2dIJoh6RqETNwa6D
    dWHuR72GW7Ry73/dPM4W4r2Ms5JP09XN6v+lijAPIpCqMPScAPLk2Lb7vatrIcS2oHw4
    PtqlREqgjm/94c9vinGO8pbLAqcyLb4md//7UtCMTh5EnpOcb9Z6q/6a3/BlvJgxDznJ
    eisYCWAaWvtFi8cJEh2TS681hCA7Y3G4Sd4/VGh3RTcOabDdwcrtNmwOjJr3+zn0yzbH
    6TrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1738592287;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=rry/LL5P0o3dYdcGPj9esery0p5jm2k5jqTCr1NFU6c=;
    b=QsgeMWnUdwo7Jb976YBehMC6dJ9uxat3mm2UW1gzCDDu/Kxwc+6kTjYWVq+nspeIuu
    WQW9OvJo3YMVJOJILq5Zb2WWU2jIokAHoHqCo5ccLBMLvXKz/+YTakq/31pCo+gjY6lY
    5nLnJKg35repTktWawwXt7I7X2WgQFc2Jd8ZTzXs7t8T6q4jAsJR6sK8MBwnVJ6NbQmI
    kpgc1dcY91a2Sema7ZynF2S7H15ssBHStzVMbnF99L8KoxMGo8lFWC1bBz5EVz11TEPX
    jQcDoelZRMT/N/YiLUteR5n1rmfdh2Uqvpr5e8kAllaGSXGYRy5nfYVAYjm9fLZCpV8P
    0cEw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1738592287;
    s=strato-dkim-0002; d=outer-limits.org;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=rry/LL5P0o3dYdcGPj9esery0p5jm2k5jqTCr1NFU6c=;
    b=nOtWyHqut25nEe/u0+XHRo0ieVOL3ulOku4hRQ4QnSXZwxz8tb+vt7Twkk/prImRHM
    Y+8nx3EKjVU3U/659vLOvk1MZaBWCiJMvceKiHPo/bLZR15vVMfCRvL74cq/0PdwZQN0
    e9WCAJWwZs5QD9hNClNsElK/9rrEX54QycmujJk/x5bm54jJMOEvrE3SmcdEs9bW3EET
    XiT1MD5lMGbmL0VQEitV/MU6pJqebQnvxLZF99CiJe1eecQ61gHhHbQMQYFMQidNLzLd
    ttWbKQ5amjKgLtI3LFTGlnHtl1J+hcMTJ/ihavyjBfBK+Kewc8leh2kZqxclHoc6BBjC
    9gEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1738592287;
    s=strato-dkim-0003; d=outer-limits.org;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=rry/LL5P0o3dYdcGPj9esery0p5jm2k5jqTCr1NFU6c=;
    b=ywuXFvMXKQlaGJKHJO/4/hWt8B5jQVhfIswESfvUgd2PNBf+me7G/XhycRdGcoHrZ3
    gu1HLbgFH0J1CLGtKHAw==
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBEHcVJSv9P5mRTGd2ImeA=="
Received: from ws2104.lan.kalrayinc.com
    by smtp.strato.de (RZmta 51.2.17 AUTH)
    with ESMTPSA id J1a251113EI7EJR
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 3 Feb 2025 15:18:07 +0100 (CET)
From: Julian Vetter <julian@outer-limits.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Vetter <julian@outer-limits.org>
Subject: [PATCH] alpha: Remove IO memcpy and memset
Date: Mon,  3 Feb 2025 15:18:00 +0100
Message-Id: <20250203141800.69126-1-julian@outer-limits.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Recently a new IO memcpy and memset was added in libs/iomem_copy.c. So,
remove the alpha specific implementations and use the one from the lib.

Signed-off-by: Julian Vetter <julian@outer-limits.org>
---
 arch/alpha/include/asm/io.h  |  22 -----
 arch/alpha/include/asm/vga.h |   2 +-
 arch/alpha/kernel/io.c       | 171 -----------------------------------
 3 files changed, 1 insertion(+), 194 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index 65fe1e54c6da..2de75404bda1 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -587,28 +587,6 @@ extern inline u64 readq_relaxed(const volatile void __iomem *addr)
 #define writel_relaxed	writel
 #define writeq_relaxed	writeq
 
-/*
- * String version of IO memory access ops:
- */
-extern void memcpy_fromio(void *, const volatile void __iomem *, long);
-extern void memcpy_toio(volatile void __iomem *, const void *, long);
-extern void _memset_c_io(volatile void __iomem *, unsigned long, long);
-
-static inline void memset_io(volatile void __iomem *addr, u8 c, long len)
-{
-	_memset_c_io(addr, 0x0101010101010101UL * c, len);
-}
-
-#define __HAVE_ARCH_MEMSETW_IO
-static inline void memsetw_io(volatile void __iomem *addr, u16 c, long len)
-{
-	_memset_c_io(addr, 0x0001000100010001UL * c, len);
-}
-
-#define memset_io memset_io
-#define memcpy_fromio memcpy_fromio
-#define memcpy_toio memcpy_toio
-
 /*
  * String versions of in/out ops:
  */
diff --git a/arch/alpha/include/asm/vga.h b/arch/alpha/include/asm/vga.h
index 919931cb5b63..cac735bc3e16 100644
--- a/arch/alpha/include/asm/vga.h
+++ b/arch/alpha/include/asm/vga.h
@@ -34,7 +34,7 @@ static inline u16 scr_readw(volatile const u16 *addr)
 static inline void scr_memsetw(u16 *s, u16 c, unsigned int count)
 {
 	if (__is_ioaddr(s))
-		memsetw_io((u16 __iomem *) s, c, count);
+		memset_io((u16 __iomem *) s, c, count);
 	else
 		memset16(s, c, count / 2);
 }
diff --git a/arch/alpha/kernel/io.c b/arch/alpha/kernel/io.c
index c28035d6d1e6..0d24a6ad682c 100644
--- a/arch/alpha/kernel/io.c
+++ b/arch/alpha/kernel/io.c
@@ -476,177 +476,6 @@ void outsl(unsigned long port, const void *src, unsigned long count)
 EXPORT_SYMBOL(iowrite32_rep);
 EXPORT_SYMBOL(outsl);
 
-
-/*
- * Copy data from IO memory space to "real" memory space.
- * This needs to be optimized.
- */
-void memcpy_fromio(void *to, const volatile void __iomem *from, long count)
-{
-	/* Optimize co-aligned transfers.  Everything else gets handled
-	   a byte at a time. */
-
-	if (count >= 8 && ((u64)to & 7) == ((u64)from & 7)) {
-		count -= 8;
-		do {
-			*(u64 *)to = __raw_readq(from);
-			count -= 8;
-			to += 8;
-			from += 8;
-		} while (count >= 0);
-		count += 8;
-	}
-
-	if (count >= 4 && ((u64)to & 3) == ((u64)from & 3)) {
-		count -= 4;
-		do {
-			*(u32 *)to = __raw_readl(from);
-			count -= 4;
-			to += 4;
-			from += 4;
-		} while (count >= 0);
-		count += 4;
-	}
-
-	if (count >= 2 && ((u64)to & 1) == ((u64)from & 1)) {
-		count -= 2;
-		do {
-			*(u16 *)to = __raw_readw(from);
-			count -= 2;
-			to += 2;
-			from += 2;
-		} while (count >= 0);
-		count += 2;
-	}
-
-	while (count > 0) {
-		*(u8 *) to = __raw_readb(from);
-		count--;
-		to++;
-		from++;
-	}
-	mb();
-}
-
-EXPORT_SYMBOL(memcpy_fromio);
-
-
-/*
- * Copy data from "real" memory space to IO memory space.
- * This needs to be optimized.
- */
-void memcpy_toio(volatile void __iomem *to, const void *from, long count)
-{
-	/* Optimize co-aligned transfers.  Everything else gets handled
-	   a byte at a time. */
-	/* FIXME -- align FROM.  */
-
-	if (count >= 8 && ((u64)to & 7) == ((u64)from & 7)) {
-		count -= 8;
-		do {
-			__raw_writeq(*(const u64 *)from, to);
-			count -= 8;
-			to += 8;
-			from += 8;
-		} while (count >= 0);
-		count += 8;
-	}
-
-	if (count >= 4 && ((u64)to & 3) == ((u64)from & 3)) {
-		count -= 4;
-		do {
-			__raw_writel(*(const u32 *)from, to);
-			count -= 4;
-			to += 4;
-			from += 4;
-		} while (count >= 0);
-		count += 4;
-	}
-
-	if (count >= 2 && ((u64)to & 1) == ((u64)from & 1)) {
-		count -= 2;
-		do {
-			__raw_writew(*(const u16 *)from, to);
-			count -= 2;
-			to += 2;
-			from += 2;
-		} while (count >= 0);
-		count += 2;
-	}
-
-	while (count > 0) {
-		__raw_writeb(*(const u8 *) from, to);
-		count--;
-		to++;
-		from++;
-	}
-	mb();
-}
-
-EXPORT_SYMBOL(memcpy_toio);
-
-
-/*
- * "memset" on IO memory space.
- */
-void _memset_c_io(volatile void __iomem *to, unsigned long c, long count)
-{
-	/* Handle any initial odd byte */
-	if (count > 0 && ((u64)to & 1)) {
-		__raw_writeb(c, to);
-		to++;
-		count--;
-	}
-
-	/* Handle any initial odd halfword */
-	if (count >= 2 && ((u64)to & 2)) {
-		__raw_writew(c, to);
-		to += 2;
-		count -= 2;
-	}
-
-	/* Handle any initial odd word */
-	if (count >= 4 && ((u64)to & 4)) {
-		__raw_writel(c, to);
-		to += 4;
-		count -= 4;
-	}
-
-	/* Handle all full-sized quadwords: we're aligned
-	   (or have a small count) */
-	count -= 8;
-	if (count >= 0) {
-		do {
-			__raw_writeq(c, to);
-			to += 8;
-			count -= 8;
-		} while (count >= 0);
-	}
-	count += 8;
-
-	/* The tail is word-aligned if we still have count >= 4 */
-	if (count >= 4) {
-		__raw_writel(c, to);
-		to += 4;
-		count -= 4;
-	}
-
-	/* The tail is half-word aligned if we have count >= 2 */
-	if (count >= 2) {
-		__raw_writew(c, to);
-		to += 2;
-		count -= 2;
-	}
-
-	/* And finally, one last byte.. */
-	if (count) {
-		__raw_writeb(c, to);
-	}
-	mb();
-}
-
-EXPORT_SYMBOL(_memset_c_io);
-
 #if IS_ENABLED(CONFIG_VGA_CONSOLE) || IS_ENABLED(CONFIG_MDA_CONSOLE)
 
 #include <asm/vga.h>
-- 
2.34.1

