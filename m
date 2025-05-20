Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B33242D72
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747748534; cv=none; b=cyDGgbCpyzCSslKfYpOWv2PFFjx+nvfVTSo2kIulBwMTCrGVhxA0a5ZvTyQziLXCxgMb744mJWkPzPNWsGCIp2by9E/EAeT9VYV7L9aoXn5VJ/60BuiI4hO2Td0GRjEdoeh7+h+ZZ+RKVl486Fn+abuTGreXpuUUrBbmLcPpNK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747748534; c=relaxed/simple;
	bh=KQFFi8NhuJFkJln1jBSQBI3RE1hum+aPMoYzJqhDFFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OMRKO/NaMUc9fTgoPDMAxoLS83Lmn7P9yvHvVrngXwlUWjS0iAZZzN33MqAzliIEShWm9elYc2PRJmtGY8Kk/ilvHE4ouwAcZk4iyXMYm1rGkqFNhzAU0lBRePcvhDnfwtaFHxY/HNWS+i2qNuk/o2nicbrwfHL53b7YF6l0hsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEoWWtcn; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEoWWtcn"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad1d1f57a01so970831366b.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747748531; x=1748353331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=54KmLxIQehegZFn9M1QJb5N7gg26IMl0qsKo4ufd/T0=;
        b=PEoWWtcnXdqGdGRwe/per8p6MEWMiIUaXf0QsLcCPQFfrPWJMTdQO1H6VAH+4xCFxb
         CdiM8tlLcQfq496ww5jOM8bxeEgnfsknntn8wEADGZOy1iYA53QGDm/vKxG1jgpPg39X
         Z5ybqC74hPKMhsxyX87jNzENbG4frASpySfLUVsJiMCaDyltiHoDWJYtOPS27CE+FPAw
         BZmzc4YW7rTY6NR2MYh0jVlf/0QogvlYy1RZrz+YOYk7ez7sjhbwUHesDhLSW5rWuOGT
         R/QXhxzi8bIz2mgacqH3BYm6k9BhlRw3WY2oDwqzwiCDCqXOvarFG/Dz30K8gYq48Svz
         ws9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747748531; x=1748353331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=54KmLxIQehegZFn9M1QJb5N7gg26IMl0qsKo4ufd/T0=;
        b=pAr4TQxnzSWV7OMfkfqoRBkApqUaD+9PomP5OpaZo/fViookGH8iEXuJAtCcYPaqwf
         hY6Y7sVB8nvWc44fHRg/rHifCPBXBgaxxiUMxlY9XDUerqQVMePJwgaOSMYGHFZlqyfc
         54D6TNBOUNl70TLaDYo6C3gvgN9Fxs1MQqQxekOIoXhz7Vdhd6IDDcLhea6hpMYxmg3J
         1Ho6VaBbxK1YSZf8lp7369yY3dk9PpsP1uvTwwSHymSFhnDgqiQDXOdSzk2kEtukigqK
         YwZgAEEsJaotSlfWm6TAM/j9zTSeICx1GfvAsckIonpRY0KmSqI0lwisfzi982P7rul9
         wNkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF8LB106CF7EPDIrQHAbEJnKVS040DTzgHpp/2PzxI4mMu1q9hyYRLRVIt++fR0S/6Px3Ue1S09EHHFCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGnz+y51O3psaqTJ4JIG582dcAWEEGvRZTs6J+boEJP+yiHQ64
	E8jI4xxNC5t+nDMs4rGYKaDAQkcmbszdIYjNFFQkXzA40vndih4ASLX5
X-Gm-Gg: ASbGnctwrMa0WJEek7LfcA4Dyt6AqtNy8K+SNHmQrhCqya/VoDKaKEFFx8gFaXbpxwT
	sVtzECD1uGph/7TZds5Hj5yUEMP/4X2331NKeetPX7yUqT1Jz+4n57REmvhfll7uxhHGd3Svohc
	8ddBXwZP4mnUf+wn7bNKFb6WV+t1aB6VidS9XGWXf0WX36P/ZWQ5CZaGzXLnJYDcLdk22QqG+g7
	rWQ52P0FylG+hsh0YfJsY9FTme0VD3mc7wRVLx6q3rOcbUW2rTuy5CxycNy5ucmwidEIJIX5/8i
	DtAT8NgLAvKG831vz1RexCxsW9We604leEGtRyKdEE3GSPGrfGDC8lXGADS+7fpX04HoLHbYpIf
	C9SXepXiQMQZGh/4zr1VgLhv0iv0uncXD26c=
X-Google-Smtp-Source: AGHT+IEo9WgQ4J+MDIfx1a+Red90PxVBvCLFP+FVI8c5BkozlwlAKL1rsaRIwhktXihym+t9QLu1dQ==
X-Received: by 2002:a17:907:1c91:b0:ad5:5857:ece2 with SMTP id a640c23a62f3a-ad55857f064mr1014595066b.37.1747748530861;
        Tue, 20 May 2025 06:42:10 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:1c0a:f3ac:4087:51c8? ([2620:10d:c092:500::7:66a9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d49656bsm733490866b.136.2025.05.20.06.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 06:42:10 -0700 (PDT)
Message-ID: <cf17cfde-cd1a-4217-a09a-1aa86347f830@gmail.com>
Date: Tue, 20 May 2025 14:42:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: slub: only warn once when allocating slab obj
 extensions fails
To: Harry Yoo <harry.yoo@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, surenb@google.com,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, vlad.wing@gmail.com,
 linux-mm@kvack.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org,
 kernel-team@meta.com, vbabka@suse.cz, cl@gentwo.org, rientjes@google.com,
 roman.gushchin@linux.dev
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
 <20250520122547.1317050-2-usamaarif642@gmail.com> <aCyEyxHEXQ7DU9I1@harry>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <aCyEyxHEXQ7DU9I1@harry>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 20/05/2025 14:34, Harry Yoo wrote:
> On Tue, May 20, 2025 at 01:25:47PM +0100, Usama Arif wrote:
>> In memory bound systems, a large number of warnings for failing this
>> allocation repeatedly may mask any real issues in the system
>> during memory pressure being reported in dmesg. Change this to
>> WARN_ONCE.
>>
>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
>> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
>> ---
> 
> Hi,
> 
> Please Cc SLAB ALLOCATOR folks in MAINTAINERS on patches that touch
> slab code ;)
> 

Thanks for adding them to CC! I was just thinking of this as a memory
allocation profiling issue and added the maintainers for it,
but should have added slab maintainers as well.


>>  mm/slub.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/mm/slub.c b/mm/slub.c
>> index bf43c403ead2..97cb3d9e8d00 100644
>> --- a/mm/slub.c
>> +++ b/mm/slub.c
>> @@ -2102,7 +2102,7 @@ prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *p)
>>  
>>  	slab = virt_to_slab(p);
>>  	if (!slab_obj_exts(slab) &&
>> -	    WARN(alloc_slab_obj_exts(slab, s, flags, false),
>> +	    WARN_ONCE(alloc_slab_obj_exts(slab, s, flags, false),
>>  		 "%s, %s: Failed to create slab extension vector!\n",
>>  		 __func__, s->name))
> 
> I think this should be pr_warn_once()?
> I'm not sure why this was WARN() in the first place.
> 

Isn't WARN_ONCE the same as pr_warn_once but with needing the condition
of the first arg to be true? We only want to warn if alloc_slab_obj_exts
returns non-zero. So WARN_ONCE should be ok?

> The coding style guide explicitly states that:
>> Do not WARN lightly
>> ===================
>>
>> WARN*() is intended for unexpected, this-should-never-happen situations.
>> WARN*() macros are not to be used for anything that is expected to happen
>> during normal operation. These are not pre- or post-condition asserts,
>> for example. Again: WARN*() must not be used for a condition that is
>> expected to trigger easily, for example, by user space actions.
>> pr_warn_once() is a possible alternative, if you need to notify the user
>> of a problem.
> 
> And failing to allocate the extension vector can happen during normal
> operations.
> 
> panic_on_warn users will be unhappy if they notice their kernel panicked
> just because their kernel failed to allocate slab extension vectors, which is
> a totally normal situtation.
> 
>>  		return NULL;
>> -- 
>> 2.47.1
>>
>>
> 

