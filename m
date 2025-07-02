Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0481828688C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464815; cv=none; b=LMzc1wI544W5bR70nc55ACiXO7Ham6NqyJNXa7eP2EVvNSN2PmelhzIB+b2R7fWMOswYxpvSI4UjusSi72cH7sf/dls/A8aHHcTQtVY8lsCNEdNYeO/s0MrtXMLYoI/FRlfyx7ffJAg8YN2veDs3Gn8dO8YuJsjGCS60AbjmLOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464815; c=relaxed/simple;
	bh=8BkaOVft+W2bYAK2FXK/p+ptB3nhhLtqcS7ezMLmfIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=izahAsxlT+MTkQV7wCYp5ng/X2TVWA6lw/F1dgS5SswX/VK5M11NPNZMfwY3w2WNOwK4s2sh8RjMCQfVWz+w5Vv3HyFGOJlFnb0AOjkjbsRH2/06F5tVoZ3AlLk7McHHNs9h7Ik6y0jie65lIR/3Aer/DBGMuzfFTOiNLSxyovY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=y2GkHQz2; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="y2GkHQz2"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bXM3Y1Qtdz9tdp;
	Wed,  2 Jul 2025 16:00:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1751464809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RT/fvfvkATMUMVde7NV2a6COYwtEX90/2hkOIdHqpjE=;
	b=y2GkHQz2UQEHOFp2GM9wtjhZcPgazeBmjcMYg9bLJvm2P365bMuBdX4ScmMm3uTLlaX0YQ
	zFgwBWbg4G/u/ZnUGLhhUih1G0MVKHftnZIKzfGpIJB0YdUBW6FjULE8eP/b8j7vboSgfI
	Qqb4gzzZnBfawzHDshQMzGcIpb3VHVNlsuUpMyXh4WzFL76OWBBfiDKjzXVEyluSbUbjWH
	lO8CDAEw5yukzAlrkuWkZcJ8UiqEm4OHsJ2Ieo2S/wGrRjqeKPfvC7AZ2J32zNfqI4XbBh
	In7zofENoKK73Pq5YkTxyUwsTZf7dgxXuTZVExjwORwnkHnR0Ocb1cMQPoEung==
From: Brahmajit Das <listout@listout.xyz>
To: linux-kernel@vger.kernel.org
Cc: alexander.usyskin@intel.com,
	tomas.winkler@intel.com,
	gregkh@linuxfoundation.org
Subject: [PATCH v2] samples: mei: Fix building on musl libc
Date: Wed,  2 Jul 2025 19:29:55 +0530
Message-ID: <20250702135955.24955-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4bXM3Y1Qtdz9tdp

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

Fixes: c52827cc4ddf ("staging/mei: add mei user space example")
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

