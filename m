Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D39A22D78A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750757947; cv=none; b=eypl8dk3ylb+UaiwN/OEdV7dGIvPwPw5XjtFE06WGT7gffwi512TMAmw+UsuNt0Tu30i/yPjnjADFDxfw+VWJdhVi7d5xP4yRelbKo5WRcY6XFZjTK7lQkpgmxL9wNVY24GPYaMSNh+Ngw7qp83bMz4LaoZQAlBcQleGMXbwPFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750757947; c=relaxed/simple;
	bh=1NoHJG8V91bXXCcMPb/wnjcL4XU2H/L0awRadFjXVVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I1XV3ENhzwV8nCsL4rBzSeveM49tztcanvnc6A5hyJcUjapApjyY1EqncDn82dUUyom5bZYZDMQyNklY25DMploJ2J2Wc/naETa4noQYaOPe+OwXUBGdzKMJhoRdFxhcUs4T/Ux8+pHLkw6Zlxe2oIWj+mvqN9sJVjgTEzFgVf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NchN/2RT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NchN/2RT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750757944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jTyCWnCdWLiYr6pehJOamwBdLla05iSTvYLPxfGdYrY=;
	b=NchN/2RTI7HdDGZ4O6g28qS+Qonx0nbT543lQ99h17mV75oHxS+b1/o7PrGTSlMSdNr86Q
	ju+S+cMQTdp9AQW3jpOhWrWLLqmGrFIPQsHJfY/FaW1eJ9GmfCp2ir4QKhhp1NZmbEVJal
	pu+iYStNegQiPjcrsSjSrvM8Ps9EQgg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-3PvsIKHXMYGTKhfcLlCoPw-1; Tue, 24 Jun 2025 05:39:02 -0400
X-MC-Unique: 3PvsIKHXMYGTKhfcLlCoPw-1
X-Mimecast-MFC-AGG-ID: 3PvsIKHXMYGTKhfcLlCoPw_1750757941
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4537f56ab36so1431345e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750757941; x=1751362741;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jTyCWnCdWLiYr6pehJOamwBdLla05iSTvYLPxfGdYrY=;
        b=uj/t5ee/Yo+PwG/Oqk17wu0kU5A0ahtkKxSm1Ukiza4/i/74sKcb5g0vb5wIw1Kli9
         GKkPjq1/+Q+kUEjyY2LTX18JXaxVwxScHUxj1/2/c3a3Z0UZfJUFGAc3GWVUwzHegX7+
         E/nuvIPFv321MrQpJjvEMmur4cTwI2COWu6mCysj0xTNEtK6/WBL6aXGGLE+yDitXmOk
         EPHGx1nw4IVNMXPhzRdOz8MMQ+7sczsqlf5XOrPPPaPuAH7w/h3N7IYLggtjMRFFc1KG
         8kKqTK8eUS8h/ukd9XGYYzgU8Yhi4An92ZoUoOm1IJTNWRgKfKXhak1TaqhZ97sVag3+
         uTvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5EevQcR0QB04jgfjDRC+ltpWAlfWZGGhpPTf4M5ccy1PbOEq6nk3d3lZ1tdCF2J5xn6bhGgSKxrLiJYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrIyO5D9eN1t8/wvgZmoUMf6CBc0q9J3FcrGPBONG+PFJh7nuu
	VUqft1p0bzywuDJumMbd9W6QcpTx5LoAFkzxf2uEZlozkOitc17kkXjHC5WV/nTtvNF8vS/g09C
	cmsvielgn/PkJY1aT50CgmnjkIhVubXDQnET4ebrVZg6YuzDyNJ0R2DhokH4CWckzfQ==
X-Gm-Gg: ASbGnct2ytBkkUj7gBe9aiy77zVtq51/FX2hpz/MVUtvEekRuTcAOZvjuMREXtVTseG
	F2huwf6x8lddeC1DdJ5CEvQ24/ri4ecChESaBoY0YgtpcYePUXoAXOJuLN6xgPqU8k9HsG1Sv63
	J/bpWcyLYPCGUVff5GWdk3lud0v369hw8NB5aJMbdoz43D5TM7SwKuKHYZxNHf1Bv8gRttDBRI3
	1NRcxmpoYNn1lR4qQ7NVtbOX/RF9EfxY7/MWEC12ibrfeCHTjBPlvmHLboepzLG70r7qvzqxlNZ
	8+SCNTMLNY00yMmKhiOLRpzQu+PcCSNeCva7TGDkghjUFKguAPnosXc=
X-Received: by 2002:a05:600c:1f14:b0:453:5d8d:d1b8 with SMTP id 5b1f17b1804b1-453659c4169mr160487985e9.30.1750757941230;
        Tue, 24 Jun 2025 02:39:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxGuCRTqhFvcP/YNL2DwetLyXiPjcOPtvWRNEc0tXu4Uvv3he/uOemDBtgwB2sSy6628/nkw==
X-Received: by 2002:a05:600c:1f14:b0:453:5d8d:d1b8 with SMTP id 5b1f17b1804b1-453659c4169mr160487655e9.30.1750757940813;
        Tue, 24 Jun 2025 02:39:00 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4537c4d2cb8sm8277705e9.3.2025.06.24.02.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 02:39:00 -0700 (PDT)
Message-ID: <5ff81ef9-e755-4a75-bcce-92c4a4d1da6e@redhat.com>
Date: Tue, 24 Jun 2025 11:38:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Pedro Falcato <pfalcato@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
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
 <tc466z77itm7qps5exnelcp57dabnvn2gtd2tigutaivulmowh@4n74ymr5yxtg>
 <c1586ce3-e354-4b8d-aaa4-5f9899faae88@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <c1586ce3-e354-4b8d-aaa4-5f9899faae88@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.06.25 21:28, Lorenzo Stoakes wrote:
> On Fri, Jun 20, 2025 at 07:59:17PM +0100, Pedro Falcato wrote:
>> On Tue, Jun 17, 2025 at 11:57:11AM +0100, Lorenzo Stoakes wrote:
>>> On Tue, Jun 17, 2025 at 10:45:53AM +0200, David Hildenbrand wrote:
>>>> mremap() is already an expensive operation ... so I think we need a pretty
>>>> convincing case to make this configurable by the user at all for each
>>>> individual mremap() invocation.
>>>
>>> My measurements suggest, unless you hit a very unfortunate case of -huge
>>> faulted in range all mapped PTE- that the work involved is not all that
>>> much more substantial in terms of order of magnitude than a normal mremap()
>>> operation.
>>>
>>
>> Could you share your measurements and/or post them on the cover letter for the
>> next version?
> 
> Yeah am going to experiment nad gather some data for the next respin and see
> what might be possible.
> 
> I will present this kind of data then.
> 
>>
>> If indeed it makes no practical difference, maybe we could try to enable it by
>> default and see what happens...
> 
> Well it makes a difference, but the question is how much it matters (we have to
> traverse every single PTE for faulted-in memory vs. if we move page tables we
> can potentially move at PMD granularity saving 512 traversals, but if the folios
> are large then we're not really slower...).
> 
> I have some ideas... :)

As a first step, we could have some global way to enable/disable the 
optimization system-wide. We could then learn if there is really any 
workload that notices the change, while still having a way to revert to 
the old behavior on affected systems easily.

Just a thought, I still hope we can avoid all that. Again, mremap() is 
not really known for being a very efficient operation.

> 
>>
>> Or: separate but maybe awful idea, but if the problem is the number of VMAs
>> maybe we could try harder based on the map count? i.e if
>> map_count > (max_map_count / 2), try to relocate anon.
> 
> Interesting, though that'd make some things randomly merge and other stuff not,
> and you really have to consistently do this stuff to make things mergeable.

Yes, I'd prefer if we can make it more predictable.

(Of course, the VMA region size could also be used as an input to a 
policy. e.g., small move -> much fragmentation -> merge, large move -> 
less fragmentation -> don't care. Knowing about the use cases that use 
mremap() of anon memory and how they might be affected could be very 
valuable. Maybe it's mostly moving a handful of pages where we most care 
about this optimization?).


-- 
Cheers,

David / dhildenb

