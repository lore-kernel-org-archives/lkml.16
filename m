Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A709D22FE02
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.216
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748956899; cv=pass; b=hCRcjP/o9up3RkDExKMCS4SrqcRrS0mD1yyamaLQct5Z0oLuF6vqKcr0UGb372ayTOlchUf9MlN5FAhQZN3odcmAqbrZDgiAukhnwFiClqwyrrYWC10cb1w/+x3eNCGwD16j9u52gYW7JQCf9Bs7k0e8ZstDmjnvuY+x7fYS15g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748956899; c=relaxed/simple;
	bh=3686iIqcrD1v0rIwnE5BDEhqKpyTR1lXHiLv92Viv20=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=QL2FrpR+ujjBkfkvX5p1MILgumTDxsK28TDAQiZT/3h/SR8HEN1BAN4+8yXWV51+80bpcTbMQyRAsfnm45ipeJWQAS1wMCJW9ZhZRsMb6jARMgoF35np/kDaHMbh6FpfFnuU1oPabl19PQ2xfopW5u7rGuNNqaXRb5p2lZyuqkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=outer-limits.org; spf=none smtp.mailfrom=outer-limits.org; dkim=pass (2048-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b=Fi1RKISd; dkim=permerror (0-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b=BkwicBqF; arc=pass smtp.client-ip=81.169.146.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b="Fi1RKISd";
	dkim=permerror (0-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b="BkwicBqF"
ARC-Seal: i=1; a=rsa-sha256; t=1748956894; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=BBByrgHiqQockSFqGHFjQ0HjVGMsx0uDeImcsY4M+hbSDL/t22NRaLpCSewa3CeZWP
    lsGWz9xWhL7AMSbGJtvjAqt+GldOvIcxGK4wzdoeHvNDoz74jAi1p1vaE3NuakaPM0Q0
    fkPxL9R97E5q1z9s7erxVzvFpaFUwVR6AEVewYm+wIv5/QLEbaXErNuzI+H7t5Q78LdU
    ieHhpuajT4ITrwD7lQ/PEt3dKsj5Ye/2F47itIvZjMfUzFOmieceGsIOM6DrN8nDIOsm
    J3r3PMzAb6LMMIQRpYjIUjyXnro/wNDnzM2ig396qsyCj9UCWLOPtyMbUAAr2mkTosYM
    5CfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1748956894;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Uw2joeTt8PfL+vQ6RmT2S3am/XAVy6q4yrugxQwId/U=;
    b=hvqWCxMyG5QLMgfydDNg0wYw2dbjQoiUuW5O4Sp5fzzGda2bW5CRCwruNGlQq04fae
    TyPh+M6MjEaI90Cv6QRBApCeSqlnafb8R+krX+rl3h36qaEMP4al52OnUp650o8T/6zj
    lmKagKfvmHo+3hQWfwEXUnY+V7OS8MolzdyFrAWtxC4Ik+VdlkRJ+NogWgO9UeCVhGF3
    m2theL3o+dM1YV5Nv8L+N620AjZPX8a0W9llSzjpHpxcsHjswdW44KpubEiljZeV5MN9
    wZ2Gusp8blgTRQPNpDjuxsSzMZ8Gmo4zlck6LKYDt4C2NNUZ1ODptW3ESsIh+5fx4r2N
    ey+g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1748956894;
    s=strato-dkim-0002; d=outer-limits.org;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Uw2joeTt8PfL+vQ6RmT2S3am/XAVy6q4yrugxQwId/U=;
    b=Fi1RKISdLQz4WvUmInHJ/4uxPB6yn7mPvDf2pKBOUYJsleaVUFArDHdU7W+JGLueLJ
    ufLFgF8C5uIbANcOJlnvNNC1uCSjASqinh+np9nPmbhcTp5iRQLDQDaJ56dP4Y+MSw84
    HHXEBEarP6QSkvTYG6XFCIP2NRIqN5lEtcHiVECwUSUupsTHh/pT/wElfYjOM+zkOIbb
    EAxHs1uGtqn8Ew4kUuyObZP0XRFsYNzPifzs5sCbNs1l0LBdyjb1Y51JsVzCMW37DYrJ
    p51yYvq9a++N8PaQrU8kyFJSGC7NLBNZXgV4YsnNXXNFRjLqAJzxYdp/6Lgo1hDRx6Jj
    fJuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1748956894;
    s=strato-dkim-0003; d=outer-limits.org;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Uw2joeTt8PfL+vQ6RmT2S3am/XAVy6q4yrugxQwId/U=;
    b=BkwicBqFn1mCKK5xtlY38hETY+wi5Z2I7AW5vNUQGwjGl1CDqlePZayA349HofQ9k+
    YJzU11ItgzCg6P7fgPBw==
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBEHcVJSv9P5mRTGd2ImeA=="
Received: from ws2104.lan.kalrayinc.com
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id J2b110153DLXwOm
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 3 Jun 2025 15:21:33 +0200 (CEST)
From: Julian Vetter <julian@outer-limits.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Wei-Hsin Yeh <weihsinyeh168@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Julian Vetter <julian@outer-limits.org>
Subject: [PATCH] Replace __get_unaligned_cpu32 in jhash function
Date: Tue,  3 Jun 2025 15:21:21 +0200
Message-Id: <20250603132121.3674066-1-julian@outer-limits.org>
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
 include/linux/jhash.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/jhash.h b/include/linux/jhash.h
index fa26a2dd3b52..7c1c1821c694 100644
--- a/include/linux/jhash.h
+++ b/include/linux/jhash.h
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

