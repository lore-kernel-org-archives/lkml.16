Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A2513635E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 08:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751444940; cv=none; b=Y41b6ax/GqyEv6LRBb5jeQ4YK1c9do/sqTJq4k8Xu5Iu7rszP3XgWS3RXp56zgWfrQfBk62l7V9t+FYHQ3c37oQfrIUfe2p8IBN0l2ALEGCkSfvDRON/q7JJX+2+rgnzKii+O87txxjEIoVO4sMRQWe3XOnE46AaTDdXKHJGmlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751444940; c=relaxed/simple;
	bh=TpUiGwitXPaVtboFPC1JiMhrIkd+/KdYZg8MhTrKKlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZGCgZVdPwvL/Kyzf+3TvTuNYXmQfO1IMv696TLkdOpHgtzSvZC7sJmeqvVgqkUP19kgvWDLi0eT14Uax2havNnsfG4E3YCg52tYCzTTIEohuzxeDbDTA/a2Ltuf8UYE0UqitHkpAHX11QkStWetz+MelYy4vb9NElfaQmcwoXbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KdfFv15U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KdfFv15U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751444936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HzbQFqLIkZ4mMZ8AYNo+jHz+PQn+lq0iEDVgmGYyPOM=;
	b=KdfFv15UtOYooYa2n0rnJ/b+6huqS8trc0yzO6PEAQn5PpgJpMiaYDL0m0tqDyZtE37OeF
	Wv5p0jYDmLtkmWvnlYsrN96oz+hOXjgrnbziKItFf5dURiv8Gwwei6NZI4W9OA585qSh3+
	CMhjnZQT0UruVfrIha3BzNiTYVXn81k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-uyy7zIaBOJeHYFFkkaUw0w-1; Wed, 02 Jul 2025 04:28:54 -0400
X-MC-Unique: uyy7zIaBOJeHYFFkkaUw0w-1
X-Mimecast-MFC-AGG-ID: uyy7zIaBOJeHYFFkkaUw0w_1751444934
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d244bfabso36697955e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 01:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751444933; x=1752049733;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HzbQFqLIkZ4mMZ8AYNo+jHz+PQn+lq0iEDVgmGYyPOM=;
        b=EzvrGkXP/n4d9nOAiG4RcQLXYL2I+6mccmYue10eSng1S/BFZkH3QOfze9v2S9yzKg
         KQBELVlel8BKva2J5tABEDo99/qDHsHi0aAAagBBgVQA69ggzXPvl2eI+xsxlXKdhSBr
         aPtUXjppShY2+rwe8gR7rH8PhMz0iPkqoaSZfn34bijZagVEL9PjeFmbnSfgObNiKFHp
         jyKxZ7b4aLOjpBLVjX/VZ4QB26SrGtLQE0Onqn16BQOUvN9akIfN8CJ1VWZEUMrh1FIm
         DqAvcq9tU9DDHgFQihNVVYs/6HD3a4Q4ISdYSjMqKdlIl4qnpDy2drClrAWtuxm6pkhe
         Pwqg==
X-Forwarded-Encrypted: i=1; AJvYcCXR7r+5HHnosRzIQ0F79mrUnHDyt078tAUGt+46KbRxgEIIdNqqCkmkaEQqsW8bPcsmm6m9H82+LhexRq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZWPMNYG5zbAU3ExTMchSdpeD+3OPyQpkb1gHKvyZT0pQC5U86
	67JZyQmVqKHHvDsveGtSS04FpRcRj3kS48hS5If5hBNZKkf1XtMydzOtXptay2AA5o2Goqbvedb
	CzM7VvMGQw6NzDp6Fh5GEq6X96vSZ1xyK92lx7oQFlAqnnXsz0TnPozYglRtREFiwyQ==
X-Gm-Gg: ASbGncvpnpEytYKb/d2PNISjHbRYOrjTmAoMk/hKm60NPSbkLXpSrhA8xsGs5Ttim5W
	HGEzwKA1PbbkxWR7A6/2Dq00wc7VE0j+mpJKQXNE7VP7TOX/apW3hO8wTPeFdGCulftMt+8KVhK
	FuvJ6gCGmhNYVc3T4Ithb+eEyHRjgDmi3KLFE1/5UXOz0anm4yjddMf7+IuTEF+KmzT3/36xnBo
	Vstovyvp9g+r6l4m5y7t6rGysVkP5+bNj54vTRINP3tPOjuGCq/xNDZRhYVgwt9JUPmgxdVIt5j
	fuzESk53u8UPGScvUE3dAb1Sx5UB4qiu9QGxQ8MdNKjZ3PkhJaL7rfU=
X-Received: by 2002:a05:6000:703:b0:3a4:f6ba:51c8 with SMTP id ffacd0b85a97d-3b1fe5c082fmr1259452f8f.14.1751444933498;
        Wed, 02 Jul 2025 01:28:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHU4GPCoUJnaI5KrpPRxbohExSM4p/V+1hC5zWtpV0MmAymkrtexckqli/iTlrYjgsiXsuFcw==
X-Received: by 2002:a05:6000:703:b0:3a4:f6ba:51c8 with SMTP id ffacd0b85a97d-3b1fe5c082fmr1259424f8f.14.1751444932931;
        Wed, 02 Jul 2025 01:28:52 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234b382sm222400965e9.9.2025.07.02.01.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 01:28:52 -0700 (PDT)
Message-ID: <f474ef7b-71f3-4169-ba30-74f4afbaeee6@redhat.com>
Date: Wed, 2 Jul 2025 10:28:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: pagemap_scan ioctl: add PFN ZERO test cases
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: kernel@collabora.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250630102443.137809-1-usama.anjum@collabora.com>
 <20027e0c-f43b-4d10-a4d6-41dcc38145bd@redhat.com>
 <6846faf7-20b5-4f08-a8f0-9946f993b0e9@collabora.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6846faf7-20b5-4f08-a8f0-9946f993b0e9@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02.07.25 09:39, Muhammad Usama Anjum wrote:
> On 7/1/25 7:51 PM, David Hildenbrand wrote:
>> On 30.06.25 12:24, Muhammad Usama Anjum wrote:
>>> Add test cases to test the correctness of PFN ZERO flag of pagemap_scan
>>> ioctl. Test with normal pages backed memory and huge pages backed
>>> memory.
>>
>> Just to verify: would this trigger on kernels before my fix?
> Yes, it does trigger the bug without the fix.
> 
>>
>>>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>>> ---
>>> The bug has been fixed [1].
>>>
>>> [1] https://lore.kernel.org/all/20250617143532.2375383-1-david@redhat.com
>>> ---
>>>    tools/testing/selftests/mm/pagemap_ioctl.c | 57 +++++++++++++++++++++-
>>>    1 file changed, 56 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/
>>> testing/selftests/mm/pagemap_ioctl.c
>>> index 57b4bba2b45f3..6138de0087edf 100644
>>> --- a/tools/testing/selftests/mm/pagemap_ioctl.c
>>> +++ b/tools/testing/selftests/mm/pagemap_ioctl.c
>>> @@ -1,4 +1,5 @@
>>>    // SPDX-License-Identifier: GPL-2.0
>>> +
>>>    #define _GNU_SOURCE
>>>    #include <stdio.h>
>>>    #include <fcntl.h>
>>> @@ -1480,6 +1481,57 @@ static void transact_test(int page_size)
>>>                      extra_thread_faults);
>>>    }
>>>    +void zeropfn_tests(void)
>>> +{
>>> +    unsigned long long mem_size;
>>> +    struct page_region vec;
>>> +    int i, ret;
>>> +    char *mem;
>>> +
>>> +    /* Test with page backed memory */
>>
>> What is "page backed memory" ? :)
> I mean, normal memory which isn't huge page backed. I've renamed it to
> Test with normal memory.
> 
>>
>>> +    mem_size = 10 * page_size;
>>> +    mem = mmap(NULL, mem_size, PROT_READ, MAP_PRIVATE | MAP_ANON, -1,
>>> 0);
>>> +    if (mem == MAP_FAILED)
>>> +        ksft_exit_fail_msg("error nomem\n");
>>> +
>>> +    /* Touch each page to ensure it's mapped */
>>> +    for (i = 0; i < mem_size; i += page_size)
>>> +        (void)((volatile char *)mem)[i];
>>> +
>>> +    ret = pagemap_ioctl(mem, mem_size, &vec, 1, 0,
>>> +                (mem_size / page_size), PAGE_IS_PFNZERO, 0, 0,
>>> PAGE_IS_PFNZERO);
>>> +    if (ret < 0)
>>> +        ksft_exit_fail_msg("error %d %d %s\n", ret, errno,
>>> strerror(errno));
>>> +
>>> +    ksft_test_result(ret == 1 && LEN(vec) == (mem_size / page_size),
>>> +             "%s all pages must have PFNZERO set\n", __func__);
>>> +
>>> +    munmap(mem, mem_size);
>>> +
>>> +    /* Test with huge page */
>>> +    mem_size = 10 * hpage_size;
>>> +    mem = memalign(hpage_size, mem_size);
>>> +    if (!mem)
>>> +        ksft_exit_fail_msg("error nomem\n");
>>> +
>>> +    ret = madvise(mem, mem_size, MADV_HUGEPAGE);
>>> +    if (ret)
>>> +        ksft_exit_fail_msg("madvise failed %d %s\n", errno,
>>> strerror(errno));
>>
>> Might fail on older kernels, so we usually treat this as a skip.
> I'll skip it in next version.
> 
>>
>>> +
>>> +    for (i = 0; i < mem_size; i += hpage_size)
>>> +        (void)((volatile char *)mem)[i];
>>> +
>>> +    ret = pagemap_ioctl(mem, mem_size, &vec, 1, 0,
>>> +                (mem_size / page_size), PAGE_IS_PFNZERO, 0, 0,
>>> PAGE_IS_PFNZERO);
>>> +    if (ret < 0)
>>> +        ksft_exit_fail_msg("error %d %d %s\n", ret, errno,
>>> strerror(errno));
>>> +
>>> +    ksft_test_result(ret == 1 && LEN(vec) == (mem_size / page_size),
>>> +             "%s all huge pages must have PFNZERO set\n", __func__);
>>
>> Wouldn't this be able to fail if /sys/kernel/mm/transparent_hugepage/
>> use_zero_page is set to false,
> I wasn't aware of it. I'll check user_zero_page first as initial condition.
> 
>> or if mmap() gave us a suboptimally-
>> aligned range?
> mem = memalign(hpage_size, mem_size) is being used to allocate this. So
> aligment should be correct.
> 
>>
>> You'd have to read each and every page to get the ordinary shared
>> zeropage in these configs instead without making the test too complicated.
> In the above for loop, we are reading each new page already. Let's
> resolve this and then I'll post the v2 which is ready.
> 
>>
>>> +
>>> +    free(mem);
>>
>>
>> Shouldn't this be an munmap() ?
> free() is being used to free memory allocated by memalign().

Oh, I missed that detail.

I'm afraid memalign+free that might not be what you want: there is no 
guarantee that what you are getting hasn't been used before and is not 
already filled with other pages?

-- 
Cheers,

David / dhildenb

