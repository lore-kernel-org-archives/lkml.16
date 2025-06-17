Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C9A21CA00
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750161549; cv=none; b=nnv/3bVH23ykcPNaatE/ixXgTMZ+8iYweFiWJaytDbawlqzb418rqTi62t2d9OemkcMB4LS+/N3a0+6H3flAb/bWv4APpAC01SAbg0CJfzOvzia+Q53TsWfa60nBesGb1Di79Q7oH0mZ9Aqm9x6kT9s6bhJXElPYip/IEr1GjJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750161549; c=relaxed/simple;
	bh=XvXycexKKIT1wNv/lAONv7PCqTZhSPHfg+1mGzN7vZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KNbT7j2QEAUNy9355Rm4KYP1XRHmrG9CKRnItNIy0zrZ7WBFjjolKEMeKaIYHeoRvZYphDJAcoldBfdCXMtK+sXpvssqf73Zkfj+DzymFLVF5QOHtfSbTmCX6WywPs1fim0I1TjrRNkvymZ4h2IuAq7OP5ssj5oIRXOmvUdyGXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Oia4Cmhd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Oia4Cmhd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750161545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=M0LmxJPlr97t0GgKG76kx7cNdGLEmEmaCVfwzWkQAs8=;
	b=Oia4CmhdS4zKApNLaXL9PF4fdjUTzlQm1WWTjZBiMXUaKNvfYmEUyAnkWHeGROPUQ4Shd4
	5pscfOFhgnpuMlAx+BF+UcMrXV2IdtnZzHntHRCYU5DLGaXFQ6zc0OJVCoBlQIqYKZui0K
	xphlIs7fBq52CxVhAnc7Uny6Nv8PjUU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-HORQR-ztOGetGMnAEezeZA-1; Tue, 17 Jun 2025 07:59:03 -0400
X-MC-Unique: HORQR-ztOGetGMnAEezeZA-1
X-Mimecast-MFC-AGG-ID: HORQR-ztOGetGMnAEezeZA_1750161542
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450787c8626so42439935e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750161542; x=1750766342;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M0LmxJPlr97t0GgKG76kx7cNdGLEmEmaCVfwzWkQAs8=;
        b=RnYwhOGnOFjwI0KT7WFuOhu7mmdy440csESiMP53gEu9vcEExg3CIVmBnQPlzCGmBX
         ebO2oc5VVppS2Acc/UbYzHUYUPklSXfFqvR8zYsImnSgcQovSpl0KC63BDaxK1IWSnHo
         yKPtJG0Plf8VHRnZs883ZMw8u6RrLvEsl1G5TVkwHXv/yOZg+wSZ0RQWiNEigpIOZXIf
         29OHy9AVY3PedCPk98oG9qo6bLfnTWEJjqdDuiJTiAebwzNOoq5ed+eyRBtBNRxT8D7E
         Pt5J3owGkXFy9rl8PF+CTTwQ/eLKJ5GohkA/r/eJV4GzFj1oU7ZUshydieDBAqpAQ3zc
         dkyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmfhLJDO/AeTbRFiGajuL7irWJnSnq8c3eFZVdw8FJ/7NoAU3QZ4lD1N0PRjYAfuBa1iEUzfqVeGlZgZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDq8hyukmohrmQETYSfm/AuiJe1KzOMgNsUi2w8HpWVpKgn0xo
	kJ3gGNGgWKNFC1zHtooX8T/dVdSH+U43fFs18zWrcXqDXWh754TZfxD7IYw1pnIoew5BMuiiT2q
	Tcfuu6t6u/uNRK413eS5oatWR+5mx5QCKyy3k1ff1z1RcDMsF+Q7SrfEQR4hpwrRLRg==
X-Gm-Gg: ASbGncvovp0WG8hBdlZ7SqRI0DPRChTIy8jiTHqX+JkHO2QRew2Y0oXGoLibqxSo5rJ
	rSJzF4LJHdpm5EdT4ia47Lglayypm+yOuATb6iR+S5Gcl1dwviEqqMLfuzZjPLX1gTD6JhwrxRz
	MY5wry8d/kdDYciZbgveSIC4ASyq9CwIbGH9Frxe1hi1696qh+36TFHuqCjzNDr2H/4pgI7Pszu
	HK4ehAqW+Mnw2o4yx5AyhqlVsKTf4cBO3CG5VkcD3aEpZBQrZEPhWFjANCyXQ4bQImRZq32wdfr
	2nGcRPlt3TGKdxRWZg4rSByPdo1x7kKAnpUaDlxj+8E7SPt7EIruElxWphQ6KHzDjjjMTZ7NkBn
	8BU1fj08TtAYTltpvT3B//rcD4lXVS86eMJHAC4iDhRhNVpw=
X-Received: by 2002:a05:600c:8b02:b0:43d:77c5:9c1a with SMTP id 5b1f17b1804b1-4533cadf85dmr127072495e9.4.1750161541773;
        Tue, 17 Jun 2025 04:59:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTMR/tnjWbAw4fBe2aSm6jPgSsKR9SjxjxTgojvnNR8slm83wryG+cnhNot662nD+A3FoW3w==
X-Received: by 2002:a05:600c:8b02:b0:43d:77c5:9c1a with SMTP id 5b1f17b1804b1-4533cadf85dmr127072115e9.4.1750161541354;
        Tue, 17 Jun 2025 04:59:01 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2522b1sm171470305e9.25.2025.06.17.04.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 04:59:00 -0700 (PDT)
Message-ID: <f86c4211-fa9c-43a4-b60a-4fc563fd4d61@redhat.com>
Date: Tue, 17 Jun 2025 13:58:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Pedro Falcato <pfalcato@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Suren Baghdasaryan <surenb@google.com>, Matthew Wilcox
 <willy@infradead.org>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry.yoo@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Jakub Matena <matenajakub@gmail.com>, Wei Yang <richard.weiyang@gmail.com>,
 Barry Song <baohua@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <7e51e1e2-7272-48d5-9457-40ab87ad7694@redhat.com>
 <b65dd020-5e02-4863-8994-def576e3d3dd@redhat.com>
 <76zi626uk53dtfzmezzt6cfz45ansam2gpcumddqxnipnw5jkh@qwfzoxgi255b>
 <68d8c7ad-aea0-4556-be63-9b67d70e4386@redhat.com>
 <58560256-58da-4fa6-a953-d2c4695ffba8@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <58560256-58da-4fa6-a953-d2c4695ffba8@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.06.25 12:57, Lorenzo Stoakes wrote:
> On Tue, Jun 17, 2025 at 10:45:53AM +0200, David Hildenbrand wrote:
>> mremap() is already an expensive operation ... so I think we need a pretty
>> convincing case to make this configurable by the user at all for each
>> individual mremap() invocation.
> 
> My measurements suggest, unless you hit a very unfortunate case of -huge
> faulted in range all mapped PTE- that the work involved is not all that
> much more substantial in terms of order of magnitude than a normal mremap()
> operation.

Which means we could at least try without such a flag.

Regarding MREMAP_MUST_RELOCATE_ANON, I absolutely hate it.

I'll reply to your comment to my other mail once I get to it.

Users that really care (testing) could figure out if merging worked by 
looking at /proc/. Other users ... no idea what they are even supposed 
to do in that case. Not mremap()? But what is the use case ...

If the "not merged" case would be relevant, a workaround would be ... 
mremapping it simply back?

So if we can, let's just try without any of these flags first.

MREMAP_MUST_RELOCATE_ANON could always be added later on top, once the 
use case for it is clear. Removing it from this series would not make 
this series any less valuable I think.

(and of course, doing it without any flags will make this series much 
more valuable :P )

-- 
Cheers,

David / dhildenb

