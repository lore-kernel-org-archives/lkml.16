Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BEF2D5C84
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 10:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749810084; cv=none; b=b4xKIQAyHHoIo3iZfKu5rtA/ZBm6Y+qljLfqtEJRs/1Jorywfq4byn49W0ybGoiLdLUDygGXi3rkDKWcTZzMtLjwKCrVA9cK2Yy1+bbl+m5Q0vtCmeeJ3ka88pHH7oYxi65dmGtaZAfaSfhNmdN5X1zKwEn/RAlCfvp8CXD8Z7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749810084; c=relaxed/simple;
	bh=5vWvO7APvFqNr7TvWRF8J9X828f8LeO6UiHetDUQAPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P0qVvJGfjJZ8++GW1y1TwkP8VDCDAW9jyGtKxp8rFG+m6+9Oj9eN3CaLuWVbFskH1KUxdHXkCG5dH0uUhRafhcyVwdB6fEAA44/2PksIjZmxpjbrVe7e/hpC0oXkXBJdqKqgXsh8m0WsJm+yxNhDoo9b2wtKotjtBPKx0LT6bnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XqSwfUjz; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XqSwfUjz"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad891bb0957so320283266b.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 03:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749810081; x=1750414881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W9SJxTP/LNWCbYYEI6OkUEGLgl2yUwj6T7YItwXovjw=;
        b=XqSwfUjzumsdz8qLHdVfKRfy6wJKh2yOCdDl4WldplVQaEW6RDfv2CsBoYRRzhAQhl
         eU8sFCHqi4W2A2+6gzBTOqwb9NMfQjy7pIoWIFy0lQ4LLKjM/H57f7D/Lm13pKUuQWhV
         KvaUSEv0fJ+rqOOGw9I4WU0xouQcr54AhI7hSGDWNwSHyTd8UzeXu99E6UUdVwBULbl5
         /tMY+qC4BLHQjEC5dDgvx+lL42Pmno9JrmcS2oy3eDo8Q7uNSojqjmN0BBEeusmOyYtf
         mpyheqeNYHz+hONgV6RPpcIxiwgKL3nBZQ8tBicksyn7fvf6BC7w+tDk0n8Cjooq9Unm
         oIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749810081; x=1750414881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W9SJxTP/LNWCbYYEI6OkUEGLgl2yUwj6T7YItwXovjw=;
        b=Ym/gP7t49yT3PvYPmtRM+HBY4RqGqUPq4H3zpd4CYeU00viVALgUV05rwDEedwKkHC
         G8zYTdw9EPZMOYanFVjeIJq0GwU+niN5YoeS+dE+tsvUIUqTr5fh2pdStQ0/SUHMShSq
         9w57Gf3kMQDQHtY7hdy2KCJjt5wCy/u7nr4isac1vXTrpjAp0fMsk9865rxMovmEhtO2
         MlyGPxZP6ZkJsmG7HhihK3VM+Hxjdha8I1hB/jPvhNF5TG+Rb4mJnPy4rRrArMzrUlxK
         tUITPnQIgA7/ZTcQJpBSbtdXUvvMpgXq3szOx+RIKor7jnF+UuI0GzK9nZu9bO2yNvAi
         YI1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwYXOteZ4ep/ZtKEtwY6EtWBJYEaa247lVbad4iJ0GwlesTud49GVtwts85j6XDUxh85c6t8SUe2jyVGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhWqwK0gRasdGvjdmgCyRNmKOZx/7KktHr8c5EJHnAud7SyyFP
	3LrLF0j4CmTQkgYPiIZPMZLDUeoCjqNKoWu/PexQG1WXE+Y5aTS/qYXDWjD8s5vgjn4=
X-Gm-Gg: ASbGnctWqZIVF1mBRWH0mFg7u1ChkMu55l9PVcdSMdG19+z0fNccNSmND9gIWgJF/O6
	8L8t7nAmkHDSnQWbjq/B4aXMHAKUjduHfSnQ992m8UgOi5Z7phPgATuISvsBZZH64khlW5vl3/K
	CdMQCg6Js6sDJXaMI624H/dg3muYV5iSHZ1dJYhCXckxXVNFrpRxBLmpdzYsbZ09hm/PauALuU7
	H1bkKEvrpVNVzWgQxRgblR9a8S1Itb8BJefvuQ+m/gkDreDof1k+UScSmoMmYe9fD6f/aZT+dDh
	Q8sn4Zj60tM5Cp3HKE0dNqqVlZbFALtM0U8jR5zE4f9lmXjiDHdeV9nJoPHXPCCzSceT4KGrI63
	qAn2OVxpaF9ctLmY82twNHKYZspMgeq2p81MbdJwPjt4jfcNg2OgOqj7yddZ41dQBucy11PIp+k
	0/fquQm1gcesW1O26I7DG7aFf9HBzA
X-Google-Smtp-Source: AGHT+IGwhxBXtvKQCuLuDCf/nGJEfM4DLEKQAoHQVK7c7AK6Z8TsMeRo2v0GxkveBG+7/VTqYRmzIQ==
X-Received: by 2002:a17:907:97c5:b0:ad8:87a1:4da8 with SMTP id a640c23a62f3a-adec55221aamr244337866b.14.1749810080571;
        Fri, 13 Jun 2025 03:21:20 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adf1b7fb8d5sm29584666b.98.2025.06.13.03.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 03:21:20 -0700 (PDT)
Message-ID: <f64cd2c7-905c-4554-b007-ad3fd528cec9@suse.com>
Date: Fri, 13 Jun 2025 12:21:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] module: remove meaningless 'name' parameter from
 __MODULE_INFO()
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alexey Gladkov <legion@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250606041029.614348-1-masahiroy@kernel.org>
 <20250606041029.614348-2-masahiroy@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250606041029.614348-2-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/6/25 6:10 AM, Masahiro Yamada wrote:
> The symbol names in the .modinfo section are never used and already
> randomized by the __UNIQUE_ID() macro.
> 
> Therefore, the second parameter of  __MODULE_INFO() is meaningless
> and can be removed to simplify the code.
> 
> With this change, the symbol names in the .modinfo section will be
> prefixed with __UNIQUE_ID_modinfo, making it clearer that they
> originate from MODULE_INFO().
> 
> [Before]
> 
>   $ objcopy  -j .modinfo vmlinux.o modinfo.o
>   $ nm -n modinfo.o | head -n10
>   0000000000000000 r __UNIQUE_ID_license560
>   0000000000000011 r __UNIQUE_ID_file559
>   0000000000000030 r __UNIQUE_ID_description558
>   0000000000000074 r __UNIQUE_ID_license580
>   000000000000008e r __UNIQUE_ID_file579
>   00000000000000bd r __UNIQUE_ID_description578
>   00000000000000e6 r __UNIQUE_ID_license581
>   00000000000000ff r __UNIQUE_ID_file580
>   0000000000000134 r __UNIQUE_ID_description579
>   0000000000000179 r __UNIQUE_ID_uncore_no_discover578
> 
> [After]
> 
>   $ objcopy  -j .modinfo vmlinux.o modinfo.o
>   $ nm -n modinfo.o | head -n10
>   0000000000000000 r __UNIQUE_ID_modinfo560
>   0000000000000011 r __UNIQUE_ID_modinfo559
>   0000000000000030 r __UNIQUE_ID_modinfo558
>   0000000000000074 r __UNIQUE_ID_modinfo580
>   000000000000008e r __UNIQUE_ID_modinfo579
>   00000000000000bd r __UNIQUE_ID_modinfo578
>   00000000000000e6 r __UNIQUE_ID_modinfo581
>   00000000000000ff r __UNIQUE_ID_modinfo580
>   0000000000000134 r __UNIQUE_ID_modinfo579
>   0000000000000179 r __UNIQUE_ID_modinfo578
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> [...]
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 92e1420fccdf..81b41cc6a19e 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -164,9 +164,6 @@ extern void cleanup_module(void);
>  
>  struct module_kobject *lookup_or_create_module_kobject(const char *name);
>  
> -/* Generic info of form tag = "info" */
> -#define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
> -
>  /* For userspace: you can also call me... */
>  #define MODULE_ALIAS(_alias) MODULE_INFO(alias, _alias)
>  
> diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
> index bfb85fd13e1f..00166f747e27 100644
> --- a/include/linux/moduleparam.h
> +++ b/include/linux/moduleparam.h
> @@ -20,18 +20,19 @@
>  /* Chosen so that structs with an unsigned long line up. */
>  #define MAX_PARAM_PREFIX_LEN (64 - sizeof(unsigned long))
>  
> -#define __MODULE_INFO(tag, name, info)					  \
> -	static const char __UNIQUE_ID(name)[]				  \
> +/* Generic info of form tag = "info" */
> +#define MODULE_INFO(tag, info)					  \
> +	static const char __UNIQUE_ID(modinfo)[]			  \
>  		__used __section(".modinfo") __aligned(1)		  \
>  		= __MODULE_INFO_PREFIX __stringify(tag) "=" info
>  

One nit is that MODULE_INFO() is now defined in moduleparam.h, even
though it is a general macro for adding module information and not
specifically tied to parameters. I realize it is needed in moduleparam.h
and that the dependency is from module.h to moduleparam.h, not the other
way around. We could potentially keep the MODULE_INFO() (in module.h) ->
__MODULE_INFO() (moduleparam.h) split solely for this, but it is
probably unnecessary.

The overall change looks ok to me.

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
