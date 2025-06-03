Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE096A937
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748957079; cv=pass; b=BKLA139aZ45iG+UKH2H9Vf8hfLih1GW7Yo5okDtzKpHgjOPpb0MI68Hcnya0RmfZd2WhWSI271YpI7ObfUJs2U1QP93Tnf/Rly2MFoSws3QWWTncWg1SIepwBphtVCKBp+ApOnHpHP4ZOrroerbofUmSeq8SWX7QL6Y3FbtvPPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748957079; c=relaxed/simple;
	bh=zfPixgraChrKlrOtDN03mFy1u9SB7MFeA7PL4QVarWU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mDZRS+dMkvF1Cus7PVIFbEj8/2xv1rMN3VrVDpuABzB0YCkT31ifBiJQKHfBSmCdGsakpWemtNVP63XLnVb04Aa+FgRg9QAWVVPGnIGQTLavhpH5pMadmac5K+YTShwb8g+3k4FFQn7ejWUGEFW+wOYrEh0MSLMJizDDwfmWb5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=outer-limits.org; spf=none smtp.mailfrom=outer-limits.org; dkim=pass (2048-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b=oSJ8Iglv; dkim=permerror (0-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b=cr+VIkhp; arc=pass smtp.client-ip=81.169.146.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b="oSJ8Iglv";
	dkim=permerror (0-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b="cr+VIkhp"
ARC-Seal: i=1; a=rsa-sha256; t=1748957069; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=PLB936NySOk0FH75KUK+kYWBwqIt2VRb57zEvf15tbRbGGdYIpqFjtY3ryR1ubI/hw
    r6u+vh1/elS0YNmZ2j0hWbm6e3BVZ/lMZfo8LncYdja1h6jgePiuMV4cVaymtLFUPlQ0
    aYVmNsBvKmngLm33dSs8kPGRGpu668uZEy38qRf2PJA8S/KabxnEFPsR8LJsD5pkNfan
    CSC3WaWJhp63TRQ9cX5jp1GLcElxEUPa3+y+mRtRhKZoOTSbsbuvuvKcBmGFBdiYA5s0
    EVdQhzhUw2nmGkfAj264gKtObrKT4COQEHC0yX44LFzSx3umzceGseheA+PBr1Zp3pTo
    BlkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1748957069;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=mCZv9h5y7Ee5tNYV9yYrClTj5aivwr6YfqNK0mRGc2E=;
    b=hRfQtiNyVPpCQ1QakrlvcICaOmtkSIlJnR3lPcS8+bXsY0Oo9XL7Y3yGHfARuddO94
    f75OhTwo1GjuE4w9tSj2l923A81Kuvl8WI2jD6pa9KsLMxIIL72dhuDZA/Kxh9ysUaGw
    N/LjpEhFQVPzDD+n13nS5xSwF8ySNwoKZXmHiVxC7vwE+BMMAxLEXQsq8inZA3tD/NB7
    P6nLQ1gLjCySAqo/KyjkNPneV/86RwEHQIWE11bcATpE7p3RoEZJTNY212tqSAdZJrJf
    ioNVBhQ8mFjVcX4r5vECU5M6jgXJFMV45KKbfCe5qU4SCNS+xDppE5Yocq58vGsOVqU4
    aoMw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1748957069;
    s=strato-dkim-0002; d=outer-limits.org;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=mCZv9h5y7Ee5tNYV9yYrClTj5aivwr6YfqNK0mRGc2E=;
    b=oSJ8IglvLxsXJLYur4vmjylTbcvWVGX5aQ7iuOHEZwWR1wIbHh/stPM6b4tyFb/7om
    piL7nkH5iqdhowjLYK+sdJ5xIvhcZCOTqXIsYQno+VidaCaPF4T9vat9dctM6kO94FTg
    vgnJU5rr1nl/mUjqadm8wEvmZXvyDYpPfFtbjRX649Xr1HotIVkE1jCSlqvUciP7MBMb
    fCu9RRt2X+GsrfSjKAx0QnifTH1rApRIoWa5c/udcU4xFlWpKXTJPQyRbREfyHWqy4So
    WFIgVbJXgOjw7laPMzi6JJOXCZ5Vrc4KpxdNv0/3+2f8HQtKfIvjSbGw93Zv8WG8vwBJ
    z3VA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1748957069;
    s=strato-dkim-0003; d=outer-limits.org;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=mCZv9h5y7Ee5tNYV9yYrClTj5aivwr6YfqNK0mRGc2E=;
    b=cr+VIkhpKtEddrJYEcyqAdsj8SJ9OJqduhxxO/6f+Wi0KPWhXoAc/vg/X7m6zRtY54
    A3BQlTWdl/6y99a/ZrCA==
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBEHcVJSv9P5mRTGd2ImeA=="
Received: from ws2104.lan.kalrayinc.com
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id J2b110153DOSwQs
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 3 Jun 2025 15:24:28 +0200 (CEST)
From: Julian Vetter <julian@outer-limits.org>
To: Arnd Bergmann <arnd@arndb.de>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org,
	Julian Vetter <julian@outer-limits.org>
Subject: [PATCH] Remove unaligned/packed_struct.h header
Date: Tue,  3 Jun 2025 15:24:14 +0200
Message-Id: <20250603132414.3676142-1-julian@outer-limits.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

The functions in this header are deprecated and are not used anymore.
So, remove the header entirely.

Signed-off-by: Julian Vetter <julian@outer-limits.org>
---
 include/linux/unaligned.h               |  1 -
 include/linux/unaligned/packed_struct.h | 46 -------------------------
 2 files changed, 47 deletions(-)
 delete mode 100644 include/linux/unaligned/packed_struct.h

diff --git a/include/linux/unaligned.h b/include/linux/unaligned.h
index 4a9651017e3c..18c4b0c00e2a 100644
--- a/include/linux/unaligned.h
+++ b/include/linux/unaligned.h
@@ -6,7 +6,6 @@
  * This is the most generic implementation of unaligned accesses
  * and should work almost anywhere.
  */
-#include <linux/unaligned/packed_struct.h>
 #include <asm/byteorder.h>
 #include <vdso/unaligned.h>
 
diff --git a/include/linux/unaligned/packed_struct.h b/include/linux/unaligned/packed_struct.h
deleted file mode 100644
index f4c8eaf4d012..000000000000
--- a/include/linux/unaligned/packed_struct.h
+++ /dev/null
@@ -1,46 +0,0 @@
-#ifndef _LINUX_UNALIGNED_PACKED_STRUCT_H
-#define _LINUX_UNALIGNED_PACKED_STRUCT_H
-
-#include <linux/types.h>
-
-struct __una_u16 { u16 x; } __packed;
-struct __una_u32 { u32 x; } __packed;
-struct __una_u64 { u64 x; } __packed;
-
-static inline u16 __get_unaligned_cpu16(const void *p)
-{
-	const struct __una_u16 *ptr = (const struct __una_u16 *)p;
-	return ptr->x;
-}
-
-static inline u32 __get_unaligned_cpu32(const void *p)
-{
-	const struct __una_u32 *ptr = (const struct __una_u32 *)p;
-	return ptr->x;
-}
-
-static inline u64 __get_unaligned_cpu64(const void *p)
-{
-	const struct __una_u64 *ptr = (const struct __una_u64 *)p;
-	return ptr->x;
-}
-
-static inline void __put_unaligned_cpu16(u16 val, void *p)
-{
-	struct __una_u16 *ptr = (struct __una_u16 *)p;
-	ptr->x = val;
-}
-
-static inline void __put_unaligned_cpu32(u32 val, void *p)
-{
-	struct __una_u32 *ptr = (struct __una_u32 *)p;
-	ptr->x = val;
-}
-
-static inline void __put_unaligned_cpu64(u64 val, void *p)
-{
-	struct __una_u64 *ptr = (struct __una_u64 *)p;
-	ptr->x = val;
-}
-
-#endif /* _LINUX_UNALIGNED_PACKED_STRUCT_H */
-- 
2.34.1

