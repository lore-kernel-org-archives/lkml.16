Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8D119ABDE;
	Thu, 22 May 2025 09:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747907246; cv=none; b=J/1fCxsgNFgt9rXSy+h67jshKcVXEaP02cikaG0zlNmGiMcaTuWYVyRreFLe3rVhlhHHukwJPMV98+df8RShgPXgyF8TWFaqbmOAtg4aS96dA7rQO8PFsnjF1FVymlimrgOZwDaXJlXLCrKYR0tybJhf3MfwsGfpo4Laz59RLi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747907246; c=relaxed/simple;
	bh=4Mi//bmqCitlsd1rQzDuiS76DZ9pyq2kmydmOzYN5jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cK3y6xQggniDnEY82rduAHQDgYhctgFIbZRvbZB/lUn6OTOQzyc8VijqTSeW4U7UKUwL4HAT7K3uH+6JARBFjZgeChxGzTsdULZA53lQsDEEzZlvERdSoWTztc7jYcfV9vT7zu0EJ+Qou9+rQXrcGhG5gmBetjUJZFHVAu6hzxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/YJ7Weh; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/YJ7Weh"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-231ecbe2a5dso5685595ad.0;
        Thu, 22 May 2025 02:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747907244; x=1748512044; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipAwY8ZxlvEf1nakEvQVnIk9cDkKI8+OAel+80ahbDs=;
        b=E/YJ7WehRFVOuqchMTDdvFDk6Alkq7Il6ryhrxCJfHvQTrtpTLzAqSr1gaclOlqcNn
         /7mKJKgsE2sPHKPMCOdVXxpz2RURymaIa9vTFFNsz+yokYgipeQoKP0npt4dX9iJTJHs
         30Wr7Udb1gR/rRnxSm1U9tK9rqSccdwWMvfOSR9/bq3FMap/FonrAs+rzV65AEKLxtZl
         GDyLKzgJ9BwOCe7sytaGVvsYcsAbICu+OhG+L2tFNWKwyQmNK/1wSghzJ4+q0Uji4cgl
         ConOcbezkbjmekFdeoCXUn7RcqLzVFPPcMtG9k1ARMmznNNNCllAx3BGRHSJKM7o/S7F
         rGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747907244; x=1748512044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipAwY8ZxlvEf1nakEvQVnIk9cDkKI8+OAel+80ahbDs=;
        b=LlOlzG4v77yFyoxA+kXlRa7AVCQWO4knSFZKhNx9FhAFnp2zD59hLW7Gxg9c+6CsGS
         UQpj1JfAmmx1CKYGXLGlKIIjqNT4KR2NACzYjbW3Y0OCFqpUSwuVuNYD2MhBbFjWjf/e
         OxmyvCKPWn0QjWx+mQKXAqQIcVEmpyL4LmBKzt/9v2PS0ub+UvBx3xqOSZiLzNGTySwy
         Uvdn5vFqcsVotHCD/ZMnCKM4ghtfO/anPxQxChiebdb9PqPHfcIHhpIkJc2yGYNqcKgT
         VbMce+7VwmEpgRqqT/cqtOwgMUcNedE/YCuGs7nsUGVHz+KvltgIBYIMf6pmOxAuVygj
         2eIw==
X-Forwarded-Encrypted: i=1; AJvYcCVbTMfJtlhzKGV3mV9nukIdzH5n2nF4fCr5QMOWdimzeccyc8vg0Imfz+a7ptDWhuPyX3OCrQpEUf5QuOwyanA=@vger.kernel.org, AJvYcCWfWTmTeTRAEQb8fQpg5WkrzdxbrhdKYLVMhs6oU2qfb5nHSPRiTxZELS30vSQDCAKw60ynH1KnZl3byUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEO8FHJhJATtOubcdq6Orkh5qdzdsrs4B960Vn3++PIy6I5IcU
	PSyfluZx0cMfy5nssyxbI3+HosvnbvU723yNLNnBNN/5o085W2oHKK1NuisYdNfdsF0Q9Io4uBa
	sltz1gmaGaIC2YfztOsC+YHC6dKWpnww=
X-Gm-Gg: ASbGncv2L8FAEp/t5oTWFq4LOjy4F2X2Nby/baTpZO1szlovHUKvJbRTkiKN5o+JWU8
	6+G6uLo6RtlZ4uOscqmQxion+ThU8tuKLV4FkmJ8ZO6MD+BOxjTkH5z2QXgEEekvF946irBLhAi
	1kFUBkezaKWCbvXpCacP2EqVOH65yQOx9j
X-Google-Smtp-Source: AGHT+IHKkMNeaj6kG+RCv22d49KV67QvtWhnBvQaNqs96AouSRNF37SPJJw4Y6hGaON6FpFmZHUqDu6VOEZ338Aktx8=
X-Received: by 2002:a17:903:2285:b0:22f:b00d:fe59 with SMTP id
 d9443c01a7336-231d450fd20mr120664705ad.9.1747907244533; Thu, 22 May 2025
 02:47:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520182125.806758-1-ojeda@kernel.org>
In-Reply-To: <20250520182125.806758-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 May 2025 11:47:10 +0200
X-Gm-Features: AX0GCFudr69K7Ker-OBq61Wf5eeUt338xEQM0BHHVJyg1bvCHsTu9tjB29wkrAQ
Message-ID: <CANiq72=p4P9MuFKNy28PdHSqznvW_8Tep1wjm3zPXqbZVrujfg@mail.gmail.com>
Subject: Re: [PATCH] rust: remove unneeded Rust 1.87.0 `allow(clippy::ptr_eq)`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 8:22=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Before a change to relax the lint was backported to Rust 1.87.0 before
> its release, Clippy was expected to warn with:
>
>     error: use `core::ptr::eq` when comparing raw pointers
>        --> rust/kernel/list.rs:438:12
>         |
>     438 |         if self.first =3D=3D item {
>         |            ^^^^^^^^^^^^^^^^^^ help: try: `core::ptr::eq(self.fi=
rst, item)`
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#ptr_eq
>         =3D note: `-D clippy::ptr-eq` implied by `-D warnings`
>         =3D help: to override `-D warnings` add `#[allow(clippy::ptr_eq)]=
`
>
> The backported finally landed indeed, thus remove the `allow`s we added
> back then, which were added just in case the backport did not land
> in time.
>
> See commit a39f30870927 ("rust: allow Rust 1.87.0's `clippy::ptr_eq`
> lint") for details.
>
> Link: https://github.com/rust-lang/rust/pull/140859 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks everyone!

    [ Reworded for clarity. - Miguel ]

Cheers,
Miguel
