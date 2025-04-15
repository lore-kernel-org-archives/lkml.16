Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F7D204F73;
	Tue, 15 Apr 2025 19:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744744502; cv=none; b=QQJ1+wO1gw+5rzvQobPAVNbUzSj44aFSuuHmyvVpdzSpKCmLVDCSpOfY5fDSQutFxsNmcuRZ5u20QKURlrWaYr4wg+IzIK5dCjDRBWA+72gZCkdEOX9xTgvsVBZii6Z7fkf6AI12S6tokCOdQ9GzkGumvC7s0pM08Qz/2G3fd0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744744502; c=relaxed/simple;
	bh=z0xrkIkCd7ceRKWd4bCh9B7HSXmd44FG6cF+UxyLWp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GAEZZiX1jGK5bI7grUWTVlq6QErol33UVmyHWgQ69FYydBRIN+oKDBV4UKMnmfw1fE3NfopjdkZz5nAMLqJggpqmMoGFCZ4M8AyQDiLN+IZ4FnuDM/448tx7N2MHsyQlHcLci8bd0dzd1SKC54tN+2nJTP80q3tdXphK9PPQpfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHWKzUlV; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHWKzUlV"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ff53b26af2so1034065a91.0;
        Tue, 15 Apr 2025 12:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744744500; x=1745349300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ntkk2EuJ1XJRKx1RttSweaGGZM6MW37mEH+h/pvePak=;
        b=BHWKzUlV1FeA6tUoEtyXkhWN0g7Exv4JNQ3T9aim110XuLjC0cEvuy49C4ZEW7J/In
         eBrgwx+d5nPbjTdAK+0546zfEwoW9Q5XQE4RcQGO93CfT+gcpwMZBxfoxTZHUKei9JAJ
         HE9mYh3TN1Ot1dC+nDWsBdhV/ed8crR4iczaxCIP398ZK400EHgK/7aTvSwEuexht9Ca
         V8E+7IacVLiHb1Bajmpxkxn//luNPv/TFQdgLY6EXU4rp10MMRHfdYpVWxH5UWeUmaWk
         /UKZuqZVdnwC2nU6z1YLU6uxNXyhl/aCjby7BTxMj/i9BZn16KbeqdEmz50oSMHQVIby
         6Ogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744744500; x=1745349300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ntkk2EuJ1XJRKx1RttSweaGGZM6MW37mEH+h/pvePak=;
        b=sW2gX0MX2UXSqfYknEXiTYGQX3CDi2esq1cRKwsjzNO8F2nW7b858gNi4rLQFtzFuH
         0Rtz+s3rCnPoqZ1sld5zSP786jxh+8fttXgYr/gsALYNj02KK0GHIpE6cbCA7bAn+4lL
         rfotgrIEw/aXiPQEy2bmb5rUq4vl7abdTeX0Aj3vyto9sMkFX69zrDNnYpJ/8pjFj0Qy
         jisnYLwDY04s2zJaJk9N0heR1khYrR5VBHSqTCFdJ/i14uNQdbXZOiEV9voQ9Eg9Phh5
         c2dwE1zZjEvm53VhqV0f10Dv+vnxWcpI9Jap6jDv/t1hRk9fvhTseCrSWiQVpYsmoVgh
         YYKw==
X-Forwarded-Encrypted: i=1; AJvYcCU14DNT1azAP/qTbuhea0UIfaTr2FOhQp0Kkk91dAGF2ijSr0iLMjC4MBpW/To7RnOaQlOlt08QvxPlPbo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwytHnYxTCWhVXyHB4xApReBU2H517smuzbIRhBNyhxyCgkz14I
	3fG7s/ZdhcxWjQ0hYAZvP0EjST+D1lTk8xStxiClS4bZeIFtTsvV7ZPWfCQv3jxjDkPdIM7ZcLV
	RaVSNT0KhXR7jIhwcAkVedGGyJi8=
X-Gm-Gg: ASbGncuYRzBE1JV2NELmR96A5PwoM/ZBH4XxqMxypeIr2nuEoi+wsaTCwu26TivsY4Z
	EpnSSi9hhXI1UBq5iQHUsjurM4HmTa6P3r2iq/x8QR5VQPolhOEkRSbDfXHDfwBUrVr1tdxAyQA
	WaWsGFHSWafx3CBd3IyaSKGA==
X-Google-Smtp-Source: AGHT+IGc5DVYt2SE6BYaqtTqo6hk2/0tRd0JrYscIn68HrcFugnLC6Gj9XZ3iEbYFgiGu0SCjkXVZRFhjUt7k/6oerU=
X-Received: by 2002:a17:90b:17c2:b0:306:e75e:dbc7 with SMTP id
 98e67ed59e1d1-3085ed78171mr234636a91.0.1744744500072; Tue, 15 Apr 2025
 12:15:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412005341.157150-1-fujita.tomonori@gmail.com>
In-Reply-To: <20250412005341.157150-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Apr 2025 21:14:47 +0200
X-Gm-Features: ATxdqUHlXfvqgCSoo4-vySZAgrgL2xgqbfG1d1cB0y3EXvoKuokh17lk5we2yzg
Message-ID: <CANiq72kKhkVRAmg26DNG=Q8-s_+zkz8jVe5MZa__9RPjRs7f6A@mail.gmail.com>
Subject: Re: [PATCH v2] rust: helpers: Remove volatile qualifier from io helpers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, richard@nod.at, anton.ivanov@cambridgegreys.com, 
	johannes@sipsolutions.net, geert@linux-m68k.org, logang@deltatee.com, 
	sbates@raithlin.com, dakr@kernel.org, dinguyen@kernel.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 2:54=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Remove the `volatile` qualifier used with __iomem in helper functions
> in io.c. These helper functions are just wrappers around the
> corresponding accessors so they are unnecessary.
>
> This fixes the following UML build error with CONFIG_RUST enabled:

Applied to `rust-fixes` -- thanks everyone!

    [ Reworded for relative paths. - Miguel ]

Cheers,
Miguel
