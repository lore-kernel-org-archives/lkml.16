Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B3519049B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 13:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869924; cv=none; b=UQpI1v9l0KPivLen34HF1Z4qNPRHk41PDwm/HZYWgvH+y4XOK70NKIZpaVqAj070Ps8l+tJymswRLa1S+RVI5deClOE+EImcFxOhQDJ117vzeUkyTZuNgaUHfZXTMf3kNqQesiK33Z+qiDE23K6maCAiDwdFQgM3qSDaVafoNyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869924; c=relaxed/simple;
	bh=CX/1iDHPVy0wwNWQINXFXHbW7tkxcP7a0WOFWuDfRgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DZvGCGjYf32hryi5Bk8uJRsW+uUWKqW+2SBsYWBNDYVTsmXp7UbFFQOf9s9iPOpw+HC1FrHY5Gt8GHvMW6X3TNbNHS3y4w8okgsj1O6Wr2ZyW1LxkEJ36ymWl+taf5s2TnQsOnedBxV/cUiBrlFiqeTgrF7wkgxloQ3Tjs5P84A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FKGNOYzF; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FKGNOYzF"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-735a9e65471so2649398a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 06:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748869921; x=1749474721; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CX/1iDHPVy0wwNWQINXFXHbW7tkxcP7a0WOFWuDfRgY=;
        b=FKGNOYzFxWSD8eO+5/EEi2aq04AxbBY0foZDHshun7bGXVSRUaOgkBLNgzi8dBSeVv
         duXUyiEcGz1iR8wMFkM8QLP6vOSWakVhlM1ay7dotKKYmIp+II3l4CmNqC6wWEhnMZaJ
         KGBE+cgGcb+GWYstbLV2rDN2rpBJkK9Mrvp72rmL7g7T7KIAb+KXsB4RQV8C4JGFB6zq
         BYgHheyywqyGTR6cftiNW9ASpTyPMLgB0FaFy0mkQ9U9u2tqjZLEUWX0SfguWkdsNf8/
         +KJAQt4hMYvcYyv8A7sA3hWUasFYFsf8cIEK4s/GNBxzwJjeylppS2FTQsokB3WDvC57
         c6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869921; x=1749474721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CX/1iDHPVy0wwNWQINXFXHbW7tkxcP7a0WOFWuDfRgY=;
        b=ICJL8OP7qcEmXcgZnX6H7hoZc9lVvbBkxb7iqrd1RbLr8G3uk4WdQ8aEsOs5YW43g7
         hXEya0wY8h6ImVVT7Eef1krw5Qri3mRDcmUUS5cTKOQTzEQBVvlX86KVOioFR6Yd5KFp
         QJJWOwyJ1JQrIAjzOSqBSI2ToXDQelDb1dSU14cLKCsxWHZ1KD/BKWWlNjiZ8QQtVGeB
         78E2AGf9UAffyEK3n2jzAibrMfB7/+dpKbZ6RFQ24PwppgkmFX8BeEjB+DEXCGrkdI4P
         jyZS24VNZ8s7jxxSxUkiQCsvfT3RztzGSRWsxFxFilaHaJKIt2RjjG15RgipBulBy+cb
         FRHw==
X-Forwarded-Encrypted: i=1; AJvYcCW3URyTDK7Wso7qpaNoo6Ox3nEFgzR0n3eWAc/lU1yVSkEzyBgYM1RHwVGqtaIv+k1WkjpSe/l7cqNa2mc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlzgaxv2A08q0kXQ/8yXsnYICD94ze4cEUxrvHyQFGvJqMIsat
	FrjQyqQ9Au4XYIBJtmyGgZU2tOWxUWGXpzR8kiVQBiByG9OtZEtGRH1YEM0BYN7kMRSqSSBnY5h
	HlZBagLXKMb6ARQwZghS+7Mn384e+0uWPDa4vLEcm
X-Gm-Gg: ASbGncsqde47gp8dZY8ViiAeuDEEr+9TGtNc39bRarw4LS9NPCZIOF5VdYGNS+eQ16K
	mkiCQ18i0PdfpkliViHqbAbx1iboH1+H/M2L/C1YHayM5CjPMLCIG6qpqQQf3SJhF7MmwOaKrzV
	WbrzKSaAKoXdrhSJIgi1+Vu3MmRH7710WbpoyZvI3mFhl41qJZ9lnAIBBV1x8d8NPLDFHUo8iEF
	w==
X-Google-Smtp-Source: AGHT+IEK3NdAWPeTFVYBHSzHkCcveg60NzsP17so1/Ky5+fflhuk++j9utkshWE8HYwfmNNUeec1s+X9NdKXYBaSM/4=
X-Received: by 2002:a05:6871:7288:b0:2e4:140:4b1f with SMTP id
 586e51a60fabf-2e9212bf665mr7498721fac.17.1748869921028; Mon, 02 Jun 2025
 06:12:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526150141.3407433-1-bqe@google.com> <20250526150141.3407433-3-bqe@google.com>
 <6835eaa4.c80a0220.2baf57.d14b@mx.google.com>
In-Reply-To: <6835eaa4.c80a0220.2baf57.d14b@mx.google.com>
From: Burak Emir <bqe@google.com>
Date: Mon, 2 Jun 2025 15:11:48 +0200
X-Gm-Features: AX0GCFtdTIfbdTAKN2zMtULvGWz-LoXbR6AP_RXTCxaczWNvuvasR0DxMgkYtdo
Message-ID: <CACQBu=XJ+21amU2tEkDYFO00RWt8PvOXsU173ZO_y3u9xmWUHw@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] rust: add bindings for bitops.h
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 6:39=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Mon, May 26, 2025 at 03:01:31PM +0000, Burak Emir wrote:
> > --- /dev/null
> > +++ b/rust/helpers/bitops.c
> > @@ -0,0 +1,23 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/bitops.h>
> > +
> > +void rust_helper___set_bit(unsigned int nr, unsigned long *addr)
>
> Why "unsigned int" instead of "unsigned long"? The C API uses
> "unsigned long" and in the Rust API, you uses "usize" for `nbits` and
> `index`s, therefore using "unsigned int" only introduces unnecessary "as
> u32" casting IMO, am I missing something here?

This is certainly a bit confusing to me.

As Jann points out here [1] the expand to asm macros arch___set_bit,
where `nr` is indeed unsigned long.

There is also the constraint that a bitmap's length must be shorter
than INT32_MAX bits, but that does not matter.

Being consistent with the C API, including parameter names, is what we
should do, so fixing this.
I found the underlying C API is just hard to find for these macros.
Thanks for catching.

cheers
- Burak

[1] https://lore.kernel.org/rust-for-linux/CAG48ez1NM7B8Vk7GOwhsitCipmfHi9e=
K6JNb3ve8aR4m8Cj0gA@mail.gmail.com/
