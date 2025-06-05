Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69CA1F956
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749132773; cv=none; b=hG+KiF6uKgEkVFUpJY+GmFRkRv+0kyMhRjlpfsYiKfH6pgUPVg5kcgxdA9CjbK88sJanl8ZBmq7zESm4WfTUblLkGUEC3/80GhljEjyDfKp1UfcmqF870aFvF75P+QhyWSVVW5F1K4rq5H5znu/ZAtxs99V3LgOZHSGm8MmszHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749132773; c=relaxed/simple;
	bh=iCgPu5pfYQJITjj/WtNvsoyc3dg8LybhViYUd6TFr5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W95zfVKN4zczjsNqA4NEnSDd6Fic8uvxLfxXBtXjwvXwKPos+xrpbxxSdvSRK2p7tTa8MpWdmFKewXnPaHgQxq65zYZ9sRLUbfbAHRXdHXEiy1McTXTTyONBo5jUSCxCUbRXYRgyhO5T4H3qJ/718FNNMihhhXrNfkQvyAu/nvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=tG71v4ea; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Pl346M3l; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=yVRUymOZ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9P9+I8da; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="tG71v4ea";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Pl346M3l";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="yVRUymOZ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9P9+I8da"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B9BF11FDFF;
	Thu,  5 Jun 2025 14:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749132769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=s1my+5sB9qYJQFz3d91MsXhWfhoHzIJlD1nQ1XwMkOs=;
	b=tG71v4eaFsDniFBbqTpPADMXC6WUsCNeC77f+uttb5Wp5dxq8MUBiea5IevvvKBateeryr
	GNMtUQqG59ytB8aN4bTsaIhh+fG296em3Oq1ByuV/XzTqtPMjI4ap9EoH/h22+kWfRKLMG
	LMkWPfarQgbEHYi+QhxCiY7PAB9HTHs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749132769;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=s1my+5sB9qYJQFz3d91MsXhWfhoHzIJlD1nQ1XwMkOs=;
	b=Pl346M3lLepoZwomUooSysc8nrx+IcxJS/2fe1Xk2NBIHRfjqRVj87m+DTq9Dxjgz6Hv+m
	+DUT+svdZVO9B0CQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=yVRUymOZ;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=9P9+I8da
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749132768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=s1my+5sB9qYJQFz3d91MsXhWfhoHzIJlD1nQ1XwMkOs=;
	b=yVRUymOZXbdjq53zhhR2SHnQ4pIq54X/mlKTfxTIgNJ3vOLFzvkUKx1d8z1T0hzJYq4NBO
	t3+a9rDTmsXVcyQuqqLuW3cjAYNfm6NgIy4i5ru1ej1mIImSrzGj6HrWfzfogopxljC8DC
	rTIal5AVNtf9DzcyHeKi9UvBlqXZG+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749132768;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=s1my+5sB9qYJQFz3d91MsXhWfhoHzIJlD1nQ1XwMkOs=;
	b=9P9+I8damNwrZy42cUnt+iwHQdiY7xerUBtq+LSZLqYWuYUfQDdnx6wCvPWyxERe/lloRy
	q6ZSTWFfYa0QfYDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9CAE3137FE;
	Thu,  5 Jun 2025 14:12:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QjroJeClQWi8QwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 05 Jun 2025 14:12:48 +0000
Message-ID: <452a0296-7cdc-474b-b751-0c6c498e4190@suse.cz>
Date: Thu, 5 Jun 2025 16:12:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: madvise: use walk_page_range_vma() instead of
 walk_page_range()
Content-Language: en-US
To: Barry Song <21cnbao@gmail.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 Barry Song <v-songbaohua@oppo.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Jann Horn <jannh@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra
 <lokeshgidra@google.com>, Dev Jain <dev.jain@arm.com>,
 Tangquan Zheng <zhengtangquan@oppo.com>
References: <20250605083144.43046-1-21cnbao@gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <20250605083144.43046-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kvack.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:mid,suse.cz:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,oracle.com:email,suse.de:email,arm.com:email];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B9BF11FDFF
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.51

On 6/5/25 10:31, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> We've already found the VMA within madvise_walk_vmas() before calling
> specific madvise behavior functions like madvise_free_single_vma().
> So calling walk_page_range() and doing find_vma() again seems
> unnecessary. It also prevents potential optimizations in those madvise
> callbacks, particularly the use of dedicated per-VMA locking.
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Jann Horn <jannh@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Lokesh Gidra <lokeshgidra@google.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

Thanks!

> @@ -1160,7 +1160,7 @@ static long madvise_guard_install(struct vm_area_struct *vma,
>  		unsigned long nr_pages = 0;
>  
>  		/* Returns < 0 on error, == 0 if success, > 0 if zap needed. */
> -		err = walk_page_range_mm(vma->vm_mm, start, end,
> +		err = walk_page_range_vma(vma, start, end,
>  					 &guard_install_walk_ops, &nr_pages);

Nit: breaks the parameter alignment. Do we care? It's Lorenzo's code so
maybe not ;P

>  		if (err < 0)
>  			return err;
> @@ -1244,7 +1244,7 @@ static long madvise_guard_remove(struct vm_area_struct *vma,
>  	if (!is_valid_guard_vma(vma, /* allow_locked = */true))
>  		return -EINVAL;
>  
> -	return walk_page_range(vma->vm_mm, start, end,
> +	return walk_page_range_vma(vma, start, end,
>  			       &guard_remove_walk_ops, NULL);

Same.

>  }
>  

