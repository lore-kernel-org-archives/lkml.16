Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C449B223714
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747902918; cv=none; b=r/AkCwq+0nKweqIUlY1oiV0CdSWvgFmJkITgzG8kgTuu6n0k7ggjv4chH2bNHftbEKtHYZAhR7jrgdjqIiT04CIn9AdQc54GnXIu2entF0ka8yg1qK+/oEcTtdhj0wP9a7enLU2voigUAWle02NDaoQlGINHdRxCb211bVyVfpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747902918; c=relaxed/simple;
	bh=tYQxCGngj9fE9ouQsSmRNK4tfs6iy3G5wdKuIJ/e2mY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eJBWvTb8C33VsIxlISZlzu0yE1PJ7WSUEIHgfqobXkemhMIo46UoV6KtUyVS0/hTa58E/oEc0dOqVGpROGu6+80biEb7SqGXgLq8u3zqe5HdlBHfvtXGdtR4y5WT70j8NGnkPuSpyyCQAB3s0oDfbJ0zNffgQ87G1kFwTqfxsOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E5ucawpV; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E5ucawpV"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e290e4716fso1583057137.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 01:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747902914; x=1748507714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYQxCGngj9fE9ouQsSmRNK4tfs6iy3G5wdKuIJ/e2mY=;
        b=E5ucawpV9hBnKyhd0789oN4VmgEd7bl0AhuKwnzGxw0ebAWuLaYjBZWV6AiKQn24+C
         qRNgiYNZTRVWA03JTj6wMSV3t73L5cbMJ6JJMU/U/mocgg/ZRP//56uv6an+3e5FHEPn
         qefn/uQGgNswrUB7dAHq3HOb+oIVbs8BOM684c3Cvuv8NgVKcOmWhcwxAnGIqU+gUPHI
         Ez+IxySobmx0rGZktSrSH8XrJeYJU6R6fVV8qQRV6ZFH0mZButy6r7YVOP9QwuowEL6g
         HMMvMJJRV5XDhLJjesIB2gw3Phzx1wOuvP2hLulQ18Kwu9j+pjiqrhKjJH8TNpj7yE80
         62OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747902914; x=1748507714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYQxCGngj9fE9ouQsSmRNK4tfs6iy3G5wdKuIJ/e2mY=;
        b=fWld9npwCy0azANNSBwGQUUJOrvol795hiwcRoGGyWQJIKBB94pRoDkHDNscKBCNih
         3RwO1TXsINHfJi976h4hngEjXbbDEDWpD/KF89ROQBcKvzld/wr/e3ljmB10WjEn0tz1
         cDNvtnb5D4iYq2F05LC36wKmXwAL54ZAGz3f7OiGMHBQ9oqYXnYKhaBRIzEJXw2jVSjS
         ZsalkJ5ghuSF96321m8U9XVX6LEiMYKWf/bH3xEmHT8snMNIeV1qashvNkLrfJxPvdjt
         Xp8M6lqpZlXqLHGuYt5VqHPYwUUe9jlj4Rc1tV464pGnn4SnZVhPJs9DOdFsaA5f8Yx6
         F4dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRcnhprOTPACd4DVzU3Kh6ZjrHYNXJ8GKygAHFXlGZe5EosMDR9G2x7Q37/tKaF0mFdhSVHTm2SHh1AKU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2IndMT8rOz7lB49JFTfL8WXzwz+jTEkl5iVNVemPlNm/heGWH
	9W0ch6RHvnfyfOUTFTSOQVq17iaEP72z0QWNZPV8Zt24y22KAvoGOis2zH3/dNG/niVAJ3EW2+d
	P6nR/xsA0eE4ybLvAU1CSrNdhAoZuboQmTsGIwa15qg==
X-Gm-Gg: ASbGncsZ6d/rpSRzdhAAGUkY4raqiMlbydpKfI2gOedKeD6CAYAvENmvHhJrIBmvDZM
	fd1kebQ/ZduG+dw57odFuiPUxgYPmiTJwu/FUEa3IvOlI4MOav1x3dZ9yVcPhyahvlD6h9Rt94v
	1Et7ghfn6CrtK4ZfTavrqybNXOOWTGW5Lm14PaaXdmSvNY+XqAapzkBLeJXmvuYwLdSg==
X-Google-Smtp-Source: AGHT+IG1tufTo2laqv0iUxS628PFmp3liCtb2kVRmJ/1753thxyKZS6oUk0xxwo4pGk44af87cl//6xqqgtgt7qTqLs=
X-Received: by 2002:a05:6102:809b:b0:4cb:5d6c:9944 with SMTP id
 ada2fe7eead31-4dfa6ae1b10mr26679671137.3.1747902914500; Thu, 22 May 2025
 01:35:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-rust-mno-fdpic-arm-fix-v1-1-44e77fe6b2a1@gmail.com>
 <CANiq72nUFqM7mnpSGZF65n3Aak37KVVSa0d830o31EuZyh+OfA@mail.gmail.com>
 <d6515a2d-7986-4b53-a655-869d568d4081@gmail.com> <CANiq72nDCfoy2v-VbMR9ntNbTt=3JoYsVhz_gqX=Q=4iWN1YCw@mail.gmail.com>
In-Reply-To: <CANiq72nDCfoy2v-VbMR9ntNbTt=3JoYsVhz_gqX=Q=4iWN1YCw@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 22 May 2025 14:04:59 +0530
X-Gm-Features: AX0GCFsZ82FAe40c9-JDdkvEhHBvY185zJfCoLa6DZcQDwCQ-JxPg6n64Vcx6kw
Message-ID: <CA+G9fYtM-s0cgS39wX9Go_OAXxYa4nME6h8CbhyK_-QrRvQk5w@mail.gmail.com>
Subject: Re: [PATCH] arm: Fix rustgcc unknown argument '-mno-fdpic'
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Rudraksha Gupta <guptarud@gmail.com>, torvalds@linux-foundation.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Ben Wolsieffer <ben.wolsieffer@hefring.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christian Schrrefl <chrisi.schrefl@gmail.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, anders.roxell@linaro.org, 
	arnd@arndb.de, dan.carpenter@linaro.org, laura.nao@collabora.com, 
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev, 
	Nick Clifton <nickc@redhat.com>, Richard Earnshaw <richard.earnshaw@arm.com>, 
	Ramana Radhakrishnan <ramanara@nvidia.com>, Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 21 May 2025 at 19:37, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, May 21, 2025 at 3:57=E2=80=AFPM Rudraksha Gupta <guptarud@gmail.c=
om> wrote:
> >
> > This does, thanks! I'll drop this patch for now then and will assume
> > that Naresh will eventually send it. I was hoping to get this in by the
> > stable release that is set to happen during the weekend (doesn't excuse
> > my sloppiness though, sorry about that once again)
> >
> > Anyways, thanks for being patient with me as I learn. :)
>
> You're welcome! :)
>
> Let's see if Naresh says something; otherwise, I think it is OK to
> send it under your SoB after a few days (acknowledging the diff from
> Naresh).

[I was off and travelling]

Hi Miguel,

Please accept this patch from Rudraksha.

Acked-by: Naresh Kamboju <naresh.kamboju@linaro.org>

- Naresh

>
> Thanks!
>
> Cheers,
> Miguel
