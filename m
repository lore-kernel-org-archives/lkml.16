Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAD322F77F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750670619; cv=none; b=ZjutajXuJ+lu4NenhE33eTYPEP2AcV+9JqnkeMyRpnFCUDhEqnIQ/7nKKKiM+YvkLxAV6w7KdqprjdbsjCmnJVuROw41Vsa0JvB4ezEjn2zBEXxeroXrGW8t8qk2ZxMbdl8AgkXOW3c/vu+hXArnOk4648ZeHYcPh2K3Pcnze78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750670619; c=relaxed/simple;
	bh=2uGvvBSzRq+K8V3V1RO3fa2MVk6FCyRwLnwzrY6c+8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bY4sUoXqlMbjcnYWGClwSFt6CCBHQXXFgYFsd6rEN3Nks5bqO8LaczUT7VDakct7qJuWsQWz1q4MiCVVwh78MJ8lySNRKg2f2O8HqDR+0/rGk+y0SVPL9mzLMarrrKH0hia578aMVLCNPoJ62P2V2jVsCS9DHpyeS6Nh1AIfoqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DORUuW9w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DORUuW9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750670616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GOj25buNXtOqfZprPvFAuj5c3ThwUb4NGf+6/oB4SGk=;
	b=DORUuW9wrnsv+6GD2qcVO/Hdzf6o6OXw2x1IDNkfEbp7g38bXl1RIOmcf6M9rctXfhMOYE
	islIq2lAyHXyhTcdRVbKkfHvVh1Rg5W7OxFl673rU6EzU9xDWSiRrgg0ULez8LgGMyauRx
	1mJ/zFsFvVCGDf/qJmHJc8yFxz+y5d8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-6KA6OBCSPPKJw6YwLQvY2w-1; Mon, 23 Jun 2025 05:23:29 -0400
X-MC-Unique: 6KA6OBCSPPKJw6YwLQvY2w-1
X-Mimecast-MFC-AGG-ID: 6KA6OBCSPPKJw6YwLQvY2w_1750670608
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a6df0c67a6so734542f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 02:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750670608; x=1751275408;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GOj25buNXtOqfZprPvFAuj5c3ThwUb4NGf+6/oB4SGk=;
        b=f807pQSrRpQfSbqdqdDylE3B4Evm65OZ/O5pUvJbv768G3HphWmyLfTO/xildStYHp
         tbDtDz5+vqc3sVy5wtRYPHVI4DSMV2sWVRb/rqCoC683O3C1a2ljjj9ZzJQe0mY20KCZ
         E49uJ1ogNyGYJIqfUuvkgC707YfVub4vjwTEw4YnIrO0wjpYYUFYah+YaxUJZbWun5j5
         U1O0vlb9oy2DJ0gSv09xJQWI42M16Z8loo6yd4bUO516wBxwRZIdTslYFMDb3lGDmQmz
         nmfbfCVpSJUvaSwjLN73MEDU/jKSxqpcr89KwdUKdISUe5Mvyly0aiUnjMHWM1VbAXbr
         Terg==
X-Forwarded-Encrypted: i=1; AJvYcCUBEtHVIshUXyJXbRgHvcXNHoSRyaow9DNIAVFtsLMtvyLDSDaklQHEyV/5q3QWj4bfRovCWXhk6cGs31E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyxJfHC8t87EEXKT2WSBFxxgyTEr1K0HLU5D2WaDsx/CQVEXvl
	A8vV3r9zbXxfsb+DPb/hSrTeyM/Fva3wIfWVobeuGkpAPJXgW4QhbmEhWfEbqR4Kh+IA3RO8sk+
	FMw+dsP22QRv1gZJ2pFIP7nJcZ3cYRr1EYpga7E6tr7CF7bbhFuY3tc4MgEWXzynFrw==
X-Gm-Gg: ASbGncsmLC6/X07Q9GGXf4RcQJmk6/Q/IVG20K8dCLf4oVVHQe01yvjDH8pyjBvF0xE
	L1HSr+Iy47qxMJpf3Q5aSg4G/xY+5/MEm4D9wqHp5CNl+aqS16r999e/iH/fVwxlcfVZrc4OM4X
	C13XcpqctCznMwhnlgwtXsqfGzKaXNnfdG8ozAz4XTRleN/jbgLSjlGMLiwo/w3MrcHcMcBjPvT
	VZT8HZEgwkx6C7z1oP8V2Wh7VwFAKfDCUD90Y7bXVkVSFqfn3pGjhKyc4srMCyHc1hX/YgOwi0L
	LWEg0Hx2FWZHbWUeCgtokczhHt0JhLKvWZPdscnQCwV+iClQ4sKR84Ky23hWjwiMv/Lr8wipAGc
	DsF57O47Z2Uqn+fuyH66BYbLG4ViXXNei4Mn+70c/YQ3D92BpvA==
X-Received: by 2002:a05:6000:288d:b0:3a5:8905:2dd9 with SMTP id ffacd0b85a97d-3a6d1331316mr9727233f8f.51.1750670607994;
        Mon, 23 Jun 2025 02:23:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG47+uYfDl+hhBzjGxFAmTc8bVeVG09qwFAIezKbl60jmjcKeIjGGP6ZE5rp+ZC1ofbN2UAdQ==
X-Received: by 2002:a05:6000:288d:b0:3a5:8905:2dd9 with SMTP id ffacd0b85a97d-3a6d1331316mr9727211f8f.51.1750670607622;
        Mon, 23 Jun 2025 02:23:27 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536c77b980sm62745075e9.23.2025.06.23.02.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 02:23:27 -0700 (PDT)
Message-ID: <3c5f4ecf-d71e-4e61-a3d2-b7cdb3043efe@redhat.com>
Date: Mon, 23 Jun 2025 11:23:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/balloon_compaction: update Chinese docs for
 movable_ops
To: Dongliang Mu <mudongliangabcd@gmail.com>, Nick Huang <sef1548@gmail.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn,
 corbet@lwn.net, akpm@linux-foundation.org, wangkefeng.wang@huawei.com,
 vishal.moola@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250622004249.9083-1-sef1548@gmail.com>
 <b16a1df5-0b81-4600-bd68-2d261d2a3780@redhat.com>
 <CABZAGRGvf9Ge5EvMgFP3FUHt2QOpq6xXe9nB4=it9zb+V1DNwg@mail.gmail.com>
 <CAD-N9QV5r4YyO6qbL477x0sJar2=WTdHH=x58P9Qatff_HC3Nw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAD-N9QV5r4YyO6qbL477x0sJar2=WTdHH=x58P9Qatff_HC3Nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23.06.25 11:12, Dongliang Mu wrote:
> On Mon, Jun 23, 2025 at 4:51 PM Nick Huang <sef1548@gmail.com> wrote:
>>
>> David Hildenbrand <david@redhat.com> 於 2025年6月23日 週一 下午4:08寫道：
>>>
>>> On 22.06.25 02:42, Nick Huang wrote:
>>>> Remove Non-LRU Page Migration and Add Movable_ops Page Migration
>>>>
>>>
>>> I'm afraid most people you CC on Chinese doc updates will not be able to
>>> help in any reasonable way.
>>>
>>> --
>>> Cheers,
>>>
>>> David / dhildenb
>>
>> How can I fix these things?
> 
>  From my understanding, you can follow this how-to.rst[1] and submit
> your patches.

Great, a how-to.rst in a language I don't know. So I assume you meant 
"one can follow", not me in particular. Because I can only parse some 
git commands etc in there that are in English.

Which bring us back to the problem: if you CC me (and many others) on 
something that is Chinese, I will not be able to contribute anything of 
value.

Quite the opposite, I will ramble about how non-sensical these in-tree 
translations are.

So likely, when you perform a Chinese doc update you want to only CC 
Chinese doc maintainers. Because they can actually provide review I hope.

Maybe that should be clarified in the how-to.rst[1] that I'm afraid I 
cannot read.

-- 
Cheers,

David / dhildenb

