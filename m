Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B07D190664
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750752225; cv=none; b=b+9a6pmHRi1oYtYG6Qn3SaaZMElsNb22iuchmjxaGy2v5J885bLocFqHyyzpazQX1TaBKEiYE93Tup92KlCiafHhOIeBQkUv0KjKjZzg4k1SdzXddV530b4QlmOPLeabEHDqvZ9hho64/qB+hBDWbNGJwQ1RUaR5fZmqC3rCy5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750752225; c=relaxed/simple;
	bh=N13Vvfgk6uIEYUkh78j+Gyi4lSt9VB7lZnipeIZNiik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZzhZRSkzmZXrJ+Z/IcLqiSiwkSPOazNQTwhgcXU4RL8OxQtY5Rp8ek6pcuXNwrBp2T6cjSDp0Osil7WFbn3x/gkWIy2wIA9wPemhVfhuPj6eZf86v0FjuRcHFrdB2WJuYolTVxpTEAuLidRZ5g7ak0XN3Xe9HvbcZiXM9hQVwcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Pvf8JkME; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=WVM4Fiu9; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Pvf8JkME; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=WVM4Fiu9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Pvf8JkME";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="WVM4Fiu9";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Pvf8JkME";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="WVM4Fiu9"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 51E291F391;
	Tue, 24 Jun 2025 08:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750752222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mDm3LwFcZOO6ha/wtJmMM5uITa+RqW0seUgBJnFHcko=;
	b=Pvf8JkMEwTk4DqNFDPDFX7x+DxivtBFuvKGKCguRoqaH0TxJjaxDUfetpXdIG1y0aW59d9
	MZ+AlR/t2mg7v1yOY8PaKvAKcqBNfWpAj55v49vNSBEv4Exl79SusNsSc2jNXWpmxb/J+q
	GXD0dhJcYuhyIHr2Bj66487ozM9IWpM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750752222;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mDm3LwFcZOO6ha/wtJmMM5uITa+RqW0seUgBJnFHcko=;
	b=WVM4Fiu9sawSU1uBqSXgNMNGKqoxUlBsLK25IWmD+RvZkQk8U6fbznna0gTb1IERhOJgs7
	wtjo3AkimVVVlKAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750752222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mDm3LwFcZOO6ha/wtJmMM5uITa+RqW0seUgBJnFHcko=;
	b=Pvf8JkMEwTk4DqNFDPDFX7x+DxivtBFuvKGKCguRoqaH0TxJjaxDUfetpXdIG1y0aW59d9
	MZ+AlR/t2mg7v1yOY8PaKvAKcqBNfWpAj55v49vNSBEv4Exl79SusNsSc2jNXWpmxb/J+q
	GXD0dhJcYuhyIHr2Bj66487ozM9IWpM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750752222;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mDm3LwFcZOO6ha/wtJmMM5uITa+RqW0seUgBJnFHcko=;
	b=WVM4Fiu9sawSU1uBqSXgNMNGKqoxUlBsLK25IWmD+RvZkQk8U6fbznna0gTb1IERhOJgs7
	wtjo3AkimVVVlKAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A3B613751;
	Tue, 24 Jun 2025 08:03:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PDTcDd5bWmjcAQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 24 Jun 2025 08:03:42 +0000
Message-ID: <62c4045c-3881-4df2-8f36-109346c18e13@suse.cz>
Date: Tue, 24 Jun 2025 10:03:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] mm, madvise: simplify anon_name handling
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Colin Cross <ccross@google.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250623-anon_name_cleanup-v1-0-04c94384046f@suse.cz>
 <20250623-anon_name_cleanup-v1-1-04c94384046f@suse.cz>
 <7fd9d523-d331-498d-8b67-2b525c0de37d@lucifer.local>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <7fd9d523-d331-498d-8b67-2b525c0de37d@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

On 6/23/25 18:56, Lorenzo Stoakes wrote:
> On Mon, Jun 23, 2025 at 04:59:50PM +0200, Vlastimil Babka wrote:
> I think we can actually avoid this altogether... So we could separate this into two functions:
> 
> tatic int madvise_update_vma_anon_name(struct madvise_behavior *madv_behavior)
> {
> 	struct vm_area_struct *vma = madv_behavior->vma;
> 	VMA_ITERATOR(vmi, madv_behavior->mm, range->start);
> 	struct madvise_behavior_range *range = &madv_behavior->range;
> 	struct anon_vma_name *anon_name = madv_behavior->anon_name;
> 
> 	if (anon_vma_name_eq(anon_vma_name(vma), anon_name))
> 		rturn 0;
> 
> 	vma = vma_modify_flags_name(&vmi, madv_behavior->prev, vma,
> 			range->start, range->end, vma->vm_flags, anon_name);
> 	if (IS_ERR(vma))
> 		return PTR_ERR(vma);
> 
> 	madv_behavior->vma = vma;
> 
> 	/* vm_flags is protected by the mmap_lock held in write mode. */
> 	vma_start_write(vma);
> 	return replace_anon_vma_name(vma, anon_name);
> }
> 
> /*
>  * Update the vm_flags and/or anon_name on region of a vma, splitting it or
>  * merging it as necessary. Must be called with mmap_lock held for writing.
>  */
> static int madvise_update_vma(vm_flags_t new_flags,
> 		struct madvise_behavior *madv_behavior)
> {
> 	struct vm_area_struct *vma = madv_behavior->vma;
> 	struct madvise_behavior_range *range = &madv_behavior->range;
> 	VMA_ITERATOR(vmi, madv_behavior->mm, range->start);
> 
> 	if (new_flags == vma->vm_flags)
> 		return 0;
> 
> 	vma = vma_modify_flags(&vmi, madv_behavior->prev, vma,
> 			range->start, range->end, new_flags);

Using vma_modify_flags() is a great suggestion to avoid passing the existing
vma->anon_name explicitly, thanks! I believe I can do that without
duplicating the whole madvise_update_vma() function and it doesn't look that
bad so I'll try going that way in v2. This also addresses Suren's concerns
as there will be no local variable pointing to the vma->anon_name that can
become a UAF again by future changes so we shouldn't need the warning
comments either.

Thanks!
