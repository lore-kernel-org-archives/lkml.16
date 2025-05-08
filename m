Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFAB1F37D3
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 11:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746703146; cv=none; b=SrjalJG3elyB2e2m9z46KnOfjOQGpVSV61AelgAwJs8BRdMGgvz31qFXu1ADmy4uYcC6jDiGoHGDPCnq+zJXa+eZA4jFYFsGIqH7ayh7WCsyMIobl16pTMuv9lzn9yem28Di+cGkhi1T2Cvkzs55WoL9Z+FyJpfYxBlrhGrQngQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746703146; c=relaxed/simple;
	bh=cMoVMweP81TAz1bQup8muiEJDNU55+E7w2a/Er37yp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sAMC7hMQqkUf3IxQa9QOzraMdVL+iVwiCERZ7kyMjgJnKeRcGdRwKyLIvjnzLtaeOEbWxXX5dgQxNMcvcZqQ+lE1lA3YE7Rgbnx6dG89pN/sI1407tkhqh/CKvut+uxpO/csm/62ljp2qWnemQ0/0J/Ote801KVP7C6F8vL32iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZcobzE2/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZcobzE2/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746703143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uC2wfcZ+7znS/AJhcy/t0D4M8EVdcWLk8ajPU4mVK2Q=;
	b=ZcobzE2/urokKnKvgcV6s/DuiiB9tB1/bLdZzVWeegNL5EAxCw9j3GwJLQ3h+ke7+XGIzG
	yrCAuVpEigypwHBCRvmt0Mm00f0A13ij95Vpdj9/UxI/7qCu+/W+qhCQnPYCPVGtdp7ghq
	BZWoZkCBxAOo8c2HQr5jbGyeBh/56Yw=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-KKKwPHbJONitATEuz2DSHw-1; Thu, 08 May 2025 07:19:02 -0400
X-MC-Unique: KKKwPHbJONitATEuz2DSHw-1
X-Mimecast-MFC-AGG-ID: KKKwPHbJONitATEuz2DSHw_1746703141
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b0e0c573531so589146a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 04:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746703141; x=1747307941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uC2wfcZ+7znS/AJhcy/t0D4M8EVdcWLk8ajPU4mVK2Q=;
        b=cKtLXiWU2/v+1+HzTXbGKC71g7fNzbt10/TX71X/hBCJ7B05f4hq0aVoRD03B/ai8l
         hdnBnnNwSiTNLgNweiz+joi7XOERIakzG4j6af3EBK/5q0WE07Hyqba+72GyKVs2SFrb
         b1vwYlUpz/a34ea/UezjTulMqZ1qZl4x1dCyQhaG3FFqRvYUue8OTKkfStUMu+AcwWUx
         mNX3PTI4U0T9eAzUwPz3w/Fca8frwURdqAxez1BbsTw1wVDIvvGt784Rrm0xIWkWdhlw
         H4QKXG1h7dcEDKrDQwtpSzddF6O9mBUf+mnu754Hjte0qoeaLSfoFijNgCYTyf03P10P
         MxVw==
X-Gm-Message-State: AOJu0YyFwOnRL9AXHHR/q0XXV19knks8BfE6XdNPEQu/fJMcSm9yMTvn
	c2y8kuPYL1wh8F31idqV4aVio1cwNnWqiSFhTQaUGMYUDkzYPiDvpR9OTBQppDCxf6EnnSqKB6U
	LqfNqedj305btyDdpbUlyV2tbaXppaSHelWqspfcV0IzvEAlViQLyXPgu9OocEw==
X-Gm-Gg: ASbGnctjKBRDce/bgdgaOd/4uHYWyBKtnWZLbS22AL5mwiZfq+2YIHYG40ex1uMqpPo
	ASVUrI1+cZ4Do6mSu+g8X6gJLQDq+ph1jMHhq/qjj5Y3F9EUVvFq3/QXP12gAT4Jp/9U+lEint8
	H0pJQb5GM8frsw6p5YXA+Fr/q1SaidLWRbB+pr8ohFmaHvYg3UWjg4RM8yWdH6di2KlZ3rKGi5n
	kHAKIw6H/pCoWS/pEVfHyl93nHD+M0IGArydpDzpCZSykva4RGyrlD0MOOkOmNBX4gO5iRHAQq6
	zt8aSsEiqZ7d
X-Received: by 2002:a17:90b:4c8d:b0:2ff:4e90:3c55 with SMTP id 98e67ed59e1d1-30aac21f4f9mr10874127a91.27.1746703141228;
        Thu, 08 May 2025 04:19:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlcZE8WPSp+dD4cbUIoc4dB042EO4sEN2NlL/2/CjCN2EjuR89jLkJrVSshMTD8QHhwYCLTw==
X-Received: by 2002:a17:90b:4c8d:b0:2ff:4e90:3c55 with SMTP id 98e67ed59e1d1-30aac21f4f9mr10874083a91.27.1746703140804;
        Thu, 08 May 2025 04:19:00 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522fb26sm109771185ad.247.2025.05.08.04.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 04:19:00 -0700 (PDT)
Message-ID: <8c4c158d-8cbc-479e-8561-de9ce961c9cd@redhat.com>
Date: Thu, 8 May 2025 21:18:55 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: mm: Drop redundant check in pmd_trans_huge()
To: Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 anshuman.khandual@arm.com, dev.jain@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, yangyicong@hisilicon.com, shan.gavin@gmail.com
References: <20250508085251.204282-1-gshan@redhat.com>
 <0c6455f1-5a7b-4ae3-b7f8-7f163b6abc9a@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <0c6455f1-5a7b-4ae3-b7f8-7f163b6abc9a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/25 7:22 PM, Ryan Roberts wrote:
> On 08/05/2025 09:52, Gavin Shan wrote:
>> pmd_val(pmd) is redundant because a positive pmd_present(pmd) ensures
>> a positive pmd_val(pmd) according to their definitions like below.
>>
>>    #define pmd_val(x)       ((x).pmd)
>>    #define pmd_present(pmd) pte_present(pmd_pte(pmd))
>>    #define pte_present(pte) (pte_valid(pte) || pte_present_invalid(pte))
>>    #define pte_valid(pte)   (!!(pte_val(pte) & PTE_VALID))
>>    #define pte_present_invalid(pte) \
>>            ((pte_val(pte) & (PTE_VALID | PTE_PRESENT_INVALID)) == PTE_PRESENT_INVALID)
>>
>> pte_present() can't be positive unless either of the flag PTE_VALID or
>> PTE_PRESENT_INVALID is set. In this case, pmd_val(pmd) should be positive
>> either.
>>
>> So lets drop the redundant check pmd_val(pmd) and no functional changes
>> intended.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Dev Jain <dev.jain@arm.com>
>> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> v1: https://lore.kernel.org/linux-arm-kernel/4e5941f8-7e61-4a63-a669-bee1601093a6@arm.com/T/#u
>> v2: Improved commit log per Anshuman
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
> 
> I agree the cleanup is useful and correct, so:
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> 

Thanks.

> 
> But personally I find it maddening that we have:
> 
> #define pmd_table(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) == \
> 				 PMD_TYPE_TABLE)
> #define pmd_sect(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) == \
> 				 PMD_TYPE_SECT)
> #define pmd_leaf(pmd)		(pmd_present(pmd) && !pmd_table(pmd))
> 
> static inline int pmd_trans_huge(pmd_t pmd)
> {
> 	/*
> 	 * If pmd is present-invalid, pmd_table() won't detect it
> 	 * as a table, so force the valid bit for the comparison.
> 	 */
> 	return pmd_val(pmd) && pmd_present(pmd) &&
> 	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
> }
> 
> Which all do basically the same thing, but with some very subtle differences.
> 
> Surely we should really only need 2 basic functions; is it a table? is it a
> leaf? Then pmd_sect() and pmd_trans_huge() should just be aliases of pmd_leaf().
> 
> I *think* pmd_sect() and pmd_leaf() are really just 2 different ways of
> expressing the same thing? Which is "Is this a *VALID* leaf?"
> 
> And pmd_trans_huge() is asking "Is this either a *VALID* or *PRESENT_INVALID* leaf?"
> 
> I'm not sure if we can relax pmd_sect()/pmd_leaf() to give the same semantics as
> pmd_trans_huge()? I would guess we can. In which case it would be nice to clean
> this all up to a single implementation and make the others wrappers. Or better
> yet, fix the callers to consistently use pmd_leaf(). And do the same for pud.
> 

Right, pmd_trans_huge() is the superset of pmd_sect() and pmd_leaf(). The later
two macros are equivalent in logic. I had a quick check on the sites where
pmd_sect() and pmd_leaf() are called, there seems no PRESENT_INVALID case. So
I think it would be safe to sync up pmd_leaf() to pmd_trans_huges(), and then
make the later one as an alias to pmd_leaf(). Besides, pmd_sect() needs to be
replaced by pmd_leaf() as you're suggesting.

Hopefully, I don't miss anything before I'm going to prepare the patches, which
will be stacked up on current one. I'm understanding you want something (for
PMD) like below.

----

static inline int pmd_leaf(pmd_t pmd)
{
     /*
      * If pmd is present-invalid, pmd_table() won't detect it
      * as a table, so force the valid bit for the comparison.
      */
     return pmd_present(pmd) && !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
}

#ifdef CONFIG_TRANSPARENT_HUGEPAGE
#define pmd_trans_huge(pmd)	pmd_leaf(pmd)
#endif

With above changes, replace pmd_sect() with pmd_leaf() so that pmd_sect() can be
completely dropped.

Thanks,
Gavin


