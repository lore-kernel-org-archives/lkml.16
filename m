Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E45A1ADC83;
	Tue,  8 Apr 2025 13:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120740; cv=none; b=azYps+gM/nWtvgFM/zViJaXbT8ZP3EOQ7yTItTq/nPc0/gfkkm+qJB2Z3uOVYQoG1wkZgUTBqO6gJQgusl/qLQfaHTsBjsssyKfltLF70a6uvJtoZ1IlSQ1Q7gn/ANmGTYBtuGi5jAZmiBJp2T42unjxcBJV21a5xUfxa8J4KBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120740; c=relaxed/simple;
	bh=nqRV9e4azt4cOTUpqzUrl9g3dIFNhs5erfq8eLDXEm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Coq9TYCrYRG9tq3JJ/1mQWUw/iDxE5Qc/CGjovPllVK+JhzgOLGpvydwEVZA3Q/PERGgRfpGN/KM/DEJIvHEgmkahb38wmA/4dCyHt2OIWxArQISUw3HZz2CbkQ8RKDF5y6SAnUrwYxyjG4ZLB6P+zdLM1h1KbsWBEI2JPdzKxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSpp0VBn; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSpp0VBn"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-301a6347494so882799a91.3;
        Tue, 08 Apr 2025 06:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744120737; x=1744725537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqozlFOZs3I+yiO6Du6yEZKYJaGOQca6xCGdVlT6bD4=;
        b=lSpp0VBn3vwEK2xh7KxPtx8cywWaR/LjANpXXpOIKpErLlFG92RJwZ5HFZp0X1/wNV
         6SktxOTIhO6rWHEui+/VAaDfBfa7r2+OEsvPf8l95qbyLlpegGHj2ywaO4zWT2d66P5H
         Qxbgu/bggr3oeTjUGY5gMK7shL4WLtf8jnq09syR0ldwK42I0n8N6hrE4Yz0Dyrm0n+6
         TBC8iOpkUfOoBPvqM6p5bKkECvP3BvLtMBz5mMMnoQF+VoTtyZoMyvpCcrDtwnho8YAV
         hppmL+z/wbha5Q+5qR/egfQnvAfIOLp7rEkORPXqSHnMduXdsSoJ6ta1LUCqxT3QSzI/
         frsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744120737; x=1744725537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqozlFOZs3I+yiO6Du6yEZKYJaGOQca6xCGdVlT6bD4=;
        b=eNPV3VAiIoNLGdD21hFLdH6JOKqlZe3gM0dBjHqFK/v+BERI2XJHxezYJZf6OULxRd
         PRG9aWVo9+tMLY5PixlZNHjYWLSIuaxxA5UqcINuT/RrAmVQMRclF8GOHSP2LR+G1/Y/
         hU34LDMkLrLHA3cvopJfmDbCZojjHNALoyO+hjr4UglHHHRMoa+9gx7j0rR/cE+Fcd5U
         H6/opz4zTi1lpuf6pn4gzc8AeqdCiuVOmb5nLcCC6xhbaoe9N9YDOb030GwLaptSFrc4
         UZA86Qws8Y59om+z5MaJoGfLYbrgJEqH/5/RfSXs+45W2fbXgOOk6y+IlInVyhkF8+tJ
         dwBA==
X-Forwarded-Encrypted: i=1; AJvYcCWB3/44hEtAD3z0B/9pa7dupTEBXPBWekOt5dAiOqKK8gWTDdwbemrotbIr3nsyGjq9WPjAS56lGqQrcVkOSOU=@vger.kernel.org, AJvYcCWDJvdfRd1Vhn90wGVZwCfAh0BqVOBfL2Lurb75MJtPcpD3KJr9raNZEOQS1VFzCRtKdA/u3hRlKrz0V20=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfkOSZOa9VNlNFmLZF7It4uMxs8iWXHVwndY7raYbjL+HmFyJB
	Xq503FO+pare5mLDJUt39wN0XhVpJDpFwic0tFzw+7G907vY2IYJVj3y0Uj24FIAD3UZEyZArKW
	F3rR52hCaf3rNWEmlI5iOjXQSJQk=
X-Gm-Gg: ASbGnctta+BQ03YeBElOpcuC0Lc9HpgE2DvyjgGgVD0QClMg3XMcCEox8bwQcmFxjrq
	y3luwoSwLOVDUHOX4MyeK48d61D1QY9CNDkrzAS8NS/lHl9sEeiQOokjKgKySyXF6Bd8OdxNGOI
	mJc0XTh+UjUYgYLKHU0rPDbsZ8Gg==
X-Google-Smtp-Source: AGHT+IHu9TJ9RuIlAMlfku6Ehl7CySmwT8+ED6PkGD1kOiaBXB834aPFTd0njc8rc6pp1gnWl3kJtBDGmwApo9Smh3E=
X-Received: by 2002:a17:90b:1d8b:b0:2ee:acea:9ec4 with SMTP id
 98e67ed59e1d1-306a48ff28amr8367635a91.3.1744120737152; Tue, 08 Apr 2025
 06:58:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-box_trait_objs-v1-1-58d8e78b0fb2@nvidia.com>
 <D916LG7Z9Q31.5RVNMYM38E2D@proton.me> <CANiq72k9Lo-M5v338iWWSiwrnU+JwP+aEZeLiR291xc2c+ESOg@mail.gmail.com>
 <D91ACTUAWQTF.2AZ98BUA5ZKJ6@nvidia.com>
In-Reply-To: <D91ACTUAWQTF.2AZ98BUA5ZKJ6@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Apr 2025 15:58:44 +0200
X-Gm-Features: ATxdqUGHIjHF3EckxIhFQF13LOWJp6gwb6VlJzlmImJ3vMLsWjYcukaJlL980R4
Message-ID: <CANiq72=f+0KBT3iOQnWyJ_Va==j5iEYpNE7WLU=0aALbQ8-beg@mail.gmail.com>
Subject: Re: [PATCH] rust: alloc: allow coercion from `Box<T>` to `Box<dyn U>`
 if T implements U
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Benno Lossin <benno.lossin@proton.me>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 3:19=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Apologies for that, I had no idea how to build using a specific
> toolchain and did the wrong thing, which is sending without proper
> testing.

No worries at all! It is completely normal :)

> I had some trouble finding how to 1) find out the minimum supported Rust
> version, and 2) how to build using a specific toolchain.

For 1), the minimum versions for tools the Linux kernel uses is documented =
at:

    https://docs.kernel.org/process/changes.html#current-minimal-requiremen=
ts

`min-tool-version.sh` is also fine, of course.

For 2), similarly, it works like for other tools: either you override
your binary in the `$PATH` (that is easy with Rust with the command
you mention or simply with `rustup default X`), or you provide other
binaries via e.g. `make RUSTC=3D...` like you would do with `make
CC=3D...`.

> I can send a patch against the Coding Guidelines adding a section to
> encourage testing against the minimum version and explain how to force a
> specific Rust version if you can confirm this would be helpful (and that
> min-tool-version.sh is the correct way to check the minimum supported
> Rust version).

So that sort of thing is supposed to be documented in the "Submit
Checklist Addendum" section of the "Maintainer Entry Profile" document
(`P:` field in `MAINTAINERS`) of a given subsystem, and in particular
for Rust is at:

    https://rust-for-linux.com/contributing#submit-checklist-addendum

I agree that linking from the Coding Guidelines or perhaps the root of
the Rust docs would probably help others to find it, since different
people go to different places when starting, so please feel free to
send a patch!

Cheers,
Miguel
