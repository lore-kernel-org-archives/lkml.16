Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A68347B4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744900402; cv=none; b=QbmOclYc8WusHEDRH6/+bL7750RcGFmv2ZFF1dr7gvWsNcT2SuZsTvq7IHnrP4xcDfZCfvm9u08p9WbmE/2MUzeVVfEYCbjMe07IloP40hddw6IlF9VVKlzwN/O1xeMYItkZ1ZgU+3pWQl205xMPLiciS9rA+qex5QGMrIq4Utw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744900402; c=relaxed/simple;
	bh=tivxtJ+uZYCunlfR1CZSnmCxNY232U9LiLpHaYfYob0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZFaYtYqm8wUceNMd7QAPP8xHF9VBnZDbze59phMezJvT/jCSJtwTZ6zcVh6mzhaL+youGH4B88zJ6qRO3jJc8QrQddcDjzcLaoh3KFLbnqZMTi74vka0YlPyU4LpzVC2/CY1TCGlMQzcQZ5NM4SvNoRhXnSzjtqbMO2HMf3ojY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k586NEiQ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k586NEiQ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so605075f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744900399; x=1745505199; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=52Wv4BPTjON7msPoYeHU8mR+/WHRDqEO03Lynu+d994=;
        b=k586NEiQMjRZTJly1K39Intm9jK4FK40O8rOxFuWA8I/lMC4H3fVlJ9NU79esx8zGG
         LvqV6yEoQxJPVg5Uq7ZdiqSqCxU/4b1Mds0Djn78b8zPoX5Ph2+QjjgTuJrBXFVOWdab
         7u2Mq6hTpH8/thgOqh+F4lyVtY1MJIRwvo99vntCsGtwchDyyBVUMG9idarqtjOpUnk8
         /z/ibYiVSd9egzFonOnIeDBdmTqE1W758DdbBuw/TsvbvDJfEwyrKdoi14n3nKNjDwP+
         egp220gtezFOFmb36JermGsr68SKXxZ6Xo/sB6vd/a5+oI6mZdSj431nHJCkrTWmihAV
         yHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744900399; x=1745505199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=52Wv4BPTjON7msPoYeHU8mR+/WHRDqEO03Lynu+d994=;
        b=q2/FLGGkwJeqFWom24aSzoA+Kqp3Et57jGRJPKI+Zi+MOY0o26XD2kqBvH2BdVIQM2
         SG44FVDbHUMteOK3Rkct5cgZCUejNzT0W/hLNzW7EecHMC70vWT4plQwRQI98EH0qRr2
         bC/vj0xr9qk/zEnSu8FWXCCypluRravMRRGVRire9iOagD9XN+7f49U4ebxfT+6OCubk
         VIaQzZzSRBn1t/4zzbPd+lYOpNZGv7efjP0GjXCt5Uef2HVCgLz/c0ri1CxLIb4kE8jO
         28fwW2KnJVwoJcPQ8vVQq7pQGqtsU6RJzZaBwpjz8h9IyN1BsFqM0PsZy/+whv+GzYZ0
         XzWg==
X-Forwarded-Encrypted: i=1; AJvYcCUQRA81WbbTGnKgCpxQswCnKqFdJCQV22ehqxsZL8eb7SVn4coCFJg+7belRU4VULfa+Axiji1a8Nza1Uo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN31NnWfOYgluuJq8Xnvm37pVbIIO22ZHKdBBJfxhoUFN7hhMH
	tOJzsU8dCHrRDP+pKwoy4vyxfQ+R8KN+mMMyPjVtUut+xv3a82o3JSwaZ1uT
X-Gm-Gg: ASbGncsPIWQ5w/5IYMHaspXNZe6u/zerrqXP5nlBFQqulBjyTwHG45SfHhl1bS4+pQK
	9DRkXPXEkZsdCfsCqX5iOxgCKx71Bc6zmzFvvp7Py06oMw8in/t62HNR1ERPFhoTK6ZUkj6i6Nt
	GZIRNaD4zd/5jApHDkWh5Blk3GJK2HMYcBE58Nf/F0B2TFBophbrLjss8XZY4Ug4o8KH4+ZclX3
	YM3NYiokTkI178SWiOMBhNSDvHxcZZ3PeZMO25tybWFhAWf9vlvgTXrBRlOOmAfYIM2VPIOjodM
	IWWEokjGJ7QK6XZ+NTZymdraS7jGCBfzaEPfGiruAQ6b+ZZeCklXRtwMkLnmXPf7x9AtaMcKUbL
	m8oW4Ydxf0efsCQ0LSrxashuFwGfc8ohoCw==
X-Google-Smtp-Source: AGHT+IHcOhlIlImAKAHfR/VqeZ3R8aNsdQlf/5oy9TNhQ/sv1LtjfP3zfaqs87wh+3aL9FErd5ELaw==
X-Received: by 2002:a05:6000:420f:b0:39e:e588:672a with SMTP id ffacd0b85a97d-39ee5b13bc7mr4755360f8f.7.1744900398883;
        Thu, 17 Apr 2025 07:33:18 -0700 (PDT)
Received: from ?IPV6:2a02:6b67:d752:5f00:c46:86ac:45ea:7590? ([2a02:6b67:d752:5f00:c46:86ac:45ea:7590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae977513sm20160966f8f.42.2025.04.17.07.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 07:33:18 -0700 (PDT)
Message-ID: <6305a60d-8bb1-4479-9111-86442c278e21@gmail.com>
Date: Thu, 17 Apr 2025 15:33:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] alloc_tag: introduce Kconfig option for default
 compressed profiling
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, linux-kernel@vger.kernel.org,
 kernel-team@meta.com
References: <20250416180653.3438158-1-usamaarif642@gmail.com>
 <CAJuCfpEKrX+1_SJ5fOyT6JLDSNcDxjcfBMj9_siVZt-rX5WQ=w@mail.gmail.com>
 <d03e8fbe-516e-40c3-96aa-43f5e51d0c3f@gmail.com>
 <CAJuCfpED6HQh8mT-8tvKzzcH2Xo=tP2Two+f=zk8sW-o_AJ8qw@mail.gmail.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <CAJuCfpED6HQh8mT-8tvKzzcH2Xo=tP2Two+f=zk8sW-o_AJ8qw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 17/04/2025 01:15, Suren Baghdasaryan wrote:
> On Wed, Apr 16, 2025 at 2:52 PM Usama Arif <usamaarif642@gmail.com> wrote:
>>
>>
>>
>> On 16/04/2025 22:08, Suren Baghdasaryan wrote:
>>> On Wed, Apr 16, 2025 at 11:06 AM Usama Arif <usamaarif642@gmail.com> wrote:
>>>>
>>>> With this Kconfig option enabled, the kernel stores allocation tag references
>>>> in the page flags by default.
>>>>
>>>> There are 2 reasons to introduce this:
>>>> - As mentioned in [1], compressed tags dont have system memory overhead
>>>> and much lower performance overhead. It would be preferrable to have this as
>>>> the default option, and to be able to switch it at compile time. Another
>>>> option is to just declare the static key as true by default?
>>>> - As compressed option is the best one, it doesn't make sense to have to
>>>> change both defconfig and command line options to enable memory
>>>> allocation profiling. Changing commandline across a large number of services
>>>> can result in signifcant work, which shouldn't be needed if the kernel
>>>> defconfig needs to be changed anyways.
>>>
>>> The reason tag compression is not the default option is because it
>>> works only if there are enough free bits in the page flags to store a
>>> tag index. If you configure it to use page flags and your build does
>>> not have enough free bits, the profiling will be disabled (see
>>> alloc_tag_sec_init()). IOW there is no graceful fallback to use page
>>> extensions. Therefore, the current default option is not the most
>>> performant but the one which works on all builds. Instead of this just
>>> set sysctl.vm.mem_profiling boot parameter in your config file.
>>
>> Hi Suren,
> 
> Hi Usama,
> 
>>
>> Thanks for the review! The main reason is to not have to make a change in
>> both defconfig and kernel command line while deploying it. We can ofcourse
>> set the commandline as well, but just makes deployment more tedious, and
>> adds an extra commandline parameter. In our case, we only want to deploy
>> compressed tags, and if there aren't enough free bits, we would prefer to
>> disable memory allocation profiling than to take the memory and performance
>> hit.
>>
>> Would keeping the default value of this config disabled be an acceptable option?
>> i.e. the below diff on top of this patch?
> 
> Well, in that case I fail to see why
> CONFIG_MEM_ALLOC_PROFILING_COMPRESSED_ENABLED_BY_DEFAULT=y is better
> than CONFIG_CMDLINE="sysctl.vm.mem_profiling=1,compressed" ? Either
> way you need to change the config file, no?
> 

Ah ok, I always thought CONFIG_CMDLINE overrides what the kernel gets from the bootloader,
but I just tried it and it appends, as long as CONFIG_CMDLINE_OVERRIDE is not set.
Your above suggestion works as well. Thanks!

