Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A44220F4F
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 07:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746689835; cv=none; b=YebCPEBcq6b7BQ0qiCQP+0cZeI58eTjJM06G+2Rhnr+UrDRHGHpXv34awGacV97LKEsZwcbDlixh1JOEdXWXLNGd9zQ3kZRmYJmc9UKam21d5YgitCEe/HbtPGPUjBGqWfyVipMqD+P7yLoFCEugnWZUF53bF/h4KM7G+t1Y4tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746689835; c=relaxed/simple;
	bh=4Jaa4N0WTUpYbd8+QpfWfHEYKBJOovkD+RP+EaFRBhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKJRX9TK8cDPo+dzDeUndr7q2x6K53VlPOSshq5LPwTeYNX6ruYCyG+3NQE28OlvjfsCx2J5iBnFDzD/xkNrS1rt/jEQhJvdSo33eKqE6cvMDSQwYStnhkS3xuW9vC2dqZhf0G68qKCg/pMOKlAqkVone8ONFQ26z3cLTnxW4pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cVK01zAJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cVK01zAJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746689833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GezCcPBScg5KPaNeawmNmkgQU7p8LvvEy7wz0/a17Ms=;
	b=cVK01zAJfjLdYRf1/is1gxU9soOm/Atexv82p75hofihcr/Fk6pcC1glH52o566Q3PtqKN
	+8enKMGlY5zLTqUFj4/odqH7nwINV27uHD9L0HUgo7A7m7zm4fB/3RyFquafH2dA7CdGA/
	Kz0ClooDNSuPwAGc/c8+VtqIzag+JMg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-BhNx_AZbML-55hTSGwiY8w-1; Thu, 08 May 2025 03:37:12 -0400
X-MC-Unique: BhNx_AZbML-55hTSGwiY8w-1
X-Mimecast-MFC-AGG-ID: BhNx_AZbML-55hTSGwiY8w_1746689831
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39d9243b1c2so246123f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 00:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746689831; x=1747294631;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GezCcPBScg5KPaNeawmNmkgQU7p8LvvEy7wz0/a17Ms=;
        b=TuEId0/pakyBTcjs/4U44rfwIl3SCvtfUiV0vuXZoj8BT/lMHJ26+tN9fVXKRuoxA3
         gZ+WDxlNm5nNU84wBqIgaPopWi34PxkwOGD1SdAxYL9wVqUv9fpWN9pdo8g8sNh/ZmVM
         ybYkgyKUZnExOUffbJndolaSNAbIikEumsSUj+gxVg35rv18xbaIt639ltm8WCarniLc
         tjqEOj4Cz79tXwjcSU9wqaj2+q8KTCCZheUHNN969xg6G/RX3yC3UbyGWH5m4NrluO98
         cQwaS9WSj6t5vx+K6LoAA/wdeboHeG7nxGZ7y875bkoowstS73+qmcwKZDOCd5A2u96a
         54Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXqEBR4g2Tnq7Mwr2kPp3DH5jyMJx2U1ksCDHI5MxLbFPJlqKh5aCfKHVJDo3f9DPuzTsBxJsbehWxwvfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSdz3VWsxnmyDzLI7TiPnm7YJCdACdlB47tWHIJLcLipHSUmOj
	PPIMEPXZtAjVx5ljTfoytoyJTv/o8kP4XS+8O99aaHgmTTHjjufwyDMpcwCZlqXzQuTI/IpOMWb
	DTiWfVgmoZ7Z5xxsGupuKTuhwzzS11gtI3eaeBfWhe0hdO4h52f/PAjEZNkZM1A==
X-Gm-Gg: ASbGncsEndluwF6XMdx0OGt2u4nmFb+juGU3K+85iKEkH/FhRqar1LVOfHP1tsMgmzz
	uANI4/JNdEuCpV5X+HPWxJsvvYyyPkdVB2ZBW4HpcL7FV5d5xT9nI1GfYzCFVysQ6jvE46nv3xP
	5QYmvpydZEK/0cAAxczv2r0DCJ7VlGfJozBK/Pb4BSVLRgIsasXoip0ugaq+MriU88jiu9iAgj+
	sQJv2f8pK0cS2oTKIfI+WMUEAGGHwHzs37KvmfEnwT1zR7LaSOMSI7dq0qlOEeRdFkURcEqIARK
	vdGmHKpBOUUh5y/mhbAefak3/OkuyW8Zd//bv6L1Qsx2rVRiSq9vxeXuWWvpFHuyhgKTi5rUdQ6
	fpbx/4WRkMolLwGrOB5088dDnifZRxlGo5bIVwio=
X-Received: by 2002:a5d:64e8:0:b0:3a0:809f:1c95 with SMTP id ffacd0b85a97d-3a0b4a6868bmr5069696f8f.53.1746689830666;
        Thu, 08 May 2025 00:37:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfpkNjKotxnV6NRi8jDftDtvx5wtIETdy3ab7NqN203hY3QPoExdZ1fDzVF1kh2LAVn+THHA==
X-Received: by 2002:a5d:64e8:0:b0:3a0:809f:1c95 with SMTP id ffacd0b85a97d-3a0b4a6868bmr5069666f8f.53.1746689830299;
        Thu, 08 May 2025 00:37:10 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c? (p200300d82f3e590027aa5f4ab65c3d3c.dip0.t-ipconnect.de. [2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3ccdsm19537950f8f.38.2025.05.08.00.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 00:37:09 -0700 (PDT)
Message-ID: <0fd1bf14-a664-49c0-a239-fdc45b8e3a39@redhat.com>
Date: Thu, 8 May 2025 09:37:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: convert do_set_pmd() to take a folio
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <8e33c8a65b46170dfd8ba6715d2115856a55b8f6.1746609191.git.baolin.wang@linux.alibaba.com>
 <a2faee74256c22cff2238487a86b154d5520c334.1746609191.git.baolin.wang@linux.alibaba.com>
 <aBtNrQNlL7hjLrTZ@casper.infradead.org>
 <88060373-d0b8-404a-b53b-9b5a54f5ba6f@linux.alibaba.com>
 <aBuOjrH1UpyTf8I9@casper.infradead.org>
 <569e592c-1c30-4c03-bcee-c1670ac4e159@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <569e592c-1c30-4c03-bcee-c1670ac4e159@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.05.25 04:23, Baolin Wang wrote:
> 
> 
> On 2025/5/8 00:47, Matthew Wilcox wrote:
>> On Wed, May 07, 2025 at 08:36:54PM +0800, Baolin Wang wrote:
>>> On 2025/5/7 20:10, Matthew Wilcox wrote:
>>>> Because I see nowhere in this patch that you initialise 'page'.
>>>
>>> Please look at the following code in do_set_pmd(), and the 'page' will be
>>> initialized before using.
>>>
>>>           if (thp_disabled_by_hw() || vma_thp_disabled(vma, vma->vm_flags))
>>>                   return ret;
>>>
>>>           if (!thp_vma_suitable_order(vma, haddr, PMD_ORDER))
>>>                   return ret;
>>>
>>>           if (folio_order(folio) != HPAGE_PMD_ORDER)
>>>                   return ret;
>>>           page = &folio->page;
>>
>> Ah, fair, I missed that.
>>
>>>> And that's really the important part.  You seem to be assuming that a
>>>> folio will never be larger than PMD size, and I'm not comfortable with
>>>
>>> No, I have no this assumption. But do_set_pmd() is used to establish PMD
>>> mappings for the PMD-sized folios, and we already have PMD-sized checks to
>>> validate the folio size:
>>>
>>>           if (!thp_vma_suitable_order(vma, haddr, PMD_ORDER))
>>>                   return ret;
>>>
>>>           if (folio_order(folio) != HPAGE_PMD_ORDER)
>>>                   return ret;
>>>
>>>> that assumption.  It's a limitation I put in place a few years ago so we
>>>> didn't have to find and fix all those assumptions immediately, but I
>>>> imagine that some day we'll want to have larger folios.
>>>>
>>>> So unless you can derive _which_ page in the folio we want to map from
>>>
>>> IMO, for PMD mapping of a PMD-sized folio, we do not need to know _which_
>>> page in the folio we want to map, because we'll always map the entire
>>> PMD-sized folio.
>>
>> There's a difference between "Assert that the folio is PMD sized" inside
>> the function because we know there are still problems, and "Change the
>> interface so we can't specify which page inside the folio is the one
>> we're actually interested in".
> 
> Fair enough. So how about adding a new 'folio' parameter to
> do_set_pmd(), similar to the set_pte_range() function prototype?
> 
> vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct
> page *page)

That's what I used for rmap functions. *Maybe* folio+idx is better: 
might avoid having to lookup the page in some cases (probably in the 
future).

-- 
Cheers,

David / dhildenb

