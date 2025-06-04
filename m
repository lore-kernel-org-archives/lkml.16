Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390071DFF8
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749039521; cv=none; b=W0hj3LAR8MEQR1N4rc+ak5IAA2DlriEpjC7MGlh3oP51ekgJOFYdwl+1NSTLzajJ7pgO/CkvF7d0JTYyCYOtoMykQIgcytjVURZh7F9ztDQpyYFfzy0sJOXQacI2mHjnmsLHzjBBSr6qyR7Q185AuJGI47WWL1TEFB2EvxgUGCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749039521; c=relaxed/simple;
	bh=fmtvIVhEcf9Ds3pRf4w4H1KHrmA1PIgMPMheepuFKek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F+6TAlzQTmRu7l6Z6zKH4eG1jXyBZ4CXnudTX9v2tUpuFucXXBlXPlL+URaU1E2AmZnmwD1JHIMrpwUA6plP6WRotYBpukbH5JityApe2H3hJSZDzBLwEZ/gznaYLtJEenEJQyVQSsfUm532Cz9kaQmE8S2KFQyBIryMt2CWDgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/CFyTCp; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/CFyTCp"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so2146232f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 05:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749039518; x=1749644318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6aP3zhLVOba0eQWQTz2JY5uYi9PhSFybgMarblmIhkQ=;
        b=O/CFyTCppKoT0z0NDKqLqbqrLEC/5l+xWSwf0xkeViD66gRo+z/1UBDDPF8LCkR962
         bXrMJz33A2M5TzsH0IJMnB5bo/mWNGTdjeWSsBlsVIBOj5qc3YbpXh8ruiU5BWekKlNt
         gH41uM1lk7dK8kJ1yJ89vaLmBk89JRcg4NY7kQQops0PBRweSLSULgnIqwlONTIkllbA
         8xqMmbS/S+efeirltRq5Qfb+HD8UJC00BhGA+Z0GbLJwp0NtleUWhEqCD8BVe08vZxqg
         R9p40sLbLXxxMpP8nJzAIZChyvwYKOd3d6ztnYkby89yl8JKnTrcSj9xHpGlybZKT5gL
         2o6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749039518; x=1749644318;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6aP3zhLVOba0eQWQTz2JY5uYi9PhSFybgMarblmIhkQ=;
        b=UtdjVh6dSj7MKDOuvDgGIb9nGa5ZC3e8616D+8zHunRAnaD9t8hNMzgFHd26Ofr9Sd
         IqgtN39kqFqz5XYlcfhg+si+qL/rqhI3BUm/f0Wl547I40pOEzt7v/ym8R8LsIm80I58
         NGdMnyrZq/Ad373ScgP/Y3xcr164DdzAC20+uWHS5Cg0Y2mxGGuKIEFrYDysSoExrG7L
         iYgdOjffrpiY2CnQBmW59/IruV9ZYm9abFMYfkA35T8dhn1Cia9Kii0tGc5LfrTuoZX/
         bi/LltKVlHA8hNcAmSulxsAfGgpVS4Jtit6FtswSDwpVo4W/nvsQ7/G6HjVmJn/o3npC
         Lu9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUegub5KrTHiyYBWvMwLabkSbxysN2peg5mKutWPgB8X321uhflEYmO8FVV/B49gTavJTPMjJaDEuBwPzw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7P3mG1cRdDDJBOIAE1ZoEaTeL0nC8AFihOgbTcSKS6yEW+C/r
	Ccwr6t1wn20B919ps7TmvO8+K43FQBDc1Cvh0NxH/Q1OdtaU6CZOTTaH
X-Gm-Gg: ASbGncv5T7MAyvgNp+2Nlj0+7uytq+kiybQhSBiHObVt+zTr8+dUqhSKDd0RUWFQmro
	4Z7qsj7zr62/A8M9UHi/22fZ5mjk3IqVxyKoFwdZH3sZKQElb95WQ74xBzSfMpzeUg3ifNzB9hP
	yO2UWYSbCQQYcH2DG7OIQ8m9s6u0SzIJ5fb5wEyKgYK8byl9LrAoqnhFgd0UeyLrNlfWs7Qqwyl
	Kgn3q7dqI/ixmHRigs7WXLiBKT4QVGK07Qe1GoAb6OFwJTJZ+OOIhLpDaG+v3hjeI4mcieF9R3l
	gFOS/pGKJfQAEVEMr7ifoHDLJoQRMPPjZhST/178w9j61t/nhibFsk97Oj0Ajw==
X-Google-Smtp-Source: AGHT+IH6AazEjXzmMzLSskspefSjG9nYKH55Ex9FS8UbAAtLGVLMQkNvhM4d8ZC2XtdvoWCGB3vYCw==
X-Received: by 2002:a05:6000:310e:b0:3a4:ef00:a7b9 with SMTP id ffacd0b85a97d-3a51d8f5fe6mr1835839f8f.12.1749039518213;
        Wed, 04 Jun 2025 05:18:38 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73eebsm21317356f8f.44.2025.06.04.05.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 05:18:37 -0700 (PDT)
Message-ID: <67be78c8-d276-4edc-a101-51f168e200da@gmail.com>
Date: Wed, 4 Jun 2025 15:18:36 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/its: Always return a writable page for dynamic thunks
To: Nikolay Borisov <nik.borisov@suse.com>, x86@kernel.org
Cc: pawan.kumar.gupta@linux.intel.com, peterz@infradead.org,
 linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com
References: <20250604104715.700149-1-nik.borisov@suse.com>
From: Nikolay Borisov <n.borisov.lkml@gmail.com>
Content-Language: en-US
In-Reply-To: <20250604104715.700149-1-nik.borisov@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/4/25 13:47, Nikolay Borisov wrote:
> its_alloc unconditionally allocates and return a ROX page, but setting
> it RW is predicated on its_mod being set. This can cause a #GP on the
> memset in its_allocate_thunk() if its_mod is not set.
> 
> Since the function always returns a page, ensure it's always set
> writable so it can be initialized properly.
> 
> Fixes: 872df34d7c51 ("x86/its: Use dynamic thunks for indirect branches")
> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
> ---
>   arch/x86/kernel/alternative.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index ecfe7b497cad..191e909636a5 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -199,6 +199,8 @@ static void *its_alloc(void)
>   	if (!page)
>   		return NULL;
>   
> +	execmem_make_temp_rw(page, PAGE_SIZE);
> +
>   #ifdef CONFIG_MODULES
>   	if (its_mod) {
>   		void *tmp = krealloc(its_mod->its_page_array,
> @@ -210,7 +212,6 @@ static void *its_alloc(void)
>   		its_mod->its_page_array = tmp;
>   		its_mod->its_page_array[its_mod->its_num_pages++] = page;
>   
> -		execmem_make_temp_rw(page, PAGE_SIZE);
>   	}
>   #endif /* CONFIG_MODULES */
>   

Ok, this actually works in the upstream kernel thanks to 
d6d1e3e6580ca35071ad474381f053cbf1fb6414 meaning at the time retpolines 
are processed the execmem cache is actually writable...
