Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B3EA55
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 08:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745829673; cv=none; b=sQvzL8SS7ORtGOzGO9rZHFM9eqtbXtAmxNUchyRO3Wpnk9NcY1ZR9S9B6f7Gl9I7B0oU2EdtWTvu1aNFYVxN0TUkqeOMrB6dL/6jUE1FtcJwWrZPTCck3Hk7IfQoFMPWLfToxVJfLpTTgAO61RUCGsSuPIngIAMLvHXsxrYrgRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745829673; c=relaxed/simple;
	bh=cL7bR2zop3GnlYbtEOdZY/AmyDRrvlYj0RG2eKxgQEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIv32G/+6dL9k6CqmLIJ6eMgKPEXuGiFU+VD1XI6MX4O0Yr6ZtOMpFCNmZtFqkaiZ+pdvi8oZUDX+5NYOIAqS3CFP7NM9UNq0ETA6yQc9kue3UfRlYnnUvjofRzteh/doo67v9AJUaLsGVULWjo2xWv33m32JS+f6eyhgvOyZ+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fCwm9u2Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z/6feikP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fCwm9u2Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z/6feikP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fCwm9u2Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z/6feikP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fCwm9u2Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z/6feikP"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A4468211C8;
	Mon, 28 Apr 2025 08:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745829669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dkIuHorMAvwyWoY/n9Pgo+WNDIUK1UIKrpGq2464Y8w=;
	b=fCwm9u2Qi06O1HEnBz51W+hVr82k8HZ3DT1CmlLzUmiCuBTTdJ9gPxKf66Hnl8c0nxU0HH
	bNa8t65CB9xjhFgfTy9cBJrTErhtnIqhLT/CUhifq3uCYONLyK94YhfkJWgADvsXirEt1t
	4Yjq4oj8weXwO8wVFuCWBQvR3FCoZF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745829669;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dkIuHorMAvwyWoY/n9Pgo+WNDIUK1UIKrpGq2464Y8w=;
	b=Z/6feikPRoZ2CoK16WNHpxQ5vlgSeZN4mh6zeM2At1+UQqHb7BcA/0tmFKnki/6qFeUDS1
	g3o02hu+xnUHzLDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745829669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dkIuHorMAvwyWoY/n9Pgo+WNDIUK1UIKrpGq2464Y8w=;
	b=fCwm9u2Qi06O1HEnBz51W+hVr82k8HZ3DT1CmlLzUmiCuBTTdJ9gPxKf66Hnl8c0nxU0HH
	bNa8t65CB9xjhFgfTy9cBJrTErhtnIqhLT/CUhifq3uCYONLyK94YhfkJWgADvsXirEt1t
	4Yjq4oj8weXwO8wVFuCWBQvR3FCoZF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745829669;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dkIuHorMAvwyWoY/n9Pgo+WNDIUK1UIKrpGq2464Y8w=;
	b=Z/6feikPRoZ2CoK16WNHpxQ5vlgSeZN4mh6zeM2At1+UQqHb7BcA/0tmFKnki/6qFeUDS1
	g3o02hu+xnUHzLDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F328913A25;
	Mon, 28 Apr 2025 08:41:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id q+TLOCQ/D2jbBgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 28 Apr 2025 08:41:08 +0000
Date: Mon, 28 Apr 2025 10:41:03 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Wupeng Ma <mawupeng1@huawei.com>
Cc: akpm@linux-foundation.org, mike.kravetz@oracle.com, david@redhat.com,
	joshua.hahnjy@gmail.com, muchun.song@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: hugetlb: Fix incorrect fallback for subpool
Message-ID: <aA8_H-sNZh_sNBvF@localhost.localdomain>
References: <20250410062633.3102457-1-mawupeng1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410062633.3102457-1-mawupeng1@huawei.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,oracle.com,redhat.com,gmail.com,linux.dev,kvack.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,suse.de:email]
X-Spam-Score: -2.80
X-Spam-Flag: NO

On Thu, Apr 10, 2025 at 02:26:33PM +0800, Wupeng Ma wrote:
> During our testing with hugetlb subpool enabled, we observe that
> hstate->resv_huge_pages may underflow into negative values. Root cause
> analysis reveals a race condition in subpool reservation fallback handling
> as follow:
> 
> hugetlb_reserve_pages()
>     /* Attempt subpool reservation */
>     gbl_reserve = hugepage_subpool_get_pages(spool, chg);
> 
>     /* Global reservation may fail after subpool allocation */
>     if (hugetlb_acct_memory(h, gbl_reserve) < 0)
>         goto out_put_pages;
> 
> out_put_pages:
>     /* This incorrectly restores reservation to subpool */
>     hugepage_subpool_put_pages(spool, chg);
> 
> When hugetlb_acct_memory() fails after subpool allocation, the current
> implementation over-commits subpool reservations by returning the full
> 'chg' value instead of the actual allocated 'gbl_reserve' amount. This
> discrepancy propagates to global reservations during subsequent releases,
> eventually causing resv_huge_pages underflow.
> 
> This problem can be trigger easily with the following steps:
> 1. reverse hugepage for hugeltb allocation
> 2. mount hugetlbfs with min_size to enable hugetlb subpool
> 3. alloc hugepages with two task(make sure the second will fail due to
>    insufficient amount of hugepages)
> 4. with for a few seconds and repeat step 3 which will make
>    hstate->resv_huge_pages to go below zero.
> 
> To fix this problem, return corrent amount of pages to subpool during the
> fallback after hugepage_subpool_get_pages is called.
> 
> Fixes: 1c5ecae3a93f ("hugetlbfs: add minimum size accounting to subpools")
> Signed-off-by: Wupeng Ma <mawupeng1@huawei.com>
> Tested-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
