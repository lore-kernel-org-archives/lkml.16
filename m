Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BB81F2BB5
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 20:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751316285; cv=none; b=Wp1xlelO6blu3Z2Dy0YfRMCtNgXXBz4GlrSuFjIZlE2XCPTqYHjAfiOjed+tMACVskpy3q1BjPpcItBSCcwqu7vqfzMd2x+15sukVfaj11vUyNGHVFFdhCbF2F090EVSTcaMqef39msUrKjRj8sC7Pt/pvmkqs+Zoi7GfP8cFjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751316285; c=relaxed/simple;
	bh=tB8dCcoYcvW3QORdKUIbp3N0vooCNmAzdCyjUMd1La0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cT9vLtIBG0LN+VXbnLTTB2KCNzEQRvlV1FyiwnFbd5LDRPZYNlRE+3hCFa0m4rkS4T3u/rAbgnuuXg6IpKuY5Es5HgPWnXFMDZf3+wtseCYA9t5SY1obVGp4LuzJm8RPodmEi15fl/n/s4PetTctu/5zvXa+9D/DNi1p91YpuEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=AhBfAOsX; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="AhBfAOsX"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bWJ7C2NQWz9sjY;
	Mon, 30 Jun 2025 22:44:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1751316279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PFb8gH8Y3vyCe8RA5B7xjigX01w+UoADNG5tF5rqI/c=;
	b=AhBfAOsX2YaPBvJ5H+65WNbaRIfIaAV8tljTwJU+zPkqjPSWzq6mMmBEIKKOTPAbmX2epg
	/GZRybtbY+J9nUUesdqGFP12zZrGpSI6CLH3rJzmfNzKHUMMhuzz7oUaBwY8NOE/KywBIA
	xOr6cs7k0o7K8OtK+Q5xmDGU4GT9j9CYJ4aULpjMeC32vQdcdpspWHVq01SaDXvXTXElDV
	rrWZ8PSRPdfUoMxxzFgJ6E//philn4wncFf66lBYqAGA/QLQOX7HcMGHF5ZqSdi804j3yX
	YJRFG3obgSj+8smZL9EhjrMfC9GpIAm6dfNPOsSj37GPojghlTF8Vq393ZuGCw==
From: Brahmajit Das <listout@listout.xyz>
To: linux-kernel@vger.kernel.org
Cc: alexander.usyskin@intel.com,
	tomas.winkler@intel.com,
	gregkh@linuxfoundation.org
Subject: [RFC PATCH] samples: mei: Fix building on musl libc
Date: Tue,  1 Jul 2025 02:14:30 +0530
Message-ID: <20250630204430.10968-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4bWJ7C2NQWz9sjY

The header bits/wordsize.h is glibc specific and on building on musl
with allyesconfig results in

samples/mei/mei-amt-version.c:77:10: fatal error: bits/wordsize.h: No such file or directory
   77 | #include <bits/wordsize.h>
      |          ^~~~~~~~~~~~~~~~~

mei-amt-version.c build file without bits/wordsize.h on musl. I'm not
sure we can remove the header completely or how it's used under glibc.

Signed-off-by: Brahmajit Das <listout@listout.xyz>
---
 samples/mei/mei-amt-version.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/samples/mei/mei-amt-version.c b/samples/mei/mei-amt-version.c
index 867debd3b912..c6850f7b883a 100644
--- a/samples/mei/mei-amt-version.c
+++ b/samples/mei/mei-amt-version.c
@@ -73,7 +73,9 @@
 #include <errno.h>
 #include <stdint.h>
 #include <stdbool.h>
+#if defined(__GLIBC__)
 #include <bits/wordsize.h>
+#endif
 #include <linux/mei.h>
 
 /*****************************************************************************
-- 
2.50.0

