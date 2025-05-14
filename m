Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7486B21CC4F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 22:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747260518; cv=none; b=TcYOn2JCpciCfuZNvVh1pBl8VxMu92q7k1vSHHBPiMzfo6pX5WvDY7Wwgrpsk3AiProuSIh2AkRvZHDP6EusdeHMe2F+5kgtROSVMTcxRv4SZcsfDIQ1QIGFi2Tft2jQafHyLvxDDP2o9KuKSx4Ar0WeiTp4BHmKjxfXF77P7JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747260518; c=relaxed/simple;
	bh=VXYOi+mWdK2nyf8NSpJHLMX8PteuU4saap7if/EVbIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJKdE6WTLlJoN2FpG3OfIMso888mAaDBWLh3sqawMF3CXEdOGqtuTtxX+WahxKgRN3bv5fW1Z3pUqLeESsVi8gmT6L4ea2XOaKo6qmCiMXyVMtRP5UgwR4YbmdekvOhmSaZvXQt9ed3Ob7s+ZxxglONNMy2j2U1uIWrmJ4nAkWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mjthdptp; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mjthdptp"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso1403a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747260515; x=1747865315; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tss58B0SAO67/66OTKmRwlNtSs2G5+tLvkvbDgLLbnw=;
        b=mjthdptpqqDWgLOyOZu9P+CYPfCHsYCxG+/RhRETStKt7xj381BcsU9Ost4If1eROr
         JZrbaEV6iLJnUhFAebErma53k2Za6JWCEeoFO6JjicuRgpufdLa6+QaCY0ueoivy8dSy
         YfIQtast2Mvde9C8+xXLUpyJ1ufy+VIt7hMWmHyNK0fQfRxbRw/hdkR0Kl4eK0MIQxhP
         FZd/DZkQGylISVHaneCkdhiH3xe07AlM6XVX7IRGgNyBloUYP67DhkYJqFrc/7A0I8GL
         IjsfZ7EoEhh4Mm1fdDUXFMVfHlVAFkxDfUsAQOGm+FSQE+tUDMVWQDRrUVTHXbpjtgnr
         dDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747260515; x=1747865315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tss58B0SAO67/66OTKmRwlNtSs2G5+tLvkvbDgLLbnw=;
        b=N5VgBmX0V9HRITnplDPzvTYpGP/wQwIUYwF+Ix/zwMnOXyRUmaP18GljqmWGv6ggWl
         ptg1vuh7dOgObI9VzdS9feGW165SUzdBMzgJ8iunNGJlQi1yBuNRiTa37Xq/oz1n9q2m
         Gym1CpmiAFObIbQo35xcFyi+gIsbGdlbDN6C5HeRNSxokLY2A2VOIz6GwoBUVx0lA0c9
         zcRumaz29DHhasC43EQGQa8ELdkJXwrsFhw1S3XAWmNYEUKbgaUI4yorOIafjchyIjfi
         P4MZgm7cjBrIWEHi6DlJ3CA05IXyu07z/ruMSxq5rmlL8gVDMzhYyJTssTGqMAa2e46V
         RAxg==
X-Forwarded-Encrypted: i=1; AJvYcCVphj0KpJAqUUQQWNmA1BhZIhznxSoGM9jrxlBTraml1Sef++PJmLu+KK0wEVoBmH1vy2KJ97Cxow1wm+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxxa4G1qqsYYrJvItrGsp5E720DVWlgBf9xBvgoL2UVOvpZtCs
	sHIRN5c/3H3rPI1tyscuHSdFF9TAvFJKN9XR53qcHrC98ILnrRV10aWkqS68a5nvThnsW9GwPTc
	Q69yLm2KB+irkXW3QSwdTEmBP60KfG0P5bxUyLEfS
X-Gm-Gg: ASbGncvCGMkm1uNKUjxIekTWxIQ28Xj1KSW2CIp0t7KCHVcbFI3QCjefQr68Xu2O0Ox
	bJx4Uk9QVRCI1VtM+5JAfMBCaHNSmZteHXcYiLnwepB5box5HBx1RcCAF3+yNghF2bPRzxvOoaW
	K/yophpcstJOeLXL1aZ8yKRw4Ifg3d+W9cWIrQjxfsgpD0k2uEGhSVx1HKvnfyyFRb5t3GeHCr9
	g==
X-Google-Smtp-Source: AGHT+IG0l9l9w/Y2N68M8u49vGIn5Dyo1YjrH8Fm6t+utuN/7LDawmGrkISOfwBFdZwW4Dlpr9Yra6I/CGpssPX8fvk=
X-Received: by 2002:aa7:d7d8:0:b0:5fb:89b1:717f with SMTP id
 4fb4d7f45d1cf-5ffc94f77c8mr36035a12.0.1747260514477; Wed, 14 May 2025
 15:08:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com> <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
 <aCRdNJ2oq-REBotd@pollux> <D9VSJTPCSNXV.1LCXKGKVDGP96@kernel.org>
In-Reply-To: <D9VSJTPCSNXV.1LCXKGKVDGP96@kernel.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 14 May 2025 15:08:21 -0700
X-Gm-Features: AX0GCFtl0OfYlEhDAnlQDcwPdAZRvWX7bhRhSpfSow8B6gQb1NW0J7_xgJ6pbdo
Message-ID: <CAGSQo00Pj0qF90712K7xACNEvr2e0q=98b8-0VUcXLD5V+oDhg@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 2:54=E2=80=AFAM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Wed May 14, 2025 at 11:07 AM CEST, Danilo Krummrich wrote:
> > On Wed, May 14, 2025 at 09:20:49AM +0200, Benno Lossin wrote:
> >> On Tue May 6, 2025 at 1:51 AM CEST, Matthew Maurer wrote:
> >> > +impl kernel::Module for RustDebugFs {
> >> > +    fn init(_this: &'static ThisModule) -> Result<Self> {
> >> > +        // Create a debugfs directory in the root of the filesystem=
 called "sample_debugfs".
> >> > +        let debugfs =3D Dir::new(c_str!("sample_debugfs"));
> >> > +
> >> > +        {
> >> > +            // Create a subdirectory, so "sample_debugfs/subdir" no=
w exists.
> >> > +            // We wrap it in `ManuallyDrop` so that the subdirector=
y is not automatically discarded
> >> > +            // at the end of the scope - it will be cleaned up when=
 `debugfs` is.
> >> > +            let sub =3D ManuallyDrop::new(debugfs.subdir(c_str!("su=
bdir")));
> >>
> >> I dislike the direct usage of `ManuallyDrop`. To me the usage of
> >> `ManuallyDrop` signifies that one has to opt out of `Drop` without the
> >> support of the wrapped type. But in this case, `Dir` is sometimes
> >> intended to not be dropped, so I'd rather have a `.keep()` function I
> >> saw mentioned somewhere.
> >
> > I agree, if we really want to "officially" support to forget() (sub-)di=
rectories
> > and files in order to rely on the recursive cleanup of the "root" direc=
tory, it
> > should be covered explicitly by the API. I.e. (sub-)directories and fil=
es should
> > have some kind of keep() and / or forget() method, to make it clear tha=
t this is
> > supported and by design and won't lead to any leaks.
> >
> > Consequently, this would mean that we'd need something like your propos=
ed const
> > generic on the Dir type, such that keep() / forget() cannot be called o=
n the
> > "root" directory.
> >
> > However, I really think we should keep the code as it is in this versio=
n and
> > just don't provide an example that utilizes ManuallyDrop and forget().
> >
> > I don't see how the idea of "manually dropping" (sub-)directories and f=
iles
> > provides any real value compared to just storing their instance in a dr=
iver
> > structure as long as they should stay alive, which is much more intuiti=
ve
> > anyways.
>
> Yeah that's whats normally done in Rust anyways. But I think that
> lifetimes bite us in this case:
>
>     let debugfs: Dir<'static> =3D Dir::new(cstr!("sample_debugfs"));
>
>     let sub: Dir<'a> =3D debugfs.subdir(cstr!("subdir"));
>     // lifetime `'a` starts in the line above and `sub` borrows `debugfs`
>
>     /* code for creating the file etc */
>
>     Ok(Self { _debugfs: debugfs, _sub: sub })
>     // lifetime `'a` has to end in the line above, since debugfs is moved=
 but `sub` still borrows from it!
>
> This code won't compile, since we can't store the "root" dir in the same
> struct that we want to store the subdir, because the subdir borrows from
> the root dir.
>
> Essentially this would require self-referential structs like the
> `ouroboros` crate [1] from user-space Rust. We should rather have the
> `.keep()` function in the API than use self-referential structs.
>
> [1]: https://docs.rs/ouroboros/latest/ouroboros/attr.self_referencing.htm=
l

Yes, this is also an issue when it comes to attaching data to debugfs
if you look at the WIP patchset [1]. If we do end up deciding to try
to do self-referential structs for users (I'd rather not, but I
understand I don't have the deciding vote here), I'd strongly suggest
considering self_cell [2] as a model instead of ouroboros - there are
structural UB issues [3] with ouroboros that are unlikely to be
resolved, and the author of ouroboros encourages use of self_cell
instead [4]

[1]: https://lore.kernel.org/all/20250506-debugfs-rust-attach-v2-0-c6f88be3=
890a@google.com/
[2]: https://docs.rs/self_cell/latest/self_cell/
[3]: https://github.com/rust-lang/miri/issues/2844#issuecomment-1510577943
[4]: https://github.com/someguynamedjosh/ouroboros/issues/88

>
> Another problem that only affects complicated debugfs structures is that
> you would have to store all subdirs & files somewhere. If the structure
> is dynamic and changes over the lifetime of the driver, then you'll need
> a `Vec` or store the dirs in `Arc` or similar, leading to extra
> allocations.

Yep, this is part of why I tried to follow the "Build it, then hold
the needed handles to keep it alive" approach rather than keeping the
entire structure around.

>
> > It either just adds complexity to the API (due to the need to distingis=
h between
> > the "root" directory and sub-directories) or makes the API error prone =
by
> > providing a *valid looking* option to users to leak the "root" director=
y.
>
> I agree with this, I want that `ManuallyDrop` & `forget` are only used
> rarely mostly for low-level operations.

Sure, I'll re-instate `Dir::keep` and `File::keep` as aliases for
`ManuallyDrop::new` in the next version. TBD whether we add the bit
that Danilo suggested to make `Dir::keep` not exist for root-level
directories.

>
> ---
> Cheers,
> Benno
