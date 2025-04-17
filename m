Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E0B2505AB;
	Thu, 17 Apr 2025 13:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744895498; cv=none; b=YqVHwosIBzkHkNlzY7rqDBYPVVx+0jf2PGSl2ZdMgqygoJuHRYvq0zfzTz/9iYN0z+S5iAg0o6laRhvnts7dpdKIUuRILYLy1a1kQecFwtwIqXdc/1qdAiLKS2sXE8E8G88gc6TOgzeMUq8hSaIEElhv1+vRF4DW8WgjMBrXuak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744895498; c=relaxed/simple;
	bh=4X9JnTAI/GyE+WrCD7M6AjmXRhXcs2xkjTMKl1cCXp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzpkK+TTsXHepqQswXuAo0jBYlikobmv4vR/U3eGbExokpGQXDsbVbU/TlE53SWgSLF2d4GVmUnrXTLkzHA4GEHlpLSuEUHFgmTbBoV5GdSAEV85e2ifwvtg5YtjoN3CXB8laDuLDal2pGOFbmI455z0TXn2fN1YKSkmJJPVafY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxt2vYSz; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxt2vYSz"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so826807e87.0;
        Thu, 17 Apr 2025 06:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744895494; x=1745500294; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QF7Dp6X8ieBc3pZxGWeUvA6FvMy1W80zY/wPJwvozk=;
        b=hxt2vYSzQ+wNhDv4WDDmn0isEFFH3uYdW5EZXjlsycWzDXo4+Go3LKLfN30yGE2JwO
         OW5r51z/ms7kwZgNA82u6Qw/AnPquBGU2+llFahET0OO2tzfdAPyRqydL0Se2qtGG/y/
         X8RDa8wnAmY+3nMb9lQEnOWU/jfWKMoydvnXf18Q59YpidHdenTLRkAvoQePJEXohxGK
         QZt9NF8rScU5fNn1btpEdH0C11MdZpfCpdnsnb0wC15L/UJg1Wrof3laAzUwsJW2d6MT
         pr6bAMry5TP/S9mmmhaT3T7bfWtuOkjxGZ4DxdMEIn8TNikgWog++AGE7Q40n4U/r253
         t+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744895494; x=1745500294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3QF7Dp6X8ieBc3pZxGWeUvA6FvMy1W80zY/wPJwvozk=;
        b=myRNtnr+f9/QU3UwJM3MRxMubL4gVE8yaUu6og0P0ijKbYW2LI7olPhfGda0YdZBsf
         9ju84tGBvnvUmkfgQeULUO4SgJ4QgE8rvVTs4GoMOR2JZkel4T2aj2putPmTBBP0Y7+u
         ym25bmSXCX5hhKnP3stzs+MCls0HA0GV2LNvExpCTUNNT4ZbJ6OuauZwGr0h34fijO/Q
         HJWOdAwBk4Mm98vS6kVwo0zHrZyzheFFkgNshCCBWJc14Jo38FW2sxgqj/jWE+xIM3aN
         bWq5n9sxR/5Il0dXC8X9uF67wxlgGFxoB1xnGhcV+We8SGLHc4lL7ozncTec8UyRT/Do
         VCJw==
X-Forwarded-Encrypted: i=1; AJvYcCX8xmmTCPFXf/OIJFIiw/loawEX3w5Z6i0Km1UioFz8ZmNW8JyZW3k7t7YlCOUO0737LEQV0rsRokLfiCEu1CY=@vger.kernel.org, AJvYcCXO2ViMrW3+9caI5KeL2VbNU+oXeVSUlefszX1yTCFvW3RBjcUaaUVYtpoATY14BSf1Dz5RKy33xwN69yw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLstFYYiAqAYYCvuhK+omlc2N8U+uZIPf0wVuUMRK9+jNdLozW
	+Y1c2hTVOXI/KqIRvobHUr/l2rn+sKBkbbcM9KJdbD2rb/AQpoQF6dzQUWWQqV6UlVZD9KiWkL9
	G57PMrAIQly8DIcGNi0PpSsVk/Sk=
X-Gm-Gg: ASbGncvqvaf0pc/XvOAoOTzp89AB/SaOvxZH0PlSSYyFdkHEMhnHQvNhMrLNQEQsluU
	hwRELYJEvxxnhD74UVbyoMDgbnJKmkALluO0yEzWfXiQTmm0EB9ZzXBKDpZdgsjs2Kw+I32bGs5
	OpFrxnOeFWWeR6pIbhEa6XH56nwSEmOLCv/D/tlwDlTO0PcHzQ2mc6cu9L
X-Google-Smtp-Source: AGHT+IEg6Tkrt1z6mWpBuG1QD4aL1yJp/PzIKF1/VJG0fE68oTzHjJ3oeY5SoSpP+mhBqI5tcZoSkoS8cb/nWFlunjE=
X-Received: by 2002:a05:6512:1193:b0:545:c33:4099 with SMTP id
 2adb3069b0e04-54d64aa9ed7mr1710095e87.27.1744895493833; Thu, 17 Apr 2025
 06:11:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com>
 <20250325-rust-analyzer-host-v5-12-385e7f1e1e23@gmail.com> <CALNs47sy7fcQoOaxQ0moyRt5TJOi4VWc8AxXHzPgouccPP4N7A@mail.gmail.com>
In-Reply-To: <CALNs47sy7fcQoOaxQ0moyRt5TJOi4VWc8AxXHzPgouccPP4N7A@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 17 Apr 2025 09:10:56 -0400
X-Gm-Features: ATxdqUGnslD3r8L4WdZKdM9anUhMGWAuu47yyWNybS59lcox0wWee6_SW9lupwY
Message-ID: <CAJ-ks9m=JZKrsSkuk8mefiAU5EroNMMkyKN5pkqNN1TYJSySFw@mail.gmail.com>
Subject: Re: [PATCH v5 12/13] scripts: generate_rust_analyzer.py: define scripts
To: Trevor Gross <tmgross@umich.edu>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 3:25=E2=80=AFAM Trevor Gross <tmgross@umich.edu> wr=
ote:
>
> On Tue, Mar 25, 2025 at 3:07=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > Generate rust-project.json entries for scripts written in Rust. This is
> > possible now that we have a definition for `std` built for the host.
> >
> > Use `str::rstrip` for consistency.
> >
> > Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Reviewed-by: Fiona Behrens <me@kloenk.dev>
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  scripts/generate_rust_analyzer.py | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
>
> > +    with open(scripts / "Makefile") as f:
> > +        makefile =3D f.read()
>
> Since we are using pathlib, this can be `makefile =3D (scripts /
> "Makefile").open().read()`

I assume you mean `makefile =3D (scripts / "Makefile").read_text()`;
`.open().read()` would leak a file descriptor.

>
> > +    for path in scripts.glob("*.rs"):
> > +        name =3D path.name.rstrip(".rs")
>
> `stem` should provide the file name without extension, so
>
>     name =3D path.stem
>
> > @@ -267,7 +281,7 @@ def generate_crates(
> >      for folder in extra_dirs:
> >          for path in folder.rglob("*.rs"):
> >              logging.info("Checking %s", path)
> > -            name =3D path.name.replace(".rs", "")
> > +            name =3D path.name.rstrip(".rs")
>
> The above applies here too.
>
> A couple of optional nits if you resend but nothing to block on:
>
> Reviewed-by: Trevor Gross <tmgross@umich.edu>
