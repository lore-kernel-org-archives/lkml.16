Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588FC274FF2
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737761; cv=none; b=ZO/L3QZ3jtrmcP6UT0PTzP6/LWAfjTvaS5Z1boDKKpSdBXon2YNdMpplTnOKBh55SK0c/hEle8AZfMbMSe9CHQTmGdTqrw6KoxpYMukIu3rCmr3E0vgpo1I8nDb2BwoC3iR/D20vRPgXAjB6MmYsbxFJnQafTW8kbGKwJzAnT5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737761; c=relaxed/simple;
	bh=9K6dcEafmDCnZ0UsHDmmLy4rV+hSaD1LF7PQrfU49XU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M3nzUrGdZ+C7vvWcWpJeuz1vQQREoXeP3aH5lEnjV009uYFuxJXnDOSJnxzQuqJfOqbts73OIKVAIBJyySACPCfWNkzY1d2JOO7imAi6TIl52sTyv4f3ogOumb195/9Y/cwGHYcNcdkLz4JZR+ti67KDOXsu4b+EB7t3/pHTvTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e92VqDWu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e92VqDWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747737758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Nojfr5VsNFL8Qg1MDovYQSmnqTQxSYHWb0zCaB+p/w8=;
	b=e92VqDWu7Z/ne1HbS9z9hwuUrfNpzVT0YUABljV9fV0R+hazQe3beAm1XEJj6uWB2LA4Vi
	FwLS5O5jWTtFEhmMSIe9DtbtEN4ncNgXZU2K8n4ozUNlNa26BqOyjcgq28UALP8YhexQ7p
	VUaGFKceGiAUTu5pT1ikKi+8+HXNRP0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-mGMunw_MPqy5xB8EKyNEJA-1; Tue, 20 May 2025 06:42:36 -0400
X-MC-Unique: mGMunw_MPqy5xB8EKyNEJA-1
X-Mimecast-MFC-AGG-ID: mGMunw_MPqy5xB8EKyNEJA_1747737756
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-60007c2cef6so5227256a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737755; x=1748342555;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Nojfr5VsNFL8Qg1MDovYQSmnqTQxSYHWb0zCaB+p/w8=;
        b=rUibhX+U9gLbl5Yi8AEW/KgF0ol+OJzRav28K3bWaY6G/MzOXpiSCnWV+U7NZKjjP8
         2KzDpIVY/5hD4yujtTKoVhIxWpeLfewejXTyyxYRp/9UnFwiVCIbumhOHiDG/RUME+Cv
         qsL/y04D49tsyo9YY1HOTShWBap2cYnZZooI4RGo/B7JKd21qlO2tCxaF5gyfQMbYPRH
         6PZdX7cxyFUBSTYhiJyI7JAH2eEe2KJCOIo3RR6FlqI2sVZC20uL7vGdRBTFNuVfdx1b
         fJtvZqQDY2FeMILW0YbMS5SZVyQuvyQT0DmIaMQYKe4e3+fBVN9s1RrxQq9/Lkp/lqPQ
         KoTA==
X-Forwarded-Encrypted: i=1; AJvYcCV2+Wv4sO25sy0lZwWsP/ZGgjswe8J806QIRV1cc+GUJ90kCVStyid9rSkFXQ+sn0oIdU3260501nxSUsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsVe2dg9KUAJUMCtHLQPSCBTj+YXr/a1/EvH8xy9vqMJLHRhXj
	7m9WTGTZqiqIGobP6Y+KQGTVyw7HUgitosfqYd0EZ/D1dXrnba10MsBrtYYwf92/hoM2UBJDCqA
	JKE43KrXp21R5Stou6cBqlSFwczzhe2VL1SAmSuW803HTJq8yRphDi/f91oXWiO9V8A==
X-Gm-Gg: ASbGncs3MpW1is157EpMfsA/8ZSrYpobFDQ1ZuNAMTcYUUzBme6M/kY1DySA1fNqguO
	uDBMKLddr2xO64FBroWy8YmkvZikvOhPJkXI+kTNdvN4mwp2zPiD95GBXfJxo5f527a3owPlgfI
	5vtRaV5S2cGTKGOqwBbUA/5fRD3c6NriZaMRwh/58wgsBy9XGwpnvxeyByPvqM/ajUK/HRH05Ad
	BMkSdn9CBklkyI9NQQZcS4Sg3y2sHSyb88V6FYp1PhpOGRXTMmHVkoOSPzlX3MiRgHwS1VhIv4k
	ZAUE+064qAA60EfcvvUUAiFbYcTQNjY86tRIshij6gKMo3FHaFgqx77XRxMqLSsnSwkV90NDQM9
	+Id2bNagvFoYjkyqSmMsU79K+akfLyToRemeK12g=
X-Received: by 2002:a05:6402:909:b0:5fc:8c24:814d with SMTP id 4fb4d7f45d1cf-6009010e4b0mr14682782a12.14.1747737755557;
        Tue, 20 May 2025 03:42:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF72JLG6asx3WKUC1ArlnTTnKbaD3lNc/q/VMNC0Ggr3/RIk+McvhKUYOM2NdDznrcZzod9KQ==
X-Received: by 2002:a05:6402:909:b0:5fc:8c24:814d with SMTP id 4fb4d7f45d1cf-6009010e4b0mr14682760a12.14.1747737755052;
        Tue, 20 May 2025 03:42:35 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f28:7c00:a95e:ac49:f2ad:ab84? (p200300d82f287c00a95eac49f2adab84.dip0.t-ipconnect.de. [2003:d8:2f28:7c00:a95e:ac49:f2ad:ab84])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ae3940fsm6950223a12.74.2025.05.20.03.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 03:42:34 -0700 (PDT)
Message-ID: <d9456551-a3ea-454c-8832-c0530f702ce0@redhat.com>
Date: Tue, 20 May 2025 12:42:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/5] mm: madvise: refactor madvise_populate()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>,
 linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, SeongJae Park <sj@kernel.org>,
 Usama Arif <usamaarif642@gmail.com>
References: <cover.1747686021.git.lorenzo.stoakes@oracle.com>
 <96503fba082709bc4894ba4134f9fac1d179ba93.1747686021.git.lorenzo.stoakes@oracle.com>
 <becb11bd-e10c-4f59-9ff1-1f7acd2e1ee0@redhat.com>
 <ea17a0a6-fe19-4f0b-9899-56d39b9fbac3@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ea17a0a6-fe19-4f0b-9899-56d39b9fbac3@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.05.25 12:36, Lorenzo Stoakes wrote:
> On Tue, May 20, 2025 at 12:30:24PM +0200, David Hildenbrand wrote:
>> On 19.05.25 22:52, Lorenzo Stoakes wrote:
>>> Use a for-loop rather than a while with the update of the start argument at
>>> the end of the while-loop.
>>>
>>> This is in preparation for a subsequent commit which modifies this
>>> function, we therefore separate the refactoring from the actual change
>>> cleanly by separating the two.
>>>
>>> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>> ---
>>>    mm/madvise.c | 39 ++++++++++++++++++++-------------------
>>>    1 file changed, 20 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/mm/madvise.c b/mm/madvise.c
>>> index 8433ac9b27e0..63cc69daa4c7 100644
>>> --- a/mm/madvise.c
>>> +++ b/mm/madvise.c
>>> @@ -967,32 +967,33 @@ static long madvise_populate(struct mm_struct *mm, unsigned long start,
>>>    	int locked = 1;
>>>    	long pages;
>>> -	while (start < end) {
>>> +	for (; start < end; start += pages * PAGE_SIZE) {
>>>    		/* Populate (prefault) page tables readable/writable. */
>>>    		pages = faultin_page_range(mm, start, end, write, &locked);
>>>    		if (!locked) {
>>>    			mmap_read_lock(mm);
>>>    			locked = 1;
>>>    		}
>>> -		if (pages < 0) {
>>> -			switch (pages) {
>>> -			case -EINTR:
>>> -				return -EINTR;
>>> -			case -EINVAL: /* Incompatible mappings / permissions. */
>>> -				return -EINVAL;
>>> -			case -EHWPOISON:
>>> -				return -EHWPOISON;
>>> -			case -EFAULT: /* VM_FAULT_SIGBUS or VM_FAULT_SIGSEGV */
>>> -				return -EFAULT;
>>> -			default:
>>> -				pr_warn_once("%s: unhandled return value: %ld\n",
>>> -					     __func__, pages);
>>> -				fallthrough;
>>> -			case -ENOMEM: /* No VMA or out of memory. */
>>> -				return -ENOMEM;
>>> -			}
>>> +
>>> +		if (pages >= 0)
>>> +			continue;
>>> +
>>> +		switch (pages) {
>>> +		case -EINTR:
>>> +			return -EINTR;
>>> +		case -EINVAL: /* Incompatible mappings / permissions. */
>>> +			return -EINVAL;
>>> +		case -EHWPOISON:
>>> +			return -EHWPOISON;
>>> +		case -EFAULT: /* VM_FAULT_SIGBUS or VM_FAULT_SIGSEGV */
>>> +			return -EFAULT;
>>> +		default:
>>> +			pr_warn_once("%s: unhandled return value: %ld\n",
>>> +				     __func__, pages);
>>> +			fallthrough;
>>> +		case -ENOMEM: /* No VMA or out of memory. */
>>> +			return -ENOMEM;
>>
>> Can we limit it to what the patch description says? "Use a for-loop rather
>> than a while", or will that be a problem for the follow-up patch?
> 
> Well, kind of the point is that we can remove a level of indentation also, which
> then makes life easier in subsequent patch.
> 
> Happy to change description or break into two (but that seems a bit over the top
> maybe? :>)

Probably just mention it, otherwise it looks a bit like unrelated churn :)

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

