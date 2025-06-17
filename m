Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8796928A406
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150562; cv=none; b=elbPqVSXHLtjCYpQFeZ8lxx2fCGkSn0FSYP304LQzMfhsh91pmvOY0rhj8KLhzcqvYs3B1FaqR4eYg3yoLZ6ciYq/i04olrB/X40TW1HPx62KKD1k8ToeqTUMBowsIqivlA22ifjeGGHQrbYil4djmaqytukmdHEgEnLW/Cx6Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150562; c=relaxed/simple;
	bh=5wj+NhT6rkBVR0e9n5zmbhiXBu816eLYTHs1MeOVQ/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLKKm6FwNu9d7KQngOPwpGDz/2DKLTG7GfIDzZk2KnhUulni3KFre2Lc0hCiVB3Sv/7HlHp7AHYJXHKcMBEgOugZDJnCWK88er2R5tnr4SpULw+SrcvXqRsmckmGkYkQAKO3+aaK5oEwooce/1/JpeOY14cZ7ojg6CegbfCb/ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d/mfktLq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d/mfktLq"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450dd065828so43523405e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750150559; x=1750755359; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dj6lLSXci5945lC3mybMam1AZ2iVEIV2BzgEDQdp9kQ=;
        b=d/mfktLqIJO6+EXI1dsGSATuPk4Q+xCtDGZ2oxoA4BzDmipaGwSto4vwjFl/KvO2Kv
         AXbZfH41yp0/OeIoqvfEXjTpnR6wFTo0KRhxo0IA5cwABFT2l3mLG5vpwHZAWqfjGjzz
         R0DL2YpCSAihK3+Tky7txSKuzBygUGeTV8NS7TSI/new6j2UXLXcvw7wE+GS5eYXUwgY
         v7uSJoFFyYjK5ZWUpuV4/PfnDZU33aq3TLqJc4aRuarglSw4fap2/lDX4ozqfKw4scy/
         hOE2ZcYRpdASw6ZNyEHk2Os5fcLU6G2T3RbGHFINfJSux7N6q3+8IG+nPzuPdXUq+ygi
         lrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750150559; x=1750755359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dj6lLSXci5945lC3mybMam1AZ2iVEIV2BzgEDQdp9kQ=;
        b=QH0FbB5yYXOnqme1p5qcLePO4PwslIcByuA34fnOvI/O8qOaaEtjNHie82pBvUjiIP
         mtlcXxAienJhWbHqAXDvggONAy4d5cnT+hvn2p4WhpV3aFaynlKXwANm5EbbLbWbYV3S
         y1F44oNXKS/ffMJgbuIsooy6GlV0AEAvNRfKtex0mNwpMaynTMRn0lrzsGP1vl5y5Ou2
         dMk/73gAb+9ViCUWPx+qHwMjQKWWlZ/O/1Q7s8ifKEKzL720oxgiqNeCmf4HMbjGcphj
         Cz+vmGKwCrc/dI7DijTJRViFXpiPjhqLqbRT0RZiZMN3C+w1PmgvOklCCeYaPIagHBrj
         Vy+A==
X-Forwarded-Encrypted: i=1; AJvYcCUQeRU3PnEB69gIN/bU1HK4c0zqyrIWJwZitEmFc4asCbMGlUfD+9+3lUfmDDIGzp/NS4ZzjQFBq65aFKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeYEZYhr2lLfmUbKY4/tUkQoQcWMNHRNSsSRE8UzWd9llWg6d/
	tFpZuknbYsKgXNSyPKykIR+zohbBepqUX9oGzhe7Wpu5xtxY6Dr4DobQXInCI12oAwy2Jkoa0k6
	eIpf1pQJJ98LZtKsNGqxRMMHzmkDH6DqJT3HgsO/I
X-Gm-Gg: ASbGnctMyjtFVrE2Cu840khC+dgkD/vlSgeRSedy6PSyT48h3skaCmmDZOBoWJaBC20
	UVJDeIRoN96CHC9hZzm/Xp5SIuVcSRlahr8nC2fQ0iajWANqSJEIBnlT09WZKvQxijymLypxzVz
	qegbzntKeZHhp4QpnNroO8IFMj0FRcTPv2fJSukUyM9CdyogSqFhwU/1BbamDm02/aHMbeaVxpS
	w==
X-Google-Smtp-Source: AGHT+IHd3Aejq1uEJaQG4WWNvOYmfswAkoQA6WtXV1yXwmgWtEfEwfz+OZVacVtmah0j97aUPVnjSdD/oU2r5YBSPKA=
X-Received: by 2002:a05:600c:348c:b0:450:cfcb:5c9b with SMTP id
 5b1f17b1804b1-4533ca7a16bmr100896125e9.1.1750150558701; Tue, 17 Jun 2025
 01:55:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616-strncpy-from-user-v5-0-2d3fb0e1f5af@google.com>
 <20250616-strncpy-from-user-v5-2-2d3fb0e1f5af@google.com> <DAOMXR37F36S.2P4ZRUYF7E140@kernel.org>
In-Reply-To: <DAOMXR37F36S.2P4ZRUYF7E140@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 17 Jun 2025 10:55:42 +0200
X-Gm-Features: AX0GCFtt3oUHpbobjAhHXnF2NHx3775bSNRYwBugs_lsx3CICnugPdejOntGOCw
Message-ID: <CAH5fLghMD2RQynaFdLVa+JAy17o5NW_pe7p3Cj1-A-FQVA--_A@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] uaccess: rust: add UserSliceReader::strcpy_into_buf
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 9:38=E2=80=AFAM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Mon Jun 16, 2025 at 2:41 PM CEST, Alice Ryhl wrote:
> > This patch adds a more convenient method for reading C strings from
> > userspace. Logic is added to NUL-terminate the buffer when necessary so
> > that a &CStr can be returned.
> >
> > Note that we treat attempts to read past `self.length` as a fault, so
> > this returns EFAULT if that limit is exceeded before `buf.len()` is
> > reached.
> >
> > Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> I have one concern left below, when we fix or resolve that:
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
>
> > ---
> >  rust/kernel/uaccess.rs | 60 ++++++++++++++++++++++++++++++++++++++++++=
+++++++-
> >  1 file changed, 59 insertions(+), 1 deletion(-)
> >
> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > index 635a03e0989f3fe99be80987aa47763782de1d3f..106aa05ea1b88868fe48f64=
ca9c86b20ad7db68e 100644
> > --- a/rust/kernel/uaccess.rs
> > +++ b/rust/kernel/uaccess.rs
> > @@ -291,6 +291,65 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut =
Vec<u8, A>, flags: Flags) -> R
> >          unsafe { buf.inc_len(len) };
> >          Ok(())
> >      }
> > +
> > +    /// Read a NUL-terminated string from userspace and return it.
> > +    ///
> > +    /// The string is read into `buf` and a NUL-terminator is added if=
 the end of `buf` is reached.
> > +    /// Since there must be space to add a NUL-terminator, the buffer =
must not be empty. The
> > +    /// returned `&CStr` points into `buf`.
> > +    ///
> > +    /// Fails with [`EFAULT`] if the read happens on a bad address (so=
me data may have been
> > +    /// copied).
> > +    #[doc(alias =3D "strncpy_from_user")]
> > +    pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8]) -> Result<=
&'buf CStr> {
> > +        if buf.is_empty() {
> > +            return Err(EINVAL);
> > +        }
> > +
> > +        // SAFETY: The types are compatible and `strncpy_from_user` do=
esn't write uninitialized
> > +        // bytes to `buf`.
> > +        let mut dst =3D unsafe { &mut *(buf as *mut [u8] as *mut [Mayb=
eUninit<u8>]) };
> > +
> > +        // We never read more than `self.length` bytes.
> > +        if dst.len() > self.length {
> > +            dst =3D &mut dst[..self.length];
> > +        }
> > +
> > +        let mut len =3D raw_strncpy_from_user(dst, self.ptr)?;
> > +        if len < dst.len() {
> > +            // Add one to include the NUL-terminator.
> > +            len +=3D 1;
> > +        } else if len < buf.len() {
> > +            // This implies that `len =3D=3D dst.len() < buf.len()`.
> > +            //
> > +            // This means that we could not fill the entire buffer, bu=
t we had to stop reading
> > +            // because we hit the `self.length` limit of this `UserSli=
ceReader`. Since we did not
> > +            // fill the buffer, we treat this case as if we tried to r=
ead past the `self.length`
> > +            // limit and received a page fault, which is consistent wi=
th other `UserSliceReader`
> > +            // methods that also return page faults when you exceed `s=
elf.length`.
> > +            return Err(EFAULT);
> > +        } else {
> > +            // This implies that `len =3D=3D buf.len()`.
> > +            //
> > +            // This means that we filled the buffer exactly. In this c=
ase, we add a NUL-terminator
> > +            // and return it. Unlike the `len < dst.len()` branch, don=
't modify `len` because it
> > +            // already represents the length including the NUL-termina=
tor.
> > +            //
> > +            // SAFETY: Due to the check at the beginning, the buffer i=
s not empty.
> > +            unsafe { *buf.last_mut().unwrap_unchecked() =3D 0 };
>
> What about the case `self.length =3D=3D 0`? Will `raw_strncpy_from_user`
> return early with a page fault, or will it return with `len =3D=3D 0`?
> Because if it is the latter, then this will result in UB.

If `self.length =3D=3D 0`, then you will either:
1. If buf.is_empty() then you return EINVAL at the top.
2. Otherwise, you return EFAULT from the `len < buf.len()` case.

Alice
