Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A643325A349
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758233; cv=none; b=FtfUp154Q7BjjzlG91/al7CKTX2OsgeoOqXNsxM8ygGSs+oxjhe7HophPVInNWAyZtxnZUF9xSBXF6VezQPQEp3LhxihalQFbvhqcpmg00NLLoIel7kOmL/scJ+Kp5pHGQ8O9LgV1VJaKrtH3mHKSEwnbrnru9OL4W7AFFQ+nc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758233; c=relaxed/simple;
	bh=y+lVCog8q6xqbcMrrBwIMZgIVzO1M4jftVOt6ZQsEoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/8grHgIkhLqvA6/+wD9wg11Rc4Q9kAs51X1qa/l6wCsWtUk7SQhTl17lCRQxBGG3V8C86tUZjqUyhka8yS1MyW+iFYMqYzfVOSQRvr97IrRfWbj/S+BpbH/m8sjbL4tKrYnCAKHt11JbMONf8dCIOCx8ITkJg/S2fNgm9FsHn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TX6YirGd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TX6YirGd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750758230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Wkz2HmRnrtAFPO13Q5j0a0RO64CPiFWvlD9dGHL1glU=;
	b=TX6YirGdSAAKbVcyqw66z9GbTa/roID49pEb/hzhl459UW6rK7xPFTlZq5hMgZDLMuaLmy
	k/IIRbHWE8lvtDgTb8GtuUltxwB/jzlpBXjsHA81hRTvFVaf/M9VoHhpDDK9TLw2Agaqke
	uuJnTkIwhhbK2jbRj0svFg5AIWybO7Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-v2X5MDhUMSmsJ_8HAY3n6A-1; Tue, 24 Jun 2025 05:40:09 -0400
X-MC-Unique: v2X5MDhUMSmsJ_8HAY3n6A-1
X-Mimecast-MFC-AGG-ID: v2X5MDhUMSmsJ_8HAY3n6A_1750758008
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451d5600a54so1915965e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750758008; x=1751362808;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wkz2HmRnrtAFPO13Q5j0a0RO64CPiFWvlD9dGHL1glU=;
        b=j485Sh3WBiZABlxS5nYtBAVXblzfueP8Ai9aiF9cWCJGaaRCRYxzN1fphMMagVMuNB
         hHKkjLBg/TC4S9sGIiv3/zTgHcKnX0dCEK+AET+YUSyje6QHyNATFcirawDeLNOH9IkM
         TYCNbxsR/YLiN6cu+WSTEUB5zzGwsp6byV3BI6Uqmih37uOo5ax1S6fzBC32hTq+qzKC
         Y9+DrWHFQ0Wr/cs1x7tWWDnMEFrSYu5O/Oy5X9hndcKFHYZnoLEu+q4ER0hXfkMvnh+o
         V1o2KWmofPjJFKXJpzlqf2DW3YrnYHOL5u98M1iAMQ1YEgmawd/tRpoEW8GcmYtkr4Kn
         n9lA==
X-Forwarded-Encrypted: i=1; AJvYcCWtB29Bzw+beLZKBBVzHUON+d5/ndH5SdVIjrpaH9k0qcfeCaClIJonJ2nA34hPmV9ICVsMowOXnq99pq4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz859gVNppblHz0+MIIdMKuE4phg0YKJaSKAEGwMMqq/qD9jHYN
	Gqn4yGzrv5quNerB/dSuW4JsF94RG6+LvJblorXpjK+VH5JmpUUJqdSb/LKAvAcy8RC0VM64koP
	Cl3CCGcWcFf9LJml974skfW25mb08zEbY4s5tJjs3cmraasm1l6Fu2qoeE/DNuDW0YQ==
X-Gm-Gg: ASbGncvXwCsy0JZoVqtLRhVqKGn/wYSri3vxGzlkAMPwqE8TP3OwRJoXX2GW9KP96RG
	YgMRhFXcllKOBbeEEJVxnSyHdER86wFOwvKxxrtDKwPzpiMvkUJwbGiJeuIcN/+5O/+RkO1GsWH
	Opw3o/oAQ0AZq99jQW2agCfXFr2z1CenvEgP35DZNgYF78UpN4OhsYl8pAFj0WciTSACEGbbaIW
	04AI+dwh87zr531GaQLjH3Ugw3WTE9QhipKbo4w0WzEwxZAcniasXBxVMQrXJp6lJjrF2LO7HAB
	EJtYwpbMBl5I1WCS0aYrrzCml73ugCxTXFI9iQ0kOM+VSOF8OBkkq+Y=
X-Received: by 2002:a05:600c:468b:b0:442:f98e:f37 with SMTP id 5b1f17b1804b1-453658ba2e3mr140094485e9.21.1750758007828;
        Tue, 24 Jun 2025 02:40:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJQC0liegHgcGebdfeGF2STlfVSp0cZcixQYIvtKZpGiiJJKAUUGgl09iG8B8dw+f4ZD8h6w==
X-Received: by 2002:a05:600c:468b:b0:442:f98e:f37 with SMTP id 5b1f17b1804b1-453658ba2e3mr140094245e9.21.1750758007399;
        Tue, 24 Jun 2025 02:40:07 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536470370fsm136043985e9.29.2025.06.24.02.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 02:40:06 -0700 (PDT)
Message-ID: <75717e4e-51d0-41a2-8463-45097fc3875b@redhat.com>
Date: Tue, 24 Jun 2025 11:40:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: move mask update out of the atomic context
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Dev Jain <dev.jain@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250623080440.3005693-1-agordeev@linux.ibm.com>
 <c11a4b2e-6895-43b7-9ff6-620793bf8551@arm.com>
 <aFkgTA+02bV6nldk@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <f5c7ed26-b034-4600-ba29-26761eb1eef5@arm.com>
 <4214d6d6-f8d5-43b3-a413-f576fdaf215d@redhat.com>
 <aFpxvQxgUEdO9jd/@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aFpxvQxgUEdO9jd/@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.06.25 11:37, Alexander Gordeev wrote:
> On Mon, Jun 23, 2025 at 09:45:34PM +0200, David Hildenbrand wrote:
> ...
>> Let's ask the real questions: who checks PGTBL_PTE_MODIFIED?
>>
>> I see
>>
>> if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
>> 	arch_sync_kernel_mappings(start, start + size);
>>
>> And then
>>
>> arch/arm/include/asm/page.h:#define ARCH_PAGE_TABLE_SYNC_MASK   PGTBL_PMD_MODIFIED
>> arch/x86/include/asm/pgtable-2level_types.h:#define ARCH_PAGE_TABLE_SYNC_MASK   PGTBL_PMD_MODIFIED
>> arch/x86/include/asm/pgtable-3level_types.h:#define ARCH_PAGE_TABLE_SYNC_MASK   PGTBL_PMD_MODIFIED
>>
>>
>> Which makes me wonder why we need PGTBL_PTE_MODIFIED at all? Is there some other check I am missing?
>>
>> (same question regarding everything excepy PGTBL_PMD_MODIFIED, because that actually seems to be used)
> 
> AFAICT it was thought as architecture-specific:
> 
> /*
>   * Architectures can set this mask to a combination of PGTBL_P?D_MODIFIED values
>   * and let generic vmalloc and ioremap code know when arch_sync_kernel_mappings()
>   * needs to be called.
>   */
> #ifndef ARCH_PAGE_TABLE_SYNC_MASK
> #define ARCH_PAGE_TABLE_SYNC_MASK 0
> #endif
> 
> Not sure if that needs to be addressed at all.

Okay, if there are no users of PGTBL_PTE_MODIFIED we could just ... 
remove it. Dead code.

-- 
Cheers,

David / dhildenb

