Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAB125F79A
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 22:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746830587; cv=none; b=M1niQvN3pkfjLMG7aTJP78OVk3E/1ZOI5klMBMwqJEQFXvQddBWiQw8VK1nGNY3Mjzp0f8oTf3XxiAiLyHtkGXLl/cTmHDVI9tg2yrzwA03bW6eb1x3p7rq9dHh90oRjSQhBuqqi57AOfcx+oql2VkX6lxGOwKIDONlZ+yrwf/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746830587; c=relaxed/simple;
	bh=X3s/A98FzP6o/IwBvBfRnEUdSqajWx5/UiKO55G261s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rimLk8Gbws2SVoe4FiuEWpjgHSEWxIVgh/4bRAHy79B1UBdcXWd1yumgk9NncQulL/u2sf3+8YrAKlEkhlFC5iYHprq0g1vHfUCGPNNQZiSXmopl+DmXEUq0+6rfEOP6Zo4QgqFGYiDbjVHEhdKjhZCUSR+bAaQ5Zh8o97gJGRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OwTN4Abf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OwTN4Abf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746830584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hqGV7B3yX160YR3bgu/uMkDW4l2lwnLi1yCpVMj63Ls=;
	b=OwTN4Abf1FEBRdFiLv2lb1mdHfK2V7XJiX9CNx7iPRnBvmynW9EHBJpXliljPbHrpnPl2A
	2Ve1kdcc0BJHBKlZBAZPFE7sgobswyajmIvZ81tfmQjifepQU7JB4+ZVrbLbdVOGY7xtib
	D20YLji334yXj0k7qrAur/kRETCyNkc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-GaeXBO1-PIOV5c6YQ5EBWw-1; Fri, 09 May 2025 18:43:03 -0400
X-MC-Unique: GaeXBO1-PIOV5c6YQ5EBWw-1
X-Mimecast-MFC-AGG-ID: GaeXBO1-PIOV5c6YQ5EBWw_1746830582
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43f405810b4so12792435e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 15:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746830582; x=1747435382;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hqGV7B3yX160YR3bgu/uMkDW4l2lwnLi1yCpVMj63Ls=;
        b=uqzKMk8U4Ui5qkDJt0LHAQmMg7JA6XEz100OWGFOZAuW4ofCLUWip94ZR/o68YoJQ+
         Uu6tpkHBxIYaS+SJAEQ0M5XCTtG0JjCsh2l9bV2wS7/y4tveb/UpTUKE1djPUTG8b6YP
         BzqoLxqYphGsGxfJ1+KfnR9HzCzWxkbozmi9UDAGuKImqva6kyGxpQ8Qe+27ZkRnDMC9
         AO+RIM6KXb5ehpn8wrnZQuGzQ0n5DUrP5Z5fWukP6LFaZ2fr3bA7UF4vGlvvei90bKKm
         717salhCGgP8srVICA0d8kOR6FNnHDvLDmbv+6eU/EKQtR622il8ZqyRT3qq9ryNWmYA
         tTXg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ1SmmDooF4yWQvVnVwvfRLoD9SB3C01yZJ4CS4EKXs/A6dO+WtPr9wVopTzZs4br8LeK4c0Ik6r+ygsU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVgeSv4j2fntvlqB+1/mnZxLL6JsByD4gxaNGMhANTha0nDQ87
	PYqlNG080hWZ0yWLrZTmVF2yWn2E69Yc/NOEOZtDUrOHHoObYh8C/Ut5a7NLm1cDSEX2mss3mgd
	i00TMg5P6vmosi8WtZwwwnfBiUf/L3Lk9A+MvB4qBask1/MMYoPuonWEmFhQbXg==
X-Gm-Gg: ASbGnctSXDV5wJD4U7/c38txBvjnwo1plw2Kls98Kf4cM8dLYJVaUNKbz7ojARZJbll
	gheNXMfI2o7QX6ch3BbsJlsOcuCkpAEfdxO4C90yifygzPYxLJBWGombeQKPpVbzdJf+UVX+K1m
	WQisifpTp/7uCzNpXn4zuIeRauuCG856DES13OQT0JXfcIj1ebMZowHqRcQYcK1+AItO5bjvgSA
	4L6BD3iHseS5wyaqxMCkpqNsh9mdoZ8/XqgiWV+XZUVvrYe6w4YJqZzRQGENd/phYKcrW6pz9pf
	aGOuExprf3MmBjx+/7UTcjY4RlfR7fdLyfbRGuwhGqxLV5K7v9c0hWbOyIH/XdU36fw6tXYQDGR
	fYDBUnfqWNbGN30LBvQjkLEzcfXb/eQCfKArwr+Q=
X-Received: by 2002:a05:600c:3586:b0:43c:f85d:1245 with SMTP id 5b1f17b1804b1-442d9cacc19mr31285315e9.17.1746830581949;
        Fri, 09 May 2025 15:43:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsy3alnT6xKlJrjS3ZVXFCnavqO8gnw/Rb1adntYbfLIz2Lu5ZcXD2+567BvK1y8Kqr5WLyw==
X-Received: by 2002:a05:600c:3586:b0:43c:f85d:1245 with SMTP id 5b1f17b1804b1-442d9cacc19mr31285195e9.17.1746830581537;
        Fri, 09 May 2025 15:43:01 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f45:5500:8267:647f:4209:dedd? (p200300d82f4555008267647f4209dedd.dip0.t-ipconnect.de. [2003:d8:2f45:5500:8267:647f:4209:dedd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde27sm4664654f8f.17.2025.05.09.15.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 15:43:01 -0700 (PDT)
Message-ID: <f691d2e0-5919-4581-8a24-1b543d798ae4@redhat.com>
Date: Sat, 10 May 2025 00:42:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] prctl: allow overriding system THP policy to always
To: Johannes Weiner <hannes@cmpxchg.org>, Yafang Shao <laoar.shao@gmail.com>
Cc: Usama Arif <usamaarif642@gmail.com>, Zi Yan <ziy@nvidia.com>,
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
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250509164654.GA608090@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>>> - madvise
>>>>    The sysadmin gently encourages the use of THP, but it is only
>>>> enabled when explicitly requested by the application.
> 
> And this "user mode" or "manual mode", where applications self-manage
> which parts of userspace they want to enroll.
> 
> Both madvise() and unprivileged prctl() should work here as well,
> IMO. There is no policy or security difference between them, it's just
> about granularity and usability.
> 
>>>> - never
>>>>     The sysadmin discourages the use of THP, and "its use is only permitted
>>>> with explicit approval" .
> 
> This one I don't quite agree with, and IMO conflicts with what David
> is saying as well.

Yeah ... "never" does not mean "sometimes" in my reality :)

> 
>>> "never" so far means "no thps, no exceptions". We've had serious THP
>>> issues in the past, where our workaround until we sorted out the issue
>>> for affected customers was to force-disable THPs on that system during boot.
>>
>> Right, that reflects the current behavior. What we aim to enhance is
>> by adding the requirement that "its use is only permitted with
>> explicit approval."
> 
> I think you're conflating a safety issue with a security issue.
> 
> David is saying there can be cases where the kernel is broken, and
> "never" is a production escape hatch to disable the feature until a
> kernel upgrade for the fix is possible. In such a case, it doesn't
> make sense to override this decision based on any sort of workload
> policy, privileged or not.
> 
> The way I understand you is that you want enrollment (and/or
> self-management) only for blessed applications. Because you don't
> generally trust workloads in the wild enough to switch the global
> default away from "never", given the semantics of always/madvise.

Assuming "never" means "never" and "always" means "always" ( crazy, 
right? :) ), could be make use of "madvise" mode, which essentially 
means "VM_HUGEPAGE" takes control?

We'd need

a) A way to enable THP for a process. Changing the default/vma settings 
to VM_HUGEPAGE as discussed using a prctl could work.

b) A way to ignore VM_HUGEPAGE for processes. Maybe the existing prctl 
to force-disable THPs could work?

-- 
Cheers,

David / dhildenb

