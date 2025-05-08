Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4F921D3E3
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 08:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746694588; cv=none; b=atVWxphLs1Cy1rPCDKzQAbv/uB5XZMCw0VYH8go+rG67MEbxkzWOlZlkb5fNurhtG2tI5smkI5HYSAZMfvKUCFSVZjBbWlJ6ZPbJPxRxIS98w7HG4byxUlUyJOe/4d9gvLPu25n6ycE1GVa5HxXjA1uWdgYMeTslPrcF5EufSbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746694588; c=relaxed/simple;
	bh=ACs/sfIDpb6Unk9J4Os4KEZaN0et+NzQfGKKO5KpHSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ow9zDbVvwuOtNh5IqvySqocl1fqSDmahlF3YirzsC8YZdDf02auowBcRrfaVNr/X56G1bLPLdOQ+3x0odr5uJHgcw4iMxaCMnpsZOTNXSd9gbtoPNO9VvZYh/XiCxj+ZTGUp/R/rok0VivC+jEEegxVUdE8Hp6l6YaJepX+tvhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dgOLVq9W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dgOLVq9W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746694586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aOjfC+LN17usEmwgstDmlQ8TxIaIPGoVKa8pXSXr8JI=;
	b=dgOLVq9WJvB+mLSpXl77EVsxy7g/xn+N+LSEUiuy2gPiKIqkRW4ecQs9hsux6mcPZkUuK7
	Y22PaSb8uMdbXf/swYeRYcoU5Xv9jvCPVHwnLr+idRIHq0mepfAWeBKNOpH8PS6Mv8mnjG
	Zp5Vz8RnnExX9WIPEtP5m8Hv5Ee89Q4=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-1SHpq_9sOWm3yxAUYqMLKg-1; Thu, 08 May 2025 04:56:24 -0400
X-MC-Unique: 1SHpq_9sOWm3yxAUYqMLKg-1
X-Mimecast-MFC-AGG-ID: 1SHpq_9sOWm3yxAUYqMLKg_1746694583
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22e7f041997so12556345ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 01:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746694583; x=1747299383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aOjfC+LN17usEmwgstDmlQ8TxIaIPGoVKa8pXSXr8JI=;
        b=o0+6NIOybS5bbJr/3Ij2KXPQXfcey9r5peJ6sr/vLFUPT8DKLw9jsYuBIE7b1HZ6wc
         vFHtwtjduwKsStIc0iwbchg+lR2NZ97WBdXRKSFJ/VoOBgliuCosHdxYKO+mBUi/zayM
         Pq7s2WdCcB9ASZcSIA2dEFnbXqTsFN3D/hcxZKQEMZ78NacIn/anMJPT4e1axzJWTTeX
         KIvhJ/Ot6tjib+pI2Q0XiuNDHaLf5DBR8N3d1fD+qzJnsdSe3HTI8eZK1XSvCt4Zu8xa
         rYhz+iKcFLGMBFVy8/d2qEOBXyK3WcD1jptfn99wKYYlKRTC4T0+jJSpj9oyr/pYDNS3
         DE0w==
X-Gm-Message-State: AOJu0YxpGQcZKYTFEoILWYoLA8yWP0YEbVVpArIEwtazuvcBxhUkQS84
	BLg2cUZEMLhRzsSyGNOuC5D3xqLUKOJYevws/49ZYawiwQK8LcgIF1nImBBixP2J0LFvdEp/uLg
	nB7IMp9W/6fqgi/yIJ5WC1je67kBpgUjGgQ0CgLAhwC7jtLgfF9TxBK/jvtHRhw==
X-Gm-Gg: ASbGncswvEMh2NZhPlFHpFYpD3qLvHjutca4sb9dUPxHo31zrqOft7XS/UjC6D2VHze
	ZvV3bzMw2D2IutaHO76xCiorPQ4bbcBoovhPWMtKl1IjKt9sZJN/FpEmVmRO5JvjAZXe3MrnBz3
	AGGu6P2qEokUIHnYBjW5jiSotyn11mpsWlqImPGBn6J2TVT/uzkYrdzCzXnoZX1qmsJT1exKPHq
	w3PGuc4ZgoLuMoepbWtEbkq3MYS0QbBSjfQVTgQ7HLU0D4m9CokuUSvCECSy+Vl24zzNNgQcA5R
	XpKpFNSH3Qk5
X-Received: by 2002:a17:903:1744:b0:22f:a921:db4a with SMTP id d9443c01a7336-22fa921db82mr16679305ad.45.1746694583382;
        Thu, 08 May 2025 01:56:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHir1BGYfGeGr2WBHGYd/bWypOVZuEVrtE9+DRdnIGOsBpFbbagNrFbeU80omop6cm+laFLtg==
X-Received: by 2002:a17:903:1744:b0:22f:a921:db4a with SMTP id d9443c01a7336-22fa921db82mr16679075ad.45.1746694583097;
        Thu, 08 May 2025 01:56:23 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15232718sm107628285ad.230.2025.05.08.01.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 01:56:22 -0700 (PDT)
Message-ID: <fdeff5e5-daab-4967-a6bf-f71efd78507c@redhat.com>
Date: Thu, 8 May 2025 18:56:17 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Drop duplicate check in pmd_trans_huge()
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 ryan.roberts@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 yangyicong@hisilicon.com, shan.gavin@gmail.com
References: <20250508035142.189726-1-gshan@redhat.com>
 <4e5941f8-7e61-4a63-a669-bee1601093a6@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <4e5941f8-7e61-4a63-a669-bee1601093a6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/25 3:44 PM, Anshuman Khandual wrote:
> On 5/8/25 09:21, Gavin Shan wrote:
>> pmd_val(pmd) is inclusive to pmd_present(pmd) since the PMD entry
>> value isn't zero when pmd_present() returns true. Just drop the
>> duplicate check done by pmd_val(pmd).
> 
> Agreed, pmd_val() is redundant here because a positive pmd_present()
> also ensures a positive pmd_val().
> 
> #define pmd_present(pmd) pte_present(pmd_pte(pmd))
> #define pte_present(pte) (pte_valid(pte) || pte_present_invalid(pte))
> 
> #define pte_valid(pte)           (!!(pte_val(pte) & PTE_VALID))
> #define pte_present_invalid(pte) ((pte_val(pte) & (PTE_VALID |
> 				  PTE_PRESENT_INVALID)) == PTE_PRESENT_INVALID)
> 
> pte_present() cannot return positive here unless either of the flags
> PTE_VALID or PTE_PRESENT_INVALID is set which implies pte_val() would
> also return positive.
> 
> Probably it would be better to add the above details in the commit
> message here as well.
> 

Thanks, I've squashed those details to v2, which was just posted.

> The earlier commit skipped dropping pmd_val() in order to keep then
> proposed change confined to just adding new pmd_table() check, even
> though pmd_val() redundancy was evident as well which should have
> been dropped there after.
> 
> d1770e909898 ("arm64/mm: Check pmd_table() in pmd_trans_huge()")
> 

Yes, agreed.

>>
>> No functional changes intended.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>> Found this by code inspection
>> ---
>>   arch/arm64/include/asm/pgtable.h | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index d3b538be1500..2599b9b8666f 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -739,8 +739,7 @@ static inline int pmd_trans_huge(pmd_t pmd)
>>   	 * If pmd is present-invalid, pmd_table() won't detect it
>>   	 * as a table, so force the valid bit for the comparison.
>>   	 */
>> -	return pmd_val(pmd) && pmd_present(pmd) &&
>> -	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
>> +	return pmd_present(pmd) && !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
>>   }
>>   #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> 

Thanks,
Gavin

