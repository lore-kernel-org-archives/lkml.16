Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9E21E9B25;
	Thu, 30 Jan 2025 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.160
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738244909; cv=pass; b=uN1vgxOZ1czQeVNNuvj/EmbDh+9EyrG15Onj28ehYCEcuBjY8T5IWvmhn/SXmyV/hR8LlIWYy7hNihVALWNrR77+8YdX7Y7PXXD8e5W/UaPsnl+lYjQ5zoOlAqOvzQcF5a8tUx6gb2Y5c8ryEGmNLC0LTfgHjiUN6pzs+17c/5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738244909; c=relaxed/simple;
	bh=O28Xp5/hr8kz3i+uHUB7UlDUVQIlr7Q6epSQ0icw/ak=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=iHigSpIerMqWrWL3j+5r8b5Z+DaQndXmVUIAqT7uDoJ1z440KYvhdmrtac/GXCDq5I1Ck1cGtBT/EH8ImwaC3+A7Mo8vhfoW8tGGBpURZlgkZXoKoNhFl8ehFbEM/FnfnjXW3uT+LQHVJ49E58GT9Fi+nxoRJAxwfmhnhnEyFn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outer-limits.org; spf=none smtp.mailfrom=outer-limits.org; dkim=pass (2048-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b=j+TSI10D; dkim=permerror (0-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b=Gwst9t6X; arc=pass smtp.client-ip=81.169.146.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b="j+TSI10D";
	dkim=permerror (0-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b="Gwst9t6X"
ARC-Seal: i=1; a=rsa-sha256; t=1738244897; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=sGgACecIZcRVX3bcDw/bZSBitQ+IBqZizTasPRtF2S/S30JB62E3bdh1AzH7pd7HxA
    bnAfvOmNJCIR2oCxOpii+RScsIUkpOEKtFxQ44HDqwBMucu+gx03FoBXY0bOii5+8tvD
    BA7f6KFPPOgRpxqyJqIgGJFAMDnNHUWQc6SxB3rI4EPvRtcixNrGb2fHMx3gLDmDHpTI
    btHUPAlDDKV6VXOsPOru/+EFcYTxrlfNoNkanlVqOzrwqyIRdZT9iiQUKzXPUyFuVyuv
    pu+S6X86fVkhylLHbU9FyqqgrBc7FrvP1GqDcWs5bj3VEyNYswR+LSq7ZXK4efd6flPQ
    00Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1738244897;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=8ubQkok/u+8Ovmps6+YWTZkwKMZsIDIPh23npdZdhBI=;
    b=oyVfmbvFLC9RAcG8FoZw7gdu6ehXIxp6Zz4k1Etw9S+WWupOiyBavrO8oXmdcPO+kW
    rf6sHXZjM7IxEwK2Q6EMjn3xhasYA954gv8vs6VNoOoxaEwdKdY/QtMgx3TbDD4Ul5g/
    +DNf28Exdtr1UCoaDZ+u8BYXCSl4BQIUxTtHyC7CUIfitnjTkdUwYx4Xx1E4SpD3ACh7
    H2DY6tSjsSwI2+9ZCrFPwwzOhVhzn5oN+uhMDerV8ec63qBo+zkAHiiJEWLDHIjr1K2k
    DL3dYh8JT1OlBueAlK6K3A+RaJIe/yNRkWE3tKmU/POwp0DTIBaFrtTCXvzgyUmGSwzo
    W90Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1738244897;
    s=strato-dkim-0002; d=outer-limits.org;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=8ubQkok/u+8Ovmps6+YWTZkwKMZsIDIPh23npdZdhBI=;
    b=j+TSI10DfM393C2lzu91uW8UqLvg7D5aUxhj1kSrT2MQ3ZL5RtoqADkTcNiCgCFkc3
    k0USuyB2cWYX+wkO4oDeFat99t8jmCSSxmqQPaHSTJdjkX+l8hlcSvWNSeOmDekZno9M
    VZN/FUOT2Rb+QRm1hLh+Eyc6WyV8xX3ukxxh6oZWZJW4LfBHeNZQePEtOt3ie6yxzrSK
    Vpf0OwMj3DzKumCK7AmE3yIXKqISBcHS9En0cbl33L1Us/dcpI06iCjVSeAGswrfOjVQ
    JF9zKwCVeejca+oejcHTgbi05j2Gr51MJ3BRw2yCsqwVL+SqGYRKtWf73qDvqUYcklKR
    LsAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1738244897;
    s=strato-dkim-0003; d=outer-limits.org;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=8ubQkok/u+8Ovmps6+YWTZkwKMZsIDIPh23npdZdhBI=;
    b=Gwst9t6XgXwb1qkz7dFnea9ryJTYuyra4CnoStyYlBXpjhO6kXlB4yVYw64QbRo8uq
    j+C8eElQ3T/QJKKpCUCg==
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBEHcVJSv9P5mRTGd2ImeA=="
Received: from ws2104.lan.kalrayinc.com
    by smtp.strato.de (RZmta 51.2.17 AUTH)
    with ESMTPSA id J1a25110UDmGUA8
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 30 Jan 2025 14:48:16 +0100 (CET)
From: Julian Vetter <julian@outer-limits.org>
To: Arnd Bergmann <arnd@arndb.de>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Vetter <julian@outer-limits.org>
Subject: [PATCH] parisc: Fix formatting errors in io.c
Date: Thu, 30 Jan 2025 14:48:10 +0100
Message-Id: <20250130134810.2646219-1-julian@outer-limits.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Mutliple lines in the file contain tabs in lines where there is no
code. Just remove them.

Signed-off-by: Julian Vetter <julian@outer-limits.org>
---
 arch/parisc/lib/io.c | 58 ++++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/parisc/lib/io.c b/arch/parisc/lib/io.c
index 7461366a65c9..6e81200dc87a 100644
--- a/arch/parisc/lib/io.c
+++ b/arch/parisc/lib/io.c
@@ -123,15 +123,15 @@ void insw (unsigned long port, void *dst, unsigned long count)
 	unsigned char *p;
 
 	p = (unsigned char *)dst;
-	
+
 	if (!count)
 		return;
-	
+
 	switch (((unsigned long)p) & 0x3)
 	{
 	 case 0x00:			/* Buffer 32-bit aligned */
 		while (count>=2) {
-			
+
 			count -= 2;
 			l = cpu_to_le16(inw(port)) << 16;
 			l |= cpu_to_le16(inw(port));
@@ -142,13 +142,13 @@ void insw (unsigned long port, void *dst, unsigned long count)
 			*(unsigned short *)p = cpu_to_le16(inw(port));
 		}
 		break;
-	
+
 	 case 0x02:			/* Buffer 16-bit aligned */
 		*(unsigned short *)p = cpu_to_le16(inw(port));
 		p += 2;
 		count--;
 		while (count>=2) {
-			
+
 			count -= 2;
 			l = cpu_to_le16(inw(port)) << 16;
 			l |= cpu_to_le16(inw(port));
@@ -159,13 +159,13 @@ void insw (unsigned long port, void *dst, unsigned long count)
 			*(unsigned short *)p = cpu_to_le16(inw(port));
 		}
 		break;
-		
+
 	 case 0x01:			/* Buffer 8-bit aligned */
 	 case 0x03:
 		/* I don't bother with 32bit transfers
 		 * in this case, 16bit will have to do -- DE */
 		--count;
-		
+
 		l = cpu_to_le16(inw(port));
 		*p = l >> 8;
 		p++;
@@ -195,10 +195,10 @@ void insl (unsigned long port, void *dst, unsigned long count)
 	unsigned char *p;
 
 	p = (unsigned char *)dst;
-	
+
 	if (!count)
 		return;
-	
+
 	switch (((unsigned long) dst) & 0x3)
 	{
 	 case 0x00:			/* Buffer 32-bit aligned */
@@ -208,14 +208,14 @@ void insl (unsigned long port, void *dst, unsigned long count)
 			p += 4;
 		}
 		break;
-	
+
 	 case 0x02:			/* Buffer 16-bit aligned */
 		--count;
-		
+
 		l = cpu_to_le32(inl(port));
 		*(unsigned short *)p = l >> 16;
 		p += 2;
-		
+
 		while (count--)
 		{
 			l2 = cpu_to_le32(inl(port));
@@ -227,7 +227,7 @@ void insl (unsigned long port, void *dst, unsigned long count)
 		break;
 	 case 0x01:			/* Buffer 8-bit aligned */
 		--count;
-		
+
 		l = cpu_to_le32(inl(port));
 		*(unsigned char *)p = l >> 24;
 		p++;
@@ -244,7 +244,7 @@ void insl (unsigned long port, void *dst, unsigned long count)
 		break;
 	 case 0x03:			/* Buffer 8-bit aligned */
 		--count;
-		
+
 		l = cpu_to_le32(inl(port));
 		*p = l >> 24;
 		p++;
@@ -293,10 +293,10 @@ void outsw (unsigned long port, const void *src, unsigned long count)
 	const unsigned char *p;
 
 	p = (const unsigned char *)src;
-	
+
 	if (!count)
 		return;
-	
+
 	switch (((unsigned long)p) & 0x3)
 	{
 	 case 0x00:			/* Buffer 32-bit aligned */
@@ -311,13 +311,13 @@ void outsw (unsigned long port, const void *src, unsigned long count)
 			outw(le16_to_cpu(*(unsigned short*)p), port);
 		}
 		break;
-	
+
 	 case 0x02:			/* Buffer 16-bit aligned */
-		
+
 		outw(le16_to_cpu(*(unsigned short*)p), port);
 		p += 2;
 		count--;
-		
+
 		while (count>=2) {
 			count -= 2;
 			l = *(unsigned int *)p;
@@ -329,11 +329,11 @@ void outsw (unsigned long port, const void *src, unsigned long count)
 			outw(le16_to_cpu(*(unsigned short *)p), port);
 		}
 		break;
-		
-	 case 0x01:			/* Buffer 8-bit aligned */	
+
+	 case 0x01:			/* Buffer 8-bit aligned */
 		/* I don't bother with 32bit transfers
 		 * in this case, 16bit will have to do -- DE */
-		
+
 		l  = *p << 8;
 		p++;
 		count--;
@@ -348,7 +348,7 @@ void outsw (unsigned long port, const void *src, unsigned long count)
 		l2 = *(unsigned char *)p;
 		outw (le16_to_cpu(l | l2>>8), port);
 		break;
-	
+
 	}
 }
 
@@ -365,10 +365,10 @@ void outsl (unsigned long port, const void *src, unsigned long count)
 	const unsigned char *p;
 
 	p = (const unsigned char *)src;
-	
+
 	if (!count)
 		return;
-	
+
 	switch (((unsigned long)p) & 0x3)
 	{
 	 case 0x00:			/* Buffer 32-bit aligned */
@@ -378,13 +378,13 @@ void outsl (unsigned long port, const void *src, unsigned long count)
 			p += 4;
 		}
 		break;
-	
+
 	 case 0x02:			/* Buffer 16-bit aligned */
 		--count;
-		
+
 		l = *(unsigned short *)p;
 		p += 2;
-		
+
 		while (count--)
 		{
 			l2 = *(unsigned int *)p;
@@ -415,7 +415,7 @@ void outsl (unsigned long port, const void *src, unsigned long count)
 		break;
 	 case 0x03:			/* Buffer 8-bit aligned */
 		--count;
-		
+
 		l = *p << 24;
 		p++;
 
-- 
2.34.1

