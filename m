Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9BA19C55E
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747996143; cv=none; b=geIv4fbrnpUgQxbE77UH4HnKKyKsq0QPoaljSC/8+IKAiAZmekzxwtIsowXitgR3tVsqAm6FVJCsHIX9dTGhYthkl5pLAvHnsOoXwUbES+6Tj7UaYesw5R7vdqT+AdWAXKHEuSfbEYnX5bmhXG9jdN+Eqa2tE0K71FEHu/t5W0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747996143; c=relaxed/simple;
	bh=5JzwlqkolPm2EcSa+Ah0yUAqI1LpO3RCuE3ykB/szKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YNPcryqmJ6FnrRjIoZJWrC4PhGX5D//eC5u5aZlpwWpzgHZp/NM/O49knj6SKBxjcQkQ1S/eebS4JYy12Oudqw8GkmqcOws+4NvLEzVwTv8k7e4m3+glUad5b31ixlisNfKZKENXPQCJSnDPJHJHsEenK8xxlr0Eaf30yqpCRh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TYu7vh1O; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TYu7vh1O"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad560321ed9so787986966b.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747996139; x=1748600939; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BzGAigETPIfWl6iT0iJbVmtUXXVpdULIPq60Yri3qb8=;
        b=TYu7vh1OLHlT1XvltZIE7g8RSqgT3ZDbuUf9YOHvuhG9C6anO1PQnxkL6k6M6YT8fe
         QoPNupgJQHgXhmXcX6uCz/i7lXvTZad+DnK2qXpvjEEphdFvlLOx01+Dc0k7YZQ+WROY
         keYUYPzjUccDDWKPTKxcXMjKssC2gXwpot/k+ZWp02WxYBe07PX8eBb8e+IdzdHim7UO
         qDPNr1KnAUg9kgquNq8HKJ2Zv3uoQWgv3r0DRgJLoCgwQ9Jo3LuXWPHLBBntyLxVFMRF
         mXGRT+DuPTfa/mEsaU2cHEIUhu1Y0gX36xZTkg6DJzMyM99afK0jUjJ1RCVznRj0W3Kw
         qHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747996139; x=1748600939;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BzGAigETPIfWl6iT0iJbVmtUXXVpdULIPq60Yri3qb8=;
        b=e4b5wLSmKTvOdqjyqBXbuerxTaNeI3jPOeWf843cxruTS8/v2M+tEVndE0gagDqwIr
         0k0/kTQnTHWVmuRAdlPPcRU84qCsWXux8X0KbhfKQmjkjp6S6bximClBdg1KkCHx93Jr
         cnTIuFMH3DtLsER6E3/eakMo/nEUkgoIySL51oI13PwSStIdvW5C+u2PsDySnsw2A3v3
         d/f48xHLuMExlmhPDlzUaHrd5L1xc8uxJMyh6LQ9wCqFN9YUPuKbYkAdn65x0CVEteQV
         dYXvS+zU9zoq88835xwM8xvlCJ9VByn21vjFlNV0TIVvh7SSWQVrjnrSsDVbfaqG5Wx9
         8rRg==
X-Forwarded-Encrypted: i=1; AJvYcCWTtUU8NlIZea8NHJekotvcK7x32yNCQPt1nhr3Gx3Dqrdhvl3kKraey1ujRWwqs/Xd8mC5zN6eIMM12P8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvRvTlARC1bUuJx7BnFxFpPLcoz+NTIGcpOvkc/KMKOTv/+bPf
	3M1aF1ZcI+LFi82s4T9qZeD7Q5r1F+N6ta/gFXQHCU8S/6+PrAj9R3CQadaKgcE4x9M=
X-Gm-Gg: ASbGncv1k3Iu3vcepAB67ovx0B0Y8uIV6WvRhD7kgZgP214JFOUARIRleVEoqgbrDni
	MP0KXfuA7GMM5iMMyWnvGvxQDFMsaAQcHM2DyKJ8rc1psfZkfkhemMQu72M5Y5l2bCdh7PkIEvL
	qSZi2iHNPhJSh20uvKABUqpTJ6aINVtoQDV25MLi5DsODpqq/kb0K/ep2BtQLcHEYLc7FZO7qOR
	PB27/NqV6UiIgi2u7Mx34zNGpg0pSBnGCFMhJosRHI/Etx/CywrgVVScHH+PW4U4MUYdQ4+JeJ1
	LXdRweKg9CXf2iTVRKCOI4w0NelLWdnRvmY8ADmxLoTck4LAuZQtislq
X-Google-Smtp-Source: AGHT+IHA1Af3uxH7nD2C8Y7C2Mbs6IBAPEqK35HKI23T2B8JwFGNrjXFiHlEpM/Z4qPEaBRl17T2Sw==
X-Received: by 2002:a17:907:3da5:b0:ad5:8182:de9c with SMTP id a640c23a62f3a-ad58182e07amr1679844366b.38.1747996139533;
        Fri, 23 May 2025 03:28:59 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5b192cb0asm419270166b.170.2025.05.23.03.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 03:28:59 -0700 (PDT)
Message-ID: <6b4a225e-c7ff-45e9-a2bb-62454927de57@suse.com>
Date: Fri, 23 May 2025 13:28:58 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] x86/bugs: Exit early if return thunk is already
 set
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>
References: <20250522-eibrs-fix-v3-0-12704e291e1e@linux.intel.com>
 <20250522-eibrs-fix-v3-3-12704e291e1e@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20250522-eibrs-fix-v3-3-12704e291e1e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/23/25 04:21, Pawan Gupta wrote:
> When the exact same return thunk is already set, avoid the warning and exit
> early. This is to prepare for ITS to also set CDT return thunk independent
> of retbleed.

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>

> 
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> ---
>   arch/x86/kernel/cpu/bugs.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> index 94d0de3e61aec32b3b67c8d21f89a8c67b93dff3..354593065025fd7c5727e955d76523777b3da9ee 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -113,6 +113,9 @@ void (*x86_return_thunk)(void) __ro_after_init = __x86_return_thunk;
>   
>   static void __init set_return_thunk(void *thunk)
>   {
> +	if (thunk == x86_return_thunk)
> +		return;
> +
>   	if (x86_return_thunk != __x86_return_thunk)
>   		pr_warn("x86/bugs: return thunk changed\n");
>   
> 

