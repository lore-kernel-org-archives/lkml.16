Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842D3322A;
	Sun, 15 Jun 2025 13:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749994367; cv=none; b=I5pFmlxgWAKVdutjQXDbKaME1LqKCfyiBixdTmvQqvf5pTrq5kWkIxwCTNhkxgkrBhBmlH4H3U929HeEAmbnBNlgP41TPuZ3kVQHWPahIwKy/idFdWZeqD2sz6VGNo5QRGkV30dpUiOdpda6fSR1NIoh9HZCw9hZjYxEgOT4akc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749994367; c=relaxed/simple;
	bh=ns2hetet2lZIEoOavbFmYYaxX1zNi+uMFtiMyq8f3yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2mrwURtn8pejvUap/JPkjuxPICNQHSMylCoGgG2Yw/eS/qjrwSdIYuHV8lFKCLFIPyHHvvo94CU0INJgA5V8ZmekF4xkyShf/qXmQIMYEB6koi43+HKAS8p1ZvS3JPAQNT8/uWsvKRadIM04nIa+cTyzlPneHH6E4eu4BT2RlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kz1NK8Kd; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kz1NK8Kd"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-313756c602fso545209a91.3;
        Sun, 15 Jun 2025 06:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749994366; x=1750599166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6biztJOYDaIMr4ggV0+B+qehBU/oHbwf4HAdJFN2AM=;
        b=Kz1NK8KdZ3hMWprc3o2sHTRugtHyEyy6lhbb/eNfKf/ov9c8SLfEDX+aMEOB5MohvH
         whVse2Toq9vNcP+T04gruM8m6H1a3EN5oHRtnW3lDyO/G9qrGjz+2nvh6toYY+uZsZxN
         iGVSyIt5S6BZQILG5Ae4MV32BrRvYUpimYqUSFAZO18SNL3TboOgCrJV2KAwev8LNTGS
         1xYAjn9/oHovhoSI+/y6o4UidNXh8NNkSFAXZsZ4xhwes+arKuuHBGR9k0eiUJCyhiKX
         D83tSDNQpdWARDbvjN1hpfWdqsFqpIG1nV7x1Ts3Cax32J16hZApqFNyLlZQMj+UHrC/
         lx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749994366; x=1750599166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6biztJOYDaIMr4ggV0+B+qehBU/oHbwf4HAdJFN2AM=;
        b=Gdn+OSVgy4bQU/auLt59or+o3iNz9RPGxiKG3lsEIRfO53vNUCODH1p4FWZGeSu6Mk
         2Rq2f+BP/upcJPL24iUvcOr7vXYHkxdtZjfklOJifvitbsc8s9xtle/xDRjZ2LPWMTnk
         DWJtCAo7i0MAx55Vlqc2y9mxQ5O7o5DTMmOuHWIm/egBjdunGMvFNbQRnZSLIMs5MsMX
         RDuxD3AKCVMnBj4vqrgHuDBQzX4XxOD0bf+KZ9E8NOvtPNYi4/ZsdRU48YFbRn1/RXXe
         8Pwn4olwx5YMLedL+MAC4CuTMYfht7SXclzGfgLyogtHYGBYvpeO7ewaBGNFns7rbkMk
         7JzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8ZIHqLR7NdS+1JPEhYRjZgUJEdpC2orWgmK5Tpwx0AiyXtoGkV7myjxhbrwq+v3UYB/ceAWOVB0hEMfY=@vger.kernel.org, AJvYcCVatjMJ2KQ6WQrBGzsW2v9oDTY8CPI9VYBGw3sYbjndzgHz2mnknd06CdXhKP4H+B652uoNpBJaEjb8hHSikpg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVzhVnNegD/pWSPsY2FaBo5VpkrqIfdiyXlGGHGeb2zAifguuV
	8oqirwOSbHcYgMuR03xrGthXX68XXvoHiIHgFIS5whp3fws1Ui7rtIV6ku2KXiN1RzS0pF6iuus
	qGt0NgwQwv1/ailT2ypovM+Q0z/jMqEo=
X-Gm-Gg: ASbGncuGgv+Fk1DsMVxSWnrGC/gsz2C/RgZ7kKlJSlLA1xkpEqXP7ADc7nq8RSD9Y+1
	bZpvH5HXYxDJe4x9RZvUYAN5n+OfeWUSxfIu1ZIXG0uCJpKvcNTQdBe5GB/gVaTUSNeuIw4WtH2
	5Kzins2ic7oeN//zLltIGA+0siMvOnnbjXbxnJPKxm37BgxcSVW/4EWA==
X-Google-Smtp-Source: AGHT+IHQPepWr0PbwjEpszbly3f9S7PyiIfm9U5H1qbjy7Mjf/JI6jI8cAihWSLXmT4Yher59wp77PQ5KCOkUqJ5pgE=
X-Received: by 2002:a17:90a:d890:b0:311:c5d9:2c8b with SMTP id
 98e67ed59e1d1-313f1da5571mr3359079a91.5.1749994365766; Sun, 15 Jun 2025
 06:32:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com> <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
In-Reply-To: <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Jun 2025 15:32:33 +0200
X-Gm-Features: AX0GCFtDT2rLIdlNco-7aTZNeN4QdhHpMIapjyRZrHTOhSvmbikJIdVociuqbmg
Message-ID: <CANiq72nS5DR2NxLoba1w83=Qsqzi-gdK7Le=y7BxPxQP5U6Rmg@mail.gmail.com>
Subject: Re: [PATCH v5 04/23] rust: add new `num` module with `PowerOfTwo` type
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Benno Lossin <lossin@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 4:02=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> +                /// assert_eq!(PowerOfTwo::<u32>::try_new(16).unwrap().v=
alue(), 16);

By the way, we are trying to write examples close to normal kernel
code as possible, so could you please use `?` here instead of
`unwrap()`?

It is not a big deal, when within `assert`s, but there is value in not
showing any `unwrap()`s, and to spot easily places where we actually
do `unwrap()`.

Also, please use intra-doc links wherever they may work, e.g. I think
[`PowerOfTwo`] and [`None`] will work.

Thanks!

Cheers,
Miguel
