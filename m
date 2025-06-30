Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5711026ADD
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288686; cv=none; b=V8N0d5BcjiFxAErdv4wYdDICWhV1MKgaphGABXQbYcirc4dSDKBKvkJbSK18+iLMdFvw8r3IwaXkuwU5jZQl+Qb5cmsyeLjyvEShsHeh8RtOp7tvTRDBCPN1LOTnSvD38hjw4XN0Osuc3jEa0V7pU76FAz+ciyNLuc1zAkq8ckQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288686; c=relaxed/simple;
	bh=E9BcmReFTteZ0kVf6bHV2/8RRI+kRg6XgrN/+LxgbEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Wt/d7QUNRPaHBanfNFa5WKJvUnPFjKs6fz4CysfzjqETYJ5LebqOQMZ/i01b/hgA9fyMEFQyVJ5bSpyEHO4iji6j+2TasUvqHF/91TL28my/58Rdwpe4TE4KKDkIyQsmRBvTbC9YxFBt+SgZvWk/ssOJ84ELLwG3sI211NDB1OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=i2IpwXFU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xDelbUwl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="i2IpwXFU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xDelbUwl"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751288683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mKD4LqOb/OFKeriTEqhtRMZOhRcpx++y1FjlbRonJ+o=;
	b=i2IpwXFUe6RnuxYQLNhPDq258343n9fW/QdCH/ftSf66HyChBvr4hmi4/n8BYrhAvDjLaG
	SYDcp8lsYfyCGSIQzpxRVuBkWh4+Xl5rAfNGjcpS4S0X7ihtsKMW9wHUNOi41UFo54fWH+
	5d9gceZp+EeAKFLjk7UC/ykKZ/LQpkBqHpWhG6UqohFMLUlj5CPCeI1m8xpU3oWrcE/Tjc
	OEPqQqRvknhXQxRwm2HPFFBPhFmO+fH2PxZbPdGitRZ2+H+TPDBpF/vlzGywr49LFOCFVG
	vaNdlkXOW14krkk9Ufeu0oJAdapWcklfCRviTCmueRYNMiuBFc7YVJYfcWUZ8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751288683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mKD4LqOb/OFKeriTEqhtRMZOhRcpx++y1FjlbRonJ+o=;
	b=xDelbUwl5N/42gYTMCjUGkW+zcKGBJRubrigZJzSeTeLw5QVx7npJuq3pEC2T0/0nidSMq
	HbdURRfHxsL6ZICQ==
Date: Mon, 30 Jun 2025 15:02:18 +0200
Subject: [PATCH] uapi: bitops: use UAPI-safe variant of BITS_PER_LONG again
 (2)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250630-uapi-genmask-v1-1-eb0ad956a83e@linutronix.de>
X-B4-Tracking: v=1; b=H4sIANmKYmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM2MD3dLEgkzd9NS83MTibN0UY7NU47S0ZFMzS0MloJaCotS0zAqwcdG
 xtbUA7j6URl4AAAA=
X-Change-ID: 20250630-uapi-genmask-d36e3ffc5691
To: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751288679; l=2794;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=E9BcmReFTteZ0kVf6bHV2/8RRI+kRg6XgrN/+LxgbEs=;
 b=mguinIN0D8T4i+cqTXY82MrjMmoQ8lmX+N309NupRZOMVz/pFQ13PdGuVp9FdZ2O0ZcqI1+Jt
 woj6s+lH7DaAylhX9iAuZhZPL07+V4sJHcUaTai9Mi8O8Xx4HU9y4O6
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

BITS_PER_LONG does not exist in UAPI headers, so can't be used by the UAPI
__GENMASK(). Instead __BITS_PER_LONG needs to be used.

When __GENMASK() was introduced in commit 3c7a8e190bc5 ("uapi: introduce uapi-friendly macros for GENMASK"),
the code was fine. A broken revert in 1e7933a575ed ("uapi: Revert "bitops: avoid integer overflow in GENMASK(_ULL)"")
introduced the incorrect usage of BITS_PER_LONG.
That was fixed in commit 11fcf368506d ("uapi: bitops: use UAPI-safe variant of BITS_PER_LONG again").
But a broken sync of the kernel headers with the tools/ headers in
commit fc92099902fb ("tools headers: Synchronize linux/bits.h with the kernel sources")
undid the fix.

Reapply the fix and while at it also fix the tools header.

Fixes: fc92099902fb ("tools headers: Synchronize linux/bits.h with the kernel sources")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/uapi/linux/bits.h       | 4 ++--
 tools/include/uapi/linux/bits.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/bits.h b/include/uapi/linux/bits.h
index 682b406e10679dc8baa188830ab0811e7e3e13e3..a04afef9efca42f062e142fcb33f5d267512b1e5 100644
--- a/include/uapi/linux/bits.h
+++ b/include/uapi/linux/bits.h
@@ -4,9 +4,9 @@
 #ifndef _UAPI_LINUX_BITS_H
 #define _UAPI_LINUX_BITS_H
 
-#define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
+#define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
 
-#define __GENMASK_ULL(h, l) (((~_ULL(0)) << (l)) & (~_ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
+#define __GENMASK_ULL(h, l) (((~_ULL(0)) << (l)) & (~_ULL(0) >> (__BITS_PER_LONG_LONG - 1 - (h))))
 
 #define __GENMASK_U128(h, l) \
 	((_BIT128((h)) << 1) - (_BIT128(l)))
diff --git a/tools/include/uapi/linux/bits.h b/tools/include/uapi/linux/bits.h
index 682b406e10679dc8baa188830ab0811e7e3e13e3..a04afef9efca42f062e142fcb33f5d267512b1e5 100644
--- a/tools/include/uapi/linux/bits.h
+++ b/tools/include/uapi/linux/bits.h
@@ -4,9 +4,9 @@
 #ifndef _UAPI_LINUX_BITS_H
 #define _UAPI_LINUX_BITS_H
 
-#define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
+#define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
 
-#define __GENMASK_ULL(h, l) (((~_ULL(0)) << (l)) & (~_ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
+#define __GENMASK_ULL(h, l) (((~_ULL(0)) << (l)) & (~_ULL(0) >> (__BITS_PER_LONG_LONG - 1 - (h))))
 
 #define __GENMASK_U128(h, l) \
 	((_BIT128((h)) << 1) - (_BIT128(l)))

---
base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
change-id: 20250630-uapi-genmask-d36e3ffc5691

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

