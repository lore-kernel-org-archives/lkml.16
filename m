Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2657F17A2E6
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749715283; cv=none; b=Ai93PhOvBrdYwr4aMPHo2/pp9olOE1oS8dZbAEdBLZAS7zAP4ISofTEMYWmoHhZKeMTtm8mCUmwsD0KC7IMig0K9ga7ldxzQ0mOkVT/UkjY4qoFY54GeosZX5P+9CKQQmUReg+lcqgoUENx3g28N0gF0Ur2ojhUL2ehzgFpyImU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749715283; c=relaxed/simple;
	bh=6Ose6+B71k7iqCx66aWRA/Yp59uxaaNK8czjGm/rHnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wu4r60FK2tD4QKVvnkAB5u7R2cavQgwFoB8tWqwe346pCX6vjt55cevs0mSMHM7bkvDooLe92hEzvaGOU3GdeNyrd46tTjpIUcpheztil730cxhSnYYO2UsIqgDVeOrLcv6AqtSs+cl1GXtSkhX+Wq3sqPJpNjfKdowSfuza7HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=GQo5MWqz; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="GQo5MWqz"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad883afdf0cso139930966b.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 01:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749715279; x=1750320079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oxSJUEVlshkD0aDlvVP1clOg+BglaIQc1uVhMM16LQ=;
        b=GQo5MWqzxoHmUY+Wxdcrm12k6RVY/knEiiTfXF6dA7Z2Co7zIiXNrYhDmtL2PfUFyk
         a4GtSfnlmjgXILddyORwYA/g2GHl1DTk5VawRJMhTYsAxBPNbu0McPaFR5JydPsfHbF5
         oLZH4JBElI3aBMYUiKjBS+cDijnxr+vRdu36tEGcSkNZChXIs6IGaAY1EFdCCE/pvf4a
         7kJCeD5bQT4vGYhIOODbh3aIxIfUMMsgtUCU6QSOox7dtx9Kx+6rVCbOujjIuVLO1sPk
         1rweDZ5Q/F7VEuYPaavvIPH5IfQfEAIsnHMoijxWBbYi+ImCrZf0sHocBiQyT/VVJeuj
         9l3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749715279; x=1750320079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7oxSJUEVlshkD0aDlvVP1clOg+BglaIQc1uVhMM16LQ=;
        b=hSVZyHI+XAz7xT8mbU7iLQo8Mu0i0rpr1RVB/H7wGBvPAz0zYM2/ikPUkdQpprVgey
         E9Wh4ifURMeet9kUPk6767IbvqQFCCUzgcxP4dBNaezkO6sjWNUBndQbiJtDNoG/+tR8
         3CFkR8pItHorXoLqtCIRx2uncifXbo3rUJDMyW2ExnbqrFu495MS1ifIYhAbocCBYRpD
         0G4oeBReD7tyueon/zd+ruYrXqwFZxmg+skmZVD7Xqz6axDMFK8uBsRx5FWYCARjzxGT
         alrHLK4JP9vJzg+xP3+LXJqy00+/5fXW817QHaxRwYClbwyRR+UKNQUwHRLb2an3ZX1h
         b1hA==
X-Forwarded-Encrypted: i=1; AJvYcCWCxDEoSI+Wo790SciawLn2OVANN8gy7hAu42PkZXlQPyqGTsN4ASwU3TUV3HcGuWRGBCD9tq5V6iI+lQM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj3xu2PZcb2mFfJMwDmPOBgROx3terPlzgDw7LSboiYW0SUUe0
	Vu2Arjo7rrMf9LHI/nE8ncyYR1duQ0iTRG3n9QspPsjJHQ4fM5wC0sh5RwBlwawI/9IUb5pEwcq
	9g24Qmp4Gu/vXS83k10gUGDHphUsna1cafZvL2f7G0Q==
X-Gm-Gg: ASbGncuXmeQIm+mlgJSbtyZzyW6OACs0KTMh05+g3VP+7zV1fV/TpYgTmDnnGNiR6fs
	Zv8Pyv/BWk/D/IQQ1mR3fYmaGggzTu1ebdaZB3ayKVJZywO6Ec7nHRo4mR9VOhdVZd1mS3IYfJR
	4PpGU0CKC7ksm4u0bI/XDl0/q+NzxUozfob5Jo1rXC0lKz
X-Google-Smtp-Source: AGHT+IHDczhcOV54f0XomIKx+8AvFzloZqJPe+NAcKM5RDeAoHNu5Itf848xFcRsOPgv8woiTaDbH1WF8g3ZBcPtFeQ=
X-Received: by 2002:a17:907:d03:b0:ade:3bec:ea29 with SMTP id
 a640c23a62f3a-adea2ec74a3mr265693466b.25.1749715278188; Thu, 12 Jun 2025
 01:01:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-7-guodong@riscstar.com>
 <20250611135757-GYC125008@gentoo> <CAH1PCMbt3wLbeomQ+kgR6yZZ18TZ=_LF-kCcnLqad55FSHBhDA@mail.gmail.com>
 <20250611150227-GYA127466@gentoo>
In-Reply-To: <20250611150227-GYA127466@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 12 Jun 2025 16:00:57 +0800
X-Gm-Features: AX0GCFtVVlHqZ-iio4sy0I0p_9gClOFpDAZk_842S7V7_Hx6vWxgyXXCaFMBON4
Message-ID: <CAH1PCMbNEMvpU=eNvrHj3pcLEMn=ObCOZZHVM4tjZbL9-BiraQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] riscv: dts: spacemit: Enable PDMA0 controller on
 Banana Pi F3
To: Yixun Lan <dlan@gentoo.org>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, elder@riscstar.com, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 11:02=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Guodong,
>
> On 22:32 Wed 11 Jun     , Guodong Xu wrote:
> > On Wed, Jun 11, 2025 at 9:58=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wro=
te:
> > >
> > > Hi Guodong,
> > >
> > > On 20:57 Wed 11 Jun     , Guodong Xu wrote:
> > > > Enable the Peripheral DMA controller (PDMA0) on the SpacemiT K1-bas=
ed
> > > > Banana Pi F3 board by setting its status to "okay". This board-spec=
ific
> > > > configuration activates the PDMA controller defined in the SoC's ba=
se
> > > > device tree.
> > > >
> > >   Although this series is actively developed under Bananapi-f3 board
> > > but it should work fine with jupiter board, so I'd suggest to enable
> > > it too, thanks
> > >
> >
> > I'd be glad to include the Jupiter board as well. Since I don't have Ju=
piter
> > hardware for testing, could someone with access verify it works before =
I
> > add it to the series?
> >
> Do you have any suggestion how to test? like if any test cases there?
>

I am using the dmatest (CONFIG_DMATEST) for memory-to-memory
and using spi3 to test device-to-memory / memory-to-device.

> I would assume it work fine on jupiter since it's a SoC level feature?
> instead of board specific..
>

Yeah, that's a SoC level device. I would say a boot test and some
basic mem-to-mem test should be enough.

-Guodong

> --
> Yixun Lan (dlan)
