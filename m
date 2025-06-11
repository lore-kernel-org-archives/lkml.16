Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036EB25C804
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749634337; cv=none; b=I7lSDW3pisgRu8K0urmdjobZjOqdNVN+0riIwgHQhkgzkYOXHAd24+fzG7C4KXwBdM9dFXFuNy4LiUjqm6ZlCyi2hk9IHhFBbk4ZkCWBn64ivfn/ACpmaQzXu6GZgKdptdBCZluA2eeVtBtT8IXygUYrvkwe67w+WaXHklCzSgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749634337; c=relaxed/simple;
	bh=YKY6/2qjLLYeimKBBe0MU98OVULg4Q6T7GCL9d26CdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jEs8BLXxALljAk0YUdvf/i5rYY+Gc7PvGR8cgLom5ePlrWpR5WYXagGXbmnqUYuVu4c8wrMyhD2Mj6EgO05V6rtkBaUdONfG4g88HSRoYXM1gxC6+Uep7m31elCtdz9AdXkGl/H5+p7uv9XT9sSfI2S0Z4e8vMj0lJmCc73IOnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RtLejUMG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RtLejUMG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749634333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=71fhB5VeP+2nSb02X7fqqjOs0pxppOIqEk/Q6ALweGY=;
	b=RtLejUMGoundfBIB15TVjnWVNIVrUXytlte4ZFf3aJPzNsKUIjHn1M0Wcec7CKB6sk7MMl
	iIzT24klmxa754ltVDwwf8/r0d7c9/ikYPHnUrC18pGOq2z/CXTjktTNZtEIkoG7LTtD8J
	CDWPGHNUMT6YgfNmeMmU7Kkn4FFGDFU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-to5jadteM8m_liP24VVIgw-1; Wed, 11 Jun 2025 05:32:11 -0400
X-MC-Unique: to5jadteM8m_liP24VVIgw-1
X-Mimecast-MFC-AGG-ID: to5jadteM8m_liP24VVIgw_1749634330
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ade70c2cfc1so166370666b.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749634330; x=1750239130;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71fhB5VeP+2nSb02X7fqqjOs0pxppOIqEk/Q6ALweGY=;
        b=EPg69eodtYQxdBgROKHMZ9Mv6pVJzVgnUDBUkcHV1eBy2E9vA/wGAclsd5PO/C3tcR
         LilyYfxI+nb2WbryW9PR1ejN6JR8rdad9NhPwpJjARxONga2It69Pj/iMqAdhWQqwhif
         WVgPRiHXweURY/6ZwgnWzdle1E6Pv/4Y6UcTN9JOvoClqVnPXsSSb/wIT1dKK4En2LW2
         eN52xtH5g1Lf+Z0H/VULTsklDVGyiBS58dVNK62f3bbwGPj9yQ8bfnBQ/It/tA8EtE3k
         w13EqR0PbeEm1LtxQcex+edOS8f/UsWVAym51bSPDpCNVcI5j8TjgMaAvsQTG1rDmFVz
         HCRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh0qRQ4go1M7uw8gfxHbG16NqIqV7d1uZ9P4Y0z8mkrtb5C8HpyjX5R9zU8Xtvl31FVPOA+eUgODDwMkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKM9iQnppSSWN9UVwx4pXugNv2oeCc5gioL5YEHGWYPjTu361I
	PF1ejX8HY9RNBMPmUTtYKITEnBj430zGxvN9MVHMub9qkTQFx4BYccSXGQRJVVq3lywMBSaWKm0
	jzBEL6HfMG6ntpOLpWTKtYrdUI62eXpkMy20IriU/lcbNAsccjHLybNyt7wQgm7IW+g==
X-Gm-Gg: ASbGncuzpgnzsRetjmnbNm6dMRJWQ+dfp3HQA3epAA9gqLfczKCrw6p6sb98Wuu4r9l
	f8nT+seiJtdVm4Tn5m/kjvukcWz4Dk+B8rbwcmd2BNuVPjre4wcH8UsM3s0qrcJ9j18xVrKGGrn
	qnxkMVOx0Cu4NFXj2ziBGWT7gjX6R7CN28JxhJBRibb85bEwYayrX3bgeneoh9LvWVk2mTzUsS4
	iH99aXn2vI0n8lbpWW08BkQPs3Zmadm1AKKRoKhpljkzwQ9T2rop5ZwwxNif1hieJS9stnfU10M
	5NwfiKmphndIl8VsurwvutSm+I/AKwZM9vR8VBOXuHGv
X-Received: by 2002:a17:907:3f28:b0:ad5:b2aa:847c with SMTP id a640c23a62f3a-ade898378c1mr260051566b.54.1749634329720;
        Wed, 11 Jun 2025 02:32:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGCk4miCd9FKniY2kCHdXY0L6USYVDI4mV1vol3NNEUtTIAjXAlf6sYnQzJCcoZkPFY8KWfQ==
X-Received: by 2002:a17:907:3f28:b0:ad5:b2aa:847c with SMTP id a640c23a62f3a-ade898378c1mr260047966b.54.1749634329202;
        Wed, 11 Jun 2025 02:32:09 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754896sm852327266b.36.2025.06.11.02.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 02:32:08 -0700 (PDT)
Message-ID: <e3db61eb-6dda-44f7-94a7-97f43c19093e@redhat.com>
Date: Wed, 11 Jun 2025 11:32:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
To: John Hubbard <jhubbard@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Peter Xu <peterx@redhat.com>
References: <1a7513cf-4a0a-4e58-b20d-31c1370b760f@lucifer.local>
 <e898e52e-a223-4567-9514-b4a021b5d460@nvidia.com>
 <72bb36f2-65b6-4785-af9d-5b1f8126fc78@lucifer.local>
 <2f866f12-2aa0-4456-b215-08ddc9b13b1e@redhat.com>
 <3dfbbd63-697d-42aa-8906-539d74df9123@nvidia.com>
 <44af8f5a-2d94-498b-a3e0-31f5dde74538@redhat.com>
 <20250606184212.GB63308@ziepe.ca>
 <f2d8febc-cf95-44dc-9f01-b28151fe1282@lucifer.local>
 <e5e88da7-d7c5-4a10-9318-76c1e38dd0a6@lucifer.local>
 <20250607134214.GA158671@ziepe.ca>
 <04f52d21-baeb-4286-99eb-99edead514b8@lucifer.local>
 <8ce6c104-d2fb-4fed-a108-224a6113c227@nvidia.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <8ce6c104-d2fb-4fed-a108-224a6113c227@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.06.25 20:00, John Hubbard wrote:
> On 6/7/25 6:53 AM, Lorenzo Stoakes wrote:
>> On Sat, Jun 07, 2025 at 10:42:14AM -0300, Jason Gunthorpe wrote:
>>> On Fri, Jun 06, 2025 at 08:03:15PM +0100, Lorenzo Stoakes wrote:
>>>> On Fri, Jun 06, 2025 at 07:46:52PM +0100, Lorenzo Stoakes wrote:
>>>>> On Fri, Jun 06, 2025 at 03:42:12PM -0300, Jason Gunthorpe wrote:
>>>>>> On Fri, Jun 06, 2025 at 08:23:25PM +0200, David Hildenbrand wrote:
> ...
>>>> And I guess we'd not want a new interface for this like WARN_ON_ONCE_STORED()
>>>> because that'd be... weird and how would anyone think to use that and nearly all
>>>> cases wouldn't.
>>>
>>> No! Delete WARN_ON_ONCE and say the new global mechanism is good
>>> enough to capture the first WARN_ON, everyone always uses it always
>>> and then nobody needs to think about this anymore when writing new
>>> code.
> Interesting. This would cause WARN_ON*() to act similarly to lockdep, in
> that the first instance is the only one that works.
> 
> That works, but if-and-only-if the system is kept completely WARN-free.
> However, I have a mitigation for that, below.
> 
>>
>> Well that is simpler :)
>>
>> I have encountered situations where I've had more than one and needed 2nd+
>> but it is rare as you say.
>>
>> My late night incoherent babbling yesterday was perhaps because I
>> misunderstood David/John as to what they encountered in the past... maybe
>> they can clarify...
> 
> I've debugged lots of production systems, often these were large HPC
> clusters and supercomputers. I've seen:
> 
> a) Long up-times, with (of course!) relatively small dmesg buffer sizes,
> so that early logs are long gone. This means that WARN_ON_ONCE() is
> quite often gone (overwritten). This is common.
> 
> The worst part is that if you go to reproduce a problem, you don't
> see the next warning in the logs!! This is devastating, especially if
> the site makes it hard to ask for a system reboot. (If you have
> ~20,000 nodes in the cluster, a reboot is not a small affair.)
> 
> b) WARN_ON() loops that fill up the dmesg buffer immediately, which
> of course also overwrites anything leading up to the first WARN_ON.
> 
> However, (b) is rare on production kernels--it's more commonly
> self-inflicted, if I make a mistake and write WARN_ON() when I should
> have written WARN_ON_ONCE(), in a custom build to explore a problem.
> 
> c) Other printk-based noise in a loop, occasionally this also wraps
> the dmesg buffer. Especially if a customer has done a bit of their
> own "special" logging code.
> 
> 
>>
>> I do find myself grepping dmesg to find the first warning and it's
>> _annoying_ to do so, so this would be handy.
>>
>> But I'm not sure it'd justify getting rid of WARN_ON_ONCE() when you are in
>> a loop or something and now your dmesg is going to go to hell, still useful
>> not to do that, esp. if you know there's no value to further warnings
> 
> In all cases, the ideal outcome is a dmesg buffer that includes (let's
> fantasize for a moment):
> 
> 1) the earliest dmesg output (showing any oddness with system
> configuration, and what hardware was brought online, etc), plus
> 
> 2) the first problem that is logged, plus
> 
> 3) ...sometimes two or even three things happen in order to get to the
> problem, so (again, fantasizing!) really the first *three* warnings
> would be good to have.
> 
> So this is just a 3-element array of global warnings--not another
> circular buffer, but a little larger than a TAINT or lockdep type
> of capture.

Can't we do something very simple to get started: remove VM_WARN_ON_ONCE 
and implement VM_WARN_ON as something that uses a single global variable 
to print up to *magic value* 10 warnings. Then we'll simply stop 
printing any further warnings.

Races when updating that global variable? Who cars if we end up printing 11.

That is, have a global limit over all of the VM_WARN.

Later, we can do more advanced stuff, such as storing them in some other 
buffer to persist them etc.

-- 
Cheers,

David / dhildenb

