Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC102C327E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 10:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749034503; cv=none; b=kDDXBZiu78fAA1UXhaitiyGReShXvxRNMIvHTJn7dPyZjTjO5rwzVOIpBvz42m1QeKCj3QdccSREBU3Ab5k6IE1xbkrEg827MsXXRJ9LFdQOADAxQofyku3hT2hoRb9cuQyIWzU98tqoky8WCyIFnHkF7BKTVCsWO6vYod11n2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749034503; c=relaxed/simple;
	bh=wHcPCwGxUmVNyXsXAbEWS06LpX11YizruvdQuxUc2nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rDGuooB/k3qgXQOP0zihwieISKhlVg+UzKzV5R++w7Bug9oIfihSNDYwVGZQKU0dUhsNAsvy5qX2WCMRrw3IUEwz1ZXiQJ55uN9/0K0KtSpL18QasmjO/fXINhjAfsI3s49wCpEIjs3EXo8RGsgAl+XGQTGqZNPFOs4DItCkNNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DmqZ2f/7; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DmqZ2f/7"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60477f1a044so11461896a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 03:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749034499; x=1749639299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RQiFSzh7MNKglOz6npvfpvqQ53FTFZpnQ2JPeQGyeBo=;
        b=DmqZ2f/7xb7Sv7MfX9F9zhrxevIp647ORCu2vS/sESxgAngqoo0650o7xXbZVUhUBR
         z+o/OYGdcbyoyINPZpNP/r1+lhsmRCvwFfJjJduLz5/dfNPFByjK6XflB3FX0yQuoROy
         qbKogYgRErElOVgp1B2Dfhlk2rI7hRWLM+5dOizF5rTsqpj4gATOql2pr1fAe8Wdr9WB
         j8hrLJ/Ihp7dgxQ4Aqzm2S8bbPvN2IgcOT4gK4TeSB8XGxkhNzHwDUraJbpIsCVHXSrM
         z4FC84AOLkC8vXT4ITWsL8G0/9dYKt+1lUqVrksb56c6LC6fuyLRfLB48KUyqnvjC2PB
         oSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749034499; x=1749639299;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQiFSzh7MNKglOz6npvfpvqQ53FTFZpnQ2JPeQGyeBo=;
        b=LGhVZ4vL/OUMYym3hfPELuTLKYbgFD6zRUOp4jv2XoX/9lGdIuNGQWJ7GmB+/Ef9oa
         0BPjP/5HvQaDKkj3W23bvnoB+gioW721VYZjEJbDoyrfkanwGJJvtENfBQ6Ma3zbMytf
         wyOV9TPEk9aA4WCOoMLcel3dvM3FLKSqLeodqPeQTfAVO05Ck4Ujpx425MsuxaGsB+V4
         Ug92KE3Qbi/ed9xxSird8ZOn2mEglBYSty9fcewjzAwcOlXZiWfWJvktFWL+y/7s+leA
         4y52rPDeN81+v5AV/ubDmcMpgjfUXCID/D7nVWQZo18A9Dk9BKWbT6Q8Y81DoydWpzz9
         IaNw==
X-Forwarded-Encrypted: i=1; AJvYcCXVFx8QvMiuG5QKBVr3XoFz9/4Z2QZTjo0eTPVVQBLi5RzKdpabwreTHz6ebsu5kQnS/HgtyP896geTGfs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl/SQtj36Zdhe+W92PLZnsgWT9RWhknq4v3bDizO7lW4ScHHpV
	AvfjLuBVQ7LUr9+ED9pwu+a+ovik5of8rhVOOP7c2xQsqHxBbBDQj832PdyPDpUMzUQytcGzpzm
	WJ9rs
X-Gm-Gg: ASbGnctHNXlbrdpQTWpkPc2SP6s0sz2QasbFfJIlNHYz7VjGNe5seUknDcF84zHhv51
	IypEIwSsnenemx23SK/AB4nY655ywVGTN/9GQZdu5r6oKFi2BUI2KEOeJP4ZZkbNz9Ujyw1532Z
	Y54PPRdmVD03bnYBN2pVy7WBLV7hxIFbyxu5DesUuQOJKsYS2kFUbrDqnvYPm9xGCLp1KYGvY+g
	3abMyBTiO2RD8jo257JIzyL6V+nARz2fkcOJZks/uWWvMFPBH0V77yTcsEai1ks3M+7dzWUKaai
	07CkjrF3fNPel16ypJGkeDGZYXAaBoXh5Knjm2hAtdLf+/+RcWrnGESM
X-Google-Smtp-Source: AGHT+IFP6tIqlCqjMTmuclDNXygh6kzxDV1hmxofL/JCB/Rdjr7vcC3zqFjLhJMAwf2l24JZ8HagTA==
X-Received: by 2002:a17:906:4fc7:b0:adb:2bb2:ed1 with SMTP id a640c23a62f3a-addf8f24e35mr197693166b.40.1749034499177;
        Wed, 04 Jun 2025 03:54:59 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb390f09d7sm844311066b.148.2025.06.04.03.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 03:54:58 -0700 (PDT)
Message-ID: <73aaf67c-3ece-4a9f-989d-a1d4aae6ab69@suse.com>
Date: Wed, 4 Jun 2025 13:54:57 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/its: Always return a writable page for dynamic thunks
To: x86@kernel.org
Cc: pawan.kumar.gupta@linux.intel.com, peterz@infradead.org,
 linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com
References: <20250604104715.700149-1-nik.borisov@suse.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
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

Actually this is not sufficient, in case we don't have its_mod set ergo 
its_fini_mod won't be executed I guess execmem_restore_rox should also 
be executed in its_allocate_thunk iff its_mod is not set?

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

