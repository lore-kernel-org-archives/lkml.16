Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035572E173F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750783349; cv=none; b=B6pBWZ4bSYGjZhalt+scTFK27iExtyRGpLAv4bHtXz24KCH7KumV5GeiBM57MTPo93SY6w2/RvugexOSOc5O+0xBnWFRH8XQmFCfWZzBgdrHb0uvtUuDPb1NfvqN2DL1vGIgFwq4jfPdtDVTYYaRoCedMZhamzKOt98sH54HW1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750783349; c=relaxed/simple;
	bh=sS6oPK/y4DeUMKsrNmASTo4+i5mRvGEGbnfMs+Jf8Qs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nk958ht0oNkVPD5dPGrgm4ce5oGAKsM3kNfx6IWCIZpqsZTjYY68/VkxM6l/vJrGy97XNv5nCCPRFAKeydPZNMnLVNi1/VspB6gR7JTnhEA7tJd2rEPz9aUPhHjFfbl9R/FP1+PDTevOLoilYj0hQ8V4hYQtzKJEoI2//ow9nn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=RfJyXQ3N; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=/pAEJ8qs; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=gW1APbNI; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=PPNEwgn+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="RfJyXQ3N";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="/pAEJ8qs";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="gW1APbNI";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="PPNEwgn+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 08F011F46E;
	Tue, 24 Jun 2025 16:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750783346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZFQaXyLiqOLXgKDRGaL9SqPl20x4REIwT660m90ebpk=;
	b=RfJyXQ3NbUh29IVa0iW371sqNc9hwGHVGw8wqIPHQf+zKuqAcA5ShJRsHh5FT1b7sr2itk
	qR4nFr3lkkKT5vrsnMoGAWRTidkXzsiFZ4H9cFe+ZPuLgAIOr7v0GvFuLEwQZPVRwwFxNU
	Kyf2USXAQFz0aENXwz9zX/Q8+MOMOcM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750783346;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZFQaXyLiqOLXgKDRGaL9SqPl20x4REIwT660m90ebpk=;
	b=/pAEJ8qsKpKcRnohW9FNivOu4VaJ2dpdBaAs1SGqbDbLkWeItjlYIdQ+PEbp59BdEkfH5i
	CDMQ+3griU4geeCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750783345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZFQaXyLiqOLXgKDRGaL9SqPl20x4REIwT660m90ebpk=;
	b=gW1APbNIG/TCnhYRdmChlqx4N3HPtW0CMpYLXfwGnaFfXjUFAsY0mJYYkeHjM7oZT0h6S8
	L8ultAAhfQNiO42Wz7MylN5xOhQszuWH/R0DmdhiJsBQNYfwXv9QjQYak3rzDAKIROcWvP
	YJEWWWsLxcZkd9iKaLPPrl0hO+0v+Gw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750783345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZFQaXyLiqOLXgKDRGaL9SqPl20x4REIwT660m90ebpk=;
	b=PPNEwgn+wTuQmM9fE0z/rC/E/wDkXIgvrwnCG6gRPO1njaxvPCB3+ReMwphoxAPMOZyPax
	4a7hoTQdiL8IjODA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E876B13A24;
	Tue, 24 Jun 2025 16:42:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eW51OHDVWmg4IwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 24 Jun 2025 16:42:24 +0000
Message-ID: <992cff93-9ac9-40f9-a104-d9de0f3b8ef7@suse.cz>
Date: Tue, 24 Jun 2025 18:42:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] mm, madvise: simplify anon_name handling
Content-Language: en-US
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Colin Cross <ccross@google.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250624-anon_name_cleanup-v2-0-600075462a11@suse.cz>
 <20250624-anon_name_cleanup-v2-1-600075462a11@suse.cz>
 <60186e91-bf02-4d39-b745-ffb4e62632cb@lucifer.local>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <60186e91-bf02-4d39-b745-ffb4e62632cb@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:email,oracle.com:email]
X-Spam-Level: 

On 6/24/25 17:26, Lorenzo Stoakes wrote:
> On Tue, Jun 24, 2025 at 03:03:45PM +0200, Vlastimil Babka wrote:
>> Since the introduction in 9a10064f5625 ("mm: add a field to store names
>> for private anonymous memory") the code to set anon_name on a vma has
>> been using madvise_update_vma() to call replace_anon_vma_name(). Since
>> the former is called also by a number of other madvise behaviours that
>> do not set a new anon_name, they have been passing the existing
>> anon_name of the vma to make replace_vma_anon_name() a no-op.
>>
>> This is rather wasteful as it needs anon_vma_name_eq() to determine the
>> no-op situations, and checks for when replace_vma_anon_name() is allowed
>> (the vma is anon/shmem) duplicate the checks already done earlier in
>> madvise_vma_behavior(). It has also lead to commit 942341dcc574 ("mm:
>> fix use-after-free when anon vma name is used after vma is freed")
>> adding anon_name refcount get/put operations exactly to the cases that
>> actually do not change anon_name - just so the replace_vma_anon_name()
>> can keep safely determining it has nothing to do.
>>
>> The recent madvise cleanups made this suboptimal handling very obvious,
>> but happily also allow for an easy fix. madvise_update_vma() now has the
>> complete information whether it's been called to set a new anon_name, so
>> stop passing it the existing vma's name and doing the refcount get/put
>> in its only caller madvise_vma_behavior().
>>
>> In madvise_update_vma() itself, limit calling of replace_anon_vma_name()
>> only to cases where we are setting a new name, otherwise we know it's a
>> no-op. We can rely solely on the __MADV_SET_ANON_VMA_NAME behaviour and
>> can remove the duplicate checks for vma being anon/shmem that were done
>> already in madvise_vma_behavior().
>>
>> Additionally, by using vma_modify_flags() when not modifying the
>> anon_name, avoid explicitly passing the existing vma's anon_name and
>> storing a pointer to it in struct madv_behavior or a local variable.
>> This prevents the danger of accessing a freed anon_name after vma
>> merging, previously fixed by commit 942341dcc574.
>>
>> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> 
> Cheers, LGTM so:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
> I made sure to do some stress-ng --madvise testing with this series (+ my recent
> fix) applied :P all good.

Thanks for that!

>> ---
>>  mm/madvise.c | 37 +++++++++++++------------------------
>>  1 file changed, 13 insertions(+), 24 deletions(-)
>>
>> diff --git a/mm/madvise.c b/mm/madvise.c
>> index 4491bf080f55d6d1aeffb2ff0b8fdd28904af950..fca0e9b3e844ad766e83ac04cc0d7f4099c74005 100644
>> --- a/mm/madvise.c
>> +++ b/mm/madvise.c
>> @@ -176,25 +176,29 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
>>  }
>>  #endif /* CONFIG_ANON_VMA_NAME */
>>  /*
>> - * Update the vm_flags on region of a vma, splitting it or merging it as
>> - * necessary.  Must be called with mmap_lock held for writing;
>> - * Caller should ensure anon_name stability by raising its refcount even when
>> - * anon_name belongs to a valid vma because this function might free that vma.
>> + * Update the vm_flags and/or anon_name on region of a vma, splitting it or
>> + * merging it as necessary. Must be called with mmap_lock held for writing.
>>   */
>>  static int madvise_update_vma(vm_flags_t new_flags,
>>  		struct madvise_behavior *madv_behavior)
>>  {
>> -	int error;
>>  	struct vm_area_struct *vma = madv_behavior->vma;
>>  	struct madvise_behavior_range *range = &madv_behavior->range;
>>  	struct anon_vma_name *anon_name = madv_behavior->anon_name;
>> +	bool set_new_anon_name = madv_behavior->behavior == __MADV_SET_ANON_VMA_NAME;
>>  	VMA_ITERATOR(vmi, madv_behavior->mm, range->start);
>>
>> -	if (new_flags == vma->vm_flags && anon_vma_name_eq(anon_vma_name(vma), anon_name))
>> +	if (new_flags == vma->vm_flags && (!set_new_anon_name ||
>> +			anon_vma_name_eq(anon_vma_name(vma), anon_name)))
>>  		return 0;
>>
>> -	vma = vma_modify_flags_name(&vmi, madv_behavior->prev, vma,
>> +	if (set_new_anon_name)
>> +		vma = vma_modify_flags_name(&vmi, madv_behavior->prev, vma,
>>  			range->start, range->end, new_flags, anon_name);
> 
> I will do a follow up (doesn't really belong here I'd say as involves change to
> modify code) that makes this vma_modify_name() or vma_modify_anon_name() as this
> is the only caller and we don't care about flags here :)

Oh right, good idea!

