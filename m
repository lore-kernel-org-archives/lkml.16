Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17C21DC993
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 08:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746433136; cv=none; b=j5scOTMYm3cZTsYQNNvKfDzGv0tkM0KKaF+uVUTt9t9x21i6TJX2HiOTBrtzXHJdF4AbF3mUfL90ado4xl1dUPhv0RlzolBAfoKddkl0Nmh0uXs/CH9gQDJAFQ4lKeNTveRvqmLvo/aYCZHSIa0INL5F7R6r6buTo31C4qQ8raY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746433136; c=relaxed/simple;
	bh=8TvYNqWidSI+hUMShHa3ic7P/0TjSbRzbbW/BVDaREU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oHYuzCiXtWy3cJDGc1vd/pM7yERbiyx2Q/2bbAvqAvouE8Hm8BpPFcFAt3KD3fER+xbiUunuSDjIcvP0dyfgBGkfasd6kQY4lPgX/SLFYobsEeKNrfTdsPDsffePmstc8ZmwzQKwZI1RSe6603MdMn5DDx9wF/HDDiRGR3iRRSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ecV9pc6J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ecV9pc6J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746433132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KjLT3G0xBlvcpU8ScQJQ+pvLS7Ggl7vYC3787HjJ+VQ=;
	b=ecV9pc6J5/CD0+do18ow1wOg/fOom0UlEyIGIN9sJYzh1nZ+8MPNBzEoBYlyYNrreJc4Gh
	hCMkHmUT8XUtvHofS0pgUJfz5m4G7li+j9Z3SNw2/OIFsVnbToSOYRAOodMsPcEReIQTsG
	OMwSt6JnkiTf/t0iVAvlGbpEQRKXg78=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-Ffwso3OzM6efRF8dlEB2SA-1; Mon, 05 May 2025 04:18:47 -0400
X-MC-Unique: Ffwso3OzM6efRF8dlEB2SA-1
X-Mimecast-MFC-AGG-ID: Ffwso3OzM6efRF8dlEB2SA_1746433126
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so23905965e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 01:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746433126; x=1747037926;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KjLT3G0xBlvcpU8ScQJQ+pvLS7Ggl7vYC3787HjJ+VQ=;
        b=oJ3Zu7tFPTxXNjEA1nLLkSdKqNu/kCfymGSoncTEtF7xoYd/pqxMYgvald8oBko1Px
         EJjheM3KtVyVTMGlrJebXGLQRmbzDn507kgBRImLhg0EF2pxA+g0qss3Jd4hQdreXIqK
         VbFTmOfI8xEbcg7Hn+0KtMQAfWnw0GXDd1KUGvSwLd1uMA4dC39eLe/Bzlq+PbwG9oBH
         ZaQhQljus5CrxvCPU7WYaeqX4AGA4iaBO+HR5mkUBPCzdCvrFC+/S9rvJRxmaZ5d5JBE
         Vk21cdPqCy4mVtIEJBQQMNxC/NZRn9riOyIg7w4E7X/9M7TZdpKIyLltU7ydM170X8EV
         4C6A==
X-Forwarded-Encrypted: i=1; AJvYcCXXOticBYt8vtzatd70ffChu9qi0gzbNLC8zt4OejOeZ0QwF17yO/bro/s/NTQ7+DperO82/B4zH7Ze3Ow=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD3gPDigtSUU23TxaHug5EBh2bJa5CRO/XXgVWrh6zM5fa8GV8
	8G3F9hus2aqleDNcCUyiSl/T4LLXSKo574HjnQAA1CrrcQVLeNRX0vewRXY9cXipLpQBFj7G+p2
	WEfUNr3EsFH2Idx2Q/gmf1b0jbEHYj+k505lsjcsbSq+i0jz09GyNB70xT/cIWw==
X-Gm-Gg: ASbGncuzenUOE7cGBiQJ5fI1dWJksTV/Kb+ahRJzxijFHzkbpFoAf8USN5hzJ+uHIBT
	LigPtct9j4Up3hrWgLuYemmMv4pfX96RmDIayt2CxRddap9Uo4d/kmL+uFpdfSk9TcWSNwWCzNk
	Fq+XQWHqlMlUBYuJSTlnecypXkK9W97uBMEoUqBfdROaQl+KPJFQdA5UCaCUfSz3d2gtf5iK7mg
	fWQLZvo8C+L+H44CtQxOYfSO6DI1CMXDki0WNcZPWwRiju//edXxPSNNZAEuzrS7d0F6rRSPiw5
	3PalXMH8LlCU8z5nYL1wDYM6Z1IIFwFcw1ulkC40piE8Q0M8kTkSFm/lc8AWsBsFr/eEwacWw0o
	d2sN1tMY41urq9LiSH5wM6mF+y3FWAUyukcUyTkw=
X-Received: by 2002:a05:600c:8288:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-441c48dbf43mr49568405e9.19.1746433126146;
        Mon, 05 May 2025 01:18:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG903rCMBt0cxNVeaT2GK6YdeAMsrUHFLedAdt65uiIqOWq7Smarm25HhAmNZlJcpkJTINu0Q==
X-Received: by 2002:a05:600c:8288:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-441c48dbf43mr49568075e9.19.1746433125728;
        Mon, 05 May 2025 01:18:45 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73d:2400:3be1:a856:724c:fd29? (p200300cbc73d24003be1a856724cfd29.dip0.t-ipconnect.de. [2003:cb:c73d:2400:3be1:a856:724c:fd29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441c8631256sm40116925e9.20.2025.05.05.01.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 01:18:45 -0700 (PDT)
Message-ID: <8180a50d-eebe-4f9b-9ce8-d886654a992d@redhat.com>
Date: Mon, 5 May 2025 10:18:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] driver/base: Optimize memory block registration to
 reduce boot time
To: Mike Rapoport <rppt@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>, Donet Tom <donettom@linux.ibm.com>,
 Zi Yan <ziy@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
 Danilo Krummrich <dakr@kernel.org>, Ritesh Harjani <ritesh.list@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
 <aBdK2EIMYYRmmEwA@kernel.org>
 <a1e0cddc-ed38-4f48-b028-f3ab5025c157@linux.ibm.com>
 <188fbfba-afb4-4db7-bbba-7689a96be931@redhat.com>
 <aBhoqpC4Jy-c-74p@localhost.localdomain>
 <74c500dd-8d1c-4177-96c7-ddd51ca77306@redhat.com>
 <aBhuZWpZ7ltMuOe0@kernel.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aBhuZWpZ7ltMuOe0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.05.25 09:53, Mike Rapoport wrote:
> On Mon, May 05, 2025 at 09:38:43AM +0200, David Hildenbrand wrote:
>> On 05.05.25 09:28, Oscar Salvador wrote:
>>> On Mon, May 05, 2025 at 09:16:48AM +0200, David Hildenbrand wrote:
>>>> memory hotplug code never calls register_one_node(), unless I am missing
>>>> something.
>>>>
>>>> During add_memory_resource(), we call __try_online_node(nid, false), meaning
>>>> we skip register_one_node().
>>>>
>>>> The only caller of __try_online_node(nid, true) is try_online_node(), called
>>>> from CPU hotplug code, and I *guess* that is not required.
>>>
>>> Well, I guess this is because we need to link the cpus to the node.
>>> register_one_node() has two jobs: 1) register cpus belonging to the node
>>> and 2) register memory-blocks belonging to the node (if any).
>>
>> Ah, via __register_one_node() ...
>>
>> I would assume that an offline node
>>
>> (1) has no memory
>> (2) has no CPUs
>>
>> When we *hotplug* either memory or CPUs, and we first online the node, there
>> is nothing to register. Because if there would be something, the node would
>> already be online.
>>
>> In particular, try_offline_node() will only offline a node if
>>
>> (A) No present pages: No pages are spanned anymore. This includes
>>      offline memory blocks.
>> (B) No present CPUs.
>>
>> But maybe there is some case that I am missing ...
> 
> I actually hoped you and Oscar know how that stuff works :)

Well, I know how the memory side works, but the CPU side is giving me a 
hard time :)

> 
> I tried to figure what is going on there and it all looks really convoluted.

Jap ...

> 
> So, on boot we have
> 	cpu_up() ->
> 		try_online_node() ->
>   			bails out because all nodes are online (at least on
> 			x86 AFAIU, see 1ca75fa7f19d ("arch/x86/mm/numa: Do
>                          not initialize nodes twice"))
> 	node_dev_init()i ->
> 		register_one_node() ->
> 			this one can use __register_one_node() and loop
> 			over memblock regions.
> 
> And for the hotplug/unplug path, it seems that
> register_memory_blocks_under_node(MEMINIT_EARLY) is superfluous, because if
> a node had memory it wouldn't get offlined, and if we are hotplugging an
> node with memory and cpus, memory hotplug anyway calls
> register_memory_blocks_under_node_hotplug().
> 
> So, IMHO, register_one_node() should not call
> register_memory_blocks_under_node() at all, but again, I might have missed
> something :)

Hm, but someone has to create these links for the memory blocks.

It's all very messy :(

-- 
Cheers,

David / dhildenb

