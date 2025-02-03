Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B8B209F4C;
	Mon,  3 Feb 2025 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597347; cv=pass; b=pd8drZilFzMVdrUN+O4OPbX3/zVOeTcLkqqwJn82Y7eHFKx8A3tJOBxODe1kdaX40s5eWORSHhPfjiVUYiC9669vL3g0Yvy3MXbyvFH/Qb5fBKTKP0oG8Z04wuILDzA9tKQ5UWRxxWfIzMI6StOZb1E93tOW1Dt1QI9qono9Hio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597347; c=relaxed/simple;
	bh=+dDk8QmoYU+rFV84x362F96ajoFuvPzAEV+yywKHlQg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ttJO2Xg4f/PDZkw6aTN7fL92Lyu90skVp5jMkdr5te9HbHZIdGFm7+Mjtv/RTTIArZLmA5bVtka3t/MPqD1qoeYv5AUEhxHKbhoZ70GFzcTQEvrHaEc61lRgbh7TNSyzgfdBuafQQ1NFU0wKSoU1/JeI+Fkwjqn3E15R1ZsNsCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outer-limits.org; spf=none smtp.mailfrom=outer-limits.org; dkim=pass (2048-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b=ZxI1TzDR; dkim=permerror (0-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b=MiooMPHQ; arc=pass smtp.client-ip=81.169.146.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b="ZxI1TzDR";
	dkim=permerror (0-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b="MiooMPHQ"
ARC-Seal: i=1; a=rsa-sha256; t=1738597342; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=h5uBBBE3c/Fa+JYDHMi/jGRFYXjy+F8yBvlPN2UIxKH4Z1M9FrZZFbRdk982Yxq1m2
    3nRTfp718bhrk6oSZVmrxcHzELSda8Hhrn0ouvybTbfF5eFiSnWJKHewri/O5F4tcaGs
    QDhBcxidXS0POqL9ZI+ldRPCS1eaxsebqhgKACZPGDO5u2JMc4dn7+UkLU/Pi1GREoEv
    A19t+G2a5Hng1dR6d1PYTemlcsbVVrN+k7A8AguVZNhQ93KB/8uZtInSUXHEqq1GoKVS
    fPExY7HnlYRN/9Bi4nhkLhczpTG2Pvq3oehMeWVHHjTMCw5tl7q9ggJaDbBggQGNguUY
    2n/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1738597342;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=G5dzb8nk5KEWKjxhI2WoisRcHxkN9yXX/ahlj1W6C8Y=;
    b=HuxFuvaaTd8+H3vZs2JXOtCWJE4y/kfay3ZOVHdq3sZ/PqAUWDdUOjn/hdSuNYRvwJ
    ZswaHeFlxb3WZ+Oil6V/pFRh65NU44MRzuxyjqRDTgiHs308Jh4l2wpBqf1IBM3lnX5S
    0CnouU6AtDvCXxdw/CwWm68saYr+hRv8M+NLcd+7mRB16N4bfGQCTIUzxwIIEtnaLzIQ
    V9EkHdAusKXkefihDyXCbtkzNFpZMKugTOGnKyu4wv0FXh4UIwedLExHl3BgJu/wblUS
    25CEccledsS2Lq8p0X4S5HLsDzuWRNZrprcXn/ji6yITZfXjvYaiqhYxljv/7eTWCBnc
    kOiA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1738597342;
    s=strato-dkim-0002; d=outer-limits.org;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=G5dzb8nk5KEWKjxhI2WoisRcHxkN9yXX/ahlj1W6C8Y=;
    b=ZxI1TzDR+rB6wCEd/qRP9crzakJQZtggdQqFlZMej+tf51MQZS6zpwXH+vQuzwaisR
    /VL+zLJbjAXELvhPxc56WHmB+S1lzLMxoJcid8dYz6dGGPIvetb5BWKyR+38WIwJgXJ3
    HXQslQ6zTnLgwSoPuHOnP6kd28vpj4x5WeBPuA/JIDQts1fkZDf0xBCAZOCMFuZk4+Zg
    2N3NwjNT7gXqx+6XkmBWe+k7v0+87uImcsnB+2HPVqEjidR4yYciIsFeu/VHuaPlLVUr
    Y5JFjlSce2f3MmnLNsYYxDXHP27EfeZSrNWWXolF8d1g6KalRLsjhxuDwdQzcJqBWAaU
    UaqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1738597342;
    s=strato-dkim-0003; d=outer-limits.org;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=G5dzb8nk5KEWKjxhI2WoisRcHxkN9yXX/ahlj1W6C8Y=;
    b=MiooMPHQp3O6Ll6+zSS0/oruf9cFgsihNMlEnFi1y1wkkzxLcpFU5vjBPYVVnynLl3
    gKszA9+K9QkO0Urmm8AQ==
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBEHcVJSv9P5mRTGd2ImeA=="
Received: from ws2104.lan.kalrayinc.com
    by smtp.strato.de (RZmta 51.2.17 AUTH)
    with ESMTPSA id J1a251113FgLFKL
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 3 Feb 2025 16:42:21 +0100 (CET)
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
Subject: [PATCH v2 1/2] alpha: rework use of memset_io, memsetw_io and scr_memsetw
Date: Mon,  3 Feb 2025 16:42:15 +0100
Message-Id: <20250203154216.172040-1-julian@outer-limits.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

In order to prepare the alpha architecture to use the generic IO
functions from lib/iomem_copy.c, rename _memset_c_io to memsetw_io.
Then move scr_memsetw to io.c, along the scr_memcpyw and scr_memmovew,
inside the CONFIG_VGA_CONSOLE.

Signed-off-by: Julian Vetter <julian@outer-limits.org>
---
Changes for V2:
- Split the patch into two:
  - One that shuffles the memsetw_io and _memset_c_io around
  - And one that removed the memcpy_fromio and memcpy_toio
---
 arch/alpha/include/asm/io.h  | 14 +------------
 arch/alpha/include/asm/vga.h |  9 +--------
 arch/alpha/kernel/io.c       | 38 +++++++++++++++++++-----------------
 3 files changed, 22 insertions(+), 39 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index 65fe1e54c6da..d6e868872e19 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -592,20 +592,8 @@ extern inline u64 readq_relaxed(const volatile void __iomem *addr)
  */
 extern void memcpy_fromio(void *, const volatile void __iomem *, long);
 extern void memcpy_toio(volatile void __iomem *, const void *, long);
-extern void _memset_c_io(volatile void __iomem *, unsigned long, long);
+extern void memsetw_io(volatile void __iomem *to, u16 c, long count);
 
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
 #define memcpy_fromio memcpy_fromio
 #define memcpy_toio memcpy_toio
 
diff --git a/arch/alpha/include/asm/vga.h b/arch/alpha/include/asm/vga.h
index 919931cb5b63..01611d792597 100644
--- a/arch/alpha/include/asm/vga.h
+++ b/arch/alpha/include/asm/vga.h
@@ -31,17 +31,10 @@ static inline u16 scr_readw(volatile const u16 *addr)
 		return *addr;
 }
 
-static inline void scr_memsetw(u16 *s, u16 c, unsigned int count)
-{
-	if (__is_ioaddr(s))
-		memsetw_io((u16 __iomem *) s, c, count);
-	else
-		memset16(s, c, count / 2);
-}
-
 /* Do not trust that the usage will be correct; analyze the arguments.  */
 extern void scr_memcpyw(u16 *d, const u16 *s, unsigned int count);
 extern void scr_memmovew(u16 *d, const u16 *s, unsigned int count);
+extern void scr_memsetw(u16 *s, u16 c, unsigned int count);
 
 /* ??? These are currently only used for downloading character sets.  As
    such, they don't need memory barriers.  Is this all they are intended
diff --git a/arch/alpha/kernel/io.c b/arch/alpha/kernel/io.c
index c28035d6d1e6..353b1dcbd422 100644
--- a/arch/alpha/kernel/io.c
+++ b/arch/alpha/kernel/io.c
@@ -585,29 +585,31 @@ void memcpy_toio(volatile void __iomem *to, const void *from, long count)
 
 EXPORT_SYMBOL(memcpy_toio);
 
+#if IS_ENABLED(CONFIG_VGA_CONSOLE) || IS_ENABLED(CONFIG_MDA_CONSOLE)
 
-/*
- * "memset" on IO memory space.
- */
-void _memset_c_io(volatile void __iomem *to, unsigned long c, long count)
+#include <asm/vga.h>
+
+void memsetw_io(volatile void __iomem *to, u16 c, long count)
 {
+	unsigned long v = 0x0001000100010001UL * c;
+
 	/* Handle any initial odd byte */
 	if (count > 0 && ((u64)to & 1)) {
-		__raw_writeb(c, to);
+		__raw_writeb(v, to);
 		to++;
 		count--;
 	}
 
 	/* Handle any initial odd halfword */
 	if (count >= 2 && ((u64)to & 2)) {
-		__raw_writew(c, to);
+		__raw_writew(v, to);
 		to += 2;
 		count -= 2;
 	}
 
 	/* Handle any initial odd word */
 	if (count >= 4 && ((u64)to & 4)) {
-		__raw_writel(c, to);
+		__raw_writel(v, to);
 		to += 4;
 		count -= 4;
 	}
@@ -617,7 +619,7 @@ void _memset_c_io(volatile void __iomem *to, unsigned long c, long count)
 	count -= 8;
 	if (count >= 0) {
 		do {
-			__raw_writeq(c, to);
+			__raw_writeq(v, to);
 			to += 8;
 			count -= 8;
 		} while (count >= 0);
@@ -626,14 +628,14 @@ void _memset_c_io(volatile void __iomem *to, unsigned long c, long count)
 
 	/* The tail is word-aligned if we still have count >= 4 */
 	if (count >= 4) {
-		__raw_writel(c, to);
+		__raw_writel(v, to);
 		to += 4;
 		count -= 4;
 	}
 
 	/* The tail is half-word aligned if we have count >= 2 */
 	if (count >= 2) {
-		__raw_writew(c, to);
+		__raw_writew(v, to);
 		to += 2;
 		count -= 2;
 	}
@@ -645,14 +647,14 @@ void _memset_c_io(volatile void __iomem *to, unsigned long c, long count)
 	mb();
 }
 
-EXPORT_SYMBOL(_memset_c_io);
-
-#if IS_ENABLED(CONFIG_VGA_CONSOLE) || IS_ENABLED(CONFIG_MDA_CONSOLE)
-
-#include <asm/vga.h>
-
-/* A version of memcpy used by the vga console routines to move data around
-   arbitrarily between screen and main memory.  */
+void scr_memsetw(u16 *s, u16 c, unsigned int count)
+{
+	if (__is_ioaddr(s))
+		memsetw_io((u16 __iomem *) s, c, count);
+	else
+		memset16(s, c, count / 2);
+}
+EXPORT_SYMBOL(scr_memsetw);
 
 void
 scr_memcpyw(u16 *d, const u16 *s, unsigned int count)
-- 
2.34.1

