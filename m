Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8123224A078
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746447440; cv=none; b=sGODTuisBVQbdwY3avctDxVEaAe67Hv0c0rj593lfyMqTBC14Y9cVUHgNJm2wUspcGeQlbpIStG1nnEaY0VIQKclcIrHQQyPl0ziZhpKDw1bkIL1zY/5GmSyGi23rYxwHUu9i0YELvNWHnP3n7vKgJOYvDpMA6yNKqstCYh5f4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746447440; c=relaxed/simple;
	bh=BREDZXAmaPjM/X5b0tx0owsLlE8OwE6GhnlwAd9vfWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DrlQZJYSBADbAD6dt2+eENGBZBl13rcq+rn3EgMTaV5F++3dphU6R03YsM8ghyIhFkGX5rjgQARlx6V8MZMzSSjyscfCOc87mObu2IYiKYRva0Cf/Yx1RqXyXKDtoTgQQLYf5HyX58me79my4nx0c23USsEPuoYD656NBqOqJRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LQr2tQRx; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LQr2tQRx"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb1eso7202387a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746447436; x=1747052236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=myd943qeytFkxv1f6Nlms25UU0W8wxTEqMD/K5etliY=;
        b=LQr2tQRxllksAk9+q9e1F57oiRuyE5NSnVS5bhfGcqfw6sfVIEqeZFZ1TJnWO3S9B1
         hIWxAsng5t3ZRcL8w/qwbmlgg4CQBrOfT/pOw3VSpYjcsgLXbgoBMc8K6G+00j+Qvil1
         pKK/zHXK2M57C34r0W8XRIYDQ/f/yV8a0Bnc+6JAn39bqhE47+vKS5z+d2S/SIyCGJES
         WYBfmSwIu6/vl2/DsWqDKYVJhUqs6kBg4QEhCqyWzX1YfuInrTvPpddcdsHhjEb8/thB
         1mdv3no2z36iHsXPIjEtHXmODY/qBvku/22yROQkL3Y8sDboMeD24B1vYYk6pPbg8tnE
         9dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746447436; x=1747052236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=myd943qeytFkxv1f6Nlms25UU0W8wxTEqMD/K5etliY=;
        b=chJBmJnS3q0XOid/zAxbr3l4sjoGBy4aNQl/osRO8BSuef2KACjJ86EcEav+G1cZiM
         QoHExi6/ryBwh8LLEZKUogdgm5r4y06QDMGCBU/eN2pxOqff94QgL/VmsOkeVVWDDQre
         jsW8EbcvOvmTuRInZlTcPo+w9lqv2VH7UUU3fXYfYnQNXWA2DHN0S1yexnulM5yIn4OS
         y5ZsOSQf0OxscKzaLJ0MtsxUflDBEYA3AkCMj2S7oJQ0SqvJPejakCgxMRA6lf9+7y7u
         7KeQhkvXioG8aLl5bcNkhn6iNtsWcqqY235iaq8fSvzmWPgIfSfKO5vdXSnfY1FWvJrj
         GgAw==
X-Forwarded-Encrypted: i=1; AJvYcCWESlLB0B8jMxapXvkkvpg/K0/+cckZaGLe2BAu9NrsYlNspMaLuVtqsazUm6zHwKc6FKzSWw0Xx43MYKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT6tWUVqRzDTcbDNS5rzkZW0wPN3QYdAX7rKJGb0q6PChpeHQB
	dyAq5Rknc4E/AjmNQh/b3u+RrZm9yle4+PFqCuXTzHIXyIVYnGzzx4kFe3fJl5g=
X-Gm-Gg: ASbGncsVwWXUcylIWfKFDgK7bQZd+qG7rEdG3NB3NJroNmNGWg2GiLnCRVsWqbfOPxU
	Dlq0Qa3KmmwBz2qZosiL0WtbDXOP4wMO7g7TKlWCQbPz6Ov+70WhCDN/2yrUokWK+RO91tU5Ji9
	GHVEyu/gLo+Nw8T7G/tvdLtihGeqmHwhcb086C7eK6UAd6fxLRbHfFSz4nn0BBseAR1tYtZIDTx
	i5XldGULd5/RQQQTlGo+x1IGLMYtCfpiLG3HBbfDzSm49dOhtgCi5JkuO2WojlI8ciEgxdpMOk1
	ny9yqKmofso2T8cBFiifABFXGiC/7PeMWm3Pr/PCEBw=
X-Google-Smtp-Source: AGHT+IEenSjiu4Qhw7WCpvLoQWTwKhG6JMkx8XfTfu1IIxQXweU+ZPuYlCXJzCW60Hm8EzPIKwdd+Q==
X-Received: by 2002:a05:6402:2793:b0:5f4:3976:66c5 with SMTP id 4fb4d7f45d1cf-5fa73291384mr10824427a12.7.1746447435768;
        Mon, 05 May 2025 05:17:15 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77b90080sm5494805a12.52.2025.05.05.05.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 05:17:15 -0700 (PDT)
Message-ID: <5b0fd8c8-8466-437a-95de-581075f8faf5@suse.com>
Date: Mon, 5 May 2025 14:17:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] gendwarfksyms: Add a kABI rule to override type
 strings
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@samsung.com>,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Giuliano Procida <gprocida@google.com>
References: <20250430214049.2658716-6-samitolvanen@google.com>
 <20250430214049.2658716-9-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250430214049.2658716-9-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/30/25 23:40, Sami Tolvanen wrote:
> In rare situations where distributions must make significant
> changes to otherwise opaque data structures that have
> inadvertently been included in the published ABI, keeping
> symbol versions stable using the existing kABI macros can
> become tedious.
> 
> For example, Android decided to switch to a newer io_uring
> implementation in the 5.10 GKI kernel "to resolve a huge number
> of potential, and known, problems with the codebase," requiring
> "horrible hacks" with genksyms:
> 
>   "A number of the io_uring structures get used in other core
>   kernel structures, only as "opaque" pointers, so there is
>   not any real ABI breakage.  But, due to the visibility of
>   the structures going away, the CRC values of many scheduler
>   variables and functions were changed."
>     -- https://r.android.com/2425293
> 
> While these specific changes probably could have been hidden
> from gendwarfksyms using the existing kABI macros, this may not
> always be the case.
> 
> Add a last resort kABI rule that allows distribution
> maintainers to fully override a type string for a symbol or a
> type. Also add a more informative error message in case we find
> a non-existent type references when calculating versions.
> 
> Suggested-by: Giuliano Procida <gprocida@google.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> [...]
> @@ -372,9 +405,81 @@ static void type_expand(struct die *cache, struct type_expansion *type,
>  	cache_free(&expansion_cache);
>  }
>  
> +static void type_parse(const char *name, const char *str,
> +		       struct type_expansion *type)
> +{
> +	char *fragment;
> +	size_t start = 0;
> +	size_t end;
> +	size_t pos;
> +
> +	if (!*str)
> +		error("empty type string override for '%s'", name);
> +
> +	type_expansion_init(type);
> +
> +	for (pos = 1; str[pos]; ++pos) {
> +		bool empty;
> +		char marker = ' ';
> +
> +		if (!is_type_prefix(&str[pos - 1]))
> +			continue;
> +
> +		end = pos + 1;
> +
> +		/*
> +		 * Find the end of the type reference. If the type name contains
> +		 * spaces, it must be in single quotes.
> +		 */
> +		if (str[end] == '\'') {
> +			marker = '\'';
> +			++end;
> +		}
> +		while (str[end] && str[end] != marker)
> +			++end;
> +
> +		/* Check that we have a non-empty type name */
> +		if (marker == '\'') {
> +			if (str[end] != marker)
> +				error("incomplete %c# type reference for '%s' (string : '%s')",
> +				      str[pos - 1], name, str);
> +			empty = end == pos + 2;
> +			++end;
> +		} else {
> +			empty = end == pos + 1;
> +		}
> +		if (empty)
> +			error("empty %c# type name for '%s' (string: '%s')",
> +			      str[pos - 1], name, str);
> +
> +		/* Append the part of the string before the type reference */
> +		if (pos > start + 1) {
> +			fragment = xstrndup(&str[start], pos - start - 1);
> +			type_expansion_append(type, fragment, fragment);
> +		}
> +
> +		/*
> +		 * Append the type reference -- note that if the reference
> +		 * is invalid, i.e. points to a non-existent type, we will
> +		 * print out an error when calculating versions.
> +		 */
> +		fragment = xstrndup(&str[pos - 1], end - pos + 1);
> +		type_expansion_append(type, fragment, fragment);
> +
> +		pos = start = end;
> +		if (!str[pos])
> +			break;
> +	}
> +
> +	/* Append the rest of the type string, if there's any left */
> +	if (str[start])
> +		type_expansion_append(type, &str[start], NULL);
> +}
> +

I'd find this mini-parser more straightforward, if its main loop started at
pos=0 and looked ahead, instead of starting at pos=1 and looking behind.

The patch otherwise makes sense to me. It looks similar to the override keyword
supported by genksyms.

-- 
Thanks,
Petr
