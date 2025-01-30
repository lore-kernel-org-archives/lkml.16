Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA9A1EF0A1
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 17:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738258905; cv=none; b=cU+55M3hvZpp2DAlduZAN1D+J0ml2FgyEzCATVLY05NLd5558ALWj6X+HtbZWkOFwcQ7L3WMLUNTgcqFBPuOeZ+UAMDpHHdeVlnAM+6npG75RcqbOuao5iHhlZmTGCGhcQbCZbxXSycjlsDbUVOO2M/FKjMncxJltvThZeBKphA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738258905; c=relaxed/simple;
	bh=54+R2sjbPzxH95p1aLqpNRduh3BFRRBTsu4iZaeg+WI=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=D5+rTKbI5CIdH8eTCDYfmxTdz6oUv1zvB94Q1T1cdnx1ZiuX3PfA1/lQSmqosPsi5pUWUZDX3ZyQBuc6BV2PzZqqQaSo+IvK4EhyyzQbYTZfa5AvBATkkF3mSur6Ddp35IEV9/Vz/CMYpFrkbWueJONWulnebRQ6ekaqeiM6/YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dc8w3AFt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dc8w3AFt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738258901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a+Tm4MMuMgMNaWCuqAB5supWyn/zNxaUSBKarskhg04=;
	b=dc8w3AFt81TzTMR7puoyqf3i7newJeO8Kp70+WRT6tKXgBQ9OBWFck2Z2WO8S+bba3HzeO
	HHlAzeoPnsLDNNLUB6YI0ND0X3GBgkgJXMCoY5PzUpC/+aJzCNRdSk4LmrU0AS3kBa4yGc
	qknW/2t8KcEtqa33sVTiNQ4AsHmKpLk=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-xCczzswzMHulWAf_3oAYMg-1; Thu, 30 Jan 2025 12:41:38 -0500
X-MC-Unique: xCczzswzMHulWAf_3oAYMg-1
X-Mimecast-MFC-AGG-ID: xCczzswzMHulWAf_3oAYMg
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3eb9278f4daso760138b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 09:41:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738258894; x=1738863694;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+Tm4MMuMgMNaWCuqAB5supWyn/zNxaUSBKarskhg04=;
        b=m1IiXeQ70tu1nupulOV+cqcUM8l8Xq36kRs0qiCAQZZJTCWNJXPBUwlb8cByrsEFCV
         UNe49WOMZbVx87LdPIUzXIiALlkrLsVShi+DCOx1M0XnBGrYYOwzkd7YYE/4lKKN2zHO
         HfbXKRQZa4Yq1RZzbtVLTppcOZmst6qVsweYcaFgzmtmRkFCKiXzbrJwsdwD82cdtoZk
         UAospDzz8ULQNa6WgT+9A+KHmc4oOWTnpXXwp6Rl0TZLptAIam+uVKNThmHkga4ZsL73
         Zc9v8imP7Z6LKfxpV7R6wEOLxBPsvmm37+RmqJIH9Wxe4NgpBGWZoGHLPSuW5wZ9CFM7
         7koQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD2AAmyJpMwOL3/mnEKWlPOxIFwUC9F/IpKwtDDMNmw0EYqF/K0vOqZbqJRZrWXJ+YYoZx2VX4LKVbhfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOFmJmphEQRmqzaaPmhNytTYdqrQjCFFVjIytxSqHUeYViJ9G9
	zwgfu6+eidrQK2gHC7IllVzQJwMKV9Vlr5sYl/sSA8fn9p9XXdqHnyAJc/j2je0ngKgplPGHHKh
	30hecACO0Mr1Lj+4cgaUcAayCravui1x19DPiudWQlI+W2MDajdSalVvkWSaS40/GSqX06Xsi
X-Gm-Gg: ASbGncuNUwYLDsDyJae92e+5k2LL9g8HYb7smhURw1zPJfe8PN2KGJmFBReSn8dR38H
	ZqvvnhqOuoWk39ft/cnIhAL7xEPtXHJcS+P/S7IvpfKbINAaKmCUqQ5WXWskY88fCeuS09urOmr
	sKg7IEc+xcIhCuQw3AXk6HkZSRnzIgrBdQ2UdWTAgF6rWxwt5KwTA6+0pbWs1ZzebWYgo5CBb4a
	uuxxRZV9etv/FDAyXzn1fNB/hEzxsoCKHfK9Hu9ZxSdFw7L2itCQHKaxFVrabweA+Q5w4y4QXdM
	Oq5Tk9TdE3klx5ndeumj7vIqiYpETleIR0RPCthf8tlCskcmFRM=
X-Received: by 2002:a05:6808:f03:b0:3e5:f656:dd19 with SMTP id 5614622812f47-3f323a59d92mr5783984b6e.19.1738258894195;
        Thu, 30 Jan 2025 09:41:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGKmbRw3DSmtj5+GCkf1IDjlUIoa6aTSZ6+uzH9hTvj6m3TrzQxzX+gu+fF8o1zU4D3OZgNQ==
X-Received: by 2002:ac8:5f88:0:b0:467:4f0a:1b5d with SMTP id d75a77b69052e-46fd0b68880mr124572611cf.42.1738258881566;
        Thu, 30 Jan 2025 09:41:21 -0800 (PST)
Received: from ?IPV6:2601:408:c101:1d00:6621:a07c:fed4:cbba? ([2601:408:c101:1d00:6621:a07c:fed4:cbba])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0c62d4sm8874501cf.17.2025.01.30.09.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 09:41:20 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <8785134d-3012-42c1-a67c-b64862d89fc5@redhat.com>
Date: Thu, 30 Jan 2025 12:41:19 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm, memcg: introduce memory.high.throttle
To: Shakeel Butt <shakeel.butt@linux.dev>, Waiman Long <llong@redhat.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Michal Hocko
 <mhocko@suse.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 Peter Hunt <pehunt@redhat.com>
References: <20250129191204.368199-1-longman@redhat.com>
 <Z5s1DG2YVH78RWpR@tiehlicka>
 <211b394b-3b9a-4872-8c07-b185386487d3@redhat.com>
 <Z5uxVzFf7Pk7yk9f@google.com>
 <a309f420-4a25-4cf5-b6f0-750059c8467c@redhat.com>
 <eyl6rcqdwinppl4cyvqrli5pqugxdhrsgpvu64oomgvqd7m7c4@q4gz5v2zovwe>
Content-Language: en-US
In-Reply-To: <eyl6rcqdwinppl4cyvqrli5pqugxdhrsgpvu64oomgvqd7m7c4@q4gz5v2zovwe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/30/25 12:32 PM, Shakeel Butt wrote:
> On Thu, Jan 30, 2025 at 12:19:38PM -0500, Waiman Long wrote:
>> On 1/30/25 12:05 PM, Roman Gushchin wrote:
>>> On Thu, Jan 30, 2025 at 10:05:34AM -0500, Waiman Long wrote:
>>>> On 1/30/25 3:15 AM, Michal Hocko wrote:
>>>>> On Wed 29-01-25 14:12:04, Waiman Long wrote:
>>>>>> Since commit 0e4b01df8659 ("mm, memcg: throttle allocators when failing
>>>>>> reclaim over memory.high"), the amount of allocator throttling had
>>>>>> increased substantially. As a result, it could be difficult for a
>>>>>> misbehaving application that consumes increasing amount of memory from
>>>>>> being OOM-killed if memory.high is set. Instead, the application may
>>>>>> just be crawling along holding close to the allowed memory.high memory
>>>>>> for the current memory cgroup for a very long time especially those
>>>>>> that do a lot of memcg charging and uncharging operations.
>>>>>>
>>>>>> This behavior makes the upstream Kubernetes community hesitate to
>>>>>> use memory.high. Instead, they use only memory.max for memory control
>>>>>> similar to what is being done for cgroup v1 [1].
>>>>> Why is this a problem for them?
>>>> My understanding is that a mishaving container will hold up memory.high
>>>> amount of memory for a long time instead of getting OOM killed sooner and be
>>>> more productively used elsewhere.
>>>>>> To allow better control of the amount of throttling and hence the
>>>>>> speed that a misbehving task can be OOM killed, a new single-value
>>>>>> memory.high.throttle control file is now added. The allowable range
>>>>>> is 0-32.  By default, it has a value of 0 which means maximum throttling
>>>>>> like before. Any non-zero positive value represents the corresponding
>>>>>> power of 2 reduction of throttling and makes OOM kills easier to happen.
>>>>> I do not like the interface to be honest. It exposes an implementation
>>>>> detail and casts it into a user API. If we ever need to change the way
>>>>> how the throttling is implemented this will stand in the way because
>>>>> there will be applications depending on a behavior they were carefuly
>>>>> tuned to.
>>>>>
>>>>> It is also not entirely sure how is this supposed to be used in
>>>>> practice? How do people what kind of value they should use?
>>>> Yes, I agree that a user may need to run some trial runs to find a proper
>>>> value. Perhaps a simpler binary interface of "off" and "on" may be easier to
>>>> understand and use.
>>>>>> System administrators can now use this parameter to determine how easy
>>>>>> they want OOM kills to happen for applications that tend to consume
>>>>>> a lot of memory without the need to run a special userspace memory
>>>>>> management tool to monitor memory consumption when memory.high is set.
>>>>> Why cannot they achieve the same with the existing events/metrics we
>>>>> already do provide? Most notably PSI which is properly accounted when
>>>>> a task is throttled due to memory.high throttling.
>>>> That will require the use of a userspace management agent that looks for
>>>> these stalling conditions and make the kill, if necessary. There are
>>>> certainly users out there that want to get some benefit of using memory.high
>>>> like early memory reclaim without the trouble of handling these kind of
>>>> stalling conditions.
>>> So you basically want to force the workload into some sort of a proactive
>>> reclaim but without an artificial slow down?
> I wouldn't call it a proactive reclaim as reclaim will happen
> synchronously in allocating thread.
>
>>> It makes some sense to me, but
>>> 1) Idk if it deserves a new API, because it can be relatively easy implemented
>>>     in userspace by a daemon which monitors cgroups usage and reclaims the memory
>>>     if necessarily. No kernel changes are needed.
>>> 2) If new API is introduced, I think it's better to introduce a new limit,
>>>     e.g. memory.target, keeping memory.high semantics intact.
>> Yes, you are right about that. Introducing a new "memory.target" without
>> disturbing the existing "memory.high" semantics will work for me too.
>>
> So, what happens if reclaim can not reduce usage below memory.target?
> Infinite reclaim cycles or just give up?

Just give up in this case. It is used mainly to reduce the chance of 
reaching max and cause OOM kill.

Cheers,
Longman

