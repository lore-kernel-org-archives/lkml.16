Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC9126CE0D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750783102; cv=none; b=WsO1jAV7MonVBXk8jp7Mimb/WFaNHfG/6vZOiIPciW+RmezY7sl7wmdz21f54BLmNU1rx9ZJoFZxfGnZViZAQu3VpUcvto+mUIiw9rgUWa499YMrFgc2qheDKehHf2cczSAV8UvvmYcHlTXMs68DcxGeIKvQoZtePuJgN5ds0YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750783102; c=relaxed/simple;
	bh=jqY1xxsaViQ6gLxBPiMJh2K2PFq0nrQ1eBT//ll60es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FaCpEiVHX+XLvQ4uv+wbIf/4K6qzVBxuw5ZIbGACVNMF3S3cXRApdKxGnzQDzu4qwZZ/7yvMXNhKfXKfigYimZrV2mcAfiGdzcP/pcZR1YXoLfQf1++kIEVM05zZAv20q5r7ih7y2p1IEZpg/Ba4jp+wTkwomW//jDF5XM/kVTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=L5JENuQt; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=+LACvnL+; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=L5JENuQt; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=+LACvnL+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="L5JENuQt";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="+LACvnL+";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="L5JENuQt";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="+LACvnL+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1F5411F7A8;
	Tue, 24 Jun 2025 16:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750783099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7W6e7QkChIwAQem+9dlfhu92MmPUY/f/EsMjv8eD0QM=;
	b=L5JENuQtqmp3llZE0a+NOiXE9vQ0FbpJlpDDF7OUzISOxlcdIa3mAcLqtyJj54MpPs0zKp
	9RYBy7wcuCfFCgUifmbBillqz/HiaJpB9ilZRz08TpEp4VCfSI93P2VL0wxHsbeRNwkQk5
	Q408Ld8g2g23SwlZN3QaU5kF9gkoMs8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750783099;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7W6e7QkChIwAQem+9dlfhu92MmPUY/f/EsMjv8eD0QM=;
	b=+LACvnL+BuD4oKelXAXH5VVc/gG/4Lcp65ZTSIb7zvq9XF1TexvUNEBZr956uuAD6DbzZa
	/7NQixpPOGO62UBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750783099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7W6e7QkChIwAQem+9dlfhu92MmPUY/f/EsMjv8eD0QM=;
	b=L5JENuQtqmp3llZE0a+NOiXE9vQ0FbpJlpDDF7OUzISOxlcdIa3mAcLqtyJj54MpPs0zKp
	9RYBy7wcuCfFCgUifmbBillqz/HiaJpB9ilZRz08TpEp4VCfSI93P2VL0wxHsbeRNwkQk5
	Q408Ld8g2g23SwlZN3QaU5kF9gkoMs8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750783099;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7W6e7QkChIwAQem+9dlfhu92MmPUY/f/EsMjv8eD0QM=;
	b=+LACvnL+BuD4oKelXAXH5VVc/gG/4Lcp65ZTSIb7zvq9XF1TexvUNEBZr956uuAD6DbzZa
	/7NQixpPOGO62UBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F313D13A24;
	Tue, 24 Jun 2025 16:38:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RDMJO3rUWmgaIgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 24 Jun 2025 16:38:18 +0000
Message-ID: <b166064c-6425-4f6f-8658-4097a7727cba@suse.cz>
Date: Tue, 24 Jun 2025 18:38:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] mm, madvise: simplify anon_name handling
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Colin Cross <ccross@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250624-anon_name_cleanup-v2-0-600075462a11@suse.cz>
 <20250624-anon_name_cleanup-v2-1-600075462a11@suse.cz>
 <e6e20d9e-ceb4-4e18-8859-5255ef1aa525@redhat.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <e6e20d9e-ceb4-4e18-8859-5255ef1aa525@redhat.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:email]
X-Spam-Level: 

On 6/24/25 15:58, David Hildenbrand wrote:
> On 24.06.25 15:03, Vlastimil Babka wrote:
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

   ^

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

              ^

>> 
>> Additionally, by using vma_modify_flags() when not modifying the
>> anon_name, avoid explicitly passing the existing vma's anon_name and
>> storing a pointer to it in struct madv_behavior or a local variable.
>> This prevents the danger of accessing a freed anon_name after vma
>> merging, previously fixed by commit 942341dcc574.
>> 
>> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

<snip>

> Took me a second to find where this is already checked (-> 
> madvise_vma_behavior()).

And I thought I was repeating myself too much in the changelog :)

> 
> :)

But maybe you're joking on purpose, referring to that :)

> Acked-by: David Hildenbrand <david@redhat.com>

Thanks!


