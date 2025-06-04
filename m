Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC8D24DCF9
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749041315; cv=none; b=GoQEd7Q/UievUv8kb0UenxIPpekrox7Cn8leNzFfkGyFYOIMDnh6nPbSQONC3wMmfmfTh7C62CNZxstsAdkfZQMGUF6S5q6HTe+iqD3dNY2YECdng/ppHiemLPi+aiVlz9H63CIT4zio2VNBnsXP+eeUHmttRUouIFMFd54z4SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749041315; c=relaxed/simple;
	bh=j8kfcfU5sJX8+yJp89WFjNqGUdAf9gIl614lAbvkqzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SXyqSrIo6E+YDYhRi/PfZG/SmfgNNYiY50AH7CnfqzJfDT2g5wbjZRAat7JbUOfW4FtvQbprMiRKWd/SwbmOs9gOWSYGMmfaN9Wjv77313ktvju04asQHItrpTTZ9RsF8JDsD047Y5QRG4c0GVAYEQUmKHSZHCqwSFzInQPawZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D9IRWFvD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D9IRWFvD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749041309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nkl2JIgedI+lh+fHfhg8esoPVeYFJN0tO6EBmBp+OMQ=;
	b=D9IRWFvDAhXb5PK8ezfP+ck78zP/bS7/Swi+iLLbaxOKknOZCki/f+14MBQAibA65TsfOw
	xUSnW8lECDPl7119OJvsc81VjfQHAxpv7zGWA434vadL6iAHaQIWbuay/K8Bi036Tuz46d
	G2ppbQGrXilAnFr6+Z6ckATlxUmYAYU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-1f2K9JCKOl-S7wgTDJy0GQ-1; Wed, 04 Jun 2025 08:47:46 -0400
X-MC-Unique: 1f2K9JCKOl-S7wgTDJy0GQ-1
X-Mimecast-MFC-AGG-ID: 1f2K9JCKOl-S7wgTDJy0GQ_1749041250
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a503f28b09so468977f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 05:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749041250; x=1749646050;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nkl2JIgedI+lh+fHfhg8esoPVeYFJN0tO6EBmBp+OMQ=;
        b=PavKpZDeP2NbkdJcGoPqYH56N95eZJn0phCM96p1wtDSsdRqit9dUXBrLqGjg0NdMu
         OMhwf0TxbHjGISMutKEu3XETRH0roZSd5dIAf0At8NzTexEHZAdKnCDaZmQ6Xcd82wuH
         7gDZ3g5qfk+bcM/erccZsPz8cIK6B/jJs+TJ75iDif7NG7f8zLOaIsoFl15jB8RpiTk3
         eJFmU/nUg9jmTPqGAozkUBJGR2gfiGIsRdErHo7pNGuGuOzVHXume3vOdpcPgZV9HAe1
         61f15StGEmf//CYRKDREW2iTmcnyG5wrB+FLYfddVN6SpWGP1capc7xNlgz6bNUVvJTh
         VrnA==
X-Forwarded-Encrypted: i=1; AJvYcCVRX1vtv4GERNQ+mP/CNOwWYobqhXS6pYZ/53c3rheehEYjC37O1oRO6nkW2R/pRV1XnT/yJLvrsRIie+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJpLIJzyF/y7Wg9CoMtieVW2PduiEaOcwlRR2r8cOfoMgaLBEu
	nHUumW1eaMiqThNnmzodib7jStCtX0vQtMzEUO2bMKd6bQBoIKiFCpcTPGvDVALkdJqXTV6FDSU
	D/+8y+AeSDspZq7jZPgWpW25B+P+qN2JxmtRDg4ymizlMG2+3XKhXD3VDp+lP52CeA6xxG6jrzV
	Km
X-Gm-Gg: ASbGncu+sl1otpMLFGkyxgmS8yiblLfxCx2DRxvfmaZupd7RTMpJsaT3UiZwFrh8BXJ
	w6kgEV6tgxeunAGheaaPIkfv+KhLB7pu2psVTaLCj6KZau30JK+YgnBBUtZZo/ReFxhiQWVXYo+
	zidmBoYSJx01LypLSHrTjxJ8MVBq1jS8MV4gzufkZdYh9CH38bfvvd/a+Z8S6oWEjiR2JBe991m
	2i9wMm8QyBH0xPjWjmK+9Gehgf2DmsKD+YgbTmMhr/Sw51cL1aKSVDeBN+v8x4VwWoyQV3BKkA4
	C7poDc9cx/3XZoO3/nexBzrQEI9EotV8C5/22MR2xF4SbU3iGqesgdXKGf6GKYV1ty2vVWu66wr
	798D2hAkfIypnFhf0SNd4bSMnSHWwZQy0IGFfQ0aIzUosvFHMCg==
X-Received: by 2002:a05:6000:208a:b0:3a1:f724:eb15 with SMTP id ffacd0b85a97d-3a51d5071a1mr2456910f8f.2.1749041250077;
        Wed, 04 Jun 2025 05:47:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2ikj7SNZj+e8kpLXQxObBNug4vHxRmdavde46XRKhzFX4HfEx52ROo2DmOQ3b+1NNGe0NjA==
X-Received: by 2002:a05:6000:208a:b0:3a1:f724:eb15 with SMTP id ffacd0b85a97d-3a51d5071a1mr2456890f8f.2.1749041249698;
        Wed, 04 Jun 2025 05:47:29 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a524896574sm561497f8f.56.2025.06.04.05.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 05:47:29 -0700 (PDT)
Message-ID: <9a845c21-5cfb-4535-97bd-0b02f5852457@redhat.com>
Date: Wed, 4 Jun 2025 14:47:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] mm,memory_hotplug: Implement numa node notifier
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250603110850.192912-1-osalvador@suse.de>
 <20250603110850.192912-3-osalvador@suse.de>
 <ddcdd8b9-566c-4f6c-b1f7-861e93a80fbb@redhat.com>
 <aEA-K3hTvhtdUxuA@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aEA-K3hTvhtdUxuA@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.06.25 14:38, Oscar Salvador wrote:
> On Wed, Jun 04, 2025 at 02:03:23PM +0200, David Hildenbrand wrote:
>>> diff --git a/include/linux/memory.h b/include/linux/memory.h
>>> index 5ec4e6d209b9..8c5c88eaffb3 100644
>>> --- a/include/linux/memory.h
>>> +++ b/include/linux/memory.h
>>> @@ -99,6 +99,14 @@ int set_memory_block_size_order(unsigned int order);
>>>    #define	MEM_PREPARE_ONLINE	(1<<6)
>>>    #define	MEM_FINISH_OFFLINE	(1<<7)
>>> +/* These states are used for numa node notifiers */
>>> +#define NODE_BECOMING_MEM_AWARE		(1<<0)
>>> +#define NODE_BECAME_MEM_AWARE		(1<<1)
>>> +#define NODE_BECOMING_MEMORYLESS	(1<<2)
>>> +#define NODE_BECAME_MEMORYLESS		(1<<3)
>>> +#define NODE_CANCEL_MEM_AWARE		(1<<4)
>>> +#define NODE_CANCEL_MEMORYLESS		(1<<5)
>>
>> Very nitpicky: MEM vs. MEMORY inconsistency. Also, I am not sure about
>> "MEMORYLESS vs. MEMORY AWARE" terminology (opposite of aware is not less)
>> and "BECOMING" vs. "CANCEL" ...
> 
> Heh, that is why I'm not in the marketing field :-)
> 
>> There must be something better ... but what is it. :)
>>
>> NODE_ADDING_FIRST_MEMORY
>> NODE_ADDED_FIRST_MEMORY
>> NODE_CANCEL_ADDING_FIRST_MEMORY
>>
>> NODE_REMOVING_LAST_MEMORY
>> NODE_REMOVED_LAST_MEMORY
>> NODE_CANCEL_REMOVING_LAST_MEMORY
>>
>> Maybe something like that? I still don't quite like the "CANCEL" stuff.
>>
>> NODE_ADDING_FIRST_MEMORY
>> NODE_ADDED_FIRST_MEMORY
>> NODE_NOT_ADDED_FIRST_MEMORY
>>
>> NODE_REMOVING_LAST_MEMORY
>> NODE_REMOVED_LAST_MEMORY
>> NODE_NOT_REMOVED_LAST_MEMORY
> 
> If I were to pick one, I'd go with NODE_ADDING_FIRST_MEMORY/NODE_REMOVING_LAST_MEMORY.
> I think those make it easier to grasp.

Just to clarify, these were the 3 notifiers each that belong together. I 
was not sure about NODE_CANCEL_ADDING_FIRST_MEMORY vs. 
NODE_NOT_ADDED_FIRST_MEMORY.

> 
> 
>> Hm ...
>>
>>> +
>>>    struct memory_notify {
>>>    	/*
>>>    	 * The altmap_start_pfn and altmap_nr_pages fields are designated for
>>> @@ -109,7 +117,10 @@ struct memory_notify {
>>>    	unsigned long altmap_nr_pages;
>>>    	unsigned long start_pfn;
>>>    	unsigned long nr_pages;
>>> -	int status_change_nid_normal;
>>> +	int status_change_nid;
>>> +};
>>
>> Could/should that be a separate patch after patch #1 removed the last user?
>>
>> Also, I think the sequence should be (this patch is getting hard to review
>> for me due to the size):
>>
>> #1 existing patch 1
>> #2 remove status_change_nid_normal
>> #3 introduce node notifier
>> #4-#X: convert individual users to node notifier
>> #X+1: change status_change_nid to always just indicate the nid, renaming
>>        it on the way (incl current patch #3)
> 
> When you say #4-#X, you mean a separate patch per converting user?
> So, one for memtier, one for cxl, one for hmat, etc.?

Yes.

-- 
Cheers,

David / dhildenb

