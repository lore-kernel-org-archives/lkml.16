Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6088922257E
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747314123; cv=none; b=Xlcn4RP8d2KrKzyVO3Ns18KCY6eQxetu2nS1m4IFEvYDGousJfIOHnFSxNVr7tApPgUWeJYg6E/e+aKTFQmzB3cwsmo67ZmjzG6ENlKPLkgzye+94lP7EzIX6CAIFzxfDywfYClCZW6972xJZkLaH+0x/4Qf8s5K2uZBBKJ8874=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747314123; c=relaxed/simple;
	bh=uQCg3D5iXaRbgGA3G6uY+lOLG56XBPSms1leaLY0nPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iN3sYrL/VbnhvjtZSI2+bhdX4pq9p7L7TCJOn1EWHRsJBAlyDBTh4EC04mu/KBtgN9iQE5Ym9KPoE4Ru52h8mTZaJZBBIHINw3TvEwVJ02Ve67toPcqbL1IM+RzEVU6iRpNdFQEWdlMvfi8ethbqy5enKdBldqkfT0Psod4Jz6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MS4taCoS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MS4taCoS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747314120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9DBeSBbi6U3zLRkJS53qHOo+MmuTmB6ZFLiCDJKoJVE=;
	b=MS4taCoSrmdszNvhdzs0ps2lavG9gNSAsdHZ0p/i2c/PQBFZcslAMZpMFuIBCMJrAo2NYQ
	wGLjcPe08dpGlbKFM/L5ZLzpCSKBsIcSVTmS/b+UJ40tO1ltFvSP92CXNpdYpJo2WSIzJF
	/ZzmFCKenU3WWZxEJy3iWYwYko/DTLs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-W_eb421xOv6Evc7JqjOocA-1; Thu, 15 May 2025 09:01:59 -0400
X-MC-Unique: W_eb421xOv6Evc7JqjOocA-1
X-Mimecast-MFC-AGG-ID: W_eb421xOv6Evc7JqjOocA_1747314118
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442e0e6eb84so6512395e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 06:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747314118; x=1747918918;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9DBeSBbi6U3zLRkJS53qHOo+MmuTmB6ZFLiCDJKoJVE=;
        b=IAnRsvV8fdpGpvgmyAoM0mdTNH73KlHggX80fGKIDgkM3+KmUDGP3PWKJFCHP+poCQ
         Mzdum64IHD/zGly6nUICd3AH2epNcegKYZ9Zgu9To6wRnIr9Pt20YkxMvV1sMtfiawaC
         LVVQwPJh3gq1RC3dC+vVx4Mx105pYMmRUHSDLcL1ZQXg9S3HcF18EeSEglrgh2oMMQHm
         uAGbZBwADHcc/N5G7h8Qm7k5MvDfXMJKFTPGLzOpmWTdlQjR8VvhIih2cCFw5gGh4jVg
         BNfP7MURUHJ7OFqgnovfHIR1w0LPgjE7iGWunbRY5W3aJMtzU0qSvlv1EZEpA269rrAG
         1hNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPZDl4edHVrM5mCiC/OZJR/hiTnHHcZfJ6DZQjXriSKXd/MhhesZ3K7AjVV9EkaFskbWJB2Umwti4ROXo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9h30NAvRiewjrkIaoDcJFs66KUG32WVBrPa8BZ/qIA5LB6iss
	n2T/OYtFQiCKn7LXyCprI5OEfdex8Sui1UF7KQUgs8bHdsqbAT/qvSA0kXFPEntw8rTYQQW5d+j
	FgdgtVo2GWygq5qpMKAUREOCAZvjKfP2ZoSWscQspSDCXHwuEE0reT0lFnzEsPQ==
X-Gm-Gg: ASbGncsmFVOpiG+zuZ7/Dyv64S6ZZqi3Lp2rUbUqUL8fafgs5Q0vsBLyWJoGJDJvS/2
	yi9xvG788WQ8tjg5pgGz2Dtn/q5k1l8H7vjIyZx8iT+3bz+I4sAkMX9u7TlJujw8WbDvZ7fLCkO
	akAlwp4zvRayA3rmTLgFJ9m+ewS043SAA2DUf4JCQ6J9kyVuHuH8DlRs3Sme6BhOypSxtvCFP6a
	UboXkZf8utgAOZIMwrySTio+Kpf4n7hvTpvhMqyXRssCcXbcvohSmJZdyOzxQyOUZaSmy1lOXoS
	2WGHX3rLExuqT/k7NfDRwLQw9qcsWG1PaCznVXnSSv/ww+MrWJxvZqpQxWTliu95EAU5j1jv4tV
	MJfpVPMH/ie++uYhuconpSPIAkmvCmTQun3fWToI=
X-Received: by 2002:a05:600c:4ecf:b0:442:e011:7eb with SMTP id 5b1f17b1804b1-442f2179993mr86156095e9.30.1747314117365;
        Thu, 15 May 2025 06:01:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuFQKN6vlr1SKNALYZAGvjhh5kNbmGxWG9WUosIntWg48TXe7G3ffUvQFumHJGN+QYlu+52g==
X-Received: by 2002:a05:600c:4ecf:b0:442:e011:7eb with SMTP id 5b1f17b1804b1-442f2179993mr86155395e9.30.1747314116736;
        Thu, 15 May 2025 06:01:56 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4a:8900:884a:b3af:e3c9:ec88? (p200300d82f4a8900884ab3afe3c9ec88.dip0.t-ipconnect.de. [2003:d8:2f4a:8900:884a:b3af:e3c9:ec88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef811sm65186185e9.35.2025.05.15.06.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 06:01:55 -0700 (PDT)
Message-ID: <3aeb6b8e-040c-47ae-8b46-1ef66d5f11e4@redhat.com>
Date: Thu, 15 May 2025 15:01:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Check pxd_leaf() instead of !pxd_table() while
 tearing down page tables
To: Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 catalin.marinas@arm.com, will@kernel.org
Cc: anshuman.khandual@arm.com, mark.rutland@arm.com,
 yang@os.amperecomputing.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <20250515063450.86629-1-dev.jain@arm.com>
 <332ecda7-14c4-4dc3-aeff-26801b74ca04@redhat.com>
 <4904d02f-6595-4230-a321-23327596e085@arm.com>
 <6fe7848c-485e-4639-b65c-200ed6abe119@redhat.com>
 <35ef7691-7eac-4efa-838d-c504c88c042b@arm.com>
 <c06930f0-f98c-4089-aa33-6789b95fd08f@redhat.com>
 <bac0d8e2-6219-4eb2-b4c8-b82b208808b5@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <bac0d8e2-6219-4eb2-b4c8-b82b208808b5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15.05.25 12:07, Ryan Roberts wrote:
> On 15/05/2025 09:53, David Hildenbrand wrote:
>> On 15.05.25 10:47, Dev Jain wrote:
>>>
>>>
>>> On 15/05/25 2:06 pm, David Hildenbrand wrote:
>>>> On 15.05.25 10:22, Dev Jain wrote:
>>>>>
>>>>>
>>>>> On 15/05/25 1:43 pm, David Hildenbrand wrote:
>>>>>> On 15.05.25 08:34, Dev Jain wrote:
>>>>>>> Commit 9c006972c3fe removes the pxd_present() checks because the caller
>>>>>>> checks pxd_present(). But, in case of vmap_try_huge_pud(), the caller
>>>>>>> only
>>>>>>> checks pud_present(); pud_free_pmd_page() recurses on each pmd through
>>>>>>> pmd_free_pte_page(), wherein the pmd may be none.
>>>>>> The commit states: "The core code already has a check for pXd_none()",
>>>>>> so I assume that assumption was not true in all cases?
>>>>>>
>>>>>> Should that one problematic caller then check for pmd_none() instead?
>>>>>
>>>>>     From what I could gather of Will's commit message, my interpretation is
>>>>> that the concerned callers are vmap_try_huge_pud and vmap_try_huge_pmd.
>>>>> These individually check for pxd_present():
>>>>>
>>>>> if (pmd_present(*pmd) && !pmd_free_pte_page(pmd, addr))
>>>>>       return 0;
>>>>>
>>>>> The problem is that vmap_try_huge_pud will also iterate on pte entries.
>>>>> So if the pud is present, then pud_free_pmd_page -> pmd_free_pte_page
>>>>> may encounter a none pmd and trigger a WARN.
>>>>
>>>> Yeah, pud_free_pmd_page()->pmd_free_pte_page() looks shaky.
>>>>
>>>> I assume we should either have an explicit pmd_none() check in
>>>> pud_free_pmd_page() before calling pmd_free_pte_page(), or one in
>>>> pmd_free_pte_page().
>>>>
>>>> With your patch, we'd be calling pte_free_kernel() on a NULL pointer,
>>>> which sounds wrong -- unless I am missing something important.
>>>
>>> Ah thanks, you seem to be right. We will be extracting table from a none
>>> pmd. Perhaps we should still bail out for !pxd_present() but without the
>>> warning, which the fix commit used to do.
>>
>> Right. We just make sure that all callers of pmd_free_pte_page() already check
>> for it.
>>
>> I'd just do something like:
> 
> I just reviewed the patch and had the same feedback as David. I agree with the
> patch below, with some small mods...
> 
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 8fcf59ba39db7..e98dd7af147d5 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1274,10 +1274,8 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>   
>>          pmd = READ_ONCE(*pmdp);
>>   
>> -       if (!pmd_table(pmd)) {
>> -               VM_WARN_ON(1);
>> -               return 1;
>> -       }
>> +       VM_WARN_ON(!pmd_present(pmd));
>> +       VM_WARN_ON(!pmd_table(pmd));
> 
> You don't need both of these warnings; pmd_table() is only true if the pmd is
> present (well actually only if it's _valid_ which is more strict than present),
> so the second one is sufficient on its own.

Ah, right.

> 
>>   
>>          table = pte_offset_kernel(pmdp, addr);
>>          pmd_clear(pmdp);
>> @@ -1305,7 +1303,8 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
> 
> Given you are removing the runtime check and early return in
> pmd_free_pte_page(), I think you should modify this function to use the same
> style too.

BTW, the "return 1" is weird. But looking at x86, we seem to be making a 
private copy of the page table first, to defer freeing the page tables 
after the TLB flush.

I wonder if there isn't a better way (e.g., clear PUDP + flush tlb, then 
walk over the effectively-disconnected page table). But I'm sure there 
is a good reason for that.

> 
>>          next = addr;
>>          end = addr + PUD_SIZE;
>>          do {
>> -               pmd_free_pte_page(pmdp, next);
>> +               if (pmd_present(*pmdp))
> 
> question: I wonder if it is better to use !pmd_none() as the condition here? It
> should either be none or a table at this point, so this allows the warning in
> pmd_free_pte_page() to catch more error conditions. No strong opinion though.

Same here. The existing callers check pmd_present().

-- 
Cheers,

David / dhildenb

