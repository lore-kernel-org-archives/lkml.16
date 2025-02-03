Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C241F91C5
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738569819; cv=none; b=OBmmlcYDgQsSRWRQhqanM8mWfWfEbA4Dd1jTUrCV4Elqx4aVNHvEPmWPkbLN/9JvQijsR0n4ph7gp66xHWCbmzkYR6LSan22wgErlJ97KAKZmTfXZpIiEQQxK8smOCw4QrdOV+3VUklE48DdP7GXoWQCwRNSx7kfCWBO7RytOW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738569819; c=relaxed/simple;
	bh=2cqtS2k+hjdXiZdYvwYoWsOVWYDbe2vkl0zduCh3WL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cV7axnszWZV8XcJM6/XFwP0WWVoOZNqmKzVK/V6/zGa6sq4mZee/+XVQulhZCetz4Zu7BKBBXLDGjwUDcg9C5C0/7XGxmW9U6kk2wC4nfqFhJLvQynDl692sPPJmmbm3Dt36OjmE10M1AIaJST7RssAXtQ0w90Tm/yEjSdlIvgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fM+m25Xe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5iY0NVhU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fM+m25Xe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5iY0NVhU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fM+m25Xe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5iY0NVhU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fM+m25Xe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5iY0NVhU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5BFE72115B;
	Mon,  3 Feb 2025 08:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738569816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8HjuxX6NkxYCirtE52oZ+/r/bS3Ar6doScITy6sS53I=;
	b=fM+m25XehR2oklQCKQcwldkzCncvQa3mFglV5RgSPVLqdkJJoTdbg3POQxAEhEIdIMQq2f
	CFb4WNjT/BaysgX40DNNupo5PMF5iSBT03itfbJDeD0R35xuIdTuf03OdbNEBuQsFdTCQx
	ezGdY/jth5mTZU6yeylwUKU7VhuC0GY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738569816;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8HjuxX6NkxYCirtE52oZ+/r/bS3Ar6doScITy6sS53I=;
	b=5iY0NVhUHGJLLKXDQBUwIIgY7rK1pPgRzvupTGZAIeebJax3HsrIOC7ZFonVW8juglrtFz
	SrFvErtOtYA/9qAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fM+m25Xe;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5iY0NVhU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738569816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8HjuxX6NkxYCirtE52oZ+/r/bS3Ar6doScITy6sS53I=;
	b=fM+m25XehR2oklQCKQcwldkzCncvQa3mFglV5RgSPVLqdkJJoTdbg3POQxAEhEIdIMQq2f
	CFb4WNjT/BaysgX40DNNupo5PMF5iSBT03itfbJDeD0R35xuIdTuf03OdbNEBuQsFdTCQx
	ezGdY/jth5mTZU6yeylwUKU7VhuC0GY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738569816;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8HjuxX6NkxYCirtE52oZ+/r/bS3Ar6doScITy6sS53I=;
	b=5iY0NVhUHGJLLKXDQBUwIIgY7rK1pPgRzvupTGZAIeebJax3HsrIOC7ZFonVW8juglrtFz
	SrFvErtOtYA/9qAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 300AE13795;
	Mon,  3 Feb 2025 08:03:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4OlnClh4oGetRAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 03 Feb 2025 08:03:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gerg@linux-m68k.org,
	geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2] m68k: Do not include <linux/fb.h>
Date: Mon,  3 Feb 2025 09:03:19 +0100
Message-ID: <20250203080330.5364-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5BFE72115B
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

The m68k architecture's source files do not require <linux/fb.h>.
Remove the include statements.

v2:
- fix grammar in commit description (John)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/m68k/kernel/setup_no.c | 1 -
 arch/m68k/kernel/uboot.c    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
index c926da9d5ec28..f9872098f5ca5 100644
--- a/arch/m68k/kernel/setup_no.c
+++ b/arch/m68k/kernel/setup_no.c
@@ -21,7 +21,6 @@
 #include <linux/sched.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
-#include <linux/fb.h>
 #include <linux/module.h>
 #include <linux/mm.h>
 #include <linux/console.h>
diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
index 8bb1cb3a7490e..5e52ea150d5cb 100644
--- a/arch/m68k/kernel/uboot.c
+++ b/arch/m68k/kernel/uboot.c
@@ -10,7 +10,6 @@
 #include <linux/sched.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
-#include <linux/fb.h>
 #include <linux/module.h>
 #include <linux/mm.h>
 #include <linux/console.h>
-- 
2.48.1

