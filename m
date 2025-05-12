Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949D520322
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747054900; cv=none; b=ikYGMs7i8C1wJTkG9aZ6tVkpAJblLOGaG3sL43hmWnzWhXONy7tKZnzMrPJxmb/swTyVvEInJZiQec1ZcWdsl4CkC+/JUYuww+K/rqpvtPTGF/h6rQ4jfPqoejOGeOhPfR/J3QtY3Qq+Bj5Ve2QMpXgirVxnlhuEbax6k6v27K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747054900; c=relaxed/simple;
	bh=hNc0cyVnMc0NiU++5b7MJFZJ5a8MCuBwl0x11ar+ohE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2FWhFomNPshPrMQFyYixjJD9Z6ulwIFRsbmD7sxGchT9Dbygcdu8TFf+CtBAqmAlxs5tCRGC8pYX3MS3LY7ekDn33bQQWroWNYTNwIfgEcmnFxA2G7FWNrdbzA61L35F+cCpN17Zu6ieAg19Qd/xDlAO+u2VcOeNsOT/3AVzcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZK4h/Zyg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZK4h/Zyg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747054896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Xq73wCtb8aMxKsuxA4x6nRYQmVU+JW3Qy+e8q7P6NuU=;
	b=ZK4h/Zygu1lqBi+Y+6JtcJC3SxlpQ2vtTwk/4PF/iWmyQF50TKUt/0hxV6tPVixqfY55o7
	F+AGu0C1gL1kCT7I0uvuculAvib+jgQ267dPfHhqEBrS1nopGEzm15saK2lQ/Wf2J/ak+U
	hqoGbPXOLyutGgNvD9nUyyoGSqCHbZI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-8HfxHKTrMwul-MhufIRZyg-1; Mon, 12 May 2025 09:01:34 -0400
X-MC-Unique: 8HfxHKTrMwul-MhufIRZyg-1
X-Mimecast-MFC-AGG-ID: 8HfxHKTrMwul-MhufIRZyg_1747054893
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-442cd12d151so28919315e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747054893; x=1747659693;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xq73wCtb8aMxKsuxA4x6nRYQmVU+JW3Qy+e8q7P6NuU=;
        b=hQ94rfmODN285NIY3l83nzm0S8rORtpC8slNHGw91zRy0droG68SuewLsj0A0QMHOm
         FybT+ADDS7Edx7dTiK7Q/V2DX6HSIMz6DFP9SqdlImEpzBiX0e7qHqm9/jMcYD+MKSjK
         iA1eJbVPNpi2eyGu6iZlO+cqaJkRRTealUM+sz5xMNyYUg5n3GVEY2ULeVQIdxy5ccRB
         16p3uEJuZm9j2Ljo1dOqBX24jlSTETPwNKltOxRe2TBvq1BivFqLj9kB3B5Nu0pUzETC
         D+m4WG1owL8kpuPlR1FEtlL/0zVWJN+UMPejQCiC2pbWAvwAQqv1a0s+z9VeqVe4Ptpi
         Mz2w==
X-Forwarded-Encrypted: i=1; AJvYcCWz0VFyKU4hdG+Eiy8fSwKrMLesGsh3r8N7vM+A48qe4TZCM1r2we6ERt6BZAZDX6RHLjUEcxi4knvS8l0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7VUl9TCSA9VBREmfasDNBpoqoGzYpmmmoWqMqyaFnrI25I+ry
	KUiyvFV6IWjvkb7k5Khi+XbwzV6hpaqnEdur+VGZLpOMMmvD1XDZWI9izpndoij/07YvKHfqJo9
	DI0ivAWupwVXV5a90FuZwKprpLm05u8LwiymMfR4XxuT7uVykUaZTsEjoNreKrQ==
X-Gm-Gg: ASbGncsaJmIXiLxZn0INVj9DhSmmwGnP8A/UFCrmBWkGD4n7vfEmAXrE+7lUHZ/kSH5
	/ZCN77eae1WJnIUtPXOvlv75D+J8dJiKNoB5Ed95AgF/uSjVEDnqPUcyso2VWKhrTLkGZEaTxAE
	0o4OSOQICD3ZFeAavJjRBdiS7Ax5qCfkUrIj1oobB7h0ajK9KjdShLnVmfjLotLZ+9nMOdKhNFa
	we75f8aiWEkvTZpW/YvZnM4CZZLFwcts+Gxdtv/hhI9kH4hiBjFOzmsVfmQirJOk99ccob3/3tI
	qr7IBhFM/fi9iVthHPKQww81DO15o1MFv28Mz8dBPGhh0KwaUxeAYgtFnTCyQBrRT1EOyG9m1Zn
	aHf+/zlsbj2lhunPw+NXm2p7zrb3LCb3sRwgervc=
X-Received: by 2002:a05:600c:3b17:b0:441:b5cb:4f94 with SMTP id 5b1f17b1804b1-442d6d08c20mr102665905e9.5.1747054892743;
        Mon, 12 May 2025 06:01:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4xYYVLnB2We0hUzT61e43pLTgwCS38KxE1FaZSeJCvOYxF+GdKM8oy82wLnicMhQg/dbfnw==
X-Received: by 2002:a05:600c:3b17:b0:441:b5cb:4f94 with SMTP id 5b1f17b1804b1-442d6d08c20mr102665245e9.5.1747054892308;
        Mon, 12 May 2025 06:01:32 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0? (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de. [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f2a8sm166268485e9.14.2025.05.12.06.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 06:01:31 -0700 (PDT)
Message-ID: <a6789c57-af54-48e8-8be5-4ae2aa43e9e9@redhat.com>
Date: Mon, 12 May 2025 15:01:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add mm GUP section
To: Zi Yan <ziy@nvidia.com>, Vlastimil Babka <vbabka@suse.cz>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250506173601.97562-1-lorenzo.stoakes@oracle.com>
 <20250506162113.f8fa0c00e76722a1789ec56a@linux-foundation.org>
 <c4258dfd-14ee-411a-9fa7-c4a1fa4fad1c@redhat.com> <aBshiBX_N6hhExmS@pc636>
 <13a32f52-dc5c-45ef-b45a-585586868509@lucifer.local>
 <e3e2663b-2749-44c7-8452-ffcbf2167572@redhat.com>
 <28428030-1178-469a-a4ab-f1e7179d9106@lucifer.local>
 <eb2b0bce-6012-4019-8ff7-c35c24ba7aa1@suse.cz>
 <9AF9CF7D-D4A3-4D97-9B7D-F259E33E982C@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <9AF9CF7D-D4A3-4D97-9B7D-F259E33E982C@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.05.25 14:54, Zi Yan wrote:
> On 12 May 2025, at 3:38, Vlastimil Babka wrote:
> 
>> On 5/8/25 14:23, Lorenzo Stoakes wrote:
>>>>
>>>> M for "PAGE ALLOCATOR", hmmm ..., I was hoping that Vlastimil might have
>>>> capacity for that? :)
>>>
>>> Vlastimil? ;)
>>>
>>> I'd certainly support this.
>>
>> OK, can do, thanks.
>>
>>>>
>>>>
>>>>
>>>> Not 100% sure what to do with
>>>>
>>>> * include/linux/page_isolation.h
>>>> * mm/page_isolation.c
>>>>
>>>> (I hate the word "page isolation")
>>>>
>>>> They are mostly about page migration (either for alloc_contig... or memory
>>>> hotunplug). Likely they should either go to the MIGRATION section or to the
>>>> PAGE ALLOCATOR? Maybe MIGRATION makes more sense. Thoughts?
>>>
>>> I mean it explicitly relates to migrate type and migration so seems to me
>>> it ought to be in migration.
>>>
>>> Though migrate type + the machinary around it is a product of the physical
>>> page allocator (I even cover it in the 'physical memory' section of the
>>> book).
>>>
>>> I wonder if our soon-to-be page allocator maintainer Vlastimil has
>>> thoughts? ;)
>>>
>>> I'd vote for migration though to be honest.
>>
>> I checked the code briefly and although migratetypes are related to
>> migration, it seems rather page allocator code to me.
>>
>> In fact if I didn't miss these files, I would have included them when
>> proposing the PAGE ALLOCATOR section.
>> Zi Yan has a series on that topic now and is one of the R: in PAGE
>> ALLOCATOR. What do you think?
> 
> I agree with Vlastimil that these two files belong to PAGE ALLOCATOR
> section. Page isolation (actually should be pageblock isolation) is
> doing work on pageblock migratetype, which IMHO is an important part
> of anti-fragmentation mechanism for page allocation.

IIRC, it's a bit confusing, because pageblock isolation as in 
mm/page_isolation.c does not have a lot to do with anti-fragmentation in 
reality.

All of these functions should primarily be used for memory offlining + 
alloc_contig. (where we try page migration afterwards)

Anyhow, I am fine as long as these files live somewhere related :)

-- 
Cheers,

David / dhildenb

