Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5B628A1F7;
	Wed, 23 Apr 2025 15:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745423217; cv=none; b=odVQZlFfYZKZIC2zWlFEQY63YunNNAgM0Zc7AiFq3piHEZYr3DpsTdAAOptSsfF9op8zALxmmKvBVPw2KKtspRx/FQbzF5NVSCeWJDV/S0xHTrOFZTo1AGJ/g6EmRHeeNwqr8B29PmR1BCT8OXVt92SJeqGflUWmwLBa6+XFn1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745423217; c=relaxed/simple;
	bh=vrmcj/DRRXoEE4g5+/UDqfl/efG65MRAmjsTODcoRPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQ7+WyydzuawMq7UlAeE/iuA+YQd5wV7xDrijl/OW4/In+XsGW0XLVSAGphoTTMGYn++0wDiNl5yfxSqDEgoIHv7ijXqZHUkJnQrvooLnjl+1lwYhFFEwj9Nw3h5eZ+BH/Qjqq30+Sdj+i9tV5T89RImwnHWEDOBveczXFHXpiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FEJHpJr5; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FEJHpJr5"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so5313487a12.2;
        Wed, 23 Apr 2025 08:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745423215; x=1746028015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PK6BPLo/gQURCd8PESuRlz9LDSgRn27UuxKkBeWkS+s=;
        b=FEJHpJr5L5dRbI+kKrR8e0FJn4G+YU9PS22G3Kih4js5ocb3mSwai3ch10+zaBPIRv
         otooEvMVuW2hJAh1/mvAYhTudoQGcbeyF1efJh1NH4sPb/hU9bx/+FP0fop7+qByoRq0
         GrVXmqYfF5iIdxt6r6vTtoKheW9rfE9l7578U10XRVUQxPKGuW2Yg1xnNX7EwQ+9SCVM
         P6E6zDdJhTm0CA4+wISI0ah55gfVU0E3TATeJTJfNFgbSvHuNaZN0DKYGYbpCAAvJ10x
         RhGA4dxSpr/Uzon+4J8EgTPfPSMco9+YKibtNL0EMuRShatAC3A0opPxVg8EZD7JUM2l
         MSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745423215; x=1746028015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PK6BPLo/gQURCd8PESuRlz9LDSgRn27UuxKkBeWkS+s=;
        b=rqE2kvdbVWQM7d+L39G1zVAFHvy+8Rpe2s5EQQeNHMAco7CgH1JH3XYos9v75mlbAi
         C29VkCIvj0Ad4KSMZFAdBwMVWg46KpPyzHDRjCI/2BOBouDE+HfSR49tNHW9CG5cfMVm
         w/0b+yM/bK87tiZuXNA5wmwB/Cjt/oRCQT0LhDOAnmnGFFZ44A0SfRiB1ZsaoptLFbGd
         9a19RCqyZRhkWN8TNXousyl/TtKl+j9qhzJH+KyZgPQg184ntes0KZIta8IcgOynCfwB
         1KdFRjRzAOMp3XHtIOwBE1dsMkvVSfXOsOnohMfuspzPcQYdqXxOCKq53k+M/SNP7dlp
         FDcw==
X-Forwarded-Encrypted: i=1; AJvYcCWZEDdcA2sZEWIZYl+p0YdEGWr+FRiVqeA8cUIgVdkqNC8b1W+jinqVER8f1N9QvoVU4bqJGhsukLdYxhc=@vger.kernel.org, AJvYcCX90nWL5LeROAjmhORmjLDFfKSKsiPgKF93/TFS3DC9hYQjG1MPNhEd9mm04vcV4iI+eo/h/on/PVRT2Da0khA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzct+GGMXFGCUJmrlcRBeb9xVmg9Pp31b3morOoaLGsnnp10gOw
	6Sl7JzZVnkjt5QfQ5suu5+JJrPT0ZqIUya2Bm3OamWx80ovvto9V
X-Gm-Gg: ASbGncvbzAKNfFr45F01O6v648XvQN03gkYR60HGWuwmlr0EkfCAVOg8cWX65Pbo4QX
	v4hiWc1mMAfiu8URuMQLVbFKmxmuKSlyfD/2Vep+JK8XhbX7l0bQXTvz2BRnDNQIMnHkkFYgDg9
	4/LI6h56FXSh9JG6IYqd15YGeaX3aPzpgKoLHDKoTymrEMVUfdZtqD0AIUjDYNeJuYeX+QPJ+wi
	YM566SToN8CI5lnI47PP0dPTXyWiGm1CrwWOwethYCF0NvmrQBMPIHZAaKYTEpSJA0mrEqK21FX
	zEIVN3mswbfyMRvu7t0vTrm8JXW7OmzgrW3TailH
X-Google-Smtp-Source: AGHT+IFPIFEmd+5NSTcDxlM/ZdddBwAPIrOGuOtExVvUqIKLOGNnFR1hVCZ73iRvRwn+qFq1E49I7w==
X-Received: by 2002:a17:90b:1d4e:b0:2fa:228d:5af2 with SMTP id 98e67ed59e1d1-3087bb623b5mr26658208a91.15.1745423215090;
        Wed, 23 Apr 2025 08:46:55 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309e0ccfb63sm1776833a91.38.2025.04.23.08.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 08:46:54 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:46:52 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Burak Emir <bqe@google.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/5] rust: add bindings for bitmap.h
Message-ID: <aAkLbDyOwVs2e7dl@yury>
References: <20250423134344.3888205-2-bqe@google.com>
 <20250423134344.3888205-3-bqe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423134344.3888205-3-bqe@google.com>

On Wed, Apr 23, 2025 at 01:43:33PM +0000, Burak Emir wrote:
> Makes the bitmap_copy_and_extend inline function available to Rust.
> Adds F: to existing MAINTAINERS section BITMAP API BINDINGS [RUST].
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Burak Emir <bqe@google.com>

Not sure I suggested it, but whatever.

Acked-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>

> ---
>  MAINTAINERS                     | 1 +
>  rust/bindings/bindings_helper.h | 1 +
>  rust/helpers/bitmap.c           | 9 +++++++++
>  rust/helpers/helpers.c          | 1 +
>  4 files changed, 12 insertions(+)
>  create mode 100644 rust/helpers/bitmap.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a5584c5020ac..b11eb9ebc53d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4132,6 +4132,7 @@ F:	tools/lib/find_bit.c
>  BITMAP API BINDINGS [RUST]
>  M:	Yury Norov <yury.norov@gmail.com>
>  S:	Maintained
> +F:	rust/helpers/bitmap.c
>  F:	rust/helpers/cpumask.c
>  
>  BITOPS API
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index ab37e1d35c70..b6bf3b039c1b 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <kunit/test.h>
> +#include <linux/bitmap.h>
>  #include <linux/blk-mq.h>
>  #include <linux/blk_types.h>
>  #include <linux/blkdev.h>
> diff --git a/rust/helpers/bitmap.c b/rust/helpers/bitmap.c
> new file mode 100644
> index 000000000000..a50e2f082e47
> --- /dev/null
> +++ b/rust/helpers/bitmap.c
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/bitmap.h>
> +
> +void rust_helper_bitmap_copy_and_extend(unsigned long *to, const unsigned long *from,
> +		unsigned int count, unsigned int size)
> +{
> +	bitmap_copy_and_extend(to, from, count, size);
> +}
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 0aea103c16be..aa0c0c2cdee2 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -7,6 +7,7 @@
>   * Sorted alphabetically.
>   */
>  
> +#include "bitmap.c"
>  #include "blk.c"
>  #include "bug.c"
>  #include "build_assert.c"
> -- 
> 2.49.0.805.g082f7c87e0-goog
