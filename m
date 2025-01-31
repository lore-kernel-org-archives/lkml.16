Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29364502A
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738334437; cv=none; b=YsdsL1sWFnvOgQ2ckNDL5jQP64EmuHUkuqmWAQXgKBxCN9H12nIWFVusmP/FWz9D1rl7pWVO8a1dMildzTe/cIpc6o94x4JToAXeeECHG4UTjYM9FmLw2BU6MB/q7vAF66SL5udGO2eH7om5B19L4oV8GUe8ahWIJHdBiUS3JsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738334437; c=relaxed/simple;
	bh=lMlCcshpopmt/IHHKSwONDIYtmyrJNHCJEHrdSHipy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IIueYK3sP/8PfCJFau5+6FfIgH7NvZtPbNJjgVWerSXSYrkOfeQPa0lepqsq4D1wMVKDGTZpRmt8q5YyYZw3mmAYJPAHlyNy3+gWEEDXinr2i+KrFNtc7YVvGEQxS1yH4HHVUXgEgNr+xEra+aVb5Z0KlSXEbkPsMK5FuKL32jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v9mEKHyo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QrPrE+O/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=l7QYLYIV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lTCX1Flj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v9mEKHyo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QrPrE+O/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l7QYLYIV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lTCX1Flj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E3A6021167;
	Fri, 31 Jan 2025 14:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738334432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Rw4boY8lXIG2jWn4frK6D8U9id216JT7k5CaBwdlcPU=;
	b=v9mEKHyoO5XwXFm+Shh9jK8q0JgbykOBIFnoGSyOOL+w8M90Ug+HFc85bkjGoOvOlafWWR
	prMwqHUu1yWB/oXiRsPjjWAitun4yRoTosYzfQiq3K0fwA3jvvHJxs57EGPcV5nQMWotqB
	SkibGiWeNXEFOGxanW8jE+R76KKdeV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738334432;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Rw4boY8lXIG2jWn4frK6D8U9id216JT7k5CaBwdlcPU=;
	b=QrPrE+O/7u05ssMEwiseqt2jGIFOiGwmamneq31l/UaVzAEPzi6Y2at/YlQWc1GklC6K+F
	X/KSSy9G45LoIeCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738334431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Rw4boY8lXIG2jWn4frK6D8U9id216JT7k5CaBwdlcPU=;
	b=l7QYLYIV6OyjWwQH/G37DW0WOQ/Zytv3DyjD+qzSs837xDs5puxt30+h8+CFnTZzWn7rYF
	izkZ+XeSFuTJyRSpLK6/Ut36jBfRare62KzU3H67VrptWDelFSpUziRzu4sE0KgTzIDNd2
	KfPQaDbEyiBL9diyLBbsMPpN8YqRjQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738334431;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Rw4boY8lXIG2jWn4frK6D8U9id216JT7k5CaBwdlcPU=;
	b=lTCX1FljYOj0oMnzbRKrVbNZuuCXt2FPFmJaR/DmLlwGta6dKhaBoZjCa+/3K0pCRd/bFu
	dF9Wpj7jQXr9tdAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A0E36133A6;
	Fri, 31 Jan 2025 14:40:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yQBtIt/gnGcKfgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 31 Jan 2025 14:40:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gerg@linux-m68k.org,
	geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] m68k: Do not include <linux/fb.h>
Date: Fri, 31 Jan 2025 15:40:11 +0100
Message-ID: <20250131144026.310672-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

The m68k architecture's source files does not require <linux/fb.h>.
Remove the include statements.

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

