Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA00845C0B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750090466; cv=none; b=FUqYFvM3+rxOHbTgNVlETTkWzz0+njvCLX+pKhk6lXSxjjx9zc8Ef1wzvXLJBbUOhsibWxjOCNJRfCYs9fFfRGzgusP+K6gLV56rfyE6i6Eos0KADrKpLg3Df8gmt7BeS882X4YCg1S8DDsxlFE/TSvYH6ja0lAvifhAXdMfomY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750090466; c=relaxed/simple;
	bh=acU0hO3gSblMdOQUcDRa9v2QPgNEdUMTTJ/Uaq4j+o8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oKO1cdAHcrhFTMT3bIdKC6KDiPgje2eGQpgL/ImRttHoR+angUwoXU5nuYQhqkp5e/0VvNmqwJVNiKK8BRw8Ithgb9Eu3oJWRAyoWs2UZg3Fi/Lv4YZdugKBbaPlkygygUKhOuRgRR3Gr29d7sj3vPNaAyxisgjilZAqQVLx7X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=byUvZqoK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wx12I/II; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BNkb4E1f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PuiVYcCT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="byUvZqoK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wx12I/II";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BNkb4E1f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PuiVYcCT"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F0433211B3;
	Mon, 16 Jun 2025 16:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750090458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xAZ1pS7ZVkemVnWAlaPyAiw28HCsnl//HdEVKNU0pFM=;
	b=byUvZqoKcvNI4OtYtUETdKqbjIubMAECBN8ZQz1MBOUQJOBCMkh0Pgh4NToKdzHNbYPBB9
	YMBidXI1ViENS8HSC1YmGn21+stZzHo+0zt9ILiepxfV1x3OuhEAMR4MfLXVL9j2Eqe9rz
	THzDve4Pc0McO/0VO/FQ7oEVWTb4TSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750090458;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xAZ1pS7ZVkemVnWAlaPyAiw28HCsnl//HdEVKNU0pFM=;
	b=wx12I/IIGB2p+cRkCCdtA/UsWRoRB9eeHcdM8JHsImKlwPBYpGJADlgDj41aBc53MVd5or
	F+b6jK9BtVdwP2Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750090452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xAZ1pS7ZVkemVnWAlaPyAiw28HCsnl//HdEVKNU0pFM=;
	b=BNkb4E1fKWvOXyfEO1NJh8Uet284lPoICAjAWCaf1AobT0AhkayLxZbPh8dVGYpQyCRscP
	IiSb0Xqdz42BU7XWz2upe87DIgP9Z2hdhYWGZTuaP9FOukoT6yf4T8EMr+A8hP7jyeSE1V
	H4Fgc4tDSyVLkAC0twGV57Sxqm5lBJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750090452;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xAZ1pS7ZVkemVnWAlaPyAiw28HCsnl//HdEVKNU0pFM=;
	b=PuiVYcCT33LVz8d+IlYcJkGVaORZ6zUzoeZKOrk7WA+odiczzCOXlf7FwMHH/l1pKDGEP8
	0X/vR4qP3zCjCcCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B812013A6B;
	Mon, 16 Jun 2025 16:14:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id K3cvK9RCUGgTcwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Jun 2025 16:14:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Gabriel Somlo <somlo@cmu.edu>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Fabian Vogt <fvogt@suse.de>,
	linux-kernel@vger.kernel.org,
	qemu-devel@nongnu.org
Subject: [PATCH RESEND] firmware: qemu_fw_cfg: Do not hard depend on CONFIG_HAS_IOPORT_MAP
Date: Mon, 16 Jun 2025 18:14:06 +0200
Message-ID: <20250616161408.26748-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

From: Fabian Vogt <fvogt@suse.de>

Some platforms require CONFIG_NO_IOPORT_MAP=y but would also support
qemu_fw_cfg over MMIO. Currently the qemu_fw_cfg module can't be built for
those as it needs HAS_IOPORT_MAP=y for ioport remapping.

This patch allows to build the qemu_fw_cfg in those cases. If
CONFIG_HAS_IOPORT_MAP=n, qemu_fw_cfg is built without support for ioport
based access.

Signed-off-by: Fabian Vogt <fvogt@suse.de>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

Resent, as the original submission seems overlooked:
 https://lore.kernel.org/2294036.ElGaqSPkdT@linux-e202.suse.de/
The patch has been on openSUSE / SUSE kernels already for years.

 drivers/firmware/Kconfig       | 1 -
 drivers/firmware/qemu_fw_cfg.c | 5 +++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index bbd2155d8483..91442f85f0f0 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -122,7 +122,6 @@ config RASPBERRYPI_FIRMWARE
 config FW_CFG_SYSFS
 	tristate "QEMU fw_cfg device support in sysfs"
 	depends on SYSFS && (ARM || ARM64 || PARISC || PPC_PMAC || RISCV || SPARC || X86)
-	depends on HAS_IOPORT_MAP
 	default n
 	help
 	  Say Y or M here to enable the exporting of the QEMU firmware
diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
index 2615fb780e3c..e15116f84a70 100644
--- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -258,6 +258,7 @@ static int fw_cfg_do_platform_probe(struct platform_device *pdev)
 			return -EFAULT;
 		}
 	} else {
+#ifdef CONFIG_HAS_IOPORT_MAP
 		if (!request_region(fw_cfg_p_base,
 				    fw_cfg_p_size, "fw_cfg_io"))
 			return -EBUSY;
@@ -266,6 +267,10 @@ static int fw_cfg_do_platform_probe(struct platform_device *pdev)
 			release_region(fw_cfg_p_base, fw_cfg_p_size);
 			return -EFAULT;
 		}
+#else
+		dev_err(&pdev->dev, "IO region given but CONFIG_HAS_IOPORT_MAP=n");
+		return -EINVAL;
+#endif
 	}
 
 	/* were custom register offsets provided (e.g. on the command line)? */
-- 
2.49.0

