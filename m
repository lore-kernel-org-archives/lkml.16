Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5CE1F418F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750061049; cv=none; b=HxWzq44ZEQ/Zp3/L2fD92tCDiLTYR7x03RN9N01vizSq9r3wKE8dLrFy1YfEadoqKyeq3CXB3ZopZg8+NWRcDEIy/Tk6ckAEI4CSYwKiZ2OkvuJk8UoK5wmt6VRt1/rXNh4V9I/4qjp1Zm6WBblxWRBMV2wXIScxQwjBEtwpF2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750061049; c=relaxed/simple;
	bh=f1PYGjMBDRYf08ilo6nO6r65U87ulrrDAGAp9xwJARk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDc+x6mCWLSScDkdNEHewBvviP/4HMuzYvb+1qG8wbl4X6VcLIMdThS9rgEA1TBVtIxB0yWXAcXihXn0R3MHuD2FyDD0skoetbOfhVKMXwp5GU37Pbs86c2jENpB8HBV2Znn9RgEUAEcwQNhKUXDPyMWp9rYxMEimHVEXsTABvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z56rYfB/; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z56rYfB/"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso2780352f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 01:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750061046; x=1750665846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1PYGjMBDRYf08ilo6nO6r65U87ulrrDAGAp9xwJARk=;
        b=Z56rYfB/6DT74qaitagzv+993Q7uW7YWuqJ3iBr36WuY0NU+vutvNNc8Z6Mptbt5Th
         6Q7n9WEuxpJ7vs+DvI66CwGFvYiUFLNhdhDxI1fY0H7jzjB66KHO6h/1mx25/XrYULrm
         7NgvLqjxQx3hPxg4dlMS85JgljMIIPXZeHC8hDUHh9G9jazgHPAkioikTVh1FBnfSiV9
         4BkPWMHF8wPlWKhRRP/C0Bkp/6RytYTB4I59QI0MD9msz37BtNQOuP+kwo5yjTHAHBBq
         17tSItj17hu/Agc3XSrAUdc+8Q3mWv3y1RU6g1F2Le9fCkyOpEJ93rSZx4oD6W6gaGnD
         L5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750061046; x=1750665846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1PYGjMBDRYf08ilo6nO6r65U87ulrrDAGAp9xwJARk=;
        b=uCIGgqVgwxUaXRXQCJwn3Za00DHgO7z1kibrD0q/C3TqVb4IuXFf9ULFsF+ukOzzQJ
         2vqyvMeQT1Qs06QjN30fOolZuKYkw+Oe3YpOvKaQyEkGtziFGPgLrJq9YPH6OSs6IEOZ
         Vf2qC87LoKyBR2AsxJN8DelePnRf0ChJVJZ3bxWKw3XgtAfWJbDDkZc3DlpPW2ynwMJK
         sGIi9qLjt+IUciMk5ZyPP6u0XHU4xSSZoyAn7/i/bYyXOg7zDnksQVhsKAET5pq7005I
         C0zFpuQhi5bjzp7HWdcIRcAfjofE2JrPguMOBDgm6KuEYrT+mwPoKTWuCOkR8NN1XKiW
         q0CA==
X-Forwarded-Encrypted: i=1; AJvYcCWsE8re1+Fg+JY1kUOyGiwqIsYs8bk1OnWOgwulLNFmHyut58WdqMAuen1ZxVEwFGd8wk59vpYcA/Ra5LE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7uySv99nC1eStt5OorhGfF8PRD6P75RpL3BuZMYpHcrrWowzn
	vCIXAwKWw5xnkpcBKf2Mm1KA8opkRIR8NBxSdJjnN+5pLYFw5qOmH5r54/s5ZIFvz7jrQMiwiCs
	Wo7zwchfKJLe5cTVYqSFOeO1Yg7XwRjYluFWylu+U
X-Gm-Gg: ASbGncuxYkO1nH6I7nuM58urRl1HBmheX9QvYXlbmVnpqjIY/T6T/6+Oryf+QBpZIrO
	k1CM7ROUzr2iep/tymON2EPyrCTkaMjf/PPGu4Z3fqyHpPn45rIrnhOmGLSbY8be1qpjXG9VMrn
	GfwFCPJPhe17rOLw+QstVNPRdR+pyxYwsqljpQEm941zfLpoKaxEovpYw=
X-Google-Smtp-Source: AGHT+IFJNYnGY++zKK9ezz4GBc7LrhfZRQuFSNzgJFJ9/LkEAc06KUhMt33Oo5LPfwTK3+h2aideyFG6HmImWi9Q2XQ=
X-Received: by 2002:a5d:5846:0:b0:3a4:eef5:dece with SMTP id
 ffacd0b85a97d-3a5723a3729mr6989355f8f.35.1750061045848; Mon, 16 Jun 2025
 01:04:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514105734.3898411-1-andrewjballance@gmail.com>
In-Reply-To: <20250514105734.3898411-1-andrewjballance@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 16 Jun 2025 10:03:53 +0200
X-Gm-Features: AX0GCFuzgZ7WEl16NbBTVWyiSxMdvM6mQ36bWXoU4zjT-XrCROgztLnIerofDY4
Message-ID: <CAH5fLgjgtLQMaAZxufttzoVCJpAfTifn6VWwKZ7Q6vAOOvG+ug@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] rust: add support for port io
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: dakr@kernel.org, a.hindborg@kernel.org, airlied@gmail.com, 
	akpm@linux-foundation.org, alex.gaynor@gmail.com, 
	andriy.shevchenko@linux.intel.com, arnd@arndb.de, benno.lossin@proton.me, 
	bhelgaas@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	daniel.almeida@collabora.com, fujita.tomonori@gmail.com, gary@garyguo.net, 
	gregkh@linuxfoundation.org, kwilczynski@kernel.org, me@kloenk.dev, 
	ojeda@kernel.org, raag.jadav@intel.com, rafael@kernel.org, simona@ffwll.ch, 
	tmgross@umich.edu, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 12:58=E2=80=AFPM Andrew Ballance
<andrewjballance@gmail.com> wrote:
>
> currently the rust `Io` type maps to the c read{b, w, l, q}/write{b, w, l=
, q}
> functions and have no support for port io. this can be a problem for pci:=
:Bar
> because the pointer returned by pci_iomap can be either PIO or MMIO [0].
>
> this patch series splits the `Io` type into `Io`, and `MMIo`. `Io` can be
> used to access PIO or MMIO. `MMIo` can only access memory mapped IO but
> might, depending on the arch, be faster than `Io`. and updates pci::Bar,
> so that it is generic over Io and, a user can optionally give a compile
> time hint about the type of io.
>
> Link: https://docs.kernel.org/6.11/driver-api/pci/pci.html#c.pci_iomap [0=
]

This series seems to try and solve parts of the same problems as
Daniel's patchset:
https://lore.kernel.org/rust-for-linux/20250603-topics-tyr-platform_iomem-v=
9-0-a27e04157e3e@collabora.com/#r

We should probably align these two patchsets so that they do not add
incompatible abstractions for the same thing.

Alice
