Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDEC2EB5C8
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750162067; cv=none; b=CSz33ODZI04876x2MECGLvl4coU8pSr94DHu+SE2U2H8yA3qdTLm+a5/uiOIRa0XJO+VWV28Em638aVC8Ule1qK1VCx0NZeltK5+fuFTFMSbl+XgLlVSVLvPXnrLbPGj04QcvcvESAqb/VN0qarZf6eEOzU9cdOiLN1CT31GKRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750162067; c=relaxed/simple;
	bh=sLVbqeXSXgq/ED2fS5Kxi7FhPFWukWFPxg2XOULk8mY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lR507pRrJ3nAPAOQWOcKbzi0RDNn2PZAGyLX9q22maDk6nk18QKTsCvu5asZx7M1kdzTwsSSmRJG2mifH888NxD2BPBy3nRTqBeMsUnPy3A/UG79zsAmeNJnbxcIsFm/ufQ/Ei3dSMWVKAfoiWitvkCPBkZJe/kV7J/mxR8/ooM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z4wr22Q1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z4wr22Q1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750162064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=A6Te2d8SmKORmL+MjMF/CvD735H81Qg4mzRRaium6K8=;
	b=Z4wr22Q1m7KNmag6POCi6VRp39Vn9T9jTVhyBMMIB6y3TxrhjV881movf4kAZ/LLYVNQnt
	oYbMtw8kBfMAI6tkuOzPJP9Qucs0Hdm/cXVQ41bGfF/i5T3XQPc87mr9g2qbn2UOtSkOY/
	UT+mTRfLiUBULROJHFB7ZmZzFRmJUDs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-avVn9ItqOIOSGa03_kuUlw-1; Tue, 17 Jun 2025 08:07:42 -0400
X-MC-Unique: avVn9ItqOIOSGa03_kuUlw-1
X-Mimecast-MFC-AGG-ID: avVn9ItqOIOSGa03_kuUlw_1750162061
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4edf5bb4dso3646084f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750162061; x=1750766861;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A6Te2d8SmKORmL+MjMF/CvD735H81Qg4mzRRaium6K8=;
        b=Vev0+WjHLIJW/TydYynH6dMgM/aLkQ3RhMo8yhV99Yk/SBliofWSLiOOR7fI0viKKE
         MYsk0rPOxccyGZFTc1fSHSIrouzKtqCX3cwGftWGb3D5MV3cfPK3nKBDwIJFFs0r7sHY
         ahlhVPqEPHN81mHxp05RBs3HrWWS8Kd5tFxX6gCOowDZ/ljBCDjprzSHil3zYGwWTY4r
         SETtLqn7+IOpK0VZPBppJhgm58yBslcUuk4T3Knq8V4bxr7a3sE+S4ioGrvwtuOm/02Q
         vbPwa0f8Y3n9tGZyBJra1KP9SOe37sShwdIgM09g1HEbwm04lg+Dt2drOPkxQZ0cWAba
         ibNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLybuQyQBOdV70NpW75a+zHA4cIlcV8svp2hvtnavxxkMKjOnjmhw/vlguF9aUqFZ7D8DXNbFfobMQXhc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0myEnWu5jJiY0MA5sepbdejNIXoO//Hya6bba+BJ22IdopuVY
	CZQV6i25Vz4hrGSpd8SrCXr64XcW8rTnYwh49OT3F+i9/Y4mp5I3D5SPV02hEPJpPGAGYtTL/wI
	ha41uu/42rizjZlTgj6LJ1ifbTPBrzydLoFRC9iuDAVdw5QvnBIe45LgZ5y9xwiFKSA==
X-Gm-Gg: ASbGncvqehchonxlRPs3V1XYLI0r559kTn4BzXlByts7SPvhrUYg0O0golDgv6DXkUB
	xo5mg/5tVB/tw0qis/fhpO/J+pq2KRcBSZW3UtdthNqo0MUcgeIyqZiBfEWASiCx0RU2lkbzCN0
	8dM7wNDUzBh8AR0wgq6Y6wv34mJxzwqDHCCT6yfKDomQ7T96s4mYwd19cUuf6uVI2SNtAEEyTfC
	7iQ0ydcmtwIACa4l1A1YB27G2QleUAMdTdmdcoxWUBSdHDjXFZoxGDWolc7ZM729y4N4/dQsdMW
	idbovIlBFlq2qiK3YkPWuYYQZPiB4CWpRK64bX2uKkBq/9lnHGoYftcbRldqGEedVGq9heDgg31
	fTnUVRcV0Xvd27ufPnSdJBOBW/OJkqxXIc1ehZ/ilNvpTBfA=
X-Received: by 2002:a05:6000:2582:b0:3a5:1222:ac64 with SMTP id ffacd0b85a97d-3a572e82147mr10299491f8f.38.1750162060708;
        Tue, 17 Jun 2025 05:07:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtIfcpG+yjbTYMfj8/fQ/P4dUCekxMz0fmZW/E/QEh4Lhnkkhf+v/nguaYm046a2iMPdFJVg==
X-Received: by 2002:a05:6000:2582:b0:3a5:1222:ac64 with SMTP id ffacd0b85a97d-3a572e82147mr10299441f8f.38.1750162060153;
        Tue, 17 Jun 2025 05:07:40 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08a2bsm14044028f8f.62.2025.06.17.05.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 05:07:39 -0700 (PDT)
Message-ID: <018c0663-dffb-49d0-895c-63bc9e5f9aec@redhat.com>
Date: Tue, 17 Jun 2025 14:07:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Suren Baghdasaryan <surenb@google.com>, Matthew Wilcox
 <willy@infradead.org>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
 Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <22a80f22ba2082b28ee0b0a925eb3dbb37c2a786.1749473726.git.lorenzo.stoakes@oracle.com>
 <f24dd244-f188-4804-981c-8b7560e5a26b@redhat.com>
 <d51af1de-110a-4cde-9091-98e15367dda3@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <d51af1de-110a-4cde-9091-98e15367dda3@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> 
>>
>>> +	/* The above check should imply these. */
>>> +	VM_WARN_ON_ONCE(folio_mapcount(folio) > folio_nr_pages(folio));
>>> +	VM_WARN_ON_ONCE(!PageAnonExclusive(folio_page(folio, 0)));
>>
>> This can trigger in one nasty case, where we can lose the PAE bit during
>> swapin (refault from the swapcache while the folio is under writeback, and
>> the device does not allow for modifying the data while under writeback).
> 
> Ugh god wasn't aware of that. So maybe drop this second one?

Yes.

> 
>>
>>> +
>>> +	/*
>>> +	 * A pinned folio implies that it will be used for a duration longer
>>> +	 * than that over which the mmap_lock is held, meaning that another part
>>> +	 * of the kernel may be making use of this folio.
>>> +	 *
>>> +	 * Since we are about to manipulate index & mapping fields, we cannot
>>> +	 * safely proceed because whatever has pinned this folio may then
>>> +	 * incorrectly assume these do not change.
>>> +	 */
>>> +	if (folio_maybe_dma_pinned(folio))
>>> +		goto out;
>>
>> As discussed, this can race with GUP-fast. SO *maybe* we can just allow for
>> moving these.
> 
> I'm guessing you mean as discussed below? :P Or in the cover letter I've not
> read yet? :P

The latter .. IIRC :P It was late ...

> 
> Yeah, to be honest you shouldn't be fiddling with index, mapping anyway except
> via rmap logic.
> 
> I will audit access of these fields just to be safe.
> 

[...]

>>> +
>>> +	state.ptep = ptep_start;
>>> +	for (; !pte_done(&state); pte_next(&state, nr_pages)) {
>>> +		pte_t pte = ptep_get(state.ptep);
>>> +
>>> +		if (pte_none(pte) || !pte_present(pte)) {
>>> +			nr_pages = 1;
>>
>> What if we have
>>
>> (a) A migration entry (possibly we might fail migration and simply remap the
>> original folio)
>>
>> (b) A swap entry with a folio in the swapcache that we can refault.
>>
>> I don't think we can simply skip these ...
> 
> Good point... will investigate these cases.

migration entries are really nasty ... probably have to wait for the 
migration entry to become a present pte again.

swap entries ... we could lookup any folio in the swapcache and adjust that.

> 
>>
>>> +			continue;
>>> +		}
>>> +
>>> +		nr_pages = relocate_anon_pte(pmc, &state, undo);
>>> +		if (!nr_pages) {
>>> +			ret = false;
>>> +			goto out;
>>> +		}
>>> +	}
>>> +
>>> +	ret = true;
>>> +out:
>>> +	pte_unmap_unlock(ptep_start, state.ptl);
>>> +	return ret;
>>> +}
>>> +
>>> +static bool __relocate_anon_folios(struct pagetable_move_control *pmc, bool undo)
>>> +{
>>> +	pud_t *pudp;
>>> +	pmd_t *pmdp;
>>> +	unsigned long extent;
>>> +	struct mm_struct *mm = current->mm;
>>> +
>>> +	if (!pmc->len_in)
>>> +		return true;
>>> +
>>> +	for (; !pmc_done(pmc); pmc_next(pmc, extent)) {
>>> +		pmd_t pmd;
>>> +		pud_t pud;
>>> +
>>> +		extent = get_extent(NORMAL_PUD, pmc);
>>> +
>>> +		pudp = get_old_pud(mm, pmc->old_addr);
>>> +		if (!pudp)
>>> +			continue;
>>> +		pud = pudp_get(pudp);
>>> +
>>> +		if (pud_trans_huge(pud) || pud_devmap(pud))
>>> +			return false;
>>
>> We don't support PUD-size THP, why to we have to fail here?
> 
> This is just to be in line with other 'magical future where we have PUD THP'
> stuff in mremap.c.
> 
> A later commit that permits huge folio support actually lets us support these...
> 
>>
>>> +
>>> +		extent = get_extent(NORMAL_PMD, pmc);
>>> +		pmdp = get_old_pmd(mm, pmc->old_addr);
>>> +		if (!pmdp)
>>> +			continue;
>>> +		pmd = pmdp_get(pmdp);
>>> +
>>> +		if (is_swap_pmd(pmd) || pmd_trans_huge(pmd) ||
>>> +		    pmd_devmap(pmd))
>>> +			return false;
>>
>> Okay, this case could likely be handled later (present anon folio or
>> migration entry; everything else, we can skip).
> 
> Hmm, but how? the PMD cannot be traversed in this case?
> 
> 'Present' migration entry? Migration entries are non-present right? :) Or is it
> different at PMD?

"present anon folio" or "migration entry" :)

So that latter meant a PMD migration entry (that is non-present)

[...]

>>>    	pmc.new = new_vma;
>>> +	if (relocate_anon) {
>>> +		lock_new_anon_vma(new_vma);
>>> +		pmc.relocate_locked = new_vma;
>>> +
>>> +		if (!relocate_anon_folios(&pmc, /* undo= */false)) {
>>> +			unsigned long start = new_vma->vm_start;
>>> +			unsigned long size = new_vma->vm_end - start;
>>> +
>>> +			/* Undo if fails. */
>>> +			relocate_anon_folios(&pmc, /* undo= */true);
>>
>> You'd assume this cannot fail, but I think it can: imagine concurrent
>> GUP-fast ...
> 
> Well if we change the racey code to ignore DMA pinned we should be ok right?

We completely block migration/swapout, or could they happen 
concurrently? I assume you'd block them already using the rmap locks in 
write mode.

> 
>>
>> I really wish we can find a way to not require the fallback.
> 
> Yeah the fallback is horrible but we really do need it. See the page table move
> fallback code for nightmares also :)
> 
> We could also alternatively:
> 
> - Have some kind of anon_vma fragmentation where some folios in range reference
>    a different anon_vma that we link to the original VMA (quite possibly very
>    broken though).
> 
> - Keep a track of folios somehow and separate them from the page table walk (but
>    then we risk races)
> 
> - Have some way of telling the kernel that such a situation exists with a new
>    object that can be pointed to by folio->mapping, that the rmap code recognise,
>    like essentially an 'anon_vma migration entry' which can fail.
> 
> I already considered combining this operation with the page table move
> operation, but the locking gets horrible and the undo is categorically much
> worse and I'm not sure it's actually workable.

Yeah, I have to further think about that. :(

-- 
Cheers,

David / dhildenb

