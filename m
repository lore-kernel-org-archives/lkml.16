Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032B21474CC
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 08:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748509018; cv=none; b=BTTwfUX51Jm5ghjNuJmCt5FacMSxaNtlhRNMv3P0rZwKv/7EdDnDBedaJREsUypRHqNPwP2DHEcK4QAlFKnY1WAzeO3ugEZyWPi8GmlallL1/uVvG5ShGJdoqtGSH8OXG/NhIjT023kvZJVHooE+Zmf66hDIS7xeNNkco+2ni6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748509018; c=relaxed/simple;
	bh=tU3YQTxDcX04GkM22H8V6kixtDjvJKZbimMVydYqw8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c5P6Q8DiZ6XLJcuV9Q/GNCPztjQqrBf0gf7yEo0/L0vZ9KGjW4+WwLfftsq9flrIoRrqaUSJhS7s/LRPjFrV5ZlSX5W5+2itpZpnXsH1S08SP3c6rCgmXFikST5R4OIA7U/QNcvvDQBRSwNqzpLzs4C5P84sQYRj8azLpEUtdCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=L6dREbmX; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=MTzlF9gJ; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=L6dREbmX; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=MTzlF9gJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="L6dREbmX";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="MTzlF9gJ";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="L6dREbmX";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="MTzlF9gJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 17D651F829;
	Thu, 29 May 2025 08:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748509009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JQZAew8msvOctj5ZD0eHM2URNiVKphy+25eIpuwJzoA=;
	b=L6dREbmXVTJPyT4Oqd7BYqALscmAPIiQb325Q3YAEwc1i+xa9dOix3AZpHWIHDfzTvLlBE
	WYrE/baTXFYA3+tWq8aA4YA1pXGJWBQPRmn4OQlImR9QUxmUeioZZLfYu9v8e/o0lb7gtR
	L4e6n3iNZ2DRhyJtFDfoz0EREgAo9vE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748509009;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JQZAew8msvOctj5ZD0eHM2URNiVKphy+25eIpuwJzoA=;
	b=MTzlF9gJgL35ffV7RPYQ5xkQaZ+aS564sgCfmjR263SGnr4UgIzy4glEvauESUq1b1DL/g
	093h+z7oHGl4WaCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=L6dREbmX;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=MTzlF9gJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748509009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JQZAew8msvOctj5ZD0eHM2URNiVKphy+25eIpuwJzoA=;
	b=L6dREbmXVTJPyT4Oqd7BYqALscmAPIiQb325Q3YAEwc1i+xa9dOix3AZpHWIHDfzTvLlBE
	WYrE/baTXFYA3+tWq8aA4YA1pXGJWBQPRmn4OQlImR9QUxmUeioZZLfYu9v8e/o0lb7gtR
	L4e6n3iNZ2DRhyJtFDfoz0EREgAo9vE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748509009;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JQZAew8msvOctj5ZD0eHM2URNiVKphy+25eIpuwJzoA=;
	b=MTzlF9gJgL35ffV7RPYQ5xkQaZ+aS564sgCfmjR263SGnr4UgIzy4glEvauESUq1b1DL/g
	093h+z7oHGl4WaCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0569613AAD;
	Thu, 29 May 2025 08:56:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6CjfAFEhOGj5aQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 29 May 2025 08:56:49 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Date: Thu, 29 May 2025 10:56:26 +0200
Subject: [PATCH 1/2] mm, slab: use frozen pages for large kmalloc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-frozen-pages-for-large-kmalloc-v1-1-b3aa52a8fa17@suse.cz>
References: <20250529-frozen-pages-for-large-kmalloc-v1-0-b3aa52a8fa17@suse.cz>
In-Reply-To: <20250529-frozen-pages-for-large-kmalloc-v1-0-b3aa52a8fa17@suse.cz>
To: Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>, 
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2857; i=vbabka@suse.cz;
 h=from:subject:message-id; bh=tU3YQTxDcX04GkM22H8V6kixtDjvJKZbimMVydYqw8w=;
 b=owEBbQGS/pANAwAIAbvgsHXSRYiaAcsmYgBoOCFKCc/ViB6f/SoeXyF+/fKvb++yRgCg4LjTx
 Va1P5eYtFKJATMEAAEIAB0WIQR7u8hBFZkjSJZITfG74LB10kWImgUCaDghSgAKCRC74LB10kWI
 mpNRB/0T0/yu6UiTDmgQb/r2nr2QvGx5EFeRfY3aWA046YhrKch528CGFXHYjuIQqsgAiZ5blWw
 WgNclnB9saI7S7yPpD891NKHLq2gc3D6AyrOpIKTxQDmZdkX4j4eWdoADldTbCObSkwXd+OnUIx
 2AneNgESjvjUK3Y4DeCA8y0z+NvdaHf2zRGW1YuP4fv5NBkL+hWJFs5ggyh56Br5c0Uz9YUKS+4
 M5NRx8ZlVzyshF8/hVRpvRlJJ3WV2HUAYjxczrQx0tmXNLi3+s4oWHCgDX9FCio3l0iinEZTCes
 ub70DEn9o/IEwCujVSZMFQDQFfxBe+LvjkX5WWbRch6IDVHF
X-Developer-Key: i=vbabka@suse.cz; a=openpgp;
 fpr=A940D434992C2E8E99103D50224FA7E7CC82A664
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 17D651F829
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Score: -4.51
X-Spam-Level: 

Since slab pages are now frozen, it makes sense to have large kmalloc()
objects behave same as small kmalloc(), as the choice between the two is
an implementation detail depending on allocation size.

Notably, increasing refcount on a slab page containing kmalloc() object
is not possible anymore, so it should be consistent for large kmalloc
pages.

Therefore, change large kmalloc to use the frozen pages API.

Because of some unexpected fallout in the slab pages case (see commit
b9c0e49abfca ("mm: decline to manipulate the refcount on a slab page"),
implement the same kind of checks and warnings as part of this change.

Notably, networking code using sendpage_ok() to determine whether the
page refcount can be manipulated in the network stack should continue
behaving correctly. Before this change, the function returns true for
large kmalloc pages and page refcount can be manipulated. After this
change, the function will return false.

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/mm.h | 4 +++-
 mm/slub.c          | 7 +++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bf55206935c467f7508e863332063bb15f904a24..d3eb6adf9fa949fbd611470182a03c743b16aac7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1549,6 +1549,8 @@ static inline void get_page(struct page *page)
 	struct folio *folio = page_folio(page);
 	if (WARN_ON_ONCE(folio_test_slab(folio)))
 		return;
+	if (WARN_ON_ONCE(folio_test_large_kmalloc(folio)))
+		return;
 	folio_get(folio);
 }
 
@@ -1643,7 +1645,7 @@ static inline void put_page(struct page *page)
 {
 	struct folio *folio = page_folio(page);
 
-	if (folio_test_slab(folio))
+	if (folio_test_slab(folio) || folio_test_large_kmalloc(folio))
 		return;
 
 	folio_put(folio);
diff --git a/mm/slub.c b/mm/slub.c
index dc9e729e1d269b5d362cb5bc44f824640ffd00f3..d7a62063a1676a327e13536bf724f0160f1fc8dc 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -4281,8 +4281,11 @@ static void *___kmalloc_large_node(size_t size, gfp_t flags, int node)
 	if (unlikely(flags & GFP_SLAB_BUG_MASK))
 		flags = kmalloc_fix_flags(flags);
 
+	if (node == NUMA_NO_NODE)
+		node = numa_mem_id();
+
 	flags |= __GFP_COMP;
-	folio = (struct folio *)alloc_pages_node_noprof(node, flags, order);
+	folio = (struct folio *)__alloc_frozen_pages_noprof(flags, order, node, NULL);
 	if (folio) {
 		ptr = folio_address(folio);
 		lruvec_stat_mod_folio(folio, NR_SLAB_UNRECLAIMABLE_B,
@@ -4778,7 +4781,7 @@ static void free_large_kmalloc(struct folio *folio, void *object)
 	lruvec_stat_mod_folio(folio, NR_SLAB_UNRECLAIMABLE_B,
 			      -(PAGE_SIZE << order));
 	__folio_clear_large_kmalloc(folio);
-	folio_put(folio);
+	free_frozen_pages(&folio->page, order);
 }
 
 /*

-- 
2.49.0

