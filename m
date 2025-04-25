Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C825218DB02
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745611979; cv=none; b=kjR/eDLX/9xb7pwZ97GCJIbFeam6LMX+cFOmPJceUIF+b5zfSI8dzOPWmTmc19FFQ5J0maT+okTSnG4jIIcNsRyxdn+8RqUCQrt5Tm+L6BuKDPQTphTXTXfIZ5Yed9tOIz80mWjveJ+sTJt0jFXN7hkTYo67hpt2sk04kbg6b7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745611979; c=relaxed/simple;
	bh=58xzvN2u07+daqQpIY+cuaGVNq7++mJIswfKEXLoWZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WcvliR/VDrec1oeFDiG2mmT8BC2r5ZrXJqeDdvi5MX0CNNqZkwT5oxsQ/hZlwWilVj565k42qARfYmlIh6wVVKQoY/PRU8PGjkITGnKWdF5NpE4l5BfArmJuK958rWHWJbtrT9URwja6Pqc5N+HRWAJPzOw2LXXFOZr57dKuyVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LNBZzpUA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LNBZzpUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745611976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DP2vwiic8e2s/R5GDgOi0xr/8SGBP9j4xTLdbOHVads=;
	b=LNBZzpUAK91CXDkFQrDLAjFl+pX0TZbcztE5DYt3u2uZW/slgrLjqO2RL3YF+uvnAjNZVx
	izO+dk8CenTUNU3YTfaOXCpx17xWIhkGjC3UC5KkBU9F+zA227ZQBSzNYsl2ul+gsVgSeO
	Ml07T4VgYC562qR611QavkHcUbDmtr0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-vfBiI_HCPyiqyYwi6MTvtw-1; Fri, 25 Apr 2025 16:12:53 -0400
X-MC-Unique: vfBiI_HCPyiqyYwi6MTvtw-1
X-Mimecast-MFC-AGG-ID: vfBiI_HCPyiqyYwi6MTvtw_1745611972
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43efa869b0aso16308075e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745611972; x=1746216772;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DP2vwiic8e2s/R5GDgOi0xr/8SGBP9j4xTLdbOHVads=;
        b=H23yNGV+3BYAS1eLUJMuscbbR6az1uRS7ra67W1TFHsxvuSDFTlEMhciIDUrNlqczp
         mOxga6T8QlVSA95wwGD5udFv9nNGsAnIFhPEDvnVFCIKDl2qKLveXsYVTlOgCWcTtFZC
         flR0biaybbYCehC76Ho00idZa5/tuGQVbUzBftD7mgH5AKC/d4Gst2Q8Zr6aZZYOGUxO
         KY0BgATreF4vuyOFsmkbDwtnrWtEq941ygrxi5niH2v0rJmJJJKUYJTJaBR9TiADvWRF
         nrvjsns7l2sTbAPK/qssC/zzYqfA2/+jeCcLdL2AFpdQ1Ooniqh201w4JiLA0aq2U0xF
         DiTA==
X-Forwarded-Encrypted: i=1; AJvYcCVDyUxQ0BzlIAllRYirjJ1CFPeGJ3i6U7WDg36u7GC1p7uKkQyqF/aGaRH6PM8i5/sIotockGjIE4ln1HE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfAP46DcyCN/LeGQBSJ1+sQ2YXazjiThuw4AdTH1Ms+9Uwf6Su
	wOJoOSEvK1s9jgRfcYfzstp68+ztbVG6/PZUteO0jX0VHQjMrJIKKHX3TBfJC6hTViXSt4sbskr
	xMPk/4Nfu9ty+wMPhXgtDrDIW6sBJjv/AxJWvbPPITYZNuLI0VeMFPVDvhNP1lg==
X-Gm-Gg: ASbGncu2dz4hhOjjxo8HWc0ILsQLYdNFY5TRQBLJfACIBtxMaUHW13pIs00Y2wOZl+f
	iEAauSwxjDcCFa4K0e75pl48spXsS2WiGK0w5DLpNPIHCjq4/2Y5Ef+zPy7tTErfifDGw15qE/U
	J5SmK0g6ntqijDKsW4OYlq3zzKoTMfZRwT8xk1tAymb3r7n9kqB5zcxm3Ub9ZN0qK/nXyMk+xet
	ddJONTX+OrYMMBa6ll+od2TofYL35WNMJ0q98SvCXJTY3+DkWb1BetVezNlQlQ6sE09mcvqFUt6
	ehVna4NZqN4Wsn4TE337X3/GDIlOTnzQPkCypRs1SFPLP6GDL6iGEQIXQW0mOTyqov2Cwu0qdtS
	SweP/88c4bCsDcHoEEYpefFK8tuh7t9Nxz0gY
X-Received: by 2002:a05:6000:1786:b0:391:2d61:4561 with SMTP id ffacd0b85a97d-3a074e14820mr2921270f8f.6.1745611971835;
        Fri, 25 Apr 2025 13:12:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFVn9H//z0k1CtrVOQbHYlOLGF8iqTCK5yC0ChSELN1MCMaffah5JZTgjMkK35gLUoNPkjKw==
X-Received: by 2002:a05:6000:1786:b0:391:2d61:4561 with SMTP id ffacd0b85a97d-3a074e14820mr2921248f8f.6.1745611971452;
        Fri, 25 Apr 2025 13:12:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70f:6900:6c56:80f8:c14:6d2a? (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de. [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8cc74sm3339530f8f.11.2025.04.25.13.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 13:12:51 -0700 (PDT)
Message-ID: <8fd728cf-bc54-433d-8701-234a67933a97@redhat.com>
Date: Fri, 25 Apr 2025 22:12:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] mm/mm_init: Use for_each_valid_pfn() in
 init_unavailable_range()
To: David Woodhouse <dwmw2@infradead.org>, Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Sauerwein, David" <dssauerw@amazon.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Ruihan Li <lrh2000@pku.edu.cn>
References: <20250423133821.789413-1-dwmw2@infradead.org>
 <20250423133821.789413-8-dwmw2@infradead.org>
 <cabc322e-d5ab-4371-a506-c7809717b38b@redhat.com>
 <91CA8854-2E86-4AF3-BAD0-8C47833F59D4@infradead.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <91CA8854-2E86-4AF3-BAD0-8C47833F59D4@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.04.25 21:08, David Woodhouse wrote:
> On 25 April 2025 17:17:25 BST, David Hildenbrand <david@redhat.com> wrote:
>> On 23.04.25 15:33, David Woodhouse wrote:
>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>
>>> Currently, memmap_init initializes pfn_hole with 0 instead of
>>> ARCH_PFN_OFFSET. Then init_unavailable_range will start iterating each
>>> page from the page at address zero to the first available page, but it
>>> won't do anything for pages below ARCH_PFN_OFFSET because pfn_valid
>>> won't pass.
>>>
>>> If ARCH_PFN_OFFSET is very large (e.g., something like 2^64-2GiB if the
>>> kernel is used as a library and loaded at a very high address), the
>>> pointless iteration for pages below ARCH_PFN_OFFSET will take a very
>>> long time, and the kernel will look stuck at boot time.
>>>
>>> Use for_each_valid_pfn() to skip the pointless iterations.
>>>
>>> Reported-by: Ruihan Li <lrh2000@pku.edu.cn>
>>> Suggested-by: Mike Rapoport <rppt@kernel.org>
>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>> Tested-by: Ruihan Li <lrh2000@pku.edu.cn>
>>> ---
>>>    mm/mm_init.c | 6 +-----
>>>    1 file changed, 1 insertion(+), 5 deletions(-)
>>>
>>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>>> index 41884f2155c4..0d1a4546825c 100644
>>> --- a/mm/mm_init.c
>>> +++ b/mm/mm_init.c
>>> @@ -845,11 +845,7 @@ static void __init init_unavailable_range(unsigned long spfn,
>>>    	unsigned long pfn;
>>>    	u64 pgcnt = 0;
>>>    -	for (pfn = spfn; pfn < epfn; pfn++) {
>>> -		if (!pfn_valid(pageblock_start_pfn(pfn))) {
>>> -			pfn = pageblock_end_pfn(pfn) - 1;
>>> -			continue;
>>> -		}
>>
>> So, if the first pfn in a pageblock is not valid, we skip the whole pageblock ...
>>
>>> +	for_each_valid_pfn(pfn, spfn, epfn) {
>>>    		__init_single_page(pfn_to_page(pfn), pfn, zone, node);
>>>    		__SetPageReserved(pfn_to_page(pfn));
>>>    		pgcnt++;
>>
>> but here, we would process further pfns inside such a pageblock?
>>
> 
> Is it not the case that either *all*, or *none*, of the PFNs within a given pageblock will be valid?

Hmm, good point. I was thinking about sub-sections, but all early 
sections are fully valid.

(Also, at least on x86, the subsection size should match the pageblock 
size; might not be the case on other architectures, like arm64 with 64K 
base pages ...)

> 
> I assumed that was *why* it had that skip, as an attempt at the kind of optimisation that for_each_valid_pfn() now gives us?

But it's interesting in this code that we didn't optimize for "if the 
first pfn is valid, all the remaining ones are valid". We would still 
check each PFN.

In any case, trying to figure out why Lorenzo ran into an issue ... if 
it's nit because of the pageblock, maybe something in for_each_valid_pfn 
with sparsemem is still shaky.

-- 
Cheers,

David / dhildenb

