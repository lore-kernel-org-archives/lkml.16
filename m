Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5C023F43C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632241; cv=none; b=ZJ45NItjkJu4qmWRA+FTjLK6BQZ6EjYfCgWm7EaBMVaOPsOn5NpV2DRAiOmjIQAz+Vrrzpxc4ZZe6b4e0Km6qiXaKcByzhzej22FvtGBntBJ+spTS+kyTkBP2BAInnMoTmOeMAJ22gubhKywKm6mbuwnlLtvDmqXfTf0bsvAr70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632241; c=relaxed/simple;
	bh=BOiBGegJRIsJAwhdaPg0kbdMQr6Mw/a7D38ClN94RqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=clRkzV3vhJ5N0uiiAu50VtQtYa8eMSG6s9mxZmbS9/XebR5CwdfUAxjSaso9GfD8xK7IsoMnll8aJ1xILIqKQAyz/R9O/+Rhnp2YQ+LUPxOLg9cjfwVkQDYRCql+/f2xWnROlbwLn1lbjjVl4uEfiAAnR4/jC8ITwk0FUffAowM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MwDyGr3A; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MwDyGr3A"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4e7b8112f4dso350920137.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 01:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749632238; x=1750237038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DV9t5sYiI13RU+dfHyim24Ym/TfwiK76Thbl9i9KKag=;
        b=MwDyGr3A2nzkrw0WRJBKyig3h5TX3soXhdOkju01GdrOlq89cqp7EZF7bwvhW3zHQn
         f8fh+TyYQblpZem3RFnmCOML5n4EeSnNN5mqEEAFrhEFX2SC5dxbjUvdB/WnSavbbUkP
         tVc/5VWCkpC2mx1k3DeBpIprw4aerWs3TJ4uxnFIYL4ZPiBis/Ju2eTYSkVggtXLr2vW
         fX4khsooHai2GyWiKNDAkOiPxUE2wXBYQCJsdmq3zedEQAzzuMZ1NzFbpARyLTSCAx4c
         CKewgbuyR3u7MIzmwrnZh4Roz7oCgTIzS7HwKmdFwuG9WgqJq50ow+otdbtHtBJm4vqz
         qNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749632238; x=1750237038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DV9t5sYiI13RU+dfHyim24Ym/TfwiK76Thbl9i9KKag=;
        b=YusD+vkHx09UAB6IrY96/XzOVP81dENYkYDouSaXIS9YimqRgPKZbjayXy3vOhKfx8
         ECXdj5J4HrMWOmnpeIJykJQe6Svru27IVAgihszYOwPF9LHF1Y2Xjs6axMBZs5olblHt
         LyJg3Gj9OhwlRUDaMmUGcnjZ3ZShydS5daLSUN8lfcYt/Ev2eEKb+a/bIPUct1j5h2cl
         jDvONezBk0sGYkQSPzmlI5UvzEce39q5XbcdDmaCEQ7iYCJ+vpjLJXjERV9xf8dZc/cs
         2Fmb1YOd7jQ9rupCoj+xXmBUKaSb4+j9KkOhCGxGLUmY4MRgxKaJpDu4/v2rgu9ZJbOt
         Iu2g==
X-Gm-Message-State: AOJu0YyIqIkjhBsysUgZCh3q4PKztmPrnWpT+d5XefZvWDRwE6GLnTji
	1bpAfzVoTUBmu+tm3iNQdGOQoJcgkbismF0/kJsAqOvoaXcI/bJoqGg+ZBYt7f02d1JNLHKRgi7
	3KGW5v0j1VE+pe5698AsuWTkCw9YEFja+uKnuvwPUxQ==
X-Gm-Gg: ASbGnctwOW0YlExqzD9ObtULSr9jbXB+3SNNXzq9IaS5PPmL9wstOVATrYmRK3JLKEj
	B63lxV4MuC4XiytqLgPyjT/AP88K2hue92LbBLpz8NODvMK+KATyyFIBofDlrVPrmOpqDT8vo0U
	vELvnfQZVtqWpP9i70w/VdZbcN+lsxnS6tjaDsuwjwUlc94B78oEUsTQQdu8yYZOBoX/Uw9g6SY
	mB1
X-Google-Smtp-Source: AGHT+IFQXF+sKGFKqYzvIWVQbzE1S3LEQpj/qr+Mjs6PmUNCe9qyp66456X1HYoQ3EeWcUwMf1iYDwClQBMee+auP2M=
X-Received: by 2002:a05:6102:2b8b:b0:4e5:a2bf:4fd6 with SMTP id
 ada2fe7eead31-4e7bba95fc7mr1734093137.8.1749632238461; Wed, 11 Jun 2025
 01:57:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYuppX5LeRjOAZWsYRCs76PVbnv-TN_RrszhDsk=KregyA@mail.gmail.com>
 <15979303.uLZWGnKmhe@diego> <CADYN=9L+Gao0w_CThNd96-yYbZDMZnwY7RvagCOdzUC4rKc-Ug@mail.gmail.com>
In-Reply-To: <CADYN=9L+Gao0w_CThNd96-yYbZDMZnwY7RvagCOdzUC4rKc-Ug@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 11 Jun 2025 14:27:06 +0530
X-Gm-Features: AX0GCFuVYEyn4auVNPUyj-VnDVcIp7H9e0QdsmhpYhaxmLWCVhksJEW8y_9TvVE
Message-ID: <CA+G9fYvk7kBqDqPSxndxG2CxxVxhNrf4Easp-aYrR=UeTS1=eQ@mail.gmail.com>
Subject: Re: next-20250610: arm64 No rule to make target rockchip rk3399-rockpro64-screen.dtso
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Regressions <regressions@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Peter Robinson <pbrobinson@gmail.com>, krzk+dt@kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Jun 2025 at 17:07, Anders Roxell <anders.roxell@linaro.org> wrot=
e:
>
> On Tue, 10 Jun 2025 at 13:22, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
> >
> > Hi Naresh,
>
> Hi Heiko,
>
> >
> > Am Dienstag, 10. Juni 2025, 12:25:31 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Naresh Kamboju:
> > > Regression while building arm64 with the Linux next-20250610
>
> [...]
>
> > > https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqD=
gmzjEl7VszYE9/build.log
> > > * Build link:  https://storage.tuxsuite.com/public/linaro/lkft/builds=
/2yJ4IOQa1XxMqDgmzjEl7VszYE9/
> > > * Kernel config:
> > > https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqD=
gmzjEl7VszYE9/config
> >
> > thanks a lot for this notification.
> >
> > I'm surprised that overlay build at all when I built it yesterday.
> > But yeah, the dtbs_install target really broke with that change.
> >
> > I've amended the commit now [0]
>
> Thank you for the quick fix.
> I applied your patch and built it, it worked fine for me.
>
> I built it like this:
> tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
> --kconfig defconfig dtbs
>
> Tested-by: Anders Roxell <anders.roxell@linaro.org>

Thank you for providing the fix patch.
I confirm that the reported build regression is no longer present in
today=E2=80=99s Linux next-20250611 tag.

- Naresh

>
>
> Cheers,
> Anders
>
> >, to change dtso to dtbo and ran the
> > dtbs_install target sucessfully with that change.
> >
> > So on the next linux-next creation, this should hopefully be gone.
> >
> >
> > Heiko
> >
> > [0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchi=
p.git/commit/?h=3Dv6.17-armsoc/dts64&id=3De14491aaa6ff598bbe9d462e44c01ac65=
754f445
> >
> >
> >
> > >
> > > ## Steps to reproduce
> > >  - tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
> > > --kconfig defconfig
> > >
> > > --
> > > Linaro LKFT
> > > https://lkft.linaro.org
> > >
> >
> >
> >
> >
