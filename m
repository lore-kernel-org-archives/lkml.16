Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00711231847
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746005748; cv=none; b=nCVTneGNmkROucXw6mrPjzojrjJCdJqY3UxNpHSR0wb0doh714/avMuomNWRe+tuiX/+cgd7sJ032Hc/wpiJ3O4Hofacb0LjYD4AASqagyzfbLHvLxwD/9duF339vCQpbt0bTTNKsUH8Dge5vxo6/RtgyL1/0YjTg5fTviyKrEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746005748; c=relaxed/simple;
	bh=Hsifuij714dAEdgIZ+9nKlKj8m9fKrLfKEnFbFVJ9cI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hPoz6meC4UVADF6Y8JDEGQAEVInG6GG4eWd31IRrYc0a8CvKqESK8v1p7BV7+W61G6O4yJt4Bgn2MpaRYj7b3D6d+iP+P0+9vb9/AJFhXQ2o19jAnY30QxNJG3KZcA/k26hX77dVe07Tm9JM4RIgjM05tBrYV734ytafjnNEYHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3p5GskwU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5mq4+KD1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3p5GskwU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5mq4+KD1"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746005743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UJNip2zXDm80B7tAkghMaJlFm8y4M4Dt4sSg4eOjKbg=;
	b=3p5GskwUZJvMKuPLBgoNW/xrDZaNhDPR2n5RXR6KQKDvlk9529a5AD17qzKRAMUDX/hnmB
	Y/JK+uoIF34h2uf8dp9II6ywFl/oXixiqbZJ/+l5B+Ty3F67PxBjd9LCgBzrseXIYCpztr
	qzoajifD3B3NAahyGtY85tl+XuwFYM47d9f/ycJ82kxsGZTskeHELZMi/hGKuWNFC1eaNu
	HB4PnHz8xC6N7l2bPUhCdcAApWy8EdXHxZ1WC9QZoz/xy2U5W9vdw1DKv5hzcoVtTrxlWK
	AnNPBV1ha/X26tgsknXOippclSy/zPfx2Ogkbbv3KPnIDsf8DumEJjipdzEyxg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746005743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UJNip2zXDm80B7tAkghMaJlFm8y4M4Dt4sSg4eOjKbg=;
	b=5mq4+KD1a23JEuPfm/hRiD8eILaJILMq1B7kS15L6KURnB2Z1YywQ75oP8i91IZyPN8Frv
	lOC80XtnnRZptPAA==
Date: Wed, 30 Apr 2025 11:35:33 +0200
Subject: [PATCH 2/2] tools/nolibc: use poll-related definitions from UAPI
 headers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250430-poll-v1-2-44b5ceabdeee@linutronix.de>
References: <20250430-poll-v1-0-44b5ceabdeee@linutronix.de>
In-Reply-To: <20250430-poll-v1-0-44b5ceabdeee@linutronix.de>
To: Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746005742; l=1527;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Hsifuij714dAEdgIZ+9nKlKj8m9fKrLfKEnFbFVJ9cI=;
 b=rVIPNb6CshHPMzMPl2oLqG9i9i2G6Dx6RX559JGeLAafjKAgbugKAw8qDSF7u1bJUxNeUkHE/
 WM/fO79xzBVDTEiY/c6/EYKj+AT3HmT8IL9AqqDxG93q7HspZeV7DRH
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The UAPI headers already provide definitions for these symbols.
Using them makes the code shorter, more robust and compatible with
applications using linux/poll.h directly.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/include/nolibc/poll.h  |  2 +-
 tools/include/nolibc/types.h | 14 --------------
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/tools/include/nolibc/poll.h b/tools/include/nolibc/poll.h
index be6e44fe022d9e8f196821c6c5eb6d0a56e8aacb..1765acb17ea01ff53cbad0b4750e4938446b6a45 100644
--- a/tools/include/nolibc/poll.h
+++ b/tools/include/nolibc/poll.h
@@ -11,9 +11,9 @@
 #define _NOLIBC_POLL_H
 
 #include "arch.h"
-#include "types.h"
 #include "sys.h"
 
+#include <linux/poll.h>
 #include <linux/time.h>
 
 /*
diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
index fe97953d16572db3e4c18cdc8921c6a991d64f94..70f20519ebf908b90c242b5ff71d05364fa89f2f 100644
--- a/tools/include/nolibc/types.h
+++ b/tools/include/nolibc/types.h
@@ -159,20 +159,6 @@ typedef struct {
 			__set->fds[__idx] = 0;				\
 	} while (0)
 
-/* for poll() */
-#define POLLIN          0x0001
-#define POLLPRI         0x0002
-#define POLLOUT         0x0004
-#define POLLERR         0x0008
-#define POLLHUP         0x0010
-#define POLLNVAL        0x0020
-
-struct pollfd {
-	int fd;
-	short int events;
-	short int revents;
-};
-
 /* for getdents64() */
 struct linux_dirent64 {
 	uint64_t       d_ino;

-- 
2.49.0

