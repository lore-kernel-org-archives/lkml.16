Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65651CEAB2
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 21:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746394479; cv=none; b=l4fnSCd2ankF3WQBEmNUDmO6jC1EOfPlotBmPIS1C4z6KU653EoLJPR4SXcOo7VfToic7Rf1kSA/Aj6OR6I10mDkNWKtFFn16om28XJ+62rb2zdd63rMvbRZugdkHwK4tCgx7lsoTGF11TyR2gaANHUjWawEOHlQV5XRDTwds+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746394479; c=relaxed/simple;
	bh=qQ6+8cE5e5EHFXn5NxB/CXa02VUpodEs2yKGXRKWwoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pByijr0Hv6SXrv6xaLEE0QhogkXwRnpk2gXp0twiWQeSHtK57mWBcnMsLT4kgGKsc6XrF1HHQgELQfI038nPTMerD1Ni4qGzBbz20mjjoN/4YWMg6ms3bRdlJkY8NJEJKw7no6vcO4GVXE8jEcKXx5aBgC/CLWfyx9Fp+nypBUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TuO8lOxH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TuO8lOxH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so30636875e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 14:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746394476; x=1746999276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5h6I1B2EumxGUUNgMiGQPfLYm9ioxQ8rrkwhbta6JY=;
        b=TuO8lOxHVOc7k5iiI2mc7iUAkXb+b/bvB1k0XXDdws+In3Qq9FICb28vwO9mD6Ztf9
         qBK2ma8sXGdkGU4QhqEbwSDdCfZjk6kVYmjietzdKrmMy8iLwQt3G9SnJ1cpNPqeVEqQ
         NGsM4GOXlhDXZAXEfUjbgt2vP9joJuuUeQl/918Fddw6rw+v5vU8+ivo0z7yg6d0epO/
         qcRgIEx1rrykieY+YewdN574tYWEnPrwDr3AU86w99Kar29BNQjKky8tBQEcHNEjueXC
         /xOqHQvMk1TRHEVRUUZg3SgZFTGMRgFvUiaU8j3i7niz7qUFikWp08QhD4k7quOSELAr
         CFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746394476; x=1746999276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5h6I1B2EumxGUUNgMiGQPfLYm9ioxQ8rrkwhbta6JY=;
        b=W9KrffYkOBWXz0qLCGjzFPjMkPN3+5wcH6kvqPNdrKqmFfdY1JjKfB/8j/CfCj/n4r
         mcpWKMwBhXjLq2tPaul89GffGDxC7f1TKnUdjKxRNzFO6b/YQY3ExxZHALV+JqhYRz+n
         II5yo6sxikP1/XyeNupy035E2tNCQEHFJIb+P+4SYkReQBBPsvgQ4PDWUqRd2yzkqWE4
         act+OuRrH7FVGKltV7jFtNQMZv3MxPMgc4uyC2l7hBQC5beIwstHO4VSHdHEhccJtpe6
         3qisVHKRhHu2LzI3hCvL8F8vJbL6GGLfHaoGR93MC/nAJyLtza42RlScx6wHtoqWc7fG
         Shxg==
X-Forwarded-Encrypted: i=1; AJvYcCWuc3dStcpUGxtlQ6700nGNtPBa9dZ420ZX+KFwfqPDKRtS+JEzZw5CBAVGxeTYJE/W5DVzry9Qr1XwBnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJi39bI+iPt1Lal6OvbnYbIEtOWdFQErr2LLIpdgWIpFPOU7p6
	52AQHB8qwWvi2ou+RgLldjqG+NnRJUQ2660czj01kOmosn1ASaga8OWKBSo6TBR2z25YWzvn5tn
	RF5k37Zwq+7gWZqXWQW6SAMuF6mE=
X-Gm-Gg: ASbGncujKOvrA8IcjlrPwU8j+YQ85mI7x5KsXdjD9ATs+axwa/Ezwt3oMR2kl87vdNj
	V6u7dB3BT2AbBrM6kCs2VOXQYJu2Vp8atoy35ReqE7+MmOCjoQtcHJoyZDruPIHsnbO1z6XbQ45
	r2rOJa2SF69snTfeJfP5CEDrw=
X-Google-Smtp-Source: AGHT+IFr/ffU3S+Bcjd1sodOm+syXMczUvmTSuO46qAChScji4OUmr+q+4/zUEzHxk2aA8yhvLcXylE3LscFEHxeUTg=
X-Received: by 2002:a5d:584a:0:b0:39c:30cd:352c with SMTP id
 ffacd0b85a97d-3a09fd6dddemr3186212f8f.8.1746394475826; Sun, 04 May 2025
 14:34:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428201409.5482-1-trintaeoitogc@gmail.com>
In-Reply-To: <20250428201409.5482-1-trintaeoitogc@gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sun, 4 May 2025 23:34:25 +0200
X-Gm-Features: ATxdqUEocI_y8g3-crzqqnu9TlwBMVPxrfYu5E8lZBzXKc40AXAeG5jrb780eco
Message-ID: <CA+fCnZcSDP2k0TT45wPdpQGJEEbZmjz00we8OjpLufaWF+K+8Q@mail.gmail.com>
Subject: Re: [PATCH V3] mm: page-flags-layout.h: change the KASAN_TAG_WIDTH
 for HW_TAGS
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Cc: akpm@linux-foundation.org, pasha.tatashin@soleen.com, surenb@google.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 10:14=E2=80=AFPM Guilherme Giacomo Simoes
<trintaeoitogc@gmail.com> wrote:
>
> the KASAN_TAG_WIDTH is 8 bits for both (HW_TAGS and SW_TAGS), but for
> HW_TAGS the KASAN_TAG_WIDTH can be 4 bits bits because due to the design
> of the MTE the memory words for storing metadata only need 4 bits.
> Change the preprocessor define KASAN_TAG_WIDTH for check if SW_TAGS is
> define, so KASAN_TAG_WIDTH should be 8 bits, but if HW_TAGS is define,
> so KASAN_TAG_WIDTH should be 4 bits to save a few flags bits.
>
> Suggested-by: Andrey Konovalov <andreyknvl@gmail.com>
> Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
> ---
> V3 changes
>         - improve commit title
> ---
>  include/linux/page-flags-layout.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/page-flags-layout.h b/include/linux/page-flags=
-layout.h
> index 4f5c9e979bb9..760006b1c480 100644
> --- a/include/linux/page-flags-layout.h
> +++ b/include/linux/page-flags-layout.h
> @@ -72,8 +72,10 @@
>  #define NODE_NOT_IN_PAGE_FLAGS 1
>  #endif
>
> -#if defined(CONFIG_KASAN_SW_TAGS) || defined(CONFIG_KASAN_HW_TAGS)
> +#if defined(CONFIG_KASAN_SW_TAGS)
>  #define KASAN_TAG_WIDTH 8
> +#elif defined(CONFIG_KASAN_HW_TAGS)
> +#define KASAN_TAG_WIDTH 4
>  #else
>  #define KASAN_TAG_WIDTH 0
>  #endif
> --
> 2.34.1
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
