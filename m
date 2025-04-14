Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C635178372
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658311; cv=none; b=CiZcTDae0anjdVdLA7YZ+fdXReDJVQxidpXkYQXXCUDg1VCcsFw6Zx405CrKvb4Am9Qo6Sct5NnHAGXwQ/Sw55j2+qCN9dJ+0m2yw+nUbWQ2xhMcCqGJ67iVtYH3OxmSwdAGHhULoXAYtXGAIGgtA5QiRUiTksdSBfTO2P5DjYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658311; c=relaxed/simple;
	bh=dqKdkTABciNhW3yvbh0oiFYJfXmwI7YcwWQ1NG1iQJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ued6Su6IAr3D965lW12WXkKXsr343dJY9CbzzMPnfpkxoaRJkSovwL2SYC3NosynN/2u0JMxGf41HOX+zkt7J1dlFmLhZJgwx5e7wqYapBVj2VN4qHlgCesH0ydxx9NkRSb2Lr1JehcvLlBo1A/of2fBLVuvwwCfIL/ou4FZeZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMuuK+rf; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMuuK+rf"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so6889496a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744658308; x=1745263108; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zkwNGLQjAi5dq/rfvJeUTnRF0UCBvbpt8nVJfOUF5PA=;
        b=HMuuK+rfUmOYR4aBiXDkS1TdElCGpzsVMAGXCimoAAKU+nMpJjdIDIGhRHcv899yAt
         E65zr9R8u6VI08fWes/jPkRB/SFYo1jySaGurapk9W1qKo2MXld2h7wu5tkokzKaX6rk
         UfEaojya8KcaUd4mF4ZHe75OC94hfr9xO5gqVn71BMjqv61QslwLWZXZQZ8RnCDfbwrr
         qY5jLOlnuDdrnMDDFDAD++E8bdb8Dtb5OV4QCOUEzHP7Q6N9VqkWApuYfMTUq0YI+pbu
         g+sfgZ25QWtF7wpyNXRDl2uYAdvDJECaf+DKgHr7Ma96jjqR7C+0IMfpXnAgI6tnzF4Q
         RbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658308; x=1745263108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zkwNGLQjAi5dq/rfvJeUTnRF0UCBvbpt8nVJfOUF5PA=;
        b=L5nRSIhp1jYGeKGEYlllF6rVIhg/ruEjO/vHQBvSZc7murV7WTzX3+Y+n85hfrA9vX
         nKvvmIaqi6Bq24aNuw8LRv1Br1WUQht8PYiKwfDTkib4/CEj32QI591YUwIWNKXiuGkV
         2A31YlFcNiO8+9moJtp/mc4n2MfQoWJgpmLllRcMWTHlRZjKwQSqg6zkoBfNmB39HE0p
         GDgxrOe+3pPRwqMlGZSrGJ2f6DBBFCx3x9gpApgUIMaolVvnZmByYTVOXvKxhMrs7GoR
         x90GTZt86V0CR5olqW8HFSG+Wtqa5H2k10POmgT6BrJCj9ff8KeAn6cS1usgLoXZsdQt
         OWqw==
X-Forwarded-Encrypted: i=1; AJvYcCV6WuW/fYB9kjKwJ5lenJtFuF4Os1+ITZU0uBVEuhwtGx9z1zOfvugpbQP/0PgL+qOZ6j4bwni9xX2nh4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWyuT54KRnOwwy2mMd7wkW6Slmf2plSLoCi8ZJhEScbPa2QIZE
	Yi1xyxuFIX+K/rgGtSBKk+j+O23c1qVCSrr3AQhnqoaOlUVu7HII6PDeIC6ceJaYubnN+ZI03fc
	/wtQ7JL8gSk9Lom+qz9O8haZpVyU=
X-Gm-Gg: ASbGnctkq1bZ/xXi4QgPwRFy3x7rK+BBjbCxmZXS4vsZ+gxvpWKAJytMS2Ql+bFZQXL
	KcSrMCATrl61ZD/ySUJ1et5DKJoxn1QhJQIgOTti5ro/xHHXY3Q9F1E9zr3m+56Ubr51Stn9HTe
	ok4J1eymoVwLG9Yjp6gSNmIg==
X-Google-Smtp-Source: AGHT+IHB3AJOLyRSnuC59KKfRy6KmAWnfPnlKtlr14R9euaoSJrWL6uS7XxftiV2oLp9SfzLug3QNA9u6RHBz6k3MTQ=
X-Received: by 2002:a17:907:2ce2:b0:abf:4708:8644 with SMTP id
 a640c23a62f3a-acad3595004mr1304319766b.43.1744658307614; Mon, 14 Apr 2025
 12:18:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKSQd8Ug3Vk3A7eE6nB8UbhmOBBzVpfAqDYLf35Ym444MeQRdA@mail.gmail.com>
 <Z_0oWnbcjsekHXJd@gmail.com> <DS7PR11MB60779A14A91C73D04CC60494FCB32@DS7PR11MB6077.namprd11.prod.outlook.com>
In-Reply-To: <DS7PR11MB60779A14A91C73D04CC60494FCB32@DS7PR11MB6077.namprd11.prod.outlook.com>
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Mon, 14 Apr 2025 21:18:18 +0200
X-Gm-Features: ATxdqUHfUduhc6qAB_wjctrMudxwDHTZUCIZwRj48eWBDA_LfgJSd5DyPkLhPPU
Message-ID: <CAKSQd8WsKnTk35PUCD_kM+Ox7yhBY23nMoE1R0Y3=U1OUrSRbQ@mail.gmail.com>
Subject: Re: [PATCH -v2] x86/cpu: Add CPU model number for Bartlett Lake CPUs
 with Raptor Cove cores
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Pi, Xiange" <xiange.pi@intel.com>, 
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	John Ogness <john.ogness@linutronix.de>, "Ahmed S. Darwish" <darwi@linutronix.de>, 
	"x86-cpuid@lists.linux.dev" <x86-cpuid@lists.linux.dev>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 6:21=E2=80=AFPM Luck, Tony <tony.luck@intel.com> wr=
ote:
> > > The macros refer to products.
> > > The comments refer to cores.
> >
> > > Consistency, please.
> > > Sanity, please.
> >
> > Amen!
>
> PeterZ has been very vocal that he wants the "sane" way to be making the =
"#define"
> name be based on the core rather than the product.  That way multiple pro=
ducts using
> the same core show up together in switch statements for model specific fe=
atures like
> power and performance counters.
>
> This does mean we have a transition between legacy names that were using =
the
> SoC product codename and modern ones that use the core codename.
>
> Can the X86 maintainers please get in a huddle and define a naming
> policy. This discussion keeps happening.

Consider a two-level abstraction.

One which gets "looked up" from FMS =E2=80=93 fundamentally
that is what the existing file is trying to achieve, right?

Another which gets "looked up" from core (e.g. RPC) or
product (e.g. RPL,BTL) or whatever-else-is-used-often.

--
Christian
