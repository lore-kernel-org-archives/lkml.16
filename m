Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4A822D7B3;
	Thu, 19 Jun 2025 11:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750333507; cv=none; b=CYRI5+lVgdZ/fDSCpLBXXZgYtTW6hHIWEPu4Iwq3XtxZB/V+OPRmgz9Ur5YgTQatMWmtC03Mda55ySS5Ogfo1pqL+bUk2G1jfgfdIYRvSltcCdD+J09vmrYzrniFlb0kjwXm6rUmH1PWuM+s5lScXUzGgldW4T4zY0f1qAbQdtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750333507; c=relaxed/simple;
	bh=usT6N/EHQPPy3v4e5Ofp6JyFBj1z65Y7FraTQkog1d0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHm1QvdOoXfYXZJ1/ymYGMX27YYh1lPwQT1EwfRHeV+uGz+HVYb++9GmFIFyk1wW3Hw9v0Hf4qCNQazN7eKqcdYBDSAp9k1f2twBG12umA8PUobpsPZt9ZsFymFdgUN8LTrdyrV+3ZbOuSrUsEnDrTIEtRvuIwN7rlWj4zGkS4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niHbK7Ce; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niHbK7Ce"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-312f53d0609so115472a91.1;
        Thu, 19 Jun 2025 04:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750333505; x=1750938305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usT6N/EHQPPy3v4e5Ofp6JyFBj1z65Y7FraTQkog1d0=;
        b=niHbK7CeuIP0V1GDI/Te3S1F7yEl80L6Y+0Nheq4qd+jMPQ+WyYyBs5blBTbYV1pIq
         6aB84m+11lkyJvTNsLFyjd0EYO29ZsconB5WjuyuBRwY1wPdzElSxKpvXdggFH89LmSJ
         m5Wsny3cqduHKHtghZaaSZNz8ZgQncVJv4DzkqrawoZ9GGkNwOEt2u6HqIDimYmY9QiN
         1L5PC9AXIvXKKbmVixSQWTjROOT/bcCTI3oPdFUDW2We9oloa8qzmvxj1tnDPScAywOv
         tIWvEmzguLZSclX27iI+3UaD4OXBFl9HBN/9PRJX6MoLdcodWy8o2x+oQShpUuShbra4
         Yt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750333505; x=1750938305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usT6N/EHQPPy3v4e5Ofp6JyFBj1z65Y7FraTQkog1d0=;
        b=hkcZjAtaumS0VRKVx4gx6IHXOJXTcuH+nEymiN7sxV15bPresZcgzWp25A7dOQILwx
         VTUvrTOsTvohCTgH5xs6AbCvZIQSZ2gUoeW+EyMere9ydCVHH+ZE5aBsTtnz9J0Apdlv
         9nxk2CHOLkrDxzDeNGajT+mryLDWCMr+RTumOMFKQhiTspueSctfb0nqcckj8roEN/tz
         UVkpbirRKcDTWUZdcxgESTf+O0r0aatumeJZjUBXUGbVMCFdeZxTD3dJS4gl1kRAJNoI
         TBj9HcTJShSZgL6AxKz0kQAHkw7YXabqLapCYdrTPNQule/VDGW62D0523JQQYtSHMyW
         VDmw==
X-Forwarded-Encrypted: i=1; AJvYcCWJsx9FA9zGNytmlx+j3Sr230UCfFNy0EV3GpFj6oM+HrjY3d+Npu4we78Y9BqG40/rP+ul1yGrO84/ohM=@vger.kernel.org, AJvYcCXyf6egYq139mimha/RDUdY47CgG2f0+gclfJqlvtv+0zA/OxUxV9lUBJGZPSASbeNttYiWnFCJPeYSk2BFS6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfqIhf+IJQJum3MwmLPga8jgPjWPLbCz4yJU2FCpG1qtRgHF7y
	ZPf7Yq895VRKpMOIYD8ax2eCJO4VWxVoExMlIaevQOv504YAWzUGFjrLbVtETMhG5jJw/+Y+v7Y
	oDnhBEBi5KX6ajVRBFXTsMeHyAApAKrc=
X-Gm-Gg: ASbGncsGKGylKkMTAxwIBagg6V7I/9lCzHTQhfHnp64W+9RkEr6nlVuyN6+kBMGIPjn
	zTwxA/Qd4SojRh1RbT4brG060OHSr0WS5W/znuEJC2NySV83LEoD90mcikM1gdagrWPwW6pEzUc
	HP1xBnls/cnO98NLvUQ90oD3k58fGYts8ghA/5DTIhxSU=
X-Google-Smtp-Source: AGHT+IEklIv9HhGsoPCnKHKpa98K6C5b+dOmsB+EeL9F8ZivLJvNxnP9HqyX9QN3xywQ9Z6PJh3JnXF52sloqjUuKJQ=
X-Received: by 2002:a17:90b:54d0:b0:312:e987:11b0 with SMTP id
 98e67ed59e1d1-3158bff57c3mr1490455a91.6.1750333504980; Thu, 19 Jun 2025
 04:45:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72kSfHTPeRQjhHKhdw8zuozvNy50CJjTuEbUnW_3j9x8tw@mail.gmail.com>
 <CAH5fLgggDKUwmU3oCTMS1dQGzA5Whp2fnXoLmbGmNF1W89Ar_A@mail.gmail.com>
 <CANiq72mBfTr0cdj_4Cpdk62h2k+Y5K3NSs54_1-9jiszMZ6AuA@mail.gmail.com>
 <20250619.160844.1477802332578239775.fujita.tomonori@gmail.com>
 <v2VP7JfqanHzCbCjzZsKXCG3l7icurTwDY22nHhk0sJjQjy2gubeujbVvfLe7c8-2KOURnZ87UHLxjAGiTxfeQ==@protonmail.internalid>
 <CANiq72kacWaLo=EE8WyA_M2Pr9h1MkqjeAmqet6CSGWLvM7B9g@mail.gmail.com> <87ikks84im.fsf@kernel.org>
In-Reply-To: <87ikks84im.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Jun 2025 13:44:52 +0200
X-Gm-Features: Ac12FXz8vhHDNFQrThPW-1y0XUQZhopnHGH1yAsniB2t7FrnxodzlRs5bBqL3bU
Message-ID: <CANiq72kHvfkrK0KG2Y60HkLMt=mgJrJMOcuF9Feker0FjgoVkg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] rust: time: Rename Delta's methods as_micros_ceil
 and as_millis
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, aliceryhl@google.com, alex.gaynor@gmail.com, 
	ojeda@kernel.org, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org, gary@garyguo.net, 
	jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org, 
	tglx@linutronix.de, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 11:28=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> The table at [1] seems to suggest `to_*` or `into_*` being the right
> prefix for this situation. It does not fully match `to_*`, as the
> conversion is not expensive. It does not match `into_*` as the type is
> `Copy`.
>
> I am leaning towards `to_*`, but no strong feelings against `into_*`.
>
> I would not go with `as_*`, I would expect that to borrow.

It is an integer division by compile-time constant, so likely just a
multiplication and some adjustment, so it depends on whether we
consider that "expensive".

However, even if we consider that "expensive", we will still have the
same question when we have a really cheap method.

The root issue is that the table just doesn't say what to do in some
of the "free" cases, and it is generally confusing.

Since I am asking for opinions: why do you consider `as_*` as
expecting to borrow? The standard does take `&self` the majority of
the time (but not always), and Clippy also expects a borrow, but you
also said in a previous iteration that you don't want to take a
pointer just to pass an integer, which makes sense: we wouldn't pass a
reference if we were using the integer.

Thanks!

(I am tempted to propose a new table...)

Cheers,
Miguel
