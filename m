Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9341A289340;
	Mon, 14 Apr 2025 16:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744649108; cv=none; b=FFQ3htaeNQHHIwjaJbTsZ3VjCeIJTxgn7lLj9ydyjJfDBsHZZH9moP4BENE9T3eFfde/J33WYkgzc1GDbGN6hLfh7jSL1Pi90nXBjPWEe+ydgxCXCKeNsqM1K3Pfp3jnsG/Rg9h5zeIklHpP3GrE41e9WRID20yKpa1UxNn/QoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744649108; c=relaxed/simple;
	bh=CyRmz6WDnLlgE/Au89ERUZt3OIYiAJnvydjXIw1skME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXElyqOi5TuT/y+RS3oHFnsar2eyvGbjLjkxSgcGlsPg6OFe5mid7D0GNpUNM2mnyu85kGhWwXpQZnOx/1Z6NqBaaeRxnxrj5D8o7bvLT1Yil8fL/w7Z5UFjaSYlinDzyPRLZK9fz6hbYCcPX3fs3ftlKUn62onWWpTZFZbDFzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLjjFtT0; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLjjFtT0"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ff6ce72844so849775a91.2;
        Mon, 14 Apr 2025 09:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744649106; x=1745253906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CyRmz6WDnLlgE/Au89ERUZt3OIYiAJnvydjXIw1skME=;
        b=dLjjFtT0BqdIHXpMLrPbFKTTx3/APgx/zgrgg5/9xtD5PIkJMf1BPhQNMEiXSJHqYN
         iZN3U437zC/AO2BSiNQyIQ3htV5kJ03zQWVgqBT2XLu8nJEGRWs0YbDm5+HV5M9C1T+3
         XYY4RGL3nxF8QTXuNKstAc9eGviX5GPWAE56q1iBV/INDsQIIUuFRuhjQ4+HRQzK/dTw
         nL14V3+uVgQmZSvEdH1oaXS1+Dz3I0ZcoWh6ZEYNZRrmY+OxOWcEQpiEVFnd/InKPqnK
         /x+BVtqVpWuDT4L1R88437lh0rce+PSSV0xVWV9J5fJtxu2sktx6TLUkDW6bvI4wwG4U
         wrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744649106; x=1745253906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CyRmz6WDnLlgE/Au89ERUZt3OIYiAJnvydjXIw1skME=;
        b=JpKYw6v54FDajcIr0ZBboILak/UHF1ndXnOBaKS+cHoEVJe+0ffTFqVvHfCCLKhYIZ
         D4bLGiUW14LjFk2CNR+opTm8DGoC7GnjffFFbxxd//+v3O1p0i47mnWr3oyYAGHu1/sI
         baDztz77BDgn915e7RswRjoo9eJFAtIgKIqk9SgHV18+80uOjlXKW9Cxsjkp8IfTrCjG
         DQdAZyvlKjCyamshHu7Tpe7hy3SQP880ief5xrJBLCjRaG6oYOZOpi+vaLyhwR0Jd4kR
         VafPs0fCRZfmMECbYUtTEo0SiZxPCbSq+/mm6Iy6s5YJ20VVWUDQ5C3N2wea32DIZG9r
         3xrg==
X-Forwarded-Encrypted: i=1; AJvYcCURNjv5HPvK39/Sfvyqe4KwcbY1Cj+ADVqgTju/QngjqdXyoH6GkjMH60VZCl5R/0qxfDvG48KusQqFakwUir0=@vger.kernel.org, AJvYcCUu4XVHs7tsBXLiXVaKSldpiRjgWmijLMMrMtPtsQ09L+Jw5W8xomybvsUWieMoRBpCGHU4cXMIGSzj@vger.kernel.org, AJvYcCVHXWLd9+ytwY2AN/Kn01PyLnA1zp2ck0tQjNBZXIBjf/BzLgSTqPRJ9BgQde9ZUyWbYUTyx1ah2HXnRazu@vger.kernel.org
X-Gm-Message-State: AOJu0YznnfYAyIC9S1rfZLihsm7Lr6uXyQDSv+XaCR7yWy48aU7v53gY
	4bhdmu5dKkTDCk9aIiKEXUCra4v/k37fDXlNJq06DDusk3a+lpy6mQN0glQBsnuaFYWtPf5jDmG
	ssWvy+flKysIt28HQaTwsw67YC4w=
X-Gm-Gg: ASbGncvrYwJXD43KVazbt7VkvUUfcnmtxbboMILaV6NhbAjYxUI8bB2I3Kys453NfcC
	/GDOs58wclEeA5MSq393ZAjxdKrv8U/LE4h9TeRnTILG1pgAe404WVFamt+RBCS+iSmCQL6+8rq
	+XuRjP782KFbOnxsi1gu/80QcWTeevFBop
X-Google-Smtp-Source: AGHT+IFFO/6s6YgrPEO3OnxOg96c+7vd2ZcP2QQOQbeI5zAqmfo8OAJafhVQhOHi2OQPh5zM8jjw1Stv0z3LdLO72T4=
X-Received: by 2002:a17:90b:1a88:b0:2fe:b2ea:30f0 with SMTP id
 98e67ed59e1d1-3084e75a57emr284165a91.4.1744649105757; Mon, 14 Apr 2025
 09:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326171411.590681-1-remo@buenzli.dev> <20250414152630.1691179-1-remo@buenzli.dev>
 <CANiq72mJubnGyqSk3sqKVa7g9HvnJvmRg=gJ2kaBtbMMVWWC8g@mail.gmail.com> <D96HP1UV49SY.1U1BFA14P8XHE@buenzli.dev>
In-Reply-To: <D96HP1UV49SY.1U1BFA14P8XHE@buenzli.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Apr 2025 18:44:53 +0200
X-Gm-Features: ATxdqUErYkDDBOGFPEFB-nfL3C3C2TIMbtTywdzeB3ydwzNNRQdwTBq8nO3zs6g
Message-ID: <CANiq72=ru+M0W2Gw5bYD4zMD-mkMU0He-tAX4Tna9g-ddbC-0Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] More Rust bindings for device property reads
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 6:07=E2=80=AFPM Remo Senekowitsch <remo@buenzli.dev=
> wrote:
>
> Junio Hamano recently wrote on the Git mailing list[1] that he wants
> his contributors to do this, so the original message-ID can be used as
> a "patch set ID". A quick glace at the archive[2] confirms that people
> work this way. I assumed the kernel community would appreciate this
> as well.

I see, thanks for the reference!

I don't think it is a good idea for long series, given how some
clients render things, e.g. GMail just shows the new version in a
single linear thread and it gets really confusing.

Even in a nested/tree render, like Lore's option, it is harder to see
and/or compare the versions, in my opinion. Perhaps Lore could be
improved here (e.g. offering (auto-)folding of versions) -- most of
the time we only care about the last version (and perhaps last - 1)
anyway.

I think `b4` behavior of subject+author works OK, but an explicit
change-id would be nice. Reusing the Message-ID for that would only
really work well if we could control the UI for everyone, I think.

Cheers,
Miguel
