Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3753128314A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648696; cv=none; b=IOndwFUge+q9bKJYs54YUyU+VG5GZ8l/fOXMnY9fQmtma3QPiDEWz28j1RMoPPUKs3/rwMjJM7ML6yRXOj54v6i4ZZV/UmmF44EBRr49Oml4+JcJbIjFnTtIiY69oEGHHrIKYZL+aluZfpI9UIA01CDAcd4ipPpW8sN7bdaquOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648696; c=relaxed/simple;
	bh=rA/S2vtdlnI67CFMfJLVmcL3HFuogZGuoo8e74T8bNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qAwt1sMQP6id4yv90R3fBIRdwBzS2hBpvZ8nMkJ0jp6dsYU7786vDhrqKBQoyEbVGUinA+i4w+yEF+EzgHCls869U4khWZwW8ZyynJzKecVvlOFEvyx2+j7+JU84K8xbaugAapjUdBc4hMrP2KJzMJ83u5IHXEeulBbF896F1EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E8vyQhmj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E8vyQhmj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749648694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LEkyC126nnamiGOnit+T/Tzx8cqMJmlYY+QH4KRlOVY=;
	b=E8vyQhmjbM12MDWrFdDQSfQvnZJzHcECmVAeJUJOIFvulCfoaUv3uqaGHd30BV1nZyx1Ud
	xXQul6BMmmXkxmw5PsH7f4sA23hYEwiM1/ykyHuhBOhmRVqI1GmpD8J8+laqmrxbpSGnln
	foarEvGkCGNSjfIDLrAVPWLDGfmnJ0o=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-1i5oWH6_Nku120kTd9Bbgg-1; Wed, 11 Jun 2025 09:31:32 -0400
X-MC-Unique: 1i5oWH6_Nku120kTd9Bbgg-1
X-Mimecast-MFC-AGG-ID: 1i5oWH6_Nku120kTd9Bbgg_1749648691
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a6e9182fbaso16684741cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749648691; x=1750253491;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LEkyC126nnamiGOnit+T/Tzx8cqMJmlYY+QH4KRlOVY=;
        b=w+V42mfWeZCeYmvtHg6byy/wG8Ca/WQ3BUccZmBGADuvWT+PhN0lb+wDwSZft3Aqf1
         YPjkp3AibwpL/Iuwk1qwUK7LdyhDU7snd5e3riLqN1HZGNd5MR/IPNUXLPhSY7Uqwa1d
         Cy8CorS32V9zoR+NV4eVEjae/ome0Hujgupj/BNjVr1wiCoH2lPS0PMW6cxfwwa1QKKt
         7pyvvoxibI/sM2qP1aTfnA7nxkfxOZVi+6eIZVHlXk/T5ZGaGdHKPkjVxyASVZ6GdbZa
         dlot15oMf0aPC8mja9cjICZ+L73HX3KA5QtWJTr7Vf+cistUSMdvglYt2sBueIPDsFO3
         GUNg==
X-Forwarded-Encrypted: i=1; AJvYcCUmxgq8vHzhfhhK7a1mxVF+n61ivSgwa1Rqf9iSkg4Fu09JvjYPpFTG9IJ+lY8HgDErGJDENoudrk3M6tM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDGvSvlHGYVBQ4oYf3dx0DS6D63+CnjXT5Ya2+AYb8+1X4RL3a
	RyAXbFh59R/ub8Xtm+D/l7TeN87FDaGStsh3pF5eGZOQCfgnk4bRuQQ9Ej08zcyS3r2FWVZonq7
	UbaTu0HaSsyyrom0tWet42as4nFBBlWbQKzSEqENNW+FnQGq+82QrKPIUus4zO6S45Q==
X-Gm-Gg: ASbGnctWglsMFyWam4eOUnEvd/eNSAHe1hup3RywsRFvOaKj/y8Dx+Rah5gPrKUA8/T
	ee9DD7qoC+5F1LMvufH2n4MNnUnT6oZztkBFDG7bCYiOYBK3KniXHEzER86LELw6BoXkO8usZMZ
	Dw0MMryLOInYuFajTyOdza202D58grwTXzj8ce1oxZRbfbZnJtMQiqZXOByu8buuCI8byMDnFO6
	SHnKdcD6TyWq1HRhJAYnWnqGZ8XimYs80rAe9lY3wWxpa2/2W1Ep/vterzavfw+sE2Xql3PW4Tg
	o9zYMcOR0iPC6GiEZUrgkCgHpPDFKf1qtI2Add/L0bYP
X-Received: by 2002:a05:622a:400c:b0:4a5:8387:8b8d with SMTP id d75a77b69052e-4a713c8cda0mr58422461cf.21.1749648691407;
        Wed, 11 Jun 2025 06:31:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcWcUNhxwdVjyDdqrdT3YUHh0qOifpmVI+UN68rcwEig23gtiiO+VGvBJ4PvocRgw6iK6kgw==
X-Received: by 2002:a05:622a:400c:b0:4a5:8387:8b8d with SMTP id d75a77b69052e-4a713c8cda0mr58421651cf.21.1749648690697;
        Wed, 11 Jun 2025 06:31:30 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a61116b81asm89089271cf.21.2025.06.11.06.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 06:31:30 -0700 (PDT)
Message-ID: <13813741-d969-45a6-bd8e-163d71078b00@redhat.com>
Date: Wed, 11 Jun 2025 15:31:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] mm: Call pointers to ptes as ptep
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, peterx@redhat.com, ryan.roberts@arm.com,
 mingo@kernel.org, libang.li@antgroup.com, maobibo@loongson.cn,
 zhengqi.arch@bytedance.com, baohua@kernel.org, anshuman.khandual@arm.com,
 willy@infradead.org, ioworker0@gmail.com, yang@os.amperecomputing.com,
 baolin.wang@linux.alibaba.com, ziy@nvidia.com, hughd@google.com
References: <20250610035043.75448-1-dev.jain@arm.com>
 <20250610035043.75448-2-dev.jain@arm.com>
 <9cbaf817-7a33-42d8-ba39-fa1b448266f6@redhat.com>
 <574a1c6f-f542-408e-8d26-728749892b1c@arm.com>
 <5d1a561b-cf29-4527-b695-90ae9e5bd696@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <5d1a561b-cf29-4527-b695-90ae9e5bd696@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11.06.25 15:29, Lorenzo Stoakes wrote:
> On Wed, Jun 11, 2025 at 06:55:28PM +0530, Dev Jain wrote:
>>
>> On 11/06/25 6:53 pm, David Hildenbrand wrote:
>>> On 10.06.25 05:50, Dev Jain wrote:
>>>> Avoid confusion between pte_t* and pte_t data types by suffixing pointer
>>>> type variables with p. No functional change.
>>>>
>>>> Reviewed-by: Barry Song <baohua@kernel.org>
>>>> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>>> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>    mm/mremap.c | 31 ++++++++++++++++---------------
>>>>    1 file changed, 16 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/mm/mremap.c b/mm/mremap.c
>>>> index 60f6b8d0d5f0..180b12225368 100644
>>>> --- a/mm/mremap.c
>>>> +++ b/mm/mremap.c
>>>> @@ -176,7 +176,8 @@ static int move_ptes(struct
>>>> pagetable_move_control *pmc,
>>>>        struct vm_area_struct *vma = pmc->old;
>>>>        bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>>>>        struct mm_struct *mm = vma->vm_mm;
>>>> -    pte_t *old_pte, *new_pte, pte;
>>>> +    pte_t *old_ptep, *new_ptep;
>>>> +    pte_t pte;
>>>
>>> Could have left that on the same line ...
>>
>> AFAIR Lorenzo had insisted on moving that to a new line.
> 
> Yeah, not a fan of having pointer and non-pointer types declared on same line.
Apparently I am for such simple things.

The joy of not having a common coding style. :)

Anyhow, I don't really care, just something I noticed ...

-- 
Cheers,

David / dhildenb

