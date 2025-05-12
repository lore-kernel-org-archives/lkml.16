Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C07254B10;
	Mon, 12 May 2025 20:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747081333; cv=none; b=ku4qBkq4BGRo8kVcOshS/yZ3dHXkHtvJvMW8KDhdhNHGAlAPFUD5FTswMW6oH61u/com6dEEYSc+BdMrDHDtWI2m1yrghJ7nhiU6ni6R1fKWBbD0fx0Jmpnq3WQruRI2kyms7fw3jpmQReZX6xnbL2rBQlHhvYkCTFZXJ8lUofI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747081333; c=relaxed/simple;
	bh=5bRfOC8qw9EaFyCMicYKywG8zkJ7M0MzUDgH/CpZfSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFLLXWui9i1X02vdoi6XDZAADRtbXZ7PrlAag5wxT5i29oFyeS6MOQuUAMFSVNAeGpahaHvZJj7Ztry1kAy0r2pR8HT1YErgoCct+V0turpgDZ0aToXiOw1ryo0LoOGMI0L0kwNQIGCuf8jgBQMefvWfm2bsvj6JHy2T49gckXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeA2YUO8; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeA2YUO8"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54d98aa5981so7821420e87.0;
        Mon, 12 May 2025 13:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747081330; x=1747686130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bRfOC8qw9EaFyCMicYKywG8zkJ7M0MzUDgH/CpZfSE=;
        b=YeA2YUO8ATzImiBITZ+/qWPrtZbbdJ2CHa+4fVi85KQqxGu4a7paG9WmTzd+PdQt4u
         SV9nIdzrhOLymhDVrI1tl2porptpZH6PvxS9CIzXYZbsaVin0W15l58vrOVRVNR637Ry
         C9dBC8rGNWI9StqSWbnFVEDLkfQ+elruy2pcn3k3Px8vwCu0j/uEEuOpf5FFNjjVwh2h
         Vmev9oTUx3B2nFn+cFZQFhZod9qlX/XpvMTXW6ZeL1a25ZZhX9kMSlmNP7y1MwWvhbRu
         nJN2dPFK+LWu1J7yR+xS16ZOxLIviA0ruYiRf+K7fGUj5DApJWlBvNzKW8qR31VxxpgZ
         2t4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747081330; x=1747686130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bRfOC8qw9EaFyCMicYKywG8zkJ7M0MzUDgH/CpZfSE=;
        b=phyev2UfBIWJZy4Dsmc01JSgDVCw+knAUpZhy34kkKbo20vlNcfb16nlt03r+nkt3p
         fPqsFicP538GMccKBQVLJW2IRv1vYwOhj6o+zv4dyJz6vYMRr3pBFCob8jV8BPdF+D9/
         qmGQGZDchrWJoyNY95YFU9NNnxXV0gKw1y6sw3B0DKjT6/EG2raDegesYmS+xrf1xejz
         Wg2M0FKWRm8yb+9am6oGOjPkP69N74/xbgc8/L8Px61rSdBstnPtUCurKOBDjAwKBhnr
         8WAjPYEYZb+/1NNv8zCZKjS06aIQP7UqonuZG95tFSNYAsX9vyrjU6/hZIVHP94JfV7V
         QsAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqJAOd0Lp7+G+h041hbziaT/PTEgpsTDKi7joQT9SxMZ2MZcg9ebGKyVN1yjJfE+jtAz+BzQsaMdG8bkM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfnyzw2PTO9myeXM/FVWljJywEerYg/Pp0+kzEWAj2sp7zFXtp
	ITwWSDy8ROSt72+KTXnruXPhtZ1ZK/aeX/JZlZTanVu+fuuR8S02bUMGFWXcC+z73weN9ZwMHux
	VxbA8A4Kcr82H/HHdOmnk76Iklvg=
X-Gm-Gg: ASbGncvrdvh2vMiBZKk7/PpDp3n3Z3IpCZ+o8WrHKUJ4DANQnG0aPgEzypMp4DpeoMw
	V/yY/lE23Vfa4ZqvEJ+v6eOSbzhuPknpdzwVtGFPFsHKDrF0SNqHbOsq58tOnhz9wFaqQzSbjHh
	OLJDeq5dFeAarhymfbuODXvxz5i9115bc52/NHC3a7ZM39mbxX5stWiGyng1mqEM9big==
X-Google-Smtp-Source: AGHT+IHVOZLfNTqG5khyeZaIiHU5X9sJDpYlcFCps92yq1QTfbM/Q5EhvFwX6oWPB9KdYCFUfZQKqTLmZc/xe/62emM=
X-Received: by 2002:a05:651c:549:b0:30b:ecfc:78c6 with SMTP id
 38308e7fff4ca-326c4550394mr56820551fa.1.1747081329551; Mon, 12 May 2025
 13:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-rust-remove-compiler-builtins-deps-v1-1-4fda4f187190@gmail.com>
 <CAJ-ks9m+5WSCbe=Lt=HXYeuV9pWtRx-rOhi8V57=A7Y-4U7LZA@mail.gmail.com>
In-Reply-To: <CAJ-ks9m+5WSCbe=Lt=HXYeuV9pWtRx-rOhi8V57=A7Y-4U7LZA@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 12 May 2025 16:21:33 -0400
X-Gm-Features: AX0GCFv8bIKQb8Ew589Xo0KchX1d_PayR4s6dt8CFSprG9iqu9r13Mllq7UGJ_w
Message-ID: <CAJ-ks9m=OiqFXWDoQA+WAuTvASXWZwi+YcxHsihrgYHzpFS1CA@mail.gmail.com>
Subject: Re: [PATCH] rust: remove spurious compiler_builtins dependents
To: Miguel Ojeda <ojeda@kernel.org>, Lukas Fischer <kernel@o1oo11oo.de>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 6:40=E2=80=AFAM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Tue, Apr 8, 2025 at 2:52=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
> >
> > The dependency on `compiler_builtins.o` was first added in commit
> > 2f7ab1267dc9 ("Kbuild: add Rust support") to `alloc` which matches the
> > standard library[0] but was copied to other targets in:
> > - commit ecaa6ddff2fd ("rust: add `build_error` crate")
> > - commit d072acda4862 ("rust: use custom FFI integer types")
> > - commit 4e1746656839 ("rust: uapi: Add UAPI crate")
> > - commit d7659acca7a3 ("rust: add pin-init crate build infrastructure")
> >
> > The alloc crate was removed in commit 392e34b6bc22 ("kbuild: rust:
> > remove the `alloc` crate and `GlobalAlloc`"). As fas as I can tell none
> > of the other dependencies are required; it is only required that
> > compiler_builtins be linked into the rust-enabled kernel. In the
> > standard library, compiler_builtins is a dependency of std[1].
> >
> > Remove these dependency edges. Add a dependency edge from
> > `compiler_builtins` to `core` to `scripts/generate_rust_analyzer.py` to
> > match `rust/Makefile`. This has been incorrect since commit 8c4555ccc55=
c
> > ("scripts: add `generate_rust_analyzer.py`")
> >
> > Link: https://github.com/rust-lang/rust/blob/f820b75feef00654924c9351a2=
faca8d34818339/library/alloc/Cargo.toml#L19 [0]
> > Link: https://github.com/rust-lang/rust/blob/f820b75feef00654924c9351a2=
faca8d34818339/library/std/Cargo.toml#L21 [1]
> > Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-Gener=
al/topic/rust-analyzer.20improvements/near/510200959
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> @Miguel do you have opinions on this?

Gentle ping.
