Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499C11474CC
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 08:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748509024; cv=none; b=dtJe2IA8qHhodQmmYST9tiPTSAl19jmMOYFTYLhRHBh+PzKZfmPG39A59HC+1Bq1xv6IJGoLdZFGJM4DaU7nuxd0DYRcpufly6L8jybqGYiQD5mRpDgdOP6glyWnIcRmFOEo2WAQVCeV8e1b9H98ATYhPV+R2UfodOyHj4Z5JUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748509024; c=relaxed/simple;
	bh=a98gp0kg1iMA/bz6QdciDajVGzzk/CUNrQZOQuQ1K5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pCpSLJxAGT9yoSiGfshapVNgPiGYHDLic4kPgzoRzmRszTZEMIKEC6bX9H+7bXdea8HACs7VXBLgiRKJ2ujdR7pzxDy42A+RnF3+ch5HbmighbaaSyHhIW8JC6BqbGrJ8Vam9Veb7eIQoD0GD89AhQ8GfZtlo594qUyXfM6fPME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=xLHEUufK; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=qAxP/Tgb; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=xLHEUufK; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=qAxP/Tgb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="xLHEUufK";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="qAxP/Tgb";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="xLHEUufK";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="qAxP/Tgb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 250961F82A;
	Thu, 29 May 2025 08:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748509009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Vnold/atbSNdl8iC6MpcIMnsul0rxS/gPOmT+RYJUM=;
	b=xLHEUufKJ5SPoEvJdoI0gBDDR1OP/9By1MiuoyHEhHCDgLNYKeypJ3qKnlzy19kBYeW/0x
	kSrj/CDvUC1Ns+Fw6m9aYPZfreyoGB4ef/F6DOhDyEWP1PmokQ6eHT5eJnU5K4FdQkS28F
	wupmrawpT1AABCXvHzBPj+igJVAdc84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748509009;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Vnold/atbSNdl8iC6MpcIMnsul0rxS/gPOmT+RYJUM=;
	b=qAxP/Tgbfds6XOsSTt7HTn/FOoGdnbocHsuJYIXfRoOc+NADNZFXsoJbDbMJBWUt0L5vT5
	UccQ0/gtb5Zd8bAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748509009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Vnold/atbSNdl8iC6MpcIMnsul0rxS/gPOmT+RYJUM=;
	b=xLHEUufKJ5SPoEvJdoI0gBDDR1OP/9By1MiuoyHEhHCDgLNYKeypJ3qKnlzy19kBYeW/0x
	kSrj/CDvUC1Ns+Fw6m9aYPZfreyoGB4ef/F6DOhDyEWP1PmokQ6eHT5eJnU5K4FdQkS28F
	wupmrawpT1AABCXvHzBPj+igJVAdc84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748509009;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Vnold/atbSNdl8iC6MpcIMnsul0rxS/gPOmT+RYJUM=;
	b=qAxP/Tgbfds6XOsSTt7HTn/FOoGdnbocHsuJYIXfRoOc+NADNZFXsoJbDbMJBWUt0L5vT5
	UccQ0/gtb5Zd8bAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1303913AC0;
	Thu, 29 May 2025 08:56:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aE5jBFEhOGj5aQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 29 May 2025 08:56:49 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Date: Thu, 29 May 2025 10:56:27 +0200
Subject: [PATCH 2/2] mm, slab: support NUMA policy for large kmalloc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-frozen-pages-for-large-kmalloc-v1-2-b3aa52a8fa17@suse.cz>
References: <20250529-frozen-pages-for-large-kmalloc-v1-0-b3aa52a8fa17@suse.cz>
In-Reply-To: <20250529-frozen-pages-for-large-kmalloc-v1-0-b3aa52a8fa17@suse.cz>
To: Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>, 
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1248; i=vbabka@suse.cz;
 h=from:subject:message-id; bh=a98gp0kg1iMA/bz6QdciDajVGzzk/CUNrQZOQuQ1K5I=;
 b=owEBbQGS/pANAwAIAbvgsHXSRYiaAcsmYgBoOCFOYsFS9i8S6vYyCP7KE3yRti79xDhUn8WSI
 cWCkwSOxRaJATMEAAEIAB0WIQR7u8hBFZkjSJZITfG74LB10kWImgUCaDghTgAKCRC74LB10kWI
 mgVvCACcMqqZ0kPKUICmReWJRDoVwdSaXsgFLTJPBqH0MqpFiQSN+oZcpzqhQOKsxlhonxc472X
 vc3QOFbSingeJsF4gaYJx/Pr/4491B+ruhFVTvJMqnqRFKzeh8oYTDGy1OAZlsMAqsfN7zFahlj
 ruLPGdlnD0ID2bTo391i6SYySaUpXJNKiWhrAX8sZdSLeR7GzBA94sCFuRCEJv8tlcdijGu2DLS
 r/ZEz/oYE9GJ6OFaSV44dqkbRne8oIxU2kwBBTkflfPH788LbDkFf4PCaL8UkIdRS3a0NMYXOOO
 EpNbPX5dXBQo+GfR6CxDIoRvBhsl4Po/MbunH/bvhP+mZMvg
X-Developer-Key: i=vbabka@suse.cz; a=openpgp;
 fpr=A940D434992C2E8E99103D50224FA7E7CC82A664
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.988];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

The slab allocator observes the task's numa policy in various places
such as allocating slab pages. Large kmalloc allocations currently do
not, which seems to be an unintended omission. It is simple to correct
that, so make ___kmalloc_large_node() behave the same way as
alloc_slab_page().

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/slub.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index d7a62063a1676a327e13536bf724f0160f1fc8dc..d87015fad2df65629050d9bcd224facd3d2f4033 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -4281,11 +4281,13 @@ static void *___kmalloc_large_node(size_t size, gfp_t flags, int node)
 	if (unlikely(flags & GFP_SLAB_BUG_MASK))
 		flags = kmalloc_fix_flags(flags);
 
+	flags |= __GFP_COMP;
+
 	if (node == NUMA_NO_NODE)
-		node = numa_mem_id();
+		folio = (struct folio *)alloc_frozen_pages_noprof(flags, order);
+	else
+		folio = (struct folio *)__alloc_frozen_pages_noprof(flags, order, node, NULL);
 
-	flags |= __GFP_COMP;
-	folio = (struct folio *)__alloc_frozen_pages_noprof(flags, order, node, NULL);
 	if (folio) {
 		ptr = folio_address(folio);
 		lruvec_stat_mod_folio(folio, NR_SLAB_UNRECLAIMABLE_B,

-- 
2.49.0

