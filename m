Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315AC217659;
	Sat, 31 May 2025 10:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748686708; cv=none; b=UzQR/Uama3kMkHaGIFmFAeKR/46AXgh3oJ+JFCTKaVjOwhnZHdsbMR24DZt5RpVkWPfz8W3ONxc+mIqrx8Pi4qIIZuGu5Gnyr46yDHuRzbtA76VcdBqfYga6n8ZNZPGcEUmxAKoageBWPg92c4Vy8EK4ZeXyD0YD3/pJWq0RFd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748686708; c=relaxed/simple;
	bh=daIX+EyrWoEm7pabJxzyefxD7/8+85xoVsxKyfQTtvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W9Np7QMwkO7qgQrBntmz74+hEnW+cj5eaJ035OyTvL4jAlv8RzuaI+SEIIVngQFgtbbzAb0ZjP2FVB5oX0/L+r7IgojxZ3scvGt229j4s/pruvPyP+iVte/CMEcdwouEkoLL4ngmQpqGF0RFKBO+fKomNNUmaw4FMO9BPZaJcL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxadSmhs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxadSmhs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917EFC4CEEF;
	Sat, 31 May 2025 10:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748686707;
	bh=daIX+EyrWoEm7pabJxzyefxD7/8+85xoVsxKyfQTtvo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YxadSmhsD/zt76/KXh1eWR3bEx4GbAt8oJ5BaxTtrlT0vL0yBv/BfDNpaupr/Gcvk
	 Qx2ndLLpsghBjYjwcI7PaxZeTIeC5Y+Hwbsm1dkDJjAz5F184zGudBvT4WaYRzr5o4
	 h7dMmz5rEf8vaKSlEPquofHKLcCgNR4B8d4sA8SRSovXTBcRniQw/ArT/xp9PybZU4
	 SEtzl1EqklJBjSenKUc+BXmjLnG/qAURLI1mK1C1LYXGl3fLKVocyUpcPCNli0RR+E
	 u0Po57BsfdR6TodlNFHjCp7ApLlLqu2tLKD9vH0hBl1mi63O55GjyvYFbb6XO24ExL
	 pbeEJj8ttu5/g==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-adb2e9fd208so383580066b.3;
        Sat, 31 May 2025 03:18:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYQjEwpSPcK9kiX9U9ImphNI4+t+rktwhGtd2xPduZZGxR4tNCczbfkxBTnbj3iEvtT5Qn46jeiSWwsPox9ys=@vger.kernel.org, AJvYcCWuCCvH4Bot4islkplmdGjglOiNLtfG0JcyRom2+QhFUpG6slYWTuJh1hTXRmlQifP1N/8ACcxB6ERdfzg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6cb0/wXBbrX4Y4YyEXsSxnR4NlzLTB6BmkiJgDDl1DK22MvgX
	iN+MoTNlmf0k1XO2cwyMMiZ8mr+ysGrlCmoBh6UTEkeRF3AaSNiNS2Fu11aEm4+dduyIcrwaQoa
	UiU9yINdAweCzUwIu5WOLZp3ld2+uStY=
X-Google-Smtp-Source: AGHT+IEDJqOa2yWDEGr2DGCbNEd8wT2szHYPbuYQA9ij+vJStx/hpNc2NyVeB01f0MjTWoT2l+lkdD0prsajJVJcqBg=
X-Received: by 2002:a17:906:6a0a:b0:ad5:3a97:8438 with SMTP id
 a640c23a62f3a-adb3242e81fmr633622966b.41.1748686706194; Sat, 31 May 2025
 03:18:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <D9Y0VJKOAQAY.2GJSAZ5II54VV@nvidia.com> <DA8G3G918FS4.X8D7PQMT4TGB@nvidia.com>
 <2025052932-pyramid-unvisited-68f7@gregkh> <DA935OIFBM1H.3CMSHQ46LLG4P@nvidia.com>
 <2025053047-theology-unsaid-d6ac@gregkh> <DA9AU3OBT29Z.3CX827C91I3IH@nvidia.com>
 <2025053050-maggot-landfall-d5eb@gregkh> <DA9KIGDH4IF6.2T383ZVLTJN0G@nvidia.com>
 <2025053039-reselect-thinness-e0a2@gregkh> <CAOZdJXVvmDro0Mv36grqQ6LB_1O5GzwPx+Dde+wsfu9Cu_me7A@mail.gmail.com>
 <2025053148-gore-badass-1d1d@gregkh>
In-Reply-To: <2025053148-gore-badass-1d1d@gregkh>
From: Timur Tabi <timur@kernel.org>
Date: Sat, 31 May 2025 05:17:48 -0500
X-Gmail-Original-Message-ID: <CAOZdJXVSByiwGWusdajdTVma2aC3ibZtSz9XBpRy4MJrKuxfvw@mail.gmail.com>
X-Gm-Features: AX0GCFtUnO02snDc3OeKtKk-Mq0kTX0pe2-dVmvg0hBjLU_PXHFDLIwi0m9MQo8
Message-ID: <CAOZdJXVSByiwGWusdajdTVma2aC3ibZtSz9XBpRy4MJrKuxfvw@mail.gmail.com>
Subject: Re: [PATCH] rust: add basic ELF sections parser
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Timur Tabi <timur@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Timur Tabi <ttabi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 12:45=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:

> > IMHO, Nova should really do what Nouveau does, and just have the image
> > parser in the driver itself, without any generic Rust code to do it.
> > After all, what Nova needs to do with these images is driver-specific.
>
> Again, no, do not do any firmware image parsing in the kernel please
> unless you can prove exactly why it MUST be done there.

Nouveau is already doing all this, just in C.  This entire argument is
over a 12-line function:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c#n1824

Nouveau needs to do this in kernel space because, once it finds the
appropriate section in the ELF image, it reads a hardware register to
determine how to patch it:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/gpu/drm/nouveau/nvkm/falcon/gm200.c#n342

Since this hardware register cannot be read in user-space, this needs
to be done in the kernel.

Please note that there other drivers in Linux that iterate over ELF
sections in order to parse their firmware images:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/gpu/drm/imagination/pvr_fw_util.c#n29
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c#n925
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/remoteproc/qcom_q6v5_mss.c#n1374
