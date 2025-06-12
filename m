Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C592C17A8
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749743297; cv=none; b=kUhZyxAFbQNm+M02mwjhLIMCe+A6+X5CcMIBk0JILjehtd7RU3E513J3+EZNmBIpMynHEjHQPGF/06+Bgyf8XCdzwWjsCP9CdbPtCc585H3ZIDp6R6uWuUk721CbxIAlhSWM1aOzYoLX/u1DQDRDP4/VcXq1k9ScYWlvGfmgr5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749743297; c=relaxed/simple;
	bh=zuH9jIzu3uEbL6ck4x154Vp0Q8D1adHK9ehH3B2mO1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ekt+yCyuWpSZddY/tT6v2uM3rWRtXGmHydGZ9qruVQygzo6xUbbZAaxfgW6vzGyALg+bfEVBIGfVwit/MIZDGAEanVEBG50JRQWCjGl7ZsA8EYRABCrkfcMWZ1hVvJ90hC62IjvGkvJaT28jUWt9z25FqWA9dHlIsuNvrUGtP3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VCULH4qL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VCULH4qL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749743294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ei/d28RGKwbGgo0BkY8L/1pu6a5ZV2mA8pg90GSA4I0=;
	b=VCULH4qL1A81h9I6qCg0vFSp8lqaykymMR+h6k2YsQR4ZGIKTImofum+p568EsL1ubi3nz
	ab7bJera6hcbJ6xt6FbGGfyA3nSZ14YzP/rW6JU9TRpYdeCR3GdGMR8xAHTPw41ERqEdqX
	0hp0nXujRnj5pnk8+QdKQwR/gLFgtV4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-9VUndFBWNPe1-qtJiaPTzA-1; Thu, 12 Jun 2025 11:48:12 -0400
X-MC-Unique: 9VUndFBWNPe1-qtJiaPTzA-1
X-Mimecast-MFC-AGG-ID: 9VUndFBWNPe1-qtJiaPTzA_1749743291
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d64026baso6735265e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749743291; x=1750348091;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ei/d28RGKwbGgo0BkY8L/1pu6a5ZV2mA8pg90GSA4I0=;
        b=h9kg6Uqmu6XxNDGDrtebRAm+15Mf6XTVRREFCBm7qHK8JLEmICJ5VoKI5B4/0rMOUv
         46K4Vl1VN16t0JxxAba2Hyb8juBxYRgcOl0WXzpARZGFYLz/tx/2P+jmUR8s4ylEzLQW
         0T17EbMw3b754BD+ylw5CPmCGGogws2Xfu7cJtYqf7yB/OnrtY5M8xZR+E/6SeyPm6ND
         s6bRO9lUPOztv1Gy/G/W6uomqewPrOOzz6h2PFq2QjbWASyYKvkK/9B/GrBKsE7OEzqx
         sSaKQcrZAYFuP6r4Qhg7SMNdMm/KQlXnZsYa5XLhwt1p+lFV/4R7DmNKRFr717Stz6vW
         1Lfw==
X-Forwarded-Encrypted: i=1; AJvYcCVN4qX1wJhJ2NqdPX9jQgrZ900roNf8wW4f/zX4Zb1GB6FOpMawKCL8bE7QBydGJBEUTrphmsPkGWmCCog=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJqY5SgSJpIrwg1n3rD1x0TbKw+4K4YoYoROotpF/dkJInQocw
	JBLuVjU+Hj5LNA2FMnsgO/J0INA4pGmaznIc9w4ORJf6MUa+nVuKlOSkG8qOK3truUPRcCLYQ9X
	LwoBEsiBnUd72VJpCDOql2zmMLVSII0TBM6/6DniFQtwcJPhrHJPZJTNyLzJ6ak5ZAA==
X-Gm-Gg: ASbGnctR4qzJOfoO5zggtw8ozAqOGxQn7B7IEFFV/o2veTmVNzakwloNrKLjGjnzzU8
	yOchAE881+nPFiANhglohaOwIEochWk0ge3tomLFiSAqE8FOMEfvaQNLv/y9DEwpdXmMw4fOFRD
	3rV6piNYSNqNcjSY46bgchY72Nj4F8CuHi4UeO04sADG65/tJug9kdXunCjObU8BIbysa256sjh
	ceUF6DQIBHUqOGIALWkr3YFexdaJ6AEchzBEsKGVbuKJyQn8ua0eSZHGpi7Tt/kAFkIJ0TSa+3X
	BMXDYQNMpKNyk7gxbUXKBGm+bfKxcTVFhY8soXh4ZhIw9Hf+C/aNz7lwNHdqQVQRO80mz0tPFqJ
	3YnZrSOVDmNzcVEfrxzaqPtu8T6Z3tTLTzaf2/HJ0Q+u/UHRhRw==
X-Received: by 2002:a05:600c:3489:b0:441:d4e8:76c6 with SMTP id 5b1f17b1804b1-453248dc848mr86660245e9.30.1749743291237;
        Thu, 12 Jun 2025 08:48:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKJbzhqucCYFF6L45cVov1+4dJDmjC/GWZqYfL6Yk/ZiNCgc95grP7byUyLps7/+rUkN1TbQ==
X-Received: by 2002:a05:600c:3489:b0:441:d4e8:76c6 with SMTP id 5b1f17b1804b1-453248dc848mr86660005e9.30.1749743290856;
        Thu, 12 Jun 2025 08:48:10 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:1e00:1e1e:7a32:e798:6457? (p200300d82f2c1e001e1e7a32e7986457.dip0.t-ipconnect.de. [2003:d8:2f2c:1e00:1e1e:7a32:e798:6457])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e16e550sm24134635e9.35.2025.06.12.08.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 08:48:10 -0700 (PDT)
Message-ID: <2e5eda85-f1b3-4fc7-a378-346cfb3840e9@redhat.com>
Date: Thu, 12 Jun 2025 17:48:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] selftests: khugepaged: fix the shmem collapse failure
To: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, shuah@kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <c16d1d452aa876b449324d12df6465677158a711.1749697399.git.baolin.wang@linux.alibaba.com>
 <AFC17CA1-DF5A-48F0-8E63-E139005F5880@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <AFC17CA1-DF5A-48F0-8E63-E139005F5880@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.06.25 17:46, Zi Yan wrote:
> On 11 Jun 2025, at 23:54, Baolin Wang wrote:
> 
>> When running the khugepaged selftest for shmem (./khugepaged all:shmem),
>> I encountered the following test failures:
>> "
>> Run test: collapse_full (khugepaged:shmem)
>> Collapse multiple fully populated PTE table.... Fail
>> ...
>> Run test: collapse_single_pte_entry (khugepaged:shmem)
>> Collapse PTE table with single PTE entry present.... Fail
>> ...
>> Run test: collapse_full_of_compound (khugepaged:shmem)
>> Allocate huge page... OK
>> Split huge page leaving single PTE page table full of compound pages... OK
>> Collapse PTE table full of compound pages.... Fail
>> "
>>
>> The reason for the failure is that, it will set MADV_NOHUGEPAGE to prevent
>> khugepaged from continuing to scan shmem VMA after khugepaged finishes
>> scanning in the wait_for_scan() function. Moreover, shmem requires a refault
>> to establish PMD mappings.
>>
>> However, after commit 2b0f922323cc, PMD mappings are prevented if the VMA is
> 
> Can you add the title of the commit? It is easier to understand the context.
> 
> 2b0f922323cc ("mm: don't install PMD mappings when THPs are disabled by the hw/process/vma")
>

Probably checkpatch.pl would point out the same :)

-- 
Cheers,

David / dhildenb

