Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08A4266B52;
	Tue,  8 Apr 2025 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744108557; cv=none; b=nNn8YWGzBrEfiSUdR9NyQws92UFD+Hg83pugvGaOcPb/TW/3DrHZhT78nQTidrKEGxdBOlLiUdI2ZpMCv1qp8M82BGXGC474AXYUeDyGrL62hBxFFOl/oATOxQoPUODIh+l/9bnZ6lnYiCyS5XQqHzpqQ+xd4BTWMeNKOYgsHsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744108557; c=relaxed/simple;
	bh=Hs5PawQM2WOdSP5JwOusufifAnZKTVHPO4QSUYxTA/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QTZHiR2tQvtDd0wjUKwWsHpJriRPZs+If7Uy30JiXmBPU1aNm0ZB32c8GKYcZ/VUJ5TBS1ccmGp2MuSYMktjMdFdBjDHblOgrABzEyGC4LXGCBAMrsZRBRE5e8eRx+7THmdTNTUCbvPS0FvdTpJ6tM/nGyXfK+i6q1SiGEGkNus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKT5vBtR; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKT5vBtR"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af8cb6258bcso322943a12.3;
        Tue, 08 Apr 2025 03:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744108555; x=1744713355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQlwjJ2p3uIQ1WJnPIDIqEOJSPAOfdW0m47XOoSjXlI=;
        b=AKT5vBtRKLGFLhDRXbnTJkEJrWMNkSb3BjfnZ9eIlspennyV+O/jBisqJDOJio3/hR
         Uvx7wsA+Imyzh2QWsOomtPlKi5mdwDy/MJ9v1T1HoRstwSI+N2AS7OPrve29A4G1irlj
         EO7YLFo8H0aBMs3PO65K3EY8nn96zfyUsxqNki7NxovUueVza0QpTL6WZOHaCBnmkgdT
         q6n8M5ROW1Aq4DF73lepquDrwAiAq7v2lgXgFYFRsi6Pxu9lpxyTV9B4zLS8PHMGckj7
         z9EKQTAoyN1qVTEU8XO1WcANXJUePRrc6CuA1AUChUAg+ZrnCn3Doex2WpDwvpBHxBAP
         XCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744108555; x=1744713355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQlwjJ2p3uIQ1WJnPIDIqEOJSPAOfdW0m47XOoSjXlI=;
        b=tl+ejDMDt8F7wVEcqupFdk6RSKc3cLv5HcYsRRGWx5NGeOptczqQAkDtQDx3RZ58hr
         A8syBn/Mj4BNUdI6o0Dsnl9oASjETkrgiK9ZnBqSOr0iHHKI1i80gfBswT+MDyJghFIk
         EBauLxRPtqIwc6zZfuHZ+4+X+cMC6KF8m3VsvjQrISEYm3a77HCX80nNtItTAr5SbvXb
         C9OvZsFIXTgFtvv4dlGWWbBSgscFGwAtUbXWcDbw5MdWxXJ5x78NuSeEAwjfZNy+vWgg
         3E6eMMqbTMx30wn5qy9xr10OIw2dLjnCGqXiuUpagbSx/DNP8Ip5DzU5r+zFevHAPusJ
         ISrA==
X-Forwarded-Encrypted: i=1; AJvYcCVElqR8EL0pB3Pl1rrcmHW4GaOwXaOqk3gMr5bEOvX70PFG6lb5m0ppNvQRcuc8hYGtc8ZhPQmlL/ggZyL3GIo=@vger.kernel.org, AJvYcCXRr/2QvH4Jlj451BUaZoshTbUUw4xu3bk0coRuJls23FRJmXjoj12HxnBO3q4dXF9ZJ6u80+mjMoYorPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrmfcWLg+Hwy9B+bVLC4pgy//UA9ypb3zACiO5KidxEc6v3y6Z
	eXmbR6Soownht4d/h534tUoBN/eWu1QAW+eXey6OGtwE9joSai6ZPTMRd/xSgszjAc+a5nz4jEl
	eANns5ijqal/9uhW872KFdOLqyIc=
X-Gm-Gg: ASbGncufEcu9iirFgZj/HzTmemqg0ybVm/Dc0aHqiKb2boN65/6J9k/xLl0eIL5K8GN
	dwXbuV3Gv/kAYj8LPQnhELpVuSBU2L7sVbyXimANf/0jPmBEqhm3p1RHB/Y48Qt68m6uzEJm6mz
	OUGgPIYu9lDXHGJN4F0Xn35XtP4WSnnJfN2jcf
X-Google-Smtp-Source: AGHT+IHG0bNsfNxD/bffZ1WEADVVWD5Z4FZXXeo6nGPGofnX5l5qeHWJst+e/L0ClQBdKnDo45M/UccxZy7Vo6+22pw=
X-Received: by 2002:a17:90a:d006:b0:306:b6ae:4d7a with SMTP id
 98e67ed59e1d1-306b6ae4e3bmr4961351a91.3.1744108555055; Tue, 08 Apr 2025
 03:35:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-box_trait_objs-v1-1-58d8e78b0fb2@nvidia.com> <D916LG7Z9Q31.5RVNMYM38E2D@proton.me>
In-Reply-To: <D916LG7Z9Q31.5RVNMYM38E2D@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Apr 2025 12:35:42 +0200
X-Gm-Features: ATxdqUHL4PfNxPSYXiMHqmeMcyHw_IssZCc34uipmaO88JKUWSemU7j-HOIFMxc
Message-ID: <CANiq72k9Lo-M5v338iWWSiwrnU+JwP+aEZeLiR291xc2c+ESOg@mail.gmail.com>
Subject: Re: [PATCH] rust: alloc: allow coercion from `Box<T>` to `Box<dyn U>`
 if T implements U
To: Benno Lossin <benno.lossin@proton.me>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 12:22=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> You forgot to add the `A: Allocator` generic here and in the impl below.

Yeah, for this sort of changes (ideally, all patches, really), please
test with both the minimum supported version and the latest.

For instance, there is another issue, `#[pointee]` is only applicable
when you have the feature:

    error: cannot find attribute `pointee` in this scope
     --> rust/kernel/alloc/kbox.rs:66:18
      |
    66 | pub struct Box<#[pointee] T: ?Sized, A:
Allocator>(NonNull<T>, PhantomData<A>);

By the way, I would suggest taking the chance to move the sentence in
the docs below to the "Examples section" and providing one.

Thanks!

Cheers,
Miguel
