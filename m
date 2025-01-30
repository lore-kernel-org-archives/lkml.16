Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5497B25634
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 09:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738227726; cv=none; b=goht1ERxbK4Rbgkvojlv6iCHeyINGnlc1El7ZApZbDyKsAJYg6m//MAwg+yC3k0nwSTV0Wp4ZaXMIcS4U1+BlMSEuLSYCmFhzyI3M4fQeJuPDzLRCl6eyYFnfN4xqhZ1aCLFEbdFExsaZHA8+d7KxXWUze1ptvfga/ODQ0JPkIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738227726; c=relaxed/simple;
	bh=JCrr9WvAcqp0HgpS3AHlQCSNuFvmM9nE07vdSSk1RZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GWWJixWEPsP7CsVsMGeMoj+Jp4hT9y/mFEETGH24mxx8OymZzKGbVyDlUQqtUTchwq75R9Ka74oyg4Ni9Y8EYAXqxQ2zdwQ2MMUHOVV1UG+fhXfh4IpLRzntwI+TThZcX9KCIdd+7XHUYbYopvktu8shwF7WrCGQAJV4snyTGZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VdB2e9n+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VdB2e9n+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738227723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=P7BnR7oKxWFLrbq+LpQx7284rU6/PZ9N/+D+Z7eg9Us=;
	b=VdB2e9n+/Zsyv7i6P91rGwMQU3Ybd6ZrIl9/IDaWAzi0LkEmM3N/PjI6OIkRUyRz9ydU2t
	Hhc/53T2LbgpVK7DKNEtKp8l6delPuuB5JJt5zh6RDVeJkcko2mqxFX3BGEXgXCQxf3QRE
	/PIDwEBLJzWPDLdOEH3FuOcDeDKiQWM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-DdHGbmXyNWKQKthi2g9sDQ-1; Thu, 30 Jan 2025 04:02:01 -0500
X-MC-Unique: DdHGbmXyNWKQKthi2g9sDQ-1
X-Mimecast-MFC-AGG-ID: DdHGbmXyNWKQKthi2g9sDQ
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385e00ebb16so237159f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 01:02:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738227720; x=1738832520;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P7BnR7oKxWFLrbq+LpQx7284rU6/PZ9N/+D+Z7eg9Us=;
        b=HMwOjG0hQYngQns0g7RKKCgF7zUgsQQovziOw33xARlDRbFQd2H4fxeM2wNFg69TtZ
         jImO4EpKuPDdbTpQdzwKlVechRzyO81PZu6alwy7aV3JEO2PASBrePG5KZxBn+uInbzb
         gBydtEtlZGz2GuPrH9jYaBuRjw/e8oYGWdv0xZCRjsU/hYKydCejehqTEmdCgD9vl/ry
         31LWsFVbBBn7N8iQf2pRiE8dxki2Bn8T2Ptlz1yfcqWh8muKbtDEyrkDqlFleijzcN0L
         jRKOINh267Xpm1SLSZh7VbyzyWK6DsP54Y0yLMh6Cj55VArl7yYxaMl9/I8RslnEe9WT
         OifA==
X-Gm-Message-State: AOJu0YxqhZylmZ3jbpYucqRE6WDhugSfihHuYIj5XgSfLLktLjYi9PIM
	rq/wTk8fWmU3l2mrWdNyDq746S9xIy6NbuPXeTpyiPIbsGpwCGCrJq43BaUhH0x3m9KF/dDZytg
	Q1FTu4pTJMyh21FyuVfBrFuJ1yqnbKz4nkFvjwMFZHuxzdb5QvkhCX7lb9gYrKw==
X-Gm-Gg: ASbGncujRP8iqSOzxTfsxipcF5xJB35NJMMDzN8AoByGhMnMI558L2ZwWYb/cxhga5N
	u9Mip5G2Br2u0wc7kuMTFhRvFZXFp1ueOUfOQTlyB7njQy0YbilGMLkemmIL01U3+nHvOX70iPQ
	QodkGaRkjj/1n96KE2ys9TatifEDnvWSAXUx6QtAQ2yOMpCfLFwx0Dlfe1soBWhdhT7nadbxa+E
	xVfg3Ga5JSi4OFy85tEBPjta2rep+YkcUD/Kv6fdaTykujdVncQXNhuGCiJL6xsGez7+D4G3TRn
	pWgRrZToNK4VXvDTlKoQsli+TCwiZxeTekh3Ac4gvZ7w
X-Received: by 2002:a5d:674e:0:b0:386:4a0c:fe17 with SMTP id ffacd0b85a97d-38c51b5e4efmr4617340f8f.27.1738227720417;
        Thu, 30 Jan 2025 01:02:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFk2uwTm4ytpRhBOmy2rIFSiLhi0lro88yTTUiOicna290ro8PmQqH5omjQhhHzbTGLrwMXXg==
X-Received: by 2002:a5d:674e:0:b0:386:4a0c:fe17 with SMTP id ffacd0b85a97d-38c51b5e4efmr4617305f8f.27.1738227720024;
        Thu, 30 Jan 2025 01:02:00 -0800 (PST)
Received: from ?IPV6:2a01:599:904:96e0:a245:aa9f:6c57:eb41? ([2a01:599:904:96e0:a245:aa9f:6c57:eb41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c019b1dsm1359184f8f.0.2025.01.30.01.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 01:01:58 -0800 (PST)
Message-ID: <180e9c2f-51fe-44ba-ac68-5aa7b7918ab0@redhat.com>
Date: Thu, 30 Jan 2025 10:01:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/12] mm/rmap: implement make_device_exclusive() using
 folio_walk instead of rmap walk
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-5-david@redhat.com>
 <7tzcpx23vufmp5cxutnzhjgdj7kwqrw5drwochpv5ern7zknhj@h2s6y2qjbr3f>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7tzcpx23vufmp5cxutnzhjgdj7kwqrw5drwochpv5ern7zknhj@h2s6y2qjbr3f>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.01.25 07:11, Alistair Popple wrote:
> On Wed, Jan 29, 2025 at 12:54:02PM +0100, David Hildenbrand wrote:
>> We require a writable PTE and only support anonymous folio: we can only
>> have exactly one PTE pointing at that page, which we can just lookup
>> using a folio walk, avoiding the rmap walk and the anon VMA lock.
>>
>> So let's stop doing an rmap walk and perform a folio walk instead, so we
>> can easily just modify a single PTE and avoid relying on rmap/mapcounts.
>>
>> We now effectively work on a single PTE instead of multiple PTEs of
>> a large folio, allowing for conversion of individual PTEs from
>> non-exclusive to device-exclusive -- note that the other way always
>> worked on single PTEs.
>>
>> We can drop the MMU_NOTIFY_EXCLUSIVE MMU notifier call and document why
>> that is not required: GUP will already take care of the
>> MMU_NOTIFY_EXCLUSIVE call if required (there is already a device-exclusive
>> entry) when not finding a present PTE and having to trigger a fault and
>> ending up in remove_device_exclusive_entry().
> 
> I will have to look at this a bit more closely tomorrow but this doesn't seem
> right to me. We may be transitioning from a present PTE (ie. a writable
> anonymous mapping) to a non-present PTE (ie. a device-exclusive entry) and
> therefore any secondary processors (eg. other GPUs, iommus, etc.) will need to
> update their copies of the PTE. So I think the notifier call is needed.

Then it is all very confusing:

"MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will no 
longer have exclusive access to the page."

That's simply not true in the scenario you describe, because nobody had 
exclusive access.

But what you are saying is, that we need to inform others (e.g., KVM) 
that we are converting it to a device-exclusive entry, such that they 
stop accessing it.

That makes sense to me (and the cleanup patch in the cleanup series 
would have to go as well to prevent the livelock).

So we would have to update the documentation of MMU_NOTIFY_EXCLUSIVE 
that it is also trigger on conversion from non-exclusive to exclusive.

Does that make sense?

Thanks!

-- 
Cheers,

David / dhildenb

