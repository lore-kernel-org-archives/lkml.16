Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139B417A2FA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 13:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743429507; cv=none; b=YKynsgeJFrrjOwsSZtFE7eaulJ3mvS2vwaSEBW/yFqtDjuELumb/f1j/WCllE2Ixeg9xPTtVFMdya+MfePZP8tTh34U6f9O2ZtuXSF0R3H4N1qOi8ggYOTQh3+v5nWEm6yE8FR/fTWxs2/Qij2pYJug2L8chtFjVSYzumJmIlqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743429507; c=relaxed/simple;
	bh=1DGqYgEKcI3fsbdS8qCMhNVzJksyfF2GZ24jJwZJHkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDVjzkI/vZOYEYF0B5G/qhTlY5Htrrpe9dpNgRZqhCzbv/YiwO0V2QSm946UZchJDGiBRlrNSlH5YVpZwr6Q+x/+W5yS4NY6CDaS6I+YwubckXRW974QfSfvTkkpUFmTowEdm/2FPktB++pgr1VyhDwETjdUc/1Bza8XZ1ZDGV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iUzDv+6W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bGVkSEoU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iUzDv+6W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bGVkSEoU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iUzDv+6W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bGVkSEoU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iUzDv+6W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bGVkSEoU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 211831F458;
	Mon, 31 Mar 2025 13:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743429504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gR2eG5Gz0Mv8msXm7oWLAR3PaRg58Ziw901xa1Ad1TM=;
	b=iUzDv+6WWYCQw3dPavZAozp3UZM07RB7jGJtXLIKbTc+WJkb10fAY8qwMQaeiKoVerjfJn
	1qesxvw21c4dVla5Lf/NemsSlF0o3feAuuZExTOWztQLb3O08M8jdjbsg1npYoi1SA/bqR
	3DwnQcVtN+T3vTS6xuHdELST0dSBhcI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743429504;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gR2eG5Gz0Mv8msXm7oWLAR3PaRg58Ziw901xa1Ad1TM=;
	b=bGVkSEoUPPTsBu6Lkr+76ErUt1WH8ia+g9DIKQHOHm457+II+mV1QuWzPQX80ITZj+NPd8
	pjrTFGEHRh9RJ8Dw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iUzDv+6W;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bGVkSEoU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743429504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gR2eG5Gz0Mv8msXm7oWLAR3PaRg58Ziw901xa1Ad1TM=;
	b=iUzDv+6WWYCQw3dPavZAozp3UZM07RB7jGJtXLIKbTc+WJkb10fAY8qwMQaeiKoVerjfJn
	1qesxvw21c4dVla5Lf/NemsSlF0o3feAuuZExTOWztQLb3O08M8jdjbsg1npYoi1SA/bqR
	3DwnQcVtN+T3vTS6xuHdELST0dSBhcI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743429504;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gR2eG5Gz0Mv8msXm7oWLAR3PaRg58Ziw901xa1Ad1TM=;
	b=bGVkSEoUPPTsBu6Lkr+76ErUt1WH8ia+g9DIKQHOHm457+II+mV1QuWzPQX80ITZj+NPd8
	pjrTFGEHRh9RJ8Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C99D313A1F;
	Mon, 31 Mar 2025 13:58:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MmhmLn+f6meqLAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 31 Mar 2025 13:58:23 +0000
Date: Mon, 31 Mar 2025 15:58:22 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Baoquan He <bhe@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] mm/gup: Fix the outdated code comments above
 get_user_pages_unlocked()
Message-ID: <Z-qfflDA8pEn7HZ5@localhost.localdomain>
References: <20250330121718.175815-1-bhe@redhat.com>
 <20250330121718.175815-4-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330121718.175815-4-bhe@redhat.com>
X-Rspamd-Queue-Id: 211831F458
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On Sun, Mar 30, 2025 at 08:17:13PM +0800, Baoquan He wrote:
> Since commit f0818f472d8d ("mm: gup: add get_user_pages_locked
> and get_user_pages_unlocked"), get_user_pages() doesn't need to have
> mmap_lock held anymore. It calls __get_user_pages_locked() which
> can acquire and drop the mmap_lock internaly.

Yes, __get_user_pages_locked() can aquire and drop the lock, but AFAICS
get_user_pages() always calls __get_user_pages_locked() with locked=1,
which means that is holding the lock, right?

> Hence remove the incorrect code comments now.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  mm/gup.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 8788105daee8..3345a065c2cb 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2702,19 +2702,9 @@ long get_user_pages(unsigned long start, unsigned long nr_pages,
>  EXPORT_SYMBOL(get_user_pages);
>  
>  /*
> - * get_user_pages_unlocked() is suitable to replace the form:
> - *
> - *      mmap_read_lock(mm);
> - *      get_user_pages(mm, ..., pages, NULL);
> - *      mmap_read_unlock(mm);
> - *
> - *  with:
> - *
> - *      get_user_pages_unlocked(mm, ..., pages);
> - *
> - * It is functionally equivalent to get_user_pages_fast so
> - * get_user_pages_fast should be used instead if specific gup_flags
> - * (e.g. FOLL_FORCE) are not required.
> + * get_user_pages_unlocked() is functionally equivalent to
> + * get_user_pages_fast so get_user_pages_fast should be used instead
> + * if specific gup_flags (e.g. FOLL_FORCE) are not required.
>   */
>  long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
>  			     struct page **pages, unsigned int gup_flags)
> -- 
> 2.41.0
> 
> 

-- 
Oscar Salvador
SUSE Labs
