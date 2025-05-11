Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4A91CA84
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 08:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746951362; cv=none; b=WCgi89cvtGPZp7mxSjtBHT0Z6SzEyK0CD9ZwOiPiOw47HlxvNffbIsSSI3XtNKUv9LwqDvog31XvQaB/I6GRZsIsh9pMFKtMwOyhQrWWQJS0FlRqUaYieDSTgMkfk5nCfUSITwOd26uaWnOjfLVx7IqlYfCQ0tVIV/P5pCIklJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746951362; c=relaxed/simple;
	bh=iJcRLw+ViTaEVIkVsVF3qgi6tNQk7oYYkLUU6Arm0G4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l5tTyaUGUxghWOBh/zgpc7dab01S+XhxL9q+ptwMAt3Rl9z+WPAN32PU3Qb4pB/DdN8gtPT4l+y9vLsQqczoD6G2Eg1F86cOP0Hqt3FqraeU/TW9fXu6/CoB0jxVi2Y3JrUbHu2N35Xnpan7h+PvFE0D2UZBKG+9K3vlr6jftXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TbrmdW0v; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TbrmdW0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746951359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cdRks2TFRXcxDmZFssmR+0X00WKSP192jBaOaP41JiM=;
	b=TbrmdW0vFkTbrxsHBC20JeUGVsUn27+PD3PU6qAemQTM4HdKOQ/C+88mOV6Y2YGqSxlJE/
	d9zkyTSPR+4sjcNjdyB64OisprbrQDPi6Wb05WhX7PDKyz86ALTqghZ+TyXVTH125RZ1KW
	vFaaEjONNirNcPBEWVjH1h6HjJoR9nA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-70iyG_KAOf2P8L8zEEyY5g-1; Sun, 11 May 2025 04:15:57 -0400
X-MC-Unique: 70iyG_KAOf2P8L8zEEyY5g-1
X-Mimecast-MFC-AGG-ID: 70iyG_KAOf2P8L8zEEyY5g_1746951356
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a0bd786a53so1346211f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 01:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746951356; x=1747556156;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cdRks2TFRXcxDmZFssmR+0X00WKSP192jBaOaP41JiM=;
        b=Ofcc0CBZqrl9VBuWQW40o99YiLDeC0rCEmwoO4nl/bUVKRVruWZ1IBqDKSkhRtsYhn
         6EdWV0x+aVVjRI3wV+edn8niVt8cQFxgJVUpolHd9ieVLLlVz9jxfsn63fqQuAD9rw5q
         6VqFPOK0/lF9mDnU6h36PKx823t4RpCY68tkm+lApDxEdYqv+6wOcsF7SuL1cSEZKfWB
         Tb/HgV2V0m+0HSwMc1lh7WKVMEj7Mlsj99HgHVJa2j3QSm3XWUwmBxs2ZfoukY8wVJJ0
         6TRhixpOOI/ToVwkwZl6PmNToXbd+PJ0aeFYmf242+a3jna+PDPNBE45y6n6SYaT2nrX
         CGaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHZraOymfSXOIpQ8HAlrOtaaWmKu/HUiPGXKNGOyyZFwiFddzW8CSI+J67BJPTOvobhxliIH/JpK5c8ZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsnPIMutq0mmKAnSCxBAaH07UFHMpav1ULlFASN+yW+09hjlVA
	YKpABvYTcS3FR+eBnSEEfIiIiaxJ2V3geQR0qFt8aZkeeK5scr2IbT9jVnEN1WZLYlkVE8wi3y0
	vJiktT6ag9XymEknGDkOyyBolTIhEWHIY8x3TdcBOS2ls+AXIaV9Z7CaU4w8FTw==
X-Gm-Gg: ASbGncuCBVRCAWHeU+FD2AZE+KpOtAxqwbsymbfharxdIePPNn4or/MdsLRm7X1eCbe
	yAcyFko+3tTKNycLJL6kDKD9V/CRZIb0+crOSZtjbGY4+GN413YZkybHH9JRCwu5iK48r357UN7
	+XqGyB2kFCxVMunFQ+iNHAvQhnei6dGyS9wqgGnKg1mGMYImZAhbzf5Ku6X/s0glvPyzhtT4Fvw
	Op7g8KVPh6GZPHBGpZoRAT2aBi9m7r0ugHPl52K/2WzeM46JequKQNayLNdSTZ22bz3j0QqBsj+
	g1vPiOXxTTwzEJe6NoDLlMIOA3Jq8CnPWQ0NEti+mrwor+xKTb/VWRFCtQ1lTIfQV5xNbSKKtNg
	2sR+le7QiasYyESD2nDqeWmzTpqKITwKC+567kyE=
X-Received: by 2002:a05:6000:220d:b0:3a0:b940:ee11 with SMTP id ffacd0b85a97d-3a1f64a3225mr7170706f8f.49.1746951356329;
        Sun, 11 May 2025 01:15:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHONt4SVXFb0wYxDvcHsxFz+l7AiOkj0XMlySwwmAuEv821HC0Q2KBjRsUp1t5X/XT8POfMZw==
X-Received: by 2002:a05:6000:220d:b0:3a0:b940:ee11 with SMTP id ffacd0b85a97d-3a1f64a3225mr7170693f8f.49.1746951355969;
        Sun, 11 May 2025 01:15:55 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1e:c400:a7bb:d0cb:2506:c714? (p200300d82f1ec400a7bbd0cb2506c714.dip0.t-ipconnect.de. [2003:d8:2f1e:c400:a7bb:d0cb:2506:c714])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f28f7sm8464596f8f.41.2025.05.11.01.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 May 2025 01:15:55 -0700 (PDT)
Message-ID: <913bdc9b-a3c2-401c-99d0-18799850db9e@redhat.com>
Date: Sun, 11 May 2025 10:15:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] prctl: allow overriding system THP policy to always
To: Zi Yan <ziy@nvidia.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Yafang Shao <laoar.shao@gmail.com>,
 Usama Arif <usamaarif642@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 shakeel.butt@linux.dev, riel@surriel.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <96eccc48-b632-40b7-9797-1b0780ea59cd@gmail.com>
 <8E3EC5A4-4387-4839-926F-3655188C20F4@nvidia.com>
 <279d29ad-cbd6-4a0e-b904-0a19326334d1@gmail.com>
 <CALOAHbCxhL=VM=E5UzNvQYZsrF4zdcQ1-49iEJ1UYvLsurtxCw@mail.gmail.com>
 <ebfca8f2-40e5-485a-a060-621aa3a22376@gmail.com>
 <CALOAHbDesDGyokKFSSr3hA1_WnFciQPXe_nboPq9v8OUPLv47g@mail.gmail.com>
 <20250509051328.GF323143@cmpxchg.org>
 <CALOAHbA617417UtcwMBJ9Zm_8BbAth57=ngN=tknw8h7nvCwNw@mail.gmail.com>
 <41e60fa0-2943-4b3f-ba92-9f02838c881b@redhat.com>
 <CALOAHbAvQDee2=5vsDqj77g5gAGdGpXFBbsC7tpKnCYEDZS3vw@mail.gmail.com>
 <20250509164654.GA608090@cmpxchg.org>
 <f691d2e0-5919-4581-8a24-1b543d798ae4@redhat.com>
 <8A18FB29-CC41-456F-A80E-807984691F0F@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <8A18FB29-CC41-456F-A80E-807984691F0F@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.05.25 01:34, Zi Yan wrote:
> On 9 May 2025, at 18:42, David Hildenbrand wrote:
> 
>>>>>> - madvise
>>>>>>     The sysadmin gently encourages the use of THP, but it is only
>>>>>> enabled when explicitly requested by the application.
>>>
>>> And this "user mode" or "manual mode", where applications self-manage
>>> which parts of userspace they want to enroll.
>>>
>>> Both madvise() and unprivileged prctl() should work here as well,
>>> IMO. There is no policy or security difference between them, it's just
>>> about granularity and usability.
>>>
>>>>>> - never
>>>>>>      The sysadmin discourages the use of THP, and "its use is only permitted
>>>>>> with explicit approval" .
>>>
>>> This one I don't quite agree with, and IMO conflicts with what David
>>> is saying as well.
>>
>> Yeah ... "never" does not mean "sometimes" in my reality :)
>>
>>>
>>>>> "never" so far means "no thps, no exceptions". We've had serious THP
>>>>> issues in the past, where our workaround until we sorted out the issue
>>>>> for affected customers was to force-disable THPs on that system during boot.
>>>>
>>>> Right, that reflects the current behavior. What we aim to enhance is
>>>> by adding the requirement that "its use is only permitted with
>>>> explicit approval."
>>>
>>> I think you're conflating a safety issue with a security issue.
>>>
>>> David is saying there can be cases where the kernel is broken, and
>>> "never" is a production escape hatch to disable the feature until a
>>> kernel upgrade for the fix is possible. In such a case, it doesn't
>>> make sense to override this decision based on any sort of workload
>>> policy, privileged or not.
>>>
>>> The way I understand you is that you want enrollment (and/or
>>> self-management) only for blessed applications. Because you don't
>>> generally trust workloads in the wild enough to switch the global
>>> default away from "never", given the semantics of always/madvise.
>>
>> Assuming "never" means "never" and "always" means "always" ( crazy, right? :) ), could be make use of "madvise" mode, which essentially means "VM_HUGEPAGE" takes control?
>>
>> We'd need
>>
>> a) A way to enable THP for a process. Changing the default/vma settings to VM_HUGEPAGE as discussed using a prctl could work.
>>
>> b) A way to ignore VM_HUGEPAGE for processes. Maybe the existing prctl to force-disable THPs could work?
> 
> This means process level control overrides VMA level control, which
> overrides global control, right?
> 
> Intuitively, it should be that VMA level control overrides process level
> control, which overrides global control, namely finer granularly control
> precedes coarse one. But some apps might not use VMA level control
> (e.g., madvise) carefully, we want to override that. Maybe ignoring VMA
> level control is what we want?

Let's take a step back:

Current behavior is

1) If anybody (global / process / VM) says "never" 
(never/PR_SET_THP_DISABLE/VM_NOHUGEPAGE), the behavior is "never".

2) In "madvise" mode, only "VM_HUGEPAGE" gets THP unless 
PR_SET_THP_DISABLE is set. So per-process overrides per-VMA.

3) In "always" mode, everything gets THP unless per-VMA (VM_NOHUGEPAGE) 
or per-process (PR_SET_THP_DISABLE) disables it.


Interestingly, PR_SET_THP_DISABLE used to mimic exactly what I proposed 
for the other direction (change default of VM_HUGEPAGE), except that it 
wouldn't modify already existing mappings. Worth looking at 
1860033237d4. Not sure if that commit was the right call, but it's the 
semantics we have today.

That commit notes:

"It should be noted, that the new implementation makes 
PR_SET_THP_DISABLE master override to any per-VMA setting, which was not 
the case previously."


Whatever we do, we have to be careful to not create more mess or 
inconsistency.

Especially, if anybody sets VM_NOHUGEPAGE or PR_SET_THP_DISABLE, we must 
not use THPs, ever.

-- 
Cheers,

David / dhildenb

