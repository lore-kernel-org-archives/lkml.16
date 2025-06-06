Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED528289362
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 13:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749218399; cv=none; b=RoJN4CurB4D8u31iUs5l1+mFRvPD4b85xcqyb6REcj6lV1MT6tvOhFMmtX72stH4TkDyHt0/NQmDHbGBcmXcBPfyQekVPQ0QTFIaq5X6+wUTcJj3MnKovtQ5fzZlLeijw+r8eNXUFMmTBx0w/i45y52pKs3/8hBy6kjGID/GtPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749218399; c=relaxed/simple;
	bh=LV8m1IqOpB2LBObXMZpR34Lyt37fiij8J4QaTlaQOVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQtYPpWqWJ6PvzJW1ZxU5UHVcmzmqzJzqN0S9LilG+tgK16OPNUPh7yi6dLC/e6UJWHKmMmTvnSpmYgn+o39PZ5Kdp/DKXKWZy0wnHr3MW9VrQQpkO1TX0gfBnUQL6A+C6fpfDAh6mBXcPBa/WVJCKCBcFkRTsX/URvgoqrIHx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RPniiSvw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IO0LzPk6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ajwWj5wR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KqtLDMWm; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RPniiSvw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IO0LzPk6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ajwWj5wR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KqtLDMWm"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E95EF336A1;
	Fri,  6 Jun 2025 13:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749218396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jo8YNOz40hlh2OYeYB2Ua7DhuadBgtsPAMk95xtqrbI=;
	b=RPniiSvwXsID+Kbr15bqnDABhowfSWAmYHazHxAay+Ig59ZcJ4Ol0muvB3zF3B0q4dzK2W
	5dBxCevc4D5TpUSDXDmGGg6rhcTTealpexHkcWNhCIGVn7BdxziDhQSqKb2Um4+lcB0SaN
	skKWYYCMSS0Hs0zdxG9bZ08Aw77FpNc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749218396;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jo8YNOz40hlh2OYeYB2Ua7DhuadBgtsPAMk95xtqrbI=;
	b=IO0LzPk6DUAw2KgzeoxbMuKoYLWH1p/YOUuvkGtgvJ1HEZGxasBo8Br8cFqEMTdWnq5Wzk
	XGWXE+aAEbavq4Dw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749218395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jo8YNOz40hlh2OYeYB2Ua7DhuadBgtsPAMk95xtqrbI=;
	b=ajwWj5wRLrZSPt9Tyis80l3hrZfZ19XhM4xWUUVBDNnOZukzEknGdMclxtYuvkYd8b+ICe
	FcvJbxpM1wpVmS7vEOuuvl3S7yhGNMdOtGs+cu77Rb5HZOm+yGA2LZ03Pj6CBlQGQCx9wA
	Db1/dLYd0bnUFTQOQZyp2LKe72DMd0A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749218395;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jo8YNOz40hlh2OYeYB2Ua7DhuadBgtsPAMk95xtqrbI=;
	b=KqtLDMWmvtBL0jNGOYzzHMH4Qgyv/xouKGyRY4n7eyt0f/kYnIFcz5dtTJ9xHqwHfHcX3D
	ewaGjhP9UVhIlGBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 723811336F;
	Fri,  6 Jun 2025 13:59:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id k8PUGFv0Qmg6CwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 06 Jun 2025 13:59:55 +0000
Date: Fri, 6 Jun 2025 14:59:53 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/vma: reset VMA iterator on commit_merge() OOM failure
Message-ID: <my6v4d5ytsivvw4yloyutafscahbctetvpkqok42flusbgklx4@ixm6kcgihkbv>
References: <20250606125032.164249-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606125032.164249-1-lorenzo.stoakes@oracle.com>
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.80

On Fri, Jun 06, 2025 at 01:50:32PM +0100, Lorenzo Stoakes wrote:
> While an OOM failure in commit_merge() isn't really feasible due to the
> allocation which might fail (a maple tree pre-allocation) being 'too small
> to fail', we do need to handle this case correctly regardless.
> 
> In vma_merge_existing_range(), we can theoretically encounter failures
> which result in an OOM error in two ways - firstly dup_anon_vma() might
> fail with an OOM error, and secondly commit_merge() failing, ultimately, to
> pre-allocate a maple tree node.
> 
> The abort logic for dup_anon_vma() resets the VMA iterator to the initial
> range, ensuring that any logic looping on this iterator will correctly
> proceed to the next VMA.
> 
> However the commit_merge() abort logic does not do the same thing. This
> resulted in a syzbot report occurring because mlockall() iterates through
> VMAs, is tolerant of errors, but ended up with an incorrect previous VMA
> being specified due to incorrect iterator state.
> 
> While making this change, it became apparent we are duplicating logic - the
> logic introduced in commit 41e6ddcaa0f1 ("mm/vma: add give_up_on_oom option
> on modify/merge, use in uffd release") duplicates the vmg->give_up_on_oom
> check in both abort branches.
> 
> Additionally, we observe that we can perform the anon_dup check safely on
> dup_anon_vma() failure, as this will not be modified should this call fail.
> 
> Finally, we need to reset the iterator in both cases, so now we can simply
> use the exact same code to abort for both.
> 
> We remove the VM_WARN_ON(err != -ENOMEM) as it would be silly for this to
> be otherwise and it allows us to implement the abort check more neatly.
> 
> Reported-by: syzbot+d16409ea9ecc16ed261a@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/linux-mm/6842cc67.a00a0220.29ac89.003b.GAE@google.com/
> Fixes: 47b16d0462a4 ("mm: abort vma_modify() on merge out of memory failure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

> ---
>  mm/vma.c | 22 ++++------------------
>  1 file changed, 4 insertions(+), 18 deletions(-)

Neat cleanup, thanks!

-- 
Pedro
