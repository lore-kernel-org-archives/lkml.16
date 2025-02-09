Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD1F136A;
	Sun,  9 Feb 2025 16:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739119745; cv=none; b=J6SCgQs/DTG09X+eja1DY4v5CsNRsNBEiICvsnjYVcmw9i64cDQvDDPhOEzcBRWhqteDtCzwTz79qFBjNdlrd20Vne302auskxTCeePlU/m/Pfr+avnLyEIVLGTKlE6zj4PPNeB8d0g0w2OF/0Iv482jPU1VrlBuGmyru3EVb38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739119745; c=relaxed/simple;
	bh=m0oQkBzh43pCDGKm04a80q8m43SgHsPiwJz2r63nhOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LL4ExsUzNShgeNP4ahG6dfYVyDXon2t9GRxu2KUIcYK8GAgZUVYLfrUq8BUNPYQa4jO1kHU2QRsy/7a6YkospWq9MKVRbLNwo3A2xI4nV9R5KWExDe80RMhkHPTIvw3aBGrZ5BsEAvf9eog+1v/oBPvFJEnPEok/j2hcl+ciNUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJViZs38; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJViZs38"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-543e47e93a3so4020782e87.2;
        Sun, 09 Feb 2025 08:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739119742; x=1739724542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0oQkBzh43pCDGKm04a80q8m43SgHsPiwJz2r63nhOs=;
        b=lJViZs38WGEGNEO0+vkE/QClNfmr8Dtn1i97p6oiOSRGsVDUBenRZPgHnEu2QVmduz
         FY0KewX6H60qjOJoS6OUG+F1VEBLCCTudIWi2wQIaxGH+K+7Zv7CRH0OaYwDEhghnzmG
         S6f/2MJlKd8qNP+OzeLggGMrLrJ3EeE5cctwQjmcZA/Cg6DyZSXsSbYaM0wXC19R2mov
         uhWzUrRxPD4zCcBLqmVN+SzGTgvamBKNVwVDwdvqO+VsTG71z1AmPkvKiOAdVklemojh
         bdnjaUzUXdB7WzIL5F6Ec/Y1kST5l9qqiPGko+T1VqzB/LGjp3Ojf6+M0LYUKgj0cl37
         /AQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739119742; x=1739724542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0oQkBzh43pCDGKm04a80q8m43SgHsPiwJz2r63nhOs=;
        b=RLNM9f4XQrQK9GCtQxemdyg+ArkcvAQm+ssRpQkiU60mVywYHxi5OjS6kKpLoRjjqE
         6FbznHaawUSdhpnjyGItrozBCPtGzw4hcka4xsNeVz3TbVfiFrkWJTzZOBD6EZNnOCUb
         bqGBIxHwAgOI3sM5iUiCC6P1P1fzCy99hhPDdocgNs2pU8Jq8n3a92wQzGozvDdxwShn
         tvtLyXWEtKky34LAWjLLUmVJPebzi2E+6tJeLF/ttVfMykXrt25W8V7w6NZ2y0rciv7M
         9a5rp0HoAoVVOlVfoUwfdzCwiK2kaCQwcyqsCaqAE/VtOkaiLu5+tr66ylvs7xukZfuT
         2FWw==
X-Forwarded-Encrypted: i=1; AJvYcCUkTM4WZQ1KjHPX1WStdvBdEyqBqtInxtsGcmCYyAAXR1SGZR0r9h2epV80oJCj0O+2rHD4EcmAg+EAUDnHFHU=@vger.kernel.org, AJvYcCWD5VW471F1Cx9Zl7cHOk5pxVs7IF6aqORqr2qlmlDXZT/6FHmTKYoRmMmjSZeITfwGbZh6hoMkPzco1tQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk68AB1GUGXA/z4rEK9RM8Kduva7YlR/3fK/gsthxCdmWVfLZ5
	LTDANyUgNfB4ubqylFApRqFOrdS157ZoL9ercKdyQLAd1aVhN3bW5Gzrpaea6uO58jlegkI9tPd
	JaitmhUg1HHFC4CZDgt6Rk+gkJqEz7HD26lQ=
X-Gm-Gg: ASbGnctFnq+/2pBWE8hhYH9XoH42CZQXcPPoAUr7hrao0pNStEYraemk1xIHAsxzql/
	1/L0fEf2NL/O+ufyVUx06jW+cIWNZX80O1hhBa/QTtuqKLJ0SYzspARRiTL1P78U/76NnN90x34
	Yvmot+ulIBD1HPjULefGsoLye5c6heibs=
X-Google-Smtp-Source: AGHT+IFJ8iyTIlXPhcqqQ4XAaox8OlqIMBB9SuJYsZWZDRjj5qjC7PjyYGSagULpTbA9qRi7syb2gFdmIwtlrifgXag=
X-Received: by 2002:a05:6512:2316:b0:543:baca:6f1b with SMTP id
 2adb3069b0e04-54414ae5bb6mr3256141e87.44.1739119741933; Sun, 09 Feb 2025
 08:49:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209-rust-analyzer-macros-core-dep-v1-1-5ebeb3eb60a9@gmail.com>
 <CANiq72mw83RmLYeFFoJW6mUUygoyiA_f1ievSC2pmBESsQew+w@mail.gmail.com>
 <CAJ-ks9nMjPnyY_J1xH93MEepcekYWQ=Ve+Kq_TaM=MvA4B0Phw@mail.gmail.com> <CANiq72n2WTAp28PeNVw1hOsxw5Bo1HMxtpTb7N-f7z_aGMppBg@mail.gmail.com>
In-Reply-To: <CANiq72n2WTAp28PeNVw1hOsxw5Bo1HMxtpTb7N-f7z_aGMppBg@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 9 Feb 2025 11:48:25 -0500
X-Gm-Features: AWEUYZltkNIj_GtwrcaPzDWiUOCE_2uubEjD0dL9wbHQNxvDiDqsWQwOmfz1tJs
Message-ID: <CAJ-ks9k1+n7GS8mMYg1BzrBwsEJK3P9xPnj6xGO7Prx0qWSs2w@mail.gmail.com>
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

On Sun, Feb 9, 2025 at 11:43=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sun, Feb 9, 2025 at 5:39=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
> >
> > I'm not exactly sure what you mean by different sets of crates here.
> > What `cfg`s would you want to pass?
>
> What I mean is that, in principle, `cfg`s can be different for the
> kernel crates vs. the host crates. For instance, we use
> `cfg(no_fp_fmt_parse)` for the kernel's `core`. In practice, it may
> not matter. But, in theory, we should be passing different sets.

Ah, I see! I'm happy to do that in this patch if you think it's worth it.

> > We could, but then it's redundant with the deps section. I'll leave it
> > explicit for now, since it is just one line.
>
> I am not sure what you mean.

The python function `append_crate` takes both `deps` and
`is_proc_macro`, so implying dependencies based on the value of
`is_proc_macro` could create duplication.

> Cheers,
> Miguel
