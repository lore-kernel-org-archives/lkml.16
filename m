Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22B917BA3;
	Fri, 28 Mar 2025 09:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743152797; cv=none; b=JzSp6d8/lwEQ01icLcn5Duk5CgIvwr2g4kL1LXdlqSGAuzTUpYZRizXiL0g0K1GTJ44ffdLK/F6gdgd+ZCxnk8P/guitESlj48Drw7UfGe9r7bAZLWi3U2lN/SQylYdwgm5jvUOUpku9PVtrTaiXEM5xaLoQTEDxK1SVJ1Xsnnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743152797; c=relaxed/simple;
	bh=0bBzDSKbEvvFa69CxhVUVwtBwFVzp9lyfRZu0hRQ/TQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UkLRk0USdxuHlqzFY6qGbWpOQmYpi7+zxt1axDsbqHERhIFZOCJstcB5sqZfoNwU8wPsTe5hH1o2Abyej739ImqaLxKKsbpdCOU1pmN+Iq8BeunvfQUGGljRAPtrDiE39039YXWkIY++JRMcKMwbc4anREMQyEXV2vTCoYbAhlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OebNbKYy; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OebNbKYy"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff53b26af2so437584a91.0;
        Fri, 28 Mar 2025 02:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743152795; x=1743757595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bBzDSKbEvvFa69CxhVUVwtBwFVzp9lyfRZu0hRQ/TQ=;
        b=OebNbKYyV10v9RypumzzLNi2Ou9piofyS7p5TmUHCcQ0fh2LkUNAbyYYSN/ZmolVNy
         73wUjPoL5AwBQVUTv/YXmqQbLhYkZX3k3GTp9zp3gy1sqhxI2KBIlgi+g5eJWLWI8ZXs
         Ec2xUMyt/aAQXkTFhL1PBcHuSk4XJiPRBQ1haZbEYnwyBfKB18XoD3/GB6q7KtfOBDYN
         DJKNXpNq0sBp/LVhY6h56ZfITKJ2X3zeuGKRBfXtL5xttXdz248eSYiVxZHtwV1Wx09Z
         IDZ/UTXSBt3IJjQ7rxeSa2rkROTgVlnF5SEsa6lBLGzxkHGOOfAcIoje8REgtbYZ78Lb
         YbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743152795; x=1743757595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bBzDSKbEvvFa69CxhVUVwtBwFVzp9lyfRZu0hRQ/TQ=;
        b=bg02nb8xfkjm3RORk429WAFIged7592PUj/Y1MzypCEE38VuYfthOcHjzFcXO15yQy
         n0gVYM0J7CCRQrZP4X3c4l3Jqlqu1pNu6Q8yzKVVtY0HRe43DaglcZNcu63KQ8RSPhOD
         GugGy9wKl97betCaXCmcMa9RrrVchRNLrCogOF/Ev6k9aQDLV9tYsacaFtr1KwOQWv5F
         HiV8809+Ob6oBqoSYek+ivyHV/6GoDpAx1lYTEwDA12IF0ycM/jqPfMqXPUpwCgFVERa
         M0LACNN8admx/ApjrsYDVvkNItqnhXPUda5zYJV1MCyFx8plHxTueQj3FLB0+j8xOcdQ
         bTgw==
X-Forwarded-Encrypted: i=1; AJvYcCU4N7kRNjsMWJdaGaBaNsTxw7uQJhoD+srLbxssr+H6XgFNz4hOOA+pZtOZVQ1oaBwNBbpgP5vCOm6Tqxw1HuQ=@vger.kernel.org, AJvYcCXfS6KXrBlJitCv04n629dgTtZ7BAxN0KaEfZdKQBx1MtA1gt5qzW+PYyAV42GedRTrdLD+gmu2xYONQ3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSB4eCCXjh+mb0w1itU2jIgqz4D1rqMv7llMGB0T8cZxfxb1Mi
	EoLHuL95Uh+AOsDodfuO3g2X2Gb6rQCLXmsKgA3PVzcyOrrAWCS99McS4Aa7N4dUJvGRSwns9rQ
	dvqKc9HBm9X+WwbZ0WK/3TsYWqF4=
X-Gm-Gg: ASbGncszSttwgv7fmMIRqvGFZQ14pPCvWir5VZpXTTpgVAfCKmSYb1scfNxXfUjop5F
	51TtmFXoOp7w4ULeZv19K9lrlwW6mzC8vLsA+rxGPUMvp7jlkf4iIjYljNoMA5FPUgrJ0JnUQzE
	Ka4rou19zS7EgmZB9/N5LKxANeYA==
X-Google-Smtp-Source: AGHT+IGIoygOoyq3S/AxJAttswGhPDydP0zM9nr7Nj8c/C372RKes9cQ4gpXwog2lLiJizISmEm7Zggjy61Xyq8lTkE=
X-Received: by 2002:a17:90b:1d04:b0:2fe:8fa0:e7a1 with SMTP id
 98e67ed59e1d1-303b211144dmr3432897a91.2.1743152794867; Fri, 28 Mar 2025
 02:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321111535.3740332-1-bqe@google.com> <20250321111535.3740332-4-bqe@google.com>
 <Z92N8dyIE42ROW2t@thinkpad> <CANiq72kYzx7JTVqrJuP0Wo9=1qtaN7s7fqkD5DDcjA59SgMizQ@mail.gmail.com>
 <CABVgOSkjYFwHhQfbmY83iK7crq9ZN9+93Xe514ndhAm6Me3UwQ@mail.gmail.com>
In-Reply-To: <CABVgOSkjYFwHhQfbmY83iK7crq9ZN9+93Xe514ndhAm6Me3UwQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Mar 2025 10:06:20 +0100
X-Gm-Features: AQ5f1Jr-wLdE8wgAsmjLhcOdvkbySbtJv6LsQafWBlALqZPoNu2chMV-ZrC6L2M
Message-ID: <CANiq72=rbA-Tie7JPY8rj5c5iHBqV0oYZvx5AX7UAJvp1ER7MA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] rust: add bitmap API.
To: David Gow <davidgow@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 9:51=E2=80=AFAM David Gow <davidgow@google.com> wro=
te:
>
> KUnit. That being said, I suspect that supporting the "just build this
> one test module against your existing kernel" case is going to be a
> bit more of a pain here anyway, as it might end up depending on having
> exactly the same toolchain/config/etc due to Rust's ABI not being
> stable. (Am I missing anything here, Miguel?) And, of course, Rust's
> built-in tests here would get automatically compiled down to KUnit
> tests if enabled.

The ABI is not stable indeed, and modules need to be built with the
same toolchain.

> So, what I suspect you're looking for here is a separate module /
> crate which benchmarks the bitmap type. With the way Rust crates are
> laid out, I suspect this would need to live in a separate directory
> and look something like samples/rust/rust_minimal.rs?

Yeah, the module Yury mentioned seems like a normal one that calls
`ktime_get()` etc., so doing something like that in Rust should be
fine too.

But, yeah, I was thinking more in terms of having a proper framework
for those, rather than doing a custom thing per module and even having
those `ktime_get()` calls manually placed for every test etc.

Thanks for the context!

Cheers,
Miguel
