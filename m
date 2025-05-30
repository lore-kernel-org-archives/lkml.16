Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8950F218ACA
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748595173; cv=none; b=O7mCidti9KTWLX7r0jbMUD/1WTLR/5s8aAgAzFY1jHMmiDCJi76ml7e8TGDrYd8QDDPRzxjlcsF7lln2KVWUbixHTKWHft++bY34rvcPGJbVU+Igq6hk6VjCwqnNHCMxH2fw+NS+Sa/JoZMHtLif/dOB363xc0ySV/aBVCvkeoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748595173; c=relaxed/simple;
	bh=tpdB7ZLl0UrgoAlMjYpi/+PImq3CiQZ8aEO4FTpWivY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+tDI3PT1VebIOhv153hXWN/FkeBp+fnClcIFSTGOn5fRq3+lSQplnLqh738pgMNuoBkkVDxF8KAmivZyNFGDBfGgKOdxe09hbK6RwYinyU/I1Ia+dlxCP/TqioLLzLR7/wHY3dDYytuRJ1mJYp8PXWvbaSgUb4DYCnZhFmxhbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CnJhLiHF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CnJhLiHF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748595170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RivONRZmKtb6PAY6opK1Hx8XQmxD64BeDivEpsAjyjY=;
	b=CnJhLiHFYflyEJd+BzNJ14uURikdfKGsHLfavEE8/UGhh36czP48O5Yu0r5vV55ibSVO6m
	EbJK6HslT5hz/PBkOxSva3VgHWrP0T8WwdHwIThL/8reNvYQInsQwRPRv095KvRC41cg35
	gghkUBVFPENEpjL4bnZkAy+fH3scwuk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-tR9q6HzuMPWuMShlowdssA-1; Fri, 30 May 2025 04:52:48 -0400
X-MC-Unique: tR9q6HzuMPWuMShlowdssA-1
X-Mimecast-MFC-AGG-ID: tR9q6HzuMPWuMShlowdssA_1748595168
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450d64026baso4162705e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 01:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748595168; x=1749199968;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RivONRZmKtb6PAY6opK1Hx8XQmxD64BeDivEpsAjyjY=;
        b=ACsqYg8zrAHC7Z6GbZzBB6cB/OhW74t6FdYIq3KMj4FXNH9uv13i+3HoLgwLR+fWlb
         NLLNzFGEnt1VXlXip9yi9d9uE6SGrhxbH87RsnAPIB84cIg6WdvImXy5Q7+K75uHPk1D
         uoGqmBJsQujx8ry/gZAhx+LafZzd2Ruq0u2QlWGR7/FZN0VstJhejVjgF6jlZOAsX6Eu
         BiG9qzn5TOhx72tO73RcX44NuDdAoSyueyvL67o16DzsH5zow1ERuZ4qmGMPWUR/V2ZG
         iwEUI1S8c926HhXAIh07WyWQCq3Qj8iRaN/tdBqSmif8qTfpEJP4O3NV/sLDn/JuR6F6
         XTng==
X-Forwarded-Encrypted: i=1; AJvYcCWsHC57a6lPBWgQu8xKF/KU8nZWm4K2Zd5Hvwr7eHmQNc1kTIy1n5k9Ypx8nuYetYI2W4YZDGOllOpdnz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFh3NybmVkJ3sThc14g/8RMEsBGFxN0mL2iqDGdGbH7WLMQ9bQ
	DdJ/YioHAC1vHa8nFXEKYugL4/H+ya+r2vc6CBMJYzrJsPf9h5hjzhRsOpZ+S13OD7bCxIrdv/C
	HHeqWwkjqVk0ls/l9jOB0w7smusZZ3uaVwUVviFjKl+IdbpQpPcMh72Y3Y03EGvi4aw==
X-Gm-Gg: ASbGncuZ3djCTSHaUHzKVnZ3CFWNKV2XlPKJ93Ge7LW80S70HmIShf3suatG0iSkT+2
	+/brxY5MQkuqLBM/qK42PzQHwTgn2gd/5lwpG+s79KZ+kxD0g02xjxVd08haRY/7U1Wl1ra/zas
	dq/nSt7iDsQYY7d1CsOm/OzSP7nRF+KkpRpxWNEaKd2BUHe2ObkHvvZ7eJ7hyx0YDIjpbbszm6K
	LPvC1JGXyO7kJTP06FBlHeB7oqgosqGI5djhlZmXtib7uacCFoabG1fpkSvnI9L/p7AbJJar46p
	H7FqF5pQRoC3GoL8prOyaeK30iLSX+VtkRgwycNKOtfIfw5JJZ0nVPBVbba+9xVVQ9kbOXQ9645
	Pcj3LhzjgpF0Ly6yrROUrq+//Cc4GPLs+maGVFvY=
X-Received: by 2002:a05:600c:6286:b0:43d:fa58:700e with SMTP id 5b1f17b1804b1-450d6575664mr21159905e9.33.1748595167727;
        Fri, 30 May 2025 01:52:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNUcZukq/uatUBDvfuZ25brMX/E4xbirUMnKjhUU3zzKOX10Q2xDv4lEjZQMcq3GuaUcnUNQ==
X-Received: by 2002:a05:600c:6286:b0:43d:fa58:700e with SMTP id 5b1f17b1804b1-450d6575664mr21159655e9.33.1748595167391;
        Fri, 30 May 2025 01:52:47 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee? (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de. [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b96fsm4168233f8f.8.2025.05.30.01.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 01:52:46 -0700 (PDT)
Message-ID: <9c920642-228b-4eb0-920a-269473ea824e@redhat.com>
Date: Fri, 30 May 2025 10:52:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] fix MADV_COLLAPSE issue if THP settings are disabled
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com, Liam.Howlett@oracle.com, npache@redhat.com,
 dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1748506520.git.baolin.wang@linux.alibaba.com>
 <05d60e72-3113-41f0-b81f-225397f06c81@arm.com>
 <f3dad5b5-143d-4896-b315-38e1d7bb1248@redhat.com>
 <ade3bdb7-7103-4ecd-bce2-7768a0d729ef@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ade3bdb7-7103-4ecd-bce2-7768a0d729ef@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.05.25 10:47, Lorenzo Stoakes wrote:
> On Fri, May 30, 2025 at 10:44:36AM +0200, David Hildenbrand wrote:
>> On 30.05.25 10:04, Ryan Roberts wrote:
>>> On 29/05/2025 09:23, Baolin Wang wrote:
>>>> As we discussed in the previous thread [1], the MADV_COLLAPSE will ignore
>>>> the system-wide anon/shmem THP sysfs settings, which means that even though
>>>> we have disabled the anon/shmem THP configuration, MADV_COLLAPSE will still
>>>> attempt to collapse into a anon/shmem THP. This violates the rule we have
>>>> agreed upon: never means never. This patch set will address this issue.
>>>
>>> This is a drive-by comment from me without having the previous context, but...
>>>
>>> Surely MADV_COLLAPSE *should* ignore the THP sysfs settings? It's a deliberate
>>> user-initiated, synchonous request to use huge pages for a range of memory.
>>> There is nothing *transparent* about it, it just happens to be implemented using
>>> the same logic that THP uses.
>>>
>>> I always thought this was a deliberate design decision.
>>
>> If the admin said "never", then why should a user be able to overwrite that?
>>
>> The design decision I recall is that if VM_NOHUGEPAGE is set, we'll ignore
>> that. Because that was set by the app itself (MADV_NOHUEPAGE).
>>
> 
> I'm with David on this one.
> 
> I think it's principal of least surprise - to me 'never' is pretty
> emphatic, and keep in mind the other choices are 'always' and...  'madvise'
> :) which explicitly is 'hey only do this if madvise tells you to'.
> 
> I'd be rather surprised if I hadn't set madvise and a user uses madvise to
> in some fashion override the never.
> 
> I mean I think we all agree this interface is to use a technical term -
> crap - and we need something a lot more fine-grained and smart, but I think
> given the situation we're in we should make it at least as least surprising
> as possible.

Yes. If you configure "never" you are supposed to suffer, consistently.

-- 
Cheers,

David / dhildenb

