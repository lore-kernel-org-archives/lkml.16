Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEADD2253F8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749555427; cv=none; b=Cv/+I6w4n0/vZLply20txs89GyTXLNabn74mwuILyIDFDOWmZa4i4/4PvXHryTEUdwfOy7lt81qAh+6pDJoM+HCWp1+xtQwPoZMysjDxZyy0ccWShtWETBHJDzrcvWqrLGnUXcs95k3TBowX3adoEF/W39xln+vfvmPvFysELL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749555427; c=relaxed/simple;
	bh=Nnx5SwmZD0+RTHgrHJfEuPfmmfeN1X0Axl/gTjNoQjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blUS29VgjtxCrjcyMGx83sXhQLq3r/Tph+EdyLtXY+XD6Q6VyZ/7e+w5dydn5S3pOiEadqGkUxS0Hre1nuH6o2wp+dWjb0KwhvHQlGbIFwjwZXmiDJP5jocGj8XoOWEQJn97s12wquVeiagMJfFsUvAK6s9Y+MmHSdCAbrEGGHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dY5IAR3/; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dY5IAR3/"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6fae8838c1aso2430116d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749555425; x=1750160225; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IEUo4OXi/6u8Jsr6TBxYCa+QoyT/MABPEkrypIa5tU=;
        b=dY5IAR3/zwN7HvLpIlZ75fM2eIvKEFNc42D+9Zt3vuyraa7WsG9le969bFbTUo778Z
         1f7msh0V+JsTz+R1zknKBNHeIP9j4CRz8pQO3QRfnmX54fJWx8rHaWJ65ZsrAMTPyS6X
         QcK3I8wb7g6daMP9blSHwKXfhpk168NuqHHZFhq6tiAHFYuM6m3UYgJyu95BDu7mNB4e
         sOL+bFbZVgrvZXCs2XQUy5+h+iUE1p5uFdjMPua++P0vaihIdwZETHbKH5ZZHdP180lN
         XAaMmd7JSrknYE/+Hbuih9HCyKAtrXIZy4yVnwb1mMmJBvDg1nJytM+Tmdbo6SmoQ4ZL
         w6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749555425; x=1750160225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IEUo4OXi/6u8Jsr6TBxYCa+QoyT/MABPEkrypIa5tU=;
        b=UumwxcTXO+yqdnIvSjGUYWNlxDG1S6bB62MPYgpXrbD2GmaMwUxiHVaSm9lgpN04zh
         lJxeKgYkx+raHDFaewddC1RNoA4N8kKc40mSccixYmRMMHakDLD2sZRVT577RFNZfKBe
         c8HX6xzr1Kq3VG1adJxJwLIOL7s+ZZm86FR8gw6KGIvyuRcA/X9EYXEKrSmACS0uOQld
         YDzsktQF19SsjoZ6X7pRKcVVwEHCWoj/Z6r10QHVwXKZOQtwyrH5x+oVrEUhHnNmhWgS
         VcTugwH51Bi2alu5FFbltzIj/6tPRUm4uSIKAulmaYPPFf5x8bKYrEV4uvV1CQo1FWCh
         OyIw==
X-Gm-Message-State: AOJu0Yxjk2O5dujROl+eZ7+abEAu1GXZabFo/SKpMkyAcY+U/jN1p0D2
	hMHdhEWmVzW2i83qWdMs0cQZlYJ1hLVSwpmSyHuKwlfW69VUONEe2mif7y/tu9xcX9kfPEMwhnq
	zg2Iafw2UIsc0tluV78ZRYQO6Z6IwGryhD/o+vDSA+w==
X-Gm-Gg: ASbGnct0fbxb10QGIXmUocqmM1ErrMPSXuwo+SULC3JofG64lsz04ZSNr3WNh+tK9lm
	aUN0HEUzKu4qM8giBchWjzs8Tr0hj8SRudHKDOBzszhUm8HBJdMrDggPo42cyL3Y0BFwv3/9Mho
	P8fc+dmAftrMBl9ra9NsZd3obZB4a5FQ8TIzNO6V3MaA==
X-Google-Smtp-Source: AGHT+IHvHKo08me5RcB6HhT8MUj1njWXYeU3P86l+7s/He8833skTN9xQoNPfcqRdrNFzqssiZdslfW5Rg84q+3rI0M=
X-Received: by 2002:ad4:5d44:0:b0:6fa:c5be:dabd with SMTP id
 6a1803df08f44-6fb09f8a766mr87178436d6.11.1749555424663; Tue, 10 Jun 2025
 04:37:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYuppX5LeRjOAZWsYRCs76PVbnv-TN_RrszhDsk=KregyA@mail.gmail.com>
 <15979303.uLZWGnKmhe@diego>
In-Reply-To: <15979303.uLZWGnKmhe@diego>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Tue, 10 Jun 2025 13:36:53 +0200
X-Gm-Features: AX0GCFt6fIa22bGlOZEBQVbwxbv765S6LyHqHyQH8BFAYJiOCtlXCLCPP7EEZaI
Message-ID: <CADYN=9L+Gao0w_CThNd96-yYbZDMZnwY7RvagCOdzUC4rKc-Ug@mail.gmail.com>
Subject: Re: next-20250610: arm64 No rule to make target rockchip rk3399-rockpro64-screen.dtso
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Regressions <regressions@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Peter Robinson <pbrobinson@gmail.com>, krzk+dt@kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Jun 2025 at 13:22, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Hi Naresh,

Hi Heiko,

>
> Am Dienstag, 10. Juni 2025, 12:25:31 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Naresh Kamboju:
> > Regression while building arm64 with the Linux next-20250610

[...]

> > https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqDgm=
zjEl7VszYE9/build.log
> > * Build link:  https://storage.tuxsuite.com/public/linaro/lkft/builds/2=
yJ4IOQa1XxMqDgmzjEl7VszYE9/
> > * Kernel config:
> > https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqDgm=
zjEl7VszYE9/config
>
> thanks a lot for this notification.
>
> I'm surprised that overlay build at all when I built it yesterday.
> But yeah, the dtbs_install target really broke with that change.
>
> I've amended the commit now [0]

Thank you for the quick fix.
I applied your patch and built it, it worked fine for me.

I built it like this:
tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
--kconfig defconfig dtbs

Tested-by: Anders Roxell <anders.roxell@linaro.org>


Cheers,
Anders

>, to change dtso to dtbo and ran the
> dtbs_install target sucessfully with that change.
>
> So on the next linux-next creation, this should hopefully be gone.
>
>
> Heiko
>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.=
git/commit/?h=3Dv6.17-armsoc/dts64&id=3De14491aaa6ff598bbe9d462e44c01ac6575=
4f445
>
>
>
> >
> > ## Steps to reproduce
> >  - tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
> > --kconfig defconfig
> >
> > --
> > Linaro LKFT
> > https://lkft.linaro.org
> >
>
>
>
>
