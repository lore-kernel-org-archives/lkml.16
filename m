Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB4D2BDC10
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750849779; cv=none; b=gvzOF/spgYkFFkz0ZJ9UsGVW+9mlICa81/nK11noDytdJUGxRZB31Y7xqZus8IYoDoSnBJHsBOlUOoqXy5xDAO4GxeRDhzNSByTf29DzVPwtzPCe03YkhSfWjOPK48OzFPXky8TaV0raxpl84CV+920Pd8eMEbBhlwnOwu0RxL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750849779; c=relaxed/simple;
	bh=UgtKUBNmcIe1/baVYM1JSjbXZFPfwNr0SY+tyrbOsm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gbo0f+Bc68FTlaBUCDHdzpMafAkOz0p2V+Tc+p787dhPd8E/bXUN3Gtu45pg4clNyt3ISlhlkZxYrIPkdoQN+4NSsaPgYT5Z9eTyzenabYgKs7uWBJ8UOdZIi8BuLJIqD9D6Pz/q2Tl/G5V/Tw9uK4mQAEtkYJXtvOigVUDE0Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T/EWpjqs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T/EWpjqs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750849774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qmBWPFc1Ccib0whO3GfNxLkkUEaY/v2cjHvs4XBp0gE=;
	b=T/EWpjqslGGW7D4BjzXyw5PqbBFFNdCcZ1rbLQD9yb0kdqoXQ/DB7fXp9rDSuaPK9EK404
	5AfvQ/W0IFi6Syu3t7Q3Cv7Ryx3shC70ibN6mOUgwrLY9up6m285bXiWXqi1sutvWkg07q
	oiVDuniR52LEqdylKoG0aryDWyDfwNw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-OjTMZUpHP0yDEbHehiWQ2Q-1; Wed, 25 Jun 2025 07:09:32 -0400
X-MC-Unique: OjTMZUpHP0yDEbHehiWQ2Q-1
X-Mimecast-MFC-AGG-ID: OjTMZUpHP0yDEbHehiWQ2Q_1750849772
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d244bfabso51101885e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750849771; x=1751454571;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qmBWPFc1Ccib0whO3GfNxLkkUEaY/v2cjHvs4XBp0gE=;
        b=pshgR1ziHiBYsVzVUYtM/LvFWx313EdA6B1rFbhsEaX1VSbTqXm6hmnzg++0MbrdxX
         bm8m20XZbMghttC3XRJ/UH68C+gSEwLVzE7NVnjJHGODg02CF1zI/cO9NkEqcAOhawrL
         JDx4Ca9xT9aPFzCEypJ2kOFwq2/FgyZT4QFQgmU/x2JCplvBbtMjl1Guq2GS5wJuQB+9
         aQcBwKHZ7OI/0B47QTuFkl7dpbT5jrFh7OieTNmY4fqDgZ9xK/YM4EPVDVD/JNjjJYw1
         8HqkwJb/1bl+T4m877GEEE7yJ0e6rn/hQE2HRntaDvyzaCmP20dggvrOZIo1AmSIYU55
         yzSA==
X-Forwarded-Encrypted: i=1; AJvYcCU/yuQv+qnQnbAkliNO26HjYO0Xbo0mr8jAbPugzUkTwKEyAYM3xpMiDHwudTG/Zr17yGDMlJJBsg7D/P0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNvm7XRiViafqLvyz8yxCYewWsARal3VYs59BSuk18Kk48CmiF
	RVc2DXrQfMZ9i4WaXsl+t0t+XAl0d+kMmwSg+yXq3RFpkvUWooNneDnz5952gul1wvi9t8reSMi
	IUH6L/0xJ64YXQdb8qkVIhZQemjOUVEjbtuYQqztaYM43umImml3vb5QZV7eQfoMKgg==
X-Gm-Gg: ASbGncuZOrdlaIQgxdzsz5ljFrdeZsFrQ8L4Cd0s1p86k+HDeHWTm05UBd53JpC8Fmm
	cQfpiQG6THwHKKsEcZZYdPzhJ3SgQBYgX4A9uP0HRd23saIrxZnsggXBtGiG3ieRD7JyyS5pI/Q
	aT+JE0NeVkeNKOUk8y+l31KP6fz5CyiDz2//SxKhJ/5fE9DHu7GQLMZJKX/kQe6IZTw2PIAHoH3
	R6dn4kmhV/F276D+pVS3+FQaLdyjqXMO4Jc4DC0Wff4owosSZ+/f5gGZqno15+ro76inYD5/+DF
	yVQ6iav+TbcecJR+Cu4Hjx/l5AB6rWLDv8QFxFP0/3IVkOITSA4aQ5uGTbcLmKo2wx+40OEq/pP
	hsYzllErVUlT9n4jJCryrJ+eDXO7piXeOlXuXftmd/9PL
X-Received: by 2002:a05:6000:4913:b0:3a4:d367:c591 with SMTP id ffacd0b85a97d-3a6ed5c7b26mr2056630f8f.10.1750849771575;
        Wed, 25 Jun 2025 04:09:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJL+R1nMhMjUmah6WqYReIZVqz1b0hBzvgjt41pI2x/YleKqT3OVk82IqOxqbVnGBYSuxkPA==
X-Received: by 2002:a05:6000:4913:b0:3a4:d367:c591 with SMTP id ffacd0b85a97d-3a6ed5c7b26mr2056599f8f.10.1750849771131;
        Wed, 25 Jun 2025 04:09:31 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80ffeb8sm4326819f8f.73.2025.06.25.04.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 04:09:30 -0700 (PDT)
Message-ID: <8d019d60-80c6-4e2a-a2bd-3a2868dbaa3f@redhat.com>
Date: Wed, 25 Jun 2025 13:09:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
To: Usama Arif <usamaarif642@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Hugh Dickins <hughd@google.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 zokeefe@google.com, shy828301@gmail.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
 <f1782ae5-c1d6-4f46-a676-666505990f4d@lucifer.local>
 <008ec97f-3b33-4b47-a112-9cef8c1d7f58@redhat.com>
 <f366ce31-582c-4f90-bc32-05ddf3e71fa6@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <f366ce31-582c-4f90-bc32-05ddf3e71fa6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25.06.25 13:03, Usama Arif wrote:
> 
> 
> On 25/06/2025 08:34, David Hildenbrand wrote:
>>>>
>>>> We would all prefer a less messy world of THP tunables.  I certainly
>>>> find plenty to dislike there too; and wish that a less assertive name
>>>> than "never" had been chosen originally for the default off position.
>>>>
>>>> But please don't break the accepted and documented behaviour of
>>>> MADV_COLLAPSE now.
>>>
>>> Again see above, I absolutely disagree this is documented _clearly_. And
>>> that's the underlying issue here.
>>>> I feel like if you polled 100 system administrators (assuming they knew
>>> about THP) as to how you globally disable THP, probably all 100 would say
>>> you do it via:
>>>
>>> # echo never > /sys/kernel/mm/transparent_hugepage/enabled
>>>
>>
>> Yes. One big problem is that the documentation was not updated.
>>
>> Changing the meaning of "entirely disabled" to "entirely disabled automatically (page faults, khugepaged)"
>>
>>> So shouldn't 'never break userspace' be based on practical reality rather
>>> than a theorised interpretation of documents that sadly are not clear
>>> enough?
>>
>> I think the problem is that there might indeed be more users out there relying on "never+MADV_COLLPASE" to now place THPs than "never+MADV_COLLPASE" to no place THPs.
>>
>> What is the harm when not placing THPs? Performance degradation for some apps?
>>
> 
> I think a bigger issue than performance degradation is someone upgrading the kernel and not
> seeing MADV_COLLAPSE working as it has since the beginning and not knowing that its due
> to a kernel change.
> 
> I feel transparent_hugepage/enabled is too messed up, and its difficult to fix it without
> breaking it for someone? I still find it weird that we can set transparent_hugepage/enabled
> to never and transparent_hugepage/hugepages-2048kB/enabled to madvise and still get hugepages.
> (And we actually use this configuration in production for our ARM servers).
> 
> Introducing deny for global and page size I feel will over complicate it because of the issue in
> the previous paragraph, page size setting overrides global setting. so even if
> transparent_hugepage/enabled is deny, we might still get a THP if the page setting is not.
> Someone needs to file to deny, which is the same as setting every file to never.
> 
> So I just wanted to throw another bad idea in the mix, what if we introduce another sysfs file
> (I hate introducing sysfs :)), something like /sys/kernel/mm/thp_allowed (or some other alternate name)
> which is default 1.

Let's rather not :)

-- 
Cheers,

David / dhildenb

