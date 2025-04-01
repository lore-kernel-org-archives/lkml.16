Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBF2207658
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743520956; cv=none; b=jP3HDUqrM/VNwYzUuJvqtHa5fuuBVptNMf1ID0xIguPhpvbTRLiRNM9xCI2U9pehiFHOcN6vMK7ucVd3OcNoESbXRBxQpLWhllDyLjdmYWQplKWssDI+vtUAVZXLHq3m3WKkB6iiMadhss687Y+kycPFvUoRopfmJIOMwSYKq/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743520956; c=relaxed/simple;
	bh=r0HUfnvrGuNXBkU8f4JgPPyejXbQ+55BCOXyLiRiJKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XGIH/08QwN6xoQy8PSiKzfOma7458q17YZ+1qbGqk6r6GviJOTdhP7RmRrDOG0lTtx1hSk/zJQvZO8wUzL9ASxPn9KOEjSxaBP9nT2SXgCdI54LLm+Nk9l5rl+FaYPbIepe1hvpbWFC1e9Kqo4Y21RuJFhpmKn/tT7g1yzf9Tks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=U0z/v+QN; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=zjZdp7Qd; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=U0z/v+QN; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=zjZdp7Qd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="U0z/v+QN";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="zjZdp7Qd";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="U0z/v+QN";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="zjZdp7Qd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0F7421F38E;
	Tue,  1 Apr 2025 15:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743520953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rhM+w/8fgX8obEXBtvlqnSEmhlWyjfAXaHU7wQ05dyY=;
	b=U0z/v+QNLV3MdTMicBbuEKeB0W6IIgSEy5cnHEZojVqKn70H6SddH3fMm2roLyhy1Hh8IW
	wrfAKEl3dxekHdJl1w7QqvbdB3wnai3j8vsVdazroxLbnNfdJYs9W6m3FFKRGEE0jTN+YV
	RiBhoQYj5gczWJLLJZUWjS/E457cANc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743520953;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rhM+w/8fgX8obEXBtvlqnSEmhlWyjfAXaHU7wQ05dyY=;
	b=zjZdp7QdPESKg4IOQPyImgEm0Ol+stKDCJ/3lxvlg72oGJ5mER2Q25rxXdoB3PEtmGRWib
	+gfTK746Bbc938BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743520953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rhM+w/8fgX8obEXBtvlqnSEmhlWyjfAXaHU7wQ05dyY=;
	b=U0z/v+QNLV3MdTMicBbuEKeB0W6IIgSEy5cnHEZojVqKn70H6SddH3fMm2roLyhy1Hh8IW
	wrfAKEl3dxekHdJl1w7QqvbdB3wnai3j8vsVdazroxLbnNfdJYs9W6m3FFKRGEE0jTN+YV
	RiBhoQYj5gczWJLLJZUWjS/E457cANc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743520953;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rhM+w/8fgX8obEXBtvlqnSEmhlWyjfAXaHU7wQ05dyY=;
	b=zjZdp7QdPESKg4IOQPyImgEm0Ol+stKDCJ/3lxvlg72oGJ5mER2Q25rxXdoB3PEtmGRWib
	+gfTK746Bbc938BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB28C13691;
	Tue,  1 Apr 2025 15:22:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5C8NObgE7GdXeAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 01 Apr 2025 15:22:32 +0000
Message-ID: <b2c07fdf-5ab1-4a65-9ce2-38638b7c718e@suse.cz>
Date: Tue, 1 Apr 2025 17:22:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lib/iov_iter: fix to increase non slab folio refcount
Content-Language: en-US
To: Sheng Yong <shengyong2021@gmail.com>, akpm@linux-foundation.org,
 willy@infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@archiver.kernel.org,
 Sheng Yong <shengyong1@xiaomi.com>
References: <20250401144712.1377719-1-shengyong1@xiaomi.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250401144712.1377719-1-shengyong1@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,linux-foundation.org,infradead.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On 4/1/25 16:47, Sheng Yong wrote:
> From: Sheng Yong <shengyong1@xiaomi.com>
> 
> When testing EROFS file-backed mount over v9fs on qemu, I encountered
> a folio UAF issue. The page sanity check reports the following call
> trace. The root cause is that pages in bvec are coalesced across a folio
> bounary. The refcount of all non-slab folios should be increased to
> ensure p9_releas_pages can put them correctly.
> 
> BUG: Bad page state in process md5sum  pfn:18300
> page: refcount:0 mapcount:0 mapping:00000000d5ad8e4e index:0x60 pfn:0x18300
> head: order:0 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> aops:z_erofs_aops ino:30b0f dentry name(?):"GoogleExtServicesCn.apk"
> flags: 0x100000000000041(locked|head|node=0|zone=1)
> raw: 0100000000000041 dead000000000100 dead000000000122 ffff888014b13bd0
> raw: 0000000000000060 0000000000000020 00000000ffffffff 0000000000000000
> head: 0100000000000041 dead000000000100 dead000000000122 ffff888014b13bd0
> head: 0000000000000060 0000000000000020 00000000ffffffff 0000000000000000
> head: 0100000000000000 0000000000000000 ffffffffffffffff 0000000000000000
> head: 0000000000000010 0000000000000000 00000000ffffffff 0000000000000000
> page dumped because: PAGE_FLAGS_CHECK_AT_FREE flag(s) set
> Call Trace:
>  dump_stack_lvl+0x53/0x70
>  bad_page+0xd4/0x220
>  __free_pages_ok+0x76d/0xf30
>  __folio_put+0x230/0x320
>  p9_release_pages+0x179/0x1f0
>  p9_virtio_zc_request+0xa2a/0x1230
>  p9_client_zc_rpc.constprop.0+0x247/0x700
>  p9_client_read_once+0x34d/0x810
>  p9_client_read+0xf3/0x150
>  v9fs_issue_read+0x111/0x360
>  netfs_unbuffered_read_iter_locked+0x927/0x1390
>  netfs_unbuffered_read_iter+0xa2/0xe0
>  vfs_iocb_iter_read+0x2c7/0x460
>  erofs_fileio_rq_submit+0x46b/0x5b0
>  z_erofs_runqueue+0x1203/0x21e0
>  z_erofs_readahead+0x579/0x8b0
>  read_pages+0x19f/0xa70
>  page_cache_ra_order+0x4ad/0xb80
>  filemap_readahead.isra.0+0xe7/0x150
>  filemap_get_pages+0x7aa/0x1890
>  filemap_read+0x320/0xc80
>  vfs_read+0x6c6/0xa30
>  ksys_read+0xf9/0x1c0
>  do_syscall_64+0x9e/0x1a0
>  entry_SYSCALL_64_after_hwframe+0x71/0x79
> 
> Fixes: b9c0e49abfca ("mm: decline to manipulate the refcount on a slab page")

Sigh. That went to v6.14

mm-hotfixes and Cc: stable then?

> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz>

Thanks.

> ---
>  lib/iov_iter.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> ---
> v2:
>   * update commit message
>   * update coding style
> 
> diff --git a/lib/iov_iter.c b/lib/iov_iter.c
> index 8c7fdb7d8c8f..bc9391e55d57 100644
> --- a/lib/iov_iter.c
> +++ b/lib/iov_iter.c
> @@ -1191,7 +1191,7 @@ static ssize_t __iov_iter_get_pages_alloc(struct iov_iter *i,
>  			return -ENOMEM;
>  		p = *pages;
>  		for (int k = 0; k < n; k++) {
> -			struct folio *folio = page_folio(page);
> +			struct folio *folio = page_folio(page + k);
>  			p[k] = page + k;
>  			if (!folio_test_slab(folio))
>  				folio_get(folio);

