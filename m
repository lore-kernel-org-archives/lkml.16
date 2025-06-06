Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8FD1FECDD
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 09:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200487; cv=none; b=KM/f2+63T9/+ZfL5DbhPOhj0DHJb0w5fVkUUDssAwykeJhE5ISXJq0byahfGmtjNTRaR2u99a/3BcZ4EYRO5FFu1euujmlT9e49Ez07t/i9CemVq/wYkJarfKODek+pGSv+EK6wr+hZFk3m/xG2dGNI23m0FDAI4TZTLipzq/1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200487; c=relaxed/simple;
	bh=EqtUB9+be9X72JTpQiQgH1LJ1jdcnOLhG2TR3XTDptQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJWh5XZLfKiJDQZkeKyn9yahtdvj1qas9EtuEi6JWkTMzjNc6jEiWictEl9ZD1AbQTKPzHA81HpX63j1CN4tO608wdcEX4ocEQPgYcEGXsLhQWq2lWHfEgUJ3M4W4kHX3rUwyDSlCiqBHBYExAkqIXDGCEfhB/bmZGqadL8X2co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EZG3hNen; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EZG3hNen"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749200483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tOWCFlk31CZuQCdB0f5vJT63IiiKg2xm3atdMLHFCi8=;
	b=EZG3hNen96vlu0arVUBh/F73B2CVklqVT3etCG6ulTUy+CA3n+FLq86dB91s0qKMmQNljs
	lhmL+S7XyBQaH7eFhh80HJ18zipcHmjAr1T8ExiW1D/BkqzYE8Ijl+AGKx3W38r6k9siva
	jU2fafz7raCTtUZwOL+pKb4R5Pboa/4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-FJSR4FrmP-aN0b7QrgegAg-1; Fri, 06 Jun 2025 05:01:21 -0400
X-MC-Unique: FJSR4FrmP-aN0b7QrgegAg-1
X-Mimecast-MFC-AGG-ID: FJSR4FrmP-aN0b7QrgegAg_1749200480
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4e713e05bso917661f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 02:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200480; x=1749805280;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tOWCFlk31CZuQCdB0f5vJT63IiiKg2xm3atdMLHFCi8=;
        b=UC6YpbNFrhHv4eKB0Kb1a7G8AfALhXCtl5E1K8o6m6kN8X06+02vvyFoaYsSBsShFc
         PxrolGnwWER8iYIyhOvtUODkyEjL5352dyOLy0o8f734AUyW2n4aimCVmzOcuZK+aHuT
         UduuaC2fV2uZaWm/cjQ5S3DTphFvJofS0GWSdCcTtwsPaUYWG4uvtHeenyfhE8mQ+e0b
         piK5DIVe8ZiW7BJbhRmQxbma3JFyNAUnSGSnseZorje6ezJPkH6CatywsBKBd8Hf05YD
         jwvhMgDom30n4q8ECHZEQJw4/CGqDO7VtA6a35J/35si0giozB5e6I2QTzHwSsYHlFt0
         w99g==
X-Gm-Message-State: AOJu0YwR7P3BqvFZjxOS+DS2FQ2HpwuL9bimDVJPjcv7ExP1n+IMILvR
	WdKk40LoWz8Mg+Zu+BoFA3E4+Uf6uqvhwHtys83uWF4lIpSOyFCSbIwnly98Pu9kw8rnYQUg/tv
	/5RYVHJu9XAOG/baxsm9g/nnPATYrkWYcgdEg70msUnzb5hlTRcTtZpeoAnmzO+9UMw==
X-Gm-Gg: ASbGncu89Iecs1AuloDbBEFrf38lJi9gBeCfghsrgdKAfSjSDZXbiBpG2qcy9ggOvrU
	GMMWXjV6kHNpVE8Y/g9idIgFekPhd5Y5yjJ/WvVeMXQ5qpLrb5Tg0M2Bz1uGhN76aD7UpDQ//h5
	+7VxTPuIXppBlpDQhrUiPK2K4qJRmmY1mY0unawsYIhNaXhOCWVfz3wuzRk9re6shaXnhR90k2y
	5ZPUq35VZszyfptL2Sk3rnYQuHydZkrEYAc35LDa7m9vcH8iOipy8h/2u6DTh4eS8EA+TZmHAcV
	WHr4LuGD4md6txolzgD7jef3JLjrZoHBHnAsrfG8GyKjAZ3TAz44pcJiUWfWm4UDKME7lbLH0tb
	TBChXhG9B+L0fZviPXHigWgRZdj/sCb2SvcvfZaeuCQ==
X-Received: by 2002:a05:6000:2f88:b0:3a4:c8c1:aed8 with SMTP id ffacd0b85a97d-3a5319a6fa1mr2383168f8f.39.1749200480384;
        Fri, 06 Jun 2025 02:01:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmncZ3r0YoJhIIk0EbK5a0RXDSlZlZ6T6U3e0uLpxD+AJIg/gF06vW7DnEQ3sjEHAYzUO6gA==
X-Received: by 2002:a05:6000:2f88:b0:3a4:c8c1:aed8 with SMTP id ffacd0b85a97d-3a5319a6fa1mr2383115f8f.39.1749200479892;
        Fri, 06 Jun 2025 02:01:19 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:9c00:568:7df7:e1:293d? (p200300d82f199c0005687df700e1293d.dip0.t-ipconnect.de. [2003:d8:2f19:9c00:568:7df7:e1:293d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213709729sm16879615e9.19.2025.06.06.02.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 02:01:19 -0700 (PDT)
Message-ID: <e680a8f3-7b45-4836-8da7-7e7a0d2fcd56@redhat.com>
Date: Fri, 6 Jun 2025 11:01:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
To: Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>
References: <20250604140544.688711-1-david@redhat.com>
 <aEFC_12om2UHFGbu@tiehlicka>
 <1a65d0e6-6088-4a15-9c19-537203fe655c@redhat.com>
 <aEKnSxHG8_BGj7zQ@tiehlicka>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aEKnSxHG8_BGj7zQ@tiehlicka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.06.25 10:31, Michal Hocko wrote:
> On Fri 06-06-25 10:10:14, David Hildenbrand wrote:
>> On 05.06.25 09:10, Michal Hocko wrote:
>>> On Wed 04-06-25 16:05:44, David Hildenbrand wrote:
>>>> Especially once we hit one of the assertions in
>>>> sanity_check_pinned_pages(), observing follow-up assertions failing
>>>> in other code can give good clues about what went wrong, so use
>>>> VM_WARN_ON_ONCE instead.
>>>>
>>>> While at it, let's just convert all VM_BUG_ON to VM_WARN_ON_ONCE as
>>>> well. Add one comment for the pfn_valid() check.
>>>>
>>>> We have to introduce VM_WARN_ON_ONCE_VMA() to make that fly.
>>>>
>>>> Drop the BUG_ON after mmap_read_lock_killable(), if that ever returns
>>>> something > 0 we're in bigger trouble. Convert the other BUG_ON's into
>>>> VM_WARN_ON_ONCE as well, they are in a similar domain "should never
>>>> happen", but more reasonable to check for during early testing.
>>>
>>> The patch itself makes sense and I think it is good time to revisit old
>>> discussion [1] and finally drop VM_BUG_ON altogether and replace it by
>>> VM_WARN_ON which could be still a useful debugging aid.
>>
>> Yes. I think we should check all cases if they are really relevant (and are
>> clear), and also handle BUG_ON on the way.
> 
> There are more than 600 VM_BUG_ON instances.I am not sure it is
> feasible to review single one of them.

I'm sure we would be done if we would have started back when Dave R. 
sent his patch ... :)

It's not that many files, and many checks in a file are often of a 
similar kind.

Like many "folio_test_locked" checks.

> Turning them into VM_WARN_ON
> should be reasonably safe as they are not enabled in production
> environment anyway so we cannot really rely on those. Having them in
> WARN form would be still useful for debugging and those that really need
> a crash dump while debugging can achieve the same result.

One question is if we should be VM_WARN_ON vs. VM_WARN_ON_ONCE ...

VM_BUG_ON is essentially a "once" thing so far, but then, we don't 
continue ... so probably most should be _ONCE.

> 
> So while I agree that many of them could be dropped or made more clear
> those could be dealt with after a mass move. An advantage of this would
> be that we can drop VM_BUG_ON* and stop new instances from being added.

As a first step we could probably just #define them to go to the 
VM_WARN_ON_* variants and see what happens.

-- 
Cheers,

David / dhildenb

