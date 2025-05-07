Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73921C84BF;
	Wed,  7 May 2025 05:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596945; cv=none; b=FKp279G/DRlRZ499Qr8k3n7K/QgAZ+mKT9C7FBGXUYktJjAz4Nd/SClmYk/pe8fX2Ti/7nLUVzjMHErZi3I8xPmVB3c5AecssgUcZ2x/J5yKlMxmj2oHLR8xkYga5HpRLhyPw3t/N8O/eF9Obu6xjQshM5Ojh/TYneVF4drcDPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596945; c=relaxed/simple;
	bh=wcg08Kt1C+xZgbC0SDxeuZMP4Sa/aGcldOCUz7tMn50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pf1r8EAjxDqof8JInxYPPII34J3QWZO5CfS83fnMM0V/M5YscA/ZrXg9Ew/6aNjDPu0Y/0MsVOdF36rERN/Q1APyPS3v4soAbkeeWNgRoe5INgI9M7NSZ5rR5ScStCSjRwuo/gcazkDyMiBWRUUf2SflozKWrAxormSn9JYdRiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=foLBNRiE; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foLBNRiE"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-476b4c9faa2so93171471cf.3;
        Tue, 06 May 2025 22:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746596942; x=1747201742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JdJMsLzfDGeRvx+Emk46r8xhmMRITfWllQfaK4Duwk=;
        b=foLBNRiER075wcSuuAjGaH9EtJxa2yLUu/aH5rbHtIikDNGvfQHwOZ3WLRh/U3woYx
         VoOdN9blD6hrojbz/ogUrwhhTQkUreP/1nXybfMN9CDFf+ndqHO2Hi1+KGloy/7KkTTk
         2c4ffleWfzIefGPo0nU1GexU7E3ywNahIq6y5Fv8fAxWd0x3zk2lRC7eRzp5eA8DAcrc
         DCO37D/ih/WUqbAkFURFmGufxgWPOYgMPOD/cDvZxEItnfYkwa1eenGaY3dzGWOJbaa4
         4QHaof1rr+FijwDGqef1JE5KXc/0ryxf/Gkp5+9sDrJnu3ADUYRHEIHjhdWRwqdKdM5c
         SZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746596942; x=1747201742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JdJMsLzfDGeRvx+Emk46r8xhmMRITfWllQfaK4Duwk=;
        b=BK2sWNa4HuW9r+x4ht/xBFTZlUlgovK9pe+pFKt320YaeySvFZHUqpE3k4/M7ULzLY
         TGxbNtvsZVveHFxCbsneYy/8Fqg2wN3NRhagjdrh4j0VieUH6iFcSBF+EJ2WwiZYggqh
         BFYS9ceBBwD2pe4vMBjVSV01P9hxAawS4DlN0eIJVyPha1tNFVx8lH2TD8+EE1g1vUMh
         p9OjEduJ8QSTiLtenHjHPkewwHmN/yOUu0GUcMMKUZVIwaPWBCIUYHs7L+JUvMceRkki
         tnyzIR+W6Pwg/YS7bONyydclxw4kObqmQ/JGUUArfzEfDtRgYSf5bOPkewo5LzmZkl+a
         P5OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDqavBGdaAq42YRcV/FolpEDTWhuUxk8prBvQD53whCglAtfbl3+Z369OPRJxlJNS5erjbp6ujSXRk@vger.kernel.org, AJvYcCXGo+IUdTb1pLJg8Wto9j3CylPkgLw3wC++sahoWV/jCrDr7D/dJZFddGdMcB3W1yLHk4Y9b/IzW970bEk6@vger.kernel.org
X-Gm-Message-State: AOJu0YzuzGDegvjRMV0L+UW7GFu1KvaPOobeGjot6kUZ4FkhX0qOk2Dm
	yzvNy3kTqs6WsTlXFC39gAjr/6GdOv4ZHl/8dUAEveRtDCXu53U3K6vfeNZ+KW9xTAdqNo08dvq
	Au9OSCrap4xA6sQxSAlq/HXyduP0BGq3tsb4zLkYi
X-Gm-Gg: ASbGncukGW2Ejm+XEQ05PySJzgk64dMBSlcWCqaxVVGfwHxzCY+BGsCz4egSujrJ6f0
	HQhCxVtMphx3HycDNNVDeeJe0tdccm7lfUI5HFMpWTNNqZ51d70rPHrVk6y62qbNngNE4G+jv1b
	hr7gUcPCHo0miujJC1IuV0FtK9ig0IhrE=
X-Google-Smtp-Source: AGHT+IF7vvrjUXrQ8Ma7pGYyWlbfTrxCvT38VXq6TtbN5SNAo7OxWdmxVFlZHyYkepkkFVBGOS2HmDQU3+iLDdcpFsM=
X-Received: by 2002:a05:622a:5588:b0:477:41c3:3c59 with SMTP id
 d75a77b69052e-492278663f1mr28654201cf.40.1746596942669; Tue, 06 May 2025
 22:49:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com>
 <20250507-vt8500-timer-updates-v1-3-6b76f7f340a6@gmail.com> <8d3c2ab5-dfc0-4a65-94c8-48a94c850aba@kernel.org>
In-Reply-To: <8d3c2ab5-dfc0-4a65-94c8-48a94c850aba@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 7 May 2025 09:48:51 +0400
X-Gm-Features: ATxdqUFKht2xkkVskEfWLYN789ACQMJmDtBSHahlN1jQVzEb-f__uuxu03cTVZ8
Message-ID: <CABjd4YxjC13H9G+ZpQO7EcmA4quu-9OMYjc5z6W5z+f=pwkTbw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: vt8500: list all four timer interrupts
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 8:32=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 06/05/2025 22:06, Alexey Charkov wrote:
> > VIA/WonderMedia SoC timer can generate up to four interrupts correspond=
ing
> > to four timer match registers (firing when the 32-bit freerunning clock
> > source counter matches either of the match registers, respectively).
> >
> > List all four interrupts in device trees.
> >
> > This also enables the system event timer to use a match register other
> > than 0, which can then in turn be used as a system watchdog (watchdog
> > function is not available on other channels)
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  arch/arm/boot/dts/vt8500/vt8500.dtsi | 2 +-
> >  arch/arm/boot/dts/vt8500/wm8505.dtsi | 2 +-
> >  arch/arm/boot/dts/vt8500/wm8650.dtsi | 2 +-
> >  arch/arm/boot/dts/vt8500/wm8750.dtsi | 2 +-
> >  arch/arm/boot/dts/vt8500/wm8850.dtsi | 2 +-
> >  5 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/v=
t8500/vt8500.dtsi
> > index 2ba021585d4889f29777a12473964c29f999f3a0..d1dd37220d41becece5d24f=
bb19aa71b01723e35 100644
> > --- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
> > +++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
> > @@ -111,7 +111,7 @@ clkuart3: uart3 {
> >               timer@d8130100 {
> >                       compatible =3D "via,vt8500-timer";
> >                       reg =3D <0xd8130100 0x28>;
> > -                     interrupts =3D <36>;
> > +                     interrupts =3D <36>, <37>, <38>, <39>;
>
> You need to update the binding, preferably first convert it to DT schema.

The binding change [1] has been reviewed by Rob and is pending merge.
Shall I fold it into this series when I send v2?

[1] https://lore.kernel.org/all/20250506-via_vt8500_timer_binding-v3-1-8845=
0907503f@gmail.com/

Best regards,
Alexey
