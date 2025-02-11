Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9B96FB9
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 12:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739277685; cv=none; b=Vyik7m255NDiu7nUOdgBWNqF+6jImDyu0egVOI0Zivp3sSmfLNJX60nuQt6fdZIQdhHRK+e9s7DLnraualbyLt8ceVw3RqynFncwX3BygyWCrMFgaN5LjuZFSU2d+E1hgAoL20qUyzKR1dK5Z6h0sl+tY+PDsjUkpbnthLP12sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739277685; c=relaxed/simple;
	bh=C1WhkqiFsBljlYGCkAHTiJbIzRqzqDmEMYr4hac1ecY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S2RA2xWB3tF9VIR/2uCldbFoLoS6UAgJvCfK879tGHeEO9z002moG8cS2sJL4XPn0YsTOX/FwE/16xIddFEl/R/j5Tpx74Zu7tbcjgL/Viz9q3Gz9lIZEifffSfFg6ApTEm9fseyuc+3plcuHxic0l8KbHo5aS/UBY88DtBVbos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=h+HpkbUw; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="h+HpkbUw"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f6f18b474so41909285ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739277682; x=1739882482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qp8FXc7l2huQpDDqUvBf4BSAvHA6gyxKUiNVmQD6PLw=;
        b=h+HpkbUwTEGUXO+YV3g4wVWphnWwj0yA7F9z6EFH75nxM46jVAv0XFvmuQ4Xa2n4VP
         HgNlqZ2j+odkF6nyoWrAPxGA/HiibEX7aN7BPN4Co1eB8qS2yIHdnZiRQ1CcPXDgmcMa
         Pyc3aHh0y+4yTdoWHbo4ZSuzrD2fXNHJ54RvXNOYhwAQ+6GBRHa+iUT2Hj131bstjjmP
         1hqqu0G1lvr53Xb+QqUx1lEvVHkW0MKqHLU5tipEsMUqtjDru+ul5LKCTtAmCez0c/5Y
         uQ1lfPI4zzSM2eALcanDbKKqV97GIuop989EMlsLy9gPVY8+toTM6rxJkgrXl3yfq9tz
         bCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739277682; x=1739882482;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qp8FXc7l2huQpDDqUvBf4BSAvHA6gyxKUiNVmQD6PLw=;
        b=KvYVGNJcknb7cVkiFK2aLebKu7NZF3Oy5YivKBp93hA1KRfnJRV0HuRjSOyjhLGdV+
         1c/LZMOBpcDWczwLCnyLVF6wfRKE+5hqfpKnJuwJd5/EKWTmNmTByZSAMKDrfiSYp2Es
         Vrg29n5Bbi5HwBiI+0RwkuYeuwvu2JVMSl5xDTwfwuE4P47i4yEVMrHBLtYrXwmHnJt3
         THY6GdU7oarsBezY9p/zdsA/yOfB9LdsmsJw1YohAeasqAhm3pY2q+EZBN5qY/FIv4V0
         exE1z/IKa41Oq0OC+QF+ERNUb8NVoJA1ID5DH/WLokf4BxM1auxscU797gqjwjw888/R
         FLHw==
X-Forwarded-Encrypted: i=1; AJvYcCXtRCoxNk7OTWtuAzH8wnR5/VYIZkj4JNltG4KJk5ywi6r61oNKzH6AN+T8yWsMrCzwhoj0x3r/kUlcdg8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/3ItRK2yA2e11uYV7rHR8ZmObO++gqIXAsErEIMuYp4g9ijPr
	uUUzKaCoLmi4618q/FQyhFrse3V4m0ASPRSy4MGh4T0WmPcv0czrK+gIP/dxyiU=
X-Gm-Gg: ASbGnctPPzeD1u1nTk2aLW9tDLynZoM7sp6rAlFZo97VPYN1EhFah8zRaCJ9gEOk9ek
	vlsL+ssAgEW0drAY9R/x7PkWNIK3AdxUoiLPQUr5GtlbtrMTKj/3w5Q8lcpsQlgJB+v5Lt0XFWf
	M70uCVKByfBun0BiLwLsOP2PtMLaDVnTN76E5Jdar+9dTpaIxyA5y4B0hV8nHSMaftHYcLRl+fw
	XPjdaN+y2WvMXEYFpNfGmODVPZHWyItb9fZzP7c1pxo0H6Iw0HdYoGSuK0h0rtelssLhBwK2n8v
	q6GQQIAs1vC3I9J+tUVN6hlYusOL3Qx2MuDgpyNILg==
X-Google-Smtp-Source: AGHT+IHOuwW2S8J1yw3NRTlkAu47N8Bv/dy8tpNXivF9AQn/HjfyDnQSydirHNWFT7gUC4WKzQR0nQ==
X-Received: by 2002:a17:902:e946:b0:216:6f1a:1c81 with SMTP id d9443c01a7336-21f4e6a57f1mr313385905ad.2.1739277682572;
        Tue, 11 Feb 2025 04:41:22 -0800 (PST)
Received: from [10.84.150.121] ([203.208.167.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368bb4bdsm94384425ad.235.2025.02.11.04.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 04:41:22 -0800 (PST)
Message-ID: <be323425-2465-423a-a6f4-affbaa1efe09@bytedance.com>
Date: Tue, 11 Feb 2025 20:41:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] NULL pointer dereference on ARM (AT91SAM9G25) during
 compaction
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Ezra Buehler <ezra@easyb.ch>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, Vlastimil Babka <vbabka@suse.cz>,
 Ryan Roberts <ryan.roberts@arm.com>,
 "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 open list <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <CAM1KZSmZ2T_riHvay+7cKEFxoPgeVpHkVFTzVVEQ1BO0cLkHEQ@mail.gmail.com>
 <Z6oxUdrVBPd5ZTEu@shell.armlinux.org.uk>
 <5d50d714-197f-44c0-94e0-ff70ee51e866@bytedance.com>
 <34bcf011-b4ac-479c-92ce-852623e73039@redhat.com>
 <3f7babee-b232-4e6b-a896-947150dcd1ef@bytedance.com>
 <2b0bb476-5bd6-489a-9b9e-7aa20964abfa@redhat.com>
 <4e298f68-36ff-496a-81d2-7124f792180d@bytedance.com>
 <bad8e013-3d01-4fe5-8783-c6d7e0e32a74@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <bad8e013-3d01-4fe5-8783-c6d7e0e32a74@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/2/11 20:09, David Hildenbrand wrote:
> On 11.02.25 10:43, Qi Zheng wrote:
>>
>>
>> On 2025/2/11 17:37, David Hildenbrand wrote:
>>> On 11.02.25 10:29, Qi Zheng wrote:
>>>>
>>>>
>>>> On 2025/2/11 17:14, David Hildenbrand wrote:
>>>>> On 11.02.25 04:45, Qi Zheng wrote:
>>>>>> Hi Russell,
>>>>>>
>>>>>> On 2025/2/11 01:03, Russell King (Oracle) wrote:
>>>>>>> On Mon, Feb 10, 2025 at 05:49:38PM +0100, Ezra Buehler wrote:
>>>>>>>> When running vanilla Linux 6.13 or newer (6.14-rc2) on the
>>>>>>>> AT91SAM9G25-based GARDENA smart Gateway, we are seeing a NULL 
>>>>>>>> pointer
>>>>>>>> dereference resulting in a kernel panic. The culprit seems to be
>>>>>>>> commit
>>>>>>>> fc9c45b71f43 ("arm: adjust_pte() usepte_offset_map_rw_nolock()").
>>>>>>>> Reverting the commit apparently fixes the issue.
>>>>>>>
>>>>>>> The blamed commit is buggy:
>>>>>>>
>>>>>>> arch/arm/include/asm/tlbflush.h:
>>>>>>> #define update_mmu_cache(vma, addr, ptep) \
>>>>>>>             update_mmu_cache_range(NULL, vma, addr, ptep, 1)
>>>>>>>
>>>>>>> So vmf can be NULL. This didn't used to matter before this commit,
>>>>>>> because vmf was not used by ARM's update_mmu_cache_range(). However,
>>>>>>> the commit introduced a dereference of it, which now causes a NULL
>>>>>>> point dereference.
>>>>>>>
>>>>>>> Not sure what the correct solution is, but at a guess, both:
>>>>>>>
>>>>>>>       if (ptl != vmf->ptl)
>>>>>>>
>>>>>>> need to become:
>>>>>>>
>>>>>>>       if (!vmf || ptl != vmf->ptl)
>>>>>>
>>>>>> No, we can't do that, because without using split PTE locks, we would
>>>>>> use shared mm->page_table_lock, which would create a deadlock.
>>>>>
>>>>> Maybe we can simply special-case on CONFIG_SPLIT_PTE_PTLOCKS ?
>>>>>
>>>>> if (IS_ENABLED(CONFIG_SPLIT_PTE_PTLOCKS)) {
>>>>
>>>> In this case, if two vmas map the same PTE page, then the same PTE lock
>>>> will be held repeatedly. Right?
>>>
>>> Hmm, the comment says:
>>>
>>>           /*
>>>            * This is called while another page table is mapped, so we
>>>            * must use the nested version.  This also means we need to
>>>            * open-code the spin-locking.
>>>            */
>>>
>>> "another page table" implies that it cannot be the same. But maybe that
>>> comment was also wrong?
>>
>> I don't see make_coherent() ensuring this when traversing vma.
> 
> Right, we could just have the same file range mapped MAP_SHARED into the 
> same page table using two VMAs ... I suspect writing a reproducer for 
> the deadlock should be easy.

I guess so, but I don't have an arm32 test environment yet. :(

[...]

>>           vma_interval_tree_foreach(mpnt, &mapping->i_mmap, pgoff, 
>> pgoff) {
>> +               unsigned long mpnt_addr;
>> +
>>                   /*
>>                    * If this VMA is not in our MM, we can ignore it.
>>                    * Note that we intentionally mask out the VMA
>> @@ -151,7 +178,14 @@ make_coherent(struct address_space *mapping, struct
>> vm_area_struct *vma,
>>                   if (!(mpnt->vm_flags & VM_MAYSHARE))
>>                           continue;
>>                   offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
>> -               aliases += adjust_pte(mpnt, mpnt->vm_start + offset,
>> pfn, vmf);
>> +               mpnt_addr = mpnt->vm_start + offset;
>> +               /*
>> +                * If mpnt_addr and addr are mapped to the same PTE page,
>> +                * also skip this vma.
>> +                */
>> +               if (mpnt_addr >= start && mpnt_addr - start < PMD_SIZE)
>> +                       continue;
> 
> Hmm, but is skipping the right thing to do? Maybe you would want to 

Ah, your concern is that in this case we may also need to maintain cache
coherency. I'm not sure about this.

> indicate to adjust_pte() whether it must take the PTL or not.

Indeed, this is a better approach. Will do it, and hope arm people
can help test it.

Thanks!

> 
> I did not study that code in detail, though ...
> 
