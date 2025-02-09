Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AFDEAC6;
	Sun,  9 Feb 2025 17:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739120747; cv=none; b=bWuCbUVChKHwwl/TTRAr7ao5KYcrw/MCxAXZMEr3XqmZmnO9+PngnSW4mtfbYA9RTBevVOezDUH7jY+sKYe+epdwUGCxYNBfoTa+bxVRX2woRrhP6KY1GhzdYhchECqH/bbRM6wRrsw38bEUucHosakrTcsl9075bkk38vUOYyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739120747; c=relaxed/simple;
	bh=awVFnFkJkkXtutnKWu1wNv8EEwuo84GsDaHo2GV3SoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cdwGdlWq7rmA1yzCeEskAUKMGRDDv048C/6n87BgpPD5exgEGS2OQ8WexgYGNtg3wtGYey15gM4U3tDYXlgLS2bSZoKxZcR+AO4jZSrlqidwcf4xycQGAcUq+5HJHYzfQuGke0PJFrcfoC2/UbzBP5aHny6ogE0mP/GaULneX5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=moITURGx; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moITURGx"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f6fb68502so1179905ad.3;
        Sun, 09 Feb 2025 09:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739120744; x=1739725544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awVFnFkJkkXtutnKWu1wNv8EEwuo84GsDaHo2GV3SoM=;
        b=moITURGxdlHcLdagz/02FqNSQr01fEQlDG7MISPp3w/eP1UCCDHojfGGRxQNDYrIaE
         5+5/+OZAb9kWYQ7J4uE5N2Z/s9YL31nf8c2wds4jPlTm2TOQZfM2OrUuLvkndjzpIJ8c
         GDxALd8Z2vV5YdBq7HEW0N+DAdx2BO0GapH2TcXLdT6+I2MhiQWSWHGO2FvAhhFrD6nC
         6rFAmJElVgS3Wh+VZy4kcjKbwzVP1miVX9GURO/zs2o1kDnIMdf2kmkZdZWea5X3yzTJ
         bqO2AxME1Yen6l80dECOCUG6QUHXvKYxhoJ96wLLhVPXB5pszkKcT8Zp5zS3E65mUwL5
         mJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739120744; x=1739725544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awVFnFkJkkXtutnKWu1wNv8EEwuo84GsDaHo2GV3SoM=;
        b=Ny2z0cEAfkkEYX8dlmvI882AIHjRfJmm3vAzCmTKbeFgMSyRaOVM76TpK29qGBfb4R
         c6idv9APBZ1XmFaOK1LUtwLfeHFVIjKYYpz/k6tk6WcAjbezFysvAr+gUIrKuT/B/WJp
         +PswSjmIzT1I+wVw9/pUFRDZ0gMCkx/0kXpeLmc3R+uBQZoP4cambq5TC769eveS+O/n
         tZ1htVqjuiZuOwlhKH0xOc0DGTJlbyUDVCEkTvhhfRZSbRM430TKSAwLKNWvo6YXPjut
         vIGPH4BgY7//FIIRfastgjWBY3wjea9vGOpet+sCvp+YTYkyp0xweTv09J8vnK+LQP8f
         aAAg==
X-Forwarded-Encrypted: i=1; AJvYcCUJpGiZzvubLTTodJ2hAkCybCM/jOptTaC9VW6NQdSGu5A8vbN5gh2gW1lqAhrvW2van2/UBOVPeG1WrTUhIsk=@vger.kernel.org, AJvYcCUga2xRZBI2xVgdORlF63jYaf4l6XR/dj+FP6sbZksXEWo6/m4GvxrJlid7M0wt405OL2/LjIIDBXtU+LU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2qtVS40OTeIu/UBkT5VjWIdCTUECXHmhkyUQaa0mSKSCEhf5/
	MbSpL1FMpeJF+HejDeFqfh9hS3E/HDs1pYSigGdcBNxd47cmkPeVTkK2z4wKFZpX5Jb0SwqJhGF
	uTHeVB/rvAxJlR4oj15Ug2uQ7yFM=
X-Gm-Gg: ASbGncv3PzBVHdSbHJoDNWLmGo9ksiLdcz5+CrngjID58e75Qig0LC/VB/4iDwyNAAS
	5hanWWmj3fFU/2+DmNNHdXl8f/8syzUpqiI6dggRT/ka4WW4iZIcrN5wrv/00ngFhfNPRKbi4
X-Google-Smtp-Source: AGHT+IFxi//jPdVxLWG2fniL8D7xJL/7fk8p0T1OfmMgQHML8fKKHdV+hmwCkxzpuMVurFgXnHiPvDcC7MhG3Cnu0Vs=
X-Received: by 2002:a17:902:ea0d:b0:216:4339:70f with SMTP id
 d9443c01a7336-21f4e7101bdmr58173815ad.8.1739120744234; Sun, 09 Feb 2025
 09:05:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209-rust-analyzer-macros-core-dep-v1-1-5ebeb3eb60a9@gmail.com>
 <CANiq72mw83RmLYeFFoJW6mUUygoyiA_f1ievSC2pmBESsQew+w@mail.gmail.com>
 <CAJ-ks9nMjPnyY_J1xH93MEepcekYWQ=Ve+Kq_TaM=MvA4B0Phw@mail.gmail.com>
 <CANiq72n2WTAp28PeNVw1hOsxw5Bo1HMxtpTb7N-f7z_aGMppBg@mail.gmail.com> <CAJ-ks9k1+n7GS8mMYg1BzrBwsEJK3P9xPnj6xGO7Prx0qWSs2w@mail.gmail.com>
In-Reply-To: <CAJ-ks9k1+n7GS8mMYg1BzrBwsEJK3P9xPnj6xGO7Prx0qWSs2w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Feb 2025 18:05:32 +0100
X-Gm-Features: AWEUYZmzL9ngYLqE-YjHB9OU5UJHvPuHvhJCdD7M4xGuwLf8ExRJNuGZGxUUC5U
Message-ID: <CANiq72=sCeT0xwmszLZ-sOyH5YdOvvbzSgMsz5SgzF_wRJTbxA@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: add missing macros ->
 core dep
To: Tamir Duberstein <tamird@gmail.com>
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

On Sun, Feb 9, 2025 at 5:49=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> Ah, I see! I'm happy to do that in this patch if you think it's worth it.

I don't know if it is worth it (it requires testing it, I guess) -- we
can go simple until we see we need it, especially for a fix.

> The python function `append_crate` takes both `deps` and
> `is_proc_macro`, so implying dependencies based on the value of
> `is_proc_macro` could create duplication.

Yes, but the dependencies for proc macros are a completely different
set -- that is what I was discussing above. And those dependencies
will be shared across all proc macros, when/if we have several
eventually (e.g. per subsystem).

That is why, since we already have `is_proc_macro`, I think we should
just use that. It may make sense to split `append_crate` into two
functions or similar, e.g. having a `append_proc_macro_crate` (that
perhaps does not require any dependencies) -- it would be the same
idea but cleaner.

Anyway, the simpler the change, the better, especially for a fix. But
please take it into consideration.

Cheers,
Miguel
