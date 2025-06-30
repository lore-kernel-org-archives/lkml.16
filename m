Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4B0258CD0
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279427; cv=none; b=Za0Prp/lLkk2DCOm+rn300wI+XS1vwpbQly7ujdN8WCA4nK/ZI5n+44N3YFtl/xPnyuyGyUgPOIcf01juSmpRZcQGRq0ubzExuabYOhlzdudcNBje2GUeKiGj36svOVyp/qrsKZ988BRPHsHxoYnzFyawqXwo0pC7PAHlH1B0tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279427; c=relaxed/simple;
	bh=lpKkakJCyHNDziD7laY1BPP8T8GfpG2fhvlOiEPGIn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FzdfV9DmduLacd9JF6kvM240BrFCTenvOaGjodLfGQ3rB3K1YhqrNYOQpuHOAXbyu8mmLptnVTy31hBh8Gq4W8j20QACr4CesQ0nP7HulQkwzGmveV1h1uXBJHPb4niUpDKV/HrjoXpsPP1aMMb+h0u8lQKB05mPusbQOErOhfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=gOc+QB5N; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="gOc+QB5N"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bW2VP65bfz9srG;
	Mon, 30 Jun 2025 12:30:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1751279421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P1YWpKOF3vYfj3PmhCsTImm+Uuv9FkxaiKd+e3qrF3I=;
	b=gOc+QB5NRAL4jboBsseFew9p8SqxkUm/bG9y6Rzt8zLTkiTvKBjcHNKwFB3wMakt1ie1vL
	cT3rxjoZ2fD4VbRLdhLXcBfUJiCDwW360948SREWiJFYLK133Hl3of241kwlP+Woc34Rsp
	8v7gmQpZTO1s+CRT73i/htw9XO8ndn0owSzgsg1zuUns+bTC16Ioe2QB1yevZe3rhAbBGc
	SfWOtMrp7rR9KY0BbH76aKKgNdd2OCh3aDXCu5s0TZ+9YwKgKlVKDWKwi97v+mmweXrj1L
	KEuqrEQhh3b2kqzZTRvShIsHNqwr8uA8ukd1fAtj7kkLJIRvPXcEnJpYwZUrSw==
From: Brahmajit Das <listout@listout.xyz>
To: linux-kernel@vger.kernel.org
Cc: krisman@suse.de,
	jack@suse.cz
Subject: [RFC PATCH] samples: fix building fs-monitor on musl systems.
Date: Mon, 30 Jun 2025 16:00:11 +0530
Message-ID: <20250630103011.27484-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4bW2VP65bfz9srG

On musl systems with make allyesconfig fs-monitor.c fails to build with

samples/fanotify/fs-monitor.c:22:9: error: unknown type name '__s32'
   22 |         __s32 error;
      |         ^~~~~
samples/fanotify/fs-monitor.c:23:9: error: unknown type name '__u32'
   23 |         __u32 error_count;
      |         ^~~~~
samples/fanotify/fs-monitor.c: In function 'handle_notifications':
samples/fanotify/fs-monitor.c:98:50: error: 'fsid_t' has no member named 'val'; did you mean '__val'?
   98 |                                        fid->fsid.val[0], fid->fsid.val[1]);
      |                                                  ^~~
      |                                                  __val
samples/fanotify/fs-monitor.c:98:68: error: 'fsid_t' has no member named 'val'; did you mean '__val'?
   98 |                                        fid->fsid.val[0], fid->fsid.val[1]);
      |                                                                    ^~~
      |                                                                    __val

This is due to sys/fanotify.h on musl does not include
linux/fanotify.h[0] unlike glibc which includes it. This also results in
fsid not being of type __kernel_fsid_t, rather the libc's definition of
it which does not have val, but instead __val.

[0]: https://git.musl-libc.org/cgit/musl/tree/include/sys/fanotify.h
Signed-off-by: Brahmajit Das <listout@listout.xyz>
---
 samples/fanotify/fs-monitor.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/samples/fanotify/fs-monitor.c b/samples/fanotify/fs-monitor.c
index 608db24c471e..28c0a652ffeb 100644
--- a/samples/fanotify/fs-monitor.c
+++ b/samples/fanotify/fs-monitor.c
@@ -12,6 +12,9 @@
 #include <sys/fanotify.h>
 #include <sys/types.h>
 #include <unistd.h>
+#ifndef __GLIBC__
+#include <asm-generic/int-ll64.h>
+#endif
 
 #ifndef FAN_FS_ERROR
 #define FAN_FS_ERROR		0x00008000
@@ -95,7 +98,11 @@ static void handle_notifications(char *buffer, int len)
 				fid = (struct fanotify_event_info_fid *) info;
 
 				printf("\tfsid: %x%x\n",
+#if defined(__GLIBC__)
 				       fid->fsid.val[0], fid->fsid.val[1]);
+#else
+				       fid->fsid.__val[0], fid->fsid.__val[1]);
+#endif
 				print_fh((struct file_handle *) &fid->handle);
 				break;
 
-- 
2.50.0

