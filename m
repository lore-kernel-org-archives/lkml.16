Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D263825DCF3;
	Fri, 25 Apr 2025 15:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745594879; cv=none; b=AwpdHwpjHPRJTiEgjGwxSkAPk6gp5+GdkcdGchdYD8y2yRQ74iB0zlFDbEM8fQRWzYp8R+mCyAKhJWMEvUdPoOVVApGPh2hag/BQvYmWE98nD2/DJWQDmQzC/OLYvaIoR9fVavRUiyzcme/eGgIYQ46Jht8P/HHL2JMfXOg3098=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745594879; c=relaxed/simple;
	bh=Mrk3RA2eQQoTudoCKFs8L5iamijk95XDayQrPOOfxBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2nTnPPVlivBAdCeXYl3f4RtJ28OmAfwr5dV6l19PF/p/BKNmxR0loA+wegyWsyAmvlUQslZm5xcijoQWd441LIFe66ndAtfqr59SxM/IicfPm+/hxAX6YgF0L9MSnmT0oTdCKIMvxw8/1DdSi2fffqIYk0NP9pi39XiMeyZ64Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54c090fc7adso2401010e87.2;
        Fri, 25 Apr 2025 08:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594873; x=1746199673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=feUYG+ADKxy5u46DUzbwJ3yPnREVGzj+yGdWXxrHRlo=;
        b=LBy85nMHHkMZij6yvph/3oZTaJXktdzBpjCaSQYxZ2cLW05FX9wd7JLrhcq6CN10km
         kN+pOYMPgcTIhIhZ1FUIVznDWHkQFaHbC5EcOS3gmg1aFUQwux59WdJvIrHXmSRGV2dQ
         WlZul973OU3uYYIyWwAZ93blyoOBTBQSQr6uJgwqntK6kyhD24KQolhBO4mlbm2EoWh0
         FForfS+3NllXRzuMTzkntU5SYGz96AiWnnpjejf7wj0kBFtEIFN0Lg5AkH5RwTzLuGcp
         qggot/co6zMaPMtNiVauz6iQ9B+VXTPVSKiRHEnm09QKlav/PXuUrQOyFDaCdE9fy3QD
         iwlA==
X-Forwarded-Encrypted: i=1; AJvYcCUuTW+97tAgvg7jOdk1KzBeSqcEouUaJj5GlQCZOR61AGAPQ3pA0yEnfkU6FQsdkLIy/jLWuuIq4xVrmdIr@vger.kernel.org, AJvYcCXUZeG2GOnJURthemkC/5JfnL4EGyp/Ify0Rb1p16XtxRXgxigky0GcQY8Kg6awR8aqGKECdqMH9+Rl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2D1KGHZWlM6PxvmQBbUCTif7bW85srnZ3a5xaMpRyNzHq+v0u
	D+MKdKPM9qCT0kjG0paxjPurXFaaVrbD3XFfErEv1TQFzDQ6eM1iMkW2U6aXVb8=
X-Gm-Gg: ASbGncsE6whmLVFjJ8SQXFZjy4G8KKjE6yEo6lA2Sb7uMFA/YBcTKVCGCHoMtdI4WZC
	rfdGbFoZW7tK1vhTKEQG0dGnMhH21JAqQcFYQZbbvHxknnmZ9ivrm0dVLsn/SLVT2OvWq+GydWJ
	PsYKvVJbubyscsw9eSzO3i0FiB8HfPLXiJt+p9NRFH5Y1jzQr6gPBBZZikBWOxBC5thfrtJkwkP
	PGi8+LWrCoQjHhffD6GGaUGe1ES1rzR2bQAqnMw7HdkZLrqTfWMjbz0GwAXPV8qJgV5fZF9O8B3
	0XJXiluDZy6V8OW+YxDEPjpLbhWj9VNey3OtEKOZLpCcMw1TKf3+VnHSJp4jBc35ShRYTksuIA=
	=
X-Google-Smtp-Source: AGHT+IHBfteQaylSiuYSamiPpU3Z80e8jJru7N1wkThdV/I0ZHX0I4g0UZ+sahUiiCcHCcOOtwRBrQ==
X-Received: by 2002:a05:6512:3090:b0:545:652:109 with SMTP id 2adb3069b0e04-54e8cc0cb3cmr967904e87.51.1745594873407;
        Fri, 25 Apr 2025 08:27:53 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e8cd4c51fsm275885e87.122.2025.04.25.08.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 08:27:52 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-310447fe59aso27686631fa.0;
        Fri, 25 Apr 2025 08:27:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWX2SAt6YO0eyS9+yaB2DctZwPJQ1foWYus8hsURZCFB9lxectXQCozn3M1JSR34qlGZogFPon9h5QuYiPA@vger.kernel.org, AJvYcCX+GPaq4pI0OxSW9bHGFrk/Yl6KGnXe3ZRmZ8+gDRYngggzG2KfIwnfgbQAc1CHVtYpwcfn7Usb/F9y@vger.kernel.org
X-Received: by 2002:a05:651c:154c:b0:30b:efa5:69a8 with SMTP id
 38308e7fff4ca-319080e4888mr10622571fa.36.1745594872478; Fri, 25 Apr 2025
 08:27:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425023527-GYA50272@gentoo> <20250425030006.45169-1-amadeus@jmu.edu.cn>
 <CAGb2v649ntfAEUdV5S1wM8nUGhvaOP-RBw07XcxwdbafbC2PYQ@mail.gmail.com> <20250425044747-GYA50408@gentoo>
In-Reply-To: <20250425044747-GYA50408@gentoo>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Apr 2025 23:27:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v650hzgWGC6H4gL-YkaWCw7RJjBYkdcXGwXaRCa7T6G71Q@mail.gmail.com>
X-Gm-Features: ATxdqUHtlXlW5ElJgIFQbcm5VC72kEfcPm_-jaGId3qhnAcscv0DyPelGJ1i-0I
Message-ID: <CAGb2v650hzgWGC6H4gL-YkaWCw7RJjBYkdcXGwXaRCa7T6G71Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: allwinner: correct the model name for
 Radxa Cubie A5E
To: Yixun Lan <dlan@gentoo.org>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, andre.przywara@arm.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, jernej.skrabec@gmail.com, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, robh@kernel.org, samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 12:47=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Chukun, Chen-Yu,
>
> On 11:52 Fri 25 Apr     , Chen-Yu Tsai wrote:
> > On Fri, Apr 25, 2025 at 11:00=E2=80=AFAM Chukun Pan <amadeus@jmu.edu.cn=
> wrote:
> > >
> > > Hi,
> > >
> > > > It seems I'm a little bit late for this, but while we are here,
> > > > Can we also append 'cubie' to dts file name?
> > > > e.g. - sun55i-a527-radxa-cubie-a5e.dts
> > >
> > > Usually we use the device name (without the vendor name),
> > > maybe sun55i-a527-cubie-a5e.dts would be better?
> >
> > I agree with this one.
> >
> I personally would prefer to keep vendor name, it's more explicit
> and easy for poeple to distinguish/find the board dts

We really only have the board name, which sometimes combines a brand
name, but not the vendor name.

Same goes for all of Radxa's other Rockchip boards. The file names
are all rk3xxx-rock?????.dts. And all the LibreELEC boards are
????-nanopi-???.dts.

ChenYu

> but, this isn't something I really care, so I won't insist on this,
> please proceed either way, thanks
>
> > I can probably squash in a name change (since I'll be squashing in the
> > SD card slot fix anyway). Andre?
> >
> I think it is better
>
> >
> > In that case would you prefer to keep your current patch separate, or
> > squashed in so that everything is clean from the first commit?
> >
> > It's up to you since you lose out on commit stats.
> >
> >
> > Thanks
> > ChenYu
> >
> > > Thanks,
> > > Chukun
> > >
> > > --
> > > 2.25.1
> > >
> > >
>
> --
> Yixun Lan (dlan)
>
