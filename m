Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368872594BD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751452095; cv=none; b=ANxFv/5wcj86nJRcoJL59+7NxFnWVc48V0fHzX1aed/3P/yxJS6m+cQMuLLPcJ8iYnYuvX/QZZBiI1ts6lI+BYbrCLljgosdy+1eJRTtCjdaSfgHMMCcdo+gu7sTEY5CxSu3KVYvjJ3D9v8m7J4VDcMUmAWsQYZNVHntGi/Nh4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751452095; c=relaxed/simple;
	bh=gZ4Xvmc9S94aIQ64a3m42A4JCQszcUjp57tsUgaSW7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXF5qn/zqZTw5KEebgL43cGVogU0F+4IeF74TXa3mzHXAc853x7D6lon2xcaDl9PmmzSogy1G3ENmWSlsxjyLKn7NVL1sj1PO3pSnLs5vsmPWrpRd6oNCSz4+Pa7Z2y6CjNX+7R+UpF+VD9PJTBEH+9GIwOdlIpyo0k9AvJRo7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Iyx9of8R; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Iyx9of8R"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553c31542b1so4954499e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751452092; x=1752056892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YURhLQGbiJLurCUHW9OjBh2JnLsFmL1/bKNVdvHx6FU=;
        b=Iyx9of8RsSPZPWGMwvPbj7hUvmlz45uzy6gNtp4WdRW592hCbUI/i7CYaWASiTjSaA
         fJNYrZoyvUCyrqvvPZX9TB+V5/XxnXP6HXQlTNU5zAftmVbOSTZ8o6ASg8uRMEpEvNKf
         4D+SS4976UK1l1h3rzSbCZhoS4Dw8FFhi79h5ap0lF1h14zbQK/cp8j7YSKAsuLcxFye
         epr9GftyRO3bUVKID1vLDNLDYfjVPPcwtIu+mNkbqVzok8yIVyh6+peb9z1/53pEhTeo
         MHSkFT2xADrCuaCBOl2iI97yRveUn0JHBgbmMaDe7H1z3JYv8Y4kTHS/hxe4+BBKsq0w
         IhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751452092; x=1752056892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YURhLQGbiJLurCUHW9OjBh2JnLsFmL1/bKNVdvHx6FU=;
        b=byK9p/enK0MpfO2s5Mg+oRKXuImmPFiIcV9B5kenLsPkb1xBM4ND9MvOmMjGulVHgj
         +FQc5VD2mbQjraKB5K/7CM83i0plH6XS+TgXrDErV0iXpMJfIG9M1AR431IC88Xi7WYr
         C+l3aMsR9W7KjNjkkb2PbUXpwuzUoAQO8g7iUMa6wmjDuoU841uFQoxN0cD6o2hEixdC
         gS721JVLwSfMirCnGQzsZq8rzILovPigDLmuMDTIDCxpAgM3Ib6Ic/wVdD1xED5or8gR
         Ei/06D60tX2FH4oaySG0it00dY0PFo5zw6ZvvdUfv+YgzxH06SgOFsUo50s1UwgubEJE
         WqVA==
X-Forwarded-Encrypted: i=1; AJvYcCVETUA/b+lvTBLF9aDdasSC0EUs0aJmtklRXeVfhNLubNZpk4bCQvJ4raEels9KCfBaYRQ0MfAX8Mf9KDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhPlIpRwyC1FdytxFFIO4j3WWJw78j1kcUZVwlsUZyvLbZb46i
	uN+koFXSumqMY379EcFnxLoSXWEGw9UqIhLRRTIotxwZeEtwiWthVS0joBTdiwvXsUmFjCY2V02
	zaLx389WKucTH8gfgwzHKC8Lq23oEGUerrFL5V2avmA==
X-Gm-Gg: ASbGncuMRol2qgJc9Ym36dD/1Zi30N7fn2sbR3/RFp4kMk4OtDoT9a7EevDMJfPupji
	/uB9k95vHgmxQRI7pCH4bCD8Y3kykStkkuIkxB3MUpuhy65Iw6vce8gD2Z4EhIzu26sKO37ordv
	uspgwElPosuvEVXGfS65n12DZ9M97jzPaE/pDezNhubZIvYVy+S1Ed5RfnrpobGfj4/8kLVvcz
X-Google-Smtp-Source: AGHT+IFntWaR7vFiqwag2txbIDh3chfIk66OTxql0lBJBjsS6lAjyIb7XHFo+882Qd6JpS1AFziatnOs+85N+zVDVwM=
X-Received: by 2002:a05:6512:3b9d:b0:553:35ad:2f33 with SMTP id
 2adb3069b0e04-55628350802mr820922e87.37.1751452092289; Wed, 02 Jul 2025
 03:28:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
 <aGPrFnDxG4W7S9Ym@smile.fi.intel.com> <20250702035439.GA20273@rigel>
 <CAMRc=MftawBB4rtj4EKS_OwMCU9h53sA8QxcFq_ZY0MRg2OLag@mail.gmail.com> <20250702101212.GA47772@rigel>
In-Reply-To: <20250702101212.GA47772@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Jul 2025 12:28:01 +0200
X-Gm-Features: Ac12FXyPmng8A4Rlf0uBzP9jyNCMy8S7A5BxDak3acqfBrHs1V8IX7jP4eUyedg
Message-ID: <CAMRc=MeuMpo0=ym+FvDh5sCNXM00+iOSNFgTxMqagO78ZS64_g@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpio: sysfs: add a per-chip export/unexport
 attribute pair
To: Kent Gibson <warthog618@gmail.com>, =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 12:12=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> >
> > I tend to not interpret it as adding new features. We really just
> > *move* what exists under a slightly different path when you think
> > about it.
> >
> > So what are you suggesting, remove the `edge` attribute and polling
> > features from the new `value` attribute?
> >
>
> Exactly. I'm not suggesting ANY changes to the old sysfs, only your new
> non-global numbering version.  The idea being don't port everything over
> from the old sysfs - just the core feature set that non-cdev users need.
>

I mean, if someone shows up saying they need this or that from the old
sysfs and without they won't switch, we can always add it back I
guess... Much easier than removing something that's carved in stone.

Anything else should go away? `active_low`?

Bart
