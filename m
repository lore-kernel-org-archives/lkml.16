Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C0824EF8C
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747902333; cv=none; b=T319RKsB7A5LYvv2JrxCwhx9vUSc/gFkec+jLIPGDt1Ykb5aXP7YlSlqryyNQdABcmXD0FFvsl4vvI4dOjUyPH5ZA9cnuGmv8mXaoDKvcsqADQKP6cskSHdvRXpaiFeIBBWTuczchErwgbwR8U9oJ73J+1mJ0bQmv+o2+mz4Hos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747902333; c=relaxed/simple;
	bh=vo2rjWtUTpmYs1KbI1Arsz3ie3i7WCRJwXfV5miYmHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j/ksPGKP1MGV6mFElB5vCrvmdpDvm0sp7Rp2g9egQsTz8HPvTRCWNViILZpmC69apV7ZGAFoISyysEeQKwjfUpTHCYDUM9E2L6M2MTUk2ASJ8vX+IBP/MIY3IPTj/0RqLvSWXk0qa8j8SkNd700awD5yWHEVYrQ+HFy6XsbhqJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=LEmP9An7; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="LEmP9An7"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74019695377so5739991b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 01:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747902330; x=1748507130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXT3T1yAeHiQt/njGr5efX24PkdGfFV5UElyW1G3TFM=;
        b=LEmP9An7D20vCW9IsSseZWTexlLAQaaxShAJJ4jVjpPSttbuBGrDJkDd9TcKeMNJRX
         cdGjt+T+iHPCAGoJziXH0VSCZp4hum4gOH0a+Ykz0dzqFAnv54fBed8hMqdvywFbNL08
         fyVetYi/nLVobnmxkKHkLHKcn0Y9t4TiYepOonxmW6Q0zrT8NiSX3ule51HqQ6lrm38B
         5p0/FI0VzfeBC58T6/8Xo6mQOaHcMabE0+BzXoP7e8HpvefBia8lF/8/vVbSOmYmnOS8
         kCl01641nMBt2ba7mMhqIAZxX2fGHLKFg84mGbw+YKB1FlztvCGS2fQf80THmVGEq/2M
         Zvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747902330; x=1748507130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXT3T1yAeHiQt/njGr5efX24PkdGfFV5UElyW1G3TFM=;
        b=KzT1RdZf5hvPPtw4m74svGyFWXHD9sr3ffd+/ryQa8yjTYPOS6993DJwjyAFEudlFQ
         zp9WcbICvLRPv0PLSuEEMennglaUHccXBblcLY77s8pBYRhMzmDfv9SSJpdzRVt31m17
         ty8xM6mNFSgaIN17Xa7pUFJ4wwRgdN285j6we0TLJ2DUQoyGECnuetPtfEzBYf0QStNv
         HfcBr42N7PQkpo709rtBryysxM+1hgg89ELXaaa/d28TdMwZmFsEh0aDKL6GnQl3k4/X
         2KPRIsX4Ixrtsr29/iun5ayZh3ns6oApYcsGOOQ0DtvJfvIUbkkRAQSW1QFEM2YnOxKn
         h7Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXYAUlIKeFDMY1I49xQyhpVuP1tp/Q8RowRweC1bDcEEJ2RjpBxKnyYU34QnaDNyjw5d62OSp6gOehxqLc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0HKqpeO0AeifpjRKqDpe8K9NlrFjbr1QioK6U7WtxDmAmxcZS
	RxMP2YCNFuAAfX/fSaVLGsTG+C1wbGxmOkiRGjm+M9Dadek2SCDOnYzrRIabSapgpkk=
X-Gm-Gg: ASbGncvk/32OFUeQZuLBKSiwkhZD1ky3Niha/KlRtk3tRVHPHWPnT4IgH2DluXBTRDQ
	+Ir5TP/vmXOow6idNY9lR+ysnOiKvwh+LpiQXsAis+4+b1Ku5am/oUGDBXZrw0PMWfdZSF8rZUR
	t0leoj56SuS7XbzVBGr3g6RKhJ4hnqR7OI7BHZdcT04QuHZSEEwZZg24xu48R9ApH621j4ERdA3
	Kp37SUawUwmsr+oM7wTEsmGuFY140kOBsK4zrWlqP8rES+vcyPMFKWbeM4WxVswwO8D4Ow8pYv5
	QjnbKG5t/XTOV5BEIUooViuIdYr6IzWDc+2d3a5X4aaMV3qxMSdwdmRIxYqUATslrbILitMOVTV
	rhg==
X-Google-Smtp-Source: AGHT+IFog76TSsUXHJmLNFDQxP4BmwEUI8rnDjgaiaHaf7T0e0+s3zpozYerKMn4OCmUxJqa3IbCdw==
X-Received: by 2002:a05:6a21:9012:b0:216:19c1:1f54 with SMTP id adf61e73a8af0-2162188b866mr34190925637.4.1747902330240;
        Thu, 22 May 2025 01:25:30 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970d5f0sm11145399b3a.56.2025.05.22.01.25.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 22 May 2025 01:25:29 -0700 (PDT)
From: lizhe.67@bytedance.com
To: david@redhat.com
Cc: alex.williamson@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com,
	muchun.song@linux.dev,
	peterx@redhat.com
Subject: Re: [PATCH v4] vfio/type1: optimize vfio_pin_pages_remote() for large folio
Date: Thu, 22 May 2025 16:25:24 +0800
Message-ID: <20250522082524.75076-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <81d73c4c-28c4-4fa0-bc71-aef6429e2c31@redhat.com>
References: <81d73c4c-28c4-4fa0-bc71-aef6429e2c31@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 22 May 2025 09:22:50 +0200, david@redhat.com wrote:

>On 22.05.25 05:49, lizhe.67@bytedance.com wrote:
>> On Wed, 21 May 2025 13:17:11 -0600, alex.williamson@redhat.com wrote:
>> 
>>>> From: Li Zhe <lizhe.67@bytedance.com>
>>>>
>>>> When vfio_pin_pages_remote() is called with a range of addresses that
>>>> includes large folios, the function currently performs individual
>>>> statistics counting operations for each page. This can lead to significant
>>>> performance overheads, especially when dealing with large ranges of pages.
>>>>
>>>> This patch optimize this process by batching the statistics counting
>>>> operations.
>>>>
>>>> The performance test results for completing the 8G VFIO IOMMU DMA mapping,
>>>> obtained through trace-cmd, are as follows. In this case, the 8G virtual
>>>> address space has been mapped to physical memory using hugetlbfs with
>>>> pagesize=2M.
>>>>
>>>> Before this patch:
>>>> funcgraph_entry:      # 33813.703 us |  vfio_pin_map_dma();
>>>>
>>>> After this patch:
>>>> funcgraph_entry:      # 16071.378 us |  vfio_pin_map_dma();
>>>>
>>>> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
>>>> Co-developed-by: Alex Williamson <alex.williamson@redhat.com>
>>>> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
>>>> ---
>>>
>>> Given the discussion on v3, this is currently a Nak.  Follow-up in that
>>> thread if there are further ideas how to salvage this.  Thanks,
>> 
>> How about considering the solution David mentioned to check whether the
>> pages or PFNs are actually consecutive?
>> 
>> I have conducted a preliminary attempt, and the performance testing
>> revealed that the time consumption is approximately 18,000 microseconds.
>> Compared to the previous 33,000 microseconds, this also represents a
>> significant improvement.
>> 
>> The modification is quite straightforward. The code below reflects the
>> changes I have made based on this patch.
>> 
>> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
>> index bd46ed9361fe..1cc1f76d4020 100644
>> --- a/drivers/vfio/vfio_iommu_type1.c
>> +++ b/drivers/vfio/vfio_iommu_type1.c
>> @@ -627,6 +627,19 @@ static long vaddr_get_pfns(struct mm_struct *mm, unsigned long vaddr,
>>          return ret;
>>   }
>>   
>> +static inline long continuous_page_num(struct vfio_batch *batch, long npage)
>> +{
>> +       long i;
>> +       unsigned long next_pfn = page_to_pfn(batch->pages[batch->offset]) + 1;
>> +
>> +       for (i = 1; i < npage; ++i) {
>> +               if (page_to_pfn(batch->pages[batch->offset + i]) != next_pfn)
>> +                       break;
>> +               next_pfn++;
>> +       }
>> +       return i;
>> +}
>
>
>What might be faster is obtaining the folio, and then calculating the 
>next expected page pointer, comparing whether the page pointers match.
>
>Essentially, using folio_page() to calculate the expected next page.
>
>nth_page() is a simple pointer arithmetic with CONFIG_SPARSEMEM_VMEMMAP, 
>so that might be rather fast.
>
>
>So we'd obtain
>
>start_idx = folio_idx(folio, batch->pages[batch->offset]);

Do you mean using folio_page_idx()?

>and then check for
>
>batch->pages[batch->offset + i] == folio_page(folio, start_idx + i)

Thank you for your reminder. This is indeed a better solution.
The updated code might look like this:

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index bd46ed9361fe..f9a11b1d8433 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -627,6 +627,20 @@ static long vaddr_get_pfns(struct mm_struct *mm, unsigned long vaddr,
        return ret;
 }
 
+static inline long continuous_pages_num(struct folio *folio,
+               struct vfio_batch *batch, long npage)
+{
+       long i;
+       unsigned long start_idx =
+                       folio_page_idx(folio, batch->pages[batch->offset]);
+
+       for (i = 1; i < npage; ++i)
+               if (batch->pages[batch->offset + i] !=
+                               folio_page(folio, start_idx + i))
+                       break;
+       return i;
+}
+
 /*
  * Attempt to pin pages.  We really don't want to track all the pfns and
  * the iommu can only map chunks of consecutive pfns anyway, so get the
@@ -708,8 +722,12 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
                         */
                        nr_pages = min_t(long, batch->size, folio_nr_pages(folio) -
                                                folio_page_idx(folio, batch->pages[batch->offset]));
-                       if (nr_pages > 1 && vfio_find_vpfn_range(dma, iova, nr_pages))
-                               nr_pages = 1;
+                       if (nr_pages > 1) {
+                               if (vfio_find_vpfn_range(dma, iova, nr_pages))
+                                       nr_pages = 1;
+                               else
+                                       nr_pages = continuous_pages_num(folio, batch, nr_pages);
+                       }
 
                        /*
                         * Reserved pages aren't counted against the user,

Thanks,
Zhe
