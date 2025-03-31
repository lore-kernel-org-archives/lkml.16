Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8956A2144B7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447447; cv=none; b=S/V9Oz7zOkt/PvlBlKRfJv/OKYnByYQy4LkoOEbaf+eOtVSGuRjLEWAaq4lLWPlwKraxdQszFYH6hZUEoQ/1+2gjYzunIi4R84pqBf98YA5ehJl7daJumq2X5+Yz2JSfu31TlSaPgV+3Y4l9tM1Y5eLhGOiwivZCClLDVveY/5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447447; c=relaxed/simple;
	bh=YmflCkYghetjuTqEta5HLi3//mMy8HqvUxvXAbpe6nE=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sbyZSCZLmVDchqkR39CDNtwQSfQYYgpv8Seu52tCkAQaEMy8c7UP6cyfxjo+ZzbFND1OtyRnVH3VGTsQid6XiIXe3D9tASgsf2e+77yIuM4c/qd+RRytomhRpIIHQ+P2vx2YSaOXKv02tBbM0MNYTFelJ/OjTfhoWCXNr8tSM3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TPHStNMh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TPHStNMh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743447444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4uxGqI8XHlSWUG0vUbjqkpMVF/NlTmqGXy4qbepua0s=;
	b=TPHStNMhhYuoTUzXUqEKhqVrCxZn27dFKvkMRZ4YStNKu+TVaQbRYCqqu49Ozomz4J5wdj
	MEaM4E6AYX+sskFFQQJ5c5f7HLa33WLv8reNYqr/qjYdifngz+HTFIrhCMP5/2SifgfsFH
	F6aNAccUGr1YJrXo/ifz+VDqo44bhR0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-F8Pp2PZLOKKNGVFXJKpAQA-1; Mon, 31 Mar 2025 14:57:23 -0400
X-MC-Unique: F8Pp2PZLOKKNGVFXJKpAQA-1
X-Mimecast-MFC-AGG-ID: F8Pp2PZLOKKNGVFXJKpAQA_1743447442
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c9abdbd3so467768485a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 11:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743447442; x=1744052242;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4uxGqI8XHlSWUG0vUbjqkpMVF/NlTmqGXy4qbepua0s=;
        b=vwTGQMJMPZEWBAVU6MbzCsSyeVDK5UUt1xgd6mN0hl/alIFhAEwcRpSjF1qhlHA6Jp
         6yZUDR3T7GwV/mQkRv92fH3rbv79GWfjB2Fsqn1yWiq92s+zBcV4scC34EjNvofbDZOG
         JJNmx5oLP+iZDhx4MCmtrPLvM371xa88eoXEaZxV0tL+0l7F9bphyVDnVhqD5Oiawzgf
         oIWHwMMfXABKvUgw+7uDiTH4cvOPk1n7ODDURDmdSkOUj4+3irHJTec2qUMdBAyLZ4Ox
         cOttxeZVFCvIX4t0qwQRn0BulXaB8Jq08a9U+FdHDhQRO5FC0ZnZEr/5A170xADyiaK1
         Rjbg==
X-Forwarded-Encrypted: i=1; AJvYcCWbvytJG1SjlAoRyqKqXdWa7S7foSqsKjoHsMK6uKLPFr0GrXMpMQsx8l9j3pQAWJsNhNmwOsGQ50rcyIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAFeGJNljsLZRcVunohlaYAKfKPNkY0Mv6CAZ5hl0SDYslvhSA
	0HUdohCj4IYpwoadD3f7Or13hHng8CKxcU6Rhqed7sdMqT/juHmX7axhEi/gs386h5V6pQTVSrr
	xTQFYOZQ8uGfIY50Fvu6NsBMLTNXk5d8mN4/fiU0FAiFjkS2ee04lrJywqrnfWw==
X-Gm-Gg: ASbGnctODZttBBiD8L5Y6YC9P5+iDv/GNMATawob8NMf+xQoLOnwXijyqqdXI9gZQ9a
	xXqbzwuv+8xuN2Lrsk5Pvu5dXHv82d3gnTmYz+PAA/KjDamYaFriaD2r/2QqHiiJTanF1csUsN5
	lQx7DqH6uVxUCNJ2S5PADeFeZd1xqSqyVWg6/dtBPMqZNKIzWarhOAoO112Zf9U8eGyECP/9YtU
	Pv4MdRv0tXSR9oHFesGIMB8WHzZDcpRjYKOV4kUF5QPVq6ImMaHFc6mMP8Z1EVeAEuaByojVSd6
	qCiIcHwxXtR9/A2+Ezsn5McB7M/cRPuLF2gbgZs7/DRRWLUBmeCasJNxXGlXkg==
X-Received: by 2002:a05:620a:2992:b0:7c5:4463:29aa with SMTP id af79cd13be357-7c69087def9mr1592718585a.40.1743447442656;
        Mon, 31 Mar 2025 11:57:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESQYDsfnezfjUkx7Y5slcu+4vSypZZz7O52dCEgLcLpGd4fd2d2RSisyzUxxCGuahqVd1Ibw==
X-Received: by 2002:a05:620a:2992:b0:7c5:4463:29aa with SMTP id af79cd13be357-7c69087def9mr1592715585a.40.1743447442363;
        Mon, 31 Mar 2025 11:57:22 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f76838ccsm528423685a.40.2025.03.31.11.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 11:57:21 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <69592dc7-5c21-485b-b00e-1c34ffb4cee8@redhat.com>
Date: Mon, 31 Mar 2025 14:57:20 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lockdep: Speed up lockdep_unregister_key() with expedited
 RCU synchronization
To: paulmck@kernel.org, Waiman Long <llong@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Peter Zijlstra <peterz@infradead.org>, Breno Leitao <leitao@debian.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, aeh@meta.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, jhs@mojatatu.com,
 kernel-team@meta.com, Erik Lundgren <elundgren@meta.com>
References: <Z-Il69LWz6sIand0@Mac.home>
 <934d794b-7ebc-422c-b4fe-3e658a2e5e7a@redhat.com>
 <Z-L5ttC9qllTAEbO@boqun-archlinux>
 <f1ae824f-f506-49f7-8864-1adc0f7cbee6@redhat.com>
 <Z-MHHFTS3kcfWIlL@boqun-archlinux>
 <1e4c0df6-cb4d-462c-9019-100044ea8016@redhat.com> <Z-OPya5HoqbKmMGj@Mac.home>
 <df237702-55c3-466b-b51e-f3fe46ae03ba@redhat.com>
 <Z-rQNzYRMTinrDSl@boqun-archlinux>
 <9f5b500a-1106-4565-9559-bd44143e3ea6@redhat.com>
 <35039448-d8e8-4a7d-b59b-758d81330d4b@paulmck-laptop>
Content-Language: en-US
In-Reply-To: <35039448-d8e8-4a7d-b59b-758d81330d4b@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/31/25 2:33 PM, Paul E. McKenney wrote:
> On Mon, Mar 31, 2025 at 01:33:22PM -0400, Waiman Long wrote:
>> On 3/31/25 1:26 PM, Boqun Feng wrote:
>>> On Wed, Mar 26, 2025 at 11:39:49AM -0400, Waiman Long wrote:
>>> [...]
>>>>>> Anyway, that may work. The only problem that I see is the issue of nesting
>>>>>> of an interrupt context on top of a task context. It is possible that the
>>>>>> first use of a raw_spinlock may happen in an interrupt context. If the
>>>>>> interrupt happens when the task has set the hazard pointer and iterating the
>>>>>> hash list, the value of the hazard pointer may be overwritten. Alternatively
>>>>>> we could have multiple slots for the hazard pointer, but that will make the
>>>>>> code more complicated. Or we could disable interrupt before setting the
>>>>>> hazard pointer.
>>>>> Or we can use lockdep_recursion:
>>>>>
>>>>> 	preempt_disable();
>>>>> 	lockdep_recursion_inc();
>>>>> 	barrier();
>>>>>
>>>>> 	WRITE_ONCE(*hazptr, ...);
>>>>>
>>>>> , it should prevent the re-entrant of lockdep in irq.
>>>> That will probably work. Or we can disable irq. I am fine with both.
>>> Disabling irq may not work in this case, because an NMI can also happen
>>> and call register_lock_class().
>> Right, disabling irq doesn't work with NMI. So incrementing the recursion
>> count is likely the way to go and I think it will work even in the NMI case.
>>
>>> I'm experimenting a new idea here, it might be better (for general
>>> cases), and this has the similar spirit that we could move the
>>> protection scope of a hazard pointer from a key to a hash_list: we can
>>> introduce a wildcard address, and whenever we do a synchronize_hazptr(),
>>> if the hazptr slot equal to wildcard, we treat as it matches to any ptr,
>>> hence synchronize_hazptr() will still wait until it's zero'd. Not only
>>> this could help in the nesting case, it can also be used if the users
>>> want to protect multiple things with this simple hazard pointer
>>> implementation.
>> I think it is a good idea to add a wildcard for the general use case.
>> Setting the hazptr to the list head will be enough for this particular case.
> Careful!  If we enable use of wildcards outside of the special case
> of synchronize_hazptr(), we give up the small-memory-footprint advantages
> of hazard pointers.  You end up having to wait on all hazard-pointer
> readers, which was exactly why RCU was troublesome here.  ;-)

If the plan is to have one global set of hazard pointers for all the 
possible use cases, supporting wildcard may be a problem. If we allow 
different sets of hazard pointers for different use cases, it will be 
less an issue. Anyway, maybe we should skip wildcard for the current 
case so that we have more time to think through it first.

Cheers,
Longman

