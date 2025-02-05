Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CB522B59F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 11:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738753622; cv=none; b=sY6lARIg01bh/eXKPoNMDOyafs38BYEBni/znw4/vElMGZi9Hv0ST/U9xY+av5IGcITaH6RJbIt486byAKwmBxII8m0QOhrQ9ma3jadm0JEt1l0yZXQcdTincE3969MHqJ6eW/ASsw3IW7SX13FQdM1G0yxguO8QpfOxX32MlS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738753622; c=relaxed/simple;
	bh=X1jFF0V5KZo/4iIU5hwlVLe1imWrP3LDpdKUEAQJa2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOwO90Y4bjLJ376lOE+xCjNo/IIfLSO/++rm+CmkdbImdPskaud+B5RE3Se634+hvvth4e1LF0YG1ygsT6UGS89rzdAyUj8Q4XHkUa2CBXPZJEEI331ajgwtFwXCLLAVq8RmNVbQ5MlNfH8UIgPC1GfLBSEV0EFPtcKooj8XQ0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=neevaAfL; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=neevaAfL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="neevaAfL";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="neevaAfL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8AB39211B2;
	Wed,  5 Feb 2025 11:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738753619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OOhuRhILL0YTKmio4FLZ6gFY+7zoRKpBYi9j1BnABPQ=;
	b=neevaAfLww3/px7t8PyD2K43MKApyvIHGSdSAbzDr8qXy+UkE9QldNuTMXG0Q4+VMRWAuj
	67k6p+AGmXhoxEIZbwI/Pk4cSG//AhwPbpgTlU1Y7ntufFM8i/5NDr+XKVS8sbSQPf9yRm
	qcxMb1uxgNXhf0i4YowbHJJWJNmunSI=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=neevaAfL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738753619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OOhuRhILL0YTKmio4FLZ6gFY+7zoRKpBYi9j1BnABPQ=;
	b=neevaAfLww3/px7t8PyD2K43MKApyvIHGSdSAbzDr8qXy+UkE9QldNuTMXG0Q4+VMRWAuj
	67k6p+AGmXhoxEIZbwI/Pk4cSG//AhwPbpgTlU1Y7ntufFM8i/5NDr+XKVS8sbSQPf9yRm
	qcxMb1uxgNXhf0i4YowbHJJWJNmunSI=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A8E8139D8;
	Wed,  5 Feb 2025 11:06:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id I97JDFNGo2fkTQAAD6G6ig
	(envelope-from <jgross@suse.com>); Wed, 05 Feb 2025 11:06:59 +0000
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
Subject: [PATCH v2 1/3] x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
Date: Wed,  5 Feb 2025 12:06:49 +0100
Message-ID: <20250205110651.26280-2-jgross@suse.com>
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
X-Rspamd-Queue-Id: 8AB39211B2
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

xen_hypercall_hvm(), which is used when running as a Xen PVH guest at
most only once during early boot, is clobbering %rbx. Depending on
whether the caller relies on %rbx to be preserved across the call or
not, this clobbering might result in an early crash of the system.

This can be avoided by using an already saved register instead of %rbx.

Fixes: b4845bb63838 ("x86/xen: add central hypercall functions")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- use %rcx instead of %rbx, keeping the lea instruction (Jan Beulich)
---
 arch/x86/xen/xen-head.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
index 9252652afe59..72f28d66e0e5 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -117,8 +117,8 @@ SYM_FUNC_START(xen_hypercall_hvm)
 	pop %ebx
 	pop %eax
 #else
-	lea xen_hypercall_amd(%rip), %rbx
-	cmp %rax, %rbx
+	lea xen_hypercall_amd(%rip), %rcx
+	cmp %rax, %rcx
 #ifdef CONFIG_FRAME_POINTER
 	pop %rax	/* Dummy pop. */
 #endif
-- 
2.43.0

