Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15671BD9D2
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266683; cv=none; b=llMJolQiLuWXwEZml/VunND8Qyxgb7PJ8o6x3oOdWhqZj7eez4WXNAtTnQEyqBBQtG/iRs+Xm2LVqmwypxPVMulxk11JeJnK8uVN3E7e3jSmpzPYmKvqQBD2ESP5a6Buw/bf/xkYhNW3GiHPjjXz62KbEkWckYa6clf4U9iuoKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266683; c=relaxed/simple;
	bh=LeW9h4eftPtTjZannHyTsTHVG90avQJV9ka2KtU2Y+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FzQ9tPvWS9aTlQvkRE39huCK6XTaKUmb9jktX00GBdXfCe7Nvgm44jGJQjpyvnUCT4EXyp2VyFSrIGMD69UYR/m8Q8VjVS5+2qpZqL4B3kiozqECqjPQHnvr5/jsWL1OjIaYnrOGvasf4CyRgF833lLiYqfLjVeIbEYtwgZf28I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C9D2RLZ5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C9D2RLZ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739266680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rqWE4p6XLBT63qofoUaEI9KGmwZZNE/fsrMteRuGGoE=;
	b=C9D2RLZ5H0joF9u+atD1h+KRwx7X7hUqTnU1O6rqa2tJ0b8qv+/rkXxPoSHmL5ETkKip05
	I5Q/6ZTUj1G8QD+U6hMO9gM/tREQmNBoWZBLtKtCxufg4ftd7RD4HgcKJ/S8PIgWZhSsrZ
	CwbyZ5oocy71mUkRldLFVV4gcIZa5IY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-LR6Wf6V_OTmtkyNV7By4fw-1; Tue, 11 Feb 2025 04:37:59 -0500
X-MC-Unique: LR6Wf6V_OTmtkyNV7By4fw-1
X-Mimecast-MFC-AGG-ID: LR6Wf6V_OTmtkyNV7By4fw
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43933bdcce0so19973935e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:37:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739266678; x=1739871478;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rqWE4p6XLBT63qofoUaEI9KGmwZZNE/fsrMteRuGGoE=;
        b=LpnXPaKIKSoT9HDFwYYz7PtEIx8JRZjlIESX3zkFTJjo6BOLTihBRkKBbeGQjTn40c
         GABRc17LCBvFLJyNXfMoV24rlzVU6iHpyPVrkJ1HET+Yy3t9y4WxN06tmOCSgde5uGvl
         +w76Wb5CRsdfu6F6tRbUcFQe4dtjy4bb9N7dwCLibo7OLTRv471Y/B+G43+eWmW3LHS1
         MeZtNUdquCV9uknmf1JzpWh4rMNU6fp0yLtDjHYlfA1k6dfb2I5CtkQURy/w/7ln7AnT
         vDa/ZbjJjliMf1hKdFRuqqDwwZ4KfxVTwUyPdQSD3xUc9RmFVovmA36X6iLJwdDIo4DO
         lEjg==
X-Forwarded-Encrypted: i=1; AJvYcCUTzrEen3+4nLtrVeSdsXO/iFEnG9cpm5Sq+tiuOqTc2aVI6/2a2Bb2GeR5Pu3w5y2cvl8U4EosBOT0cVo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5OUHLW5FhUEYuiIytK8dxWRY9P0CG3zB8s4DJDjzDGGptT0tl
	GpDRm5bQ6uNpmuRTxyjpvAdB8heQ8Yx+EmSfEAM7O90fMprgbDwxlHpZ62wlA+Xp3Tsolkj9c7i
	rAeHfKwdvyjMwghZN8UYS955HrHn0PObPTu/1Fl0UcZBer3fvmAOIifWILHjQDA==
X-Gm-Gg: ASbGnctev27NUbPcqkUWwBMsL+P1e1HhUxD7PKnP4S5K0yOmReC+YLocoBrUwGpdxFa
	jHuHNO8F44lVvS6cXMOPy6LrZJW4Ri/+7xrXH0L4nGXcmT69VgiRAf/ZGaURRvu7zTRvWoY9xw5
	TmKWoTJClcsNqk3Xg1Y6zrasyb4dTXh3RNLECSJp7nIMU8veTbrATeWqdHsyRWmzDFnzg8yBF70
	Z1vgBm86VOdeGlf9tVhH2JyzddOWwRdva6XMQ2BoRv/1AR5YEq8aHVf1NpBta2yCks7dIqGV7XQ
	BXDw2otIeqqOprNhh0Op0lOAJFPmwbvurolfOD8=
X-Received: by 2002:a05:600c:4c1a:b0:439:331b:e34f with SMTP id 5b1f17b1804b1-439331be65amr99775315e9.17.1739266677996;
        Tue, 11 Feb 2025 01:37:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdMJ3Lbn+4zbv9eh9uw+CnLa7ynQQjEkdGPE5ELAKNvD2Zn/ydAg6zsMZGerEubApHp0jBOQ==
X-Received: by 2002:a05:600c:4c1a:b0:439:331b:e34f with SMTP id 5b1f17b1804b1-439331be65amr99774975e9.17.1739266677617;
        Tue, 11 Feb 2025 01:37:57 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd8dee385sm7263297f8f.61.2025.02.11.01.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 01:37:56 -0800 (PST)
Message-ID: <2b0bb476-5bd6-489a-9b9e-7aa20964abfa@redhat.com>
Date: Tue, 11 Feb 2025 10:37:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] NULL pointer dereference on ARM (AT91SAM9G25) during
 compaction
To: Qi Zheng <zhengqi.arch@bytedance.com>
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
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <3f7babee-b232-4e6b-a896-947150dcd1ef@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11.02.25 10:29, Qi Zheng wrote:
> 
> 
> On 2025/2/11 17:14, David Hildenbrand wrote:
>> On 11.02.25 04:45, Qi Zheng wrote:
>>> Hi Russell,
>>>
>>> On 2025/2/11 01:03, Russell King (Oracle) wrote:
>>>> On Mon, Feb 10, 2025 at 05:49:38PM +0100, Ezra Buehler wrote:
>>>>> When running vanilla Linux 6.13 or newer (6.14-rc2) on the
>>>>> AT91SAM9G25-based GARDENA smart Gateway, we are seeing a NULL pointer
>>>>> dereference resulting in a kernel panic. The culprit seems to be commit
>>>>> fc9c45b71f43 ("arm: adjust_pte() usepte_offset_map_rw_nolock()").
>>>>> Reverting the commit apparently fixes the issue.
>>>>
>>>> The blamed commit is buggy:
>>>>
>>>> arch/arm/include/asm/tlbflush.h:
>>>> #define update_mmu_cache(vma, addr, ptep) \
>>>>            update_mmu_cache_range(NULL, vma, addr, ptep, 1)
>>>>
>>>> So vmf can be NULL. This didn't used to matter before this commit,
>>>> because vmf was not used by ARM's update_mmu_cache_range(). However,
>>>> the commit introduced a dereference of it, which now causes a NULL
>>>> point dereference.
>>>>
>>>> Not sure what the correct solution is, but at a guess, both:
>>>>
>>>>      if (ptl != vmf->ptl)
>>>>
>>>> need to become:
>>>>
>>>>      if (!vmf || ptl != vmf->ptl)
>>>
>>> No, we can't do that, because without using split PTE locks, we would
>>> use shared mm->page_table_lock, which would create a deadlock.
>>
>> Maybe we can simply special-case on CONFIG_SPLIT_PTE_PTLOCKS ?
>>
>> if (IS_ENABLED(CONFIG_SPLIT_PTE_PTLOCKS)) {
> 
> In this case, if two vmas map the same PTE page, then the same PTE lock
> will be held repeatedly. Right?

Hmm, the comment says:

         /*
          * This is called while another page table is mapped, so we
          * must use the nested version.  This also means we need to
          * open-code the spin-locking.
          */

"another page table" implies that it cannot be the same. But maybe that 
comment was also wrong?


-- 
Cheers,

David / dhildenb

