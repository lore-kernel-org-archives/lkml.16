Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46526AA7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743610929; cv=none; b=btCZXSv/tM4YrWDokUGTHmy06CjJVt0hA9sGjr5t55lpYyW8aN7+xi8+S1HpqoJR4kMnYTUpcfMxqN+2Q5DTnwCh1NU6hFAeiGUrO8CWaYvsZvhLPtNAoknqoJ9J4WhtRT3zCudyUwr7sJT+I7HuqlUtcquX/yP6GJ/rKMu75RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743610929; c=relaxed/simple;
	bh=0H08aRlZgkvH9WKmuPWClfnJASAxHT/BrsLhDjMlzIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SSGs+EvY+fHrd0XqSXmJ4i14J3kS79aP5bRkdEByZg7ynheZ3j1gRHWOygH2XYkGdRdf2xfZDnEhlW/45ZF5t17nyxE0EiQ0N7baEt3i6A/4VG4WqtN9QodprkNvgW9xfD9kBeOGIojIxMJZel72Lpx5omHncBOZFPnjWliwCS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hOca3AAX; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hOca3AAX"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so908990366b.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 09:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743610925; x=1744215725; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EJS47bH8Z0iuT/emIvSz1L9vlwrq6uloO12yo+vBFXY=;
        b=hOca3AAXsuS4zEMdQ2EW/EnRpgMnvIQjGrbhsToHWPXOLF60Hn8fcWZz/nKqc1zTVa
         B0Rpju+f3q4OIdETbyyQFOaqQWD3rYMPXqsaVOr1rOXBGXly0gGckoQS3WpGXYOzXfdB
         6QMMBM8xckMjoMb2vsON3cxQdIjg6q4+zDSus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743610925; x=1744215725;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJS47bH8Z0iuT/emIvSz1L9vlwrq6uloO12yo+vBFXY=;
        b=DEooaRHn4saRc4MhiyF39Z6F5iDELB28hPa+mFcZo4Ij7HHwp3M0/x0Otffa3BxcCM
         a0OYU7YnYpyJUAbF1HnEzsxeLHl2EFdGjndMgvtfAik3EsAf6ZElBlgexx0a/wc2NIC2
         RyPLJdH232KxGE5Rdlt4bMadwyJL2mI2is+2+H8rE1uw6qQnyuPz5Il3/mCwbz3lqtCx
         l4LOjCEJWf6EgYWuntBBy6dSvqOoqZXcENxfW1mHKieE/H0IsUUEn3YvbEX1RIz5pAjs
         zVKWg1ZTRdP8zuW0m2KrMnsOoSjrg4mtm6yt3gFylozcfhweN4WJVo6UYP9b6nDHShYS
         pT7w==
X-Forwarded-Encrypted: i=1; AJvYcCXpA9kzOtDeSUaS1H9IxhawRjgRBLY88QuHENwGq+fOAonU4D1OqgOmJLexKF6eUzsbTw/nlKURcMKBj+E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Dk0TRd5BLAfomsK8OL5P4ipJrb9ADBHP43eZcwu1WRY+bMz8
	wVOFW3dQQFFwsTEVbnDUESry9hB673itBd6HfSa+d9iWSgEt4UNC6yVe34VcQnO3W1iUN0XgX8I
	uufM=
X-Gm-Gg: ASbGnct/WQ/RV3AeRBLdIES0hYSo33tFmIUwCahFc1KbyRgdq38bafq1vUDRTK5lZNz
	oWI1AcQ10BoY2fq8aZ+/FIWoMqeFXg0FO8TymbXMncY/DCI8ZwfTlKpJCZZXeimpd0c0R7NJE3n
	6rGR/K2XQ4BqLA/ySBhrorJRNvywuQvM1AYwPpHU/LZaxKL9lc8ngZtkx11f02TP4zTkhhuWwhm
	yOWZDdStjPIgKqYOxMWXBbiLkz3YQ/DldvcbUlxtd33MWOfmCGZnW1MXUKO3nUFz4yBN5JTzvWh
	odK3ANYn4BUAVSJP9f3plXvWjv1aPTM6ToIOeKquzBlHTbOQdxxuPDJWGAkTFyPjkbcYaPeeWgg
	hyIbXtxy031W7qTlRyfOfkoQqvRh8hw==
X-Google-Smtp-Source: AGHT+IEwu4sDIAsZNTpO8gxOVu8BZJTC+cUuPFYB/mItD0xwCIdr7a9qYKSmZlvVMy08wL1Y6p+iEQ==
X-Received: by 2002:a17:907:868d:b0:ac7:7f21:a9a3 with SMTP id a640c23a62f3a-ac7a166da72mr247730766b.11.1743610924981;
        Wed, 02 Apr 2025 09:22:04 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac78c9e0756sm236600466b.128.2025.04.02.09.22.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 09:22:04 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso1123114666b.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 09:22:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+LmuEqnixDCFwQt4iji9v6WeFSrrjCuwrJXuZPiVpEHTE5zyXDPHpXwtrdoueUtq2LLzHCX4qmiAAabk=@vger.kernel.org
X-Received: by 2002:a17:906:478c:b0:abf:7776:7e0c with SMTP id
 a640c23a62f3a-ac7a173d2a7mr252998666b.33.1743610923798; Wed, 02 Apr 2025
 09:22:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <xmzxiwno5q3ordgia55wyqtjqbefxpami5wevwltcto52fehbv@ul44rsesp4kw>
In-Reply-To: <xmzxiwno5q3ordgia55wyqtjqbefxpami5wevwltcto52fehbv@ul44rsesp4kw>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Apr 2025 09:21:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgk+upuXn7-wsDs4psxOJO4wW7G2g-Sxvv0axCibFua1w@mail.gmail.com>
X-Gm-Features: AQ5f1Jp-rnuhH2gY30m5eEOoyqnn25DOLTE3lJJK8XrLTYmOw0Ehbach_Zuaf90
Message-ID: <CAHk-=wgk+upuXn7-wsDs4psxOJO4wW7G2g-Sxvv0axCibFua1w@mail.gmail.com>
Subject: Re: [RFC PATCH] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: mingo@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 06:42, Mateusz Guzik <mjguzik@gmail.com> wrote:
>
>
> +ifdef CONFIG_CC_IS_GCC
> +#
> +# Inline memcpy and memset handling policy for gcc.
> +#
> +# For ops of sizes known at compilation time it quickly resorts to issuing rep
> +# movsq and stosq. On most uarchs rep-prefixed ops have a significant startup
> +# latency and it is faster to issue regular stores (even if in loops) to handle
> +# small buffers.
> +#
> +# This of course comes at an expense in terms of i-cache footprint. bloat-o-meter
> +# reported 0.23% increase for enabling these.
> +#
> +# We inline up to 256 bytes, which in the best case issues few movs, in the
> +# worst case creates a 4 * 8 store loop.
> +#
> +# The upper limit was chosen semi-arbitrarily -- uarchs wildly differ between a
> +# threshold past which a rep-prefixed op becomes faster, 256 being the lowest
> +# common denominator. Someone(tm) should revisit this from time to time.
> +#
> +KBUILD_CFLAGS += -mmemcpy-strategy=unrolled_loop:256:noalign,libcall:-1:noalign
> +KBUILD_CFLAGS += -mmemset-strategy=unrolled_loop:256:noalign,libcall:-1:noalign
> +endif

Please make this a gcc bug-report instead - I really don't want to
have random compiler-specific tuning options in the kernel.

Because that whole memcpy-strategy thing is something that gets tuned
by a lot of other compiler options (ie -march and different versions).

             Linus
