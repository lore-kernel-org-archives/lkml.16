Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA8517B421;
	Wed, 23 Apr 2025 15:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745423467; cv=none; b=PpvCgUcdx6ijn5ZawuK9W84DtLu8/S3ck+pYK9SLBxKXP4Gu2tvQ4V/L42XjVtgt8H2MushJZgBDIdUuQcQ4l/HBynLr08NpkBpRywT0m26jysBy2CV+8MGu2j5i9os3NbtJTLlxyh9PFUj5usP9YbTVjTD5iobSz8KFKL2CUhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745423467; c=relaxed/simple;
	bh=B1YKMJ/VnCvb13tK2on40+VgvnHD3klALa7QqH6XHwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qwD9DK8jJwl5mfFE0gZ6V56FDlbhJi7xa6kAXvF+uqlyeCs5crCESoCJOXwm1xqpR8zKB25xQJ7FAnedQPkxjipBHt+ayWTS5yvOPgKU+4YSCdbYNqi2OuHatvE56N4q6ygMAz7XgR15ziubYNdYEiy6dK8FU/pPN4G4cbx29BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWLEduGE; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWLEduGE"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22c33ac23edso66860585ad.0;
        Wed, 23 Apr 2025 08:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745423462; x=1746028262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1x0LjQOtwd7ZGiLXKIcfaebNJm+NkVU0O+im0vtc/gI=;
        b=NWLEduGEMeXuU4QId0UOeUDjZ1zm5eVoKsLFfAMyXRNR9Yw2AZFTKS0MlPvj0qxJSV
         D5KHe6za5HiL1SmK6K4XioOB8svZd4JZjYtsJPZJNY0+OFE7lroBDaiJcNfs/gAjop3P
         0PXJtkwXuvgCctsMrKLtNuw/dPgptUDTDX3EEya1ubTETRKdl2uTXDkQTdFkq6VMsHXg
         fAoGHlezXe3XqlskXmbMHwdkr07PQtHT9yS8KWm0XHXEHtWVHKgsrsTPJUu4sVP0+wCk
         By9DevaGQC0EjKf0rVJD4+ZfCZsC1WEe5bWL40H58ynSqfEWllc8VZ2OHbYJdhtO9VJM
         moAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745423462; x=1746028262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1x0LjQOtwd7ZGiLXKIcfaebNJm+NkVU0O+im0vtc/gI=;
        b=xIl85koxElVmVVBmKy59a4PpvpulnO8+5BCRc+DQJfLN4eGkEEvABeplfBgkVg31vf
         wPnjHQqd3szIMSHsvDakDRos6Spow3XX0neeVwULhv+hFdEW06OyDnC0KorUIZlewPED
         VydVkLSm5bmarJUKWsobgFrVa7reGfxK8EGsN2a7J7WmMin9FcBCTzwQhFL9g8HG43+I
         yTyrG3gMFdkaPLPvDCawDxafAwLyZiOPzEvLiOrBvNAHoNT17e3baHwtQEyhdgXpcMTY
         VMxKy5coirgEpHuHJBOuqJfCsO3XPq2NVBp6Y02NVfK+vo04qoGe4bjJQkAKWs2d9P5j
         aKzA==
X-Forwarded-Encrypted: i=1; AJvYcCVu4pT4QTvPFVfLdvFdijiv1EClLMiWLZvuPNvJtcX9i+OIv99GxE1u88nUYVdWCrvs6pMLl2ayjsBsB8k=@vger.kernel.org, AJvYcCWGSGw3jDIvRTL6xOjnp2zflRZcN2AiOx1G9TlC0gQrczAkV2qLLhuRUWgpY3DCbzKFF09/TQZqv/hxA4DSlqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXvAi39Yf1xe2WukVhQ0TcR7hU1J1AHs2zpBrFyaA37eiiO79c
	/VYisFGREKF9g/TGLT4BsGejG9M8CNZyR48LSfOqhTqYdqPl3N2U
X-Gm-Gg: ASbGncvAftKR6ZdfhsivAi7ZhYQie2M2piiPsx5OzyFER1q5Vv+4tZj/5f3oMBiNgn6
	+aj6f6jAyRJ8KQL82N+jb15s3px+/0FNjDiJbstWn+N85HLSxKutxzgRzIe95FhYO8ItUe8hpZp
	hOcoEQbNr7qqMFMb1c2488MgncyyfViS0FU/GHBn7OiYoVfuOBc6iGR1RsUp7Xy/zErYtm0f6cY
	Vw8g5q01A/DojuxYfCD+woLX8B4AqquvsUBBgZDE5SRdYpuX6GTWIVH4gq6lF+rAxyEQAZR2I5v
	HRoXZM26FVrgsGxytVnLMpMmqD8kCzc07lmFK4Gb
X-Google-Smtp-Source: AGHT+IGmT+yDYzc6f9FEH4JY+azUgWMSi7aZqK6fuTmOSzIp64TCmCxmBamClG/qmaIP+RwQylsdIA==
X-Received: by 2002:a17:90b:2f06:b0:305:5f25:59a5 with SMTP id 98e67ed59e1d1-3087bcc8b21mr27744965a91.35.1745423461783;
        Wed, 23 Apr 2025 08:51:01 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309df9232f2sm1813224a91.0.2025.04.23.08.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 08:51:01 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:50:59 -0400
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
Subject: Re: [PATCH v7 2/5] rust: add bindings for bitops.h
Message-ID: <aAkMY2QBG5btKVIO@yury>
References: <20250423134344.3888205-2-bqe@google.com>
 <20250423134344.3888205-4-bqe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423134344.3888205-4-bqe@google.com>

On Wed, Apr 23, 2025 at 01:43:34PM +0000, Burak Emir wrote:
> Makes atomic set_bit and clear_bit inline functions as well as the
> non-atomic variants __set_bit and __clear_bit available to Rust.
> Adds a new MAINTAINERS section BITOPS API BINDINGS [RUST].
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Burak Emir <bqe@google.com>

Acked-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>

> ---
>  MAINTAINERS            |  5 +++++
>  rust/helpers/bitops.c  | 23 +++++++++++++++++++++++
>  rust/helpers/helpers.c |  1 +
>  3 files changed, 29 insertions(+)
>  create mode 100644 rust/helpers/bitops.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b11eb9ebc53d..1f162f64eded 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4149,6 +4149,11 @@ F:	include/linux/bitops.h
>  F:	lib/test_bitops.c
>  F:	tools/*/bitops*
>  
> +BITOPS API BINDINGS [RUST]
> +M:	Yury Norov <yury.norov@gmail.com>
> +S:	Maintained
> +F:	rust/helpers/bitops.c
> +
>  BLINKM RGB LED DRIVER
>  M:	Jan-Simon Moeller <jansimon.moeller@gmx.de>
>  S:	Maintained
> diff --git a/rust/helpers/bitops.c b/rust/helpers/bitops.c
> new file mode 100644
> index 000000000000..1fe9e3b23a39
> --- /dev/null
> +++ b/rust/helpers/bitops.c
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/bitops.h>
> +
> +void rust_helper___set_bit(unsigned int nr, unsigned long *addr)
> +{
> +	__set_bit(nr, addr);
> +}
> +
> +void rust_helper___clear_bit(unsigned int nr, unsigned long *addr)
> +{
> +	__clear_bit(nr, addr);
> +}
> +
> +void rust_helper_set_bit(unsigned int nr, volatile unsigned long *addr)
> +{
> +	set_bit(nr, addr);
> +}
> +
> +void rust_helper_clear_bit(unsigned int nr, volatile unsigned long *addr)
> +{
> +	clear_bit(nr, addr);
> +}
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index aa0c0c2cdee2..aaf0f735d1c2 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -8,6 +8,7 @@
>   */
>  
>  #include "bitmap.c"
> +#include "bitops.c"
>  #include "blk.c"
>  #include "bug.c"
>  #include "build_assert.c"
> -- 
> 2.49.0.805.g082f7c87e0-goog
