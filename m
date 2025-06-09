Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C1A13C918;
	Mon,  9 Jun 2025 14:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749477946; cv=none; b=EAAw3jgRp0OuxyNFcPsFg9mz3mPlYXdRSu8x2YsnFMNRUUoxqfkL8b0hmsMGJ4423/h926nrIwDyqokPGjIog4uhXUL00zEezIiu+Im++YBwF/eoLtyvur5Lw8HsV/Njx0wmkRZANc6XSUZwij1c8KlbNBYXVJMXZdqPB0ZBT8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749477946; c=relaxed/simple;
	bh=cMazsviZmuFGeu2TlFmxbJWsdCA2lvcfnWOiUPKOsn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+iQxxsFYifUE4hormpWLQj89Ntr/nWSB8S8V/1Wx+vfYnpajkmuGmUr87ECt7YbRRDgNnTtVkVJeDCvya14TB5WuKUp9pjVxIjlHPYCdt0Ao9hptofDKHFrJXf0QBtualoDAkfx8MZmOmWhX8KTvrd4iXnuZJ1+n7alW+M9AeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWEbWjbf; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWEbWjbf"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4772f48f516so57014311cf.1;
        Mon, 09 Jun 2025 07:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749477944; x=1750082744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5em0HjCiCNml+pK7wkeftBLKShhy+xkQwHSxQRlfmBI=;
        b=RWEbWjbfDN3EWcvRhbsBEKXMcFpX3CyY054GfjHrxfVbwrK5ADPj1C/ltEyuTEG1Hy
         2bqkpE2wSQCzKyYw0hekbmfVazg9/MSAjCKqz1FC5VTTwrWok15RlG0a1jBI/4cLTPM8
         Af9zg9OyEc5gcs4bIvinetLOCE5rgsvD/7eqdZ+IRYb0hSEBMxQ65D4DCFdGTj5gB0f0
         DpXMX0eC0w8hgQh20gjl6Lqxvn9C2sT+vrBuwnt34xac410owdEyvdtJeyHdS3HSpqEF
         UFEgju1SH+8uX+rVlaUV+Vf84/WuWrJ297XTT2XBIfOzV5c0L2hTLCrLl4QwEVhQeKzL
         KaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749477944; x=1750082744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5em0HjCiCNml+pK7wkeftBLKShhy+xkQwHSxQRlfmBI=;
        b=uzOaVBW7T7LuPTUFpWohfUcz2J3fyl4NG3SsVz/J0VUJd9H8FnjNBPDRte06Cmp9NQ
         7T1DdXaNq4SQ47lVIGVH8XmjgbJhVl7ZMt0YNwDUjS0sI+KXayWcwYt8pShkwvQrPD6I
         UQci5c6nBQiUb9Kc5czg5pUryG/+oaHIVe7V+RSexR7Kfzky8TPtHVVEjc7GpAgtKnVz
         pMyzeXDXudodCfOD8R8a/rKv76rR2X5deMqQ3HNqbTxBIYVI62F6gkiWnNTJWTVnw6eT
         TtZ3ulda0kaA0OVklA2ojpV+vt3V7ykS5m6oSYTuJrhx0W9RhAv5hTHFACVd6wOhKIKh
         XbdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9m6+lI8wehO+uDog0fLF12z7cl1mS+1dU37Xfa/JxC+LRJUcLU1RnJnAh7CnTjpY+nup4lPE0CH8pupNm@vger.kernel.org, AJvYcCXoO66s/cBdm9ttEQ6sFkyM4ZYftuAKnuOq8qPRGLkBCaSntJuhyYNv1gm1W6YV8PL0W0tBUxhVsIXW@vger.kernel.org
X-Gm-Message-State: AOJu0YxLj7CQT2BO3FZUHP0JIV3XIg6N8OVj+/wQmnZFxJcV+IoEgupF
	SjlFP53bStH0yPltki03yVz/op/91u3cyhbxMWzSl6SsgikUayWhXy5DM2C8qXm2+u/hkIJ+ElB
	XAqqxkpN8Hs1U3C7v8eWv1CiimUFQ1yM=
X-Gm-Gg: ASbGncs+9cOuTmaV4Xjm6/ZQX4KhoW3mICzTxDS0ImQZ4CR7elUUGdk5o/+NrZ44/rd
	fl3xC55jYKGUDtmPAp+kGTPRpY2ImoEn2nGachsj2LNL+IzXIl0OjTG9dv8A9ZoAoYCusEqU+JL
	dUYCtbB55M7j4uIhqQVl/6dXBD3BrBTSY=
X-Google-Smtp-Source: AGHT+IElRSJZYvwLgNDSXxeUFeCJ4WGpztDtPuM0pyb0/v8zrLeTq6YP4S0P3QPuP0k+uFuxoBLonx/Q+SmnlY/xFZw=
X-Received: by 2002:a05:622a:4d08:b0:4a5:99a8:eb21 with SMTP id
 d75a77b69052e-4a6f054f796mr16515991cf.22.1749477943641; Mon, 09 Jun 2025
 07:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com> <6656934.DvuYhMxLoT@workhorse>
 <CABjd4Yx05SCm+03jWbsEP-A5AuhL14wLj=+VdKyQgqMbnxi3xQ@mail.gmail.com>
 <512E950E-E8CB-443B-8E47-79F073D217E8@gmail.com> <CABjd4YxGQP=rH15EX12w36b7+82Dedf+rVH3v5V6gBwNv3V3iw@mail.gmail.com>
 <90218D7B-0CF5-4F5D-969A-909A44E6044F@gmail.com>
In-Reply-To: <90218D7B-0CF5-4F5D-969A-909A44E6044F@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 9 Jun 2025 18:05:32 +0400
X-Gm-Features: AX0GCFuWBU5QiUTtg-6bvXrLknfduxLhtbNHfqrkbx632DneSAm8rotxzSeH1rs
Message-ID: <CABjd4Yw3FyVS0MBk2WdWKb24vkqrb09Tx3tj6B-xsmG1-Csk7w@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 8, 2025 at 11:24=E2=80=AFAM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
> > Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com> w=
 dniu 5 cze 2025, o godz. 15:42:
> >> Alexey,
> >> I see you are using rk3576 board like me (nanopi-m5)
> >> Have you on your board correctly working cpu dvfs?
> >> I mean: [1][desired clocks reported by kernel sysfs are in pair with [=
2[]cur clocks?
> >> In my case i see mine cpu lives totally on it=E2=80=99s own with dvfs:
> >
> > Hi Piotr,
> >
> > I haven't tried to validate actual running frequencies vs. requested
> > frequencies, but subjective performance and power consumption seem to
> > be in line with what I expect.
>
> well - my subjective l&f is that  - currently - my rk3576 seems =E2=80=9E=
slower" than i.e. 4xA53 h618.

In my experience, native compilation of GCC 14 using 8 threads on
RK3576 (mainline with passive cooling and throttling enabled): 2 hours
6 minutes, on RK3588 (mainline with passive cooling via Radxa Rock 5B
case and throttling enabled but never kicking in): 1 hour 10 minutes

> This directed me to investigate this issue.
> Test run was media player (mythtv) where ui has gl effects and ui gl tran=
sitions =E2=80=9Espeed=E2=80=9D are quite proportional to cpu speed (and gp=
u).
> My overall feeling is: ux is comparable to slow socs 4xA53@1.4GHz/G31. Th=
is is with mainline atf + collabora uboot [1] and on-demand gov.
> I done test with replacing uboot from mainline atf + collabora uboot to b=
in. dump of vendor uboot (2017.09) and with this ux become almost as expect=
ed (i mean comparable with i.e. rk3399).
>
> I done test with perf gov. and
>
> 1.collabora uboot[1] + mainline atf 2.13
> 2.collabora uboot[1] + rockchip rkbin bl31 blob [2]
> 3.vendor uboot (bin dump from friendlyelec ubuntu image)
>
> [a] on vendor uboot:
> Requested CPU4: 2304 MHz
> Requested CPU0: 2208 MHz
> Running CPU4: 1008 MHz
> Running CPU0: 1008 MHz
> Measured on HW: 1580.11 MHz
>
> [b] on collabora uboot + mainline atf:
> Requested CPU4: 2304 MHz
> Requested CPU0: 2208 MHz
> Running CPU4: 816 MHz
> Running CPU0: 816 MHz
> Measured on HW: 808.72 MHz
>
> [c] on collabora uboot + rockchip rkbin bl31 blob:
> Requested CPU4: 2304 MHz
> Requested CPU0: 2208 MHz
> Running CPU4: 816 MHz
> Running CPU0: 816 MHz
> Measured on HW: 812.49 MHz
>
> in all cases all clocks are constant as they should
> Interesting that on collabora uboot [b][c] measured clock is 808 vs 1580 =
on vendor uboot [a]...
> sw video decode conforms this diff: hd h264 gets cpu load: 172%[b][c] vs =
87%[a]

Can't see how u-boot would affect CPU speed in Linux, as long as you
use comparable ATF images. Do you use the same kernel and dtb in all
these cases? Also, what's your thermal setup?

> So summarising:
>
> 1. i see kind of issue with clock values (e.g. perf gov gives 800MHz on m=
ainline atf).
> imho rot cause seems to be in collabora uboot
>
> 2. on-demand gov. seems behave much more like powersave.
> this seems to be 3576 specific:
> -on 3588 change from perf to on_demand is hardly noticeable in ux

Not sure UX is a particularly good measure of CPU performance, as long
as you've got a properly accelerated DRM graphics pipeline. More
likely 2D/3D and memory.

By the way, I'd rather go for the "schedutil" governor, as it is more
forward-looking than "ondemand", thus should be more responsive to
load changes. It's also the default in modern distros AFAIR.

> -on 3576 such change makes ux feeling noticeable slow (like 4xA53 soc)
> i think this is more related to diff between scmi mcu gov algo in 3576 vs=
. 3588
> (imho 3576 algo has high latency in clock increases when demand happens +=
 too short delay for  clocks decreases to save power)

There might be some difference in how PVTPLL behaves on RK3576 vs.
RK3588. But frankly first I would check if you are using comparable
ATF implementations (e.g. upstream TF-A in both cases), kernels and
thermal environment :)

Best regards,
Alexey
