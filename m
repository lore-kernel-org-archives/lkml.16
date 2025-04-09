Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399C8266B47;
	Wed,  9 Apr 2025 14:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744210164; cv=none; b=kKMkOYRLc69UpPB6+IQZBp1dgfpF6Xwifb4KbVJKQBZgy1K8fKbdDw381wqNfBpAPlCbNDU0CmK5OwNiPRW4RgtaGlTHnn0ThiZkpk1UxVAdzXdGkdwddBcIBt73NMP2zmXcvWiPF6ap/DgoZVmB6Le4NwDhJfzSUJx6ALMO4cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744210164; c=relaxed/simple;
	bh=xhjEV056H9FYdTOEcIjULpX+6vmWA46duA0byZ/I/c8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ma+h4C1xXLCjW5fZMsDu+6QZsezXvMBtBOIvxNZEDgGOrJHHgaLgUFakjeVYtmuoQax+vdjCgvChW5pKP4XMHVc7bm8tzsqjYprNuWAg0jylb7wRIC556gsM0H/aamFnhVjQSe2jpQXt3xxke9kXuNjrwlYugnV9X+S9jZ5ALRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ln3deWoU; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ln3deWoU"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-307325f2436so69549131fa.0;
        Wed, 09 Apr 2025 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744210160; x=1744814960; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhjEV056H9FYdTOEcIjULpX+6vmWA46duA0byZ/I/c8=;
        b=Ln3deWoUhwBq3UwRSKwVj1GS/gfo8sm0NCTgAkf5cwjDmbHNib9xFEvbIj1VP7hcx1
         aktbvAu8SP9ZUv2cDlVKAN2o1Wr4mQiCo8iBQZUVo/nOiujvYwZmTttXwJCun/YPXOev
         y/yx7t7Nte0+VzC9cs5JjpAeOiDFRQNpGH9JSpjgtaRWwJRyRrPFQMz3l7SwU7aKMlSS
         D9+K7LZc2Onwc25Bc7jGfqb/Q66cXfOUnuncGjiYOgvj5IDTJghW29WZkFb9gCbkcIZt
         2okcqdf/tvaJkn/JR54fVjWa/z1UtYJmfF1bMprFKVHvDr+mGCEF9zzOSelc9+cnr1I3
         jH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744210160; x=1744814960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhjEV056H9FYdTOEcIjULpX+6vmWA46duA0byZ/I/c8=;
        b=VDMD9zwQ3cSNKH1PNCOmQzWI95H0x8aoZ+OChaMW4YMbfO6H7g0SP204qNXf3Bq5c4
         QOvXQrv9pX1OkRfeYKVRf050qp2pHgRwZGeeWfVrJUnWPWFh9hguaNSWPOgC1LsIl4/h
         W6U0yRokxgKFwUc3DIuTQvqT1ebwc2uRmFzNyj3BtKiZkNqJlTMWTxzK0TKyDwVCssc9
         C0XyANjrwsGpgZpEJ5eP4pJUG2w9Lh2AeTj83YAW0l3niXuOIEoRenhMAJHw2YV+3FWJ
         HMRY4QrDrdupQ+6nqQRyOCNMnp1e4jpYpeD7axUTWcABkfG1ETxpRS0NVKe2sdFtMYQQ
         enNw==
X-Forwarded-Encrypted: i=1; AJvYcCXGPgRkCy3Dc1QbR+3KOIkjq+RfBEr2H5sEhOeaZicfeKbMCCO4rcs+B1CLQATJXdgnjXD6gyOAqhBlPps=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0J8oNbuzuzzcueeVHsWV8lE9vr+oRLMZM2QEcCHydPKw5IHGn
	SDUVCc0VdlzMfCZTZM9LCqeFImUNsggNYwEE8S/mjVzBRljUjVg+r0KMx7Kx9NG5kBG39RxLiTr
	JHXFQFy8jEia7npJSyjuzo+Ti+Nk=
X-Gm-Gg: ASbGnctNJq7HTxQgc9bzDjHpWN6twxTyDiHA7h/psrk71kKOsxourcocp0ofhnE/Xoo
	A82759JT/4xOh/OCrcwZr70qYYGr03SLcb50D7aeXnPD3nQoWl2kuzeBlrVi4MyiGIZp5Q+UsJu
	o1hxpbkVzkbN+ZrFLTXR27WFE+m/NzTWuClSpweA==
X-Google-Smtp-Source: AGHT+IE0OjJcLvewU6kRwfbIBnQJ6RvnEQwoJX/+dBHs52WJ/p2RPdESFV141biUeNxPOtMWMCMq/ccZek2tCqQK804=
X-Received: by 2002:a2e:be9c:0:b0:308:fbd5:9d2d with SMTP id
 38308e7fff4ca-30f438b6750mr10897051fa.37.1744210160026; Wed, 09 Apr 2025
 07:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409-container-of-mutness-v1-1-64f472b94534@gmail.com>
In-Reply-To: <20250409-container-of-mutness-v1-1-64f472b94534@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 9 Apr 2025 10:48:43 -0400
X-Gm-Features: ATxdqUFC-VpChO_A1OyOXTVwtBpWe4runp8t2SxRqzsNxltH0wOFvEYcx4OFsy8
Message-ID: <CAJ-ks9mVs6+S6pgz9JEUWTjLNKuRzm45fWP4b+2kbUEeDY4pYQ@mail.gmail.com>
Subject: Re: [PATCH] rust: retain pointer mut-ness in `container_of!`
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 10:43=E2=80=AFAM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Avoid casting the input pointer to `*const _`, allowing the output
> pointer to be `*mut` if the input is `*mut`. This allows a number of
> `*const` to `*mut` conversions to be removed at the cost of slightly
> worse ergonomics when the macro is used with a reference rather than a
> pointer; the only example of this was in the macro's own doctest.
>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> This patch is extracted from 3 other series to reduce duplication.

Oops, forgot to include

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

from https://lore.kernel.org/all/87semhbncg.fsf@kernel.org/. I hope
this is proper form!
