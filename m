Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CCD274FDB
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841628; cv=none; b=AZ8rsMduVn75bKZmT0lr/1b2Gas2seFvvecNtM+sEZwQCMTd2oAGPMbXbga4Yl/C4UM7lYnzM07vyx3YOkHNC5U89GWPOHzrJLg4mFJWQ3M73+pUI4UGfQ7bjXnwFXEayQwaB27xs7MQEF8DxyXfh5avVJj8Tnc3MUce39S2S/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841628; c=relaxed/simple;
	bh=GnDZrkyAJfOcFqXLRvQj/7AAGqRfrx7Y0jaK9jrQwxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bvxyXdgxgC6BrNZbQl5q+fFxlS46MHbl/gAxAVs3SMsqQJ2vMQYazwycND3ePMDhEAp+W90dIsKTsbqDGT/qoNI0vM/QU5UN4Yygn/ePDMcFJoqBA0w44UV+nkehAXEuecS5uDDD9yFRqjnsD+YCJjXcL+yMg4ST2buwHWvSTOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dK1bHUrK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dK1bHUrK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750841626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0e8BoDLq196flVUDfV/vvRQXSzcbFa8gqqzTgNqKOzQ=;
	b=dK1bHUrKlc32zIIVaBNojibLhBXvYsnxWNDbh9Oz0Nvha+jMPtPRSQ2fRKijWdRkXQWV1m
	rEsAfQcGv6q6fjcoizryWS2ezsuYhKEq8raMV3o7lG0iMU6wsFEOSVYq50hQ8p48pwCuLu
	LnWEkF1BNci5i24dx+MZaeOhv4z0Z1Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-wkmiGwC7Nniwlfb7QggvcQ-1; Wed, 25 Jun 2025 04:53:44 -0400
X-MC-Unique: wkmiGwC7Nniwlfb7QggvcQ-1
X-Mimecast-MFC-AGG-ID: wkmiGwC7Nniwlfb7QggvcQ_1750841623
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4530ec2c87cso33423085e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750841623; x=1751446423;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0e8BoDLq196flVUDfV/vvRQXSzcbFa8gqqzTgNqKOzQ=;
        b=YXV1tnsEbJ+llfjEbmWz3wh4C5lO7tz7F4HBAnatxV3NZkzYMjRrP9GDRvibA18TQG
         unYdN9SZmfJiP1AlinL6dsdfGZ30QNx6nr5B1WX0ateo+bWqXfAyXj4sIlBMeACSlIw4
         mBv5C3+5vmNTxguFUtYq52dzJf1m5hXugenP3IZNircmowLzsVkTBq0Rj/t4q052DiJC
         /Hulvtxfra8gFR5LZN/vCQknl41iV3jWP152brYYXgyCGDgO8mvGHNQVXX/oXVLWibDT
         Te24kZ2RsEvtGm7y5g5K/ymwuhf7/RyJCUqvAfO/3Kqb5fCTCyNvawnocHvCdzuMpI2C
         j7xg==
X-Forwarded-Encrypted: i=1; AJvYcCWhWG7ngl61/N5qPQz1H24fRVv5FC0qfTrISUDCgaQVQiFFvbgNgJrdjv0LxnCvY9C0QlVM++Cu/xYv8Nw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrXmzgQDmtNyJZHDtr3uhOo57JvzgN+eOHxfH+tHgsC8SNY0pT
	JmmFHzW3Hxz4lwdXO097YGrmzmPr74sfk1fUwqeVAzJXnSFyxFkiHwXlaX+WENSEGQXVUKHylnl
	xiEyMNPGTU1fUih1RPf/qxXc7EBlapUMI8UnQ+qHxcQxKzMoPhfSFK4ybMDZsENoOCQ==
X-Gm-Gg: ASbGncvEtHH/0iHs7Y4ldo/rdfV7c3wye2qh/uxIlPxd3xnvhykN2rBoZkkRoC/EyuT
	lTG5FqxuXsz3kRFSG+pWUZo9uZ5HrZTr+ixTGz5SZMSMvxBmHSg/ScrcH/qB8X7pIr1rSxbATqg
	KRKAvF4o5NhDVdny3c6VZewYhzomk8+DTimFTNU2Et4m9Ec/OnrH9ZFNdyG6M3bxk4VUtGQTEOR
	BNMH2cPDWPtmGJvSLiZCmMejf4plc3Ubdnn3WPF+hFqdv5kYLtJ3z0n6+DfZBLtCUj/QOkOpzyR
	0ifk6OzsZsZ4DnkBFp3MjOp9pl5HNbMEFDENsP6SYMJrptdqQex+NDxMWq9IRb+wimU4WtyYXo1
	tRAfVbjgRUNcIbyM4jzW0QJ2ewgyYCIcnUHvb0MMjYIOT
X-Received: by 2002:a05:600c:8b45:b0:450:d01f:de6f with SMTP id 5b1f17b1804b1-45381ab000fmr19392155e9.15.1750841623138;
        Wed, 25 Jun 2025 01:53:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTv4HpJcoINB6om+LOfg/ajMyM1672zXm+Tupck3O8L0NlZXsrLq6TKOv12mKFQuOe6uHP9Q==
X-Received: by 2002:a05:600c:8b45:b0:450:d01f:de6f with SMTP id 5b1f17b1804b1-45381ab000fmr19391785e9.15.1750841622733;
        Wed, 25 Jun 2025 01:53:42 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382362ab2sm13253025e9.25.2025.06.25.01.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 01:53:41 -0700 (PDT)
Message-ID: <8de73035-8645-4c53-80a5-de63128d388e@redhat.com>
Date: Wed, 25 Jun 2025 10:53:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 zokeefe@google.com, shy828301@gmail.com, usamaarif642@gmail.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
 <f1782ae5-c1d6-4f46-a676-666505990f4d@lucifer.local>
 <008ec97f-3b33-4b47-a112-9cef8c1d7f58@redhat.com>
 <01d679f2-fd64-472c-b9dc-ebe87268ce82@lucifer.local>
 <a16071e5-ae97-4e1a-9df8-f353f6b319c7@lucifer.local>
 <23b8ad10-cd1f-45df-a25c-78d01c8af44f@redhat.com>
 <decbae07-0c84-4379-9f9d-6e2bd6dbad6e@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <decbae07-0c84-4379-9f9d-6e2bd6dbad6e@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.25 10:37, Lorenzo Stoakes wrote:
> On Wed, Jun 25, 2025 at 10:24:53AM +0200, David Hildenbrand wrote:
>> On 25.06.25 10:12, Lorenzo Stoakes wrote:
>>> On Wed, Jun 25, 2025 at 08:55:28AM +0100, Lorenzo Stoakes wrote:
>>>> I suppose the least awful way of addressing Baolin's concerns re: mTHP
>>>> while simultaneosly keeping existing semantics is:
>>>>
>>>> 1. Introduce deny to mean what never should have meant.
>>>
>>> To fix Baolin's issue btw we'd have to add 'deny' to both 'global' settings
>>> _and_ each page size setting.
>>>
>>> Because otherwise we'd end up in a weird case where say:
>>>
>>> global 'deny'
>>>
>>>    2 MiB 'never'
>>> 64 KiB 'inherit'
>>>
>>> And err... get 2 MiB THP pages from MADV_COLLAPSE :)
>>>
>>> Or:
>>>
>>> global 'deny'
>>>
>>>    2 MiB 'never'
>>> 64 KiB 'always'
>>>
>>> Or:
>>>
>>> global 'never'
>>>
>>>    2 MiB 'never'
>>> 64 KiB 'always'
>>>
>>> Or:
>>>
>>> global 'never'
>>>
>>>    2 MiB 'madvise'
>>> 64 KiB 'always'
>>>
>>> All doing the same. Not very clear is it?
>>>
>>> We have sowed the seeds of something terrible here, truly.
>>
>> Fully agreed. "Deny" is nasty. Maybe if we really need a way to disable
>> "madv_collapse", it should be done differently, not using this toggle here.
> 
> Yeah maybe the best way is to just have another tunable for this?
> 
> /sys/kernel/mm/transparent_hugepage/disable_collapse perhaps?
> 
> What do you think Hugh, Baolin?

Probably, for debugging purposes, a kernel cmdline option would work as 
well. Something we can just easily change later.

> 
>>
>> Regarding MADV_COLLAPSE, I strongly assume that we should not change it to
>> collapse smaller mTHPs as part of the khugepaged mTHP work. For now, it will
>> simply always collapse to PMD THPs.
> 
> Yeah thinking about it maybe this is the best way. And we can then update
> the man page to make this ABUNDANTLY clear (am happy to do this).
> 
> This keeps things simple.
> 
> (One side note on PMD-sized MADV_COLLAPSE - this is basically completely
> useless for 64 KB page size arm64 systems where PMD's are 512 MB :)
> 
> Thoughts Baolin?
> 
>>
>> Once we want to support other sizes, likely MADV_COLLAPSE users want to have
>> better control over which size to use, at which point it all gets nasty.
> 
> madvise2() this time with extra parameters? ;)
> 
> I sort of wish we had added a flags parameter there.
> 
> But lacking a time machine... :)

Reminds me of how MAP_HUGETLB squeezed in the sizes by stealing plenty 
of bits ... :)


-- 
Cheers,

David / dhildenb

