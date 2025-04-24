Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E102318DB1C;
	Thu, 24 Apr 2025 13:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745502560; cv=none; b=baFssKWrS6taSd/a4DTSEF9rDzLMjAM7FrOG5xczJTTW7DS6sLGUkELyPg8w8cBhsk32EqIrv2JiuJBh41vd8o079KocgxoE69srMFX/vnNVLlZowaoNXm2oy/2ustr6g3d+dRTCuA0DItabWLV+2vEPW765/6RshBssit8x8f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745502560; c=relaxed/simple;
	bh=a6IlIu5crZ8VhdgffKVwjTQ3X3e7Sqib4SA2QpI0m7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=elVGHNv7Y8rCtF5kdmXGjkCcaunKuNIqRVhy040KAa8Yqc7WtY+ApH9PeoRPch73CZdFeGIKIQv+c6iRVgHhLFlXe9nY3YEPj2SzpNgTPCPwggJb1duLRpqSIeuTwZ0svk+lqh5GHScFx+8k6Fbb7SPryoFS6wPA3RJTBI8WSIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOxfRY1y; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOxfRY1y"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso10135171fa.3;
        Thu, 24 Apr 2025 06:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745502557; x=1746107357; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6IlIu5crZ8VhdgffKVwjTQ3X3e7Sqib4SA2QpI0m7g=;
        b=XOxfRY1yXRkHxcEXqqeQ3C5ysnRdpxpten9Fl6N6r8NhqdtfyCR9xchLoUqB4P1bkk
         galX656ntV+UVi1XcYqijy4/T83CuySXP+Rr+U1gOb+iw/aggbZB4gwcN1dIxSNxVBP2
         jWZMHtcSQmGdOeFcW47yOrw5y72lGBMIxCs4y9QGUFp7+fTFx7WiV0XGVNTZeulYwBHo
         pbZ8kxxwXGsUGqpBBWSPtCEf6s/qSk/gmvSbvMp8GKCQGnDITqLJIBba3cEN+fVNeKii
         1YpHdRmLdnrIYR/m/OxqvNMHlRYhGkYbA0KZ0anYVcBvhTi6ShxkEXqhGZZo3xlx/9B1
         9SqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745502557; x=1746107357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6IlIu5crZ8VhdgffKVwjTQ3X3e7Sqib4SA2QpI0m7g=;
        b=rFpipuizPLU9fAAffBZPXVQpMjuMVJPh508I4Uj3vJHgL63gbSogrcpqMXpyrkrfmI
         PiDTRh5Sr1fM03vHkgXSD3JnbauQHFEVfo4Wy60/dn9WijVxFbckzSVraKj/NcR1YDwP
         PaC+UgzXM1oRWpTMdaR7Le1VMdNFstxsrcwf7EtG78zhVFiEJ9iPm8/a4mlpJrvsPto3
         MjJRGd6IjmsWfjpCecU/Wspb4sqWmOATQZ4mHdrXoqw/0kB/is6KkPPQbaiIVW59leXG
         Pow9ZZA5Ydhobrf/3ZyoPNQ2Fi6pmJBBtzQCVwPXSvYFQLGXrd/y0w9aVmnvfeYUs2/y
         ZSIg==
X-Forwarded-Encrypted: i=1; AJvYcCUxL/HD1mKblsbNV1cvoT5pkEWPrUzMysLGVBsYuVjXao1ImzIxj/T12DTyatYWIngj5RmB2uCxDVrISeruhUs=@vger.kernel.org, AJvYcCVO+wT9qen6XDVlkurBsDHRoqPSxHT7p8gclUTqAUbojh43GucyvYQTgi4MfMm+31+GbnJ4Pkx20a/a/F0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/oNckVduGjRfQCk0WAwk2TK26mKlXnWg0Gmcop5tvZ/bjuS5E
	oNt9jrAi7K7EwAuJNc+mTLGOozOeTaEEyUGF8fcNiWoe/Mh9e5vkL8ZBsarUnQIbl4N9a95lgNu
	913iQLz0JdHYKBkBeGYPmS++oBvhRNfijw9I=
X-Gm-Gg: ASbGncuqEiSRt1YryWj5+8/v0Q+9OAhJVBmglP6BRjRXhh+zJ557RqQqrxGQ8aJP8Ok
	/cFRLqaUfRmuzvkW+YS6ztVVUl2/18i1n+7HCJ0MeqTSUM/3PAXcuvAJmuoVPgXbV26hGnghfIZ
	KoW2Vw9qYfPF1muaLviFEegQa180BDTqBysSilLQ==
X-Google-Smtp-Source: AGHT+IFaBBzDgQCRP9I0AhxFpr6hvM7hKOoOyVn45sPNxJN8dNF8T/ByWvBbSaxUdlh0GQz/8+eY4RK/feQJZmA9qus=
X-Received: by 2002:a2e:ad10:0:b0:30c:c7a:dcc with SMTP id 38308e7fff4ca-3179eaf0d3bmr11152151fa.20.1745502556546;
 Thu, 24 Apr 2025 06:49:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
 <20250422-vec-methods-v3-2-deff5eea568a@google.com> <CAJ-ks9n5qzUBinofbWsrR7CH6zjqtB6QCs85L0JTzYw7JGcxbg@mail.gmail.com>
 <aAolJBv6RMvsmZ7b@google.com>
In-Reply-To: <aAolJBv6RMvsmZ7b@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 24 Apr 2025 09:48:39 -0400
X-Gm-Features: ATxdqUHSltlH4YGAHUykeOEd9ViX4WserM8doqNeVap2ToOViyuMhIhcvO1KzeA
Message-ID: <CAJ-ks9kR8hF1MOVLxzFPp7kesfafMVtku+GzDgyOuGg82jSLpQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] rust: alloc: add Vec::pop
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 7:48=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Wed, Apr 23, 2025 at 11:42:52AM -0400, Tamir Duberstein wrote:
> > On Tue, Apr 22, 2025 at 5:53=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > This introduces a basic method that our custom Vec is missing. I expe=
ct
> > > that it will be used in many places, but at the time of writing, Rust
> > > Binder has six calls to Vec::pop.
> > >
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >
> > Could this be written in terms of `remove`?
>
> The `remove` method has a lot of logic to move around elements, so I'm
> not sure we would want to do that.

Wouldn't we want `remove(len-1)` to avoid that logic anyhow?
