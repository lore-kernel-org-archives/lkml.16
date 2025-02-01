Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC7D25632;
	Sat,  1 Feb 2025 22:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738447325; cv=none; b=tnMzfmXOjdJ8Rnyzo9Vd18qhOGLSUDKPFow71tVxsNNys+5aecAUHbq07Hy/ON69dLgYiozj0VG6sl5ll1dGFt15JqJjJB2QHPdkQQi7p7t0q/tNy3eO/bYdJQ+bSjimoeLC5jahf2+Qymyc7g+USovNkMHnA5c3lGexMBBtjYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738447325; c=relaxed/simple;
	bh=0GytV9xvcdDRo9XarRXqGRLVJ5OhXFaenjTLnIsGkvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pcPr2/oRGNgT4xm4tIzAh8gJmgjpR7tD1VhERt0AbAqjOjAkCjOTYzy8wintgW3Ur4lJCKh76NfOsA9zS+UqFfKMn0VNc2KYH+ko8km2UNbSQ0LeM5eupHNc2oJqGr+pTLIhl7SopnJVJPDsrEnGSozPNoIwU7LGvdny4HEbmTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cc3L4W7I; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cc3L4W7I"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-303548a9361so23491671fa.0;
        Sat, 01 Feb 2025 14:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738447321; x=1739052121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKDqICzo9rH40LKUxUFevaOik/aUd3fjiYH7DgeEEvM=;
        b=Cc3L4W7Ii5qIZHyRKNFTD+hObpe2BVbHRB9aiMOy1n8+Nfk3StNJYSfOThjBO9AMJR
         X1UrmfmfYG/Bn4zEbFyk7rYGOtYBTo3ib3fWWRKVJAeb8IRVdrT2jMqoPrOwvvv+M80x
         ojtipG0oMRWUm6wsWa2kw1m+ggHLoQNtimtm/l+h+fgjsAYGin5ijo2Qx7nAqlMqPHfW
         c+04WaO5xC+nv79xMz454b9xBHw8pfMGz6YJIpH9lfAKx2fHlYUww/0rg4ZhQHcbmWAj
         atfbaqW2ruAMdPju7AYrMMX8LcasfawiUbmpNVZk1O3iCzGVbcmqJ9kRFIetGVUMMBgZ
         hWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738447321; x=1739052121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKDqICzo9rH40LKUxUFevaOik/aUd3fjiYH7DgeEEvM=;
        b=Q3axOPHk1PlzeYNPnBC1dhz1FvGye38wF45ZF0BUXl3vRZ9lNpTc3Xmnn7oMDqLdYs
         dDVL/Ms9U05nCzJyZcvYDK1c6iMIvLKsB0xWeR3uQsK2qu2GVMOA1wrPNQGfyAe4uxVA
         70obauXfi4+B7L2g4iITBDYHDc1ALU6VWgJHg0BWj7FVtsylww8KQcrqcWEvNY6SAY+y
         smCvIpsW7DpAK32R0LRV/SOrOROF3gsF41kcFMig+tX+JDkDrRejNwAuWqvzkCEMgVGT
         Rk7AZm+uLs3eBjYhZAXakSpjLDCPIGXJRlwVvZQFZQ0VcJtmEEVwF8AMTPPo8AWTmZu1
         tbAw==
X-Forwarded-Encrypted: i=1; AJvYcCVMNIe2e38cvNrSo43GidHHFahl5aOsLAloycAxYYMmNHD5mos47RAb57+kEOCobFcuWCBhHgR2H0rGG0znvp4=@vger.kernel.org, AJvYcCVW/+EDR3uHuWwqdY3+YC01EPKVYE8wh6P0o4XX+BVSrVhjsu43HEfhNCN0cqPe38B+PWGCODPiLsOqRic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5yHjBzitGjBvri1K/PBR82tFUX7tzJRX032z9n2iwCNeuTW6N
	f6AT1DQsBpnJggzeffB6mGabClorlXK1NfkiQqyxsqpJaoxBfbKx0bXW0ZF9vArk8RQ02zazH4q
	/Xt6fDbE5JwCIb1JK8v+LGf0BcpI=
X-Gm-Gg: ASbGncvK6zODIiR3OlDH5xAZGbje29Tgv5QN4me7BFhbQXLE2Voq/R5bdSCmJzpB8R1
	SqZnfTq8ZrcvbTmjx8rHTVDYFjijuy20D+gMevPjMPZ8ctJS08wd39AgarMKWJJRBN87WZPPd3q
	nMZOKOgqF4EwLeFDKCPLRqT6kUT2A3hto=
X-Google-Smtp-Source: AGHT+IHxFStUg+dPKwmAm7vm3WifbAwuY5TBM1SUYz9fOr1YwJSNb9rz7j+76GGLs29Sy3ipnHxyiB+VO5xWm3R1TbE=
X-Received: by 2002:a05:651c:249:b0:300:33b1:f0e1 with SMTP id
 38308e7fff4ca-3079652eb0dmr53189411fa.0.1738447321221; Sat, 01 Feb 2025
 14:02:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201-aligned-alloc-v1-1-c99a73f3cbd4@gmail.com>
 <Z56Bq94kPaN9UX5H@cassiopeiae> <CAJ-ks9n3KfcSqocjXY6QojF6R_aGBiRsXBuyiX8Y0rHtjm3sNw@mail.gmail.com>
 <Z56ZDEM9gcJhIXxW@pollux.localdomain>
In-Reply-To: <Z56ZDEM9gcJhIXxW@pollux.localdomain>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 1 Feb 2025 17:01:25 -0500
X-Gm-Features: AWEUYZnR7mbN5mmU5cKuvWIUlsGAQSzFIuphxMGUADmW3OYfhobOuzDCWoCEljw
Message-ID: <CAJ-ks9m-SXiftYGY_Rz-tgLQMvJ5OGfCtn9b0E+Okjm4waCooQ@mail.gmail.com>
Subject: Re: [PATCH] rust: alloc: satisfy `aligned_alloc` requirements
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2025 at 4:58=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Sat, Feb 01, 2025 at 04:19:48PM -0500, Tamir Duberstein wrote:
> > Hi Danilo, thanks for the review!
> >
> > On Sat, Feb 1, 2025 at 3:18=E2=80=AFPM Danilo Krummrich <dakr@kernel.or=
g> wrote:
> > >
> > > I think I prefer this to be slightly more compact:
> > >
> > >    let min_align =3D core::mem::size_of::<*const crate::ffi::c_void>(=
);
> > >    let (align, size) =3D if layout.align() < min_align {
> > >        (min_align, layout.size().div_ceil(min_align) * min_align)
> > >    } else {
> > >        (layout.align(), layout.size())
> > >    };
> >
> > I was trying to avoid repeated calls to either function, but I'm happy
> > to shorten the variable names. Would that suit?
>
> I think calling layout.align() twice is fine, no need shadow align for th=
at.

Sure. Anything else?
