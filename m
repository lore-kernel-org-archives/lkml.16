Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A527B2E40E;
	Thu,  5 Jun 2025 13:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130969; cv=none; b=JM5Ewp3pWfoua+JJwKTVjeeuDn28wVj+rCnzMLut7hWH3S2gT8/Jel2DX8lZqkuFrOUTByszyN/Vl8tNgIhqWkMQ2EzBkOUJ1d+jGFKov/rQ3e1Okv5qo7OZu0wLTxWr9K73+9NdtwBoAaBRJyNq0pYCo0XaWcSt6MJxIqWUD5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130969; c=relaxed/simple;
	bh=b1Aw1oATIRI4U6r0tJJxa/pTsMT8z1zs/O7llSWlNeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E8gKEZsbvTdoUQ6II9Y4rTgELFL8HZPsK1mBxs/9aojqGR0pxTJl0ycgIF8aupnCGw7K/H5y2ALfeekLl/ZG2e3TGF+9ht0CfpsMcZa/N9dL7e2jDRG+3H1E0zwWuzvvxhygVzGDZ/cueQ1rtz5Gi+fZx3GM40Zhfy4Y1BViTPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ix1rDgDC; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ix1rDgDC"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a43cbc1ab0so11002621cf.0;
        Thu, 05 Jun 2025 06:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749130966; x=1749735766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1Aw1oATIRI4U6r0tJJxa/pTsMT8z1zs/O7llSWlNeU=;
        b=ix1rDgDCjTd57vWtRaAmhV5aGPxw1jbWIwWFemKkUkDZGE8TNgFhhW8HniIIsQpd4G
         TcTUlgVPovgT3KeAT4x66hZ95Ah2OYX0k2owVWJ1HfERI//sEPGMuZlUh4kdl3R1lWpt
         qBIkkM3VkoYVQyga1jeJCJG2xWkhlwXCn6PGGNlmw0oT0o6rj8EF0+UWKdrJGDGYXGcu
         YRLvaOACCkcJJ1PKcx7XrkyZ9N5apXJWQZqxcdI9qsygRnTHRTES5IBnO6MhebqdQ2sM
         KgSmCuM51B7iC0hUuKvWTZpPlaQArooekxUbQEJY8VxT1udBKtrDUwNZwJhGGBidoXEf
         9wqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130966; x=1749735766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1Aw1oATIRI4U6r0tJJxa/pTsMT8z1zs/O7llSWlNeU=;
        b=DQ7XqJgFgY0LiGhvP4xHD6tDe1lh4XAu9we7ceJuQWGCDeocHdB19bQhb8UXxNp/ia
         +nrOBYiyh4ZphNLS+xFYwZRPKbnFG83Icgl1c1jSIrYySE6H6CRQCcWpmRi8QFgg6Y1e
         J4chvw70w4wOHpkYCrLcz+1MJM3LkAXZEKdP8/SYXEIE/auoE5jpwguJ67JUbcSKb2pW
         NOqdkkrnX68YQM/Yne3O7Nwi0SmpltjNUoIS3n2E5ah0b/m+nPAe6JkBpOKJyqE/lh02
         xEGZWmD+Kjc1qLJy0XUMIfE4d2WU5HbW9NibOsGLiM+LyXBa3lwGizDt7BYjPRl5hoah
         TzFA==
X-Forwarded-Encrypted: i=1; AJvYcCVxwGmVw7PO5gNVp5zNlFo4cHLLQDgrYsXYW8mLBvLrH7DrKdLY+LJ3rDY7UXemZ/eMFxLxXMFq3C37@vger.kernel.org, AJvYcCWnP60Tk44akVbyJuxQtqSEuVzJvdjn+Y7Qeaqpc3AL4uE54frCiz21wzsq40ZJOB8yvkcBwg2IIu95LXm5@vger.kernel.org
X-Gm-Message-State: AOJu0YzcZmTNRWhDfLtGy9f76GnbgJc9aYjzJ95FrSOsmgtzWq8gDxhJ
	kIz1L2H5jNJ1gqO3RYnMF18rfHsnuIJbulOGU1DJ7s9WXzFBnubjv5f3MHPMF05kRqq6rXubJB2
	b5kQvpVzjxZebf5V8y53kZvvN1HfGJEyUi3uvGJ4MLRk9
X-Gm-Gg: ASbGncvb78wTwfVNCeZfBaNLqYjUS3B+4OySBN/XHuElgc3ZFDmQpWraOfHCGYVrz+f
	BMdB+Rq/9yKCjRkAUeG0K3Nge0Y+W9RhwwpeWbPz2+klxh2oDgIK28WMSowidfspBqcKm5lsM16
	BdcNXlJqRGBDryk/F2P4jFIzunji64rDjxEOHHAjfSYkfX
X-Google-Smtp-Source: AGHT+IG0MMWP+x7U8tsJQ6YRTMkTZzqpNjJO/whvvcK/0u3aHGtE8WDWz1uwITy8x/Dviq7md8X536qbBtEfOUabryE=
X-Received: by 2002:a05:622a:8ca:b0:494:b2db:eeca with SMTP id
 d75a77b69052e-4a5a585f3ecmr94610721cf.26.1749130966422; Thu, 05 Jun 2025
 06:42:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com> <6656934.DvuYhMxLoT@workhorse>
 <CABjd4Yx05SCm+03jWbsEP-A5AuhL14wLj=+VdKyQgqMbnxi3xQ@mail.gmail.com> <512E950E-E8CB-443B-8E47-79F073D217E8@gmail.com>
In-Reply-To: <512E950E-E8CB-443B-8E47-79F073D217E8@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 5 Jun 2025 17:42:38 +0400
X-Gm-Features: AX0GCFsTzLQL93s6ofhHt9HSu3m-CxEmKHnPQLzRarGwazT_7OOgybpDR17U5os
Message-ID: <CABjd4YxGQP=rH15EX12w36b7+82Dedf+rVH3v5V6gBwNv3V3iw@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 5:22=E2=80=AFPM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com> w=
 dniu 4 cze 2025, o godz. 21:12:
> >
> > On Wed, Jun 4, 2025 at 10:38=E2=80=AFPM Nicolas Frattaroli
> > <nicolas.frattaroli@collabora.com> wrote:
> >>
> >>
> >
> > Frequencies are fine, but I don't think the more power hungry big CPU
> > cluster gets any voltage scaling without it. Once I try to load the
> > system enough that the governor decides to bump the big cluster
> > frequency up, the regulator stays at 850000 microvolts, causing random
> > reboots when the whole cluster starts starving. With the patch,
> > voltage oscillates between 700000-737000 microvolts in idle and jumps
> > up to 950000 under load, and the system seems stable.
> >
> > Here's what I used to monitor the voltage (there must be a better way
> > to do it, but it works):
> > sige5 ~ # watch cat `grep -r . /sys/class/regulator/*/name | grep
> > vdd_cpu_big_s0 | sed -e 's/name.*//'`/microvolts
> >
> > And in another terminal:
> > sige5 ~ # stress-ng -c8
>
> Alexey,
> I see you are using rk3576 board like me (nanopi-m5)
> Have you on your board correctly working cpu dvfs?
> I mean: [1][desired clocks reported by kernel sysfs are in pair with [2[]=
cur clocks?
> In my case i see mine cpu lives totally on it=E2=80=99s own with dvfs:

Hi Piotr,

I haven't tried to validate actual running frequencies vs. requested
frequencies, but subjective performance and power consumption seem to
be in line with what I expect.

Big thing to note here is that on Rockchip the kernel does not really
set the CPU frequency directly. It only issues an SCMI request to the
ATF firmware with the desired target frequency and provides sufficient
voltage via the supply regulator as defined by the respective OPP.

What the ATF firmware (running on a dedicated MCU completely separate
from the OS) then does is it takes the desired target frequency,
matches it to a loop length for the PVTPLL block via an internal
lookup table, and PVTPLL then determines the stable frequency that
this particular chip specimen can run at with the provided loop length
and voltage. This frequency then gets applied to the hardware via the
CRU - and as you can imagine, it can well differ from what the kernel
was requesting via SCMI.

> Requested is [1]
> Running is [2]
> Measured is [3]
>
> random read 1:
> Requested CPU4: 408 MHz
> Requested CPU0: 408 MHz
> Running CPU4: 1800 MHz
> Running CPU0: 1416 MHz
> Measured on HW: 1579.03 MHz

Hmm, have you tried pinning a particular frequency on each of the
clusters, so that the governor doesn't change it while you are going
from the point where you read the "requested" frequency to "running"
and "measured"? Also I think it would be a good idea to "taskset" the
measuring thread to particular CPU cores - otherwise I'm not sure what
it shows when the scheduler can bounce the process between cores as it
pleases it.

> random read 2:
> Requested CPU4: 1608 MHz
> Requested CPU0: 408 MHz
> Running CPU4: 2016 MHz
> Running CPU0: 1800 MHz
> Measured on HW: 410.33 MHz
>
> random read 3:
> Requested CPU4: 600 MHz
> Requested CPU0: 1800 MHz
> Running CPU4: 816 MHz
> Running CPU0: 1008 MHz
> Measured on HW: 2275.07 MHz
>
> random read 4:
> Requested CPU4: 1608 MHz
> Requested CPU0: 1200 MHz
> Running CPU4: 816 MHz
> Running CPU0: 816 MHz
> Measured on HW: 2114.58 MHz
>
> this is on rk3576
> on i.e allwinner h618 or rk3588 all looks quite normal - [1] and [2] are =
equal...

Are these taken on the mainline kernel or Rockchip one? Binary BL31
from Rockchip or opensource TF-A? With big-core CPUs linked up to
their supply regulator (as per this patch) or without?

Can't see why the behavior would differ vs. RK3588 though, unless
there are some bugs somewhere.

Best regards,
Alexey
