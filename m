Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979CE1A2632
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462126; cv=none; b=mTLGbWT5OSraBfNf/EjYaR1Xka4GhL8EH7C6tNs4hvSM4RkHU+vXr5KCgSavNs2bq7HfESPPl9AcyIXNFikv1BfwutbcikgzHobSpGIjJgd6s+u06kRCuTL9jFAcntllGdjuDq5rPiY5A22JWutQ8R07dyP4uZt+MfhKVy1E+cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462126; c=relaxed/simple;
	bh=EJqzxpuGVEyLYHz9y6CeWnGJrstnQCi1EP/Dywpd5kI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BT81OzJNI+r5Z+Ks8e6Tl7UzJmPLjBdp3tdPg8b8KTQtq1DNmcxruktYxa5yCq5DpKep+geYdnfmi6lgYpmL1+NYJ10YGeuGKjDvykXO0H6dha2k/BRxOtYAzTRZEbwfBO23i9MvvumlYZDeZisAPlRbrhM1h6SEAN06TFXPUqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LC9TxnB4; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LC9TxnB4"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso15057a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 09:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746462123; x=1747066923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZWM29ZYXPE6WZovBDu4ysa6ypJm1CwHnOC5/T+iIsg=;
        b=LC9TxnB4ou8GQkDOdtiKAABon6QpuQRMuyR70LPBgEV2ENOD2DU06iu+AJu9/KHb/Q
         99gjUOkSCd4VVA9M9r/MQbhYv2MDRR5s0fkXnB73nnPd9BosKBlORp/x4AWu88NdZykn
         agugNvZsZhAtFNyzYcRRrv6nswjVxKsNjyQwCpUptwBJNLx5I4uLB2EI2GKtauwdJe78
         01uUNR0F3ZohoyvzjxLfuiv/twwRXv2JU5ug2xIWhEvBO/iqOssh4C5+uW+iwrSjh4ZH
         i6ALYaumIS/HSkINsnppFIS8ioA8KsCKLsL1dId0+RNyWD5tPJrAhosL9DJWysuAI7ub
         UKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746462123; x=1747066923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uZWM29ZYXPE6WZovBDu4ysa6ypJm1CwHnOC5/T+iIsg=;
        b=tEuW5LoqB6QuOT1J9FELNLOj0hEb+Ypdq7Y4LIFOz5oQbyaH7CGYsLp+SnLQlc3txt
         QkCMzvxvAUOOsx6dFHkdlp5ZLxE1Y0v8rDy3iXCYwss5Lv106rbWtYj6hXjhRS9xbVhz
         xZRwgTydwDLBW+bNHvzIocgTWKDn4aGe4Df0Ktp++91IXXTMlitxMmmMfgT/0355WemA
         F4y8Pyu/BtrqmrTVsEOB4xZ64hnMhyLuJTcxKB4+xnnRWSdx+vlKFzvl3Rk/PFjGAuSp
         7eoRp7ytDx+iFFuRRIk6VtEJrDjkts3+5t8h78yQhihFjnyrR69vNQVKv6v9cAuyxGnb
         fAzg==
X-Forwarded-Encrypted: i=1; AJvYcCUkTJU77XyL5eOWLW3E9EmQEfEgIRrqNZ8WTkSzvuBBgk3HJEQFOOyuX7qHvycSGwY7qzMWSYCchMw/2UI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0N/71x82NHbUc6ElwgBVgy6ffl29ujXZ30v/lNxYC3LX5CFgD
	4u3Q2/w/mRLjsfQNfx80+2qJVyKVRJ+wrZr4LqSHtMq+Yq0FXDuWWMy0z0Ukx/FuUQVVdIdgl9d
	uyRX0LnRLzhf0Zg2wVPoLxMz7++R29Jb9rN4s
X-Gm-Gg: ASbGncvFTvIpx8OYsiA4UzhaHptgXcDpYNPHtM0LtYZgX4XVdG8cvtGck02tJM7MmG0
	+t+Vyvyd72ZuCMxHberocX4ShBnO3HLnxMt+tapzJ61Hy2ujIJEnwLKC8VoJusECwB81KsDJ0pV
	li23bKS09dvZYKVFRrvcw2gnIK4nm7m06rJ+RjFf6jNSugp//VZhRe
X-Google-Smtp-Source: AGHT+IF3W3JEvAdEn+6XkclyIVYv5toqYTej+h7meAPk6df9tgcuXw9vF/e0pkd6A8Xlf/Wfop4LfqAhu1LtVh/wG0E=
X-Received: by 2002:a05:6402:1507:b0:5f8:7b57:e5c2 with SMTP id
 4fb4d7f45d1cf-5fb566852d6mr12307a12.4.1746462122587; Mon, 05 May 2025
 09:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502-debugfs-rust-v4-0-788a9c6c2e77@google.com>
 <20250502-debugfs-rust-v4-1-788a9c6c2e77@google.com> <aBYNyqTRlpGAJVuB@polis>
In-Reply-To: <aBYNyqTRlpGAJVuB@polis>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 5 May 2025 09:21:51 -0700
X-Gm-Features: ATxdqUGcMXMdSjP5tftelubLXCUlS4UUnNm62xHIfh2j0Jbk-ZgPQhIrNbn7VhU
Message-ID: <CAGSQo03Fz-U6pTYn1kL5GRsTOSpKnSnsG52oCrJii6MPM9x73Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] rust: debugfs: Bind DebugFS directory creation
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 3, 2025 at 5:36=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Fri, May 02, 2025 at 07:49:30PM +0000, Matthew Maurer wrote:
> > +/// Owning handle to a DebugFS directory.
> > +///
> > +/// This directory will be cleaned up when it goes out of scope.
> > +///
> > +/// # Invariants
> > +///
> > +/// The wrapped pointer will always be `NULL`, an error, or an owned D=
ebugFS `dentry`.
> > +#[repr(transparent)]
> > +pub struct Dir<'a, const KEEP: bool =3D false> {
>
> Why did you move to a const generic, rather than a new type? What's the
> advantage? AFAICS, it just makes it less obvious to see from the type its=
elf how
> it will behave. Reading Dir<true> doesn't make it obvious what it does.
>
> While I prefer a new type over the const generic, I'm fine with it. But I=
 think
> we should use something more descriptive than a bool. Please see
> device::DeviceContext for reference.

I'm fine with a new type or a using a more descriptive const generic -
I did the const-generic to avoid the need to make one variant the
derefee, which can sometimes complicate structure. I'll default to a
more descriptive const-generic.

>
> > +    /// Create a DebugFS subdirectory.
> > +    ///
> > +    /// This returns a [`Dir<'_, true>`], which will not be automatica=
lly cleaned up when it
> > +    /// leaves scope.
> > +    /// To convert this to a handle governing the lifetime of the dire=
ctory, use [`Dir::owning`].
> > +    ///
> > +    /// Regardless of conversion, subdirectory handles cannot outlive =
the directory handle they
> > +    /// were created from.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// # use kernel::c_str;
> > +    /// # use kernel::debugfs::Dir;
> > +    /// let parent =3D Dir::new(c_str!("parent"));
> > +    /// let child =3D parent.subdir(c_str!("child"));
> > +    /// ```
> > +    pub fn subdir<'b>(&'b self, name: &CStr) -> Dir<'b, true> {
> > +        Dir::create(name, Some(self))
> > +    }
>
> The default should be that the directory is removed when the Dir instance=
 is
> dropped.
>
> The common case (which people expect) is that an object is cleaned up on =
drop().

In general for Rust, I agree with you. For this particular case, I
have a strong disagreement - take a look at calls to
`debugfs_create_dir` in existing C code - new code chooses to discard
subdirectory handles when done and rely on the recursive remove of the
root directory to clean up subdirectories. If you and Greg K-H both
agree that I should make them drop by default, I'll switch it, but I
think this is me following the subsystem maintainer's intentions here.

>
> > +impl<'a> Dir<'a, true> {
> > +    /// Upgrade a non-owning directory to one which will be removed on=
 drop.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// # use kernel::c_str;
> > +    /// # use kernel::debugfs::Dir;
> > +    /// let debugfs =3D Dir::new(c_str!("parent"));
> > +    /// let subdir =3D debugfs.subdir(c_str!("child"));
> > +    /// // If subdir were dropped, the directory would not be removed.
> > +    /// let owned_subdir =3D subdir.owning();
> > +    /// // If owned_subdir is dropped, "child" will be removed.
> > +    /// ```
> > +    pub fn owning(self) -> Dir<'a, false> {
> > +        Dir {
> > +            dir: self.dir,
> > +            _phantom: self._phantom,
> > +        }
> > +    }
>
> As mentioned above, please make it the other way around.
