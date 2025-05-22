Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9E428B7FA
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747919137; cv=none; b=IIYBvxiqejqL6j/O+huYpxVviIZIhd+b0f/BPpAelDognuQ8Og4+FAuwiWuMHqZMTLu7vDX03uUsoixs4SqAc7DrSyjEoWSF7yzCn+zRb7nVN0bsd80yK6/5zBDeEFXYO0Q0IwL8wdOXkwbnQPfN9f/wNEZZ7nnxNGgzDorkZS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747919137; c=relaxed/simple;
	bh=zRBvLypas/gY2DKf+0ELkWsIUf8ViLFeOZrYL9faMtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UR9fiCZ2a6qXK8WCSpmrZUX2ycSiCK+iOpzRMTYccElk7z3OMD1TbIs5QwGRWs1FQM7MNSc0UT5ZqgDbawzjR7476E0HUsW6HoRkW0sBi5lp0rpnr4ZkaGnv11bCjdT5hr5gZbhKtwMu/CPX0rvMqI/q9rvpCdoTMKfVg3fX+Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N3+zGGYW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N3+zGGYW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747919134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sqCN/v9J4BsuGPfqvCd2SaIhfYWiBB4YfmTJJ1OJUo8=;
	b=N3+zGGYWBJHYfHLxJcNaUqEzjuOe79qUre2pbizmanhILk2s0tJ4Ufdh+1CX+qqpGvs0yE
	wVUhiM7z7mfh5z9j4jM2VKtSLbS/tugA8tujlULBoB/E51V1Cb0P/st4if5ZvPV0g2I+mR
	IzRs7vUHaH4ihq+8ZbLJfhikGAHPqAs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-KBTFdwuoNR29rv3inR33Wg-1; Thu, 22 May 2025 09:05:33 -0400
X-MC-Unique: KBTFdwuoNR29rv3inR33Wg-1
X-Mimecast-MFC-AGG-ID: KBTFdwuoNR29rv3inR33Wg_1747919132
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a3591c42d4so2831813f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 06:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747919132; x=1748523932;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sqCN/v9J4BsuGPfqvCd2SaIhfYWiBB4YfmTJJ1OJUo8=;
        b=OnUwNS5jI4YRI7N9DYrYvTTLRZarFgQ7iPRiCliT6cRXsDSImah2ApNd2Q4iyizd4Z
         h0mWLJp9DktNAQrftoD4ysThGV4BFpM7CLqzJY2VuexMFuS8ftrliRxNFwKCTq9pM3Ur
         Ap6J9ZleFFL1Acl1Qn2kReMdPT68MGg3erkr1xffXOTHWhBlsmSPQD1XN7LxK/DoLFH3
         kPeyRPgZRFHb0XY7vlzorFw/DFp4gI83C1l+GA1p1GmtEYbBTOEPuKTCMISDlIwOnBgC
         SVXjFnLXL7jI9D7IZSxow0tU3Bpy1L0y5mJ/HXsOpqBZdCTbfKDyKM8UMLYQ2Zr5ZsE7
         NFKA==
X-Forwarded-Encrypted: i=1; AJvYcCXxf9nx9ypxMnhj0FjVcxoI3Xhf7p9zHaRPd9CRJLtlWP7dckPcsd0fMha4DArwwYlttanCNDwJgNj0sVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJRs+OPpvsGiDR3tKvxPCAfqem+d9gOgsvKhzQ2LrJTJzJ/2s6
	UKZabeZ190FaGfk0IKJTutXBLDGZD4LKqlnl0XbZI+/Ju20zJPI4zlawDatiMKn/ecmbhPohcWE
	6kMjo7y6sPZRc7azZi2T2YWs/CTYBZAD1ZW0NetU1EKg5adm2rMghVMjCZJpY3x9S7g==
X-Gm-Gg: ASbGncvON+n+La+XpTb6qsXAk5HcQ0yyUtWKmk/r9W/OoC0npFZH3IZwvU/5nN9zdln
	gaiAfdyzxedi0p9H7pGsktzv5LRvGT/TA+D8fB4a7EVCbWDIaxrsQF+1U7fAWLciPbV978DNJ7J
	zPLz7I+7FBDSZVELVCdULRwWJQz+r9RdfGi/aITyl0b2UHylblX+toLuPTgMA9zLS3QfzdN9FJs
	wHHQ+2y+uRb1rBUovHmknVjoM5ASG1rxkB8MghLLT3T7bvOJ4hjfpUumil5951b4CqNRLH2ID24
	KE1hNXQF9apHp+sJIiBVxSDxQePQuCmlu5Dtj3Ot+mRYeVj4xU79RfgCH6+MGJS2wWOao+jV/NG
	5bRIwcKt7+Z82pEmwTqQY6y2l+8dZFDZDC/qFJrw=
X-Received: by 2002:adf:f550:0:b0:3a3:6273:7ff4 with SMTP id ffacd0b85a97d-3a362738165mr17562329f8f.39.1747919132264;
        Thu, 22 May 2025 06:05:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjx2uHJ6VGIP1b8rqIP77TmZCQU/A7dcgWsQPfWIXn9YPhc8+WEZCDGCVT2nwkG8ORAiz1YQ==
X-Received: by 2002:adf:f550:0:b0:3a3:6273:7ff4 with SMTP id ffacd0b85a97d-3a362738165mr17562267f8f.39.1747919131724;
        Thu, 22 May 2025 06:05:31 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f22:2e00:6e71:238a:de9f:e396? (p200300d82f222e006e71238ade9fe396.dip0.t-ipconnect.de. [2003:d8:2f22:2e00:6e71:238a:de9f:e396])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7baaf2asm105398525e9.34.2025.05.22.06.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 06:05:31 -0700 (PDT)
Message-ID: <9433c2d6-200c-4320-80f3-840ca5e66f64@redhat.com>
Date: Thu, 22 May 2025 15:05:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] add process_madvise() flags to modify behaviour
To: Shakeel Butt <shakeel.butt@linux.dev>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>,
 linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, SeongJae Park <sj@kernel.org>,
 Usama Arif <usamaarif642@gmail.com>
References: <cover.1747686021.git.lorenzo.stoakes@oracle.com>
 <7tzfy4mmbo2utodqr5clk24mcawef5l2gwrgmnp5jmqxmhkpav@jpzaaoys6jro>
 <5604190c-3309-4cb8-b746-2301615d933c@lucifer.local>
 <uxhvhja5igs5cau7tomk56wit65lh7ooq7i5xsdzyqsv5ikavm@kiwe26ioxl3t>
 <e8c459cb-c8b8-4c34-8f94-c8918bef582f@lucifer.local>
 <226owobtknee4iirb7sdm3hs26u4nvytdugxgxtz23kcrx6tzg@nryescaj266u>
 <7a214bee-d184-460f-88d6-2249b9d513ba@lucifer.local>
 <djdcvn3flljlbl7pwyurpdplqxikxy6j2obj6cwcjd4znr6hwj@w3lzlvdibi2i>
 <e4d9dd63-5000-4939-b09c-c322d41a9d70@lucifer.local>
 <x6uzxhwrgamet2ftqtgzxcg7osnw62rcv4eym52nr4l6awsqgt@qivrdfpguaop>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <x6uzxhwrgamet2ftqtgzxcg7osnw62rcv4eym52nr4l6awsqgt@qivrdfpguaop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.05.25 19:39, Shakeel Butt wrote:
> On Wed, May 21, 2025 at 05:49:15PM +0100, Lorenzo Stoakes wrote:
> [...]
>>>
>>> Please let's first get consensus on this before starting the work.
>>
>> With respect Shakeel, I'll work on whatever I want, whenever I want.
> 
> I fail to understand why you would respond like that.

Relax guys ... :) Really nothing to be fighting about.

Lorenzo has a lot of energy to play with things, to see how it would 
look. I wish I would have that much energy, but I have no idea where it 
went ... (well, okay, I have a suspicion) :P

At the same time, I hope (and assume :) ) that Lorenzo will get Usama 
involved in the development once we know what we want.


To summarize my current view:

1) ebpf: most people are are not a fan of that, and I agree, at least
    for this purpose. If we were talking about making better *placement*
    decisions using epbf, it would be a different story.

2) prctl(): the unloved child, and I can understand why. Maybe now is
    the right time to stop adding new MM things that feel weird in there.
    Maybe we should already have done that with the KSM toggle (guess who
    was involved in that ;) ).

3) process_madvise(): I think it's an interesting extension, but
    probably we should just have something that applies to the whole
    address space naturally. At least my take for now.

4) new syscall: worth exploring how it would look. I'm especially
    interested in flag options (e.g., SET_DEFAULT_EXEC) and how we could
    make them only apply to selected controls.


An API prototype of 4), not necessarily with the code yet, might be 
valuable.

In general, the "always/madvise/never" policies are really horrible. We 
should instead be prioritizing who gets THPs -- and only disable them 
for selected workloads.

Because splitting THPs up because a process is not allowed to use them, 
thereby increasing memory fragmentation, is really absolutely suboptimal.

But we don't have anything better right now.

So I would hope that we can at least turn the "always/VM_HUGEPAGE" into 
a "prioritize for largest (m)THPs possible" in a distant future.

If only changing the semantics of VM_NOHUGEPAGE to mean "deprioritize 
for THPs" couldn't break userfaultfd ... :( But maybe that can be worked 
around in the future somehow (e.g., when we detect userfaultfd usage, 
not sure, ...).

-- 
Cheers,

David / dhildenb

