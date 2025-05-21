Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F2F26656E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747829939; cv=none; b=Onq/dq2I8YpEKDTFO7mFGov3EnE/HicNgBHNCLg9uSTFQ3lVZNub6bWQm0alemq5K2tbYq53xfC8aRBFXKIm8iVJVeyYEMq3kUXk5/X8hNB9cDPkLaTSr2Lsl5aDtIuhVN9BWFzVHhgMixryub5HPyQXeMvQl9H39iJ0pxRiuKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747829939; c=relaxed/simple;
	bh=GJOCKEBqfLwLVpFVU31IVw6t/1AMPyXJY0+Ek0compU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AZ6rOn6B55U/10fxGTDTA1yaRqXUVzmimNWnBIT9JcRRLlG3J0iqm4BN8RYk6OdY4HIlDJZtPvHXXlkle/NukNoiMiF31/OLWxeOyf9E34VenC721v/KVkudErkX6flr1L4HL9Z9+o2T+99p0ZdP+Wo89YjfO21NhrDm0JKe7oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bOGFswFg; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bOGFswFg"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747829935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4XL5pJOh/9ll0slyvRoPnI8ABv5lEvlpTrdfp8DXcC8=;
	b=bOGFswFga7MpW4z9w9jAbBEo99pla8ZTmPxsecQROOh9kGtcs66L0gotr8nUUAvf1YtlnW
	VzB4lv7NeniucGbBqKzQoYuAOsk2nHQ7BejjswQac/goDRUW3b21ny6/J1t7j6rmEtRKt2
	Serpki/lsFZEE+qNpL9JX2uNFxkPS+w=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Guo Weikang <guoweikang.kernel@gmail.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-hardening@vger.kernel.org,
	Thorsten Blum <thorsten.blum@linux.dev>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] alpha: Replace sprintf()/strcpy() with scnprintf()/strscpy()
Date: Wed, 21 May 2025 14:18:38 +0200
Message-ID: <20250521121840.5653-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace sprintf() with the safer variant scnprintf() and use its return
value instead of calculating the string length again using strlen().

Use strscpy() instead of the deprecated strcpy().

No functional changes intended.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/alpha/kernel/core_marvel.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index b1bfbd11980d..d38f4d6759e4 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -17,6 +17,7 @@
 #include <linux/vmalloc.h>
 #include <linux/mc146818rtc.h>
 #include <linux/rtc.h>
+#include <linux/string.h>
 #include <linux/module.h>
 #include <linux/memblock.h>
 
@@ -79,10 +80,12 @@ mk_resource_name(int pe, int port, char *str)
 {
 	char tmp[80];
 	char *name;
-	
-	sprintf(tmp, "PCI %s PE %d PORT %d", str, pe, port);
-	name = memblock_alloc_or_panic(strlen(tmp) + 1, SMP_CACHE_BYTES);
-	strcpy(name, tmp);
+	size_t sz;
+
+	sz = scnprintf(tmp, sizeof(tmp), "PCI %s PE %d PORT %d", str, pe, port);
+	sz += 1; /* NUL terminator */
+	name = memblock_alloc_or_panic(sz, SMP_CACHE_BYTES);
+	strscpy(name, tmp, sz);
 
 	return name;
 }
-- 
2.49.0

