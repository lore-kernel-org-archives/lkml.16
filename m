Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2E428E5EF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749039739; cv=none; b=tI82d/UFhv81JL8GsLbuRRtpW6U7/DQkNtVGuTKJ3FYjUXnl9koq9WbpEWiCRe5druzWX15//uMCngmHeQ8vmyczGHxZ4s/8r06bKlSpwxgwzHdNRnX8Inl+4GXhuhVtgMqAarHlPEqeCtdR14UH8UVSzjK6KGG2dC9Z+98j64w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749039739; c=relaxed/simple;
	bh=xKcZz/sXeB78LMPUg/yXvPuhsZl80bUdTqiR6z8BPEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OOzu9WGvxEEa7bObHR1x7ltLxal+3SPl7/9rkDcGgi7S3apxDO2Ar8TLFtEHJYpBR1tej+4MOnRoXul+09E+AKmXnPbpXrdMgzNTBZ8VsH/4Fw+SKB/SOpnDwd3J2g7LZ7fpNBY0dDeVF0Qtpdvg8AdXZ3yj4kh4PqHxrIC6fhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tskw8KDw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tskw8KDw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749039736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6lfXeT0z+TCzLVyd3cGFL+scSmu9BUEdMfvBKTxjadI=;
	b=Tskw8KDw803kcHcFa0DgNUmu1nM9ds2MYdqv9HhzhqVPkEGt7AzMnQWByQHfLt2I6l/dHS
	LZjUzWOeyzSaWXZD+/ytby/Ia6ykAKemzfFZLgW9lWsp7aI89u/lZGqvHiqil+Kd12JZJu
	of2ZM5857nLZblsf0s/BtV5DHR6U210=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-D_u3bTitNpO5tO2rNxeO-g-1; Wed, 04 Jun 2025 08:22:14 -0400
X-MC-Unique: D_u3bTitNpO5tO2rNxeO-g-1
X-Mimecast-MFC-AGG-ID: D_u3bTitNpO5tO2rNxeO-g_1749039733
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4eee72969so4361321f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 05:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749039733; x=1749644533;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6lfXeT0z+TCzLVyd3cGFL+scSmu9BUEdMfvBKTxjadI=;
        b=PKOdr3epeLOax1QNS1s55DTgiRl4/HJOEMdy44/9nUecbr68fv/4c/2a5HxIqgWH+h
         B6aypTd4t3lr95AKlsSMeSJ7Su8tAejpUfjiyuyZnmsqG03F10RwV+MgmNE43tkzWOvO
         cKUG5pFniLI6boSaRD06r7wEWljYXooS/Pgsqp+NFw6y9+Lmx1/RFk1ovTkVT0sjlmUD
         ws/vKkXf8k2rtXB2IUJjNUjKIFsxLDBXi3933Hxeu5UyRv1bQHwViShxKFA6dyD9DOmY
         l6q0fHtIuj9yLfacHArN8CWRlBQDmSew3RgRwM0Fxg3Qo4TsB/Pax+M6l/+n0MczxBfa
         PjIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXokSdgwQ4VdtjfGot8n9aNEp0pZaNu6HboFxUvSIG1H52zhSh6Dqjsq2V0ciTX3YLxoYQ9O0UrKWbDHHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YztPg/QlB/L3z+cKhMXd+Z+EnQMXGpaBtdkynwFsit3qdZxL6T2
	RpAPq9jpJorQqwGvoKRSIcTRoAyurycxLz3V0gMKt9BxNjISiFkfFzylKioyrKNdL7a9S9aO64s
	+8BvvoIDSt1MGxUsdW1j1HPoX97tLXrMnFrIhE6Q67T589k3UgaJZENgeI4OIAbg7JA==
X-Gm-Gg: ASbGncvgT29jNQSLriulPHfd5UdBszJCgowuaCm9QaBvzyiMqF6NVOwWZclwySXmV/2
	e6VIi+56DDO+QeyDIdep2miJRFY4/3h2MGS5k8yvldDghM0gJzSP3+nOxSQgVgPFzmTn+m7DU9D
	BWYqpgoU3zTJ5yleGGFmGO50SDc1oR/I4bezhJskcRNRDboqNiE7ja02gwomEmHbzWkSnyQNux6
	IE2+XKpZ99D3xISoGE4rwXPFqAf1N5gq9gq+qOvXTOo4LrKTko93jonr5RfzqXZaVLcT9db7xJA
	wKz+bSMd2cMg5ZKs0G0/IknApg8Anusw95uzF0LmvVn2Jwq68bV9xWM4ZhxVDfNRH8wtmCE9Hvk
	PE0o5Y6XKw6kQLelB1EIh/oUqqRQhesYZYidJaAKe8+nC8SZ/gA==
X-Received: by 2002:a05:6000:220d:b0:3a4:f50a:bd5f with SMTP id ffacd0b85a97d-3a51d969a2dmr2111952f8f.31.1749039733403;
        Wed, 04 Jun 2025 05:22:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA9VuHpccMtdKKzp4Hz3kHndj5EggT/8SayDPYShxKlb0WORgYX8TtbaW4GT5gQgzKlo2NJw==
X-Received: by 2002:a05:6000:220d:b0:3a4:f50a:bd5f with SMTP id ffacd0b85a97d-3a51d969a2dmr2111921f8f.31.1749039732918;
        Wed, 04 Jun 2025 05:22:12 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009748fsm21291293f8f.80.2025.06.04.05.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 05:22:12 -0700 (PDT)
Message-ID: <bcb71683-22b4-41a1-9db2-b99ac7c7fdea@redhat.com>
Date: Wed, 4 Jun 2025 14:22:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/memory: ensure fork child sees coherent memory
 snapshot
To: Jann Horn <jannh@google.com>, Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, Peter Xu <peterx@redhat.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250603-fork-tearing-v1-0-a7f64b7cfc96@google.com>
 <20250603-fork-tearing-v1-1-a7f64b7cfc96@google.com>
 <aD8--plab38qiQF8@casper.infradead.org>
 <CAG48ez36t3ZaG7DsDCw1xLpdOhKVWQMjcH-hwP66Cbd8p4eTAA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAG48ez36t3ZaG7DsDCw1xLpdOhKVWQMjcH-hwP66Cbd8p4eTAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03.06.25 21:03, Jann Horn wrote:
> On Tue, Jun 3, 2025 at 8:29 PM Matthew Wilcox <willy@infradead.org> wrote:
>> On Tue, Jun 03, 2025 at 08:21:02PM +0200, Jann Horn wrote:
>>> When fork() encounters possibly-pinned pages, those pages are immediately
>>> copied instead of just marking PTEs to make CoW happen later. If the parent
>>> is multithreaded, this can cause the child to see memory contents that are
>>> inconsistent in multiple ways:
>>>
>>> 1. We are copying the contents of a page with a memcpy() while userspace
>>>     may be writing to it. This can cause the resulting data in the child to
>>>     be inconsistent.
>>> 2. After we've copied this page, future writes to other pages may
>>>     continue to be visible to the child while future writes to this page are
>>>     no longer visible to the child.
>>>
>>> This means the child could theoretically see incoherent states where
>>> allocator freelists point to objects that are actually in use or stuff like
>>> that. A mitigating factor is that, unless userspace already has a deadlock
>>> bug, userspace can pretty much only observe such issues when fancy lockless
>>> data structures are used (because if another thread was in the middle of
>>> mutating data during fork() and the post-fork child tried to take the mutex
>>> protecting that data, it might wait forever).
>>
>> Um, OK, but isn't that expected behaviour?  POSIX says:
> 
> I don't think it is expected behavior that locklessly-updated data
> structures in application code could break.
> 
>> : A process shall be created with a single thread. If a multi-threaded
>> : process calls fork(), the new process shall contain a replica of the
>> : calling thread and its entire address space, possibly including the
>> : states of mutexes and other resources. Consequently, the application
>> : shall ensure that the child process only executes async-signal-safe
>> : operations until such time as one of the exec functions is successful.
> 
> I think that is only talking about ways in which you can interact with
> libc, and does not mean that application code couldn't access its own
> lockless data structures or such.
> 
> Though admittedly that is a fairly theoretical point, since in
> practice the most likely place where you'd encounter this kind of
> issue would be in an allocator implementation or such.

I thought a bit further about that.

The thing is, that another thread in the parent might be doing something 
lockless using atomics etc. And in the parent, that thread will make 
progress as soon as fork() is done. In the child, that thread will never 
make progress again, as it is gone.

So the assumption must be that another thread possibly stalling forever 
and not making any progress will not affect the algorithm in the child.

I am not sure if that is actually the case for many lockless algorithms 
in allocators. I'm curious, do we have any examples of such algorithms, 
in particular, regarding allocators?

-- 
Cheers,

David / dhildenb

