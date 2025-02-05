Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4639C22B8C8
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738753629; cv=none; b=FvhFbzBOjxkFFqBdnD1/GNTiH6xO3Ri0EQU5KmHcTsFNxW0OvwiJ5xvcLqaHmRQXqRXh2FFNa4/fZfxmitYF0eGjn9KU04VNz86RJLMeKC918qjY0/TWRon2r/fHuj/UigQ1LZr/DL/MFRwRS3l3R05/i+bhBeXKOt8cXie5Luw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738753629; c=relaxed/simple;
	bh=YaJTV/XHkbD2PF87PkEdDhe1BTRvKi4HG3Pix/LrD5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ot59l8unj76wP0OpkCfmUe4kpdBuzIdIUP6kMz0snNkvnxwwv2kUpPEUjkcLtTZT0ACMWXTgQlXfsrLZs0CxOpJrEwFZEXDLr9ksdytfIJTpuTdlYRD/jrd6IkYt1w24DxvqR1FddzhcJttprdFfpU8bhV47l8+HZipTmbTOUuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=WKD/cvDv; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=WKD/cvDv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="WKD/cvDv";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="WKD/cvDv"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 57FE91F6E6;
	Wed,  5 Feb 2025 11:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738753625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bKe894QJDLgxCUKyYymG61XqQ9XlP2r3abPMdaYkO+0=;
	b=WKD/cvDvjpYt5SkhNkPkebCowAjhIracaY5un3kd66efNd3R2qs1sKsrZSEU0BG+Rzas2l
	mv1OXZAr+n1FjMknqWATGZOoHAd/ry94lJdiXo1gzC6f00zPSA8w7KecpoV/32QpaHkGow
	8OZfz1TDcSY0xDxm74RSIvqZe4aD00c=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="WKD/cvDv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738753625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bKe894QJDLgxCUKyYymG61XqQ9XlP2r3abPMdaYkO+0=;
	b=WKD/cvDvjpYt5SkhNkPkebCowAjhIracaY5un3kd66efNd3R2qs1sKsrZSEU0BG+Rzas2l
	mv1OXZAr+n1FjMknqWATGZOoHAd/ry94lJdiXo1gzC6f00zPSA8w7KecpoV/32QpaHkGow
	8OZfz1TDcSY0xDxm74RSIvqZe4aD00c=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ECC1A139D8;
	Wed,  5 Feb 2025 11:07:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DotZOFhGo2fuTQAAD6G6ig
	(envelope-from <jgross@suse.com>); Wed, 05 Feb 2025 11:07:04 +0000
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
	xen-devel@lists.xenproject.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2 2/3] x86/xen: add FRAME_END to xen_hypercall_hvm()
Date: Wed,  5 Feb 2025 12:06:50 +0100
Message-ID: <20250205110651.26280-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205110651.26280-1-jgross@suse.com>
References: <20250205110651.26280-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 57FE91F6E6
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLkdkdrsxe9hqhhs5ask8616i6)];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

xen_hypercall_hvm() is missing a FRAME_END at the end, add it.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502030848.HTNTTuo9-lkp@intel.com/
Fixes: b4845bb63838 ("x86/xen: add central hypercall functions")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/xen-head.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
index 72f28d66e0e5..4e481b0eefc9 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -132,6 +132,7 @@ SYM_FUNC_START(xen_hypercall_hvm)
 	pop %rcx
 	pop %rax
 #endif
+	FRAME_END
 	/* Use correct hypercall function. */
 	jz xen_hypercall_amd
 	jmp xen_hypercall_intel
-- 
2.43.0

