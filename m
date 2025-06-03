Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA7670838
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748957477; cv=pass; b=mnoAAzyVUBOvQ1gn5U3XBNmVi7kWJaxnXF/sU2LOaGPOxzhHp9fz2EzvK0zyg9bV6kQyPKrdVp1bl5bkAR34a4oW25ewtIDKI31erqJcEAcTifq5/saFKsKjOjl/iZoz8QHV+CFPFPJPgNfHPRkpUGi0VQfkeunoQBYiLjdPq9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748957477; c=relaxed/simple;
	bh=iF6svWQxjhfH01K5GB6VJBFDspeZkf1NcAWZPZoRlP8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Sgg2xEBi97OeRyitJ6qkvP5Bb9zgh+JYsYzH8SHpTBPc3SEWZF4OG6lXApXFrC/ePin7EKDybd+SONXKTkjCiY0rCvkxIDgbvkHGm8/fzPmpdgQvTP7nJ5y0mXnms9m4E7xs1yEZuALG2Ii8zb8GpBtIOEuR4cohYVS3X59dU8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=outer-limits.org; spf=none smtp.mailfrom=outer-limits.org; dkim=pass (2048-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b=V8Fe0Bmd; dkim=permerror (0-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b=OpDMs9XV; arc=pass smtp.client-ip=85.215.255.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b="V8Fe0Bmd";
	dkim=permerror (0-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b="OpDMs9XV"
ARC-Seal: i=1; a=rsa-sha256; t=1748957467; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bjgA62sg1pE3q1W/YRfS4bLiAVVwsrJ0NVxQ5eIaVtZQ34cVVTIUNomkiLjyrTLjgg
    x4pfX/XpmXPTrk4DU4dP7v/IX33NTPfPV1kHD5WoAGYpiO/xy1aF5Br8YRTuCkRd4xxR
    qbJ79WeOnXFDNxRWTmbUStwdkV3zf+L9deWDqYIJM0Q5A+qUyBwnF33ZvXu7iTztv5W+
    Ardx1/SWgZtshkNavWRooQIzXDeqFiVm8hR+WS/FUMu8Tk7W+lSyNVywF1fHhjNT029v
    U+bBZCD92MR+u1Srv3vEhTDqUDQqIeQfNrggGZISzAdHwPH3XfzMHSJdzEkVeZ+z9x7L
    9TIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1748957467;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=EVp3iPa/GUn3mF6v3cUjP293u2lfu/v36mq2O4KGlBE=;
    b=faaS3xxwQPrHhPAqZb3oxtJ+5E8p5ravUhc3DKR4kebp7cujAPjhkroVfV2/pNtv8U
    t/N6JYDpneH18pp8+2JKItJY/OfcjCxLDMuMby6tFRI32a6r8mQOckqYDoJnUayCow2Q
    ujQKcjebCas3mP5c6mitE6l3rjJhW3Rv1C06KLWo6NkMu71LA7G2PfU4z9kurbs0ri1u
    TbuPZc+7Mp84dUGERObPFxlHVv5dtV2ltcsxcPoBhn1BAmUyQ0bdC91GsJIrFJvDcHRR
    s5q7BD2/8FmJkWI3eyD9v1OqrabnjyWA4S6ychAAfLbcTx47o6Ge/I1rg3fLm6ZLvFhA
    wl9w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1748957467;
    s=strato-dkim-0002; d=outer-limits.org;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=EVp3iPa/GUn3mF6v3cUjP293u2lfu/v36mq2O4KGlBE=;
    b=V8Fe0BmdWA51e+UyodvNT6FwYMAxtM23mJCmHKAXEG5SzkEZ6OmMjW4YibzPWl+yan
    OdqRzg20LLWFt/71G9grOJKopDRi+4zLpmhb2ttPcoN0MmimNGjR3bDsToesYGJdzKIK
    9L6GFMxrdwucZRNIuXqvU9sRTGf/r+tkogJNpg6RTBqU8wNwxr9bbCciE9CICtQqFfA7
    gwcPuK+WHOjH9q/Gcacd22hbHR22+gFbxUfVS3mVjvDDUnBiIesWRa9RAQCv7PI7MX85
    qRNUKCEnuFk7SY6CrgFvBjjdH8gse+qd8GLS9qLYrUDQ0fepqvYcbQPciErb4ASP8nfL
    zsuw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1748957467;
    s=strato-dkim-0003; d=outer-limits.org;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=EVp3iPa/GUn3mF6v3cUjP293u2lfu/v36mq2O4KGlBE=;
    b=OpDMs9XVzaKdbfOodfsm/pwUm1NxOLVAFn70MhdVePHgbD+xMzA1zOvTlRS/+FBxqq
    xQoichMg0uU6hRrzG3AQ==
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBEHcVJSv9P5mRTGd2ImeA=="
Received: from ws2104.lan.kalrayinc.com
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id J2b110153DV6wVo
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 3 Jun 2025 15:31:06 +0200 (CEST)
From: Julian Vetter <julian@outer-limits.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org,
	Julian Vetter <julian@outer-limits.org>
Subject: [PATCH] tools: Replace __get_unaligned_cpu32 in jhash function
Date: Tue,  3 Jun 2025 15:31:01 +0200
Message-Id: <20250603133101.3681314-1-julian@outer-limits.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

The __get_unaligned_cpu32 function is deprecated. So, replace it with
the more generic get_unaligned and just cast the input parameter.

Signed-off-by: Julian Vetter <julian@outer-limits.org>
---
 tools/include/linux/jhash.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/include/linux/jhash.h b/tools/include/linux/jhash.h
index af8d0fe1c6ce..5ff3c8275281 100644
--- a/tools/include/linux/jhash.h
+++ b/tools/include/linux/jhash.h
@@ -24,7 +24,7 @@
  * Jozsef
  */
 #include <linux/bitops.h>
-#include <linux/unaligned/packed_struct.h>
+#include <linux/unaligned.h>
 
 /* Best hash sizes are of power of two */
 #define jhash_size(n)   ((u32)1<<(n))
@@ -77,9 +77,9 @@ static inline u32 jhash(const void *key, u32 length, u32 initval)
 
 	/* All but the last block: affect some 32 bits of (a,b,c) */
 	while (length > 12) {
-		a += __get_unaligned_cpu32(k);
-		b += __get_unaligned_cpu32(k + 4);
-		c += __get_unaligned_cpu32(k + 8);
+		a += get_unaligned((u32 *)k);
+		b += get_unaligned((u32 *)(k + 4));
+		c += get_unaligned((u32 *)(k + 8));
 		__jhash_mix(a, b, c);
 		length -= 12;
 		k += 12;
-- 
2.34.1

