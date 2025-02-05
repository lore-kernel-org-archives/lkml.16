Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5D515199A
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 11:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738753618; cv=none; b=pvjB0ASQx3Y9YYoW9NHc6FlpHKMSO4b2H/Meyp+iyRkdrRdnVAmYA3Sek5hZPZ0Ht3qXZx0KIhGGuyQYXvwQaRVzsuOBZyTnOVE24TaoYSV9rDGJj4yD2L5KO9ceQHFgfxbL2dV7YIs9V2wv8+ST7tjuso2nBO+Yo/09lPRViO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738753618; c=relaxed/simple;
	bh=VJvoxK4eDV4xXM7GhAzLsMnao8/GREu4DoA3ydBFrRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KkAXfVPq9w4TkpjdPgpSCkDX0YXLmutDNFvGsE2PFdyqrtKd3emp35tIz8xsA/7BT4Z1EyJCSvbP/PZufJKW3EJ5PX1rNEmAxSTFh5fqwsKEMdFXqRyVH2Bwatldtz4h/HVQTku3byISzS3+7fNe/BAFxgDhCtkhcV8PWY6livo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=oMZOrWkE; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=oMZOrWkE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="oMZOrWkE";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="oMZOrWkE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C56C6211A3;
	Wed,  5 Feb 2025 11:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738753613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nyj59u2iCrTl64Iik+1BDNAjH9IfXKH2V6avJGpyHFY=;
	b=oMZOrWkEuAapwMQTTUue+x++uMXoroL5KsVTIAuAydTCvKSbKMW4Oo6BrkDg6mNpMWvUwG
	Tt6FkP8l/DkYKDES91uX3hyls84LQ0k62mFHOJiBh5TsVgXwmpB6hgJsr4jNxHFEpfzqnR
	zCOaYhUGDa39qo6To3jNwVS3TP/0FRo=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=oMZOrWkE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738753613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nyj59u2iCrTl64Iik+1BDNAjH9IfXKH2V6avJGpyHFY=;
	b=oMZOrWkEuAapwMQTTUue+x++uMXoroL5KsVTIAuAydTCvKSbKMW4Oo6BrkDg6mNpMWvUwG
	Tt6FkP8l/DkYKDES91uX3hyls84LQ0k62mFHOJiBh5TsVgXwmpB6hgJsr4jNxHFEpfzqnR
	zCOaYhUGDa39qo6To3jNwVS3TP/0FRo=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5F857139D8;
	Wed,  5 Feb 2025 11:06:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NB6OFU1Go2fcTQAAD6G6ig
	(envelope-from <jgross@suse.com>); Wed, 05 Feb 2025 11:06:53 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/3] x86/xen: some xen_hypercall_hvm() fixes
Date: Wed,  5 Feb 2025 12:06:48 +0100
Message-ID: <20250205110651.26280-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C56C6211A3
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

3 fixes of the xen_hypercall_hvm() function, with the last one being
probably more a cleanup.

Juergen Gross (3):
  x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
  x86/xen: add FRAME_END to xen_hypercall_hvm()
  x86/xen: remove unneeded dummy push from xen_hypercall_hvm()

 arch/x86/xen/xen-head.S | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

-- 
2.43.0

