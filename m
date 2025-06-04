Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADA428DB75
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 10:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749034043; cv=none; b=tZ78dWob2KmAK3bhEiIU75sq23nY788lR6uV2BHfNiukfSoYJfarGDMwtkk35ZrmZkuMH/KE0snfiCNLqLsvZctfsMwRZ4G/X3wYFns3AfaCc7vbgIgpTfepT38gt/3TWQDoP631E/zvQ8KVOdFXoOda6dJIrtjPM2ltW5FKoI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749034043; c=relaxed/simple;
	bh=bRbexgjPNs6cp9+xwQ95/Py1/pt8/R9C4mRpKyyla+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KlXcQi+1RpAk7UCtSDUdlMtNUZ//CiPinzbuyGY/qIlBRRCcprKdRIVDru9zN4Duv2702VaWXRx3ezQGrgstb7ngd7yJefs3beBheH9f+uPkjmwvyNIypimlVKVclHrSEzZN71q5qIKIN8L77Kbcnn0SjQX12wxJM5Sc7ffB3f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=S24+Sacx; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=EDRNLh4m; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="S24+Sacx";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="EDRNLh4m"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AAB4333741;
	Wed,  4 Jun 2025 10:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1749034039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gHhQrj+v5R7cktQ3d/MFfmQ8RxmbP910uhmc2MqlTF4=;
	b=S24+Sacxvu3H0l3pdQc5UBE+QhTxrZ4v2ktp1YdFyhxZp7t5kQHVOm3KAK9ETR4p59C7Wt
	5sbfDgKhxeb0ZpNDMl+5p5JVkcDDI9836Ghf6/13JyZ+UIoBSTacvVVm1uImzuqLShyFTM
	3eo7PWRzYDX/iuRnDzfFDmA7ESamjaw=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=EDRNLh4m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1749034038; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gHhQrj+v5R7cktQ3d/MFfmQ8RxmbP910uhmc2MqlTF4=;
	b=EDRNLh4mUYo/YjG8eOmvoDgYWjkzzaFVXWLQobEReiWwe/MLFOIxiwWzygbHCISg904sFx
	car4MfLyT3RGDzusfeMo/nOoiOm4ft9DmqUHXw2d+OTOhpO6lMPL9kSKkom6FxZfoM19NH
	HqQ898GvVhhaMSSWJxbZDrm6XhpLDrQ=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 426691369A;
	Wed,  4 Jun 2025 10:47:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OfIzDTYkQGgyLQAAD6G6ig
	(envelope-from <nik.borisov@suse.com>); Wed, 04 Jun 2025 10:47:18 +0000
From: Nikolay Borisov <nik.borisov@suse.com>
To: x86@kernel.org
Cc: pawan.kumar.gupta@linux.intel.com,
	peterz@infradead.org,
	linux-kernel@vger.kernel.org,
	dave.hansen@linux.intel.com,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: [PATCH] x86/its: Always return a writable page for dynamic thunks
Date: Wed,  4 Jun 2025 13:47:15 +0300
Message-ID: <20250604104715.700149-1-nik.borisov@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: AAB4333741
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:dkim,suse.com:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: -3.01
X-Spam-Level: 

its_alloc unconditionally allocates and return a ROX page, but setting
it RW is predicated on its_mod being set. This can cause a #GP on the
memset in its_allocate_thunk() if its_mod is not set.

Since the function always returns a page, ensure it's always set
writable so it can be initialized properly.

Fixes: 872df34d7c51 ("x86/its: Use dynamic thunks for indirect branches")
Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
---
 arch/x86/kernel/alternative.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index ecfe7b497cad..191e909636a5 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -199,6 +199,8 @@ static void *its_alloc(void)
 	if (!page)
 		return NULL;
 
+	execmem_make_temp_rw(page, PAGE_SIZE);
+
 #ifdef CONFIG_MODULES
 	if (its_mod) {
 		void *tmp = krealloc(its_mod->its_page_array,
@@ -210,7 +212,6 @@ static void *its_alloc(void)
 		its_mod->its_page_array = tmp;
 		its_mod->its_page_array[its_mod->its_num_pages++] = page;
 
-		execmem_make_temp_rw(page, PAGE_SIZE);
 	}
 #endif /* CONFIG_MODULES */
 
-- 
2.43.0

