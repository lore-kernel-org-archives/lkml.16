Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1802E11CC
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 03:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749872002; cv=none; b=X7+WKqnRZVFTdsd4yPoAdngXeD4gznqVpNeOWLfuiz9gRjnctt2UFB4OkP7K/uSK639avun0PzU1KTs8cOgQtJ4J5H3uUCpLpZXzPUhkjqblmG28pvcSGcG2SeVHw1vLpWE4t2VHfrLxnBsmWpNw/yR4GyzArrb9y0iB3q/Nucc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749872002; c=relaxed/simple;
	bh=5zj1CCPqCqbanv6cOh5uOvtbh/D95b0Hh1gqZskXSVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PMYWcus8LonSlXxF9KgOQzd2tTAL58OoOQWDGdOUFNCc6m1cMbWyQRD6UUchQ46+/u3BRj3EGoi2fmO/8xHYMUNaelGm5JrL2Ri8a/OfI7i96Vq0Eu2CT3dWA48shn9F8HqkM4OYVihJpsdOb5oBezTfsYXRyVBLNDLEr7e9BDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Nh2WYqgO; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Nh2WYqgO"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7086dcab64bso24497117b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 20:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749872000; x=1750476800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJcrqi5pwJ9wED2HFmauPlfgqPYzc6rbhv7dX2NmqNc=;
        b=Nh2WYqgOGd+zdvSTbYg/MDff3AMkawkNu4B+RdlTQCy2QZmxd+T/WLujMmiPuOuoJN
         3w++h5wdnrNOUOwBiOjG3mi8XJW0ZtJx3F38YUIkWvS1SLjmpBfdgzlv2ns6jbEnOw9G
         J2CjT5YunT5AbZaWhRIq+LtD7DZ2BYmWcGV8ClTxuxfLl2I9D98C/LRB0fnfOV+ETSoN
         dTiE4TPxCNSYV4uSewfyhkrJKY1Lw8dSiYQtQw5ALRHQAe8AkZZ9gxkzjgbp/msN+Tyn
         IQFYjFgg/E6am66PHeLX5VAEY6GOAUhE6v/J0b1fOfvNzfU+jXGPUiPDnITkX02qy1XB
         cCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749872000; x=1750476800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJcrqi5pwJ9wED2HFmauPlfgqPYzc6rbhv7dX2NmqNc=;
        b=PXuilbG5+BuOC7USu5yjcBCvpIpI9VRoz/aXml1lrYE8gLLFLlifyMCVmCkjwYEIq1
         WXpXenE5K/WRtBNc/mTgL97x9HiaiXXO4abs6Ymn315Lk01qTY/Xf7ZOg+5HKPDA7LAV
         FjsmWGAcpZB0hb/ahPTYhGndaSWk1YOrxwaJZp9bni64C9+yrbp2yq5ziQ1dMjNLwcWh
         Qh2LToU+3jZEH1rzi6vr8Gme6bycQpwTe7u+tA6SURKWMkyAUkeWBwK1O+FOKUrIa61y
         PosaGmav9t/OaaDzAtaNQHXQDDXdCmOXeF5zT1ikdTn4J68BgFnGPRu9xMEkNPbSx9Qw
         QpTA==
X-Forwarded-Encrypted: i=1; AJvYcCUHO+xM6nUo81vw5ILUgMiL0Nn+dLB2+bZSd9p9mntVQMoLY+1mFETmm8/NirVDwXiqq1R0AAA8izdkBO4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb3OMav8uQ8iUPc6T6TQZ57dnXcGbUv7gBXtRV5s8h6N+OCnUR
	9EO8Lgj8wi3Tb7q+Eb9aLb5+K7mIJqoG76NXwJQE0JGbBTSUCl1mJ3KHNXvaU3q4sz+fDok5TOq
	7j+AunNHjOldrjl+uQ6uoUIGWXeX0Mm6oO8+4vqL9Ew==
X-Gm-Gg: ASbGnct5kyzKqhMPyDJnxt9IqzSPr4QvVwtV/+muoJpxApRD1xjDKFlrSpQS2Qx1+TZ
	8+DhQJA/HHz/txOzZMKnUL482LqgnoBJFjpQoHNx++rsFtP8uB4QCcqWUsqkqRDotHTfIsJQHWh
	RIvtpDwY+PjZ3R80XpypfC/bXCQMpmgieYMPg5Xqw4Oi8Z
X-Google-Smtp-Source: AGHT+IH1Y42tC9WOhyorVoIVUzg4d8lEv7srElHPGs2Vyxp0TjD0IOF4Ys3G9cHs3FqdWdAWUdm5wif9bNpbqowU6iM=
X-Received: by 2002:a05:690c:892:b0:70f:6ec6:62b5 with SMTP id
 00721157ae682-7117547d163mr25767887b3.38.1749871999806; Fri, 13 Jun 2025
 20:33:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-6-guodong@riscstar.com>
 <2b17769e-2620-4f22-9ea5-f15d4adcb27b@dram.page> <20250613132227-GYB135173@gentoo>
In-Reply-To: <20250613132227-GYB135173@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 14 Jun 2025 11:33:08 +0800
X-Gm-Features: AX0GCFvaqH-7lH0Zx6WGwcqUhaG1iGpayA9xWNyPAE7sjxcXfPy8V2aaJ994Vr0
Message-ID: <CAH1PCMa8DukTxxRoWBUV22zTFnSa-4pLkZjffXO2Z9s8dtpiMg@mail.gmail.com>
Subject: Re: [PATCH 5/8] riscv: dts: spacemit: Add dma bus and PDMA node for
 K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Vivian Wang <uwu@dram.page>, vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, Ze Huang <huangze@whut.edu.cn>, 
	elder@riscstar.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Yixun

On Fri, Jun 13, 2025 at 9:22=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Vivian, Guodong,
>
> On 11:06 Fri 13 Jun     , Vivian Wang wrote:
> > Hi Guodong,
> >
> > On 6/11/25 20:57, Guodong Xu wrote:
> > > <snip>
> > >
> > > -                   status =3D "disabled";
> > > +           dma_bus: bus@4 {
> > > +                   compatible =3D "simple-bus";
> > > +                   #address-cells =3D <2>;
> > > +                   #size-cells =3D <2>;
> > > +                   dma-ranges =3D <0x0 0x00000000 0x0 0x00000000 0x0=
 0x80000000>,
> > > +                                <0x1 0x00000000 0x1 0x80000000 0x3 0=
x00000000>;
> > > +                   ranges;
> > >             };
> >
> > Can the addition of dma_bus and movement of nodes under it be extracted
> > into a separate patch, and ideally, taken up by Yixun Lan without going
> > through dmaengine? Not specifically "dram_range4", but all of these
> > translations affects many devices on the SoC, including ethernet and
> > USB3. See:
> Right, we've had an offline discussion, and agreed on this - have *bus
> patches separated and let other patches depend on it.
>
> But seems Guodong failed to do this or just sent out an old version
> of the PDMA patch?

Hi, Yixun

I realized that there is some sort of discrepancy between our understanding
from the offline discussion. With the information I put in the other email
earlier today, do you still think we should submit one patch which
covers all 6 seperated memory mapping buses for k1.dtsi?

Let me know what do you think. Thank you.

BR,
Guodong

>
> >
> > https://lore.kernel.org/all/20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@wh=
ut.edu.cn/
> > https://lore.kernel.org/all/20250613-net-k1-emac-v1-0-cc6f9e510667@isca=
s.ac.cn/
> >
> > (I haven't put eth{0,1} under dma_bus5 because in 6.16-rc1 there is
> > none, but ideally we should fix this.)
> >
> > DMA address translation does not depend on PDMA. It would be best if we
> > get all the possible dma-ranges buses handled in one place, instead of
> > everyone moving nodes around.
> >
> I agree
>
> > @Ze Huang: This affects your "MBUS" changes as well. Please take a look=
,
> > thanks.
> >
> > >
> > >             gpio: gpio@d4019000 {
> > > @@ -792,3 +693,124 @@ pwm19: pwm@d4022c00 {
> > >             };
> > >     };
> > >  };
> > > +
> > > +&dma_bus {
> > >
> > > <snip>
> >
>
> --
> Yixun Lan (dlan)
