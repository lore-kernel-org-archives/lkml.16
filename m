Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAC682D91;
	Sun,  6 Apr 2025 14:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743951586; cv=none; b=Q++oeGLJ+xU4spiNXM35rcDMD8/SOgwuSckIgDWVFFr7BfVhepvbKRNdFm3S5xPjdZUly6Qg1n2jeMarzsGnhkAjmm0oLzmMe3F6bpaw5lKXNrWWK3GvCMWd99GuWDu+/0Ckg7vxEK+CO9NR7CvTYmymhts2uP0DKybQ7Unyssw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743951586; c=relaxed/simple;
	bh=l4AYfPfBk9zTJMzkXIASpVeTyT+zxGG6okAiETyO3ds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eRtzRunfGgUDrt1qDvnOK7xMmtCrFHTITL/fp5ak0dyIeLX+5S+uYC4o5HBxoOMsYIFgDUd7B6502IFf9k+V8exGRFK8LhOsS30ph4H8u+uVlh/6W/wxXb3D6NAKkkFyrtE3d6wMZSRGXu/DBl5TXt8CIAXWG2M2W89FDGsEm04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kk34TD7K; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kk34TD7K"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff53b26af2so782057a91.0;
        Sun, 06 Apr 2025 07:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743951584; x=1744556384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4AYfPfBk9zTJMzkXIASpVeTyT+zxGG6okAiETyO3ds=;
        b=Kk34TD7KMrfz7rjYQt3jZ0uhav5jakJ0AADxRpjHrhdlTg5+UnK6Zya/NSvBvn60bx
         88NHLRMHBQDJLxPM3V4e/fxK+4dnmaL1sepR2GY9sWEBIaw3C3OXT0qHITWdg9QluPzq
         uw6XKPEc8TCvsCWbZvyY7XHIJW6Vr78snY3q6NKF9B1Sh1MAk8Ewc8AT1ZTh2PquMke3
         565nONjr5gnALVwwEfK4y/gCt3dVC5CeOY30Vqpu6DcfPWIv5nDkGCtrk85R6zTm1/j7
         R/lIUvF79+gqfSxV3iM2yOCUAvJIh0vK3Nx/UDUJxtsuY3o9Yj9lioFKa9lpktKMyUSM
         8HEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743951584; x=1744556384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4AYfPfBk9zTJMzkXIASpVeTyT+zxGG6okAiETyO3ds=;
        b=VPRd3noYqQe4P/IvACkjnzaKez8geInv4XTQIxuKycFXgE0XhVzQFShJ8YQuof2lEc
         WlfwajvG788+blW5ElSl17e91DQXG3KzMp1i+2qTWD9VxjvsDlAuMffFStiV7onlOyC9
         rT1tZgNE87qsDo0u3rleelcZoHiy6QwIjikJJVBh+BqcNJeA4sf1FPbKkPBDOWmwlLVb
         8+G6NRYiZryY0HKs2iVW/Ylx6sK2GfqFCJgkGtQlgxviOZBEsKMAHTK5iG5ED8VAfrKq
         CpmhKswLSziiA7M6TsSrxvR4JLRQt7lzGoArlx98KZg2y9XkfEUxnkRni8C6xf2W7xDn
         OmjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsHTMLsFrpPf7nkkNizkmKjQq9BN/k7GCoFhOFqJ58vHOrCiDWjFCG+r1SpdoTbO6Heha3ErAYLxO9h6Tg@vger.kernel.org, AJvYcCV+4fkT3lPYHVkMGOgljcnBRdVYCxzNPPts3PWBz9qFGsgSXFStzqaAP+dcT4hX7XBxBZUsp9WVMIEU7XWNxgc=@vger.kernel.org, AJvYcCXj5/Xy0+Nz3QNO/BFaJVnNLFfHnW0l1EVPWulbKLBJ6YDJUWj0/R5nre4PKvxjRd8YEa2rgKnx78g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVzzU28ADCZIxh4lMhalpU782U3xSkV4qIWY+/7wEk0EHfYHJg
	KgKJDkNsGfucFTWLPXvAMHRtpTvPqpcTLJ/SgoeU8VvWZDEurubrEJVmvFzVg3MM4mPTodUoUeE
	eKAfzJCoAyY/6gJWJcVke9/bEyZY=
X-Gm-Gg: ASbGncuObaF0TiGw4I/GL3R2QGj3d7AzaDuWDY+1+g/JUs6zn8IgympALXA3OkLQSa0
	2Pfx/AOufSoW+itwK52Tg0EsahqY1ybQC4LBFQcVLKfzEGZAQdjhm/okLWF6aW7rnApHC0fQ+s1
	mCiqHPJ5BNtr5nQ448K8xHJrD3Lg==
X-Google-Smtp-Source: AGHT+IH5rCiPhIg7gwHdGRFhgHEdj+0/rNY1KcOFwL6CUCGIWbnt6CWYfvihYXH/4uMJu+kL6nfNE4lM+6NhLbLBkRs=
X-Received: by 2002:a17:90b:1c8d:b0:301:1c11:aa7a with SMTP id
 98e67ed59e1d1-306a4975b3cmr4936976a91.3.1743951584024; Sun, 06 Apr 2025
 07:59:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
 <a83b0149-7055-411b-ba86-d227919c7c32@app.fastmail.com> <f8b59f05-55b5-4208-8bdf-b4be8e93bc22@gmail.com>
 <65da77f7-bbd4-4cbe-a06c-75f10a6ec4ce@lunn.ch> <CANiq72n7UhQEh9TJU7UNBv2t0ZR_rNO3dqbVZ2cwr99u5SOVeg@mail.gmail.com>
 <CAH5fLgi05p6KTN2v=+jy4HoK-oC9pg7dYBuc8wvfx_uN6SVjOg@mail.gmail.com>
In-Reply-To: <CAH5fLgi05p6KTN2v=+jy4HoK-oC9pg7dYBuc8wvfx_uN6SVjOg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Apr 2025 16:59:31 +0200
X-Gm-Features: ATxdqUE5gEnNse6uY-AZHWqKohnH4VmIJRHm0QYcjedq6yj9Yid-btTa1YlP2NU
Message-ID: <CANiq72kXO8F4cMjjyETMoRzNjd0qkc41qBGR=ex1W+_C_3fLfQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Rudraksha Gupta <guptarud@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Geert Stappers <stappers@stappers.nl>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Sven Van Asbroeck <thesven73@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 2:15=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> Seems like we already have a warning for it:

Yeah, that is the "just Clippy" part, but other forms could perhaps do
more, e.g. imply `no_fp_fmt_parse` (in a stable way) and remove other
bits that may not be needed.

Cheers,
Miguel
