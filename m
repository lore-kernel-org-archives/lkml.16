Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DB61AB50D;
	Fri,  7 Feb 2025 11:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738928629; cv=none; b=t8st/oMfAlH5hgkfQaTCvg6Bs5YUpPKKBiFeP3jUZo0gQ2zf+KYN11qcdH+HzehW0cPcmxZrHXw6uFmkvWedbuwCafBNpm5TpBvifAeYwE3FjVonwwU89U8VOhfaLZVGLb3DuHSpGvJm3Hws7r7sU9dFm4jPvpX70SIMKqqMhmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738928629; c=relaxed/simple;
	bh=mFeGSv0AxukOGq+3KssyQ0s/E74ks/fDXn83lz/My50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9evgL8t4mBEpbPk9Eqon3/HYgu7kBWESnLDo6wnoNRE5JplK7dcoeNLavvPOBucnx7rYy/MME+eTXsjrbHYbymI5o8X3QpAnIgOZ2YsQBRcbmTJtEPENjRkXcPU9UmUuo1h20iymYWGo4N3q6EabSnGZZYCwys5meZl6lcVZ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkEpQEZA; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkEpQEZA"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30761be8fa7so18315891fa.2;
        Fri, 07 Feb 2025 03:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738928625; x=1739533425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBulp2S1GYqeQ4MZAzzcTiSnMAp2gN4outjx7oWSyMo=;
        b=EkEpQEZAjLLBK+MvLx9KOYSGq/QuQKa0V/4CMX5GFXLkz90tUi7WRbtdTaBSHyZ87O
         zeeyRiycmjKBdBVmc7m9bMh8Ch7rXatguPFn2LI0HEwDKxmadtJT/OY3UZ2J5+IW2KGA
         CJlB4MV+ZGu1gj/0/KRiOjJ3BUoYNybSmh7G48iGOQmyYDNGsDnXU5bZqjRekbCYhlNU
         Xvw/ZtuKUMbFBZD9LbjUN63RQywt9k/J6eHm/dGTvlHa2hrX/meNYWb09vkfwuVnK3Yt
         bik8BsTRcLAJFYR5k1Lp9sM2BDFMVj5FAm2RE1Dn7Oei5gzH1DEX+95U6eksp/OMx1wQ
         tAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738928625; x=1739533425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBulp2S1GYqeQ4MZAzzcTiSnMAp2gN4outjx7oWSyMo=;
        b=l7GMoZ0Et31asS+zDJkX4SNWIcLwHoG7SnqK9tdrQrvJ5lC/Iyu9eVc2ZlHED7Dg2t
         1BJmD6n7NJX+/pnjnu0xMLuYTht/uzMcEGzSbc3NbVYFi0BMGDLttw3vxZQ05M1FSA8m
         WZBQTDF6A6547sWF8vqtz5eVGYg3K67U68yx96V5xhZkobc64IFGRe1uOId51T6oJzol
         zMVJSiFzewzgW7M9HJfkJIk1BQm44vNDngoFaKMYkQzvkktCjMWkJtEtCQ1qUQb1y/Yh
         jW2vUkHtc8rzYRj9QZWcmuW+l9X4WT/tt/sFVfGWZDUPDbOXS7nBf9QZu0hj6ldIcBQj
         gI9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWto7OQtKlOBiMib6ssLqgtxO57ch2Iq12PQWf6//S4+3n+ViQjW1WLC3y71SzTWVAaUmsiLxGwX50k4IeRYFw=@vger.kernel.org, AJvYcCX6nrysscuHMAZhj0apCaGChHc6oEHGtIPQsI6wQyUlVLhdCPdG3D2+L9oNoWL+lp85LnlhW0qKHQuBxng=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZHX4WArzuXRet3q8ZosGinVBqBJRu+CcLTp5OshiHgr3AWcbq
	8qKo7N0XyVF3tDWrbCH8bu06zj9jAXbRZQwO+87v7oe6k/qdGjTa+NoKdmJcWddH9JK4vSA70yt
	dbR97jfduisrhFZ+Jw5gX1cxVO1o=
X-Gm-Gg: ASbGncuUQrEjUNjPnQFwTOgMJRunSapSr2RDAPC0WVRvQIgqrLtO7HabvuCxk3CJnQf
	3U/9F//b0DoJ9LtYE/ZkHAAp/lcDiZdAuEXmE4pyJhYlAgyHjOFj7Zk0GGYluwcyUgofC+DJf+o
	ZOt9jcHOhA4SMHkepX2fzmbZebOF37
X-Google-Smtp-Source: AGHT+IF/IOsJftgf+1TDZfRtVPBoQjBqO3bF319jOjgpdCB1fzwpP9moB/tuy04qo7JSkwbV+MndErtv6ZNXiTjs9mU=
X-Received: by 2002:a05:651c:1616:b0:302:1fce:3938 with SMTP id
 38308e7fff4ca-307e57fd416mr10395061fa.11.1738928625286; Fri, 07 Feb 2025
 03:43:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-aligned-alloc-v3-1-0cbc0ab0306d@gmail.com> <Z6UwCtaO-qVYEN2Z@cassiopeiae>
In-Reply-To: <Z6UwCtaO-qVYEN2Z@cassiopeiae>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 7 Feb 2025 06:43:09 -0500
X-Gm-Features: AWEUYZn4BSe5JCrXLJzTXIBt-a-PmzMfr5ZquozujH2UV0F3tbcYti2J6LhWHH8
Message-ID: <CAJ-ks9kvrBBLTnEmRPbrkoHYgg6wrXoTVXh8ecqYBSPTfpjx2g@mail.gmail.com>
Subject: Re: [PATCH v3] rust: allocator_test: use `posix_memalign`
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 4:56=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Thu, Feb 06, 2025 at 03:49:00PM -0500, Tamir Duberstein wrote:
> > The implementation added in commit dd09538fb409 ("rust: alloc: implemen=
t
> > `Cmalloc` in module allocator_test") used `aligned_malloc` which has
> > implementation-defined requirements of its `alignment` parameter.
> >
> > The macOS implementation of `aligned_alloc` appears to be based on
> > `posix_memalign` and inherits the stricter requirements of that
> > function, causing test failures on macOS.
> >
> > Replace `aligned_alloc` with `posix_memalign` and comply with its
> > requirements. This ensures uniform behavior across systems.
> >
> > Fixes: dd09538fb409 ("rust: alloc: implement `Cmalloc` in module alloca=
tor_test")
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> Let's wait for clarification before moving on. :)
>
> > ---
> > I've intentionally not picked up Danilo's Acked-by from v2 because the
> > approach has changed quite a bit.
> > ---
> > Changes in v3:
> > - Replace `aligned_malloc` with `posix_memalign` for portability.
> > - Link to v2: https://lore.kernel.org/r/20250202-aligned-alloc-v2-1-5af=
0b5fdd46f@gmail.com
> >
> > Changes in v2:
> > - Shorten some variable names. (Danilo Krummrich)
> > - Replace shadowing alignment variable with a second call to
> >   Layout::align. (Danilo Krummrich)
> > - Link to v1: https://lore.kernel.org/r/20250201-aligned-alloc-v1-1-c99=
a73f3cbd4@gmail.com
> > ---
> >  rust/kernel/alloc/allocator_test.rs | 27 +++++++++++++++++++++++----
> >  1 file changed, 23 insertions(+), 4 deletions(-)
> >
> > diff --git a/rust/kernel/alloc/allocator_test.rs b/rust/kernel/alloc/al=
locator_test.rs
> > index e3240d16040b..0aa68d955b39 100644
> > --- a/rust/kernel/alloc/allocator_test.rs
> > +++ b/rust/kernel/alloc/allocator_test.rs
> > @@ -23,8 +23,19 @@
> >  pub type KVmalloc =3D Kmalloc;
> >
> >  extern "C" {
> > -    #[link_name =3D "aligned_alloc"]
> > -    fn libc_aligned_alloc(align: usize, size: usize) -> *mut crate::ff=
i::c_void;
> > +    // NB: `posix_memalign` is intentionally used instead of `aligned_=
malloc`.
> > +    //
> > +    // ISO C (ISO/IEC 9899:2011) defines `aligned_malloc`:
> > +    //
> > +    // > The value of alignment shall be a valid alignment supported b=
y the implementation [...].
> > +    //
> > +    // POSIX.1-2001 (IEEE 1003.1-2001) defines `posix_memalign`:
> > +    //
> > +    // > The value of alignment shall be a power of two multiple of si=
zeof (void *).
> > +    //
> > +    // `posix_memalign` is more portable than (but otherwise identical=
 to) `aligned_malloc`.
> > +    #[link_name =3D "posix_memalign"]
> > +    fn libc_posix_memalign(align: usize, size: usize) -> *mut crate::f=
fi::c_void;
>
> I don't think this can work. posix_memalign() is defined as follows.
>
> int posix_memalign(void **memptr, size_t alignment, size_t size)

That's embarrassing! You're right of course, and yet somehow it worked
when I tested.

> Besides that, I don't think switching to posix_memalign() is desirable, i=
t only
> seems to make the code more complicated.

It does make the code more complicated but prevents "works on my
machine" problems cropping up in the future.

I'm happy to wait for clarification, I'm just not sure whose court the
ball is in.
