Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAAB1EFFA6
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750766611; cv=none; b=PbyBgqr0T2bWtKnFF5mbjy6TJqlY1cpDlgrm6XT6utowvzF74Ta+y2EOqMRYBIZDMRhpfFW0BdD/Qcq+TIUc8On8tTCgFq/R+yluG9p352PPtTE9xqLka2rVNQEfISqECBH1Rgi8Ch0ddv88QPlnaGGZdhKJ4X7DS0501IIj7eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750766611; c=relaxed/simple;
	bh=HdoY+RmbEDtQjReHkWSlQ3raWKTQMJ/OffJrwT+8wd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cO0XfiS3wUhEEwqiZrod7THEx6hqrlwDlJ7PO+eUVSAwD/BAD3+ij5baY+RCh97gm/xoj7cGQVTG7IdlLKsZ67y0h90pEYhL/I3UdGm9pXxnJCWG6EaRzZfM8n3qvCxWnWDHBEeW+1o79VGhjmq2NKhwCsq1yDkdSkLWfJ5EjN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UI3icf1p; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UI3icf1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750766608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qTBqrrqyxhDTcxXiq5yGhk+eniFSu5znG3LKEqns988=;
	b=UI3icf1pi9b7iNPNEsX4zYPPo16Z6TE4qp1KnSe6flXPUDIUPiD76FORZHUT5/X9BkpDRZ
	mb+LId02Qqi9eYo82V1MHr8WTn/Edgje35P2Fv/tPMv2w7JFoLeMvhLn8cA4z/XZWhBt7f
	8cdyYAKZwP6SsuFhHfgd66r9ruTOB8M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-cP2B5_FBPEeaHfnEDkQgqQ-1; Tue, 24 Jun 2025 08:03:27 -0400
X-MC-Unique: cP2B5_FBPEeaHfnEDkQgqQ-1
X-Mimecast-MFC-AGG-ID: cP2B5_FBPEeaHfnEDkQgqQ_1750766606
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a6d1394b07so221587f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750766606; x=1751371406;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qTBqrrqyxhDTcxXiq5yGhk+eniFSu5znG3LKEqns988=;
        b=asvy6uQ9uzpFDl2Ji+mtqXgEd+2Qz5pWyJsao/0Vc9fhm9k6mWFZGrIc+WdGWfSArW
         ZdS/RtqrjDX0Xo+hGtLoXhw0Qn1IErDGarT+SpN1InSabh6iiyMcxzfdVnGMUktcYBll
         t0x1IkwAmMe1PI6Ee8U3cYDM+w0/NhmHI+MtG2caO0uMtqrlUbBzd5YZL7/poLG/Sf08
         azLBs8lGLZeNo4LiyAqJ0NxnopGt5a/lEDhuG3wTNt0aVvxjfSOvkawL40U+dCg2KRoI
         jHKTHr+9wyMSB+6YC9GmPgdmF3XGMSJKYlibRs6ZPnmj2cw9kg4GUWcFc8cjvk7add+N
         xO3A==
X-Forwarded-Encrypted: i=1; AJvYcCUI2sknSKxUCcYLM38uXig8RBnYnD8TbbVEvn6firvg3b3zAlLhdchRPSvIuFcVM5abIqisj9IDtQ8be2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjAgJ4BpiAHplh+wqfVJ0tfDl4HV2TROM7Uvoqhq0pLO3oxHGM
	29PU51Q5PpTTJErW4gIcDYMMBd5VlE5Sh+kQb8EDd/MVwbq6407YACFnASFsw12k7B4bqPsbB/C
	ppShS7lhxZN6P6EOOJv2T6jBsWXn0MbyTO2saZnX3rDcOHPZ+UATrncGvfND9OrS3FA==
X-Gm-Gg: ASbGncueHDgS76UDbLOYHnTp++DmQlfmcvadyHCUzMJFi0z/DnhdlbLL/3efZhU5dMR
	cc6ALTpgi3+MZp9/bWp+TVAEP4/JiC8+JI3rv7fOuvxYMDyTM5Zk4q1TZdYE6w65QnuV6im2Ph9
	F7VwXYnFMJOJ7LhilrH79qH2qEryRnPXnHB8iiAhTyzAz88BBXSiEOYpFg3crmb5iu/s7KYGKsp
	eKn34JNdijaRJ6x5yyPfPdaALwhmHZpoaTXikBmFQQ+P8klY6f/5L/Nv0nS9Q8xmCA0lyTpL1Rj
	eh0giCf+qUUYn2mRWZx55cd/kNpa0zXfp2N0GnkLJ5T1ZPNos0dIeLY=
X-Received: by 2002:a05:6000:481e:b0:3a4:fb33:85ce with SMTP id ffacd0b85a97d-3a6d130cb6cmr13334407f8f.46.1750766605825;
        Tue, 24 Jun 2025 05:03:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLws0/O6obmzOTMmCsQlWOFXhNTtmgGrcIbk21B+gcIpc82zOoFZXl8kHVZVUkNIGl4AYWhA==
X-Received: by 2002:a05:6000:481e:b0:3a4:fb33:85ce with SMTP id ffacd0b85a97d-3a6d130cb6cmr13334357f8f.46.1750766605324;
        Tue, 24 Jun 2025 05:03:25 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8068fd0sm1842871f8f.38.2025.06.24.05.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 05:03:24 -0700 (PDT)
Message-ID: <d4b70a87-336a-4bf2-bed9-39e00371d0e1@redhat.com>
Date: Tue, 24 Jun 2025 14:03:23 +0200
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
 <75717e4e-51d0-41a2-8463-45097fc3875b@redhat.com>
 <aFqTQtK8yCTlmEfx@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aFqTQtK8yCTlmEfx@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.06.25 14:00, Alexander Gordeev wrote:
> On Tue, Jun 24, 2025 at 11:40:05AM +0200, David Hildenbrand wrote:
>> On 24.06.25 11:37, Alexander Gordeev wrote:
>>> On Mon, Jun 23, 2025 at 09:45:34PM +0200, David Hildenbrand wrote:
>>> ...
>>>> Let's ask the real questions: who checks PGTBL_PTE_MODIFIED?
>>>>
>>>> I see
>>>>
>>>> if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
>>>> 	arch_sync_kernel_mappings(start, start + size);
>>>>
>>>> And then
>>>>
>>>> arch/arm/include/asm/page.h:#define ARCH_PAGE_TABLE_SYNC_MASK   PGTBL_PMD_MODIFIED
>>>> arch/x86/include/asm/pgtable-2level_types.h:#define ARCH_PAGE_TABLE_SYNC_MASK   PGTBL_PMD_MODIFIED
>>>> arch/x86/include/asm/pgtable-3level_types.h:#define ARCH_PAGE_TABLE_SYNC_MASK   PGTBL_PMD_MODIFIED
>>>>
>>>>
>>>> Which makes me wonder why we need PGTBL_PTE_MODIFIED at all? Is there some other check I am missing?
>>>>
>>>> (same question regarding everything excepy PGTBL_PMD_MODIFIED, because that actually seems to be used)
>>>
>>> AFAICT it was thought as architecture-specific:
>>>
>>> /*
>>>    * Architectures can set this mask to a combination of PGTBL_P?D_MODIFIED values
>>>    * and let generic vmalloc and ioremap code know when arch_sync_kernel_mappings()
>>>    * needs to be called.
>>>    */
>>> #ifndef ARCH_PAGE_TABLE_SYNC_MASK
>>> #define ARCH_PAGE_TABLE_SYNC_MASK 0
>>> #endif
>>>
>>> Not sure if that needs to be addressed at all.
>>
>> Okay, if there are no users of PGTBL_PTE_MODIFIED we could just ... remove
>> it. Dead code.
> 
> As you noticed, PGTBL_PMD_MODIFIED bit is used only. Thus, all other
> bits would have to be removed as well, not just PGTBL_PTE_MODIFIED?

Likely, yes.

> 
> That is more or less revert of at least the below commits and rewriting
> it in a PMD-focused manner:
> 
> 2ba3e6947aed ("mm/vmalloc: track which page-table levels were modified")
> d8626138009b ("mm: add functions to track page directory modifications")
> 
> That would be a completely different effort, which I am not aming at ;)

Well, I don't think we should be taking this micro-optimization patch 
here TBH. The real optimization is getting rid of dead code, not 
optimizing dead code.

-- 
Cheers,

David / dhildenb

