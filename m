Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EDD1F03F2
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266209; cv=none; b=fDuyj99iso/B7hSNZ3nl+9XA4TMKo00vq8nC9/jaXDkV/vy1cJn4MzS8GFfnZj69yc4pW9JUtC/kYtGGVtYguPFzrl4BXadXl7afMoMIztguSX6czDN4bNjJlPgCN/PorgdLO4ALaHBHrjL0ClukoFShSu5yf3ykGKNKG6Td9Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266209; c=relaxed/simple;
	bh=kvI1JvN/B+SmcLWMmN8uvPZDaEURl3dCfrUg5PfFmFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MRUTKonsBnEjvRja1SvKAuqq7jqZtG8vedcfWcBfdxJnRr5L4L/lQMz+19T9mVQ/PNj4dHfKrY49s8MbwWX/va5/G5PWJGqv2Dh2sEobTzXi9qqVwshE7oLXPeTNnzB1eWlJP0mwLqGmD8l463rBkk4XLWgoI+S1WAlXIeJ5IPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=GhBoebNV; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="GhBoebNV"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f6022c2c3so50463305ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739266206; x=1739871006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sZGf0xi/4b8W9mpMXk16WtP1In4vsvOrm+YoAOgFYnY=;
        b=GhBoebNVRVBfvSSMZ8P3/lIvigaRS7DMa5kLK5sp0JLnJm16mr+ZmBtYyTfaPDmqnk
         dKB4zojoMbUL13KHEGofta2pwFBVFNrgnPON/+lSXR+48xQKynRuJWscA+zA5fEMlCq8
         FzQg1LW5mIh6c62rhi6aX9FCDSooru0einK2yvAGYPFXBT3jHpAMmbdgcKdVeJGYK2TV
         ndJfU8k4juiHA4q+XTIfPxrM+rTfBG2HgCLEFjTIOkjVQfaB/ggTwiXWoS1zn+VhlfVH
         FsKAZakMfbz0PscBODdIhO64F38Lhfh6M5HUv8t+npgt430qNOuUKt/8uv5d2NifRX50
         y+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739266206; x=1739871006;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sZGf0xi/4b8W9mpMXk16WtP1In4vsvOrm+YoAOgFYnY=;
        b=XyvTzvsYwwulB6pb0RO8yIrdnRAphZnZSMf6ju0B8HmWpalExCIZPtrWFcC48WSXH3
         nZ3xATayvYQYD0QFIkpNbgiD7uhDsf3NiazYxSCxCXlqTKkTnCV6Npne4IUs/2MqRBs+
         J14ZZ8vosHrhcoF64lOyaACczDtAbUurjtZk2p/G2eTGUKs5iBN2nQzwCc52s9aGs5Z4
         PA/QK14doyzOXBQ2FQIzJA8VE//icdtCjhxFWzfmJWDFhYlVYoy1I+oKPWAijJknhB7J
         OitxFtYCaebu9ROPoYzoehXn2KEFTKShFR75EQF6MPam5JtEu0Z82BUizN4MX5436QbZ
         XqLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHVo6rA3+U5zy5FUkJCkzI1Km6V4F0nSF36LFiOPxmLaJTVQGWJLpfRpHZxgDIzwuQmftKF71JLM/8ySg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHttjs0gIrPwfk1V9xWJtv85TPnzr7BsWr9uXwZJtNzAF6aiDA
	braBvSYfSXN2pbqxPsrj7E9sjWjrJYleGFjBYKt4YmUUXvGM2w4dVic2Es4lNSI=
X-Gm-Gg: ASbGnctIV0lKtOKD1p3wshZE8YPrzyoArdwg1yvMmI9lg97z0W3+/M3xqXFncqvJQ53
	TETzDKaskVGHjfj+OGJuESsPD43o4fhi8qa1plAplk4XJ6yDQJXaK/flDPOmoFM+qcCyJDxDx6c
	oVyuAdnYxZVMvB044kdSRTa/qk66WxrcGEw8BFzOApyiBp9WSssL7yiugC3pm9a9RJgwA6cEVYi
	3v+j206CcYkcIBf/mGDEynPbVJUxcdZcy9jkLh6XZnpxITTKpfBsElkIeICYZExYm+eCRM4JS26
	v+dqQdU7lr7dnzvjtRDlklv8J7Ao/H51njEkjWdNaw==
X-Google-Smtp-Source: AGHT+IHz2wraFOMYkQVidUPLFFmnf8k8K12BClWjhTy636Rw37Ve8wP0uUjF/xA18SklE94GG5V2SA==
X-Received: by 2002:a05:6a00:194e:b0:724:db17:f975 with SMTP id d2e1a72fcca58-73218ca2438mr4671628b3a.12.1739266206470;
        Tue, 11 Feb 2025 01:30:06 -0800 (PST)
Received: from [10.84.150.121] ([203.208.167.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-730932871f1sm2921625b3a.151.2025.02.11.01.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 01:30:06 -0800 (PST)
Message-ID: <3f7babee-b232-4e6b-a896-947150dcd1ef@bytedance.com>
Date: Tue, 11 Feb 2025 17:29:57 +0800
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
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <34bcf011-b4ac-479c-92ce-852623e73039@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/2/11 17:14, David Hildenbrand wrote:
> On 11.02.25 04:45, Qi Zheng wrote:
>> Hi Russell,
>>
>> On 2025/2/11 01:03, Russell King (Oracle) wrote:
>>> On Mon, Feb 10, 2025 at 05:49:38PM +0100, Ezra Buehler wrote:
>>>> When running vanilla Linux 6.13 or newer (6.14-rc2) on the
>>>> AT91SAM9G25-based GARDENA smart Gateway, we are seeing a NULL pointer
>>>> dereference resulting in a kernel panic. The culprit seems to be commit
>>>> fc9c45b71f43 ("arm: adjust_pte() usepte_offset_map_rw_nolock()").
>>>> Reverting the commit apparently fixes the issue.
>>>
>>> The blamed commit is buggy:
>>>
>>> arch/arm/include/asm/tlbflush.h:
>>> #define update_mmu_cache(vma, addr, ptep) \
>>>           update_mmu_cache_range(NULL, vma, addr, ptep, 1)
>>>
>>> So vmf can be NULL. This didn't used to matter before this commit,
>>> because vmf was not used by ARM's update_mmu_cache_range(). However,
>>> the commit introduced a dereference of it, which now causes a NULL
>>> point dereference.
>>>
>>> Not sure what the correct solution is, but at a guess, both:
>>>
>>>     if (ptl != vmf->ptl)
>>>
>>> need to become:
>>>
>>>     if (!vmf || ptl != vmf->ptl)
>>
>> No, we can't do that, because without using split PTE locks, we would
>> use shared mm->page_table_lock, which would create a deadlock.
> 
> Maybe we can simply special-case on CONFIG_SPLIT_PTE_PTLOCKS ?
> 
> if (IS_ENABLED(CONFIG_SPLIT_PTE_PTLOCKS)) {

In this case, if two vmas map the same PTE page, then the same PTE lock
will be held repeatedly. Right?

This seems to be a problem that existed before commit fc9c45b71f43
("arm: adjust_pte() use pte_offset_map_rw_nolock()").

> 
> ...
> }
> 
