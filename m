Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B62F1548C
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 19:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747336831; cv=none; b=sS+iBmLJ3O88eI3S/Uk3t3qJvTDkgKBsehzaaKfXV38+jsFolqgvgPj5hsDKv7zjPtmpBJwUMh0App1csm8yqi6u0G7A66Nq5R9r7FMy6kiTLPXFICKom+S1I6s94FgJRLiwJp4bcrNBjtGA7mpMTA64nFMYNDFW9ZQHwACYZRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747336831; c=relaxed/simple;
	bh=CBlhLOHkKA+pj2lo4h2If+hfeTb2lvwm8prkReej+uM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=c/zuB9DhHF6AaHfRUHbPfizV5Uuzbgmh1wfWJbRPoEykBYT0C204qaNoiaXfLo/Ovj3dm9IOhklGSTDxyizabYBZGMuF7AGyDSmrLHyH/aa1Vj0h5Mtp78no/j+Wlp7UaIkt8UOs2FmfGWvR2n6baLsdtpp+Y7VnKc11SyOyi8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RXdvZSkQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RXdvZSkQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747336829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iQU5Q6NSs8XSgvdZebhHC1w5xiLFlwEAyk7vktJIOsA=;
	b=RXdvZSkQKi4gNksaxF1NM5eg280bQ4l+TbVXrtP09UpiZVUfXlRZ/LnOmLCfcnTLzx5sJ9
	LdxWmjDqNtT2Gg6+vbzt5AXT4c627pIYg2AkK37Hj7mD3LbvfnNakNbsqJW1EOr+JlJXDW
	32PSBGVB/KprnNa4lmdfNmWH6BRHqss=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-BChomcVoOIKZwZaUaWFapQ-1; Thu, 15 May 2025 15:20:27 -0400
X-MC-Unique: BChomcVoOIKZwZaUaWFapQ-1
X-Mimecast-MFC-AGG-ID: BChomcVoOIKZwZaUaWFapQ_1747336826
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a3591c42d4so757797f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747336826; x=1747941626;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQU5Q6NSs8XSgvdZebhHC1w5xiLFlwEAyk7vktJIOsA=;
        b=c5Ro3HxoeQD0jOYlYiolZs6J+ME6WnO3uQI1Xs9kKvbdC2+eey3e5RPQUmTAlV6rWC
         DhRqA4GkC99PVYB1vsCXKbUzrDfCwNsfMC/nRL7UBCGOngovbBnkLfTFxQxzBD7/x2pj
         /+V0aZRscsIpqx1RfmtHFi3EzXMwb95n8MqeojvAyL9grsgl7KqPc5KdmyyU7EqqOxgR
         MGUcGYpdQ7YRvkEbOEXG0i61MvnPZowEavX41PHHHxzVFIxZ1duF08Wabrmxw69VjRYF
         +QVTGF4Bsa7OEj2gndBT3M0GHDe/q3ctlQu3qFcuFIR4eoQkBBVo0X6swL00zhjuyXDp
         6Q4g==
X-Forwarded-Encrypted: i=1; AJvYcCWaIX1drejNXij5Kgcz7awns1Ko7OubaKZBSpyaRV6FlMhwhOfnA//E8P4ORWwYvxz4KJfcnhMXTiCjwnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRn7PypugG5qdbcwH3tNGNArNFlwXZsCLfrtXv7VU5UMSF0PLC
	OibCM6odJ4YAXCG/3KiGkZn1Yg4ziW57/RNXjqaQrBy1L5F4A78sSNKAWudv4U65hZjHS80IQ2K
	y/IJNnzNAw7WpoY0p/xaQc1jEYIp/zwTk9V6SW4FytmD4SnlwfuJDFuO8lpxAfHT75w==
X-Gm-Gg: ASbGncvCbWDb8RgquX7qgzAexMnXyDrVHjIomb7fk+f5bYcUuBj0cnh7LSmKESVXvdc
	iwD7RyH3F/ShtaKuoP1oWGBGXh1vaWYTzJLL+ljWW6+qp9Wn297KG+u56u88wMzCbsELWcUQEtG
	34IhcsPza3BkaPM0EACOAIAYhBENvjEnD30CehnczHxt4N4gWu9cmbpSU1KEHSzc76QmdFfHXrT
	NNp5V3XECfcpsbRbGs0PMxuzvBQbQC8ItJXKk5ORcPuhN30NQ4B/GAcAz/IV5C0xy25OIJii0MT
	LyYlP3V9zRZ8PyDieJng9elMexTdeBqHHI9esIqSoYOC8Lodgac58d6o33+/PBVIBcGd4+cldpx
	vwrhCoGL1Ru6r5oib4cWth+k6iJVJRbSi0wdyKD8=
X-Received: by 2002:a5d:558b:0:b0:3a1:f8d1:6340 with SMTP id ffacd0b85a97d-3a35c83aca4mr771941f8f.34.1747336826254;
        Thu, 15 May 2025 12:20:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIctVlg4RVZvym19LqU8BpCMgLIVCL4/LiXgRWGA4n8fMGVZiMyJI9dwvHkutYErUSeP9g7w==
X-Received: by 2002:a5d:558b:0:b0:3a1:f8d1:6340 with SMTP id ffacd0b85a97d-3a35c83aca4mr771926f8f.34.1747336825898;
        Thu, 15 May 2025 12:20:25 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4a:8900:884a:b3af:e3c9:ec88? (p200300d82f4a8900884ab3afe3c9ec88.dip0.t-ipconnect.de. [2003:d8:2f4a:8900:884a:b3af:e3c9:ec88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a84csm384628f8f.31.2025.05.15.12.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 12:20:25 -0700 (PDT)
Message-ID: <52f12b89-84a1-49ec-a2d2-d710b02218de@redhat.com>
Date: Thu, 15 May 2025 21:20:17 +0200
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
 <360bac52-2cda-41fd-a674-89b113fef918@redhat.com>
 <7a255984-7c9b-46f1-b73b-f85b5b571a92@lucifer.local>
 <c3c264fa-b74c-42ba-a3ad-615715c8fa80@redhat.com>
 <yec4eqg73qejlnmtckwjiexelswcxf3l5ctoaphq6ugyp3tu3e@vmex647zbp52>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <yec4eqg73qejlnmtckwjiexelswcxf3l5ctoaphq6ugyp3tu3e@vmex647zbp52>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.05.25 20:09, Liam R. Howlett wrote:
> * David Hildenbrand <david@redhat.com> [250515 13:30]:
>>>>
>>>
>>> Did we document all this? :)
>>>
>>> It'd be good to be super explicit about these sorts of 'dependency chains'.
>>>
>>
>> Documentation/admin-guide/mm/transhuge.rst has under "Global THP controls"
>> quite some stuff about all that, yes.
>>
>> The whole document needs an overhaul, to clarify on the whole terminology,
>> make it consistent, and better explain how the pagecache behaves etc. On my
>> todo list, but I'm afraid it will be a bit of work to get it right / please
>> most people.
> 
> Yes, the whole thing is making me grumpy (more than my default state).
> The more I think about it, the more I don't like the prctl approach
> either...
> 
> I more than dislike flags2... I hate it.
> 
> but no prctl, no cgroups, no bpf.. what is left?  A new policy groups
> thing?  No, not that either, please.
> 
> To state the obvious, none of this is transparent.

New to the "transparent" huge page world where not that much is 
"transparent"!?

It's completely in-transparent to most people how it works :D

Yeah, that's why I suggested to piggyback on VM_HUGEPAGE/VM_NOHUGEPAGE. 
Something we already have and that we will probably have for a long time 
... :)

-- 
Cheers,

David / dhildenb

