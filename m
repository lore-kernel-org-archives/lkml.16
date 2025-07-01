Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEC3347D5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 16:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386067; cv=none; b=LIBiVNW6y5Bd6CXQE8e+haDfxkYZvIZIIxkRDMKNwVa+5ao15PVROKz1yFW0SmE1fx1Qids9KsijJEC0DbRBHeX55jDzkVeNGcaj8MtKGtxHUk8ktxhghGf/CSGLOInWrGbyc1qX6LseAiVfxGHBpHoedAYh3jk3OcwT/0vd4pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386067; c=relaxed/simple;
	bh=wMbEi1fE2uWD0kn9bunNfihB4CwaQWU5RGrW8REzTk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vwv5XEzsrSS2dst+C5eHLnl+8rFb4kBtygA/Rju24uhlxqxHFKMNFU5MEl2Hf8pnDKcaisROqESZhpbKfotz3Nq0PpvQ6gbCAs0y2SheDnsn42L/Un4wci/ghu5o0eQe8HOxo3MTrNDiW31kI581qnkzKTF2snGxx5r4OC/n3DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=hj/pJMrs; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="hj/pJMrs"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bWnx83ggHz9sml;
	Tue,  1 Jul 2025 18:07:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1751386060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p7r9KRGIXLZaQqzZmduUpusGulUROP4OkkrXhNFKDKc=;
	b=hj/pJMrsxnx+lPLmJugBD9/2Mu27Z99HcNelq/zD/uH3Y5/VzcO1zstXjrT5W58FPRm7OE
	DFYxrx4Jvgm5g0aKzdkPH3MS7uI+2Eh9oYLI2oLPlOOIzHIWIYxiFI8bsr+5NOwXZfuQkr
	95VTG9F7ecBAt6dmwZuDibuLiSIbvVt/GATl4cyMTKv3B7t0m1ac7vifD+dJJ3FLZsaLLw
	reJUuMHjCVJbzRjZyTMzgo1JHNg9gB/ezd/hfp05xAvRVU2SrKJiPd8RXOgm6WL1E7cHst
	ZxlM+liEacgUy2ekKHxFjytzbKfJAU8XebNzj6esgMYDxwuaL1KqLAiHu6bRcw==
From: Brahmajit Das <listout@listout.xyz>
To: linux-kernel@vger.kernel.org
Cc: alexander.usyskin@intel.com,
	tomas.winkler@intel.com,
	gregkh@linuxfoundation.org
Subject: [PATCH] samples: mei: Fix building on musl libc
Date: Tue,  1 Jul 2025 21:37:26 +0530
Message-ID: <20250701160726.22406-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4bWnx83ggHz9sml

The header bits/wordsize.h is glibc specific and on building on musl
with allyesconfig results in

samples/mei/mei-amt-version.c:77:10: fatal error: bits/wordsize.h: No such file or directory
   77 | #include <bits/wordsize.h>
      |          ^~~~~~~~~~~~~~~~~

mei-amt-version.c build file without bits/wordsize.h on musl and glibc.

However on musl we get the follwing error without sys/time.h

samples/mei/mei-amt-version.c: In function 'mei_recv_msg':
samples/mei/mei-amt-version.c:159:24: error: storage size of 'tv' isn't known
  159 |         struct timeval tv;
      |                        ^~
samples/mei/mei-amt-version.c:160:9: error: unknown type name 'fd_set'
  160 |         fd_set set;
      |         ^~~~~~
samples/mei/mei-amt-version.c:168:9: error: implicit declaration of function 'FD_ZERO' [-Wimplicit-function-declaration]
  168 |         FD_ZERO(&set);
      |         ^~~~~~~
samples/mei/mei-amt-version.c:169:9: error: implicit declaration of function 'FD_SET'; did you mean 'L_SET'? [-Wimplicit-function-declaration]
  169 |         FD_SET(me->fd, &set);
      |         ^~~~~~
      |         L_SET
samples/mei/mei-amt-version.c:170:14: error: implicit declaration of function 'select' [-Wimplicit-function-declaration]
  170 |         rc = select(me->fd + 1, &set, NULL, NULL, &tv);
      |              ^~~~~~
samples/mei/mei-amt-version.c:171:23: error: implicit declaration of function 'FD_ISSET' [-Wimplicit-function-declaration]
  171 |         if (rc > 0 && FD_ISSET(me->fd, &set)) {
      |                       ^~~~~~~~
samples/mei/mei-amt-version.c:159:24: warning: unused variable 'tv' [-Wunused-variable]
  159 |         struct timeval tv;
      |                        ^~

Hence the the file has been included.

Signed-off-by: Brahmajit Das <listout@listout.xyz>
---
 samples/mei/mei-amt-version.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/mei/mei-amt-version.c b/samples/mei/mei-amt-version.c
index 867debd3b912..1d7254bcb44c 100644
--- a/samples/mei/mei-amt-version.c
+++ b/samples/mei/mei-amt-version.c
@@ -69,11 +69,11 @@
 #include <string.h>
 #include <fcntl.h>
 #include <sys/ioctl.h>
+#include <sys/time.h>
 #include <unistd.h>
 #include <errno.h>
 #include <stdint.h>
 #include <stdbool.h>
-#include <bits/wordsize.h>
 #include <linux/mei.h>
 
 /*****************************************************************************
-- 
2.50.0

