Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDCB284B39;
	Fri, 20 Jun 2025 13:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750426529; cv=none; b=uJ6H7mWH4GW4SK4ktk7yM8XnsaeChTaoW1pCuIyl1N5yVd3cZvptjOPaEW7zVzeY3XCz4O6oOqHQa37pumQA3Shr47BiweTZlHzJa5AwE15dOF7j2YZKXCyxXLwghXV6RAkq99AKerAAtmIQADmI3IVlVhcsqJlcKNlLUs+lqWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750426529; c=relaxed/simple;
	bh=tCnpOHv3HE8hDdGh8EQcA6cGVLk0vkjD3PAfi/luf1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BYDqmDC/4JDGzAfN0XGSM5q6td8ySuhikg/NqB/GwUXUqDkWf3scWoeNViAVoafcyO4bV+fdJ/M1OfTzbfTSY4iPC5fwlTBQdBG6m6eL5jzqf0eDOyLeoYk20H60MMBoyYyhvpU2T5WxjCxFMIVQcedaDsjoxrfGcRoB8MofKug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+790DtO; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+790DtO"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b2700de85d0so293041a12.2;
        Fri, 20 Jun 2025 06:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750426527; x=1751031327; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciykJwNPy2VNieSQKGV5yGfXBWXTz3pnWQQit/GvIGg=;
        b=l+790DtOGu+go5WFYPQFGE50/jMPemJ/d1mGMEL3FahOzxSACRKyzwj3iG+xQZeLIU
         nTZPcD55DPCMRRF9RXscVjciLQIcQoU95uv2aHOIVa734vcvZ7M/fvN2qZa2Qj7Q9szc
         96BqNjg9hZlikNPnd51xADygKJ3PavOSGh/youxbec8Zo0EOYWz27k7NkoqSN824eEBQ
         ASFbHwWNtLInx0cuY5qWKI2xvIvIIWtGy4ubudCoy9mDAo11Fb0ga6nYYMl0btLyyZ5n
         4kf20jxYevp7ZVbMRj71wNWQDTUa8ozLVnTCFqCKNvs0TqpiMx7VOfyGzsp+fd8LpPUV
         n3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750426527; x=1751031327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ciykJwNPy2VNieSQKGV5yGfXBWXTz3pnWQQit/GvIGg=;
        b=CFn7a374FP9XaV+iVH/oRIKdrsexUBSBFOgDmxO6syXi2js0ugClu97FUK9g0r80VB
         nQ9t+7M80Z/cA9OkGI9L4PRDcFQmZ35ez3OR6r8wtFSYV7oTK3Wi5+1oF8K9RwcXet5E
         HFNPB/ugGjWr7fxdUicqy+4T97QELbkRyEWBZVCDwy8q0amtJO9aU9oN2nP+sAeGpDu3
         QNeReQ0huHd8Pfm6nsWsg9XsPMpZu3XCVNuP/5GsylAe0cWtSfvm8HUIfCg3uIHON2xm
         rrKvm2RxNGykX/mceYt7coYirhA8x8WuxEmkjP29jfuvrGFl77xRDPeY0mMen57/NKPK
         oTJw==
X-Forwarded-Encrypted: i=1; AJvYcCVBPsdjTrbx2QI2pt+P8Vl15UIKVizAXEWK4NHaHJcFNP43W0nEa2+orI+1MRq4hZqy+l4ccBeqzJtN6UA=@vger.kernel.org, AJvYcCVmA/ltDewMqVu+sU6EswR71SHVKEQnke0sH0qgI2eNStixll0s+O/fgzV8hlmSV0KmMJgbO3ufa3nt+XTQ9ZY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz029y2fhUQCIiIqO51BG3Z3OUsk8E8lwPK/owaITfRj5iCifaf
	5HeK4+hvmPcn863k5Baq0ZIHczHc/IPhSp0X7KsPUbGNuexWc/tL7S1hpzbwrvg8eVVyDrQE8RW
	LluujSqrLhfHz2rdNYgDabAvg1pNKkXk=
X-Gm-Gg: ASbGnctIalB7CK3YyveZMHTmQzJew+J2HKEycqAbHaoghM9Mll0KW61TPkGUUCXyGVf
	mRRl/T82olB7YNEvpO55xcetqT1zZEsXHcfuTalk5zWF5WYay6+H4HL2sqfhyHo1VYuY+GBqEN1
	ze7PhpytNq5RGIZhlsB6N6hM8WwCn24zGR+cR+Uzps6mE=
X-Google-Smtp-Source: AGHT+IFPthesqIFSi/O171CaK3dBItc40f2bqdqoBwA2MAUv9vVgFRzwoXgjNy0n53Ha/Xt7WBxaFVSen5LG/UgilkQ=
X-Received: by 2002:a17:90b:3a43:b0:311:fde5:c4ae with SMTP id
 98e67ed59e1d1-3159d8e2be9mr1716522a91.6.1750426527235; Fri, 20 Jun 2025
 06:35:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com> <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>
In-Reply-To: <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Jun 2025 15:35:14 +0200
X-Gm-Features: AX0GCFuVT1QLcBO2haDSwB53syExrcXNwY3AyOzQthEHRsH2T3KmjtBuf1buWgA
Message-ID: <CANiq72=BSnom-nQgzLvv-cqwSknK1uJ=CXGP51r0WRj1Y553Ew@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: add `num` module with `PowerOfTwo` type
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 3:15=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Introduce the `num` module, featuring the `PowerOfTwo` unsigned wrapper
> that guarantees (at build-time or runtime) that a value is a power of
> two.
>
> Such a property is often useful to maintain. In the context of the
> kernel, powers of two are often used to align addresses or sizes up and
> down, or to create masks. These operations are provided by this type.

Before I forget: the other day in a call we discussed powers of two
and I mentioned that there is `Alignment` in the standard library:

    https://doc.rust-lang.org/std/ptr/struct.Alignment.html

    "A type storing a `usize` which is a power of two"

So it would be nice to ask upstream the following if they have plans
to stabilize it, and whether they have considered a generic
`PowerOfTwo<T>` type like this one, rather than one just for alignment
purposes (possibly with an alias or newtype for `Alignment` if
needed).

Similarly, if they stabilize the `Alignment` one (only) and we end up
only using our `PowerOfTwo<T>` for `usize` and those use cases, then
we should consider using the upstream one (and adding any/all methods
that we need).

So I will ask them the next time we meet. I have added
`ptr_alignment_type` to our list (in the "nice to have" section).

(Apologies if this was already discussed!)

Cheers,
Miguel
