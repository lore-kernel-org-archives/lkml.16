Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9233720A5C8;
	Mon,  3 Feb 2025 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597353; cv=pass; b=Jzvv5WrfRmDnhdgmiSmIDhJvxwH2Fo5P9r9CSffvLsONKCU9OC3v9JJVK50BQr/ecSqC9x/UsM6IVdTD0RSRz8Oh7GT9H7fDI/5Z6JgO0rdHavybTRF5zqSeCaZz86WBKJ3qeQ3vRP/OZf8sdwqwVHsoSZ5ueUEE0mHtdxkXmeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597353; c=relaxed/simple;
	bh=SEsrsy0vMv27i2pCiS3XUVK6T6Nd5cC5BOZnx21VJgo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sRXdiyY8SxzMC/QqpBwBQ41HdQuScI55DwSL+o5cTOPqA/ZV4u68e4wOTP8bG0BDZgRn2M+cKYn9HmdvZFDP4ggQxgd2hioyi/M6tUaJQunF0g6NlsLJUxQ/KVU8tvlIG+Nhl0L5cBLMPm+r+YEeGIpEVLYHq0ZOZXaqGwW+BzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outer-limits.org; spf=none smtp.mailfrom=outer-limits.org; dkim=pass (2048-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b=FHmXz2JI; dkim=permerror (0-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b=EkssJjtw; arc=pass smtp.client-ip=85.215.255.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b="FHmXz2JI";
	dkim=permerror (0-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b="EkssJjtw"
ARC-Seal: i=1; a=rsa-sha256; t=1738597342; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=NXX31/qhIDuQbz/sHdqKQEvWvhumOVUcqc2H1dykGB3KTATHRiRPr2JTYgOGGEx+RY
    CbiyfMeL+m/CVoRwiLNh+ddwLjaZAoBmjnO+kmc/WXUhSDJu/vpj6aYS0LWiXZ68wGVt
    l3GLq7d0+wa/5j7xKshOA9/6pUJVa6K0K+WkJMaAaNTFWc3N055/tuM+rCQtMzjrnion
    obcoCpoDQC6mtIhc21Rqr+cyErA5B4b7R8Vj6fCx8KSiVtG0eQdg0wNs7u2E1ddio7Oy
    K+/Jvqu+1d5U4HfRcsltvnqUYlABwz+TGwXrPr/CNXH45Qg+NusYorfa35B7OrbxViL7
    4QEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1738597342;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=pQhwB4aRGyRUTDm1T/bb07MveF9L9AHnShW286QE52g=;
    b=q+okQF7jNxkA6EcQFezDpXBiDPvi2BpeCliTRhfPCm5KKx+vmr8M+rErB/B/X4XZWK
    hcd0WKQxKkeA+cSsa6xsSuXEzqXLpdyIm0z7EW8CR9T/rYmSwD+dbxTGC+nq1hgKySgY
    0ccP2JqSSCRCcz2sPMkyoAzpJp+umf9RgrTapEBbIUneVojwyl124LlsMYwd3+3U+qtL
    1jQp5wq76CI6B49opC3UxEbjkF2EP/f63CZdPIPGK/Vv1V1J/0IFJpWy4GOPsbqhNp9G
    cQ0M2duRQtMTEk3nSHRSxctqh84ydF4biGTUaxry1xweWttGCRAIcWVtF44xLSp53MCt
    dFrA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1738597342;
    s=strato-dkim-0002; d=outer-limits.org;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=pQhwB4aRGyRUTDm1T/bb07MveF9L9AHnShW286QE52g=;
    b=FHmXz2JITm3Bo7K8X13S2jqpguqCchO2142VgVvw7bSRi9R1m/vogVKByr2uZSOojg
    J+Tg1O8DXFB1Fp+mah7K6hJrE79j6yzx7o29vGCxVKqD5fO6FywCbFgndNnX2TLUsHcI
    Iqq2rqeM5hB0zLhXL4BO3VsgpqAIbU3Szfrp3JKkVtg1YPNQvvGynhi49/O1TdlEZ+GQ
    B+fEt7D0HcILUKMJq3+Yqotmd1urf2L95I5V52N3rJluewmxRCPRdadmvekAUNFScjnJ
    oyP9pmmiMYbrpAlszf37oYMGjCrGwPvLUabW1s+zfe0dId5r5E/SwbbbB8l0ZBV20XLX
    kaMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1738597342;
    s=strato-dkim-0003; d=outer-limits.org;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=pQhwB4aRGyRUTDm1T/bb07MveF9L9AHnShW286QE52g=;
    b=EkssJjtwICzQbb98zDlEdCZQ/vthFAMYRSgKCsfec1h/4jMa4W7J81y5QgrWEx+5X6
    bzcFVT18R316ce+Jz/Ag==
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBEHcVJSv9P5mRTGd2ImeA=="
Received: from ws2104.lan.kalrayinc.com
    by smtp.strato.de (RZmta 51.2.17 AUTH)
    with ESMTPSA id J1a251113FgMFKN
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 3 Feb 2025 16:42:22 +0100 (CET)
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
Subject: [PATCH v2 2/2] alpha: Remove IO memcpy and memset
Date: Mon,  3 Feb 2025 16:42:16 +0100
Message-Id: <20250203154216.172040-2-julian@outer-limits.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203154216.172040-1-julian@outer-limits.org>
References: <20250203154216.172040-1-julian@outer-limits.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Recently new IO memcpy were added in libs/iomem_copy.c. So, remove the
alpha specific implementations and use the ones from the lib code.

Signed-off-by: Julian Vetter <julian@outer-limits.org>
---
Changes for V2:
- Split the patch into two:
  - One that shuffles the memsetw_io and _memset_c_io around
  - And one that removed the memcpy_fromio and memcpy_toio
---
 arch/alpha/include/asm/io.h |   5 --
 arch/alpha/kernel/io.c      | 109 ------------------------------------
 2 files changed, 114 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index d6e868872e19..ba45f84c97f1 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -590,13 +590,8 @@ extern inline u64 readq_relaxed(const volatile void __iomem *addr)
 /*
  * String version of IO memory access ops:
  */
-extern void memcpy_fromio(void *, const volatile void __iomem *, long);
-extern void memcpy_toio(volatile void __iomem *, const void *, long);
 extern void memsetw_io(volatile void __iomem *to, u16 c, long count);
 
-#define memcpy_fromio memcpy_fromio
-#define memcpy_toio memcpy_toio
-
 /*
  * String versions of in/out ops:
  */
diff --git a/arch/alpha/kernel/io.c b/arch/alpha/kernel/io.c
index 353b1dcbd422..a6a53fcfafb6 100644
--- a/arch/alpha/kernel/io.c
+++ b/arch/alpha/kernel/io.c
@@ -476,115 +476,6 @@ void outsl(unsigned long port, const void *src, unsigned long count)
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
 #if IS_ENABLED(CONFIG_VGA_CONSOLE) || IS_ENABLED(CONFIG_MDA_CONSOLE)
 
 #include <asm/vga.h>
-- 
2.34.1

