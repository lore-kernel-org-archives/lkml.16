Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315E61E2858
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279011; cv=none; b=AO9eoH/rAK1TBrA0WcJaX7pbTGTc02GGEzG5sa7diRHY5xxzApeDKz1D5sH8uPHnXlQufNkcSAF6/EQ/JYUSIZAOK2ewo+V17vNZ2nQxOlF+qv9DALDC5/yTaD07IAlj3WVWstkSmhSOeSA4dbShmkvT6q9ya9bDo/P2T1oR77c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279011; c=relaxed/simple;
	bh=lpKkakJCyHNDziD7laY1BPP8T8GfpG2fhvlOiEPGIn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ppzsebSkSX2ad1CyKfAZ6Xdh+vHfj4VkUfQNXzFlkapsRHo9jA7OCafCescqsaA9gInCFvALBSaNdLEAeX9hqTwYShfatBuuGG5eHS4RvJGLjJRsUiIHMUUjosj2POdWbIu5lZJ3BBirO2mansvio0qjf7mojtse7pE0n2NyjqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=HlY3xmGA; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="HlY3xmGA"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bW2LP1kcwz9srf;
	Mon, 30 Jun 2025 12:23:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1751279005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P1YWpKOF3vYfj3PmhCsTImm+Uuv9FkxaiKd+e3qrF3I=;
	b=HlY3xmGAP09TX8HiSokZkLx+TfJ7FQC+23omt1NL5io1Y4eCiqmWbOjCMA8l1OcNKscjeq
	P0tCTEM9Yht5gcFK+XTHopJjexDDTZxa2bBmQF4TX7tdqstR3s3rP5aSzUjHycbKUssE1l
	3BXt/1DIt1TCGb5LXoGlsR/scui2+U13hjuIuRD7wfdT5dZf8FZyYa2EsBFbO/i//+QG7Q
	HNSCAWpSIp98QKtGjCJg/l3jrxIWGTP0djJOfQceqhRiK7FeChXx2cAowBSoHtk5vKNO3o
	h7YksA/Tl1Lqfl+Kb5UW9eKNDDJ2jqq7H05CYmvarPgTjzkmUC6DDasYiq/a1A==
From: Brahmajit Das <listout@listout.xyz>
To: linux-kernel@vger.kernel.org
Cc: krisman@suse.de,
	jack@suse.cz
Subject: [PATCH] samples: fix building fs-monitor on musl systems.
Date: Mon, 30 Jun 2025 15:52:56 +0530
Message-ID: <20250630102256.14456-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

