Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7081C19D09C
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747388887; cv=none; b=G1evqsRhB7FDZDAnmrmHdZXAw7+19xQKjTbAdM28ZnXmuHDBPg8AA+nboICaQwY9RhGeYSxw50gLI/wX5v2RNfjtTblA9hiE56CPbMBsePkhw+IhLCtxi1ulwAWNDD9Ox4gdFCjc9s90wYCm2gpK1NDz+J3SI9tcBY0W/cd8jeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747388887; c=relaxed/simple;
	bh=W9yiciXbWFwESLz4lZbhQMYlRO09ym6rv1NxjEABbXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=En3uD6cLi8lcJaA/eYT7EP0i9B8KWeJPKKkdhJc3hvMZcdebQR55XEvDx11ISleQInDeZJZfut9ixu+B3C9WEiMoXHnzBGarrKmceMUvg6Z6PWcvWXHk0I100dei2hURjF1YvHrE4GfLrxv7KigE6/otv4gfHJxCg3jpEGUkiDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Wl7ExH/k; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Wl7ExH/k"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso11224105e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 02:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747388882; x=1747993682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1o7lm4gr/IyiRMX/+f11iAYJHPvnzys+snbbXOa+wNA=;
        b=Wl7ExH/kpVn6SDZrUcCa346cA1azAB2FRz6InUXniVc3Mm4Lvs+Bzk6fxfnuPniFvA
         0WjqTP3mpN9cfoY93zfeE21TOYjjEhQAvve0GfNZjkJ73A5YYGbbb/grIL5B4M9spQfA
         7r74sDAIrgeLgbBCAXhTe4tdZuM61xTkBtXgWUU6FI2bY8KbmMbngv9t0qq7E9zMESvz
         uD7P/nX184ZOQM5tKb9wobuNVMWCVLFx3ZUW8/v1CwkgxZK98AIzKWcJmvmraGd0vUaG
         dWCWWBr4TINBO63lpAcWtRDVzb4z8yIYHqKnfGNlyiF07/USPWcGot9+96d6hvmyeosz
         cKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747388882; x=1747993682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1o7lm4gr/IyiRMX/+f11iAYJHPvnzys+snbbXOa+wNA=;
        b=v4ElshAeQOTtNGj/894aOuNAj9g4pBZXpG8r+CnQiMolrs4sqX/CQZZ45rXkQrdQkY
         URvIX/AsGhKnizsfBQraPEo6xBf2SKGR822nkBlkx+o6DevpumlYmicFuZUrYXn6jI2g
         PmMW0V9mW/6aG3gnfhiBX5LGs3etahyUWw8Brzee83XTmR9rMW1/dlvu0XLpYvVLD6iT
         sccpYOdYm3X8rw6DXEhMiFcGb7JZboIE50GKHe4sg/I4MeAApRV26+9kAcQhpHpkfooy
         rCIyfM9tM5fgL5bTMppBmJPlajZE+3T5UVWRrWeK/MjXA6uqMZeQ8JeaXCwJVaYSQinL
         uaXg==
X-Forwarded-Encrypted: i=1; AJvYcCUjKCoLVhiWnrEBu+kB78a4KSll+IRsrgFAkvz8Q9x21gBzkCpj1k14GDuE8TaTK+r0VG3Ezhcqbrni/dU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwerQQAZgf+cAjftbMSum8fCafvG/kuVuUr8ASpddMs1IEh+InX
	OPWrwphW47nZ26tS1EFfd5g5+VAXmQXHtNTnq91WUareiR7XVM/ipiVqcaqIWROzudksAjSFN3o
	7hVrv
X-Gm-Gg: ASbGncuYSBknTBPPKsWNEUOKf6h7tmg003Mjz+SPtRUIn3zgRhGP//+PfPokhUxWXfy
	s28V0xbCfMNSZ4DeO3COcGXQWSREzcaUabijxbo269n9+72zIBQfubvah7SAZjrkNLGMCLE2tuc
	PqXSB+gEe/pfTNvmSRza/g3kx5SVyWWL6vrnHl1oVHjYuRShY1B1S0IiR/w2QBgtLV94nv593FY
	1L+V0pGyB8v5v33SfiZ41Sd8tEBUR5D/d4Ip4ANKIwCSxJF3WSO1L4bxnasffp+7Cg+Al1ZMw9I
	WquofhKAL8z1qKSwHCeJDb+l8cCxPJ4HvbcxxfM3l+bE8k5AHa8drA6mp6SiR+04iUnDTm8TxdA
	XPaY3CCxw1oLeZ6Aczw==
X-Google-Smtp-Source: AGHT+IEa9rVKVe/qm3F1BdozCJUZfiqzDLgpfCsXae50LbSS8/KfRVMyVFH3BkKinN0aJYn/T+9iaw==
X-Received: by 2002:a05:600c:4f51:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-442fefedff9mr16219475e9.8.1747388881641;
        Fri, 16 May 2025 02:48:01 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442f39e8578sm105125315e9.29.2025.05.16.02.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 02:48:01 -0700 (PDT)
Date: Fri, 16 May 2025 11:47:58 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, Nicolas Pitre <npitre@baylibre.com>, 
	Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH next 0/3] lib: Implement mul_u64_u64_div_u64_roundup()
Message-ID: <5e7mp3nreaadppjhxhpffyff2d2ccwcjf2suonxe43eofngddu@qfufr2wiw7yn>
References: <20250405204530.186242-1-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="muvmm3ueazlwdz6b"
Content-Disposition: inline
In-Reply-To: <20250405204530.186242-1-david.laight.linux@gmail.com>


--muvmm3ueazlwdz6b
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH next 0/3] lib: Implement mul_u64_u64_div_u64_roundup()
MIME-Version: 1.0

Hello David,

On Sat, Apr 05, 2025 at 09:45:27PM +0100, David Laight wrote:
> The pwm-stm32.c code wants a 'rounding up' version of mul_u64_u64_div_u64=
().
> This can be done simply by adding 'divisor - 1' to the 128bit product.
> Implement mul_u64_add_u64_div_u64(a, b, c, d) =3D (a * b + c)/d based on =
the
> existing code.
> Define mul_u64_u64_div_u64(a, b, d) as mul_u64_add_u64_div_u64(a, b, 0, d=
) and
> mul_u64_u64_div_u64_roundup(a, b, d) as mul_u64_add_u64_div_u64(a, b, d-1=
, d).
>=20
> Only x86-64 has an optimsed (asm) version of the function.
> That is optimised to avoid the 'add c' when c is known to be zero.
> In all other cases the extra code will be noise compared to the software
> divide code.
>=20
> I've updated the test module to test mul_u64_u64_div_u64_roundup() and
> also enhanced it to verify the C division code on x86-64.
>=20
> Note that the code generated by gcc (eg for 32bit x86) just for the multi=
ply
> is rather more horrid than one would expect (clang does better).
> I dread to think how long the divide loop takes.
> And I'm not at all sure the call in kernel/sched/cputime.c isn't in a
> relatively common path (rather than just hardware initialisation).
>=20
> David Laight (3):
>   lib: Add mul_u64_add_u64_div_u64() and mul_u64_u64_div_u64_roundup()
>   lib: Add tests for mul_u64_u64_div_u64_roundup()
>   lib: Update the muldiv64 tests to verify the C on x86-64

I wonder what happend to this series. I'd like to make use of
mul_u64_u64_div_u64_roundup() so I'd be interested to get this into the
mainline.

Best regards
Uwe

--muvmm3ueazlwdz6b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgnCcoACgkQj4D7WH0S
/k6J/wgAt0QlUI211RhaxikR09Mc04wMY0JBljO9vugTluirsnJiZl1k7p3b4oVe
gSS/l5pfQQDopT+5tQlXVIb1uy4SQP+1ToUcTNUTcaJAP48oRdF0C7ggvYyGmyM+
qB0Fg21wqIQBtqHZK+DU2JV/CLpQBc8xbf51CcZ7ut9ayfpRuDKi/A8QjIJsLmRg
aq/JEjS/chl2noJ8JYRjAC8L6FInzhigdIQfVaDe9HsC0RhYhtFHcFz948KnpEjN
/BWDNfZOn91rArQ1fw2s/vEi6Lx4GXc/oR1kCHm7q8zW/TYd13RixybR7p1BZl9+
OUXdD8xQ2WHfU62LGUiBA1YJajrycg==
=pgnw
-----END PGP SIGNATURE-----

--muvmm3ueazlwdz6b--
