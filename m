Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0571A1EB5D8
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748596236; cv=none; b=tuexOkb+M0uaP/QKBq0Ez9HfxbU6tH1FRxf4lx04iwPn3KHXfGOrIYoulYcnN7jRFOwgpJobxMmiRJHKIKgzK5S7rbDQmGsIEG+AMOIZq5GDRFXNRFcZF3YkChWWa2WKBnDyMhv/XFMmFQBk5g8wEUjknvBEpMBkDaydVlgI3as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748596236; c=relaxed/simple;
	bh=i2n+Zfvh00SWR94z0VELlIDX9Y7OMV+2vDHKYzIV9ms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A7H/J9WRpJw93vq59aDh7ifuMw+RdqOvdcz/L7a2JH8Z9dcAJWcrjnqq79fwRuYfxhb1eSvsQ5DS+vG4T8YkP5Xd71RtY//3oUPYdN7+S7ZZ21my1XKcwnTw9+pSoxCdRtCtAEd16VrzpeyxjKz5avPbvdwbb7Q0CTXLwByCq30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=chvmN4hN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="chvmN4hN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748596233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Bxb0W2Gh1ooa50suLf89Op86r0jsbF9L9U6sQJKzyW0=;
	b=chvmN4hNQO6ZKHPzW6rONRJchTGWdFXmk4AsKebG9cN2hH8yJlb2FOpFSnukxNzYBcs1qh
	gW06hpGlZFwdi9KSZiksBQqxVlClWDXkWEt7QXBBZQD88OHHXNoFWkhQ6DI5GmI6/YzgKV
	JKBqkkEuX5HApigHOXodSaAv1oSuEyw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-1IRZmZw5N9KxMv_CCmPNJw-1; Fri, 30 May 2025 05:10:32 -0400
X-MC-Unique: 1IRZmZw5N9KxMv_CCmPNJw-1
X-Mimecast-MFC-AGG-ID: 1IRZmZw5N9KxMv_CCmPNJw_1748596231
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-440667e7f92so12445935e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748596231; x=1749201031;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bxb0W2Gh1ooa50suLf89Op86r0jsbF9L9U6sQJKzyW0=;
        b=jpKc9U+zhLhndjHOOobTy3wjulsyUYNWXEldZrduR48+pfglkI9HnzTpjMpVxmMz92
         PtAsXW9i/Ty8bTA1W9VMC25VRoTQub+KiFTor+YViP2lniMfEiMz9D+C+C9OvrqKY+1n
         w1fbCD5BktGotBoaxtDD7b6M2/huPUBLT3/lygqw2fVNiyu7rK3+OCxp9p466HakSJ/v
         +SADuKXPx6d+09gy3nJQzns8Z7qtzi1FoQPmwDgwreoA5GeupZPckp4sMiJSOD12LgHg
         J/AI/Jgd1ifzUA3RnmD5hbj+HHDTPCQOXtETjRy8rLgmOpU3AbH6qDSqtiJXgRop1AmJ
         pq5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV48gxVdzwRZBhRRgW4EnFxx1d6xdc6teGima1C2fwvjFJmPl08XKxKoxP7j8Y+rHDPsX7HuHfc9KeSwXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJq6qToBC71ATF8d9ewi0o8gtLVaqOw/OSs+46hz1iW3IMtJA4
	WAWXn9yA9V/a6pEW1446cKL1Oskd0+qBmGl8JRqW3ECL4TaZ2Q/Zm2c0PL8M8m4GrocTTMIzCHw
	Ho4vvhALrDntkzCO/vPeZUKWAznTqgA0O2aQ7m7ygJPvK98SzVjvCXL4CnQ+oezWomg==
X-Gm-Gg: ASbGnctjLO1z8y4Pe3PIigotVREZxhIjyiSzeIQ8NguXfcWAMa+uL9bV/BlXa6rgRkY
	90iZ8UinnZxAGSM4vEQulL2r+CWfFVUmAyzWGz+oUhr7XygJ1QJ7PRCnFjDOWKb9WU5EsfqjSBz
	VlrFL7UfTwVJk+Ssfq/1ojubRI3rphRTbOrS4e40wukmRPoYJ/X9gzsbyD956y4362gIBVqghKc
	VUEV4W1kDIVr6zj4463uoZEqWPxjQGTjEPw046wYRc8N2v1E2jClKGjGhrGhuYe4LK61JP/x06R
	hxg8s9EA2yBNWMFzkOII5hF7nmGcR5ir7pfHA4nGoVh8ZmYKlhC3lM1cY/dyghdxKLvmPHvcExz
	zGxW7MkMJOnUWBpeDx4T3UZDekFswysHP1ZTKF8w=
X-Received: by 2002:a05:600c:1c89:b0:450:d4ad:b7de with SMTP id 5b1f17b1804b1-450d651b4edmr28818185e9.3.1748596231504;
        Fri, 30 May 2025 02:10:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfflLrqrEXjnPZqbpip1MsBqjhVJHcWObTFxT8759BVjb+hyECfogpcPX4XQvCJ38zt84oEA==
X-Received: by 2002:a05:600c:1c89:b0:450:d4ad:b7de with SMTP id 5b1f17b1804b1-450d651b4edmr28817735e9.3.1748596231027;
        Fri, 30 May 2025 02:10:31 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee? (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de. [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c738sm4174668f8f.24.2025.05.30.02.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 02:10:30 -0700 (PDT)
Message-ID: <abe284a4-db5c-4a5f-b2fd-e28e1ab93ed1@redhat.com>
Date: Fri, 30 May 2025 11:10:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] fix MADV_COLLAPSE issue if THP settings are disabled
To: Ryan Roberts <ryan.roberts@arm.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1748506520.git.baolin.wang@linux.alibaba.com>
 <05d60e72-3113-41f0-b81f-225397f06c81@arm.com>
 <f3dad5b5-143d-4896-b315-38e1d7bb1248@redhat.com>
 <9b1bac6c-fd9f-4dc1-8c94-c4da0cbb9e7f@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <9b1bac6c-fd9f-4dc1-8c94-c4da0cbb9e7f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.05.25 10:59, Ryan Roberts wrote:
> On 30/05/2025 09:44, David Hildenbrand wrote:
>> On 30.05.25 10:04, Ryan Roberts wrote:
>>> On 29/05/2025 09:23, Baolin Wang wrote:
>>>> As we discussed in the previous thread [1], the MADV_COLLAPSE will ignore
>>>> the system-wide anon/shmem THP sysfs settings, which means that even though
>>>> we have disabled the anon/shmem THP configuration, MADV_COLLAPSE will still
>>>> attempt to collapse into a anon/shmem THP. This violates the rule we have
>>>> agreed upon: never means never. This patch set will address this issue.
>>>
>>> This is a drive-by comment from me without having the previous context, but...
>>>
>>> Surely MADV_COLLAPSE *should* ignore the THP sysfs settings? It's a deliberate
>>> user-initiated, synchonous request to use huge pages for a range of memory.
>>> There is nothing *transparent* about it, it just happens to be implemented using
>>> the same logic that THP uses.
>>>
>>> I always thought this was a deliberate design decision.
>>
>> If the admin said "never", then why should a user be able to overwrite that?
> 
> Well my interpretation would be that the admin is saying never *transparently*
> give anyone any hugepages; on balance it does more harm than good for my
> workloads. The toggle is called transparent_hugepage/enabled, after all.

I'd say it's "enabling transparent huge pages" not "transparently 
enabling huge pages". After all, these things are ... transparent huge 
pages.

But yeah, it's confusing.

> 
> Whereas MADV_COLLAPSE is deliberately applied to a specific region at an
> opportune moment in time, presumably because the user knows that the region
> *will* benefit and because that point in the execution is not sensitive to latency.

Not sure if MADV_HUGEPAGE is really *that* different.

> 
> I see them as logically separate.
> 
>>
>> The design decision I recall is that if VM_NOHUGEPAGE is set, we'll ignore that.
>> Because that was set by the app itself (MADV_NOHUEPAGE).
> 
> Hmm, ok. My instinct would have been the opposite; MADV_NOHUGEPAGE means "I
> don't want the risk of latency spikes and memory bloat that THP can cause". Not
> "ignore my explicit requests to MADV_COLLAPSE".
> 
> But if that descision was already taken and that's the current behavior then I
> agree we have an inconsistency with respect to the sysfs control.
> 
> Perhaps we should be guided by real world usage - AIUI there is a cloud that
> disables THP at system level today (Google?).
The use case I am aware of for disabling it for debugging purposes. 
Saved us quite some headake in the past at customer sites for 
troubleshooting + workarounds ...


Let's take a look at the man page:

MADV_COLLAPSE is  independent  of  any  sysfs  (see  sysfs(5))  setting 
under  /sys/kernel/mm/transparent_hugepage, both in terms of determining 
THP eligibility, and allocation semantics.

I recall we discussed that it should ignore the max_ptes_none/swap/shared.

But "any" setting would include "enable" ...

-- 
Cheers,

David / dhildenb

