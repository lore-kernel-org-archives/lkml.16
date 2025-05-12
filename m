Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED79275878
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747049415; cv=none; b=Mq19tKQ+PnyjrQe2hWLvFAsXGh5hQR31iuHe5xEFDak5igCOaKySWQUHpP+KYZPVx3ujUihv0CmLQ3SziC5bwOnmf3O5VdYMNQOlfBf1Qlf9BwBts36HQnh+l78RHO2ZzntRHIN3d4qc1J7UL0X8HtCgBPzJUpwNi6e279oppAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747049415; c=relaxed/simple;
	bh=FXnKFPrlHZnawEKPnhdVDdRIyOc1fi1mklkj3ixV+9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uUVNPdST4Wx62ihyXq9iRuZN0oRxw/bmCJD5wx2lQdLgjHaL4DljjbrV05VyfRBFMMjGQ8rgCUInkFaPFiCO8r2r5JsJV/dIp5lvzKKpQfXE9wtDZwqb03Fwg7EA0Ufp4XuTFYEjIRbkdyS2Bthp1oRtWXHVh0AwEWto1IElz1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=KjMkZLLX; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=KjMkZLLX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="KjMkZLLX";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="KjMkZLLX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8DABE21180;
	Mon, 12 May 2025 11:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1747049407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XzJGzaqDEpl48Zkp1KckrLSnf9WkAZ3k5SBgOKGqqhM=;
	b=KjMkZLLXP9q8y9aNBqRTjIpoHInXJiLy8g9k7PZCTfpQfL5OX9o/OkQSFMmYOnLEgQ8zXO
	p4H+BKU09tn/TaIb2m4pB3HFmEia49r3zTEKb7/JIoUKDH00zwZKiKYrz8q6/mIG84K7r5
	iEGHGQp+kkYANePoiH7SfQSfeekjk0o=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1747049407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XzJGzaqDEpl48Zkp1KckrLSnf9WkAZ3k5SBgOKGqqhM=;
	b=KjMkZLLXP9q8y9aNBqRTjIpoHInXJiLy8g9k7PZCTfpQfL5OX9o/OkQSFMmYOnLEgQ8zXO
	p4H+BKU09tn/TaIb2m4pB3HFmEia49r3zTEKb7/JIoUKDH00zwZKiKYrz8q6/mIG84K7r5
	iEGHGQp+kkYANePoiH7SfQSfeekjk0o=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6FA11137D2;
	Mon, 12 May 2025 11:30:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EwunGb/bIWg7bwAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 12 May 2025 11:30:07 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH] MAINTAINERS: remove Alexey Makhalov
Date: Mon, 12 May 2025 13:30:04 +0200
Message-ID: <20250512113004.23050-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo,linux.dev:email]
X-Spam-Score: -2.80

Mails to Alexey keep bouncing, so remove him from MAINTAINERS.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 MAINTAINERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f21f1dabb5fe..da3d37fdbb50 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18432,7 +18432,6 @@ F:	include/uapi/linux/ppdev.h
 PARAVIRT_OPS INTERFACE
 M:	Juergen Gross <jgross@suse.com>
 R:	Ajay Kaher <ajay.kaher@broadcom.com>
-R:	Alexey Makhalov <alexey.amakhalov@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	virtualization@lists.linux.dev
 L:	x86@kernel.org
@@ -25918,7 +25917,6 @@ F:	drivers/misc/vmw_balloon.c
 
 VMWARE HYPERVISOR INTERFACE
 M:	Ajay Kaher <ajay.kaher@broadcom.com>
-M:	Alexey Makhalov <alexey.amakhalov@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	virtualization@lists.linux.dev
 L:	x86@kernel.org
@@ -25946,7 +25944,6 @@ F:	drivers/scsi/vmw_pvscsi.h
 VMWARE VIRTUAL PTP CLOCK DRIVER
 M:	Nick Shi <nick.shi@broadcom.com>
 R:	Ajay Kaher <ajay.kaher@broadcom.com>
-R:	Alexey Makhalov <alexey.amakhalov@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	netdev@vger.kernel.org
 S:	Supported
-- 
2.43.0

