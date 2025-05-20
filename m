Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E56C2F2E
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747748779; cv=none; b=sbtMl3bh9ABjFDC75hIzP4mbXZ7OUcKITUCaPP76XohQTY6/bHKX0E2ZVgaX10Ml7vAoEUovsD7QXQl4NkQyAa7xYsVYDsjklaMO2jrdYBr5M6i4uDE45QF5V3zCvrgqt+5hwd2ou4aP4AI/pKhIadeMM17zEOuvXP0GZnR2MFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747748779; c=relaxed/simple;
	bh=17tVo6xv1++L2o0D5azY3yKyZllJq7pWrBCxPz1VaFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iC2hzPPEKcqsRq6cO2vTki2L0aFYEf8YRzOOeRRlSNcf0Z52qXeY18vSegLyXIZwyY9HYb+OAXN8gpzLPa/2JLfuVAEhA1cvK/ap6cDQA+gEzIBrHM0lLL4Boi2cxqci0FpFQ+7EhBhg/uGPokfgNMtu7Q0wqIb+SjBC3fLDS/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gF3c8ac1; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gF3c8ac1"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-601afe51106so3865585a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747748776; x=1748353576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x63hT6SO5GsWt+J4N7rT5dncXL6uLcyTmJsrqz9Z+Ls=;
        b=gF3c8ac1sCXlGtggNJRIwFlDofo9dmNCcy0UKx4JTr+wwSDgvz4m6I3yHLZ9efmXcb
         NWDV4SkMg6uYIwOtLbdMa9zRHweqGfZbNqmW8m0eKdBYyVePh7oSVcoEE2+ZhIJRwnCA
         EIHrA66V5XZh1ln6Rwse+tcgnGwF2Aan7qg2aGxjqAOea2jW6tZDusDmfFlAzdW7jk6k
         z46oP9lCDztDJLX6Pc3tQY0kdTSy6/fP0GMcgSXZRgzBnDIrVU18SjmcOBhPT21/Fl0+
         6oeum+B6jykCPTZXWqkQBWKYwQ50yx2MLQX0kI1uXILzNp6YzxCHxehcWtuYCvtBl6on
         ysuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747748776; x=1748353576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x63hT6SO5GsWt+J4N7rT5dncXL6uLcyTmJsrqz9Z+Ls=;
        b=dBmpEYqu2UgoGRh6a7A+JB9YA9zOb9pcKxbj1wJ4TpUUnlsvGG7kJyR0j4hVRc3240
         ea+0tbWZhokYFoBOoXUpqpvPfSOFdY6RcXbm/8O8WrhwQZLEF+UiqdFrbFZq5gJpE0Ho
         Ovg+gEti5mbcLz18MvGFT7PafHnLPhkQAwgYBHqSgwC8l5HDzR7HEPBN9OMiQ/1jvnW+
         ABbu1h4X6pHK4o2Aulj+6mp0qH/aDTWC/Owhhz1uZtn+99AlHQT0f4wZtjL46Y1gbzxo
         YRDGjXwZckqUd+QAgX4wSYAQRwB0kw8nzfYwrbjXThlalVkDgIoTYTr/D2iFxVrHye5E
         bJVA==
X-Forwarded-Encrypted: i=1; AJvYcCV2d6qEd+P98AayomVu1WSI2lmPt4sy3RFLcnvYF5Ibmiz4ME30t2VgWixU9qs/GgReNylHHywNqCSj5aA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGmA6SHQ6jowf+gUcBTeLqFvfgIy5Fo6+CvCqXOo4LQ2y1QcWi
	0vQ8sszvgZN6AGEyVPzKIXlayTMKGzDnNGdbI16JGx3H/xEITklf+GEM
X-Gm-Gg: ASbGncspSREaeKknJAw7GujvZR4h8mvNf0W9GpCgwyABoRfXe3MXGJ7zADvOkH9WrS6
	e/ZOnNYmcyzP/X4mPlcOMgLPYa8jQmQe0TVAWQbhnwkAwBWLz74akQxuLADp0nw/LgPxbeU51tJ
	LubCf+LA+8UL8SOvbewpunQBCDH2b7RMoX96X2zSw2ZBhRE8+Ocqp6K9bjWJd281JylclBVx+G0
	3y88gp1MUhGnj4wY2ygyFY4QXHNJo6Jb6Hp29bxBkvFsvlInjaweMAB69pGRPkyekdoMmotCoH7
	QsM+EYJvR2jRKc8pryB0k37lQRKW3M7W0mjF2OngA1d5vyCQXdYjsYO7Hg/uVLNBUDgxkLdJD25
	O0GLcKDzOttMeI6UqL13kAJgh
X-Google-Smtp-Source: AGHT+IF1em6fQ+dQmzsQ58BrTPYM6PFztA3fy3AGPzn1H3XqZ+KObnhKheRQYGrFfIvF4334SIkJWQ==
X-Received: by 2002:a17:907:3e20:b0:ad5:6d1a:6fa4 with SMTP id a640c23a62f3a-ad56d1a72c0mr763299466b.44.1747748775442;
        Tue, 20 May 2025 06:46:15 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:1c0a:f3ac:4087:51c8? ([2620:10d:c092:500::7:66a9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06b497sm727382466b.42.2025.05.20.06.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 06:46:15 -0700 (PDT)
Message-ID: <6d015d91-e74c-48b3-8bc3-480980a74f9b@gmail.com>
Date: Tue, 20 May 2025 14:46:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm: slub: allocate slab object extensions
 non-contiguously
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, surenb@google.com,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, vlad.wing@gmail.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
 <3divtzm4iapcxwbzxlmfmg3gus75n3rqh43vkjnog456jm2k34@f3rpzvcfk3p6>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <3divtzm4iapcxwbzxlmfmg3gus75n3rqh43vkjnog456jm2k34@f3rpzvcfk3p6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 20/05/2025 14:44, Kent Overstreet wrote:
> On Tue, May 20, 2025 at 01:25:46PM +0100, Usama Arif wrote:
>> When memory allocation profiling is running on memory bound services,
>> allocations greater than order 0 for slab object extensions can fail,
>> for e.g. zs_handle zswap slab which will be 512 objsperslab x 16 bytes
>> per slabobj_ext (order 1 allocation). Use kvcalloc to improve chances
>> of the allocation being successful.
>>
>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
>> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
>> ---
>>  mm/slub.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/mm/slub.c b/mm/slub.c
>> index dc9e729e1d26..bf43c403ead2 100644
>> --- a/mm/slub.c
>> +++ b/mm/slub.c
>> @@ -1989,7 +1989,7 @@ int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
>>  	gfp &= ~OBJCGS_CLEAR_MASK;
>>  	/* Prevent recursive extension vector allocation */
>>  	gfp |= __GFP_NO_OBJ_EXT;
>> -	vec = kcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
>> +	vec = kvcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
>>  			   slab_nid(slab));
> 
> And what's the latency going to be on a vmalloc() allocation when we're
> low on memory?

Would it not be better to get the allocation slighly slower than to not get
it at all?
