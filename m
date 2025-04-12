Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B122AF04
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 17:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744480639; cv=none; b=gVGhE66/YckSD8IAIU22KYrmHxTh1idKk/Abn03gXFwLNOGb6PgWrGu7sNZcW2V6xIHVd4RSU9XYZvXkOek/CPDOjOYu6mBo+0tXwN4lNjmQZ5lBFdLlFoFqCkPfsW0Pbu36MIjOuAoMW7IqDt64VRQElEkBYk4bwEDd8jwR4Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744480639; c=relaxed/simple;
	bh=DZ56n0eKefnFbUZyWLn3rzC+nxygYYzEMv7lIp+1PqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mfKVg/TTy/qqRZP/L3htLkzEFXHm/FGXZcGNXthw3faOtJ5Nw7J8itxoIzNAn95dlt5e1qfCUc9j1omQ33pyffYjXCb+9o1BjL6XwhJS0oq3y0xNX56+MGGYQm1WZXl5jQ3ncl+mjGnGr/eGVRCoeeMwxaQ+VdfMsylQdWrdVXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1opFFT2; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1opFFT2"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso5486857a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 10:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744480635; x=1745085435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZ56n0eKefnFbUZyWLn3rzC+nxygYYzEMv7lIp+1PqE=;
        b=I1opFFT21tQrlTQ3zSe0QjxcGU1xpSRgzl6JxbDlD2+IBkb6Gx7k7FTY6p12szRm/0
         NPaYpRuhSMd04DZ5574XAup3BgPNTHpCn5C5DdBtSH+NnK/AdWKmuKU7nFgT//3fjAF+
         JjT8sKsBoJojZHY937jzgoS3IN8WeROyYZohDiazThLibLZUj+5S0LM68SzKy3xsZpba
         F9kZYq4LtJwaHLK3aX7FlK/6v54bAwCP/UfCxPP59iAFH+V2bcS7CdurFS1k874AGAF7
         Ggj1NM3MGPuPC/aU+uMRThrn08Xh7giEtdt4eqOwQtPHCKOp88Nvm2YMC6kF7O6AMorZ
         agmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744480635; x=1745085435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZ56n0eKefnFbUZyWLn3rzC+nxygYYzEMv7lIp+1PqE=;
        b=eCiK4WiY2bx4+kAggfBLDXFh+QOBQ5F9XrXT/05OsV83lukWLnU7ZLdIP8hasGZFQI
         jCSE02fVyCYjd75G+sgMIkjFDDQ79w7yUiQMJ4y4dd9qxY2k6NOaX4ZJtTcGOeCErHQQ
         ajDTAtK53nVJRjRpzQX5Z7orMsCqhojcKtRzhxzEouIhd5lbXtiNU9EXcz6gApSxr6zG
         Uu1UAl0NZDO2fRKVBON12di/wtqzjtySyqL5AVNkXK2dRgqVIo44ltwGRY80o2k0Yqm8
         ZI1eV5PAkhA1wb/e954QSZsxGngyzmLTX9GWDVxx6Jjh32X054RAfC+LgWNaVXCKxWwe
         qmrg==
X-Gm-Message-State: AOJu0Yxx/ZeqjDDzlmOUccTarqiL3QIvcjzDDxhqXcTu3RPUSl/i0xJ9
	o5nUsYr6abIKVmBvIHI3sAaWKcEtKZnWDSGeTpLqY01Bsfmgs0OpA8GKT2xqyXfuy5VjNtJ2ZwI
	VMY42vnA6qlQo0AFr5l3RDrbWYug/AX2Jds0=
X-Gm-Gg: ASbGnctyoxa5vYuQKtkfFpG8Y2vP4YZ7PZgTKtC0rz0Ak8YgPYRzssZ8e3C3iWnVqQt
	RWRCd6JGXhNJachvSpASVnemXqRoxoscuH/IyJYmo1kYRVI4cQLeu4NMcXWSzXHNS6F6OuG1lYE
	KtNj7FftX3QzwXwBV7iybXLg==
X-Google-Smtp-Source: AGHT+IEGAdRjct3MWgczE8nQxdgSYf7c8noDdly+VYhKFRTv5qDS02jjIT9eCdwX6YU+hhZQvG1hTEtDwPes5WQKTqA=
X-Received: by 2002:a17:907:3f1d:b0:aca:d2f0:d291 with SMTP id
 a640c23a62f3a-acad34449acmr669735966b.5.1744480635438; Sat, 12 Apr 2025
 10:57:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHp75VdssCM74oji59QjPMEzrVuBzPOAMadA=Ds_52hOZGJ2mw@mail.gmail.com>
 <Z_mIrjA5k2CABoG_@pollux.localdomain>
In-Reply-To: <Z_mIrjA5k2CABoG_@pollux.localdomain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 12 Apr 2025 20:56:39 +0300
X-Gm-Features: ATxdqUG0S0Rq6d8aGkSImZeIS77-buL97-7aHe_4hO_p7FVQlw_zR9ufg7BU5j0
Message-ID: <CAHp75Vff+at=Ty0GD1PpROPJqHEAB+g94pv-CLbeT2aTN46uJw@mail.gmail.com>
Subject: Re: exporting a device type
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 12:25=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
> On Fri, Apr 11, 2025 at 10:39:38PM +0300, Andy Shevchenko wrote:
> > I have an issue with this change
> >
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/comm=
it/?h=3Dfor-driver-core&id=3De86cc69186051d7312711565803de586efd9b2cf
> >
> > (I think you haven't yet sent it for review, so this is just
> > preliminary look at)
> >
> > The idea of exporting bus type will open a non-reversible box of
> > changes when people will start abusing it. Instead just provide an API
> > dev_is_auxiliary() as it's done in other subsystems (yes, I know that
> > some of them are still exporting the type, but it's most likely due to
> > historical reasons of not thinking through it at that time).
>
> Yeah, most busses export it and provide a dev_is_*() macro, which we can'=
t use
> in Rust. That's why for PCI and platform I started using the bus type dir=
ectly,
> see e.g. [1].

I know. When I tried to do the same for PNP devices, Greg and others
were objecting to this. An auxiliary bus is a new thing and I don't
believe that Greg or any other kernel developer who is generally in
favour of Rust development will accept this particular change.

> However, I already considered changing it up by just creating Rust helper
> functions for the dev_is_*() macros and provide a dev_is_auxiliary() API
> instead. This also simplifies things a bit and gets me rid of the
> Device::bus_type_raw() helper.

This would be wonderful!

> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/co=
mmit/?h=3Dfor-driver-core&id=3Dd72c42c1da4149fec28e3b180654bf5fd88c2094



--=20
With Best Regards,
Andy Shevchenko
