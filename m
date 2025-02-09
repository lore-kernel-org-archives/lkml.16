Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D68614F70;
	Sun,  9 Feb 2025 16:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739119185; cv=none; b=LnW6uZ/Lr7+s20TSjxpagzP4rB6SAna8sEOYkjsktwywRQpR7PNnEi3SqiSETb7QcwGNO0WuCHLe+NhjqxHfedjvV5iKfaPS6/ykDoH4r8fF9femCqVa66r7k66JWFPxUKMHvoaRVKULOCfGDzmdL22q5s4ZS5mv7snbFMxIUrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739119185; c=relaxed/simple;
	bh=2rckUhFY6qefPBowZAUi1IfVckCqF/NMT+aGa+Wn1cY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YEzaFLNFjHSGtPOM/wrylWOHf+n1uQDeoIHIJAux4bu8Qbbf2aAbrBWlNjlmqo9wvSszZ9Zjs6JnFC7BaIpI+wvB4yMcqsMRSvWBBhAQquXvlkpBG66JYTREX678i5D1IVkxPQ79GBV4MzuJtWGeLoKTuGbPO+pFZGrC578ukJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOHouJO5; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOHouJO5"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30795988ebeso35271171fa.3;
        Sun, 09 Feb 2025 08:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739119181; x=1739723981; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rckUhFY6qefPBowZAUi1IfVckCqF/NMT+aGa+Wn1cY=;
        b=OOHouJO51tFSaV9uVaJ932tacyabfsrcSUeYc5My0bzZYDngpJtwXAw0bdDk0KEctj
         SGmAwQEYroTt/4f4ByKIHGZ/Bck3d68slx6f8laVS7zxYPbOnke0hD0b7a4fGwOUzRFn
         Qcax8WUNC+hl5X5PAXNKzGtM99N3NhdH6BoB/ycyb1l+BOFUlwv/gAD+jthuGOWX28F2
         UUd/o79C+9cdZJaDiBUtV93kjBzqEXSea+9lAUsY/wd9nf2gNIPQqsLD0vrHsNGkAdNW
         zZmFpLJFhp1onnI+y5Z8Y/7DEfx8JY80k4eUfC4X56A44Yqeq8nQD5bFvaFFhp5pO19m
         0Pag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739119181; x=1739723981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rckUhFY6qefPBowZAUi1IfVckCqF/NMT+aGa+Wn1cY=;
        b=SoFdgqccojtDXoX90D9hDijl57lsC6V7hbh/FjzLcm6fOCnt4Ih2jwoxmW1399QPVs
         GBMeloRKDr7qfb4EZqj7y6XfKpxyazxWJ5pnCQ/zRGYhEWCpyKrpRDB4QNy49/ZM5K2F
         QSbiC8vjsfDGLO38xds3B60d8KKpDpsrjX1uXuQbGMFjkXRshayoCbzCb+H8Fjd5nnIo
         rroWfAgTOO6apwjsezVKM1B6OjurSFpIwz400R5Xr166N7G76AaEIXGJUWEebN3bdanR
         nUsr18Pp9yinmuhILA9zOdrUQUqRKhBap81mHmiv44/wjVqvF1wpXZLyjozZxXDJwSqk
         UCiw==
X-Forwarded-Encrypted: i=1; AJvYcCUBEFHeya45WUHxgAWf2TqRjALomAKo4YhHmcwsCNoEbtVl1neKsp6InEPhDP7RXzbD3P8ymqDDfU5knAI=@vger.kernel.org, AJvYcCWfRBf+fRRolULKm57NRKuYSfKKtzTl5qxVL5PmxH8VG0Vgo8Osi9M9TnYZY+NPlbb6xJAVwN5JXLky0JUd/GQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW1Niwtdv8JEQSVZm8dbubNOP/6LoffdfZzc8z+ma4J3Cmkgz1
	Bf3iHFA6YCME/2r+Aic1kmXNkI/ZBQgfGERqAn7x5HthjeEWWfJ4i94Ae+b1pW2SWfQABeV10lQ
	hj93kVURGM5apAi9rc0y063m9YvI=
X-Gm-Gg: ASbGncsmdvsdHigK7rfq+gTutq7RKVmZnojku28MeaU39VgRjoulB8pQblkOMWS0BCd
	TJj4BkelgxbBvMzREbDH6785xmVLJOe3GGDKK2NtJDONmwqUYKM/YRdVpIlTpjJNsSD5FgnpB0d
	uDEW1w2Q4aubY/xdVFn+DGaWAwJcC3oic=
X-Google-Smtp-Source: AGHT+IExUx4NIGmguKU4D4Qk0WfWgOlo9Eyn75GmuZHvovvXrmbeq4jlsv1Iqx2uZzsKPzb1BdRfhBxizke0HIGy1jw=
X-Received: by 2002:a2e:98c7:0:b0:308:e8d3:756c with SMTP id
 38308e7fff4ca-308e8d3780fmr8530581fa.18.1739119181071; Sun, 09 Feb 2025
 08:39:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209-rust-analyzer-macros-core-dep-v1-1-5ebeb3eb60a9@gmail.com>
 <CANiq72mw83RmLYeFFoJW6mUUygoyiA_f1ievSC2pmBESsQew+w@mail.gmail.com>
In-Reply-To: <CANiq72mw83RmLYeFFoJW6mUUygoyiA_f1ievSC2pmBESsQew+w@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 9 Feb 2025 11:39:04 -0500
X-Gm-Features: AWEUYZmSrwi9GQ67Jh5WxyuJAHR9A17JLxFoYAOOe-eTwEhgFoB2sXqtigiBQSs
Message-ID: <CAJ-ks9nMjPnyY_J1xH93MEepcekYWQ=Ve+Kq_TaM=MvA4B0Phw@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: add missing macros ->
 core dep
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Fiona Behrens <me@kloenk.dev>, Kees Cook <kees@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chayim Refael Friedman <chayimfr@gmail.com>, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miguel, thanks for the quick look!

On Sun, Feb 9, 2025 at 11:29=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi Tamir,
>
> Thanks for looking into rust-analyzer, it is great to get improvements
> in this area.
>
> On Sun, Feb 9, 2025 at 4:29=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
> >
> > The macros crate has depended on core since its introduction in commit
>
> To be clear, `macros` does not depend on the (kernel) `core`.

You're right to point out the difference between `kernel::core`
(module) and `core` (crate). This confusion is solved below (because
it doesn't actually depend on the `core` crate).

> But it
> depends on host crates: not just `core`, but `proc_macro`, `std` etc.,
> which is why we can use things like e.g. `std::fmt::Write`, right? I
> don't know if the distinction matters for rust-analyzer, though, but
> things like their `cfg`s may differ.
>
> I also wonder if we should also be passing `std` etc. given it seems
> we need to pass `core`. Does it handle correctly that `Write`, for
> instance?

Yep, it matters! I realized the same in
https://lore.kernel.org/all/CAJ-ks9nkY7za5zQLv7YkvCeJ1BQ70ZnTTP3Q4VNAmMaG3s=
Gu+Q@mail.gmail.com/.
With core replaced by std and proc_macro, `std::fmt::Write` and all
the `proc_macro` paths start working as well.

> Perhaps rust-analyzer allows to pass different sets of
> crates for this, even if they share the same display name -- then we
> could pass the right `cfg`s and so on.

I'm not exactly sure what you mean by different sets of crates here.
What `cfg`s would you want to pass?

> Cc'ing Lukas and Danilo who have been looking into rust-analyzer
> support recently (Fiona is already there).
>
> One more quick comment: since this would apply to all proc macros,
> should we do it for all proc macros? i.e. instead of hardcoding it
> here, using instead the `is_proc_macro` tag we already have.

We could, but then it's redundant with the deps section. I'll leave it
explicit for now, since it is just one line.
