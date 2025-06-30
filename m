Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F08B21C9E8
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 20:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751315085; cv=none; b=dStRrqIYUXXOJx3G6t4N6gsSpLE7eIcYDXF5ISZ0ILYNIKKVqFteXqtMqtYqigidQj4CxvxEpU3eCCje8pmEFoJGF4u0Dw6EaIus+CKowV5ix8LIQIy9zCd5y7mg1LOHBjyjWFxsU0Wv+3V7gTPkgOTviu8LpteBE13GNbn6TIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751315085; c=relaxed/simple;
	bh=S0bUs9D5694r3f3J+oTwzNKVv0ZvGHE5FIpAHrzqCd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QybbSWKwEOOKZebKrlXJnIPK+TNz3M1InJVbGOSHlkzB7wmei8KFu3tInJTVk9XEYQBUEncg0lxOKbQQ3cSE+9uVHFCrqt3PFDQmhDJU1Jgbg5P9UHmLr2DA8D1IJ2f/oe87711yrf3/kxO+5avNb64GO96iORAMXmyZoit523o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=VMVg38Bf; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="VMVg38Bf"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bWHh76cYnz9t4g;
	Mon, 30 Jun 2025 22:24:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1751315079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9aNWIkFKlz0wQ/xb6g384kEt9XRMd+Ti35aGh/DVNhM=;
	b=VMVg38BfLC75McjQiJSJhc1+85fNQeQ4Tj/uabjqhYcGdfua4mXyE8P0QTbavI8FAcUBOw
	1y6v0MSkq3CUkcHi0qEweRThSPwqBjzF0XD7cCF088jbhlj6t1dfm+w6aOEKrAwC2HbGQ/
	5+9ozmZG0ioFW420EGtwH0t2BeemTwKCiLeesqnF0gafi3eo8cyZxjKbSfzPDajN3l1xJp
	937g5CW9CbHZnPLrg//K1A45JJ0eBWjKhppGvnANXPVUdoVj7k0tih4Qc+5QYhme3c+3XB
	613fGrKoTUeFxXqrg7AmKzOUArQd4sMtQzvr23aud6EiN7MBOFSzJcgmBaEmPw==
From: Brahmajit Das <listout@listout.xyz>
To: linux-kernel@vger.kernel.org
Cc: kees@kernel.org,
	gnoack3000@gmail.com,
	mic@digikod.net
Subject: [RFC PATCH] samples/check-exec: Fix building on musl libc
Date: Tue,  1 Jul 2025 01:53:53 +0530
Message-ID: <20250630202353.28439-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4bWHh76cYnz9t4g

Building with make allyesconfig on musl results in the following

In file included from samples/check-exec/inc.c:23:
/usr/include/sys/prctl.h:88:8: error: redefinition of 'struct prctl_mm_map'
   88 | struct prctl_mm_map {
      |        ^~~~~~~~~~~~
In file included from samples/check-exec/inc.c:17:
usr/include/linux/prctl.h:134:8: note: originally defined here
  134 | struct prctl_mm_map {
      |        ^~~~~~~~~~~~

This is mainly due to differnece in the sys/prctl.h between glibC and
musl. The struct prctl_mm_map is defined in sys/prctl.h in musl.

Signed-off-by: Brahmajit Das <listout@listout.xyz>
---
 samples/check-exec/inc.c      | 2 ++
 samples/check-exec/set-exec.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/samples/check-exec/inc.c b/samples/check-exec/inc.c
index 7f6ef06a2f06..775ae8613782 100644
--- a/samples/check-exec/inc.c
+++ b/samples/check-exec/inc.c
@@ -14,7 +14,9 @@
 #define _GNU_SOURCE
 #include <errno.h>
 #include <linux/fcntl.h>
+#if defined(__GLIBC__)
 #include <linux/prctl.h>
+#endif
 #include <linux/securebits.h>
 #include <stdbool.h>
 #include <stdio.h>
diff --git a/samples/check-exec/set-exec.c b/samples/check-exec/set-exec.c
index ba86a60a20dd..a75b8c6e6b11 100644
--- a/samples/check-exec/set-exec.c
+++ b/samples/check-exec/set-exec.c
@@ -9,7 +9,9 @@
 #define _GNU_SOURCE
 #define __SANE_USERSPACE_TYPES__
 #include <errno.h>
+#if defined(__GLIBC__)
 #include <linux/prctl.h>
+#endif
 #include <linux/securebits.h>
 #include <stdbool.h>
 #include <stdio.h>
-- 
2.50.0

