Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153492153E1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352634; cv=none; b=nss2d6+6QmeiraOcn9TPDhas5Yjf0aM2NJYDHdvtnqyYGhNQoSE9acYRvsAXyBCvhgS39vhPuYtNNAZVxK+PUmZzrLEhJJzYqYY17sy8LCP7PKGcdS2cf4XHeapfnRksc+HjLDPLk+wC/2514xV3M2VB30zaoJUcNvA1YLrt5d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352634; c=relaxed/simple;
	bh=slYL0pcK30l/kdf1cEqzfFGHu0UunnUbDKnicMoho0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c17cd8/mZtysHtd6OZVr4AoAZAT57Hv4lO3hexDoG+oxJNDWIsTNr/LNDqPxgUfo1Wf5Opn34vb3dJlqh28vtgN/7HYhsb/BoBp5Y0kzbGXhPw/6lL8oxbwCwApjvM/PVodgoL36y36vhueZ6eZMOM9iWCGZ9Wjqmk4hWKqFV7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=kn7la7bs; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="kn7la7bs"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b3b250621so49720071fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751352631; x=1751957431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWPXFIhjTb/V6V1DQLHOJ4YlKbwSK1c4xU/yQWq9blU=;
        b=kn7la7bsJ4QvXlCWDLDEJQ0uVyUpBMJiwp/yIn/VJs4h8HMOUTcjkshXNyDTwJlo7t
         33DegWQnKnFY3m3AbVezFYCnle449KUn9fhLxMnUB3pLs94V3WcMAY6buL87+vLlWIN4
         lUo0zfDIInp1ogtBK2V5h1kZxCiUQb0aKoI19dSJdQU2MLlPygF6CSYEtSNA6yRl+jTj
         K0TBXMkVrI1+h1jle1UAnMursGiW597lKKjPLB6aZjPpoch1U7NbMNXrDHfBpr3HPAgp
         BJZcMweLYdLz+LAbi7E9Q8wdqPZAai9qlGvyFK1edI8K/wIpFCWMY1/LxM9bKkNiPDYx
         bz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352631; x=1751957431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mWPXFIhjTb/V6V1DQLHOJ4YlKbwSK1c4xU/yQWq9blU=;
        b=n9FlFG38Ny4lYJUNmi4R8ntmclEz5DtofzxAU7GEoB+nk6Zb2zyh1RoMWWN551W8Jk
         eLYZdbr5mgdna2UOaGY91N6pvDyOUvkTc1CgSFHoP41IXM3KyTRYD6tHGwN2xH7KW47H
         AjClFeDNQ714r2baHqE4tnfASFjW+6XExjJppf6nsw0FlPHPIgA8L/QdnbJgcy6bTUtm
         ynUDcxvCuFr9iEyxEBLYhU29SJ6Xd1bJMg0qSs/M36LopF8AEl9FtcV5jk6W7IIxuldM
         2a0Qo163qmUTCvldvWF+us86BAQSEnIZWfnoGyiIlcFIJECtKxhcmm0gJqocYwBaDzGz
         2HSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXToW4hHpaoHUWOmNve2a6Iv1SzGuYpiNqO1nJ5/F/WN9Z8SfIwH6VKltQ5D0Il33byXU+d3LKcBr+hwfs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Lb6jVb1E9Jizdl2sP26Z4FvesGtforoapm0ae0F+nMn4UhGu
	OJu5FnXifW5lYUFIjm2OEBlVvsIL8dUg5gymeazEzQdoKf2px2H2eQqtYgNM2DM++qxwjM6CF1K
	Hh1ASiwZHMxKuoEpVLQYBJ81A1m/bKAokEb1jwh+rAE2jUPTFa/K5
X-Gm-Gg: ASbGnct15YH/GyeaAoP8grERISSKKglZ/pLCcsU9Wud+2/VmQGD/icKjyl1wqGj2IBB
	1yDlSwVXIbUCE8SxfC0jYXieQL/szw0VqCNmy5Sf6J60BYpcS8rLbw9xf9IcHatB986V4Lq9qer
	B+9CE2SVjRI4MXckfngz3zrSeHkyQbrIaH+hI6UPPKEf80KqN26BPJHtw=
X-Google-Smtp-Source: AGHT+IFzkBl1xaxBMxsvzjYcnTTImtOa41K69LoWO7vhOCRunctW7uRpVxNN5kP1lrGeGDNRGiHQb4LGbb+eDUYPLaE=
X-Received: by 2002:a2e:bc1c:0:b0:32c:ef7a:d84b with SMTP id
 38308e7fff4ca-32cef7ad8c6mr27641281fa.13.1751352631111; Mon, 30 Jun 2025
 23:50:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-6-apatel@ventanamicro.com> <aFkUETH_R30-CNOX@smile.fi.intel.com>
In-Reply-To: <aFkUETH_R30-CNOX@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 1 Jul 2025 12:20:18 +0530
X-Gm-Features: Ac12FXx2G23C94_L44JHbdLekj9g5IUE1GEONeTER1Z3bkY9Y3w5bcaCPjCbmV4
Message-ID: <CAK9=C2WpN2_+wi-0AOZ_2xOK8z9oZk_dD__uRCu+E8iccjyC=Q@mail.gmail.com>
Subject: Re: [PATCH v6 05/23] mailbox: Allow controller specific mapping using fwnode
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 2:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 18, 2025 at 05:43:40PM +0530, Anup Patel wrote:
> > Introduce optional fw_node() callback which allows a mailbox controller
> > driver to provide controller specific mapping using fwnode.
> >
> > The Linux OF framework already implements fwnode operations for the
> > Linux DD framework so the fw_xlate() callback works fine with device
> > tree as well.
>
> ...
>
> > +     fwnode =3D dev_fwnode(dev);
> > +     if (!fwnode) {
> > +             dev_dbg(dev, "No owner fwnode\n");
> > +             return ERR_PTR(-ENODEV);
> > +     }
> > +
> > +     ret =3D fwnode_property_get_reference_args(dev_fwnode(dev), "mbox=
es",
>
> Why not using fwnode directly here?

Argh, I missed replacing dev_fwnode() over here. Thanks for catching it,
I will update in the next revision.

>
> > +                                              "#mbox-cells", 0, index,=
 &fwspec);
> >       if (ret) {
> > -             dev_err(dev, "%s: can't parse \"mboxes\" property\n", __f=
unc__);
> > +             dev_err(dev, "%s: can't parse \"%s\" property\n", __func_=
_, "mboxes");
> >               return ERR_PTR(ret);
> >       }
>
> ...
>
> Otherwise looks like a good solution to get rid of OF-centric code from m=
ailbox
> in the future.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thanks,
Anup
