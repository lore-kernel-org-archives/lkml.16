Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEE94A3C;
	Mon, 12 May 2025 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747057657; cv=none; b=btJCmbCBndXP5QOqGnarTXhFEpxd5ganHbsunEMxOQ0WJ7RLnMiLt1m9Oi0+vtNgJNPOYE2UIHie1GvF5zXVbO7YFfmeIcpbWZbj4Qn4UhzGo0CfkPGZ9kjOYkxd6K3VrHq9waTVzHOH3EpTfXc6Q8oIZpLIwQNUntNX7vIW6Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747057657; c=relaxed/simple;
	bh=ff/BkoK0UAKrKgoa/SVlnryGs4F19dLoJj5SVwSUo4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ddrXT1ReUPcEaSW7+EGfnACSjpXLqcI/acdpSGgJWjqwaAtrXpabcScg6QASBqT6u9/y1KXJma/A7yQ+2j2JfNQ89UETQvMqXVHX4T0rjziVSRrLj9IGfiKRhyb1YX4bBPItvgaQx/HjGecF7lil6lKNPsPRqRq2u4lqJihu7QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8KnYwMf; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8KnYwMf"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b1ff8a0a13cso751303a12.0;
        Mon, 12 May 2025 06:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747057655; x=1747662455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSSN0QVCB0auKOlByp57Ot7u5PowxUCeUXro48vkcbw=;
        b=V8KnYwMfLpFoeB4+czyS+qJTUS98quvjsy0N30zx+VW4kPNo/tXLS1phAdxAV/QXdc
         VWld9Rk5ZhGB/G+xjOWfv0LfPfllzyZWydlQWBTErg/EdvgoGowGhUcUlspcCIALMSZP
         Rb7lrWIIUhTPx3RL8vhQ3+3z1sFD2q1kDQ2tD8qW5sr3eGCKyBeEBfC+kaQUYkTnO+mV
         yd86DsftbEKefVIpXxfAS3wyBggozTFBkAIHqSsFTbCQrherKR8sINcKUouMMKBG4OKZ
         Y3F+k1e7EYnvJFgFi3GLKGiXvmJVQBgmdom1hR4YzPvaxwHQQl8nSOEq6SxGfM7E522q
         PI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747057655; x=1747662455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSSN0QVCB0auKOlByp57Ot7u5PowxUCeUXro48vkcbw=;
        b=lm/CCjeLMIXW88O+zTC0wkjp/FY8AeTPdRMUPO1RsM6uJtAG4hh0Ss14KmqRI4p3XR
         ylgmAMn+xbd71mDZsHMS37u3lB7WCVQvbbxbvSDvTWk4d0UeaTzmxc+xTMNUMht8bjA1
         58x9r2wHteZfjVWWdfvgEFr9aaf3ztBPeSv98ayX4J3qMMBbq0os/MvQvngO8pdWJNOH
         lk+HijQlvmDfWKD/CvYIiEgAittokEwwkTeyyqX9+BSfn0YcLhlnoP/wVcz+AdZ6uQ9G
         +VIwlWVynqc2PquBbJp/I7aflHLHar5hWNU15RN5GI3PtWvkNqDr4Q5PULhCt6nPrXme
         pgbA==
X-Forwarded-Encrypted: i=1; AJvYcCXMR+eXFvjzE4CLkvHBUhyE5ot2wOMLtW9H6UeHgGtLXOnCr2qHF6w+2r44LpUjWTN6jnbEZMVQlpHoulQ=@vger.kernel.org, AJvYcCXtwsGtDo3IzSXqbfUREBbw+b+fRduQfRBy5hBM7MhmgZZM66YmC3xQuGcpejq0MmOvJ9crgFDhDCm1rybI5SE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ/75NZdSH6KbK1+4oM0EwZ5lMZWppnehkbRw0dONXQCYMMUL+
	CpIBDy7cOophMMAEgMg6TeFQwfZw9NZAAl9nq++Q+vI5EYi1Fks/fv1Bw4fcrllmIdKBpC8SAK8
	kU+5SHf+Bx2hMrtDI0x68SvbbURU=
X-Gm-Gg: ASbGnctshG+TRks98PWa/bhncwtUv1yF+rr6AiBUpHhIUwgyoEf0pIyBpYT/Q8l0E6s
	0X0fa73nliI5Nt8FXAlNoRml1ErPPSEOMRWYcAOUQVxzdJViOTxTaPX49ZXIau/5C9B1gTFPM/a
	gMOe4Un3aaRQTCjaBtYTFYopORbs8Ieok6
X-Google-Smtp-Source: AGHT+IHicxSAY2ahCa82NqPdRsKS2nLtw4K9WryM+tvkR9Vd6fIZ0xjbPPFQnJMiW6iVED0G6oSwMwOYHzh4pwOBru8=
X-Received: by 2002:a17:903:2984:b0:22e:62c3:8c5d with SMTP id
 d9443c01a7336-22fc8c8c1bcmr74033075ad.8.1747057655140; Mon, 12 May 2025
 06:47:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321080124.484647-1-kunwu.chan@linux.dev>
In-Reply-To: <20250321080124.484647-1-kunwu.chan@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 May 2025 15:47:23 +0200
X-Gm-Features: AX0GCFtjrAQIZQvRJ49eTgAfdFwyQYEsuDLwSVRff4tQTTKSn5Eq48N-yLr6Y1U
Message-ID: <CANiq72nQuRr0+U9QkAx_d01hymgwsor3SQKQFNt0Y3SStFOfDw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: page:: optimize rust symbol generation for Page
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Kunwu Chan <kunwu.chan@hotmail.com>, Grace Deng <Grace.Deng006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 9:02=E2=80=AFAM Kunwu Chan <kunwu.chan@linux.dev> w=
rote:
>
> When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> with ARCH=3Darm64, the following symbols are generated:
>
> $nm vmlinux | grep ' _R'.*Page | rustfilt
> ffff8000805b6f98 T <kernel::page::Page>::alloc_page
> ffff8000805b715c T <kernel::page::Page>::fill_zero_raw
> ffff8000805b720c T <kernel::page::Page>::copy_from_user_slice_raw
> ffff8000805b6fb4 T <kernel::page::Page>::read_raw
> ffff8000805b7088 T <kernel::page::Page>::write_raw
> ffff8000805b72fc T <kernel::page::Page as core::ops::drop::Drop>::drop
>
> These Rust symbols(alloc_page and drop) are trivial wrappers around the C
> functions alloc_pages and __free_pages. It doesn't make sense to go
> through a trivial wrapper for these functions, so mark them inline.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>

Applied to `rust-next` -- thanks!

    [ Removed spurious colon in title. - Miguel ]

Cheers,
Miguel
