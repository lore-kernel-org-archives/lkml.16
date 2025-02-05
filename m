Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC25915199F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 11:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738753634; cv=none; b=hWDphwvuuCmvCCcEl2UA8GWSpuCsKfmfJuBLyTdZ4kSGuEMSL6Hdbg9TnArxROG2z5g6RBBpPE9dvXThI+1lgX1z8tZtkPnelcyeo0Ajsv+99cUNpaM4znGKZ8jOsC/tRba/eVuOlCCbR5tlVfDodC2WKSWhNjpXOK03TyM8rHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738753634; c=relaxed/simple;
	bh=l+flV/X28XGq8m3UkzJEMMMdxYH9JWG886Sv5gWuKFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nZ3JLMtQwfS+xDRxvJwEBCtolr6/7L48HNSxXzTDKpxqLM/16z8S8gEGE4up1ipDnTxvFqBaLkZBgiljxZZQ+4DBi4pr/8DCXpBf1iknNjlN31Stj3l59bk3mywzeGbqyJaEUQe5bJhiOUQ4SBxScIxSOXRWofDjIkNCSO6SyMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=pNiVUjSt; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=pNiVUjSt; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="pNiVUjSt";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="pNiVUjSt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 220461F461;
	Wed,  5 Feb 2025 11:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738753631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C+IDx8vE0Cv/MWgdce49lISNw1mI+dFGY3GPexpYFgA=;
	b=pNiVUjStSqhsdarFmkOWe4HfZYvWERBGJIuU/7qZtFoIVX598QwXVe3gbDVB7mRzG8d57Q
	Bscsxz33egKRPU12CNO0PVAdGeXd+g0wkMXXMBlOBlw0SnFck6dLt5Slt7JvpRWOY7cC/l
	X7utxEo8XbjfwOllN6K/Ox+DjLdGHQM=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738753631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C+IDx8vE0Cv/MWgdce49lISNw1mI+dFGY3GPexpYFgA=;
	b=pNiVUjStSqhsdarFmkOWe4HfZYvWERBGJIuU/7qZtFoIVX598QwXVe3gbDVB7mRzG8d57Q
	Bscsxz33egKRPU12CNO0PVAdGeXd+g0wkMXXMBlOBlw0SnFck6dLt5Slt7JvpRWOY7cC/l
	X7utxEo8XbjfwOllN6K/Ox+DjLdGHQM=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C1977139D8;
	Wed,  5 Feb 2025 11:07:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OrXKLV5Go2f3TQAAD6G6ig
	(envelope-from <jgross@suse.com>); Wed, 05 Feb 2025 11:07:10 +0000
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
Subject: [PATCH v2 3/3] x86/xen: remove unneeded dummy push from xen_hypercall_hvm()
Date: Wed,  5 Feb 2025 12:06:51 +0100
Message-ID: <20250205110651.26280-4-jgross@suse.com>
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
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Stack alignment of the kernel in 64-bit mode is 8, not 16, so the
dummy push in xen_hypercall_hvm() for aligning the stack to 16 bytes
can be removed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/xen-head.S | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
index 4e481b0eefc9..894edf8d6d62 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -100,9 +100,6 @@ SYM_FUNC_START(xen_hypercall_hvm)
 	push %r10
 	push %r9
 	push %r8
-#ifdef CONFIG_FRAME_POINTER
-	pushq $0	/* Dummy push for stack alignment. */
-#endif
 #endif
 	/* Set the vendor specific function. */
 	call __xen_hypercall_setfunc
@@ -119,9 +116,6 @@ SYM_FUNC_START(xen_hypercall_hvm)
 #else
 	lea xen_hypercall_amd(%rip), %rcx
 	cmp %rax, %rcx
-#ifdef CONFIG_FRAME_POINTER
-	pop %rax	/* Dummy pop. */
-#endif
 	pop %r8
 	pop %r9
 	pop %r10
-- 
2.43.0

