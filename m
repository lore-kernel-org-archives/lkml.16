Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E2E18E025
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750177746; cv=none; b=n/pWuq45srBjlH3mSocNW/4XNG+5LqWjRu+DXBdAugH7S3tQtUbDznUS7G1527Xn/ZsdBD5Bw445Y4HTJNeBb+LbCYPLs6X7r6jPD0XVOHSF8x5XUUA5Sjj/zyIX2vdeSCE3l4ZpVwBkt562zY4L+dRD/a/JYuIdIAoEl5bPRdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750177746; c=relaxed/simple;
	bh=NEFMnlX92eZmddj6ISOAz5HWpkBrZdvzNs6PETlF6C4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aV9Ez11cLSLZTt++CLLkCfIkDviq2IkLL5xv50ahbZxl66kc8ffgPghfPkjAA2wzXNUVLavK1m+iBEVnPEx0iIft5rpQ+9wBD/qBGusQZbTK6P6xl7gKybmkOUTb1WwE3M62UeHJFUbCvO30gkl/qBY/rAfMj1UCDxWQM2DzlFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oHQSsCdV; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oHQSsCdV"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3ddd1a3e659so154535ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750177743; x=1750782543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEFMnlX92eZmddj6ISOAz5HWpkBrZdvzNs6PETlF6C4=;
        b=oHQSsCdVrDsCgnEaK34y1l0NVt61M5AGEAKtN0R+JN41S146apBaHkEuoaKByrHQHQ
         OSv/+K8oaQeL5sJaYCQ3LmBJ68s6ScFg5/Te8XZBf6nHKbxNZg7nCWWBQoBpSI5TdhQa
         qpZLOz9OovkD3OIaah2EvGHSA71SBJEZZIhW6gnn94yzwAYPJ1S6QU0IhS6HzYj6Lt3B
         eZ2MCDo6QI2TSaFbTDh8+xATpC6MkGrpn6NA6YUV+1ZUfCI3S7toXUxKTTgPDta0scMw
         o/jpuvXc+vJh2R/e/fA4hcl2KRBrq2pFwFOLLwyCavfaEWK62KpbQeE+HBxIrHFz8AC1
         S5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750177743; x=1750782543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEFMnlX92eZmddj6ISOAz5HWpkBrZdvzNs6PETlF6C4=;
        b=oU6+12rD39pmJXPhxSnCf1Jhq7t5RS6dlumQcgaj0uE7ehZvJLBdrbQZG+y/w6RFqh
         C5HV2GD4SbxWNYMG0fodA4xJlIsadJWzTB05QPaPAXxz8TuouUfwJWzZDjmfXf2ebJVG
         ERASd4w+tGBtEzLA2EdgpM5WGKHrAb1Rgjf0uI5GTF/w3UZ6Q2Rl1eYYkopDePVfqqV4
         ckp+HGtkIX+5PufuAY+306a2XAl55cemO4h77gi0NIP1cA9R+aVlhdjs6bebFrVJD9Pk
         CmWkCLa3ujVw6NA/1THbBAH3RrfTigMNAXLAFlxLfUkGV8H8CiPAgT2M5bF4ms1G3/YP
         gWSg==
X-Forwarded-Encrypted: i=1; AJvYcCWEB3DsReNd3Z8MuhgJcJMdLeAbVsYHyv5d++s5+qruzkIlhSLordXNPBwnVv5uRopmz6aTSVD4BnmViGM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0uCb8SoalEso0gsKlxojFYnnVxE+6spbyq6vqafY11TWeUVmR
	jwmra/wPqjj+fEfqBP3byVq5pgjgWxB4Gv6MoE8ReNjhs+CSXEVqArFlf2nz29GqYb3zFWkl/d/
	eG1zMALfecG9F0IwDD7gyHdNxz4BG6+K8K8afNLa0
X-Gm-Gg: ASbGncscjpkfzssoaq5Yoxla4lCv2rNJMRtnfPe6lGbkYmQR+NOCWuDF9g/ILMegjDC
	pp2nOoVuxb9H/25IhGfICtm618uFzMVnQyNdd31p3gF+RrVgfXjjHwxDemdL3ieFnYgvBzDHnB0
	+WkUYxxjGeWepJpqhtvC1kSEeSp52+vmEvvESIF1xqgyhl+21/wMlu1zNgRuMd4kyLIcNLpHko
X-Google-Smtp-Source: AGHT+IGuaQHH5RnvKvS2kE5LJtsJIfjqrig7FhB3Xp0nL8VkPKaJwzzxDGo5xtnO5/xq+BKzkzCl2ghHE6EtLjDojGk=
X-Received: by 2002:a05:6e02:1aa5:b0:3da:7c33:5099 with SMTP id
 e9e14a558f8ab-3de09fa7317mr8962435ab.13.1750177743269; Tue, 17 Jun 2025
 09:29:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
 <CAP-5=fXSwgxMc+uh=PBAFh4Zm96tL5RDyKPOJ8Q40O4s=EaArA@mail.gmail.com>
 <20250616102945.GA17431@willie-the-truck> <CAP-5=fVjJyV2eA1aDnk6cqAhJGc9FZVyHhP7-f=1OyWmzxjN8w@mail.gmail.com>
 <20250617141649.GA19021@willie-the-truck>
In-Reply-To: <20250617141649.GA19021@willie-the-truck>
From: Ian Rogers <irogers@google.com>
Date: Tue, 17 Jun 2025 09:28:51 -0700
X-Gm-Features: AX0GCFtUDjpPo9TijhacurqPBZmSpa7o8vMtplPwxsLKffdst7807Hbk9NO-1jU
Message-ID: <CAP-5=fXn_mr4k=fTYEuK7cCty4n8sofQaz1jNsrTn8U2icm_pg@mail.gmail.com>
Subject: Re: [PATCH RESEND v7 00/21] drivers/perf: apple_m1: Add Apple A7-A11,
 T2 SoC support
To: Will Deacon <will@kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 7:16=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Mon, Jun 16, 2025 at 03:44:49AM -0700, Ian Rogers wrote:
> > On Mon, Jun 16, 2025 at 3:29=E2=80=AFAM Will Deacon <will@kernel.org> w=
rote:
> > >
> > > On Mon, Jun 16, 2025 at 02:36:18AM -0700, Ian Rogers wrote:
> > > > On Sun, Jun 15, 2025 at 6:32=E2=80=AFPM Nick Chan <towinchenmi@gmai=
l.com> wrote:
> > > > >
> > > > > This series adds support for the CPU PMU in the older Apple A7-A1=
1, T2
> > > > > SoCs. These PMUs may have a different event layout, less counters=
, or
> > > > > deliver their interrupts via IRQ instead of a FIQ. Since some of =
those
> > > > > older SoCs support 32-bit EL0, counting for 32-bit EL0 also need =
to
> > > > > be enabled by the driver where applicable.
> > > > >
> > > > > Patch 1 adds the DT bindings.
> > > > > Patch 2-7 prepares the driver to allow adding support for those
> > > > > older SoCs.
> > > > > Patch 8-12 adds support for the older SoCs.
> > > > > Patch 13-21 are the DT changes.
> > > > >
> > > > > Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> > > >
> > > > Hi Nick,
> > > >
> > > > This is substantial work and it looks good to me. Do you know why
> > > > there's been little progress on landing these patches? Buggy Apple =
ARM
> > > > PMU support in the kernel has led to reworking the perf tool. It se=
ems
> > > > best that we can have the best drivers possible.
> > >
> > > You reworked the perf tool to support these things? Why? These change=
s
> > > are targetting chips in old iPhones afaict (as opposed to "Apple Sili=
con").
> > > I think that (a) most people don't particularly care about them and (=
b)
> > > they're not fully supported _anyway_ because of crazy stuff like [1].
> >
> > I was meaning that we reworked the perf tool to work around the Apple
> > ARM PMU driver expecting to work as if it were an uncore rather than a
> > core PMU driver. More context here:
> > "[REGRESSION] Perf (userspace) broken on big.LITTLE systems since v6.5"
> > https://lore.kernel.org/lkml/08f1f185-e259-4014-9ca4-6411d5c1bc65@marca=
n.st/
> > But in general it would be nice Apple ARM PMU support were well loved.
> > I think we went 2 or 3 minor releases with the perf tool not working,
> > threats of substantial reverts to avoid the PMU driver bug being
> > exposed, etc.
>
> It's unfortunate that you've had a torrid time with the Apple PMU driver,
> but I think it's important to realise that it's both unmaintained (it
> ends up with me via the catch-all for drivers/perf/) and was written
> based off whatever reverse-engineering people could be bothered to do in
> their spare time. It's frankly remarkable that it works as well as it
> does.
>
> Despite all of that, I still don't think that your concerns apply to the
> patches in _this_ series, which is about adding support for older Apple
> chips.
>
> > As for which Apple ARM devices should have perf support, it seems the
> > more the merrier.
>
> Easy to say when you don't have to maintain the driver!

Well I do send patches ([1] is based on a patch I sent and James
reworked), but yeah. It is a bit strange in this case that we have
something that is both unmaintained but not taking a patch series due
to the cost of maintenance :-) Hopefully it can land.

Thanks,
Ian

[1] https://lore.kernel.org/lkml/20230710122138.1450930-2-james.clark@arm.c=
om/

>
> Will
