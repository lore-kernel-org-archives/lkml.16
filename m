Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EBF33981;
	Thu,  3 Apr 2025 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743684565; cv=none; b=X8BZxhbjKxD71NwTGvnPxKyvWdptKtfhCIEU+uGwR/TQ9AbfgqcMLNeHUK2oeCBViUSLYE3b55eM3wP6w430ZcYra6W6TqpjvP4bc8UR1IkDynojgE+UHirGUq2yM+2n8RfPSKYWlupTtONjXdputHYgwTK2LjKXmDN2dKixNTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743684565; c=relaxed/simple;
	bh=RxMLz6M+rqNa78DbwQakLvxhMZ+1yEief3w4mMeOKag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iGSk7qcBPYOB/a3qIrLUrvKQlTsugxjQYSkUaTk7maWdCW4Mb11UWbhXw5cPL1GW62yk2HARz8GUywnCHHb5YJseHQ/XalZ/pfT6J4luC9yz8GvS0NSEYS3K0QEBK4SgkWpDYekd+Jb5LK0FEXKtfpayfI+EvuIDCbF4Ytzx+Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RT/jr3C0; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RT/jr3C0"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so781243a91.1;
        Thu, 03 Apr 2025 05:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743684563; x=1744289363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=br0qzftHCKz3sbr3SzuiqhOwZoMQzE2LZ4g8CLoOd0Y=;
        b=RT/jr3C0cNFjxcLOQZRBy2npcuO8nzHhGaHuROWvF2DwG2ZWcfgm5IRQ2/9OaYMkhs
         MPWhVyHrUwuJp8BkkFQOu2XkRk3VKQH7p0sSyf6cWvvoAIcAPixDqyZpTcBxHKMBAiDd
         cRsHu73bszNO4nJUjFK+X+xSlLt5EbavTnpuRPN6EhXHBAuJC9AqxSQJbVnE7jzJzk0r
         edry5LHdg8pOnpounkzQ2s0UKBoOsLx0q0vnEMUeN+ohdU9FgFyQoS2M+LTchIgCdYiX
         6fT6lsYgYsLy8HmMS1PtO4HrdTgB4MJ4o9ZRT4HXKXalq7cobFEw+/tfhGvigJ0PknOd
         /HsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743684563; x=1744289363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=br0qzftHCKz3sbr3SzuiqhOwZoMQzE2LZ4g8CLoOd0Y=;
        b=Ngs/PHTjL64+trMBS0YYwEtXF03CqJ7gFW0anKf/hIKQFJXvN3AZ+vKrr81Q3hpfPw
         Fx+d/rQEo1JHdvg1NHiUp4+NseSmGkgalMf0oYZGecw2kgIl3k0ziUCHJCS3pdwkPxMm
         z+/QyiJV7lVGEw6HBNjn2HbzywQUrBO1i9pGqvZarEgIfmErebh1PLYi6M953M1FeInJ
         AAcrSFLwQkkhSspfXYTvoWgSuNbt8NV2Qul+VjOk9fmoyam0nMZ7ZtviEAW/MvrParbq
         KOGovhdGxqDFJvnV/2lGUMihFVJTkQZfOhLE2pKBCJoblJxq3vf6rsa8Jx1nzrGi3qJX
         IcxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGg2bKNZIaPP8FYi3ikptr7a3EGJyAqmxM3ODtV51PWSDdBLBDQR/Vkd7U/eyxeJefIHdt6ZIL6CGvwiuZ@vger.kernel.org, AJvYcCViRp+CqmCGvuSAEI1qb0WQwBYoZsvLcAWLVDZ10fPWowzE88qyyDYDBefCJgghoMXvE4zP+YvH0WiR@vger.kernel.org
X-Gm-Message-State: AOJu0YyeXlW7EMLcFX/5kbnNJ3L6ESllt4QYYxkhOr7z1fAm6drwAeS1
	JEggyPRfj3N8WtNM7P10TI/wrHOBpm8lF5a24Buh3gWCM0CndBekjDBKzG7v40DM7j1DDXnHDBM
	dHOnKA6bQgkTKKVuKO/IOh4jWHpU=
X-Gm-Gg: ASbGncs4AUuUDeDqs8ypAgeB+jl6CH30oNT/3EZ2FElfa1Tusv7+wRd1J768hcWY1Dw
	lcTWHrqjxUMQSQlAwXfQnOuL6FCWMH3awdSoINiFSLcJwRbgGmOeiYfn4HSRACQwZiXgdgA1Abh
	eEXVhc6yop+wl0hhV1EDG5ME0=
X-Google-Smtp-Source: AGHT+IFYW9MnslIX+WD/W4yqFkahfmkMt3j4de0kYP5osy79qxqlNhQHimSlJ+WSDyjW98VqmFgbjK1vYEjgozBE86s=
X-Received: by 2002:a17:90b:2644:b0:2ea:a9ac:eee1 with SMTP id
 98e67ed59e1d1-3056ee3148fmr8807692a91.10.1743684563426; Thu, 03 Apr 2025
 05:49:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
 <20250402-initial_display-v4-3-9f898838a864@gocontroll.com> <f75fb67a-91ac-4e3d-8ce7-5e0c6c2bb2cb@kernel.org>
In-Reply-To: <f75fb67a-91ac-4e3d-8ce7-5e0c6c2bb2cb@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 3 Apr 2025 15:50:47 +0300
X-Gm-Features: AQ5f1JpOn26KtD3CJ794gf42_16EcVqDVeshPu-zxnT2qzP-_yIum74GI60JHY4
Message-ID: <CAEnQRZC9Exfb5FL+gpMuwU6jLP8vO9hjrxm1+OHQBeLy0J1Wsg@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] MAINTAINERS: add maintainer for the Ka-Ro
 tx8p-ml81 COM module
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: maudspierings@gocontroll.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 10:45=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 02/04/2025 09:07, Maud Spierings via B4 Relay wrote:
> > From: Maud Spierings <maudspierings@gocontroll.com>
> >
> > Add GOcontroll as unofficial maintainers of the Ka-Ro tx8p-ml81 COM
> > module bindings.
> >
> > This support is not officially done by Ka-Ro electronics, if they at
> > some point will supporting mainline, this should be changed to them.
> >
> > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> > ---
> >  MAINTAINERS | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 322ee00547f6e494a96d2495092f72148da22bd0..4b3864a9852f9fca2be4898=
7d383c0671e668336 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12752,6 +12752,13 @@ S:   Maintained
> >  F:   Documentation/hwmon/k8temp.rst
> >  F:   drivers/hwmon/k8temp.c
> >
> > +KA-RO TX8P COM MODULE
> > +M:   Maud Spierings <maudspierings@gocontroll.com>
> > +L:   devicetree@vger.kernel.org
>
> Drop
>
> > +L:   imx@lists.linux.dev
>
> I would say this as well, but not my subsystem to worry.

We don't actually mind to gather all i.MX based boards development on
this mailinglist.
