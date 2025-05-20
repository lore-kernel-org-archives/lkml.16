Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564E9258CFD
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736806; cv=none; b=Gvyvggdnryv0sLfWDhveahDeBCm6QZvjXkihxOWQKfBYHPzRLOMObSE/ZZXwFAiCIT/WCj3t41n5WHw7RvBFFFqXhqrO2TA8vqpVnlkCz/9YgClNwUbavwPSiMj+tSnqdGDY1n6DkaaLtJtv8XofkwBQuB+zdq0szqADDa/yioY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736806; c=relaxed/simple;
	bh=/wyLl3MzGwpIia6GnldaUAzJSC/xUnZ5QzZuYaexti4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u1e7IzuC5Ci6l3cTIG0dkoeQ9ik7wGCQ/BqExSEE7wNAmXR0yeVX5fnGTYIbPBNYHs3frPdw84mcDR4XrDXypYmvy+RqueobWMOqZwEydkyPdk4ZtESpRzlOrUrSez6kfA4z6QQ/yJ6gr1H2vPQFDnKpyl6ujrz1bYOqc7iMzqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lq1Stw2P; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lq1Stw2P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747736803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GCFR+2IOaYMz7I7uTm6e4DOxsS9UqKnqFGqvlDmS3/Q=;
	b=Lq1Stw2PcZRFzj+j6am0Hu73EbVoqR+PNoy0oiZTf6st/+M8g1vaRFU7K8o0WyXBDLqU4j
	csmYVjWIlN8TTXmKt0Nz07q/TD94JmhsSsUrvW2z3FYOkJDq59z4qM00byoUdQf5eRbVxb
	B5mEDhTm/3N3raiI0zWuDfxwJeyia4A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-5Ym3rdjmMwOoYAUdwBUaMQ-1; Tue, 20 May 2025 06:26:42 -0400
X-MC-Unique: 5Ym3rdjmMwOoYAUdwBUaMQ-1
X-Mimecast-MFC-AGG-ID: 5Ym3rdjmMwOoYAUdwBUaMQ_1747736801
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43f251dc364so8097085e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747736801; x=1748341601;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GCFR+2IOaYMz7I7uTm6e4DOxsS9UqKnqFGqvlDmS3/Q=;
        b=hNX+dqjaUDO4x1hTremd/4eBN2uWzVmyLUEAGAZvca7ECRewmTgiGjrXSPPJnylhKm
         lOY3+T9KoewrStkI7zjOEKC0h3ewFG3+RF6Pu1A+vZ53dpnqCCFFAXeGZSpgqtgpu51+
         qWkKcxLBE2fEvsioXBSCWI+yiYl6NTmmFdfVCwdR1AWRnlfrT5d2C87XkW58nX25v4r+
         k3F/nktyZ1RJZnOdT7ngbDI6RdCNIl9bfZYHD9198pIcWrqtGiHW4RQVvUs5daPSRAa+
         A1OUAQ+k46D8LlWRQK35hXR+C2+zWoAn6+SpPhZes0i8HZRaYiWK5TW/Cb0GRgDfvrVW
         qeEw==
X-Forwarded-Encrypted: i=1; AJvYcCU6rxQypv6jiBA1Vyfx7nSUoXFF80/jJxn+sl4X8VHijQYui1Rrr81NH1+PtTai0YWz/HIF2xTVO8YDrEg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybcfh6YCnl5rmdBjgDRfxerwSAI2tU7c3S5RVNqY9jYmoCl6Xh
	n7Nd9gbwZL1qkvVCWIJgizaVyL8oH+zNvllndtOOT4VKoDLRhKDR1XTnShVNQEtmlzSp6n94GQ4
	uzLYjGcLLeCgfWl8Mp7ZHUIf1FqUqBMl0liaNw+XvoL6IoUCRwSwXLUwzfvyzvhh+Og==
X-Gm-Gg: ASbGncvsCYa7eVVlEnb78n5VG9N3jvb1XcYcyCaOQ0y6U9Ch1m3BBY8aVcsvPX/YT/e
	BJMlpNx1o0Wr8p/DntwuGBLkefo3MT7389KyQL65vwXq2nYtFeZB3vP2Y7xoyU+uziQST89gWSS
	LUdjTtRIc50y8z2WidXjaLhk+vs9Nh+itn9n5F7ab2IOfTdDssKH5lmzkwsKBa1ab89Z551meTT
	M+1/TcKuGmCKwxurzbfyuRQnLunI2NSvjsu9b78D1LAaWj9A7ThIPm4jqZ2I9LKCmBfdkBN3g0V
	ozrZh6vuZ2EOJfrMid6rq/24umqlpNVe9RR++lCsLJeTSYhFnq1nqCAwWMLfevb06rwNj+PpiFn
	0VUfwSWkwCJV0B4AAf08ZzNSapHAF+KmOsRZrlVc=
X-Received: by 2002:a05:600c:c092:b0:440:66a4:8d1a with SMTP id 5b1f17b1804b1-442fd950b76mr131042045e9.7.1747736800793;
        Tue, 20 May 2025 03:26:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxPGKn7AVCUL0cy0p49Srip28I7sBiH2GKeOmFMx8ShY/b1Dr43a5OBZKQDNIDwhCa2OdVRw==
X-Received: by 2002:a05:600c:c092:b0:440:66a4:8d1a with SMTP id 5b1f17b1804b1-442fd950b76mr131041705e9.7.1747736800412;
        Tue, 20 May 2025 03:26:40 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f28:7c00:a95e:ac49:f2ad:ab84? (p200300d82f287c00a95eac49f2adab84.dip0.t-ipconnect.de. [2003:d8:2f28:7c00:a95e:ac49:f2ad:ab84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f38142aasm24891285e9.27.2025.05.20.03.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 03:26:39 -0700 (PDT)
Message-ID: <13f8e557-da9d-4ccf-9372-6acdc865586a@redhat.com>
Date: Tue, 20 May 2025 12:26:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/12] khugepaged: introduce khugepaged_scan_bitmap for
 mTHP support
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 ryan.roberts@arm.com, dev.jain@arm.com, corbet@lwn.net, rostedt@goodmis.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 akpm@linux-foundation.org, baohua@kernel.org, willy@infradead.org,
 peterx@redhat.com, wangkefeng.wang@huawei.com, usamaarif642@gmail.com,
 sunnanyong@huawei.com, vishal.moola@gmail.com,
 thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com,
 kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com,
 anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de,
 will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org,
 jglisse@google.com, surenb@google.com, zokeefe@google.com,
 hannes@cmpxchg.org, rientjes@google.com, mhocko@suse.com,
 rdunlap@infradead.org
References: <20250515032226.128900-1-npache@redhat.com>
 <20250515032226.128900-7-npache@redhat.com>
 <9c54397f-3cbf-4fa2-bf69-ba89613d355f@linux.alibaba.com>
 <CAA1CXcC9MB2Nw4MmGajESfH8DhAsh4QvTj4ABG3+Rg2iPi087w@mail.gmail.com>
 <ed1d1281-ece3-4d2c-8e58-aaeb436d3927@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ed1d1281-ece3-4d2c-8e58-aaeb436d3927@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20.05.25 12:09, Baolin Wang wrote:
> Sorry for late reply.
> 
> On 2025/5/17 14:47, Nico Pache wrote:
>> On Thu, May 15, 2025 at 9:20 PM Baolin Wang
>> <baolin.wang@linux.alibaba.com> wrote:
>>>
>>>
>>>
>>> On 2025/5/15 11:22, Nico Pache wrote:
>>>> khugepaged scans anons PMD ranges for potential collapse to a hugepage.
>>>> To add mTHP support we use this scan to instead record chunks of utilized
>>>> sections of the PMD.
>>>>
>>>> khugepaged_scan_bitmap uses a stack struct to recursively scan a bitmap
>>>> that represents chunks of utilized regions. We can then determine what
>>>> mTHP size fits best and in the following patch, we set this bitmap while
>>>> scanning the anon PMD. A minimum collapse order of 2 is used as this is
>>>> the lowest order supported by anon memory.
>>>>
>>>> max_ptes_none is used as a scale to determine how "full" an order must
>>>> be before being considered for collapse.
>>>>
>>>> When attempting to collapse an order that has its order set to "always"
>>>> lets always collapse to that order in a greedy manner without
>>>> considering the number of bits set.
>>>>
>>>> Signed-off-by: Nico Pache <npache@redhat.com>
>>>
>>> Sigh. You still haven't addressed or explained the issues I previously
>>> raised [1], so I don't know how to review this patch again...
>> Can you still reproduce this issue?
> 
> Yes, I can still reproduce this issue with today's (5/20) mm-new branch.
> 
> I've disabled PMD-sized THP in my system:
> [root]# cat /sys/kernel/mm/transparent_hugepage/enabled
> always madvise [never]
> [root]# cat /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled
> always inherit madvise [never]

Thanks for the easy reproducer, Baolin! It's certainly something that 
must be fixed.

> 
> And I tried calling madvise() with MADV_COLLAPSE for anonymous memory,
> and I can still see it collapsing to a PMD-sized THP.

This almost sounds like it could be converted into an easy selftest.

Baolin, do you have other ideas for easy selftests? It might be good to 
include some in the next version.

I can think of: enable only a single size, then MADV_COLLAPSE X times 
and see if it worked. etc.

-- 
Cheers,

David / dhildenb

