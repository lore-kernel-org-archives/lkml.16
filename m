Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B7A1AAA0D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746025945; cv=none; b=lSlxE8xSzTzaBoZlpLW+N6ZxW0y0mmEXh80KEnVoU50XM3EnySwIZrPXIU3c4Keh2Z+7Q2+f6+yOKQ7iNT3lXPGJELt6v9zL7FJihDdGt0akA76K3q1aam8OgBbT4/o0ceKDmm7BN5rr2XsACiojj7BC3r96AzIZmTprTfRZAeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746025945; c=relaxed/simple;
	bh=3cycFABzBd9M6b4gkgL4KrEdY8QhVRFmgCnPwxrmyOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Stb1m6yT/t88nExm2xx/O3RoDutiXATpJXQTKSOysZXR79WupBsbO77HKSZqs+SHMYreIXoXg2LvNyTkFCtJPTRXCfgAntDeVle/9jFUjdg9THCwNDiOdrRPnG9J2K39vokq6sJvNGNVOjVku3sipfsx2QdGj5lFcwi9g+d+kV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=36O17fre; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="36O17fre"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47681dba807so293321cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746025942; x=1746630742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhEh4tvbRMYHNdTjhp8bc+1l+QqiVag0W2z4WqVEcFg=;
        b=36O17freEVVJUorWMnWXx5lDRDqTOw0ly60tP2p4r4N3to2CyK3Am3fgWPTWPHyvmt
         uCQXVQQJJBZPy23VoKFuk/B2BU6+hRD2pHmxhpnO7EHZxUiV2FxkQJpiMC9Sf4mIqX6L
         XOR3ztBGaG6TwjQkzUsMso48XyeX/mx6tmmdj40eOx6uJVDgCKNhHpyDhYl5K3FuAE4o
         LeMj7vYx5ZaZ3aiG5A9epukKu49Gm5UWfuHGVNqFNptvTu46X4qq72oP+c5we5nUGPdJ
         EfJc5HbDs0hg8qmu+1vkF4cgR8MTlCi4sEfNyPZ4v2kpbaVc7cm5LAdYf1kJI0JgCmEN
         Je0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025942; x=1746630742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhEh4tvbRMYHNdTjhp8bc+1l+QqiVag0W2z4WqVEcFg=;
        b=RxkTTQwoDdUmtuk73tkLUmpYnkpsaI5dHDiXCO4kCy4KtG5TUEc18VEI6UOOJtDER+
         T+5x2/lNWvZbQP/AKoZiz1tAvXPRnbI/wHr8VSy/vwuFf79/4l7GonxnmEgmSu3NBYEA
         hV17H9RphiM1BOtCLrZ4gdT9j3sSOygw3ZhAuZ5XgKS81BFVoZN+2d4HTD+GfPj5iKPy
         RxeV5W8UWXyfAkixzU7CW3wRP6RmSw9M/2RWDv+t6u3nzxjv6XMl/UkM3QZe3e+Q1/7T
         0v6wcnNAg8K+J2l+1C7ZaHsYT6OSujybR5gD4B6VEsCCu9GxC1Zip4p7aQ1sg9LJ1AFa
         PRGg==
X-Forwarded-Encrypted: i=1; AJvYcCV0GevrJmTQ9iyiOgIAygS9hKFYwaw9kki2cRv41Xcf6ts8lKzkJ8cqZr222WOEKphGe13BmRbTmm1pdaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvprBYyxyDId1vrJY0CkESDpZDeZek92sD0v/2lAMgbXRznE2Z
	pdvz5v5uIMipv2gL1Z9Ycf1rGOpS2REW9MqN32x5bBkQif3ylWH67PU3uQJ41n71M/cgF9s+s7U
	hAfcFnpfmRGeV+M8mWI37o+UnjwDFq7mNetDG
X-Gm-Gg: ASbGncs9cgDhGGVoXaEI3e5kYi/8w81gmyi4fiCVw3Rky/byDUZS0YCUp7BXNY3PHrU
	Ck9sDR8xsGkaR2DWGrje9N8O6pF2lin2lbUuqPR0xyaznLe3BP/0+Ud5nttoTneW8UnlmbpdI2b
	g6jdAR0jAEQA2kTVxzHEk0fWY4EdGgeg+oyZZlcNp/rkL0/0e7c3g=
X-Google-Smtp-Source: AGHT+IFmlpWRvz2HKpk5LKdhm8W/XO9lRRW725KI52RH7XaAa1gsuyJ97GzbXpDX+9WOsXmG+wHKzjnR3JYZPru6i48=
X-Received: by 2002:a05:622a:1a01:b0:48a:ba32:370 with SMTP id
 d75a77b69052e-48aba322710mr352041cf.10.1746025942178; Wed, 30 Apr 2025
 08:12:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
 <20250429-debugfs-rust-v1-2-6b6e7cb7929f@google.com> <2025043006-snowflake-headless-e417@gregkh>
In-Reply-To: <2025043006-snowflake-headless-e417@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 30 Apr 2025 08:12:09 -0700
X-Gm-Features: ATxdqUHiJZ8BaCLBuJNRHBSIT3lqotNE34NeBiHm7ND-1AR63rbwktVRylHyOGg
Message-ID: <CAGSQo01-bQydWgiC-+VRL7ac6v8WG2jwZ5RewPheW-quSQBsow@mail.gmail.com>
Subject: Re: [PATCH 2/8] rust: debugfs: Bind file creation for long-lived Display
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 5:06=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Apr 29, 2025 at 11:15:56PM +0000, Matthew Maurer wrote:
> > +    /// Create a file in a DebugFS directory with the provided name, a=
nd contents from invoking
> > +    /// [`Display::fmt`] on the provided reference.
> > +    ///
> > +    /// # Example
> > +    ///
> > +    /// ```
> > +    /// # use kernel::c_str;
> > +    /// # use kernel::debugfs::Dir;
> > +    /// let dir =3D Dir::new(c_str!("my_debugfs_dir"), None)?;
>
> Again, can never fail, so don't check it.
>
> > +    /// let file =3D dir.display_file(c_str!("foo"), &200)?;
>
> Again, can never fail, so don't check it.
>
> And "200" is wrong, did you test these?

How is 200 wrong? This displays the number "200" in a file called
"foo" in the directory "my_debugfs_dir"?

>
>
> > +    /// # Ok::<(), Error>(())
> > +    /// ```
> > +    pub fn display_file<T: Display + Sized>(
> > +        &self,
> > +        name: &CStr,
> > +        data: &'static T,
> > +    ) -> Result<ARef<Self>> {
>
> Again, will always succeed, you don't want any checking of Result<>
>
> thanks,
>
> greg k-h
