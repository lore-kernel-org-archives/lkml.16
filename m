Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E103A22D7A7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 12:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744030773; cv=none; b=WAj6H5DBCq4wjNf2tvSgBhfyVmItUELpUaC0PY1vglD0cHAnX+Zteh15fQ8sMOx7tAbGv88jEdOJL5aaRD2Y28cCQMsEOFcvWMcfFJTZuMxP6wvZ3tVg5WqWrMNQY9SvIob8p99knc9MfRGvbmKvjO4fOINy3HRqmg93QGEF1f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744030773; c=relaxed/simple;
	bh=7uUHsuLSAw/SAc1kIKiZzWTlW0jRj2R2fvUV0vSBXCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LZHD70r082gkvugOtrlc0tmxkKyEilBWs8tvAQ8F7qJFPgXXEcsxKqzzcPU/j0DWRVyATb3aeuQYkiiigDnEMV4Er83ImoZl5x6ZjIgNQWC7XYZXb8LI3ED1NpHREdcfQ8iWb4ygamOskp8nZsh1RKqivcIacKclp+BIL+rMlb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oi7Vzppz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IrLKj0XC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LZFMs6Y8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YFhLfkKl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oi7Vzppz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IrLKj0XC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LZFMs6Y8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YFhLfkKl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DC9CA2116B;
	Mon,  7 Apr 2025 12:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744030770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AhHyki00iZxwN7xuUN1WKIWq4SH8cUdasn1lh3BxmPY=;
	b=oi7Vzppz+KWsdCcEDRRuoB+XKN+HuuvhwY1Co53E4BoInN7TEzVtbXBouHja75+ZoPlxW4
	BzVdsM6h3oVCVeph+j/gPQep0FrMYzWCHdPf9Dtz+FiNH0ZZbMla6j5/ecwq9Wx5hGEiKE
	i+XtLruT5X+UZ47cEkmM3N+uP+6Z0N0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744030770;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AhHyki00iZxwN7xuUN1WKIWq4SH8cUdasn1lh3BxmPY=;
	b=IrLKj0XCamleAIYP+VUc31mkW5n8Vq9SuwiBMA0772KsXRJG6dEjx8LRS1uLgtkBkKe65j
	zaOvulIZAMcQojCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=LZFMs6Y8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YFhLfkKl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744030769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AhHyki00iZxwN7xuUN1WKIWq4SH8cUdasn1lh3BxmPY=;
	b=LZFMs6Y8Hfil/lr4FHgTxkJ/jR5nFoxSlHMpNgj10SIuhJfcMgGbBsUND0LaWMSjFhNJh9
	ZsR6Fb2NUhem6/4fsywKhoqOqGE2QuoVW8AJjtv6bY8GyNHjDxOFZ+j+bY2erq+c/g6bLf
	TUn6+++3fXIYfmdq6OMSy+l1GzRAZAk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744030769;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AhHyki00iZxwN7xuUN1WKIWq4SH8cUdasn1lh3BxmPY=;
	b=YFhLfkKlbps4cYoehxdYtgA2JbGB4s4lycZ+9JlsyiAhr3/xNaP8T1qx62Kb8xz0kvg7Hk
	xLZhMgbsWWGifzBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A04A413691;
	Mon,  7 Apr 2025 12:59:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KzOlJDHM82cSDAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Mon, 07 Apr 2025 12:59:29 +0000
From: Stanimir Varbanov <svarbanov@suse.de>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: [PATCH] irqchip/irq-bcm2712-mip: Set EOI/ACK flags in msi_parent_ops
Date: Mon,  7 Apr 2025 15:59:18 +0300
Message-ID: <20250407125918.3021454-1-svarbanov@suse.de>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DC9CA2116B
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

The recently introduced msi_parent_ops::chip_flags sets irq_eoi()/irq_ack()
conditionally, but MIP driver has not been updated. Populate chip_flags
with EOI | ACK flags.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
---
 drivers/irqchip/irq-bcm2712-mip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-bcm2712-mip.c b/drivers/irqchip/irq-bcm2712-mip.c
index 49a19db2d1e1..4cce24233f0f 100644
--- a/drivers/irqchip/irq-bcm2712-mip.c
+++ b/drivers/irqchip/irq-bcm2712-mip.c
@@ -163,6 +163,7 @@ static const struct irq_domain_ops mip_middle_domain_ops = {
 static const struct msi_parent_ops mip_msi_parent_ops = {
 	.supported_flags	= MIP_MSI_FLAGS_SUPPORTED,
 	.required_flags		= MIP_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token       = DOMAIN_BUS_GENERIC_MSI,
 	.bus_select_mask	= MATCH_PCI_MSI,
 	.prefix			= "MIP-MSI-",
-- 
2.47.0

