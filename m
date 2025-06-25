Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A64A29AB18
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846043; cv=none; b=gPWmRRmuRg4WnaZbooIA6SOE1/Y5/sxKBSV7CdTSmo5kco0Y/649Al2hSEP947enzVVG7KZOVt18I70tcsMKUDJZLr1B0U/SYLZmK8LBURnS53oIKz5oXEFhgebz3sh5JB82Wrorjvy66lUZIJhjSXI3conPM7dCDPCQdY9IwLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846043; c=relaxed/simple;
	bh=HCL4bBk/xH8UcE5PG9CE0wu7Z3Lbp+xw7BKcpjbXypI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tEAAXKWNFCu7djC/Tmj4+iJWnsFnhR2uTNBsn9oz1cAQK6D8JBJGkaECsxGD5S6WspLbfBbBZgN0QwmXo+OcE1Sq2JOe6OfwY8Yv93PzncjmcGgRVGpE7Uah7Ncqg6zhrSowKSoX9IkRI4M6ezLlNAQvGGowFKo10sH9tCENVnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aGz36rM7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aGz36rM7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750846038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DQLbbuwHRNrn8OWMHyeQigqp10GRhwNSb28SrkBMaG8=;
	b=aGz36rM7la4I4zGqMqbNaw6K04LNiMIyKch631lGTM/8UaFs7eu/FguOeR37MtHJUV/b2N
	sk4RH58ZalInVxl9MYuAsQblRT7VBMlNnnaW5cFPUbWdkYnd1QXu0GvU+WboZ0+cI4a8XF
	7WI55bm5Pm0EfgT8EAXDZB37vRhmEZA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-vtcsszxxNN-A71x65FzlKA-1; Wed, 25 Jun 2025 06:07:16 -0400
X-MC-Unique: vtcsszxxNN-A71x65FzlKA-1
X-Mimecast-MFC-AGG-ID: vtcsszxxNN-A71x65FzlKA_1750846035
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f65a705dso3473802f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750846035; x=1751450835;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DQLbbuwHRNrn8OWMHyeQigqp10GRhwNSb28SrkBMaG8=;
        b=Pd4MdKGy5GhUtqDZs2ssOa7R+7hOq6E/kt09wxqsryO6M7aLjC6JdV8agMtq3F/dyf
         2UilXF5AcfTUq3r28JbRjhQDnyRfLyQX8hgdu7T0vUYWAoo6zax4KxDd9E42wGHRFhV5
         Tkg/fDtHluf15zgRn8f338YHPSp3RG+Fc0SYRuvN9nCT3Plmj6VN+5t8Z8tN0qbQsES/
         Ej4SQlVBvyKiwUkzpTv4AAzikZeGQXHYdWKdWrBSuD/BlqsjwcG33qNLKZmgre9a6hu9
         eYJ+X8FhaJjILCS6D9BAmAeeSWF9QBKR7yihAEC5hQeSZnDdJGlAV7I8BPA0mjgQKL2d
         ZZbg==
X-Forwarded-Encrypted: i=1; AJvYcCUETajcGcGwMkiJ+j5fM24jhfQi8f2dzgkX0qqrsE1PBTfdSqYysn0QC4szlpqMtXSPC3ijcGnIVH7yYK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOztCck24ZwLtWLyeA2p05gbc6WLwiiwAqucIcuPKQFwYMD1gP
	Wud14B7Th7HHYzFfjE6EVzV5Nkp1mFLHE63cNublB+sgH8XUvAfJNSJRNXb8yDciHikHQdWNm5u
	K/7tCvSN/VDdi7uTEGIV2NtgdI3uJET/w/ApMhvVEyzWPZT906gLbhXROk76tLtk9yg==
X-Gm-Gg: ASbGncvf/lbKhBGEZvLJp1wxFkfguBB6yWE6ECZiNhk+wcul92ILWPZpsL6gCRJy3Rc
	DvtwFV6LuZD4jj6qrqDBTlbHLh1iOFlLvMzvFznlXTmA44GHpfAlqr6QycqU03kwkVWOe26j4HH
	2rHqol0Em60zXVlE12uefr11TrRp9k+oezIVN8FkkrAkk+o8+l652IBbX1Hy27enIqausVEytSX
	camc30su10nXNfohBDDdmKA8YJzZ74O8hkJrZU7836Amci4RFMHAmifql8g3MvWzIPGY4wpotIw
	rdBp1JgpXINckP+V6JZZx8iSOdsECz1hO8vmT6e20WeB3Py9ZPLCZQ==
X-Received: by 2002:a05:6000:4287:b0:3a4:e480:b5df with SMTP id ffacd0b85a97d-3a6ed64abdcmr1904781f8f.44.1750846035451;
        Wed, 25 Jun 2025 03:07:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbMN1DhuPLbDT9DzMQdd6GOEFmB6d6EaA5KmwFvwR4prESZ27mP79S3GaZea/qAFIVxwgO0w==
X-Received: by 2002:a05:6000:4287:b0:3a4:e480:b5df with SMTP id ffacd0b85a97d-3a6ed64abdcmr1904759f8f.44.1750846035020;
        Wed, 25 Jun 2025 03:07:15 -0700 (PDT)
Received: from [192.168.3.141] (p57a1abde.dip0.t-ipconnect.de. [87.161.171.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8051153sm4063968f8f.7.2025.06.25.03.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 03:07:13 -0700 (PDT)
Message-ID: <5de8ca8e-f293-4bfc-b49d-6e2a2e049f2b@redhat.com>
Date: Wed, 25 Jun 2025 12:07:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Hugh Dickins <hughd@google.com>, akpm@linux-foundation.org,
 ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 zokeefe@google.com, shy828301@gmail.com, usamaarif642@gmail.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
 <f1782ae5-c1d6-4f46-a676-666505990f4d@lucifer.local>
 <008ec97f-3b33-4b47-a112-9cef8c1d7f58@redhat.com>
 <01d679f2-fd64-472c-b9dc-ebe87268ce82@lucifer.local>
 <a16071e5-ae97-4e1a-9df8-f353f6b319c7@lucifer.local>
 <23b8ad10-cd1f-45df-a25c-78d01c8af44f@redhat.com>
 <decbae07-0c84-4379-9f9d-6e2bd6dbad6e@lucifer.local>
 <a877b2b7-382b-498b-9b4a-188a0845d630@linux.alibaba.com>
 <ff3cc6bc-dd40-4b6b-a293-eedcc7c8eaf6@lucifer.local>
 <37fc3553-0d5a-4bdc-b473-cd740d47598e@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <37fc3553-0d5a-4bdc-b473-cd740d47598e@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.25 12:02, Baolin Wang wrote:
> 
> 
> On 2025/6/25 17:31, Lorenzo Stoakes wrote:
>> On Wed, Jun 25, 2025 at 04:52:03PM +0800, Baolin Wang wrote:
>>>
>>>
>>> On 2025/6/25 16:37, Lorenzo Stoakes wrote:
>>>> Yeah maybe the best way is to just have another tunable for this?
>>>>
>>>> /sys/kernel/mm/transparent_hugepage/disable_collapse perhaps?
>>>>
>>>> What do you think Hugh, Baolin?
>>>
>>> I think it's not necessary to find a way to disable madvise_collapse.
>>> Essentially, it's a conflict between the semantics of madvise_collapse and
>>> the '/sys/kernel/mm/transparent_hugepage/enabled' interface. We should reach
>>> a consensus on the semantics first:
>>>
>>> Semantic 1: madv_collapse() should ignore any THP system settings, meaning
>>> we need to update the 'never' semantics in
>>> '/sys/kernel/mm/transparent_hugepage/enabled', which would only disable page
>>> fault and khugepaged, not including madvise_collapse. If we agree on this,
>>> then the 'never' for per-sized mTHP would have the same semantics, i.e.,
>>> when I set 64K mTHP to 'always' and 2M mTHP to 'never', madvise_collapse
>>> would still allow the collapse of 2M THP. We should document this clearly in
>>> case users still want 64K mTHP from madvise_collapse.
>>
>> Right yeah, I mean this is in effect how things are now. So the task is
>> documentation.
>>
>>>
>>>
>>> Semantic 2: madv_collapse() needs to respect THP system settings, which is
>>> what my patch does. Never means never, and we would need to update the
>>> documentation of madv_collapse() to make it clearer.
>>
>> Yes, and indeed this is the choice.
>>
>> I think, as David said, it comes down to whether we have a legit use case that
>> truly relies on this.
>>
>>>> (One side note on PMD-sized MADV_COLLAPSE - this is basically completely
>>>> useless for 64 KB page size arm64 systems where PMD's are 512 MB :)
>>>>
>>>> Thoughts Baolin?
>>>
>>> We should not collapse 512MB THP on 64K pagesize kernel. So seems
>>> madv_collapse() can not work on 64K pagesize kernel.
>>
>> Well I don't think anything would prevent this now right? So MADV_COLLAPSE is
>> pretty problematic on 64K pagesize kernels in general.
> 
> Yes, I don't mean it will prevent madvise_collapse(), just as you said
> that it could be problematic (it's horrible to try to collapse 512MB).

Well, assume you have a VM at that is 2 GiB and could use 4 THPs. It's 
stupid, but there might be some selected use cases where it's not 
completely stupid.

-- 
Cheers,

David / dhildenb

