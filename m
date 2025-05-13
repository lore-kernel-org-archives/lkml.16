Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D751D1CA84;
	Tue, 13 May 2025 06:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747118939; cv=none; b=p9nRBgge9NGtt1DYBfw6A35+OXTAy1PVe6G3I3FHpt7GKymNmsZh7i4xkmVY1eyvtvioSIsXqa1zfpyjxuVX6QKdhX2HVauMbbaeCWfUlRK4p5oN2IJLo4APRnMhNlhmCX/q9YTXJ1fx2L3zTWO69oc1rubbBkVm2yut3m8917Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747118939; c=relaxed/simple;
	bh=iOjQPZ3jBEH+A7GPIhAofmRc4XXAqWG0KCzvFh/YLMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghce+s8EUnGosFtm7qTB0C3e+X7cWVuN2DE/jdIjEsMkInDNbIPOFwxjZrcnasHXSa47WH8xen4Lac9tdTz6iWpfqwnjLvLSv1X2ttB3Bsr1IZFpRcsA+5fDrLKrKXhc/zrigJ/99WTqkOBe5YZhpzDQBaBMSvM2h6VT3pe3+LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDQJFI03; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDQJFI03"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4ddb03095d3so2154186137.0;
        Mon, 12 May 2025 23:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747118937; x=1747723737; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYk4j7CxjdKvx7rPEEhNb+Rwax5vZxTzKDR9+UW9Ueo=;
        b=KDQJFI03vd2Dm/QFmh1FED62EBwdHgLZOihBvv29PB2WS7qUOkdRO6zEsFM1cm3+3k
         AQktq65hjMb9kTQ4CFNzrR5twM2GL8tjJs6R70Pw2wndIbAwuHE5k9CnGL5san3TGIvY
         nRYQQo0TS/igJtJ0CQ03DQlOESd/ivFPIAIO/OdYYhr8tW3KQ+Tit84Bcs59xBI3nJwU
         ewjWZypl0233TaeYTWvwxVm4LwF1CJ3WX3gRx8S5EB3xPuBke29h6SIQoPcI0Ubkzs6N
         v0EDX83Yeqsj0Db0HO0+fYq0hhzm/JVot76QQMAfG0H8pOfBQPVSfFLUCVJPQeYWmzAw
         hUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747118937; x=1747723737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYk4j7CxjdKvx7rPEEhNb+Rwax5vZxTzKDR9+UW9Ueo=;
        b=bVqMsp/CwqYbnkRC8K9SeODXnHpNBp22F5I3CTSL5V2V2OK4ciMydbKnaAvoYLGF0H
         Ni+agHheyZe4YUKR0Ld6kiLYyjpbRalg1Rr124oLcFoDdGaxMlez9bMzWBpss5wdheIX
         e2lwVPhOKzvs/rPRfxx6YO0M0L0yH2s1NVvxsw99vUEjXeIU9rJ4+JGSIhjrNoVgs8VD
         THL9iJYZTNpafJjSRixRwxi/zGSaqjYC92rdbweEm2O0qbFUCX0+ZBKum9mrvOFnx9o2
         aELgNjwv4KSO4xCy1ALYNMnOpP9DVcL4SaL8aL0xsvSY5vExzDZ1fOW6bniLroYRkWrw
         0BzA==
X-Forwarded-Encrypted: i=1; AJvYcCVf2Yqtz4hXT72wtjshJkKyJ0w5E8BB1yKqlJxR0AofUhThaX7xrPoaf1E+RT76JTAAaBD8+rN0Noe3@vger.kernel.org, AJvYcCWusZXtQwMfG4lLAz1k6QpeiUTA51aPeZzoO6cNuOsVp+fVYwfjLoSdBsBBYQMZjoEZLtsfHbWsx5MMnAyI@vger.kernel.org
X-Gm-Message-State: AOJu0YxT1f0J0Nf75kD/QoCXSW0RiT95kc/GV11sD6+YZbyS4r9YN1uZ
	2jjwurq0ztWMKFHEv1GCVQx48QHTYR5zVl5whSfnfAJ/8ZXMijH8iYDbSUK4DzSaqbQ/dstSAfZ
	8pP833CGTbpFBZsJkMMCXNyf3Lts=
X-Gm-Gg: ASbGnctomV5GMguXb2O3Zp3xsXF4/2wycMJx8QUredd9URPG9rjx8C5BEBn3RM4xbcd
	ded7DuHZ7+qqO0lNhsHVHqAD+BXyURfoUXPSAf2XiGRXi/mAb6u/rq2r6N9FZBMcII5AAe/w0Pc
	ZchJMJX0yNoNKuYeBvUrs36boye406Z8E=
X-Google-Smtp-Source: AGHT+IG1Lfo3qRxxG+d06P2OThy1PUAW+HmTxa7XW23ERubEx5mp17bOS5Sq9QFl3olPcQ5JCsTf6WYuihxd2eQtVjs=
X-Received: by 2002:a05:6102:3c9f:b0:4dc:81c9:13b1 with SMTP id
 ada2fe7eead31-4deed227f12mr14095269137.0.1747118936072; Mon, 12 May 2025
 23:48:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1746811744.git.rabenda.cn@gmail.com> <59c175c7bccbd4b5ad241c39b66b0303e0facf81.1746811744.git.rabenda.cn@gmail.com>
 <MA0P287MB22621824B2FD5E2A64006174FE97A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB22621824B2FD5E2A64006174FE97A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
From: Han Gao <rabenda.cn@gmail.com>
Date: Tue, 13 May 2025 14:48:44 +0800
X-Gm-Features: AX0GCFsgKP3_L5fxA6GXcGzKEQ8-JYRcBHDQtkNoE5k7A3nhuftzT0fylh2dtec
Message-ID: <CAAT7Ki9=ROP47hsugf3BS1nXr9oOPHWgjQoGfjAZiwHnXS19Pw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: riscv: add Sophgo x8 EVB bindings
To: Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Guo Ren <guoren@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I hope it is sg2042-x8evb.

Sophgo is also making EVB boards for sg2044.

I think a distinction needs to be made here.

Regards,
Han

On Tue, May 13, 2025 at 7:35=E2=80=AFAM Chen Wang <unicorn_wang@outlook.com=
> wrote:
>
>
> On 2025/5/10 2:13, Han Gao wrote:
> > Add DT binding documentation for the Sophgo x8 EVB board [1].
> >
> > Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG20=
42-x8-EVB [1]
> >
> > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >   Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Docu=
mentation/devicetree/bindings/riscv/sophgo.yaml
> > index a14cb10ff3f0..ee244c9f75cc 100644
> > --- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> > @@ -34,6 +34,7 @@ properties:
> >         - items:
> >             - enum:
> >                 - milkv,pioneer
> > +              - sophgo,sg2042-x8evb
>
> I wonder the product name is x8evb or sg2042-x8evb?
>
> The same question to x4evb.
>
> Regards,
>
> Chen
>
> >             - const: sophgo,sg2042
> >
> >   additionalProperties: true
