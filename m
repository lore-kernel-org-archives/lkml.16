Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04A5218ADE
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324684; cv=none; b=nydKZft8/kzRbXobz1idvimpHis2yiq78WEgo17zswPxCOoiOFgdEowPWGFYnhLrtS/zvbk7MJcMH0NtHmBhlfBwQVdTCjfcjNN0XtAIoFuAAcM0Xy4R5tFQK1n16C2KwSs7JP1DbPrOAl6U5lnr+r5Z9UlQybatLgde7j0L7yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324684; c=relaxed/simple;
	bh=CAgCfn0usxCDJUXcWdbnIyg7vNppfrJHISEf1FxTwaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hNDAOk+x1fxAUIetAA/rZ+PPtekPtwAWmzgnCH8f6LfzfZ2COROjg1REXk5M9wRekd/aaswq8cuvJvzcD66TWDYqLmCyJrIR+BHB9PW8Rgy4j7ck9J7FBP1LtrClEYDnD7wCDFgS6MAZCK3vwyNniQE3dw0xdYTUV5yzJ+3M5qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P8wbBbBM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P8wbBbBM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747324681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SpV+trH7vdH9L7Y0TWVgvx/frrwF3qxSlQvVXRFdAuo=;
	b=P8wbBbBMJmvyhfk30kMedNWtBoxPZBIkjiLq74iGXjLcfM7VrZwRhvkLi9PCLVRWNAXcNv
	dQtlcyF5htNxLnKjfdkdVOK+sVmdiBx+WyK6pZCyYAmOYX0bhmglJIFnp9KztZxIdddkjx
	aBaKvpY/Bztkl3uU3zP0rgAQA5ceDiM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-74SJw59IO6iUF_rqYG7K-w-1; Thu, 15 May 2025 11:58:00 -0400
X-MC-Unique: 74SJw59IO6iUF_rqYG7K-w-1
X-Mimecast-MFC-AGG-ID: 74SJw59IO6iUF_rqYG7K-w_1747324679
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a205227595so591904f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747324679; x=1747929479;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpV+trH7vdH9L7Y0TWVgvx/frrwF3qxSlQvVXRFdAuo=;
        b=riM7/CMiokNIgyRre0liP9fT5VlPA/LaQPHNZY2VjmTzpnmIHQvgJb1ZxPNJr85/jk
         u8FYyL2ZUZWfBsDtLmkrHhVnT6r+2gBSE9du5ki/0ImDw+23gap5OkFT0GadK8B+toOF
         /k417yXs06LgXRkGtBs86U6em92XZBjAQ9O60wp3LAaxniU4ECoxOboBEhX1gl6EZkMI
         8qysaPMrV9RaJH81Skm/4Ytj/rOZNyb064RwMCmjYiBUMepfzL+kLzeMX5/JEEVde2p7
         ZVIDKMKtgkP1lwkrqeSU9nhzUPMTBMKWikX+x5029SrXhE+OZM92ZgPlsWovWrxSZOQk
         NO+g==
X-Forwarded-Encrypted: i=1; AJvYcCWdalKM0lGPbha38MmidygB/WpA/n8rGtl58mJablaKASWrcrPaR9cR9ky4ei3BQJs7wW59UujsYu0xgPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAtuMnqwv+pz/FFaWEkuQRaJNOAJ+dCeyLvHmTD+pHY6OvSlrj
	EK5HtsqrQNG3PcY+RjOT+V7crbd4s2hPPxxf5Ru2rYTKBTCRmZFPIUNjw0pzxRy6ivoLXOkZHrg
	RNkU4YBvjo4V0nmPd/XgEgyUA2Xlsu2bT3pXEj4ZPJIvorc9lWqM2CO+XQA4wOfjL+g==
X-Gm-Gg: ASbGncvlcKccncbG6CFOXluOYhvfwXg1MeyHiLsYI/uNFMnQWJyjvrxs3VLXqTLGUSk
	iOfGhjE3REpaLm2aW7UkNWlmbquoYS9hZ8v4rSoF9emTasgunJaRu5JXfij+GuQTatze0xxzjpl
	0Gc3wLN9lRh0zvz4b21YrmEaQUI3NWf/cr9vdxREZu5h6uaoOQBHEp97qtxrmfKBrRNHIf6WBq9
	mYt2OLHVcKtrwFaRZj/AxbpbIpnABV+crKA9L+JEGLrxiVsbGxOhDY4lM5+c7kD0pBwvw/kJcNo
	ZhDni+42ebCmydpgBQMkgr5mm1Ou+3KmecWRaGDLA4ak9FrhCOAUv3ul/Bpy6ScPmgb6pGTt9CT
	UYmfX1+zU+J1ioQNbogcCQz1WA3JrQ+3g4ZYL4ds=
X-Received: by 2002:a5d:59a5:0:b0:3a1:f6fd:89da with SMTP id ffacd0b85a97d-3a35c8246d2mr312313f8f.31.1747324679292;
        Thu, 15 May 2025 08:57:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgna5Lm+DSIwVvuvxQmNhuZ1mmOTx1cg3R/ULzXDmFNfpsYDOXil9TXN8xmMqKs9yeo2pNig==
X-Received: by 2002:a5d:59a5:0:b0:3a1:f6fd:89da with SMTP id ffacd0b85a97d-3a35c8246d2mr312285f8f.31.1747324678925;
        Thu, 15 May 2025 08:57:58 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4a:8900:884a:b3af:e3c9:ec88? (p200300d82f4a8900884ab3afe3c9ec88.dip0.t-ipconnect.de. [2003:d8:2f4a:8900:884a:b3af:e3c9:ec88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2cf1bsm23471025f8f.72.2025.05.15.08.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:57:58 -0700 (PDT)
Message-ID: <360bac52-2cda-41fd-a674-89b113fef918@redhat.com>
Date: Thu, 15 May 2025 17:57:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Usama Arif <usamaarif642@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
 npache@redhat.com, ryan.roberts@arm.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <2d30bcce-6f80-468f-945d-b63eff726db5@redhat.com>
 <kuxzxh4r6fapb5tjbhvm7fsw7p2g6vlasdv46j2ggedmbbsec2@zgt445q4oob2>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <kuxzxh4r6fapb5tjbhvm7fsw7p2g6vlasdv46j2ggedmbbsec2@zgt445q4oob2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.05.25 17:45, Liam R. Howlett wrote:
> * David Hildenbrand <david@redhat.com> [250515 10:44]:
>> On 15.05.25 16:40, Lorenzo Stoakes wrote:
>>> Overall I feel this series should _DEFINITELY_ be an RFC. This is pretty
>>> outlandish stuff and needs discussion.
>>>
>>> You're basically making it so /sys/kernel/mm/transparent_hugepage/enabled =
>>> never is completely ignored and overridden.
>>
>> I thought I made it very clear during earlier discussions that never means
>> never.
> 
> I also thought so, but the comments later made here [1] seem to
> contradict that?

It's ... complicated.

> 
> It seems "never" means "default_no" and not actually "never"?

We should consider these system toggles a single set of toggles that define a
state, and not individual toggles that overwrite each other.

If you say
	/sys/kernel/mm/transparent_hugepage/enabled = never
and
	/sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled = always

instead of the *default*

	/sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled = inherit

the admin explicitly stats "I want the system behavior for 2048kB not to be configured using
/sys/kernel/mm/transparent_hugepage/enabled". That's an admin decision, not a
per-process overwrite or whatever.


> 
> Maybe the global/system toggles need to affect the state of each other?
> That is, if /sys/kernel/mm/transparent_hugepage/enabled is never and you
> set /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled to
> madvise, it should not leave /sys/kernel/mm/transparent_hugepage/enabled
> as never.

I recall we discussed that, but there was also a catch to that. :(

-- 
Cheers,

David / dhildenb

