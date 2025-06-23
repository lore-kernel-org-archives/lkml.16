Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C3A19CC11
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750707942; cv=none; b=Jy2CAt4OFx5V879FytD+/KHu+AgkYFp0iQQvu1CRZoxKsfoIPoR5WnDGODEng2rE8OLwA/r2J2AZm+08myLj0irjrNot7ZpvLza3KN4utiaX2vhujtkd0YEDfhiKnhIUjL5rHaorCvWOwtLfyx6IbrdyLgkgDnfC/29N86Qds7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750707942; c=relaxed/simple;
	bh=hPZmKW6+vJsA7TtKnE3YN1R0YMzwpReYtH1zA9o4w4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sOW56Z0kAMZPjdeK7Ei6Fpwso+ruCac4rJI7CpcTBv3Sl1sYjNzouglMP+659A2J6n0rzKb/sPN09QKy7ZIY410EyxwCE3MZAnEIbULXxBqY8qWs91nPg/R4nf4AGyydGcMotfMFGqQg/t/x6evFbRMMZV9uTIV3rg0c/d01mcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L4EicfJt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L4EicfJt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750707938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KfAsWxspOqODSDmpvWTvJK7exlbhCAdt9xq1Z3xeH4k=;
	b=L4EicfJtOkXa5Tx4LS07ynjN6Xj3c4wmATfHYDZiyl5p8a1IRtIzPY5OlIKeyHXEvG7dBe
	2ww5YxrWThTwtgNwF0n5rUVVB2JQS03hyPV/KZevDDhG6PzjgNsRxcYRbSlloIvfVV64L8
	VOSaxes/s0aFpxWNaEtKO0dLBy9q8Lk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-5W4GVj3gN2iZdJM3bch7GA-1; Mon, 23 Jun 2025 15:45:37 -0400
X-MC-Unique: 5W4GVj3gN2iZdJM3bch7GA-1
X-Mimecast-MFC-AGG-ID: 5W4GVj3gN2iZdJM3bch7GA_1750707936
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45320bfc18dso21124535e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:45:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750707936; x=1751312736;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KfAsWxspOqODSDmpvWTvJK7exlbhCAdt9xq1Z3xeH4k=;
        b=LZFvvMmsJzNlTe4u6KAFxuzaaAMmrKNAod97AtuIdc4Xzi8N3XH/PHE5SotgQjafCK
         OhoPN7NCAnfObRMc51u9oyhBHPiEIFm/cO2Mj1zm39I9Fogh8loAWR73LcBWhhoklTxC
         5zK5ggvdM2ltvMmAfwli3GaCxjCH4x1qpEEg1qfxmFkzagI19O3YdUBhrJMRut/r1/ry
         XmEI/tNata5LbBbGxCGAtsNrqFoHFCBHfXEf9DA2dO3XwTIzCiB/HBz87lRuE8aVabDE
         sYb+3j5bwDknVjqUJMktieUbbIca/EgHmv9A2W3s+1ZdCpVokk4Pzb7oQS4zyuogdEGr
         GStQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSfrmvG14NzRdaxtBHlZMv7vqi91XR7E9cy3+P4Uw8H8y4bEoGbwahPBnPGUYsKkcn4VDD8h7sdNOmCTg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvri//cXsR9V+0czJ9+7HPHx86klPKAFzXSniOpMFwAEpr7qi0
	1Sf7YH2tEhg08OAKphxVitQlLW8JNm5ynMjGfE1kyg4UlUDZwzSsK4M0AvsyQCC4soc/PrZMMO5
	2rcgZWKweQiQ2P3bXyaETXoOmYXLv7GNrWoQCx3zzh9Y2LXmB5mwOBzp/9//GNE+nNg==
X-Gm-Gg: ASbGncv3KY4Q70I40IXE77pIZY1gbzDzoGw6qc/PLt+2i0ndvYIsGq7wIZWWUeq5ly5
	K2xi/8fh+hVtnl8de8EO10cmkWKajKazvk134okqbXNCEozPGiRqoCql4D91YZQlhme0QognOtN
	XDNCFBIYSYAuxq1ANNUAAld6NKdOdCAiGPt7yZOpvTImEm7zKE+J3vZXu6ipmbMVbDGZ4lOhINZ
	+K6XooOYFxRXjPAuzLCGGWYSU7El+osxSO9bVP1hUi/J9gZBqidiFOeUs/8b9XNI3TkznbzY6Kr
	p3E6ebT3tXUoBlagi+uX03yJ+kvO/bT/izwZ83XB7uO+xrXEpv1Jdi1SxEQ1NrEzoPThJJ79otE
	f4E8Lotnkh5VFbPXeGi/Ad4jwPG4a2eZsFM8VQPhB14MA54Si7g==
X-Received: by 2002:a05:600c:4706:b0:450:d79d:3b16 with SMTP id 5b1f17b1804b1-4537b79c3d0mr8421025e9.14.1750707936087;
        Mon, 23 Jun 2025 12:45:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa279cniyU/ZXkqcvRtAk+4PjbOtzhupyr79W8J3nxetE/ZDNt5zv/yV18Bn2LF1GBHjcsFw==
X-Received: by 2002:a05:600c:4706:b0:450:d79d:3b16 with SMTP id 5b1f17b1804b1-4537b79c3d0mr8420885e9.14.1750707935749;
        Mon, 23 Jun 2025 12:45:35 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8e19sm153019115e9.21.2025.06.23.12.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 12:45:35 -0700 (PDT)
Message-ID: <4214d6d6-f8d5-43b3-a413-f576fdaf215d@redhat.com>
Date: Mon, 23 Jun 2025 21:45:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: move mask update out of the atomic context
To: Dev Jain <dev.jain@arm.com>, Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250623080440.3005693-1-agordeev@linux.ibm.com>
 <c11a4b2e-6895-43b7-9ff6-620793bf8551@arm.com>
 <aFkgTA+02bV6nldk@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <f5c7ed26-b034-4600-ba29-26761eb1eef5@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <f5c7ed26-b034-4600-ba29-26761eb1eef5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.06.25 12:09, Dev Jain wrote:
> 
> On 23/06/25 3:07 pm, Alexander Gordeev wrote:
>> On Mon, Jun 23, 2025 at 02:26:29PM +0530, Dev Jain wrote:
>>> On 23/06/25 1:34 pm, Alexander Gordeev wrote:
>>>> There is not need to modify page table synchronization mask
>>>> while apply_to_pte_range() holds user page tables spinlock.
>>> I don't get you, what is the problem with the current code?
>>> Are you just concerned about the duration of holding the
>>> lock?
>> Yes.
> 
> Doesn't really matter but still a correct change:

Let's ask the real questions: who checks PGTBL_PTE_MODIFIED?

I see

if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
	arch_sync_kernel_mappings(start, start + size);

And then

arch/arm/include/asm/page.h:#define ARCH_PAGE_TABLE_SYNC_MASK   PGTBL_PMD_MODIFIED
arch/x86/include/asm/pgtable-2level_types.h:#define ARCH_PAGE_TABLE_SYNC_MASK   PGTBL_PMD_MODIFIED
arch/x86/include/asm/pgtable-3level_types.h:#define ARCH_PAGE_TABLE_SYNC_MASK   PGTBL_PMD_MODIFIED


Which makes me wonder why we need PGTBL_PTE_MODIFIED at all? Is there some other check I am missing?

(same question regarding everything excepy PGTBL_PMD_MODIFIED, because that actually seems to be used)

-- 
Cheers,

David / dhildenb

