Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD762853F2
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240978; cv=none; b=NF+2tUHZvYwhNcoB0O+LkdbdpWEo0Q5WOyvdf+sxSWPuK0uSLGnEsKx0UzXYLg7Nk52j4xIm0Y3tU3SRvVCZdtPdO6wtTB8/7JZNPaq1Yn2xTRNLvzRQYOPjO8x+QoG34WNXGBu6mkU8YXCzQtgb4ivY/LuK80M90wfHXcOMW7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240978; c=relaxed/simple;
	bh=/e7g/ttrfPQPf16tStbo90XVNbSjV82INLAcfdJxNTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N9zhEBzU6bh29itdY+JY4+g5lB5K03cCJTlbREngLx+o5YZE3SvqVusiYmxK3VxQTcMuo69zAD2gxLs828n7PWbfvR7PJuyoJV8FqBQQY65YP4mQROWO84UUIElkEusK1UCG+ZPidEheQqSITRyflkeR/u1/zZ62CpJfN8afRts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TVZF47kC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TVZF47kC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750240975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CRtbQuVzzYJlJGfWCISY2GUOH7wjB1QvxrCWVertMgo=;
	b=TVZF47kCc1j3syFrmIXt1KiK4Kblq8pXlSGhk74wp5VVmiHZ/l4LxJJCCHEMzlgWWnpPhK
	OCkMKFAjuCRF4qniBfLNgWoUYP+wZSYWHEY/6SfX6Q8Ce6H4EUt0Em1Ol+1lMJK86UUo03
	NeeTFwUMdUjfaFQWV8fCXgsxBmrWOmU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-qs_tfsoLPwK_VJi_t9PX8Q-1; Wed, 18 Jun 2025 06:02:53 -0400
X-MC-Unique: qs_tfsoLPwK_VJi_t9PX8Q-1
X-Mimecast-MFC-AGG-ID: qs_tfsoLPwK_VJi_t9PX8Q_1750240972
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a50816ccc6so3690990f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 03:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240972; x=1750845772;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CRtbQuVzzYJlJGfWCISY2GUOH7wjB1QvxrCWVertMgo=;
        b=PXF1OQ0/2MI5frNWwvuU+/BWqUSjnKsVwBcyxB/riSCDoG0+dTl/JwAaQk2PC5ukNs
         N1zB7oIKS1lfeJUTm3jL9z6LryzgCfFVjEggeBrKbL6s4thw0YbOYA0nPwVURw1TmitF
         eNziLFXuhea8WpbQYqLCYnms9bWJ6YmJSpbVaGYxU5B8YG48DfP9KAsCGi5srOLxBvU/
         zpyQOiIJnCl65xlKV+ISxpgS6UXnu2Y0oCojhXlKTtkjwsEturPqk1fSskno7BiFe8H+
         5RRPkh8hhmcKXmYFAcZBiYcMPzIaiwgGEWsL2bAn9KnYGNmiBfM6UZ1eIbVt+C4v9Fyd
         s3sg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ7t7klmrofWJtmtabcy59LVUkVqzB+xOC3vMwhQCXLlmRMwwhftCPeyG0Q9HwljGSEILOg934L+/W4zQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsqC6Y6bcJCc2E9dZuSREE9ERzURq6PJhzmPSBBGC8EBkdjs0B
	WsSS/+8NhmQ74UwHOvwEFzPfLAdmbTRcBhrowDE9AlHpqvjQe/2MxhMNiKbQUUWWY5ve38cQVjM
	zPTjXYTC6TAVzx5LnImfIB3L0DVSRAUTYqEkid5UPQMF7aeA0uIlrXVNqFUCyMjRXiQ==
X-Gm-Gg: ASbGnct7lNMSEBfB2n8xLyIUpPNwnfA89+K5scKTHgr8tpxFlo3ZCGKCIMSkp2+sSL9
	gcG2ZSqVXxHDaP8h7PLcX+1TF3+lw3rt5LckkJUfoQ9DfN3RC20R6IXhLC5lOntrAQOzNvG6Dji
	6478GqJL6hjym4ErhtfzZO616/C9fcYS74JcZCP4BXzH6xDhIeBkcrMUNPv6fLnbu1QgZLHUirw
	mxsJmitiFervyNhLmaVRHWKtWV2vjSRwIZ5Fpd567jmZcqdq9sOBHoFfb6Ynm3S8VYwMODuYTZs
	xcgtA0fLvTGFEExITwNNoR6AD56QlYfOd0LEH5hUG8uPsFBXTVdkkETOlvM4+1dnmdi0LLLA+vu
	JrI8fPx6R3riM3TK4h9YYnC18JgY7vraeHeI//JuMeecVPLo=
X-Received: by 2002:a05:6000:4b06:b0:3a5:541c:b40f with SMTP id ffacd0b85a97d-3a57238b539mr14340519f8f.9.1750240972266;
        Wed, 18 Jun 2025 03:02:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYErkKBPDq4jgp5k0vcEbFlKAu7akoZStaLchomKt3TnXztQTJTHBXFZUAlQlKRr9ZllLZQw==
X-Received: by 2002:a05:6000:4b06:b0:3a5:541c:b40f with SMTP id ffacd0b85a97d-3a57238b539mr14340492f8f.9.1750240971886;
        Wed, 18 Jun 2025 03:02:51 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:2400:4052:3b5:fff9:4ed0? (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a6078csm16197647f8f.21.2025.06.18.03.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 03:02:51 -0700 (PDT)
Message-ID: <4469c40b-81fd-46ce-8599-0bc6c2d3160e@redhat.com>
Date: Wed, 18 Jun 2025 12:02:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Inline vma_needs_copy
To: Vlastimil Babka <vbabka@suse.cz>, Yunshui Jiang
 <jiangyunshui@kylinos.cn>, linux-kernel@vger.kernel.org, linux-mm@vack.org
Cc: akpm@linux-foundation.org, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com
References: <20250618014209.1195734-1-jiangyunshui@kylinos.cn>
 <f7ea4fc4-999a-490d-b221-b3b935e4b1bb@suse.cz>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <f7ea4fc4-999a-490d-b221-b3b935e4b1bb@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.06.25 11:39, Vlastimil Babka wrote:
> On 6/18/25 3:42 AM, Yunshui Jiang wrote:
>> From: jiangyunshui <jiangyunshui@kylinos.cn>
>>
>> Since commit bcd51a3c679d ("hugetlb: lazy page table copies
>> in fork()"), the logic about judging whether to copy
>> page table inside func copy_page_range has been extracted
>> into a separate func vma_needs_copy. While this change
>> improves code readability, it also incurs more function call
>> overhead, especially where fork() were frequently called.
>>
>> Inline func vma_needs_copy to optimize the copy_page_range
>> performance. Given that func vma_needs_copy is only called
>> by copy_page_range, inlining it would not cause unacceptable
>> code bloat.
> 
> I'm surprised the compiler doesn't inline it already, if there's a
> single caller. In fact, mine (gcc-14.3 on x86) already does.

Same here

	gcc (GCC) 15.1.1 20250521 (Red Hat 15.1.1-2)
> 
> So I wonder to which extent should we force override wrong compiler
> heuristics?

I think only where we (a) really know better (b) it's crucial for 
performance and (c) modern compilers don't do the right thing.

> Maybe just inline instead of __always_inline would be OK? Is
> that enough of a hint for your compiler?

I would do the same thing (inline as a hint), but some people apparently 
recently argued that newer compiler mostly ignore it either way. At 
least that's what I recall.

-- 
Cheers,

David / dhildenb

