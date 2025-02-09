Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F64814A85;
	Sun,  9 Feb 2025 11:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739099508; cv=none; b=iiELFdzU8kmzT1LC8nsnGGsrU9NM34LcTk/tocQHFjeOxD0L0N21RVuSopafDy0q2wqPxl9cQSuQ8yC25JmW31ruooKpBXUCgKgWzux98UKrc51MNglRLKUhM/mNSnYD4C3wltbFxAvLkZDvCprq9ACJ/pw4QFoIu/NMBfKbjwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739099508; c=relaxed/simple;
	bh=RNac7Fh81ms8UskPwYdwaMOFfpm1KA+23XQae9XCnY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rHVzFvTPY/od3TyUZckdFpVyi30lrjgmBh+200n3PSUDNEqy9KTQLR0/SIDTas9PdclJgIDOfbciAMBncNXydWMQRNx95fHH7d6awtvgCudvoANvVIZ0bPdZBqHcjmZLdkt8wklSY8+yNwmqQcrR4u6ewaTTWUrH8uH87iDcz3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpQ0tz6o; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpQ0tz6o"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fa1c3ac70cso701922a91.0;
        Sun, 09 Feb 2025 03:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739099506; x=1739704306; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNac7Fh81ms8UskPwYdwaMOFfpm1KA+23XQae9XCnY8=;
        b=bpQ0tz6oiwCGGoKMZC/iwQnHirkdyX4zVuK5JViO5cSUlwRkmNy6I28GyY2otoWvrz
         YvMNyzqmxvJ5KDXcCT/H/l4yWqWx9LwRU1AmTnDJixFXCrsLK3EdXlHPTEACgdtrlqnv
         7BC+Uxr6fz7g7/lOek+uWEfYkXcV5ai7QC3sqavs9OI6PTs9FvhGolOYcwD52wYYdHga
         4BsDdfYzUM+BNYUuhlRwxfd8hPUFmNecdEewovT4KJJZmALXRAXMhha92IyyO0FKTT27
         gCSRwPJq7ZjTy0ltdFu9rCpT8FgUrJTp2aiNz8+NedMpM0htq9gUCiQ6yTnvbhkZEB7A
         K5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739099506; x=1739704306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNac7Fh81ms8UskPwYdwaMOFfpm1KA+23XQae9XCnY8=;
        b=SG+DTOQHP/GZgEwE7CCKwZUl7EdJk2E4IKa/spBQZzY0++RcY16NECwQhoYX+TWuEX
         i+VpvlzvQryVXEmj5I4DBbt53l0iSjrOKSp40tFPfsMsqrtlFFmBy/Ezx/5hPXzq484p
         3bkAAQ538DfqbvBvv6Kzs4U78YIckDqc6NlxNI5ye74RssB38tkeh401t3Sv63Y4uV09
         rCrZFiX8S0eecQuT4iyKDR4lEKq2/iH3lx/fuj+Y2GXLR4OMCql1MVKqJ4QKjaF36rLX
         +7OG9NXD8O2WvXhPm7y5wqlbzaSmxI3hKvwCgTjcKehGefjNx+gHf7f8Lf3iFFPHIg/s
         DnEA==
X-Forwarded-Encrypted: i=1; AJvYcCXHnUmZiWpdsmALzy0T3PVVsrf7z63568CqFaraF9oJ2t3aPMXxmuogRbYc+PsvE6EGd+PkSFzoGEY3Pyg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUIIYXpuTTqnijzsRx56MdT1W6a7DaA6RpWn0dCV+4lq4C10n8
	FSA1HvbIXjXSDqom76pAMoChP3fm0LtL2WdjvKla8hSrFK0c3vcmB/QpK9up37ZScBTKE/M3PJF
	qLJnetN4yho4zsQrBxE+9+saMHcM=
X-Gm-Gg: ASbGnctzAZA/zkxAOsrcxmVhfM+dSV79a2zFCk8i7cGnz4akZZea/cH+juwfAJMJkO3
	3FoXVLi9KX7eB3QXyCxLzX+VeoyQrAb3PQ6jIBFDME+bsUn344gyakNRmuDiudjy583uQvRsL
X-Google-Smtp-Source: AGHT+IGTPyX5yA5I9gMREGJAdE/IccSiHCLwmOmK393k7g2asDNIajBU65w4cUuPE26J1WC8yAMm10SzH1Cfw0u/95Q=
X-Received: by 2002:a17:903:32c7:b0:21f:444:b2c9 with SMTP id
 d9443c01a7336-21f4e10e17dmr56606545ad.0.1739099506351; Sun, 09 Feb 2025
 03:11:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207004049.178049-1-lyude@redhat.com> <CANiq72=bspqRga-hTTb3Vh9kD0ctyTehM9dvJdR=8biTE+iCQw@mail.gmail.com>
 <772a3e7cc31acc532cc29207ad7eb46dd7ce2bcb.camel@redhat.com>
In-Reply-To: <772a3e7cc31acc532cc29207ad7eb46dd7ce2bcb.camel@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Feb 2025 12:11:34 +0100
X-Gm-Features: AWEUYZkI6wncZpK9H0wyOHra6tI3FA7OTO78XMNJB0y6iT4-BL4TRTEzlZZg4RU
Message-ID: <CANiq72mdrDE5f+X8hPJ2SjLCxYNM3thrQ3b0wijMg7TLaEpT3g@mail.gmail.com>
Subject: Re: [PATCH v2] rust/kernel: Add faux device bindings
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Xiangfei Ding <dingxiangfei2009@gmail.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 11:29=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> I'm curious, does using markdown actually make a difference here? To be
> totally honest most of the time I've put markdown in safety comments it's=
 been
> out of habit rather than expecting it to do something!

No, currently it doesn't. However, we do it to make the style
("rules") easier to remember and to keep it consistent with the rest
of the comments -- so exactly what you say is the goal, i.e. that we
do it "out of habit" since it is the same everywhere.

I could imagine, eventually, some editor or doc renderer taking
advantage of it (some people use ligatures or non-fixed-width fonts
too, so it wouldn't surprise me if some people could like that).

So, yeah, it is not a huge deal, and I don't expect that we will be
able to keep it consistent everywhere as Rust grows in the kernel, but
I hope at least most of it is kept consistent. Clippy (or I guess
AIs...) could help to spot this kind of thing in the future.

Cheers,
Miguel
