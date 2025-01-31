Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E948D1F2379
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738356298; cv=none; b=Xs6ZMYL0+JDKG+Bhq8IMtMPuA9jqZBBcLKCo7GazUw6P7JlBifrYgBQdFQ2NErcXpISW+ItMA6fYmtLFNOfQhWBQne3ikwNuqMJMG/kmCxZeh4wXy7GX1KEosEaDeyj7gCcTgwJCxTAQioIaJAUExoso2a7ohAwrtZoWSsr8VOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738356298; c=relaxed/simple;
	bh=kmGcO3rBaawol/b6SR3fihaZJAoM8MXJCY9Js0kH7eA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uXt+IgRXli1CjUHctlf7wMj/laTnQe90IcoSyypViPJn0T6rtnunU7c54d55AP32dmQbIrDdYRVJsY64XhQP+dqjapPxlb+ea75C21tBoMkTs5De53ls+DEUr7/AatmlSVMXR7pMG0/SdyBSUM0S8U/X7koIG8cZfNff2EnQ9QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y1tD7o5n; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y1tD7o5n"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so24073765e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738356295; x=1738961095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHhu4iCJ3WIIO9T/hKc1Qtpxvgcc/nvTbvi3YsM5x4w=;
        b=y1tD7o5nUlKDmYzIg+kSY1f4REvqcXTTEGBvVoEJTPA9je6KN0PAgY6wCylKG0qcTk
         aNQLqE6w+oHWdhoVJMB9SXZyF9I/BQ5oG4zXLaoJ19E45STM3fp7o/VSqYpCwfmlO/Ke
         F7W6Mn4T3R613zCuKxCUrHK96Tny+fIcO+n0TM7gjYwBrsHZ0TAzZdARMKn+IAdyOm+d
         /8CGD+Vv3x6TGCvRdO8W5vzJPlpMpLPu3TyLxksrBEdIH2I9zyCjb1Q6waPLDecF4b9j
         z1w600vWBRsaii95lpW0vGh9NVlfKrWMvddkz/5Mhvs4pfW9wIGXDODKFGxF71PqCtmn
         h3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738356295; x=1738961095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHhu4iCJ3WIIO9T/hKc1Qtpxvgcc/nvTbvi3YsM5x4w=;
        b=PhOwnI2yRMMQeebvx49hbHUfskhWo7J1+HGRxDNZCrHmNQR3J93Il7VJM6EnnKaI6Z
         BtRZ51H7sOo9bNIEGkewcTR9tWAJ0tR5V2bNQrhYuZPTHr476eTgcjhx+xh5gc276NQr
         psin/Su0HQyCFnb8qxn5FlTBC0DX1AzXKCWhWftqR8/gZIJyk7dXygYsRkN9snXIKlt0
         M2IaZYf8tcUJcLe/nAL3AX8k4+3+0b0eXUAI+vX/JxaRWZAu1KERHSIDeq37A7uD0s5e
         otO6FwZ/zbJCpbBcnDKuHj3d57v469MChQdgA1G/HXD8lccIwp0SYptWmovo1KEwKGPJ
         ro/w==
X-Forwarded-Encrypted: i=1; AJvYcCVOKzCJPfh9Ten/K/IXmj0dQMEVDu+8wR5WC3ePRpCeUKGYUROpJNDnytKPrRGKGPXSsTM3X3jfXNSwUKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPfvYvsmPfjxt7ghiJAn9+xJORa7mcKG/pWXDC+VQGZtGqnv+0
	mu+qd3SxlYVNj6/MI3vfdsY1ti/cbIIB0AGBAwYcTEqtJC2iLn8i0EjVmXCRRLKkxiBRdMUBBal
	Z2J6k+qAG0DEzXdZT58VF5/tTowFICHnWpPac
X-Gm-Gg: ASbGnctPxzZQhK7GmEG7Vn55bJvpdMbZjXAweSxyBFT6L9IQw1JhDZ92NWS577QUPYn
	PZSitmF2As3b0z1VWhscPVyrtPrASueXVbTI0GiNvYQV7pW4nmCwx2S57gj1hnw5cfm7AgrK0KQ
	==
X-Google-Smtp-Source: AGHT+IFoXLepO6ai4wKh7pRj/x+leDovy+r204BaF7X2TV/MA/xp/VuhUEHDrcfP84h/YEZC8zwopadBUeVx5OtHJ2I=
X-Received: by 2002:a05:600c:4f43:b0:434:a94f:f8a9 with SMTP id
 5b1f17b1804b1-438dc41db32mr93389005e9.28.1738356295210; Fri, 31 Jan 2025
 12:44:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131-cursor-between-v6-0-603bdc7d4449@google.com> <20250131-cursor-between-v6-2-603bdc7d4449@google.com>
In-Reply-To: <20250131-cursor-between-v6-2-603bdc7d4449@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 31 Jan 2025 21:44:43 +0100
X-Gm-Features: AWEUYZnmGqsipiwBCw9u8Y6GopjTGIS_5UiiOrHI0tjSI9cslkqFtYGA5wHztgI
Message-ID: <CAH5fLgi3bXB3=rjkP=pHEuzsdOuLHPcNQW-+Krc8vj56KJSUDw@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] rust: list: make the cursor point between elements
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 9:16=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> I've been using the linked list cursor for a few different things, and I
> find it inconvenient to use because all of the functions have signatures
> along the lines of `Self -> Option<Self>`. The root cause of these
> signatures is that the cursor points *at* an element, rather than
> *between* two elements.
>
> Thus, change the cursor API to point between two elements. This is
> inspired by the stdlib linked list (well, really by this guy [1]), which
> also uses cursors that point between elements.
>
> The `peek_next` method returns a helper that lets you look at and
> optionally remove the element, as one common use-case of cursors is to
> iterate a list to look for an element, then remove that element.
>
> For many of the methods, this will reduce how many we need since they
> now just need a prev/next method, instead of the current state where you
> may end up needing all of curr/prev/next. Also, if we decide to add a
> function for splitting a list into two lists at the cursor, then a
> cursor that points between elements is exactly what makes the most
> sense.
>
> Another advantage is that this means you can now have a cursor into an
> empty list.
>
> Link: https://rust-unofficial.github.io/too-many-lists/sixth-cursors-intr=
o.html [1]
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

> +    /// Insert an element at this cursor's location.
> +    pub fn insert(self, item: ListArc<T, ID>) {

Oops this needs to be `mut self` to compile. Those last minute changes get =
ya.

Alice
