Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26357265CB9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 18:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745433452; cv=none; b=aleghTk86/MaVtIIm6J8dOblHrgj58UKz2aSx1ttlhxWf3S0Dd6QRFLVADJcDhNqy+VqcEslJsRAJ9t0rGu3pwJxJ6P5lTwoMUZmAAEvNV1cuJEWb8MMGnP5rrsYE+OAvoFoyOaDPndrA+XzAks86mQhwXUUr6ibk5YU3ZmNu8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745433452; c=relaxed/simple;
	bh=gh76Cwi537UAiZiZzvQ7qO7K4eMJvXZ5GcYqQsv4qVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCdVxvjw+tdzXn0xV2oz2ZQVxyCMLWAB6e7DL0lznXxsst7D8rK6jo59cYsEq46Ild/ALOmQ6jjFIhEUORFH2qKsmUr/gv7xrpmcao6kjVQ1b7QrFQGFNGUH57/Ec2N2whfAddGGVnjH5f4bfwv7Guf3X270cnuQODcBx+jX1IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OKUWjwQ3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OKUWjwQ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745433450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y6pwEnRnhkHgazDgVxPbcQpa5mERaCMyYK1dziw6UIo=;
	b=OKUWjwQ33Y3CEfmRTPWjnwt/Yv203NbMviwGsEIX5vlv3km9tJAPGMUScqJkZoTfWyi0A6
	5C7qCbb6z2B+SlphsXI9N8SnmX2CEnsvo3VybIrBdBIt1mrUEnp5/dejjff+fsoniQPaLa
	WB5ZI4VXF9/XN+dqbo0XFtw/ZFCT4Ns=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-3EGCM-teMXeOOm2LlAEkiw-1; Wed, 23 Apr 2025 14:37:28 -0400
X-MC-Unique: 3EGCM-teMXeOOm2LlAEkiw-1
X-Mimecast-MFC-AGG-ID: 3EGCM-teMXeOOm2LlAEkiw_1745433447
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-30bfaec88edso5898311fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745433447; x=1746038247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6pwEnRnhkHgazDgVxPbcQpa5mERaCMyYK1dziw6UIo=;
        b=YJFWZMBgnO9W9ef4Q29ePf9fEowgaw+0JpK+G4F8R/Z6uj+ggNrS7y2Yq+0f15xIiH
         qGccs1OqCG0fdFygDzEvyMF1ewo1e+KLuKMHN01KMAEGTy4XlCymx0CaY5NNYViHrZD0
         Ck1HskhR2YNDlWMedt/Zom2Yy63Y1ZYsvUMhB7Md/6LdIyJy1McxHeAGqWzx3pfshg6p
         iuvZzapjFHXr5vZqQdyfmLoQAS3uj7cmWTNYzGuK2ia3Lt8c5mERc0MHDQde6PO+pcc8
         EKaQGelT9LPySVjZseUbDJasqmWU+5YFhhk/ZaeEX6RsgFihrE4zT1z136aFLa4JOEf3
         +gJA==
X-Forwarded-Encrypted: i=1; AJvYcCXQH9+CoU7jRbZhAo5ryapNsc9kLCSUxVJHPlG5WlsY7aGYdi3my7WoF2fIhmnF610iHbsQ8jM4+YYPqs8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgjPRSFdEXYmSg1Qcw3W6CFT44MEtX8b8m4n42KADvu1uyYnSE
	2Teo9kDLutGba1qKwIu78TFnjjwz9IURAlxKfZS6KW8xnd3CwtIiKpvkkwphXMLwryGrRy4t0b3
	hdOGJdbyS3yxdXTzusNZBSV3BUEEn0hG4q6jRmAXOokG+eyMAW2rlrcnLg+G2
X-Gm-Gg: ASbGncujfj1/XKdIgZJeUrfPooUYAfkkGTG+gZr6w2CXInRT+/AWNoPERQQ/Pal+Vh+
	Mhyfh7vr03mz9aCOeteqFjPe3g0N46TgQFisQXVtCiz+odzBldPYu6Ct4iWjEDpd0IBsRyY8GE9
	d11O+wXo/2S2oz0e2R+ePUYmOqR+2yCwMtLe89sTDHUMSm1lXcN8eY0l2M88Oj2NL7mOBLuhVZC
	zbZD6g/Qth+xWP5LK97fIao7mDkHcsuht7qCV8VOFGDp79WM5dyFraLNgd5vhXLMmLQbDgip7n3
	4PgPyt1Of4KI2FoLDrgt2BnyEUpDMe6zNDRolg==
X-Received: by 2002:a2e:8818:0:b0:308:e956:66e with SMTP id 38308e7fff4ca-3179449456amr499931fa.0.1745433446931;
        Wed, 23 Apr 2025 11:37:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeLX03zhP8nSlFHqNWBiKFBjf3MShxZQb8tc2EeW+8vLK6+b+87nnEoR+0vFre3XFcDl9w4g==
X-Received: by 2002:a2e:8818:0:b0:308:e956:66e with SMTP id 38308e7fff4ca-3179449456amr499761fa.0.1745433446435;
        Wed, 23 Apr 2025 11:37:26 -0700 (PDT)
Received: from [192.168.1.86] (85-23-48-6.bb.dnainternet.fi. [85.23.48.6])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109075e8e9sm19833701fa.12.2025.04.23.11.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 11:37:26 -0700 (PDT)
Message-ID: <36891b0e-d5fa-4cf8-a181-599a20af1da3@redhat.com>
Date: Wed, 23 Apr 2025 21:37:24 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/24] mm/hmm: let users to tag specific PFN with DMA
 mapped bit
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 Leon Romanovsky <leonro@nvidia.com>, Jake Edge <jake@lwn.net>,
 Jonathan Corbet <corbet@lwn.net>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-pci@vger.kernel.org,
 kvm@vger.kernel.org, linux-mm@kvack.org,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 Chuck Lever <chuck.lever@oracle.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Dan Williams
 <dan.j.williams@intel.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Chaitanya Kulkarni <kch@nvidia.com>
References: <cover.1745394536.git.leon@kernel.org>
 <0a7c1e06269eee12ff8912fe0da4b7692081fcde.1745394536.git.leon@kernel.org>
 <7185c055-fc9e-4510-a9bf-6245673f2f92@redhat.com>
 <20250423181706.GT1213339@ziepe.ca>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20250423181706.GT1213339@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 4/23/25 21:17, Jason Gunthorpe wrote:
> On Wed, Apr 23, 2025 at 08:54:05PM +0300, Mika Penttilä wrote:
>>> @@ -36,6 +38,13 @@ enum hmm_pfn_flags {
>>>  	HMM_PFN_VALID = 1UL << (BITS_PER_LONG - 1),
>>>  	HMM_PFN_WRITE = 1UL << (BITS_PER_LONG - 2),
>>>  	HMM_PFN_ERROR = 1UL << (BITS_PER_LONG - 3),
>>> +
>>> +	/*
>>> +	 * Sticky flags, carried from input to output,
>>> +	 * don't forget to update HMM_PFN_INOUT_FLAGS
>>> +	 */
>>> +	HMM_PFN_DMA_MAPPED = 1UL << (BITS_PER_LONG - 7),
>>> +
>> How is this playing together with the mapped order usage?
> Order shift starts at bit 8, DMA_MAPPED is at bit 7

hmm bits are the high bits, and order is 5 bits starting from
(BITS_PER_LONG - 8)


> The pfn array is linear and simply indexed. The order is intended for
> page table like HW to be able to build larger entries from the hmm
> data without having to scan for contiguity.
>
> Even if order is present the entry is still replicated across all the
> pfns that are inside the order.
>
> At least this series should replicate the dma_mapped flag as well as
> it doesn't pay attention to order.
>
> I suspect a page table implementation may need to make some small
> changes. Indeed with guarenteed contiguous IOVA there may be a
> significant optimization available to have the HW page table cover all
> the contiguous present pages in the iommu, which would be a higher
> order than the pages themselves. However this would require being able
> to punch non-present holes into contiguous mappings...
>
> Jason
>
--Mika


