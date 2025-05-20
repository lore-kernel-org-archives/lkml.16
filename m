Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2964D1D63CD;
	Tue, 20 May 2025 21:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747775751; cv=none; b=l/lHQEtIl7EHNwt3zjSM7eKJbJILSRWhaBtbud9Wm6jZiTGpItJT78rNBcrKAm/YhdtOlV8mdzM6cp/Gx2+8xbIG7pMDssszb2lpEy+p7u4ahkf0EeWeNjQIBr0LmTu2QlbBkD+kd/J8Nq8smKkbvpd5hfBMTpcHh9wCVMCtXeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747775751; c=relaxed/simple;
	bh=rQ0v6aAtkhMKUAxjVR9doQu8GjSnpe4bFE7B9ZAOWRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kMEHfFSPOle949YWoTXf5LHiasGiWw35gb1HQgxlPPGGCvha2Gc5GJTefIFe9v0dmJhf2xsmIqgks5uTsjHpwjTgbr0ql7bPouYabFYfdROt3GhQ8qCdAGedmN/Of8ABvFma59RbPD8QkVQWhXOJy4LafJKna9YDfhDN4t3QPJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k19PFJcI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k19PFJcI"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-231c88cc984so6637865ad.1;
        Tue, 20 May 2025 14:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747775749; x=1748380549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQ0v6aAtkhMKUAxjVR9doQu8GjSnpe4bFE7B9ZAOWRI=;
        b=k19PFJcIxxCohYDD4/0pdwkxqjwwYKgT7CDNKTyiKZk5TjtV9JYzDciFaktidH3r9h
         hzsbs+rLPAgt9rEGQCvJTtkqpE0ODZ6KIPGR+tpHvz2PpEeXOTJ6yifW1BghvLim1Ep4
         tPgxJI1/2GdEK8NYwuzTjbHBgVq8RH0m+w+6M9GfN3voXjhVcZywhdwU7cTsDpQEnYjw
         hnKIGyN7R7FH0XoBonmdUo8vTqezgD50e9gtj+dfXiVxu0WDSJ6SbArk32hs7G6GJoER
         Pg4R93h9VXfS7ACXwv9AebDvfDT0k6aMzsTdtBZtJNLr19nEb5aLhZogYu77ECFUd1KA
         YQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747775749; x=1748380549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQ0v6aAtkhMKUAxjVR9doQu8GjSnpe4bFE7B9ZAOWRI=;
        b=aAxTk643VAru0sNhay93T3CMZ47yBz54ayv/uB5LIpNoJzHnCBoE35HPmwk4jg1exX
         spQQ0pQdjOb0LqEjEESxvadmGxCufFAfmDGpF7llJaxTsB5jA/5xo1Je7Uhk29TSB1M9
         7I7NvMP/EegeARxzsQo9BQT5ymB28Cb3DP75Y/kh8TKYz9F2I+WO1XvwOKFVto6WVXYy
         JMwAaD5OgQnblM3vHhiOmHzK6r7ricUnai52ylaF6G0Qj/HCT3a1OeDWjGi9GyPvNtvT
         lbyQcM+GNebf6SpspNn15aacNeNQdyIpKlvarDccaSM+wjwGEOw2sjFL9zuK6m0GOdo+
         /ovw==
X-Forwarded-Encrypted: i=1; AJvYcCXe3iqBlGWqbVac05OP3dzvdIy+MffIkbwe0wOTpI1V1q+plggmhLac5vyGEffZFYNwNn3Dpd/Ho32SDMM=@vger.kernel.org, AJvYcCXyezDp/iSIylK631N8VdaqQoMW1PtjIRPraXWYXqdQxDB4NgIfH4IEbSed8xWv9ppdcdQiSI3c/s8b+f2pbAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLNCcT2YglSx87zI8ND9j35vKqF0375LTzSE/i/2WFoXbHWNzy
	nxq+OVqQ+Ct657gtL/dGXKNXLpC5YYgKfIMShbzE77WvC58KRjfl5NTOaX2vGKU9oVelkjuIuBx
	Rmz+g2ecwWSV4c5Dd/Mxg24MCu8Gb/6U=
X-Gm-Gg: ASbGncuGbm/gxbSdsw6kQWVqA8l+jYqtZLPw4XNeD+wR3M3YMUAFSmQEbJooM0xc4Tl
	ks9zGV4qRr4ezbeZGY7luiQGUcMdlqYO8uGzyelc7Mn8HfODDm4NHT2u1cyxDWitLQdQY5tRMs9
	kknLqfzRxA8b4K/QLZEwde0jhnn0d6Vv84DlWYAxRTZB4=
X-Google-Smtp-Source: AGHT+IGe5cmPDopFk7kzA8avugdNH9Oc/G5g/gnDbo4+tqDroKCGs5KoZRfDCQgaJ9Xn1CsSiuQtgV7Lwhr9LWD0wbI=
X-Received: by 2002:a17:903:2285:b0:223:49ce:67a2 with SMTP id
 d9443c01a7336-231d4502e3bmr89295735ad.9.1747775749295; Tue, 20 May 2025
 14:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520182125.806758-1-ojeda@kernel.org> <aCzwaCkENAiaG-As@google.com>
In-Reply-To: <aCzwaCkENAiaG-As@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 May 2025 23:15:35 +0200
X-Gm-Features: AX0GCFsvA9kp6CIt8sW48iUVHIlQVdVSvDpStLMHCL5PIeI8knACDOJ3Z9bIlow
Message-ID: <CANiq72nQdaZpWmVjt3wqNtZRjibecwe=Lh83mQB0rzV8EjddLA@mail.gmail.com>
Subject: Re: [PATCH] rust: remove unneeded Rust 1.87.0 `allow(clippy::ptr_eq)`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 11:13=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> This commit message is worded in a confusing manner, but the change
> LGTM.

Yeah, I wrote via rearranging a previous one, and sounds a bit
strange. I can try to clarify it when I apply it.

Thanks!

Cheers,
Miguel
