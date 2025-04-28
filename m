Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3303920CCDF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745848761; cv=none; b=j0NSxDnC9d++cOzTvUCcJ1V1DmaIaqSTVEtwpHsITqf+8Al1qkgVgIKyu61DFwXp8S3U6sRWjgAafQlKw59OO0MmtCEY12zAiPQ+PDLi0gB4rqpx2sHP3gFgYfXun7gBEs/+tf1XCONkCUEt+09UrWuVxmSq5M9mArAS3W1TJW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745848761; c=relaxed/simple;
	bh=Uq7kDaLQsiq2DVlLpdXKCNusHlTn4Pn7KrFEwPNnZ5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GCh1nf3dkxse9NMnKWrJX9DPzsO/ZEWSPGYl8SjB+V0oHzUfBncTqu29c2dbVyh7CBPFw390txHFeDPM9hda//3WmwNuIx69zaf0xDXNw5IJ0YEuz6eHf+wjvSaF6bMeEaO2i6s+3sF9ZLfNzDU+8p0qhesRRFhJ5MDUfEyqOJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UvJNgDk7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UvJNgDk7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745848757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XxlG6puHlddyEhXPEk0h0FDZBy95ZPaOFka0D29IyD0=;
	b=UvJNgDk726UiMjvQq/ifr416atkvlxk9QTs0trstNrJgpo1/bsaBOxim4fWpMEItu2y/Mc
	Y2Ax/LjzpfGLKIiMbKTGy/d44ASec2KI8BbW32zJ6dcwVRJBPhKgPEjUBTKWRtRVZxy9pR
	ET62oOdkykO+qcekDk0Fa/4zgNnRjCQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-Bps4Mvx_OlS-ok6J1Zj7Og-1; Mon, 28 Apr 2025 09:59:11 -0400
X-MC-Unique: Bps4Mvx_OlS-ok6J1Zj7Og-1
X-Mimecast-MFC-AGG-ID: Bps4Mvx_OlS-ok6J1Zj7Og_1745848750
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39d9243b1c2so1497164f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 06:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745848750; x=1746453550;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XxlG6puHlddyEhXPEk0h0FDZBy95ZPaOFka0D29IyD0=;
        b=wsQ57M/wOXxoFaHMlLGCpcrYZTPug6Q1Cn2T5xFwL9Bz45Cfs1n/MezEVsAA/CRTnC
         X/z8/ZJiltTqxTzuG4UaOPcJvu6oomATBxjRvwqC16cMfKjO2Xecd9xVO5n1OOBCW7lo
         oQJMozp/Fqe7BoQZ3WTkuU4U8jUt4Mj+9+Ddcbnd+AnRexwkuKwwrWhCk3ugFAGGTTMa
         Re9xzFRmTh+5yJIEtqXTThhfMLotwxWfRtGgj4EanX2NGA4zSk/nOkIpOFK6l+9gep2P
         SECULq1aqX91mO7P7zV0JQ4ohdX8tO+pqW4Rg56uLfQkkQauwH5a4PPmcJstq6x9qLdl
         ya2A==
X-Forwarded-Encrypted: i=1; AJvYcCUF6+ixM52+FH9lfc+GZlCbDB0ZXYHFJNRKYcD5pnOTaFYMoRFw8PfXfxKB7mcgLrheBxGiIOpO0P9npRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWR6Co3vtKvdo9pFEMnQha0lgmk9KZfwyN6WS3wwz0rnX5AzcD
	DmQWuq4ZS9urHB0YF4hBM87fIULBvf8WX6I/GPpy4Mnv0LI1OrAZuWBy2rPfkdJ3GrU2AHsPlTu
	w8WeT877XBUfGzvIMXktZlFADNiaL7dNEcNkIBn84U+HyUO8CNWCUVsQzvrm1rw==
X-Gm-Gg: ASbGncuxOAlRcRkyHYstFoNBXqXAtygpCmsxPX/38ozmAbOOS7dYtIrcq4bbefkyXfJ
	ev5D97QqQpOOxURqmCnt5PmJ+kutNyS+mdKccfOhHcqCDhcFVwhzDcxryX5giE3XhK3zHfQ45RE
	8+wWTk6i/hObU3W0MXdsQspT8u1QyV7z8QUDKyA34sjY5uiqXFl/FMepUrv9VU4ab4zAqWASbdc
	mtT5p4Sa5O7Sbh7pXk4eeQnDTLwjOzYTCd+NEYk3J4Q8+BFP13TWYSLXFQ8XiPLh88lDV6xOjNu
	o0V381w3uhLr1Mg0ZMG1b21cSvfQv3fIwjCJTkLHnFShIlnniNRcMkROjPDLe7oU4+5BYBQdgAO
	yyKDecN9tahKFDZ8Hy7XJdYFGEy61ePpcQ9s8ehM=
X-Received: by 2002:a5d:64e3:0:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3a07ab8c44cmr7296439f8f.52.1745848750139;
        Mon, 28 Apr 2025 06:59:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGc4EgiPLN0E8wkd8kmozObQHNGClSAizw2DP7oZtiM0G6tDkJn+fCD8h1dQkAsLcgb1C1V0Q==
X-Received: by 2002:a5d:64e3:0:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3a07ab8c44cmr7296409f8f.52.1745848749740;
        Mon, 28 Apr 2025 06:59:09 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f32:c200:9add:4a7a:46aa:f740? (p200300d82f32c2009add4a7a46aaf740.dip0.t-ipconnect.de. [2003:d8:2f32:c200:9add:4a7a:46aa:f740])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca42cdsm11068682f8f.22.2025.04.28.06.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 06:59:09 -0700 (PDT)
Message-ID: <f34bf704-6eb1-4591-ad0e-93641a2f1ad4@redhat.com>
Date: Mon, 28 Apr 2025 15:59:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: remove useless code
To: Barry Song <21cnbao@gmail.com>
Cc: Feng Lee <379943137@qq.com>, akpm@linux-foundation.org,
 ryan.roberts@arm.com, libang.li@antgroup.com, peterx@redhat.com,
 maobibo@loongson.cn, lance.yang@linux.dev, anshuman.khandual@arm.com,
 trivial@kernel.org, linux-kernel@vger.kernel.org
References: <tencent_C263C0783702591C464F887E3D3C496E6B08@qq.com>
 <CAGsJ_4wWK6B8GSc=cxPGnPU0Jt_o0YB55yk4+VNOm_hY_iditA@mail.gmail.com>
 <d8228c02-b5c0-47cd-927f-9054d412c7ea@redhat.com>
 <CAGsJ_4zn158TQV7Nc+vK-kmu6S4kOiFSZyUO7aK9dhwhrEq2cw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAGsJ_4zn158TQV7Nc+vK-kmu6S4kOiFSZyUO7aK9dhwhrEq2cw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28.04.25 13:03, Barry Song wrote:
> On Mon, Apr 28, 2025 at 7:17 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 27.04.25 10:22, Barry Song wrote:
>>> On Sun, Apr 27, 2025 at 2:16 PM Feng Lee <379943137@qq.com> wrote:
>>>>
>>>> Remove unused conditional macros.
>>>>
>>>> Signed-off-by: Feng Lee <379943137@qq.com>
>>>> ---
>>>>    include/linux/pgtable.h | 2 --
>>>>    1 file changed, 2 deletions(-)
>>>>
>>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>>> index b50447ef1c92..47c5a54b7551 100644
>>>> --- a/include/linux/pgtable.h
>>>> +++ b/include/linux/pgtable.h
>>>> @@ -1164,9 +1164,7 @@ static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
>>>>    }
>>>>    #endif
>>>>
>>>> -#ifndef __HAVE_ARCH_PGD_OFFSET_GATE
>>>>    #define pgd_offset_gate(mm, addr)      pgd_offset(mm, addr)
>>>> -#endif
>>>
>>> Do you know who else had pgd_offset_gate() before except ia64?
>>>
>>> /* Look up a pgd entry in the gate area.  On IA-64, the gate-area
>>>      resides in the kernel-mapped segment, hence we use pgd_offset_k()
>>>      here.  */
>>> #define pgd_offset_gate(mm, addr) pgd_offset_k(addr)
>>>
>>> btw, do we still
>>> need pgd_offset_gate() given that nobody needs it now?
>>>
>>>      1   1168  include/linux/pgtable.h <<GLOBAL>>
>>>                #define pgd_offset_gate(mm, addr) pgd_offset(mm, addr)
>>>
>>>      2   1112  mm/gup.c <<get_gate_page>>
>>>                pgd = pgd_offset_gate(mm, address);
>>>
>>
>> Right, we should just remove pgd_offset_gate() completely in this patch
>> and simply make the single caller use pgd_offset().
> 
> Yes, exactly. The original patch doesn’t seem to be appropriate.
> 
>>
>> I think we can even do:
>>
>> diff --git a/mm/gup.c b/mm/gup.c
>> index 84461d384ae2b..05dd87ccce155 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -1106,10 +1106,7 @@ static int get_gate_page(struct mm_struct *mm,
>> unsigned long address,
>>           /* user gate pages are read-only */
>>           if (gup_flags & FOLL_WRITE)
>>                   return -EFAULT;
>> -       if (address > TASK_SIZE)
>> -               pgd = pgd_offset_k(address);
>> -       else
>> -               pgd = pgd_offset_gate(mm, address);
>> +       pgd = pgd_offset(address);
>>           if (pgd_none(*pgd))
>>                   return -EFAULT;
>>           p4d = p4d_offset(pgd, address);
>>
>> Unless I am missing something important :)
> 
> Technically, it appears to be correct. However, it seems that
> pgd_offset_k is primarily used to improve readability by
> distinguishing between kernel space and user space?

Yeah, but this is GUP ... ("user") ... looks like that check/handling 
was in there ever since git happened.

get_gate_vma() only exists on x86-64 and uml.

I wonder if that could ever actually reside > TASK_SIZE such that we 
would even need that.

But this whole gate stuff is confusing ... IIRC it's a single VMA shared 
by all processes, and not actually linked in the maple tree etc.

-- 
Cheers,

David / dhildenb

