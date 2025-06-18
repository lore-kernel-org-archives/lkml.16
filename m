Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5471DDC28
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750239489; cv=none; b=bGwhiGxqcmsFelwv2hMiC357U4aWqglrW5esHFhBXiCLFOz+33AUT58P/3Z0N3//k6V2JzfwOwFZH1wzFaxdfJK5YaR3mtzRUDA1eRmFSeISAdJGVeXCPJvMaGv9okLG6e9U1tyn+OFuLFRkm4t7wiBdcuOQUXR/umhgqN8Ns1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750239489; c=relaxed/simple;
	bh=/GLIv0zCJc3UKNsBmZy3RMrTs3+c4Inr6m8eli1mI3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lyGW+gGc4HynqswIdAWcFe9pfQCnRIFw2cOBeZ1H2k2fxyWe9tc9JMHlVE1sTg7kyI0ih21J2QK/dd7pU/0uyL69BYWleLV97M75ieePyiMdfevpUwzd5z6X4svZ7i6jSj6LsLFlUJBqQKtGVoWDxm+smaNJ2ncnrEvU9ZSQF8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=EnNlvdeE; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=gKZ6sPko; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ilO2tgpH; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=g8DNsxqk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="EnNlvdeE";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="gKZ6sPko";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ilO2tgpH";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="g8DNsxqk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C40182116E;
	Wed, 18 Jun 2025 09:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750239480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+PkWLIggAFbYYMkCfHKFv+TTI3PWYDAMRmo1BUIYhMc=;
	b=EnNlvdeEux/SqCm2e22a5w6PYD1PKKv7QbiZegR9+woINwCfF9gnAom3voUpfvXem9frzm
	K6bmaOBd5NgF37HukKIJTxgIfifAOoIVG3edchGHz46GkaA4OJJmCMGKhKDNzAwMsSYcnc
	mH2RC5/9l+zGWZvqvwbe0O1+zU3sJ14=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750239480;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+PkWLIggAFbYYMkCfHKFv+TTI3PWYDAMRmo1BUIYhMc=;
	b=gKZ6sPkoriHmLuV5jI6Wvfk0kaaitQaG+pvidxhVqJUDIxwuZ4v/OntCMp7jXN+weoHYnt
	Eg3+8Ip/qx/ZUICg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750239478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+PkWLIggAFbYYMkCfHKFv+TTI3PWYDAMRmo1BUIYhMc=;
	b=ilO2tgpHYrddG20QqCEbJWrPIdQiYQv9fm3XAX48S7QR8B58Qyu7Afw9UTnQzBCsmq/tZw
	hVX+/wtzjUuvKBpgDYOxKum7hKAXq1IHsvPw648J1cx9BIgQwEpPjas91LbWWcWo65umXM
	Qu5ACAOb4RjqLhi3X8JqW24MyzcdwBk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750239478;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+PkWLIggAFbYYMkCfHKFv+TTI3PWYDAMRmo1BUIYhMc=;
	b=g8DNsxqkQdnml2L2a3hkrb/D+ILgZP955aBp0bO92CQgTJKAii44lRV60IHYkmEBlcCK5z
	L/gLfs/KvF7t7XDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B44AE13A99;
	Wed, 18 Jun 2025 09:37:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vQLUK/aIUmjqHQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 18 Jun 2025 09:37:58 +0000
Message-ID: <f7ea4fc4-999a-490d-b221-b3b935e4b1bb@suse.cz>
Date: Wed, 18 Jun 2025 11:39:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Inline vma_needs_copy
To: Yunshui Jiang <jiangyunshui@kylinos.cn>, linux-kernel@vger.kernel.org,
 linux-mm@vack.org
Cc: akpm@linux-foundation.org, david@redhat.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com
References: <20250618014209.1195734-1-jiangyunshui@kylinos.cn>
From: Vlastimil Babka <vbabka@suse.cz>
Content-Language: en-US
In-Reply-To: <20250618014209.1195734-1-jiangyunshui@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,suse.cz:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

On 6/18/25 3:42 AM, Yunshui Jiang wrote:
> From: jiangyunshui <jiangyunshui@kylinos.cn>
> 
> Since commit bcd51a3c679d ("hugetlb: lazy page table copies
> in fork()"), the logic about judging whether to copy
> page table inside func copy_page_range has been extracted
> into a separate func vma_needs_copy. While this change
> improves code readability, it also incurs more function call
> overhead, especially where fork() were frequently called.
> 
> Inline func vma_needs_copy to optimize the copy_page_range
> performance. Given that func vma_needs_copy is only called
> by copy_page_range, inlining it would not cause unacceptable
> code bloat.

I'm surprised the compiler doesn't inline it already, if there's a
single caller. In fact, mine (gcc-14.3 on x86) already does.

So I wonder to which extent should we force override wrong compiler
heuristics? Maybe just inline instead of __always_inline would be OK? Is
that enough of a hint for your compiler?

> Testing was done with the byte-unixbench spawn benchmark
> (which frequently calls fork). I measured 1.7% improvement
> on x86 and 1.8% improvement on arm64.
> 
> Signed-off-by: jiangyunshui <jiangyunshui@kylinos.cn>
> ---
>  mm/memory.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 8eba595056fe..d15b07f96ab1 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1337,7 +1337,7 @@ copy_p4d_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>   * false when we can speed up fork() by allowing lazy page faults later until
>   * when the child accesses the memory range.
>   */
> -static bool
> +static __always_inline bool
>  vma_needs_copy(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>  {
>  	/*

