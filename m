Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FC31DB127
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745583627; cv=none; b=Ox92OXra9GeFtQhFuLNSMtRikxfFWfsyc4IXRGY2CnvdzLJ0ocJKjelM3XYXZiM1aFuIup4XnQvbkQ619GQLnkwmL6EfKSyLj+U82AdrA5kwR1IOm2pN8bTLnbTqRSTzd0M6GBZMMQZXF3K6p9JkuvKdeAzeasT5ExovXd3wnq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745583627; c=relaxed/simple;
	bh=HKpDnWrrPHLZohjzXZtD1e5G+wD/gBkDjuf4cIKbpRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jJzOsl5i0byJ1HfFBS5/ycAz+CVTr8RrsN65k+Bx0IQzGodAZScZwwBd7IKfTfCq+EnXKa/uJl8ZaXnsMUvGprenl9QtYwfUIj2ygFhgNqTKtrq28Y3wCNC8rbQTYCnxGN/Q4AKde79OMWbhmVmfC2jYc7oGhCyuwX6hx5Pxaao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K0WcN0kN; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K0WcN0kN"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3fe83c8cbdbso714281b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 05:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745583625; x=1746188425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvHaQjl2AmsbcSXhAqnsLyfE+EhtWkk491vzxpLqPyo=;
        b=K0WcN0kNwLa+6q0hLX3uIfOkCYz98KzUKQy6qtUZTZ3vMCMqhVxCritcFTtxH40rNa
         19xBEA7R3q/Ndc2M+gxTsQLj4pqres40YUE4HaC6h8qB8aoMEAs/C1PsCCYg2SakCPNj
         TH7fJoRSFp+0seQznNFI3xtO5DB8rnw+2Amm8N4VAxzUlWqi7DecXvEdW6WiYfXVKG87
         8g2pw2B7/hBdbB2otmBl2ic+qkRHqzpLrXr9wF6XoScw2GC1jwA+9nY0+etwcuDFDF8G
         9nmOcwxtpfvZ7DxvxsOgz8yffwFjB2Bgl5lTL0syUwhsgWLzGv7YyOBxEG7aULYmehlL
         ua6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745583625; x=1746188425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvHaQjl2AmsbcSXhAqnsLyfE+EhtWkk491vzxpLqPyo=;
        b=XcGmbv4Rts0FN7FH6CHtA0vLFqVKUyZeTPSBzKW7FywWimKXpx633cBJPNfa/8pCAL
         X9iirF/Su5cxuBqto1K7mhSYYrAeJhmPBJOzlhIW34++fvt4odf6yO/kSR2sVKm6ROr/
         dRhRjQ7Y2ww7gjrOiVhRuq6ZH0Q5mbYpssEgXw561SK6Br1i2THoxU8th5yQuXs3YTZ1
         lHkl32eHlwVs06MDyfVLJ8+HeqcBKZqHdMGA90HZrCwIzApxd7/lXj++1JPmZPoZuQO5
         SttKYTtldTXvqKgYQTYJz+qzVc82COuCzuLSvzmik0nv04Wp84XzpOCpoDETKI7Ji5PD
         Ls0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsnIE195RFr8V/M7gnmIMbIWuEF5K+eUAyKnI94pYm7+KmKy363c62RcVmBqP9WAkrPliEZk9LMZFoK7U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl5BhiDqXgm4FrzegZYGxjBlcR6yUENIWlFx51NBY2WvCa0SpA
	vbdmSOXag9XwPQwd6eNcPP+0Sma0N3nP49Hv7EkzqnH8ThRYCkVs873SAZlK/ytyxMi2TjXFINa
	njT9V+Ylwo0fKAI8bh89h+rmLIrFYlpTIw0KU
X-Gm-Gg: ASbGncvjxDWjCJ+wPJsQghFB0ekc++/gZggzN482BoX7Pd5JXi2VG+TfrT6qTPDx67C
	zEP6DzVL6ru1FbwuGMU6exN0kFVgHIdX+bm0V3exlLmjn4UVAnjry/Tkz9mFNRrcAqcY+WXbmah
	1JLkTjW09Ve1ELFLbqXrD+3ff4KXRZYiX77MI633VfxfP1IffLSVDo
X-Google-Smtp-Source: AGHT+IEi6BmfS/Wv9+gWZ8a0daSwVh2N9J2AxPx02DCQBXiJbFqsO6cButw39+VyC2emehvj5uRU9hs8gFKoQsTgC1s=
X-Received: by 2002:a05:6808:3a6:b0:400:fa6b:a104 with SMTP id
 5614622812f47-401f28dadbfmr867072b6e.33.1745583624852; Fri, 25 Apr 2025
 05:20:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423134344.3888205-2-bqe@google.com> <20250423134344.3888205-6-bqe@google.com>
 <aAkbw0jEp_IGzvgB@yury> <CACQBu=XaOohewMnLj9PvgR5rYBxzYSXf2OAjCzUY=GFTJ9L=+Q@mail.gmail.com>
 <680a6b54.d40a0220.27afd9.5e84@mx.google.com> <680abbce.050a0220.144721.78ac@mx.google.com>
In-Reply-To: <680abbce.050a0220.144721.78ac@mx.google.com>
From: Burak Emir <bqe@google.com>
Date: Fri, 25 Apr 2025 14:20:13 +0200
X-Gm-Features: ATxdqUGYOK0NGfbNcrLA7OJdnBL4aoQc1LpEgeCSbMZBsGDktX9utu4m4m2z0d8
Message-ID: <CACQBu=VEATxHmFvt0TKbb+Hx5jeEGO8SL733=0m8LNnX6S+ZKw@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] rust: add find_bit_benchmark_rust module.
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 12:31=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> =
wrote:
>
> On Thu, Apr 24, 2025 at 09:48:17AM -0700, Boqun Feng wrote:
> > On Thu, Apr 24, 2025 at 06:45:33PM +0200, Burak Emir wrote:
> > > On Wed, Apr 23, 2025 at 6:56=E2=80=AFPM Yury Norov <yury.norov@gmail.=
com> wrote:
> > > > So? Can you show your numbers?
> > >
> > > For now, I only have numbers that may not be very interesting:
> > >
> > > - for find_next_bit,  find_next_zero_bit and find_next_zero_bit (spar=
se):
> > >   22 ns/iteration in C, 32 ns/iteration in Rust.
> > >
> > > - for sparse find_next_bit (sparse):
> > >   60 ns/iteration in C, 70 ns/iteration in Rust.
> > >
> > > This is a VM running nested in a VM. More importantly: the C helper
> > > method is not inlined.
> > > So we are likely measuring the overhead (plus the extra bounds checki=
ng).
> > >
> > > I would like to get cross-language inlining to work with thinLTO to
> > > have a more realistic comparison.
> > > However, that is not something that works out of the box.
> > > I am looking at Gary Guo's patch for this:
> > > https://lore.kernel.org/all/20250319205141.3528424-1-gary@garyguo.net=
/
> > > Currently, I get duplicate symbol errors.
> > >
> >
> > You will need to add __rust_helper attribute for the new rust helpers
> > introduce in your patches. See Gary's patch #2 for example.
> >
>
> Here you go ;-)
>
>         https://github.com/fbq/linux/tree/rust-inline-bitmap
>
> I rebased on the top of rust-next and applied your patches onto it. The
> last one is the necessary bits that enables helper inlining for the new
> APIs in your patch. There is also a "TMP" patch in-between, otherwise
> INLINE_HELPERS won't work, we need to dig more of it. But anyway, it
> works on my machine (TM):
>
> (on x86, in your test function)
>
> 000000000028b090 <_RNvNtNtCs3KHxpmQFgFb_6kernel6bitmap5tests40kunit_rust_=
wrapper_bitmap_set_clear_find>:
>   ...
>   28b0dd: 48 0f ba 2b 11                btsq    $0x11, (%rbx)
>
> ^ this is the "b.set_bit(17);" in bitmap_set_clear_find() test.

Thanks Boqun! I had the same state and got things to build now with
CONFIG_LTO_NONE.
Your work helped me narrow down the possibilities.

Gary's helper-inlining patch in combination of CONFIG_CLANG_LTO_THIN
and CONFIG_FIND_BIT_BENCHMARK_RUST=3Dy gives "duplicate symbol" build
errors.

It does not eve matter here - because  _find_next_bit C functions are
not helpers.

For cross-language inlining, we would need to change the build system
similar to Gary's helper-inlining series, but for *all* object files.
That is what "-flto" does for clang, and "-Clinker-plugin-lto" would
do for rustc.
Instead of the hack of emitting a .bc file, we need all .o files to
contain LLVM bitcode, regardless of whether they come from clang or
rustc.

Thanks,
Burak
