Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C7618B47C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 11:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748862148; cv=none; b=M9YLnhpIHOTFDnbNRJTB8R31y2PyLf9kxpWs9bFKRpQEoZ5zk7ZtVn1as8XaTKyocH+XV7GP8REsefaDchFi7gvzZB7XvrLrQmMedfXSjihQABx08COfJvMg/Z9gtc6ZDA9yqQPUb9ihPGz/+/rZY8a5hETmi0YsRF1XR7lRwUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748862148; c=relaxed/simple;
	bh=sGGOF6H61Kb8NYKEAILjOo0Ob8kpMXtmxpZkU6fLnnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mEl2mflZyqAMr9QUsx1730RFCbuZMOIK1Sz6Taa0dz6ggxYyy0JOryWbxYTsqawvZLdTu/zbtI+0oiqc5tVfVXVO/m7skdo2d6KzjPDIU/yEXfVBuUgHDH1WVDfxs5O550gbTX1SfqZhOIJNklT7L6/uM7/PFghINRY1x4QN80o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=uiNnEm6O; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=pGAcvMIH; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=uiNnEm6O; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=pGAcvMIH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="uiNnEm6O";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="pGAcvMIH";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="uiNnEm6O";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="pGAcvMIH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C13FA219E4;
	Mon,  2 Jun 2025 11:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748862137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A6pctFRzU+SYdaBRtN4s3/10XePRK+pRaGKjp/WHplY=;
	b=uiNnEm6OLfwlIy2mTZ55O3baRpstg7j3nZF0f7NvZrLt1413wDU+hXDe49Yu2rROSp0Re8
	JzLccXneTb67HAWMzTUEOJDNdYmyrN0Y/mVSspiH8TQgsirXCKrHWwZvDkdg6aFoCD3xVh
	0iXDfr3nK4Qt/D58LcPqtB56GgsWgZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748862137;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A6pctFRzU+SYdaBRtN4s3/10XePRK+pRaGKjp/WHplY=;
	b=pGAcvMIHfx92OXumIzPMoG1qXyxWQ1YzNoFJVn17jOJu3cXXi2H73M5BBs+iRCjC/3P9uh
	4ygCKeCA6MBFWiAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748862137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A6pctFRzU+SYdaBRtN4s3/10XePRK+pRaGKjp/WHplY=;
	b=uiNnEm6OLfwlIy2mTZ55O3baRpstg7j3nZF0f7NvZrLt1413wDU+hXDe49Yu2rROSp0Re8
	JzLccXneTb67HAWMzTUEOJDNdYmyrN0Y/mVSspiH8TQgsirXCKrHWwZvDkdg6aFoCD3xVh
	0iXDfr3nK4Qt/D58LcPqtB56GgsWgZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748862137;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A6pctFRzU+SYdaBRtN4s3/10XePRK+pRaGKjp/WHplY=;
	b=pGAcvMIHfx92OXumIzPMoG1qXyxWQ1YzNoFJVn17jOJu3cXXi2H73M5BBs+iRCjC/3P9uh
	4ygCKeCA6MBFWiAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AAD1C13AE0;
	Mon,  2 Jun 2025 11:02:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EFJlKbmEPWggHAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 02 Jun 2025 11:02:17 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Date: Mon, 02 Jun 2025 13:02:12 +0200
Subject: [PATCH v2 1/2] mm, slab: restore NUMA policy support for large
 kmalloc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-frozen-pages-for-large-kmalloc-v2-1-84a21f2c3640@suse.cz>
References: <20250602-frozen-pages-for-large-kmalloc-v2-0-84a21f2c3640@suse.cz>
In-Reply-To: <20250602-frozen-pages-for-large-kmalloc-v2-0-84a21f2c3640@suse.cz>
To: Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>, 
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
X-Mailer: b4 0.14.2
X-Spam-Flag: NO
X-Spam-Score: -8.30
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:email]
X-Spam-Level: 

The slab allocator observes the task's NUMA policy in various places
such as allocating slab pages. Large kmalloc() allocations used to do
that too, until an unintended change by c4cab557521a ("mm/slab_common:
cleanup kmalloc_large()") resulted in ignoring mempolicy and just
preferring the local node. Restore the NUMA policy support.

Fixes: c4cab557521a ("mm/slab_common: cleanup kmalloc_large()")
Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/slub.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/slub.c b/mm/slub.c
index dc9e729e1d269b5d362cb5bc44f824640ffd00f3..11356c701f9f857a2e8cf40bf963ac3abdb5e010 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -4282,7 +4282,12 @@ static void *___kmalloc_large_node(size_t size, gfp_t flags, int node)
 		flags = kmalloc_fix_flags(flags);
 
 	flags |= __GFP_COMP;
-	folio = (struct folio *)alloc_pages_node_noprof(node, flags, order);
+
+	if (node == NUMA_NO_NODE)
+		folio = (struct folio *)alloc_pages_noprof(flags, order);
+	else
+		folio = (struct folio *)__alloc_pages_noprof(flags, order, node, NULL);
+
 	if (folio) {
 		ptr = folio_address(folio);
 		lruvec_stat_mod_folio(folio, NR_SLAB_UNRECLAIMABLE_B,

-- 
2.49.0

