Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254AE24A07A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 18:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749581512; cv=none; b=EKJgV6RNCKIyLzOlf2Jb4ruTjTJ9LTfDOluud4mIXyyNRF/rpvfJVHHyu8sB+An6TS729F/ruNaW9RAzG/vHEgC4CIQGGj8+ZqYf2acwO7oss6e55DXFg9vV08e4qzzlhmkL+V36sCA8WwjV/B8qDf60pg803CwlFPj7jfV2lUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749581512; c=relaxed/simple;
	bh=LA9Qk4SdWa9X4tlsVdBIe1GqEScGKDmIKhA7TdPco6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWhgG7wIdLI2DxvnGxRO+f6+h1dgyNStd77NGGphM1KAnKuuwgCV79dzuvEfZ7w9kjc3+WgenslBtajdvhURHhHxXfqQuB5bX350KOvp8unGwnLZSv+My8d27DVlaYllBSN9//e2zyG8J7jmJ2doypcGS9Sv+aYOXFWWR9F/TRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FhWmBNK4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TrA3Wn1u; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QilBw13s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Hd6gaiD4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FhWmBNK4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TrA3Wn1u";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QilBw13s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hd6gaiD4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C4ABF1F76C;
	Tue, 10 Jun 2025 18:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749581508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7mQHH+vhumL7j1yn5CjeuyhPzB/xFc8OjZKcCfAnLSY=;
	b=FhWmBNK4SlsBAz0cGHhQXWDUjYxTVy7wxoteIKaXh83YDzH3Dc06mfj/I7iOF4yrScpW3D
	Orfb9VJ5rsHF0CwNgxj8vTtCNoPAJsDtjOJA2SDvJgyUrt/MVnKAAORjF0Mt4NbE8jzcOY
	VxngHvqMQVwj8zvXW+ipspyTaGFtDi0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749581508;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7mQHH+vhumL7j1yn5CjeuyhPzB/xFc8OjZKcCfAnLSY=;
	b=TrA3Wn1u32KhOgjGEFyTfYktr6z8wooevRmrvqQ33bnMyGDwIyPaI+saRKZ9p9zANPaSes
	T89BUBHRZUaUjqDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QilBw13s;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Hd6gaiD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749581507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7mQHH+vhumL7j1yn5CjeuyhPzB/xFc8OjZKcCfAnLSY=;
	b=QilBw13srQbiscx39rJPkukhgkxO34+Pa4ggEZTdpAZrs+7dWVjRhHk182x+kN5tyjIhKr
	5f59F1LxTvX5I7R5oXRTNm6rvApahCi0KQl50f+9PjX1/T3GlZJN98deIsyxJ7R2DgZ69l
	Al1uiNiTNIxxA//P83GsoJNhLTTbwew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749581507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7mQHH+vhumL7j1yn5CjeuyhPzB/xFc8OjZKcCfAnLSY=;
	b=Hd6gaiD4/7foGkYjndKWD+wby1+yyE0adoLeu1wrGZqiFwcN+jHL83wjp3ATzhbXbnr4ny
	GSbSlg9HlHzbHTCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76667139E2;
	Tue, 10 Jun 2025 18:51:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ajdFGsN+SGjqDAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 10 Jun 2025 18:51:47 +0000
Date: Tue, 10 Jun 2025 20:51:45 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Hu Song <husong@kylinos.cn>
Cc: muchun.song@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hugetlbfs:inode: initialize 'error' variable at
 definition to reduce code redundancy
Message-ID: <aEh-wRb_j5seV2Iz@localhost.localdomain>
References: <20250609065615.108240-1-husong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609065615.108240-1-husong@kylinos.cn>
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,localhost.localdomain:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: C4ABF1F76C
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.51

On Mon, Jun 09, 2025 at 02:56:15PM +0800, Hu Song wrote:
> Initialize the error variable to -ENOMEM at definition in
> init_hugetlbfs_fs().This removes the need for a separate
> initialization later and makes the code slightly more concise,
> while still preserving the original logic.
> No functional change intended.
> 
> Signed-off-by: Hu Song <husong@kylinos.cn>
> ---
>  fs/hugetlbfs/inode.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index e4de5425838d..390cddd5872c 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -1600,7 +1600,7 @@ static int __init init_hugetlbfs_fs(void)
>  {
>  	struct vfsmount *mnt;
>  	struct hstate *h;
> -	int error;
> +	int error = -ENOMEM;
>  	int i;
>  
>  	if (!hugepages_supported()) {
> @@ -1608,7 +1608,6 @@ static int __init init_hugetlbfs_fs(void)
>  		return -ENOTSUPP;
>  	}
>  
> -	error = -ENOMEM;
>  	hugetlbfs_inode_cachep = kmem_cache_create("hugetlbfs_inode_cache",
>  					sizeof(struct hugetlbfs_inode_info),
>  					0, SLAB_ACCOUNT, init_once);

Uhmf, I do not know. 

Often, we tend to use those declarations in order to mark what error
code we will return if we fail the next operationg. E.g:

  error = -ENOMEM
  if (try_to_allocate)
    goto out;
 
  error = -EINVAL
  if (check_params)
    goto out;
 
 out:
  return error

No really strong opinion here, but I'd vote for leave it as is?


-- 
Oscar Salvador
SUSE Labs
