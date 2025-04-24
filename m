Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A258919CC02;
	Thu, 24 Apr 2025 13:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745502514; cv=none; b=ppZDftf+Zz9ahsf6us1AP4mfYfHZwSj6M7vYhRp096WMm/AcmnrEZtrB5MQJZZakYlpDS6QwQx+Gc0dftowVFdItEwm+aiVCfKJnjz7B056TxapQqADLZ4hnU/5Ou9p7wcGQqENIrO0W2t0z6a0p6t2y98iU/14cVsNGoeIKiSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745502514; c=relaxed/simple;
	bh=fKvIjrI0hCSQFHlGnjhD521l6JdrQsCaiG2ru0+NjF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBK0l/JyfhWb7tDIR7wSGPGx6ZhX4AC0yK/ycvHq2TvnoAUq+EpM3y07H0xIbadDFWhTI5FRu1ztDRMzzwLlaQRq2U/rfpTspUgA8k8rq/MPdqEwwzfWmCwKjYS8KX6SDxACksJpzTorgPxivcKrTyBskRv9yhll0sK2OA4ryuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g30p5Vff; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g30p5Vff"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso11097841fa.0;
        Thu, 24 Apr 2025 06:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745502511; x=1746107311; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lr3IyKd6FrWyCjNMXq3F2D4owrOxZcXyVpO7W9rSEOs=;
        b=g30p5VffTMGVTXqhrAU9pSS66QFxWlTjr5yfYx7XIZbGmHlUQetPhNmO5ok/eg3TVh
         cY11pgx6L8ZnX4YZY1Ls/2WXGV/ppzG9bItr06sLxHKOMqzMerjQ2Y8VIO8Ws+aGBA5k
         7QC+9gnXgJGjd3+hASVEwOeG/P6+rMvtdifCw3veHgBmpH1WH6JYylyLchEd8YhDjoDT
         y+qiGv3uRz2uO7K0OZ6s9npjndSw1PBFWlirB1e+jG/sihULVkU64c1/FsmSdEAzskI3
         Cb5GQFMXumt7cqtXHS0gHSIL6pygihqN8yHa4aC7KAh67LWnBVJnbSDijo1x0je8Zuij
         C7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745502511; x=1746107311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lr3IyKd6FrWyCjNMXq3F2D4owrOxZcXyVpO7W9rSEOs=;
        b=CvzDoDjqaeDbWXr8WoxtAMvcvJlEdr8uYjZGoxC2qF1ReoJdtcUrQKhrkRYeO99VsY
         +hshKotrXQDjTk1Afi8It0E3IKS7piXrI9gm6U+2ipfE5QOQ5l+TqtKY6QXU6HRT2+sX
         5JoEiCFQ08Abm7u0o1IZNDaWaIhzmkgOB14XTZc0ZXpecqsI0E/P3uH5WcI+0zo/xXHO
         t9l44RgmvQ/8s9mvDsmozbrFGaPYHLL3tf302GiNs6lUlW6A1RpomAcS/waxcwCbY6Jo
         YR7nug//N3LWyEW/bQBvQrxMR8qDQDzIRV6x1IsLxvDmJdxfPx3tOJCPLCKLshtTQTcr
         mAGA==
X-Forwarded-Encrypted: i=1; AJvYcCV88QUrMGM51TRb6Mxkguf7I19TLTp9kEDygY4SU4PcJBbXFrDcXO7OgSjEB6+Cfp8H/x3qFLhXHWp2wf4=@vger.kernel.org, AJvYcCWlX9oadcTL9i3sr2pE2y0HHsOvF+/mpveeHuZVxulD7aIM9yDHDGLIZM5GLXKoBgJQUM621PITy31BQ1ZCl0k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxry/KJaoKl/Uqh7lQyaXUUotdibhPD3g960Mh7IzkAUq3fHNW7
	78zXYLu3j6y4yXb8aJcxuxoL2AmSWtuphYmyTk9TbHkZNbuGE2NUIGmtflLYaoUk6ZS8Pe/Q+Di
	T4M3xUbNpV7FQb5zSnUYnmZZSW0M=
X-Gm-Gg: ASbGncvk6I0ca1Cgz6WyBLlFppbVapB9/4qsEw8n4rveV7X8I70DSJ3qV4d/2UJc/nA
	Qu04KhwjpLWENHkmEbveHYHcqQjSVNcRv47GR4S9ZA23LIF7JFmqIZQjdsrZcrKjhnLgAN9IZjB
	8au8bNNr0SsQ3X9r0+i4/gYRmFA5PCBCl5uQqTDvzbJ4ux8XhT
X-Google-Smtp-Source: AGHT+IHfaHMP16utXda1BAYlLkxGwbHqkmSa8+htrKYQej48TUwF7eeeD4JZ1JfHM9MaBzZoyk68vO+si0P6x3osYyo=
X-Received: by 2002:a2e:a917:0:b0:307:e498:1254 with SMTP id
 38308e7fff4ca-3179ffc2d0amr9162911fa.35.1745502510592; Thu, 24 Apr 2025
 06:48:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-b4-container-of-type-check-v3-1-7994c56cf359@gmail.com> <CANiq72kQWNfSV0KK6qs6oJt+aGdgY=hXg=wJcmK3zYcokY1LNw@mail.gmail.com>
In-Reply-To: <CANiq72kQWNfSV0KK6qs6oJt+aGdgY=hXg=wJcmK3zYcokY1LNw@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 24 Apr 2025 09:47:54 -0400
X-Gm-Features: ATxdqUFodVm71rg2xbdZ_cjne5hMO5lP5ehhd9bV_I34pfmsHA8XA0FufFsQ1tk
Message-ID: <CAJ-ks9myad-3MA6-TN_XyE98ZgefOgtoCiXC57KVYFjm3pw2LQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: check type of `$ptr` in `container_of!`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 8:48=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Apr 23, 2025 at 7:40=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > +        if false {
> > +            let container_field_ptr =3D ::core::ptr::addr_of!((*contai=
ner_ptr).$($fields)*).cast_mut();
> > +            [field_ptr, container_field_ptr]; // typeof(`$field_ptr`) =
=3D=3D typeof(`$Container.$($fields)*`)
>
> If I understand correctly, we keep the `// typeof ...` in the same
> line so that it appears in the error message and thus it is clearer to
> the user, right?
>
> In that case, could we nevertheless please clarify things a bit at the
> top of the `if false` block, i.e. something like:
>
>     // Ensure that both types are equal while avoiding codegen .....
>     // ... i.e. effectively compare `typeof(...) =3D=3D ...`.
>     if false {
>         ...
>
> etc.?
>
> Or, perhaps even better, we move this into its own macro, so that we
> document it there and why we chose this particular approach, assuming
> the error message still prints the right thing.
>
> Speaking of magic, to be honest, is this approach worth it? I liked v1
> quite more. The error seems concise enough, and the first line that
> the compiler points out is `assert_same_type` which makes it super
> clear, and showed the actual expressions involved without using a
> comment.
>
> With v1, we could also just put `assert_same_type` outside as a
> utility for others to use, i.e. in the `kernel` crate, which
> simplifies things and makes the error a bit shorter. Moving the
> function out makes the error slightly shorter, would also allow us to
> document its usage, including the suggestion to use `if false` in an
> example.
>
> Regarding the `if false`, the kernel is always built with at least
> -O2. Benno mentioned debug performance -- was that related to
> something like debug assertions being enabled or just optimization
> level? Either way, even with the assertions enabled, I don't see it in
> codegen.
>
> Am I missing something?

I have no strong opinions here, I'm just trying to keep everyone
happy. I'm happy to go back to v1 with or without `assert_same_type`
moved out of the macro body.
