Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF44225A47;
	Wed,  2 Jul 2025 07:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751442767; cv=none; b=cZQlGFHt5ks5o5Tt8Aq8Mf3AtfeANxyScS6D81yZiw3xIT34bUp+aEDxIAkgYW+FNPh//VU55QV2OrsdS2jHCpq8PTSHowSZP0iKEikCcb0fK1N+5srKX69vq3+txcoDCQ01Getyu5p/sTA9aPsi/G4qm6blWBmtQiJiRubxK0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751442767; c=relaxed/simple;
	bh=TSZqcAZ4Tg7ebWwY0wAEGXMf80+FJlgSnej2MOlmEY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pglrSPZKljwwgQAjPV8OKJtBdGFHoH1wAtR8XsFe+d55opcpni2lM9+Suoe5tpu3dXfjj2GCP9mpNPumeWvk/x4PvJhVIAJPUGiIIzt0tC7WyRGvXvBGRsOATx1qXkUugsYCm3reZGD3kPn6zMB/DX6Y8gJp405IFlBW1BexF5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hC32VTMR; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hC32VTMR"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-312a806f002so773311a91.3;
        Wed, 02 Jul 2025 00:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751442766; x=1752047566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KA/109TsRFaW0BmhmmEYfEfe3Acd4UWLLhiWzpP4vPQ=;
        b=hC32VTMR4qAESRX3OQS5EK+C2MabU8c8D5PKiy/42YYe5/fcp0sYgV4E8AhppUUd1J
         58e52mzWp6HvymGsvnzvRsNI6QY5NWkwuNkxlTsJNpypYZyRJmR13WfbbjQGA4Lz7mIZ
         o4g+rVstbGGkmLorhpOZRmwFFPQqs3dsGwZnSJEQ5wKqofuLkMReDZfjr932Oy5ClyXj
         dF/jibhO1zDgwa+d2ogAgfvJHxgBPFI5CRTCJMGyp9jxG83wXxn9UUC114dvlDcxxsLQ
         Aq3rWeTIWvH0Tw0KryJ8HOj0trQm/wg/XSw7q1iJB4YAZuMKazTLKscI7dKNcDXrKPWe
         lFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751442766; x=1752047566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KA/109TsRFaW0BmhmmEYfEfe3Acd4UWLLhiWzpP4vPQ=;
        b=ajxmPvEsZ9UnuH0h9h0qD8KPznTgLr09+8j0awXUuC8vZSMi8sFjYv7nY7ovBc98dY
         pJ6SmKaj+vbIpPb9hrYCvpSzer5PjWquTf6d2crI5fpSdjd5yyK2/ReIY3KN/NOVtpwv
         IINVvTSbw8SW3ExQ/c3uMqoPJy+y24cx6Nbd7cwLAbrOfuFMMobRacK0calSMtGDt00P
         Jce9hXb93oMAkRFfFtwZp4ggkW5rOb4vIL0ufLB5ZZcNTzCeMKyKu+Anj7PRJ67YyRXE
         JPprC1NbhMmy6Swa1G0kfwlkGUlkNX5bUPu+7Y39Zi7V+5Rfv9xDi7PH3v0rrp82Wre3
         SFyw==
X-Forwarded-Encrypted: i=1; AJvYcCVnsB5wvRYWtY3O26wfiS5uLsFcc9n4e7fzpiwkINTFR0yIvzYwLy8JJMAeBzrAbZhUSN2OuId5nYPmRcA=@vger.kernel.org, AJvYcCVvMA2XIaKBCwnmWxLnDllNuNfkmN1DHdvPuki0qc+ruRxI7g7I4fejh4K2cdMlkHxJVfzdqRvCE327ZhyVwKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrffCHNAcI3uY8i97xPOuPbjRiaHgBDhj+15AEBF32bySt9Yd3
	3uQ6Swo6lWovw/+WcBWBkmRN7YAD0bS0KJuBA1kz6oiAeERrFqYQiNHhjXPAfE2hnsx/TDpbv5z
	PKPznwIKLwD2MT53+dPNm4PketCkxJio=
X-Gm-Gg: ASbGncv/wHO0Kt5xOTPR4xf9aSA7zs0N3gJU7fhMRkXILI19cw4KoMYV978lrEfmFEv
	a7ZEO1Xn4ox9AsjbQ7MtanJOF/+BVa+PBG+lUgdphXhuIX7ajSZ2gd4/tp1V/TD3ZqdwRrnjme7
	XVou49/aHXFQnJHYsmYtQmeNXHoqp4YCXRTmLKddY+meM=
X-Google-Smtp-Source: AGHT+IFVmPMwKuOe/k9MSEOIsEdeRgV0YIMqSPHExRICpwj8qUJ/DXKlAiXWYvySqYjOvnnn2njRlDX0SW91WLrsg9Q=
X-Received: by 2002:a17:90b:4c4d:b0:312:ec:411a with SMTP id
 98e67ed59e1d1-31a90c1076bmr1206288a91.3.1751442765904; Wed, 02 Jul 2025
 00:52:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701-topics-tyr-platform_iomem-v11-0-6cd5d5061151@collabora.com>
In-Reply-To: <20250701-topics-tyr-platform_iomem-v11-0-6cd5d5061151@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Jul 2025 09:52:33 +0200
X-Gm-Features: Ac12FXzq9tfBcRPeIMFtfwMNToDlgYwrtI-hw6IhYMWV_LH3OADew-Cany1x2T4
Message-ID: <CANiq72=QFyivcD9R8SfA7RXk0CNCtrL=UcDdAw9iLPL5qUfgOQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/4] rust: platform: add Io support
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Ying Huang <huang.ying.caritas@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 4:35=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Daniel Almeida (4):
>       rust: io: add resource abstraction
>       rust: io: mem: add a generic iomem abstraction
>       rust: platform: add resource accessors
>       rust: platform: allow ioremap of platform resources

I think Danilo needs these -- I left a couple nits I noticed in the first o=
ne:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

(By the way, this cover letter is all over the place -- it has two
diffstats/footers, no intro, and there is even a title in the middle
of it.)

Cheers,
Miguel
