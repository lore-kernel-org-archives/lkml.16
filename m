Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF7EFBF6
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034770; cv=none; b=EaB9U6fnVic8Tu+RvRGZlF0uoyjRgAIepk9+fVBa9TsKtII/xmhwVqPsoTIAFDx5/P8PqxIAAW9UH9xWUsMgiVPD9zY/ZGP188SCyMuYWiUY400CC6CnsgroL4OMwOYBqAu/nUykqOGBvsOYxHogFfHcB1ibhVIs6JkeKsFIARI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034770; c=relaxed/simple;
	bh=Po4u001r36w6b0m/+peKhn+9f+wXsw6fw50zBQ2mS6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hwiznzUXpUZ5jBe/EihS4EyW7NuLlGXCqVRx4vGWA6ISSjRDME/7z/YHnXgjCgVC6ULUmST541M4yCuOFuZ/z9WLIZiYyyQVpVkuB7ZqeWmd1fBr+OMJjPi1TMJb2Sd2wQSx01YHgTEJD56S4X+NU4/SaMiQPWrX9FQZTGJ5oT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gPwYuyKH; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gPwYuyKH"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6ecf99dd567so25942106d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751034768; x=1751639568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRHcsCTsHBJJ/xPjm9td2b9ZVcHsn4qi0sxiMajgt+I=;
        b=gPwYuyKHxhwoEbanprOIh/57CEyP03cbIzJKwi5KKraefC2IZzXSIenDkyPHo0IH0j
         ublPcITE9ig7QW9L5VioufYTKb1n2Q0HpX62nIFz/OzOOnRfrFH78isD7HAC3ODTJYY3
         zX/7QpPNoaCoyZTl7w8Vi8yty92g9XCWuhydE9ErDL0AnLcBcSn9mvZXAgmykZmSYSBX
         Mdnym3NmzmJzD5U6LwZEP+0gFz0J+fbq9P8IM021Ezg7c5I2yAuVdrSx3fJ95oqcCdBp
         ZNcY1rr7CACetUxTQ7DkXYaR5Oa8IJSNjP0BqnUvrZVF3bv8Wl9VOOM0zwWPQo9MNK5f
         ny/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034768; x=1751639568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRHcsCTsHBJJ/xPjm9td2b9ZVcHsn4qi0sxiMajgt+I=;
        b=cVpS//e0UdvmVBdaB0mbYRw9Jbq92UXD0PhLXokvcIv9DRjmuWfyVULPRqPNcQPDEi
         YGqg+hS1/rZ2R9ya52mXUJb1lBaIWT6wkI/MrFag4nyq7z0FUDb+Zb8mO949QNjKXKCa
         R+NUxQWYjZIDrEUG6tW/aq8eqVaNlASZVsFmUbWgMohLw0cRMWkOLzYBl8g/z7j6UvG5
         eJyTOTez/cPkWKpR8gj0/4i01IHBunuyW1uw6zaIpWxL/6XS1KIPhQ+SDLf8QqBmRmzt
         O3HfnRBJkALiaqAIdxRCW3VdT3LanjBFY98G0dOyGy21xRG/8NjUmg6U9v46yrCb+O60
         1T6w==
X-Forwarded-Encrypted: i=1; AJvYcCVkrhPTR+w2jbcOE4qUmd0zEajncOOe7usIRBdkjHdsfQ+v3gKjjWllHYY3en35ch4JeRlWqwE0EcTlPdc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgsd4Z8po6d2IYX7ojEqXU5gEryB1uGvYEJbqQoC0ckL2Q+Rcx
	ivq6j4zRjtNKUBaYpUY5FeyhM/rA+ooJF8ngqDEbi13FLHLMDZnUMAaazVQ99fkDd968k7BFqwk
	xeI+wDwPARKJad5phnznFcnBeU1zsbZNFVLY/2F9r
X-Gm-Gg: ASbGncu6wYwKtp78oy0Q5u0RVpAUYWdvz9Hw5lBNvnoxcCiJVRfZRC5A4VUK29iPPGk
	e8R3xmbTdg4Ow7D0e6r+YSdMBiGaMRXMe47PCbxyKpFy8HzUbxgVC/WRb21kiGv55Rk2pqKrYNE
	a9s/VLT5pEHwGeo/PRqcSGfC41ATVsdZ9L1F0pbJPaFXXxI4UY1OEnR8lRjFGAZ485daWXr4dOR
	w==
X-Google-Smtp-Source: AGHT+IGXvg5qcm/3TlvU9TnzKZw93CYVeSD6YM9ZKocDg+cEOxV9hu8gdB/cBYZ0v7+49zyWV0HzRZrOxmjxS3ILpO0=
X-Received: by 2002:a05:6214:3c9e:b0:6fb:59de:f8ab with SMTP id
 6a1803df08f44-70002b09787mr64657346d6.10.1751034767488; Fri, 27 Jun 2025
 07:32:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626134158.3385080-1-glider@google.com> <20250626134158.3385080-7-glider@google.com>
 <20250627081146.GR1613200@noisy.programming.kicks-ass.net> <CAG_fn=UrOBF=hQ5y6VN9VuA67GeVOyaaWtrnaSLz4TnC7u1fiw@mail.gmail.com>
In-Reply-To: <CAG_fn=UrOBF=hQ5y6VN9VuA67GeVOyaaWtrnaSLz4TnC7u1fiw@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 27 Jun 2025 16:32:11 +0200
X-Gm-Features: Ac12FXyNdmWFSSJKEPyXOJOFO_SgvNyJtoRQ-REuaA1XlHVfOaH0P5mnZZsSDRc
Message-ID: <CAG_fn=W6hXNnYLZpHN5Ein_iZ-tqJDFZWXaQm29eUf7xQoU=Lg@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] kcov: x86: introduce CONFIG_KCOV_UNIQUE
To: Peter Zijlstra <peterz@infradead.org>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, x86@kernel.org, 
	Aleksandr Nogikh <nogikh@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 4:24=E2=80=AFPM Alexander Potapenko <glider@google.=
com> wrote:
>
> On Fri, Jun 27, 2025 at 10:11=E2=80=AFAM Peter Zijlstra <peterz@infradead=
.org> wrote:
> >
> > On Thu, Jun 26, 2025 at 03:41:53PM +0200, Alexander Potapenko wrote:
> > > The new config switches coverage instrumentation to using
> > >   __sanitizer_cov_trace_pc_guard(u32 *guard)
> > > instead of
> > >   __sanitizer_cov_trace_pc(void)
> > >
> > > This relies on Clang's -fsanitize-coverage=3Dtrace-pc-guard flag [1].
> > >
> > > Each callback receives a unique 32-bit guard variable residing in the
> > > __sancov_guards section. Those guards can be used by kcov to deduplic=
ate
> > > the coverage on the fly.
> >
> > This sounds like a *LOT* of data; how big is this for a typical kernel
> > build?
>
> I have a 1.6Gb sized vmlinux, which has a .text section of 176Mb.
> There are 1809419 calls to __sanitizer_cov_trace_pc_guard, and the
> __sancov_guards section has a size of 6Mb, which are only allocated at
> runtime.

Also note that most of this array will be containing zeroes.
The high coverage watermark across all syzbot instances is below 900K
coverage points: https://syzkaller.appspot.com/upstream
But that is coverage aggregated from multiple runs of the same kernel binar=
y.
CONFIG_KCOV_UNIQUE will be only initializing the guards for the code
that was executed during a single run (<=3D 1 hour), and only when
coverage collection was enabled for the current process, so background
tasks won't be polluting them.

>
> If we take a vmlinux image from syzbot (e.g.
> https://storage.googleapis.com/syzbot-assets/dadedf20b2e3/vmlinux-67a9938=
6.xz),
> its .text section is 166Mb, and there are 1893023 calls to
> __sanitizer_cov_trace_pc, which will translate to exactly the same
> number of __sanitizer_cov_trace_pc_guard, if we apply the unique
> coverage instrumentation.
