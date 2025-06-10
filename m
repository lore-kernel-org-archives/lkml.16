Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E06222F173
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563074; cv=none; b=Mu6QQlHtb4T2qtiksut9XvnJApXhN3ZvwnejtDJb6zBrozA5HAHUnpkSMJCbwMOD3k7z9imf+jt/ZLcopNv3TXNiaKL7yBVAb3QpYl8L6V8SW2N1XlqRmzi+Rd5SX2reeZ7rdasWSH8HYrAGd8DqGmDXwfJnXGw2ec4iwW5+F7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563074; c=relaxed/simple;
	bh=wvZxPHzF12u3SY1iPiS6eNL/OVGcaqNIhjGbqmT3/xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aqf9Bm8qG9PAbjQiXqYL7EfiQZ6pmX22K5AxoQvout3f5AykjJE3Hc/tRiH/P0MmmeNdQVKZntdej50oSz/15G6pA99Ug88zljKevX5jsskVK4EffWfzYOjFl/v+4IHgUqCIGN/6MCWG3z7cHFUUNyNuieMaprPJYTkojYr+R1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NVo8BxO6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NVo8BxO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749563071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=x2VmyAImjj4hzOnuu3f/wVygVhYGF647p7FjFNq+/QM=;
	b=NVo8BxO6ypdHU4Z8m18ERCqYPSfV7mxnF9BE8+Va7A8+kZEyu1TcKyAzvBwe9k1VUXYKNF
	nLiEKPbNtsZ6oLIDnQAlNx+v/K87IxdydXMuKrS5cFNxXq9w817xrwbMc2MRvP3Sh/Kw98
	5+O0HGNouUusovXpTQbrrIkvjiDUt48=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-LMFSrxXyN0-oIZmoP3dyZQ-1; Tue, 10 Jun 2025 09:44:30 -0400
X-MC-Unique: LMFSrxXyN0-oIZmoP3dyZQ-1
X-Mimecast-MFC-AGG-ID: LMFSrxXyN0-oIZmoP3dyZQ_1749563069
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso3983051f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563069; x=1750167869;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x2VmyAImjj4hzOnuu3f/wVygVhYGF647p7FjFNq+/QM=;
        b=hyxR/5pmQGzIaLT72QeUKDhQXBQOssU0Rf0L/HUJSKevz9hRUSWlyVnifX9aBcahxO
         79KzTimqoQld983M/2v102Okr3KCfHnVBxYgd/ugYIYjI9ZFISQCZKmvAnM9al64Oc2h
         VuHI2Bg1hUu5PlgHAA7OIgUcESE+NHEQho5UMAIrqAAUnIQt7NJbWo8LXmZ47HMb0bff
         SYm+TbnRLtWvMvgXgHgLha55ZZrGUzBarXyXKnf4anOhY5U1ffxk2kIYfQsYzF8V8hKA
         1aKaWoAIObslENXjb70DR1Mol2NE1KgSyt6/3pQlJPJQSv3YVVthqhoDsadEXQwMMlzl
         HK6w==
X-Forwarded-Encrypted: i=1; AJvYcCWLdogCz82gzgTDrrg4ZBqEjqnDW8wuujmHfOmEBpgf01FwvqH13NdfV1YCIQWVqj6B/SGYzkG/ElgE+kI=@vger.kernel.org
X-Gm-Message-State: AOJu0YycxntjMb6MYnkO04gszEDWvQYvdNcNP5kMpsL0mDB30JAcJIn9
	15yi7C1oqhPEi5U/FNCYi1wYwF+zXYMoIKzMpyhGkJjG5in2coz8wHwa3UA8jTUxzVnx83cf466
	I0/7SIsNelro/fsa4t392pFEnWfWjLjc+Ndrdsk9V5sUeNkzEuRGYFStHN65ngfUN8g==
X-Gm-Gg: ASbGncvnaSg1Fg+bNfySOLhhfW9xXV6E7znayAYu+6owMX3kWy7VwBLvb7xSkwxGLc8
	MXZ3vLUBFDHW8cKhXjtPR5ruvs1W6SFiFGmgTiRX/H5yNetwwUy96DEn1tJxkbAb22K8Q6y/pCX
	9778gU1WoLUN9q+VEZzueDDQP1WrtI4HV7ZbJ4Rbww3HygrtdqN6uOg42k+qAilqVGD770MdW73
	r/Z3RCsdKDs1Ucrn5ScxsHk/3V/Xpa2WYfKvC036x5WWgU960vy2rGZj6fZwm0hGIr49A5hPWsa
	oMbvVj0r0Ua9y3o7dIk1QH9mgxrBU8vqTtqytqKemOxr1yf0mH0KBxg=
X-Received: by 2002:a05:6000:290f:b0:3a4:f655:8c4d with SMTP id ffacd0b85a97d-3a531cafc03mr14432429f8f.27.1749563069107;
        Tue, 10 Jun 2025 06:44:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGu/x/Paa24Rvj8SNK0TN6cfVpKUqZgPCpL5Aazl2BPcT87efCPXFP3jrKdeAxwrMIiICtIHA==
X-Received: by 2002:a05:6000:290f:b0:3a4:f655:8c4d with SMTP id ffacd0b85a97d-3a531cafc03mr14432395f8f.27.1749563068705;
        Tue, 10 Jun 2025 06:44:28 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320b16657sm14394555e9.8.2025.06.10.06.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 06:44:28 -0700 (PDT)
Message-ID: <881baf6e-8118-4d09-86dc-09dcf3a3cd02@redhat.com>
Date: Tue, 10 Jun 2025 15:44:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: Allow lockless kernel pagetable walking
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
 steven.price@arm.com, gshan@redhat.com,
 linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com,
 ryan.roberts@arm.com, anshuman.khandual@arm.com
References: <20250610114401.7097-1-dev.jain@arm.com>
 <20250610114401.7097-2-dev.jain@arm.com>
 <db04bd02-0090-4aff-bb2e-0d1e023757a5@lucifer.local>
 <970e1b84-7f47-4a51-ad99-4df9026b8f7d@redhat.com>
 <359668fb-df61-4135-89ee-2675a06a5c1b@lucifer.local>
 <bea0969f-5a6c-4486-aeba-964fa79bd714@redhat.com>
 <1c4714bb-97f3-4261-92b7-34223a32e016@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <1c4714bb-97f3-4261-92b7-34223a32e016@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.06.25 15:35, Lorenzo Stoakes wrote:
> On Tue, Jun 10, 2025 at 03:31:56PM +0200, David Hildenbrand wrote:
>> On 10.06.25 15:27, Lorenzo Stoakes wrote:
>>> On Tue, Jun 10, 2025 at 03:24:16PM +0200, David Hildenbrand wrote:
>>>> On 10.06.25 14:07, Lorenzo Stoakes wrote:
>>>>> OK so I think the best solution here is to just update check_ops_valid(), which
>>>>> was kind of sucky anyway (we check everywhere but walk_page_range_mm() to
>>>>> enforce the install pte thing).
>>>>>
>>>>> Let's do something like:
>>>>>
>>>>> #define OPS_MAY_INSTALL_PTE	(1<<0)
>>>>> #define OPS_MAY_AVOID_LOCK	(1<<1)
>>>>>
>>>>> and update check_ops_valid() to take a flags or maybe 'capabilities' field.
>>>>>
>>>>> Then check based on this e.g.:
>>>>>
>>>>> if (ops->install_pte && !(capabilities & OPS_MAY_INSTALL_PTE))
>>>>> 	return false;
>>>>>
>>>>> if (ops->walk_lock == PGWALK_NOLOCK && !(capabilities & OPS_MAY_AVOID_LOCK))
>>>>> 	return false;
>>>>>
>>>>
>>>> Hm. I mean, we really only want to allow this lockless check for
>>>> walk_kernel_page_table_range(), right?
>>>>
>>>> Having a walk_kernel_page_table_range_lockeless() might (or might not) be
>>>> better, to really only special-case this specific path.
>>>
>>> Agree completely, Dev - let's definitely do this.
>>>
>>>>
>>>> So, I am wondering if we should further start splitting the
>>>> kernel-page-table walker up from the mm walker, at least on the "entry"
>>>> function for now.
>>>
>>> How do you mean?
>>
>> In particular, "struct mm_walk_ops"
>>
>> does not quite make sense when not actually walking a "real" mm .
>>
>> So maybe we should start having a separate structure where *vma,
>> install_pte, walk_lock, hugetlb* does not even exist.
>>
>> It might be a bit of churn, though ... not sure if there could be an easy
>> translation layer for now.
> 
> But you know... I looove churn right? <3 <3 <3 :)))
> 
> That's a nice idea, but I think something that should be a follow up.

Yes, absolutely, just wanted to raise it :)

-- 
Cheers,

David / dhildenb

