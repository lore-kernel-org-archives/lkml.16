Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2971D5CE8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744301902; cv=none; b=KsZ/GxsSyzz/H8RlQYCF3uRm07WyMiu1GlzqfCc7J5pTddoQS+8RSDVJfhZ1Mde8VVxPcfp4QMS+HnGtWZ2Eo6AQJLo8wFus7fx7i+PMp22QAup+U6sQkCiX0Eku8nG5jQjJzMDZGRLmtFayNpv2it1xIr+hLdUM0mBixr9d2sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744301902; c=relaxed/simple;
	bh=I3IzFVDnPwMOs+ga47BqJzQr4y137kBGBBEWnXzGMQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNdG+Kpg4BPoFpRC72lEvnm4VFi2avQeKevTE/ppFvkdS7h7qjTTK/KzYRAQz0NYoxr62xRbiDG9ZIHJ9ztm6A0KZfPaan7jxAp3HxqormvsvA1gEuJC+dBmqnMSaLjXktqHFPkgNl4dIXSsMoo+1X2yZK+x90H/6UElZyoR/Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hB4tIacb; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hB4tIacb"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7376e311086so1324545b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744301900; x=1744906700; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lCxhZYl4fk0TDqFgId2sJ/AGdUrHHzyamRopa5XEYgE=;
        b=hB4tIacbsA9+7Pqo9LttGRvu94jL+63ZknejhIzudX3lEYY+3KYjBjTVXfRD1Wxg2O
         xJkuE8mKoFRIcctqBffHWytdAVCBPQ9Z01DNMX+tl0VSBj51JBE4pjnD4cNX9QgkkywO
         f5o/im29gTd7Gu/lhzbl01WbnH6vomUX5B1LHpv/mDbId1+cYtfXmuicMYDhJ1rW6I4D
         HYxPeQgGQf6Wb8WY9DfVkRP4T+VKKIBF0l42GKsQ4IlG0vig3tXJUCO/u5Cw2QYOOsf0
         7f2bh5bVfGmYgK8Iu5LqY2rD/po+FoqVKolwOgx5e8FjpA3Djfk+t6r9sRNK4S9MrZSH
         qaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744301900; x=1744906700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCxhZYl4fk0TDqFgId2sJ/AGdUrHHzyamRopa5XEYgE=;
        b=XrjSpXgsdVJQlrUzhSfwltuV1k/xK93WiIaD75v4jzYksIjOm09fY0+8gTmnp5kNuf
         G0WJf2NuXUPbGFviIBCdFHMjd5b4qkXxxZ20qYLZYhNYeQZq4K+U6720SnR0jRyv79YO
         4+ovWAYtc2mfInctE6HEj51wOZdwD1rUBWpsYpa+lO39oZmH5GKVJI9dgcA9/kwx0rU2
         VjRqSZ9wNf4nhCI59z+PCMM753glqfp1FLMcFeJ8ta2R8N36p3SLJyAW2LmPTv0DXvo5
         5kSantNy39H8VUiFw3Ras8WVYQhBGVHiz7ycSLfDYVYG7xE9y2SQK+HTyYQKjMjRrdqN
         BZSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNM41xOLULbPN5EvmLzJiJtyWRGtxUDgmGpbAHhnBiUh/OU5vBHCNrXsBtdkevaxH5ungZSskSsBHXm8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL+HaspXy+6uxLI9CPWsQwHVtFAziKtnqPxqwpaRswps7FBrpQ
	WOEklh7uMsYaKJoSIp+uTabD/OY6jQ8QtDVaTlOrHy2k8RNvb4Rxi4cKpQ==
X-Gm-Gg: ASbGnctSPjeybzdJBiTRr7NfZidyjBYGNYnBweLjxFMC1t+vMgcbMZtClEWIiB3D58A
	2zgXRryRJ/E5Y4Fcqbg+fSSujhcoAvoriBNE5/xEPCBNiHwuk7rkBgg9pPYcVtPrN9Iswjbywge
	L3JPZSkFJKF6c38uzQcs+cUpOTa6ugHTqcIyRGOZwRGvZiwTkqJ/9nX69YJDMXD3dUeAsi5KQSX
	YouHPW2Pxls5HVda05WkowttmtjNNiyPuH+AzqEAHAH1cjF2k3LB67w6EosniwQgF2ucd+KUJp/
	IRDYiSz1w2vJeC9WDggzI33OGjSZ9v25p/gCAwLf0ES0aXoe7zE=
X-Google-Smtp-Source: AGHT+IH+bbDcNOprRKJ+JUoxvfJNTeENfKw01S5fx2tdPjkbSG6iW3e/eZZQfC0anRG266kMk/eAlQ==
X-Received: by 2002:a05:6a20:6f07:b0:1ee:63d7:1d32 with SMTP id adf61e73a8af0-2016c9242f4mr5446990637.0.1744301899736;
        Thu, 10 Apr 2025 09:18:19 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e38404sm3459461b3a.113.2025.04.10.09.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:18:19 -0700 (PDT)
Date: Thu, 10 Apr 2025 12:18:16 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org, andrew@lunn.ch,
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
	quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
	quic_pavir@quicinc.com
Subject: Re: [PATCH v2] bitfield: Add FIELD_MODIFY() helper
Message-ID: <Z_fvPOn1-v9WAnxJ@yury>
References: <20250410131048.2054791-1-quic_luoj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410131048.2054791-1-quic_luoj@quicinc.com>

On Thu, Apr 10, 2025 at 09:10:48PM +0800, Luo Jie wrote:
> Add a helper for replacing the contents of bitfield in memory
> with the specified value.
> 
> Even though a helper xxx_replace_bits() is available, it is not
> well documented, and only reports errors at the run time, which
> will not be helpful to catch possible overflow errors due to
> incorrect parameter types used.
> 
> Add the helper FIELD_MODIFY() to the FIELD_XXX family of bitfield
> macros. It is functionally similar as xxx_replace_bits(), and in
> addition adds the compile time type checking.
> 
> FIELD_MODIFY(&reg, REG_FIELD_C, c) is the wrapper of the code below.
> reg &= ~REG_FIELD_C;
> reg |= FIELD_PREP(REG_FIELD_C, c);
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
> 
> The new added macro FIELD_MODIFY() is expected to be used by the
> following Ethernet PPE driver as link.
> https://lore.kernel.org/linux-arm-msm/20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com/
> 
> Changes in v2:
> - Update the documented example for FIELD_MODIFY().
> - Improve the commit message to describe the need for the change.
> 
>  include/linux/bitfield.h | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index 63928f173223..421c7701a18d 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -7,8 +7,9 @@
>  #ifndef _LINUX_BITFIELD_H
>  #define _LINUX_BITFIELD_H
>  
> -#include <linux/build_bug.h>
>  #include <asm/byteorder.h>
> +#include <linux/build_bug.h>
> +#include <linux/typecheck.h>

Don't change the headers order: linux first, asm next.

>  
>  /*
>   * Bitfield access macros
> @@ -38,8 +39,7 @@
>   *	  FIELD_PREP(REG_FIELD_D, 0x40);
>   *
>   * Modify:
> - *  reg &= ~REG_FIELD_C;
> - *  reg |= FIELD_PREP(REG_FIELD_C, c);
> + *  FIELD_MODIFY(REG_FIELD_C, &reg, c);
>   */
>  
>  #define __bf_shf(x) (__builtin_ffsll(x) - 1)
> @@ -156,6 +156,23 @@
>  		(typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask));	\
>  	})
>  
> +/**
> + * FIELD_MODIFY() - modify a bitfield element
> + * @_mask: shifted mask defining the field's length and position
> + * @_reg_p: pointer to the memory that should be updated
> + * @_val: value to store in the bitfield
> + *
> + * FIELD_MODIFY() modifies the set of bits in @_reg_p specified by @_mask,
> + * by replacing them with the bitfield value passed in as @_val.
> + */

Please inspect the codebase and convert existing opencoded FIELD_MODIFY()s.
I don't ask you to convert every driver out there, but core kernel files
should be clear.

The first good candidate for you is __tlbi_level() in arm64. You may want
to use Coccinelle to automate the search.

Thanks,
Yury

> +#define FIELD_MODIFY(_mask, _reg_p, _val)				\
> +	({								\
> +		typecheck_pointer(_reg_p);				\
> +		__BF_FIELD_CHECK(_mask, *(_reg_p), _val, "FIELD_MODIFY: "); \
> +		*(_reg_p) &= ~(_mask);					\
> +		*(_reg_p) |= ((_val) << __bf_shf(_mask)) & (_mask);	\
> +	})
> +
>  extern void __compiletime_error("value doesn't fit into mask")
>  __field_overflow(void);
>  extern void __compiletime_error("bad bitfield mask")
> -- 
> 2.34.1
