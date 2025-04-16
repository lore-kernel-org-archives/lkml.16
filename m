Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C102080D2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744823265; cv=none; b=o3hbRNss8ORcCB2cxrjsUoAr4+iJgJs+6xsubpKIU47/f8RA3+bs1IrXWFrhrtgVYwOlm9SZn6GiYo0WrwCFdnaRzLvc7tlS4HV+7JjTqMDMIPQrns5kBjzW8ixuSg09p8IZk4KwE4rFWaILzx8yUDbczPMq41O3YoqGxSMAjsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744823265; c=relaxed/simple;
	bh=WF7BJF3PXY/xmbEmGH86OEsdJ9VEQX9YRCd8L2T/9J4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bhnmYgXawGV57/md7HVQc/9oH/JpHr1UwGxkGL61F6MsoEJJZeTyCpBOBSL03QWjzlpRT6AKSvRTGrbrGtOwn3xSSsmGF6RPi+tl/UvY2DHzvrV+uHmu+IzaC/erL/hIjC4uBDwP7QGLWpmTAht7+R9Jcs65F3ZTwJuwLUz4jkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dj77Dvru; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dj77Dvru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744823261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Txu9eKRV5VXcx2F1SZgPKBUc9BS7eNXHTCkAiBh6fWQ=;
	b=dj77Dvruwg1X8eddlmHZSzoZeQZJ8TnXBGB8fW5/4JAyYQPOtFH8zQtqvPduT4RRMdjlim
	mJFKJ75XhZIgXG/2rPfbsI17WJ2cYa88EER9pZmPz6EBVodAtppww0l1k3x+lwKaWBwdq7
	aEVseAuiXYbmpUcQup+c/VpoVr3NNDk=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-hLWOItm3MFC0foRxuLkxLw-1; Wed, 16 Apr 2025 13:07:40 -0400
X-MC-Unique: hLWOItm3MFC0foRxuLkxLw-1
X-Mimecast-MFC-AGG-ID: hLWOItm3MFC0foRxuLkxLw_1744823259
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b0b2de67d6aso213680a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 10:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744823259; x=1745428059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Txu9eKRV5VXcx2F1SZgPKBUc9BS7eNXHTCkAiBh6fWQ=;
        b=CdVMzRgw4by0KJtqtg+4OOVXNgdFIXgQOPytGqnAMDqK1TlZxtsmSvEC9NaDSwPnD8
         qa5pcP5k4earBmxKLYrr9f1c9qJSVj6VemjaGfEMvY7H0FmKECpq8JQS/+jpOLF85Csu
         TJnf9O+PBzPoXW8Dg3Xjm12H8vSpXuyGxe22Fk7c2xJENM5iSraLNM/TjmFog7mquT9j
         G+ZNrObhuz6FqAsZtJoy41FgjyPJju9iDfVjDVYGjxvoviEp3VFgsGrMa7QHVrlzL5ln
         md9UZzdOfKV3A2SfP3MoUJr/1RC8o/Z0SkbW3eCQW/uTUZ8prZvElBpWtbDEiNWK60ff
         2rCw==
X-Forwarded-Encrypted: i=1; AJvYcCUsMqRnbgMUmhDKqSEplb2kPYHLFx+j7xLMd9SF6Hw+/HyBe/XJxn0QNy9s2vMxRchzWfT+yFf4BdZYUew=@vger.kernel.org
X-Gm-Message-State: AOJu0YymTHX6jdRAlRvDL155uayWkHyhTDpu2FayVgDKtFk0ROhReKFG
	H+V/6jLR2nlho+2YwXUrt0cdffLghYEVw9GiWem1DjNdGAcdhJpkqcEEgrwNbDV1HDTBb4KBbJ+
	G8saw12HWCXxWXFWb+uHjcp7seMzOieb8R37ImkCL3+ELkhIkQvqEavRPlmapig==
X-Gm-Gg: ASbGncvsgcJHCPlWfoVzHb8++xWuYYCW6dNuFFGpJtpZPO1x8DWoM0eCUeSQB0t2mQi
	TmwEflaI2yZmFt3/9mWrWn/pfSpHMJu7EtB2Ks0rYcijvCTxbCuf1jvaEqNhbrNbDuxD23g+AWI
	15YDpMoXDMN+M5X87EGPVYMzElsRedP/8xyOmtYv95wadjfjPkEqNOwdkc2WynemRtaoSX7/w0M
	JHOT/yIPmjrDPhrnYtDHfrwUf2UCyxbCW3Ok8wQSIt/B0GyqsZZU/xW644EGTNuXzAN7SN0Z24I
	3gndXOO/zPm/5g==
X-Received: by 2002:a17:903:17cb:b0:220:e896:54e1 with SMTP id d9443c01a7336-22c35916b8cmr41994625ad.26.1744823259015;
        Wed, 16 Apr 2025 10:07:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjE78Hd0NX2VKlmOvNMX/n/qLF921XEQIoPT7tUDRXgP5obufv6p3oZKxPjd6NKh3lVTqfRw==
X-Received: by 2002:a17:903:17cb:b0:220:e896:54e1 with SMTP id d9443c01a7336-22c35916b8cmr41994295ad.26.1744823258688;
        Wed, 16 Apr 2025 10:07:38 -0700 (PDT)
Received: from [192.168.2.110] ([70.53.200.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef10e1sm16765735ad.16.2025.04.16.10.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 10:07:38 -0700 (PDT)
Message-ID: <c5204098-ba03-483d-9d7c-9728aea217ff@redhat.com>
Date: Wed, 16 Apr 2025 13:07:22 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: use separate nodemask for bootmem allocations
To: Frank van der Linden <fvdl@google.com>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, david@redhat.com, osalvador@suse.de
References: <20250402205613.3086864-1-fvdl@google.com>
 <a7f5a4f7-1ec6-42dc-a93d-af043a01044f@redhat.com>
 <CAPTztWa4Q+E7ytKyorP1wg8Cq02_PWiKW1w+AHXZ_XzL4D5TNg@mail.gmail.com>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <CAPTztWa4Q+E7ytKyorP1wg8Cq02_PWiKW1w+AHXZ_XzL4D5TNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025-04-16 12:32, Frank van der Linden wrote:
> On Tue, Apr 15, 2025 at 6:08 PM Luiz Capitulino <luizcap@redhat.com> wrote:
>>
>> On 2025-04-02 16:56, Frank van der Linden wrote:
>>> Hugetlb boot allocation has used online nodes for allocation since
>>> commit de55996d7188 ("mm/hugetlb: use online nodes for bootmem
>>> allocation"). This was needed to be able to do the allocations
>>> earlier in boot, before N_MEMORY was set.
>>
>> Honest question: I imagine there's a reason why we can't move
>> x86's hugetlb_cma_reserve() and hugetlb_bootmem_alloc() calls
>> in setup_arch() to after x86_init.paging.pagetable_init() (which
>> seems to be where we call zone_sizes_init())? This way we could
>> go back to using N_MEMORY and avoid this dance.
>>
>> I'm not familiar with vmemmap if that's the reason...
>>
> 
> Yeah, vmemmap is the reason. pre-HVO (setting up vmemmap HVO-style)
> requires the hugetlb bootmem allocations to be done before
> sparse_init(), so the ordering you propose wouldn't work.
> 
> I originally looked at explicitly initializing N_MEMORY earlier,
> figuring that all that was needed was having memblock node information
> available. But there seems to be a history there - N_MEMORY indicates
> that buddy allocator memory is available on the node, and several
> comments referenced the fact that zone init and rounding may end up
> not setting N_MEMORY on NUMA nodes with a tiny amount of memory. There
> is also code that sets N_MEMORY temporarily in
> find_zone_movable_pfns_for_nodes().
> 
> Some of the commits went back a long time ago, and I can't quite judge
> if the comments still apply without looking at the code more. So, I
> chickened out, and did a hugetlb only change to fix the hugetlb
> issues.

Oh, thanks for the full explanation.

Since the new hugetlb init has to happen before sparse_init() then
this patch is fine by me and I appreciate your concern in not
changing/regressing the user visible behavior.

Reviewed-by: Luiz Capitulino <luizcap@redhat.com>

> 
> But it does seem like setting N_MEMORY can be cleaned up a bit, it's
> definitely something to follow up on.
> 
> - Frank
> 

