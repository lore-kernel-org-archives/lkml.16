Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C43F1DDA32;
	Wed,  5 Feb 2025 23:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738797314; cv=none; b=Oc3doZEhUm+1JyfH/8zGF4g5T+bLRaqKFm73riUeJ+sUtBEubImsREc33ygGyHafwCg6dsUh/fsGmz1fEEiryQ2kqZA1hEu7ACUji/QQPcMm30YdBozQDBs+x20trAdzEK0TipqJwOTZPsaWU4FG2GLfthesU6+REJfLbJtQUzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738797314; c=relaxed/simple;
	bh=Dj10eVu+ntr3XrwN5g7OfrQ3KctnqKbIx6NJh6I9nl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HdOm8VI8SPxiadrRDYqDxyuVcM+9B2+LUFdI/48xRu1ME0Bfmw8ZcJWtkZVjRVn+5Qmgfknziz2FPm+SNoEpTqj0tePLig4yVjvCX/dCU9Q9UvvGVS5LwRBi6zXoC3FtBTz+A78Hm5STysp8noRSNTApKRcupfZyUbpF5Jv7gXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULIjEPS6; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULIjEPS6"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f9f90103bbso51629a91.3;
        Wed, 05 Feb 2025 15:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738797312; x=1739402112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dj10eVu+ntr3XrwN5g7OfrQ3KctnqKbIx6NJh6I9nl4=;
        b=ULIjEPS6GZl2fyRSzIYJBmR0WYca9EmwI4VjGj9ZLx/ZklspXbrOZJ4o6+hWrRSYrK
         hArQc4MXaD6EecZubdqiTCFdBkrM/IcR/riN+q8nT3UpySNEcZqM3fAS9/Fr5L3I6yyZ
         Mf+HuRufzYCprI3d5L/jfTKITAoCgCS+NcqFKSrbyrpY73ApqT2DXzD5IoqtXHK6rSrE
         xoUmsmplJ1GMAYWKkWNfxb414CdEn4O5SvEysIJPuqRAOG680LQz7pMimC0LJd8/HMk9
         uNZCkBJO5NwsHleCxP3DaNiltcpu4amFSsN3a2E5nQGo/2NPfPyI4mJ+WgQtKppaFAwy
         r2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738797312; x=1739402112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dj10eVu+ntr3XrwN5g7OfrQ3KctnqKbIx6NJh6I9nl4=;
        b=qV/zO5TrCBmmb9GqoeuDBgct4c3MTcSS1Kmx9R+mBh6jSjja0TWUhkzTA/Xb5/Yc8J
         Tzs3/qLoigMaSpGjfQaf4oTnKM3UZnoM9i5oQGY6NXY6UI1P3E1AV50Cb1F3f8ngVCXE
         UVom3tv0ytSp7tGxMlid+NDA4tAod9Rbw9GsR+gPfr428jKDiI6MDll9NJGnCV+cvZpW
         JIoK3mdD5Ck1O8NoVBLkAl59mE8PtG0FP8YTuCuDWuMsrUBTA01OQpZ0ya47U1bi1t72
         ZEFr6dVF1+70cfR1R4yr1Cs6AiGtcyPkfVd/3fgnsoatarLDM2eIy4DWVx+ta39y7eeR
         eY+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuTN9qCP0Gf2Afs1jbZr992T5IOlmGaSWekKyKf/x7bAZjw4tH6ceT9Wxm+HXpn8bdPdgzLjctl03+FaA=@vger.kernel.org, AJvYcCWxYd6rIlZ0hpy7Szjy4Ka4r5eJy+HCultpE2GjvXwdpKtR+IVXyd9HgFeLunncB9rOq2Ld7eHnFH3AWYjkhbw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcSXcgeLPH6Sr91gbWzpnsDdBIVL6FX2WcI115g6thyMjh3Civ
	N757dPydCmBPuDklQ74QxYhK8iYu7P5xJ3RwAM9kI2zRcjpDzYZQdYkSFckJBk3jfSrioGhzjqz
	TC2VrsHMbx77K+3Zi7LyZcdn2ptvTW+CC+uQ=
X-Gm-Gg: ASbGncudxiJupTmY6jYyx7hk1VtNH91fbFwPN4GVnHlDF2RNcVY2rzmkVkXfijnN2L+
	brGiTv/3rbCnCsFGi+LfLit+r/qZkQv2lsEVtQJ5oUZT5FIJyAKStcRp9EIF65QPiyo0k0dXQ
X-Google-Smtp-Source: AGHT+IFQ4lK/LPU4Y6LTOziWYVYQ3RkQP26tNWcbiNrsskBx1DezXDxwkqFkxG933Y3hdhdV/qRgzdwOWvyT4woQF1Y=
X-Received: by 2002:a17:90b:2fcf:b0:2ee:acea:9ec4 with SMTP id
 98e67ed59e1d1-2f9e0800346mr2974729a91.3.1738797312505; Wed, 05 Feb 2025
 15:15:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201-fix-mac-build-again-v1-1-ca665f5d7de7@gmail.com>
In-Reply-To: <20250201-fix-mac-build-again-v1-1-ca665f5d7de7@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Feb 2025 00:14:59 +0100
X-Gm-Features: AWEUYZm-pBcBtUX022ajXpCvIExx131k4d7qv5c0XfPXNEBQvFB3aw7DQVoF2Oc
Message-ID: <CANiq72komOixypkHcSurk1-tMc_FYacQfKLEOqv9pKaD=nJ-ug@mail.gmail.com>
Subject: Re: [PATCH] rust: use host dylib naming in rusttestlib-kernel
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2025 at 6:40=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> There seems to have been merge skew between commit b2c261fa8629 ("rust:
> kbuild: expand rusttest target for macros") and commit 0730422bced5
> ("rust: use host dylib naming convention to support macOS") ; the latter
> replaced `libmacros.so` with `$(libmacros_name)` and the former added an
> instance of `libmacros.so`. The former was not yet applied when the
> latter was sent, resulting in a stray `libmacros.so`. Replace the stray
> with `$(libmacros_name)` to allow `rusttest` to build on macOS.
>
> Fixes: 0730422bced5 ("rust: use host dylib naming convention to support m=
acOS")
> ---
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to `rust-fixes` -- thanks!

Cheers,
Miguel
