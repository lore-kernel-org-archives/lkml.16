Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20D626A09B
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462733; cv=none; b=ZFXVhcMrDnMU5XycAd2o94WVVBMTQAiRn5zOu/1wh78nDGLEufmRHGF/eVa1FjHjyYRm8iCxcUWPXKvIC65SWc26aH9y9eLxH6N6kSVE3/WU9syZXB1N3KjqahHPiJIaRcXTsEE8qaNDULprjSij44YE4WQTKEisKIZApxAS3Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462733; c=relaxed/simple;
	bh=DkPpoBt74SjFWeUZC95U53ExQun4rww9gKxUAp7ZYhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JTsCcj7+ensDX+pYd0AdAD32wvwqltVLy7QKIboE2uNPqmcnrs4yevBAdu6pCHPnmaUFVvaDhPUHxLQfPVFel56HMDTfhO4/An4bepBbOjeSncorUXqPfylyuhdRIY+vruu49+HhHeOdaI8rFf3GNvQMi4tdZJ1oduQgPIKt41Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0M7zN51w; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0M7zN51w"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso15240a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 09:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746462730; x=1747067530; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7T9Ols4DW4eW4aN8meND0YtNL587B+ybi/UpAh4RJEQ=;
        b=0M7zN51wBOgSItuMwjEYu8LOCmCJLZjdz+v25ihxs0FasC9aI69f1Sa0wDx8/yD2W8
         WsXWjzBAUGcgkK/IO0Qu+2Qd4XuXNNYR+pyBLUKW4g62hYwt+Uv19Ky8SgE/obugS/vd
         GbyhmMXq+W/oW/bGd1TK1UA9uZ62jJz4eQfU5xYn7SlEhxI24ewFyKbq+CDyVKw19c42
         ABaZBSj/f0y6mr0WOH/AAonazJW/C5ioBgZNMmq9usWvOKcBe9u1nz7VIgf12echAFdw
         /ySwh2mmJr27Si0gwAe9kfxzbN5AhvhaQewtfwBlYoKrrK2CrP5MphTrWwT3zF+eYXy0
         8f7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746462730; x=1747067530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7T9Ols4DW4eW4aN8meND0YtNL587B+ybi/UpAh4RJEQ=;
        b=YpQu0ld6jpMpf8oxuBYIZy0M8/blYUBuRUxG1364OvLE1bkoTr8nRlmgumOSSKQmEZ
         UAZb55hHJyMtY0CiN7JC5PhkHt8z+zPLtd/gO5e+OLqU5SdXPRzckNBR2f27O78WaQ0p
         PiFhodKSmhdERW5TdCKanIj7w12Otm8MrjiWuLFlSisYU+vFNYg9ren33rIENuM+ZFuB
         zOgeaFN1g+9G/O+d2pD5T92Kg63UsIt+dl+MsW9KQAHFz4oGNe/XCyLjx+v0uwcyj+LN
         nEyG39wJEwWku0L7gJIaG2KJ13VzM4+8Ejm3dgVrke7mKoJ/Pk5FsVp/PpxE0tjQ+gMq
         sibg==
X-Forwarded-Encrypted: i=1; AJvYcCXTWhmdL0Q3fWAC+bCiwC9IQuoIaYNvBM3ThWivMijqZkPCm6pCM5IdA4rA2fPUmx7IjYJQ+NkOoqMdnkA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzt1UjHXJt+0X+LbTP0N1eM+otx4d55ep/qFadKCEKEAXq84Sq
	FXULyD+f1cm/5/N8S1twDuUT+Ry0nDNEpVI73KcmRtB7KLq3RwwgyKmETSxFXc0t8261JnclctN
	a+VWzO95YBLuMnGV8xVbZKwghZk+zzYcKoyw0
X-Gm-Gg: ASbGncsQFLykYJWYFNDsyviWiMRqx/FuMoesRlA095XiB1q6P3mfY/PkFMwkT1iNHtA
	fsANm0A79/L6L4noyqOk3uVbHNwgzrAA0Nysao9KAXVF335iPyO+MrpTb2sPWr+P7+D8d1ENASC
	4XcKsKCSKvWvCEMrTIl4EjOnAC4zabjXJee4L4OdIr6y/4K5yG8Wvj
X-Google-Smtp-Source: AGHT+IGmi9XaUl5b0+gZoSz/p4ANioO2Cu2F05VMTxY26xAz5DhlDBbBm023aac/UsHSKXCX1Lm7Y85IjTBp5cgT1mg=
X-Received: by 2002:a05:6402:1a47:b0:5fb:1ccd:5434 with SMTP id
 4fb4d7f45d1cf-5fb566836f0mr16984a12.3.1746462730021; Mon, 05 May 2025
 09:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502-debugfs-rust-v4-0-788a9c6c2e77@google.com>
 <20250502-debugfs-rust-v4-1-788a9c6c2e77@google.com> <aBYNyqTRlpGAJVuB@polis>
 <CAGSQo03Fz-U6pTYn1kL5GRsTOSpKnSnsG52oCrJii6MPM9x73Q@mail.gmail.com> <2025050510-landmark-probing-17f8@gregkh>
In-Reply-To: <2025050510-landmark-probing-17f8@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 5 May 2025 09:31:58 -0700
X-Gm-Features: ATxdqUFh-RygYbnEjcRolDZ5tMIEqgDCvk5kjNYis8qa6gptZEj-427jqHWKguo
Message-ID: <CAGSQo02BWp0sMB0+KhaszincYWiL1XDJYyaUJgQ1L-bsO0Eazw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] rust: debugfs: Bind DebugFS directory creation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 9:29=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, May 05, 2025 at 09:21:51AM -0700, Matthew Maurer wrote:
> > On Sat, May 3, 2025 at 5:36=E2=80=AFAM Danilo Krummrich <dakr@kernel.or=
g> wrote:
> > >
> > > On Fri, May 02, 2025 at 07:49:30PM +0000, Matthew Maurer wrote:
> > > > +/// Owning handle to a DebugFS directory.
> > > > +///
> > > > +/// This directory will be cleaned up when it goes out of scope.
> > > > +///
> > > > +/// # Invariants
> > > > +///
> > > > +/// The wrapped pointer will always be `NULL`, an error, or an own=
ed DebugFS `dentry`.
> > > > +#[repr(transparent)]
> > > > +pub struct Dir<'a, const KEEP: bool =3D false> {
> > >
> > > Why did you move to a const generic, rather than a new type? What's t=
he
> > > advantage? AFAICS, it just makes it less obvious to see from the type=
 itself how
> > > it will behave. Reading Dir<true> doesn't make it obvious what it doe=
s.
> > >
> > > While I prefer a new type over the const generic, I'm fine with it. B=
ut I think
> > > we should use something more descriptive than a bool. Please see
> > > device::DeviceContext for reference.
> >
> > I'm fine with a new type or a using a more descriptive const generic -
> > I did the const-generic to avoid the need to make one variant the
> > derefee, which can sometimes complicate structure. I'll default to a
> > more descriptive const-generic.
> >
> > >
> > > > +    /// Create a DebugFS subdirectory.
> > > > +    ///
> > > > +    /// This returns a [`Dir<'_, true>`], which will not be automa=
tically cleaned up when it
> > > > +    /// leaves scope.
> > > > +    /// To convert this to a handle governing the lifetime of the =
directory, use [`Dir::owning`].
> > > > +    ///
> > > > +    /// Regardless of conversion, subdirectory handles cannot outl=
ive the directory handle they
> > > > +    /// were created from.
> > > > +    ///
> > > > +    /// # Examples
> > > > +    ///
> > > > +    /// ```
> > > > +    /// # use kernel::c_str;
> > > > +    /// # use kernel::debugfs::Dir;
> > > > +    /// let parent =3D Dir::new(c_str!("parent"));
> > > > +    /// let child =3D parent.subdir(c_str!("child"));
> > > > +    /// ```
> > > > +    pub fn subdir<'b>(&'b self, name: &CStr) -> Dir<'b, true> {
> > > > +        Dir::create(name, Some(self))
> > > > +    }
> > >
> > > The default should be that the directory is removed when the Dir inst=
ance is
> > > dropped.
> > >
> > > The common case (which people expect) is that an object is cleaned up=
 on drop().
> >
> > In general for Rust, I agree with you. For this particular case, I
> > have a strong disagreement - take a look at calls to
> > `debugfs_create_dir` in existing C code - new code chooses to discard
> > subdirectory handles when done and rely on the recursive remove of the
> > root directory to clean up subdirectories. If you and Greg K-H both
> > agree that I should make them drop by default, I'll switch it, but I
> > think this is me following the subsystem maintainer's intentions here.
>
> I'm ok with the directory being cleaned up when it goes out of scope.
> That makes way more sense overall, and will prevent leaks and other
> messes.

OK, I'll switch to defaulting to cleanups.

>
> For the C api, what I really don't like is when we were returning a
> dentry to the caller, as then they had to manage it.  Ideally I didn't
> want them to have to manage anything, hence the "lookup_and_remove"
> function I added, all that was needed to remember is the name of the
> directory, which the driver almost always already knew.

Yeah, `lookup_and_remove` actually kind of complicates things for the
Rust model if we ever bind it, as it can be used to invalidate the
object we're holding in a way that has no lifetime constraints.

>
> With Rust it's simpler, you can save off a reference and when it goes
> away, it gets cleaned up.  You don't have access to the raw dentry,
> which takes away my original objection, and if debugfs is not enabled,
> there's no additional storage requirements.
>
> So let's keep it simple here, and rely on lifetime rules when we can.
>
> thanks,
>
> greg k-h
