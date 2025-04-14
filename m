Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E0E36C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 18:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744655455; cv=none; b=aDTvAON32RdvsnA77T5IwiiW8b9L15KVByiRFx9Uv5f73+8DymzqUeEy/klEp2P3TkV9S14afs+f6L2BbiO1idPlnotiX7W+dQw5Jm4V3V6Gofhp6jcJqRFPOaL+6/o28/S68WpLOk+VJAdMNrMs01N/67Ar6fc6Jj2jWWgNM8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744655455; c=relaxed/simple;
	bh=iMCnbrJiSVgsnlnzip6/crB87NSMbiRPqYzRRrVE8XU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UYmHxLGSFdcmkUcq+PGnyLfdPLru87ZN1X6vF3YmrVBQ844kyqFEviECghstuNARWFindngvoyRd2T5Gq4cz3/dig07wjy/nix2OH4N7IzZowpSAlCJUtxBamiea+3oU/PFRJ/yIAvQHBCvyFaBnhL7jP3dtLJv/eWfv+URmrr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jV7It78L; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jV7It78L"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30beedb99c9so41443201fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744655451; x=1745260251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMCnbrJiSVgsnlnzip6/crB87NSMbiRPqYzRRrVE8XU=;
        b=jV7It78LAKjX1iF+4nxI2oIuv1XZJpt6Iy5uLV46Gb9+mwltTXBYQCn5QtO11ChD1a
         nVbDlaLPq+aKY341lBfHk+T1s/39/OIh2tlYwW3dxrCMKONY5KPzR+2Eaot/xUPWvuHp
         Xjmtk7ToQILSAnf2Wj1axX2rhA5kRnLcZEi986u/DVQ/dRape/WK4Hh5zxUjbzQLGQrQ
         sPHomYTc1sd6IBz5HnDeBjmboGbin6wgG0A38Yi5uuvH8E1cMyUAi2/TJt1/+882IKoe
         At/lDrRIn0q719+Qwof/X8IxSVy+L0BOqMO+aB3O7PoTVnaTPdpOi1K5ycrEcHbcEV0x
         0j6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744655451; x=1745260251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMCnbrJiSVgsnlnzip6/crB87NSMbiRPqYzRRrVE8XU=;
        b=vbPxeOZxuuweToCG1j0SKLah5W2k3gbnn0r455ExkDj1cpJkKOzzTspa3BHNFNn5j3
         mY8387royueu2dGhmw/bBEXA4AyItUjB1Gf/kbK99YZ/bcSgP2eQsn/fjFVsqhajO1Fl
         zMk7WhHJN5Mz3SC9NQoqsFlgn30GcyOPEls05NqlbtKU/Hl41AiQXeCAXVwRk0xZRcT6
         k0MUvQA/jTbulp77RaAPbOBC4x6gHnke33ElaZWuS5xMI1mUAwHK5tLYgis+ME1Fs5z/
         +kBTZvZBePzB86jdpLN4kh4EpXWRUu7j9cG2iJbzL4JYiRcKtulfMfhKUTFGh98yXO1g
         2pgg==
X-Forwarded-Encrypted: i=1; AJvYcCWPexhcmFKFb845TsE0h79rQVnZcF4tJlKOE4ZunVyHacluviIwi5JHaRQsee8Pb/9T56CPTySs7q23C7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJqr0zJSFfplAN1B2NG+eMe4SCQ9pGGSKNNjrxi5758Mu5SEVb
	pKphVQ80eMDm64Qzi+hyaudMY7fUBIlZPngof7VK2SnIk/9D4/h42FYx0BKA7AJumZyERmJNo+z
	r/+FQ7uxnR0qr0HCQcSya8HUgBbfvXZ0i0DM/0w==
X-Gm-Gg: ASbGnct7zQvHVrEQdH1/EnAqjxl+PrSHHwkrS1pSWFzTvZHPZAwk3aoiBrpNBfkZpNG
	wiagzzhL+0fDeqrhjdcuXOcXYFiWOnzp9BvMYiz8M/ooySPSOCzlQMCZZ1G6g572zwSns9H1aSK
	A5hDhhQwM2lcpUm0I6IaycK7lDYMoe3K3u7ihFIfd6ft1yNmFy2c0bwoZCqxdcf0A=
X-Google-Smtp-Source: AGHT+IGG6HfO0a687DQ2ObWoW5dsDkKpKT5mJSVYkj4mYbmZ4ySEjWG7K8FyQL0/ZDaad7PXpi1Rz3cQhvFr0qElIMU=
X-Received: by 2002:a05:651c:1597:b0:30c:160b:c76c with SMTP id
 38308e7fff4ca-31049a1c6d6mr38019201fa.17.1744655451082; Mon, 14 Apr 2025
 11:30:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412193153.49138-1-chenyuan0y@gmail.com> <D9694O0MKV31.3SY6ZCTSKXWI9@bootlin.com>
 <CALGdzurLWayryjUEdSy4iuHAgFO=RA=HN=u+BZY96JqESKvi+A@mail.gmail.com>
In-Reply-To: <CALGdzurLWayryjUEdSy4iuHAgFO=RA=HN=u+BZY96JqESKvi+A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 14 Apr 2025 20:30:40 +0200
X-Gm-Features: ATxdqUHR3IF_jBbcAtQS5Mjt4i90SIKTxCncQEK71lUbbQWQS1vGZ6vrZEF8J6s
Message-ID: <CAMRc=Md+w7Wp8gS=PvpYkz6z4y45z6QiO7A0i24ESSa8N_byeg@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: Add check for clk_enable()
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 2:11=E2=80=AFPM Chenyuan Yang <chenyuan0y@gmail.com=
> wrote:
>
> On Mon, Apr 14, 2025 at 4:24=E2=80=AFAM Th=C3=A9o Lebrun <theo.lebrun@boo=
tlin.com> wrote:
> >
> > As for why irq_startup returns an unsigned int, I am unsure. The kernel
> > Git history isn't enough to know more. The startup field in struct
> > hw_interrupt_type appeared on v2.3.14 [2], so no commit message to
> > explain decisions.
> >
> > Seeing the __irq_startup() code, my proposal would be to turn the retur=
n
> > value to a signed int, but I haven't exhaustively checked codepaths.
>
> Good catch! I agree that using a signed int could be a better option.
>
> Dear Linus and Bartosz, could you please share your thoughts? If
> you=E2=80=99re on board with the change, I=E2=80=99ll go ahead and send a=
 new patch.
>

Ok, I'm backing out this one then.

Bartosz
