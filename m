Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069A1DDDC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744840375; cv=none; b=rm4ON+Fob8GW963MPPCAihXUkQJwgrgpjuSymVpv77BjTcNnrXBVfIURE7YEOEdKdq5dSo9pGVLGLMFIm/bpMfcnBsTFjPm05P8T9ZGVNj2m0BqYG1i3a9pfAaWkuMiixAZpFL2o2mRSBuF2idwB/P/ydY5Qpn1HuTJlTa4kRDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744840375; c=relaxed/simple;
	bh=2Qe4vN7izBxKb2DcP2QzQ8ZFDIMNN5ftyI8omk62WNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a1aOH8iHVctdF7+fOjXDMpDco8+XyNAs6owl4RT5BPhas2hDU474qI90DSw5qFzTQy4gBKxqZtXldJc10wZ+8ThIukEmKCrEQqd2d6zJTLqOaLmMq4xrzY70n5PCNsiopdhyLMCsUYGGyQYWZwE9GWLY+PSkwgTwCgLm82+j3eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTXJLO6s; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTXJLO6s"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so117509f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744840372; x=1745445172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dvF/qVSL3ELz6eILB+vwpFKw0DXK8I/sRsHQ0VdcGGU=;
        b=KTXJLO6sXIoxpQVLGG1TJNtGHLUIb9fnBBhPgn6fAoHMPEGbrnpIOuTjINr/Xa/iso
         CY/bPA7BPTk6Ly+S58JxAthpqwPj31zyjJbwSzTvVv+eD7PvNCfZQ8aD2zF96EfEmD2f
         oAzhHMZNuxaFg7nOdZL9SqYr8rLeG3NDte+bxNtSn1c33rzzO4Q9H89hPU64oCBj/B1/
         9QCfQKrgMrnz5MYzcovue+6c8mIJmXRRQmxQVrCnlCoMO2flrMQ9X43yZrDfO9PYU21e
         tTvOwRgoSoC8zXt7WfR1vqd+KJxLYPahjImCEv6IJEMBwGvxJgcTMIyAcnCk+9NAqL+r
         wM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744840372; x=1745445172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dvF/qVSL3ELz6eILB+vwpFKw0DXK8I/sRsHQ0VdcGGU=;
        b=C1LJBNSWLMTqs2WeJnRBUs/CkHTxkCtpAuu8JIHbikuh+x2oNQW8BGv1pb39rBhTtF
         BN9No6+YGpAdIEemGhZAyg7yqgQyW3+nUvok/ysmujE/Bh9pRY7wI5i4nUbQhZsiPuS9
         3JnuQYTqbZXotBN2sfj+wXL801Rzo5b2XXS4yjNKbfWFybO7/WCXpnffATRMSCjyFUAU
         CkULdz2vOepsM4MkMgCzvaiHChoo/WGj1BlHOAB7A2PzpI1d/zoQ1L87zaZAz70Nus0q
         pWpS8tSF9L3erRHF4JRU75n98+DkUHbKqoiYbc4g6w6oOB4MXGWbVNb7C7Spi/LSobjR
         YQ7A==
X-Forwarded-Encrypted: i=1; AJvYcCX+oHkidzMa1KOrpSAIeJ4NXjRtoQ6WAg3WAn0WfvEe65Bdoj+gCs2ghTIHjt7kqLoCN6t9uC6kqnDaZC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYVSlwmfh+UE07bBhvRtLY7HKOUoKicS3rRoOuzEMWpC1g+tCE
	EH74fF5zlj0/9SpAoZRrsWx5VeNVuQOGTXZa77UKFP1cOVj807w/
X-Gm-Gg: ASbGnctiRKIUdZ++oa11L+ldJdVWzAgUgxDrevvtpt/ZLLcDxBDklir/KhY8VVpB/Hs
	eqm4n91Ug40HVQ+twLfCzgZu0lt3p8Ql7e5LFYIJAgcCSqBGcEliPz5ND7KR+0ghguQ7kIkXxff
	c/XfU2oOsG8QtZlr0ZhNCpyRg9ZpCdVE4TIsRfTjdNk9HloIxTJB73oXlP7FzSx3gFzAYCaVMIY
	fH+F6G+gbDsGQOaF/SC8OBf3tO+tHySndEmz4zG+mvNizSADaVZq3HpT3vTchHZmxWbs4gYoNuX
	0TwgYugbAs46oxrh+2NJvs32IHbhjlsJH/eSK25vzT8QAMejNeaJgwQNg2pFRHPGiuBrE6e1tED
	PzKjjle0oAC7vEVGT1as515F2imf94S0Hnw==
X-Google-Smtp-Source: AGHT+IE9WpykaPvMsR2/0Zomzczva7TKYcbw2WSn8b+jWFr9iMt9PPapgg8Q0P4BZa275XWqnqEMmQ==
X-Received: by 2002:a05:6000:1a8c:b0:390:f6aa:4e7c with SMTP id ffacd0b85a97d-39ee5b1cc1dmr3207325f8f.28.1744840371916;
        Wed, 16 Apr 2025 14:52:51 -0700 (PDT)
Received: from ?IPV6:2a02:6b67:d752:5f00:c46:86ac:45ea:7590? ([2a02:6b67:d752:5f00:c46:86ac:45ea:7590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c05asm17836912f8f.26.2025.04.16.14.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 14:52:51 -0700 (PDT)
Message-ID: <d03e8fbe-516e-40c3-96aa-43f5e51d0c3f@gmail.com>
Date: Wed, 16 Apr 2025 22:52:51 +0100
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
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <CAJuCfpEKrX+1_SJ5fOyT6JLDSNcDxjcfBMj9_siVZt-rX5WQ=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 16/04/2025 22:08, Suren Baghdasaryan wrote:
> On Wed, Apr 16, 2025 at 11:06 AM Usama Arif <usamaarif642@gmail.com> wrote:
>>
>> With this Kconfig option enabled, the kernel stores allocation tag references
>> in the page flags by default.
>>
>> There are 2 reasons to introduce this:
>> - As mentioned in [1], compressed tags dont have system memory overhead
>> and much lower performance overhead. It would be preferrable to have this as
>> the default option, and to be able to switch it at compile time. Another
>> option is to just declare the static key as true by default?
>> - As compressed option is the best one, it doesn't make sense to have to
>> change both defconfig and command line options to enable memory
>> allocation profiling. Changing commandline across a large number of services
>> can result in signifcant work, which shouldn't be needed if the kernel
>> defconfig needs to be changed anyways.
> 
> The reason tag compression is not the default option is because it
> works only if there are enough free bits in the page flags to store a
> tag index. If you configure it to use page flags and your build does
> not have enough free bits, the profiling will be disabled (see
> alloc_tag_sec_init()). IOW there is no graceful fallback to use page
> extensions. Therefore, the current default option is not the most
> performant but the one which works on all builds. Instead of this just
> set sysctl.vm.mem_profiling boot parameter in your config file.

Hi Suren,

Thanks for the review! The main reason is to not have to make a change in
both defconfig and kernel command line while deploying it. We can ofcourse
set the commandline as well, but just makes deployment more tedious, and
adds an extra commandline parameter. In our case, we only want to deploy
compressed tags, and if there aren't enough free bits, we would prefer to
disable memory allocation profiling than to take the memory and performance
hit.

Would keeping the default value of this config disabled be an acceptable option?
i.e. the below diff on top of this patch?

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 66d8995f3514..163ffcece47a 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1030,7 +1030,7 @@ config MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT
 
 config MEM_ALLOC_PROFILING_COMPRESSED_ENABLED_BY_DEFAULT
        bool "store page allocation tag references in the page flags by default"
-       default y
+       default n
        depends on MEM_ALLOC_PROFILING
 
 config MEM_ALLOC_PROFILING_DEBUG


Thanks,
Usama
> 
> Your change effectively changes the default value of
> mem_profiling_compressed and I don't see why you need to introduce a
> new config option for that. But that really does not matter because
> changing default to compressed tags is not the right choice IMO.
> 
>>
>> [1] https://lore.kernel.org/all/20241023170759.999909-7-surenb@google.com/T/#m0da08879435f7673eaa10871a6e9d1be4f605ac8
>>
>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>> ---
>>  include/linux/pgalloc_tag.h | 4 ++++
>>  lib/Kconfig.debug           | 5 +++++
>>  lib/alloc_tag.c             | 4 ++++
>>  3 files changed, 13 insertions(+)
>>
>> diff --git a/include/linux/pgalloc_tag.h b/include/linux/pgalloc_tag.h
>> index c74077977830..0226059bcf00 100644
>> --- a/include/linux/pgalloc_tag.h
>> +++ b/include/linux/pgalloc_tag.h
>> @@ -16,7 +16,11 @@ extern unsigned long alloc_tag_ref_mask;
>>  extern int alloc_tag_ref_offs;
>>  extern struct alloc_tag_kernel_section kernel_tags;
>>
>> +#ifdef CONFIG_MEM_ALLOC_PROFILING_COMPRESSED_ENABLED_BY_DEFAULT
>> +DECLARE_STATIC_KEY_TRUE(mem_profiling_compressed);
>> +#else
>>  DECLARE_STATIC_KEY_FALSE(mem_profiling_compressed);
>> +#endif
>>
>>  typedef u16    pgalloc_tag_idx;
>>
>> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
>> index 9fe4d8dfe578..66d8995f3514 100644
>> --- a/lib/Kconfig.debug
>> +++ b/lib/Kconfig.debug
>> @@ -1028,6 +1028,11 @@ config MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT
>>         default y
>>         depends on MEM_ALLOC_PROFILING
>>
>> +config MEM_ALLOC_PROFILING_COMPRESSED_ENABLED_BY_DEFAULT
>> +       bool "store page allocation tag references in the page flags by default"
>> +       default y
>> +       depends on MEM_ALLOC_PROFILING
>> +
>>  config MEM_ALLOC_PROFILING_DEBUG
>>         bool "Memory allocation profiler debugging"
>>         default n
>> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
>> index 25ecc1334b67..30adad5630dd 100644
>> --- a/lib/alloc_tag.c
>> +++ b/lib/alloc_tag.c
>> @@ -31,7 +31,11 @@ DEFINE_STATIC_KEY_MAYBE(CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT,
>>                         mem_alloc_profiling_key);
>>  EXPORT_SYMBOL(mem_alloc_profiling_key);
>>
>> +#ifdef CONFIG_MEM_ALLOC_PROFILING_COMPRESSED_ENABLED_BY_DEFAULT
>> +DEFINE_STATIC_KEY_TRUE(mem_profiling_compressed);
>> +#else
>>  DEFINE_STATIC_KEY_FALSE(mem_profiling_compressed);
>> +#endif
>>
>>  struct alloc_tag_kernel_section kernel_tags = { NULL, 0 };
>>  unsigned long alloc_tag_ref_mask;
>> --
>> 2.47.1
>>

