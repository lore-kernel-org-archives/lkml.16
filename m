Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5455619ABB6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745337563; cv=none; b=k75Cr7X9/XSZAO4WNeLJ3BIvhItJdoOyDbCI+tDiNWnvTnCcx6OEH4t38uyxwEjDE6R02R1aL8PYf3Dibiw2OD78K51iIieVfDe/QzYqMGPLU6JioLQSoCN3qXrgljy4bwQBu4luVPeWQscsSMhIRMNk+ztcw9nw/8iMkIfvGA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745337563; c=relaxed/simple;
	bh=XbWAU3tmPfW6ONvjlncwRN30filr8TZlVAT1ev3Gz1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPwXEji8S8MYTciU2qnYO3wXp7mFSCQ3rclypq5Okmq5cBwbhFpD/M6wcaQ7miStUmvP16WxLdj76zwWiF5LEh2BnRYHrHf/wZNMqlfjjcaS7XAlc95hDvzMJ3IS12WkFEtHm5DN/6GHvoMsTLqNZYdQ0vcqzTJJsaGXuYVw26I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fdr3Fh44; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fdr3Fh44"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so9584149a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745337559; x=1745942359; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2HIoPErxyU7XY1H5jqsCEW4/SJIZ39Qm+lQHto6QhKI=;
        b=fdr3Fh44IzC05AaNMYyg4GQQ1Y9sHvUpKgrxuwzcd/pcjZR2Mktu+9N1YJ5jPaGaPv
         Kre7S/ii+jnRUcREIuTfZEYqyHMnTS2UHXLHHS7r3N6yb+EcPCOVtv1pQh5kB+HDdm+Q
         l+PMV2yUAyM1kPzlJ82llwokTTDsnbFO++LIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745337559; x=1745942359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2HIoPErxyU7XY1H5jqsCEW4/SJIZ39Qm+lQHto6QhKI=;
        b=HnqcF+A3isp7Ven56PlpQGIi3eVVBCnA6WNsBvJppT/XMO5OwmfD2UySRC5o6YlL66
         CJABsn0NtL+2ad5JLX/mpCdK4RbDfya8G2vdTiOFdrVi6ce+5UqTdZk5B5NqYSRoYTir
         iT4OCe/aSd6miTf3nKcrI4W6U3Cio3Hou0VuBIMVv4YGCfXNST9zknUCw+eG2v1gbxKk
         TLd1npgtexlP4ViH/63dM9elxgrDeDT7zmxRRp3Ro/t+WuXLg8ZWMM333lYm/0/z7KHr
         MURPL3k26tXWJmorEKvHq4LQ9BSIPypeTv12vQym1KhTJU9oXQPxdf7yy8MgFCUwGF2a
         l0gQ==
X-Gm-Message-State: AOJu0Yy43a8SMbgsx8b4Piyh7SME3DauUm3Ezn++JrO8HfhYTCixZk2+
	tCquipmgr89dgbFvggcctb2UjuRxGXhgGlAWc4ytJkrcNk8bNcDVqTokoBoE3rGxI8pSSCSE4GC
	ekbw=
X-Gm-Gg: ASbGncuQqJavNGT74KqpEZjaPBu513Eao0XtL00nMZMT1eRWu/ByYXeV8q9+Zochxf3
	nnwRdujinHoe2ypOfmexr+yQ/AcpzAylHDsckHuYB6RIshU78XWj3nChWUVysa3vzVjaVdcfH9T
	3ZKJJMcOWVnV80OofVzPdmV/Pll9DrFvqZTAS8RCui/0Elw/jcJhoVOuvdi/iXVtzF7an5oZxIe
	DyuBoQL4sGvx3934tX6rlkJJ41pZNtnNtNRZS4prO3w9qurh4vjN40TCDPx6oPRDp+boDwiHF4X
	SUXOWzZkOc1/RysngTbAsNXaSRqyykKigPdpLEcjKqL+SyaiaXLUu7xot2DIxaWxeg4Iy+9fF5l
	D9xVUodDW3WQMUUw=
X-Google-Smtp-Source: AGHT+IFLLWCqSQBViAsy2Lz9XYwe+ppheY5yBfYI2lWa1APTBHjtH7HQVA3/xKNUvsPv+wr/N1s0ZQ==
X-Received: by 2002:a05:6402:234d:b0:5f6:243c:3e4d with SMTP id 4fb4d7f45d1cf-5f6285418b1mr13664168a12.12.1745337559256;
        Tue, 22 Apr 2025 08:59:19 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f62583400csm6079088a12.59.2025.04.22.08.59.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 08:59:18 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso816625766b.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:59:18 -0700 (PDT)
X-Received: by 2002:a17:906:a412:b0:acb:b966:3a7c with SMTP id
 a640c23a62f3a-acbb9664fbdmr360938566b.47.1745337558179; Tue, 22 Apr 2025
 08:59:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422204718.0b4e3f81@canb.auug.org.au>
In-Reply-To: <20250422204718.0b4e3f81@canb.auug.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 22 Apr 2025 08:59:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjsMVpEvwq=+wAx20RWe_25LDoiMd34Msd4Mrww_-Z3Fw@mail.gmail.com>
X-Gm-Features: ATxdqUFV2dt2KuulaBup-_NE8Ml_xIQNSWWwroYEWK8Kjdj7aaYMLZjZpPB2BWI
Message-ID: <CAHk-=wjsMVpEvwq=+wAx20RWe_25LDoiMd34Msd4Mrww_-Z3Fw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Apr 2025 at 03:47, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> These builds were done with a gcc 11.1.0 cross compiler.

That sounds like there might be some issue with the cross-compiler
logic somewhere, because the Makefile logic is using the standard

    KBUILD_CFLAGS += $(call cc-option, xyzzy)

pattern.  We literally have seven other occurrences of that same logic
just in that same Makefile above it (and many more in other
makefiles).

IOW, it's *supposed* to only actually use the flag if the compiler
supports it, so having the compiler then say "I don't recognize that
option" is kind of odd. We've explicitly tested that the compiler
supports it.

Does the warning happen for all files that get built, or just some
specific ones? I wonder if we have some issue where we end up using
two different compilers (I'd assume native and cross-built), and we
use KBUILD_CFLAGS for the wrong compiler (or we use cc-option with the
wrong compiler, but I'd expect that to affect *everything* - that
'cc-option' thing is not some kind of unusual pattern).

It may be that the other options we check for have been around for so
long that they just don't show the issue (ie the 'cc-option' for the
other cases may also be using the wrong compiler, but then it's hidden
by the fact that both compiler versions just happen to support all the
other options anyway).

                    Linus
