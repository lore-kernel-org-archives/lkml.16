Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6109B17993
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819143; cv=none; b=doNkuqHRGiH8P75ivbAfo7UhFSBEGEE77JBTUne5GaGw6dkYG82ZuKaFfkPnwm8trXP9tJVO9SoSjhS5NuDn87z6XOrSEPIOOVXWfIGysDofHb3sd0pyQtFlIQ0QGbMjY0X1aEOHExJkyvc2bh6DiE9SbiqpLPJCteYp+7KJZeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819143; c=relaxed/simple;
	bh=j2eNAg/KKupvhWIs/0ZWEEs8ZqDjFSlRxkV8RviBrNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gb+ftxs6thYAAlfH68xGT/A+F6OHTt0IivRv0sUvRHcWo/Nozu5Cj7fdAj6YCmEloM4TbpW1vdKJQ8pUCOtM+dEJ0zqt3vf7LqOzISY8bebln4aJFXfLLpJGKc6wBcMVYkokZFwppdrlus0+vrjybHAmKzIbyQmsvAnkW2e9Uk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=foZmG2HJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="foZmG2HJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so27033745e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749819139; x=1750423939; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SrJkTNDbBY1CY8qB60D865Ino0tRu90cuf/TAUpIk8k=;
        b=foZmG2HJ0TNRzuCUY2lheH9xw0l4FEOeulIqnn2JVHExb5wtt1GhwcAyYC1JGH5gxO
         jZBSvNN6hG0uiY/IMwK9xcBmew26VM2vQk5zaQcojgHw5+1wLC32A6JKzzZBiF+Op8+a
         SQrPXVWwi0HjSFsd5fxqA4N99x5P3lmml9oP0jUThYAm+ksSd8QCksdS4Cpim97xRRPU
         OO15YjuxvGRjji5kFqhpkmrjibjyH52Ymj/28Khrs2FryORE5+xUtU/pzDM3WdZnEfha
         6kPojs56HlgGH+JKhgrWI7YsmgMSmISzJTfh4/8LR28666cXbwM/P0qAHYy3cJygtowH
         2kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749819139; x=1750423939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SrJkTNDbBY1CY8qB60D865Ino0tRu90cuf/TAUpIk8k=;
        b=tyAKMDRKwqTA+R1Z1MWVbx32BvaxacMJkqf8GdZlbhzTal/q9ix/Lurd6vpQ8uyUs8
         YeMR74yrBRS5jwUmNtRYWeUX0FeuY2qrq5kF4tMuIp08LWUsUm0UhtFfxxhQHIABHsdJ
         XEUmqpMOTPAMlHmGp33mRYtPit3xQJA+C+LCkGzdjvaJHYqevlIOZ6VukeMLPp1UIyWp
         qK2SOYgimzvkcCDgqH2fGHy17t8U+FyZ/VVdYot80VQ96jECX3ANLTesnGxANGBNV7Yk
         +Wm2/akVg49QSQARey12N9A2ph4m2ZcJN+xI9Q4KfpqbWVXNVTv1U7txKR+EXRZkIczs
         dAYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ+fqx0IJ3sceFwY65yMP4LJhiOQk98ymTLl6XH8eI+5EH8Pb6PLf4/5hqHadIlgPD0QN6H3PJyjliQkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDylefbADFvoBNJj92nS19YvonTLzenqpV75Mo65jJ1AmwMpF5
	O8AXii3eyYd7GVhUieeGbwJX1D/Df1jvoBw/int2JsRRNpZVz99x7MY3iIbohFGyp30=
X-Gm-Gg: ASbGncvGw6VZKcxn5sAjT19KnRJMbx96JaYRbQGz/Qzofl7hPgWr1Mqw8oczcst9iU4
	5j6qtvycjTBmk1epPsEidtxWFYT5cVGOy5E28+B+KXgXri9IMmdXuk0MAdH+VyCjreqtPPg1dAG
	t64PIziw3c1DEbGnjUJ5ihqZDH9dx7NAMGabKYftzDrUG1g+V9JQwPJPOaEDI/v+rnJMJmIRHsD
	wth8OnvtomkuSEWwIdzGuBNK+nBoL6rvpZvxYGVSveExjeybzN5U5EytMgDAwgAhTinacZC/v/X
	9E/LKtJztOaf/KIPUOf6CQRyLLDui8ZP9ue42f6ABoF5Z0kvd5X6y1DteMxuJP7lpWjP52+kxuA
	fuluH
X-Google-Smtp-Source: AGHT+IHQ2NQzOPgLkiPUpNpn+2/VtnhtsQcsmzmuKewN6Uk7edLiZlgT0mpZTOGS3DIaKX8XMtsddA==
X-Received: by 2002:a05:600c:621b:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-45334aaf04dmr28628475e9.6.1749819138637;
        Fri, 13 Jun 2025 05:52:18 -0700 (PDT)
Received: from [10.0.1.22] (109-81-1-248.rct.o2.cz. [109.81.1.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7fa9dsm2287386f8f.44.2025.06.13.05.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 05:52:18 -0700 (PDT)
Message-ID: <dec42b04-b76f-4a2e-b060-9ac999fe1462@suse.com>
Date: Fri, 13 Jun 2025 14:52:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gendwarfksyms: Fix structure type overrides
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@samsung.com>,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Giuliano Procida <gprocida@google.com>
References: <20250609154926.1237033-2-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250609154926.1237033-2-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/9/25 5:49 PM, Sami Tolvanen wrote:
> As we always iterate through the entire die_map when expanding
> type strings, recursively processing referenced types in
> type_expand_child() is not actually necessary. Furthermore,
> the type_string kABI rule added in commit c9083467f7b9
> ("gendwarfksyms: Add a kABI rule to override type strings") can
> fail to override type strings for structures due to a missing
> kabi_get_type_string() check in this function.
> 
> Fix the issue by dropping the unnecessary recursion and moving
> the override check to type_expand(). Note that symbol versions
> are otherwise unchanged with this patch.
> 
> Fixes: c9083467f7b9 ("gendwarfksyms: Add a kABI rule to override type strings")
> Reported-by: Giuliano Procida <gprocida@google.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/gendwarfksyms/types.c | 65 ++++++++++-------------------------
>  1 file changed, 19 insertions(+), 46 deletions(-)
> 
> diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.c
> index 39ce1770e463..7bd459ea6c59 100644
> --- a/scripts/gendwarfksyms/types.c
> +++ b/scripts/gendwarfksyms/types.c
> @@ -333,37 +333,11 @@ static void calculate_version(struct version *version,
>  	cache_free(&expansion_cache);
>  }
>  
> -static void __type_expand(struct die *cache, struct type_expansion *type,
> -			  bool recursive);
> -
> -static void type_expand_child(struct die *cache, struct type_expansion *type,
> -			      bool recursive)
> -{
> -	struct type_expansion child;
> -	char *name;
> -
> -	name = get_type_name(cache);
> -	if (!name) {
> -		__type_expand(cache, type, recursive);
> -		return;
> -	}
> -
> -	if (recursive && !__cache_was_expanded(&expansion_cache, cache->addr)) {
> -		__cache_mark_expanded(&expansion_cache, cache->addr);
> -		type_expansion_init(&child);
> -		__type_expand(cache, &child, true);
> -		type_map_add(name, &child);
> -		type_expansion_free(&child);
> -	}

Nit: This code was the only user of __cache_was_expanded() and
__cache_mark_expanded(). It is now possible to merge
__cache_was_expanded() into cache_was_expanded() and
__cache_mark_expanded() into cache_mark_expanded().

Looks ok to me otherwise, feel free to add:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
