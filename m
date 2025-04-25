Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9A22236F4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745616234; cv=none; b=iLCphSgb/5ihN93B2G80YzPGGVA4LhHUadOXaY3uT8GGSTI9nMYWd9fzxVHAxp0OH0tcFrlkoXeR9vta76ZlXhOlGzI2t3dydX1Kx3sDvUJylBpxb5hMgF+562LCoF3SdRtLiSaRoCeA1TLOL/DruFkIzH6Lv5NEBhVdMM9rOo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745616234; c=relaxed/simple;
	bh=WvMhf3UfO5NrWSnEWLlKFU6mSMP0Amfqj5oXW4qwmj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dj0niQk7Hgpn1cf4rs8W2bHYmy7/cf6tSGgBdwyqyUi336mwFGhq/+OsfCbU2rjUsaV8ED38xJWGW1vfkpN58PsGZ00LhtqM+YGGpXG977Dha/CCp/KjwWS0cGA867i1oL54CnpKVWH32LkOb9UO/3n1hGUO2jayVZMGttHGzOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=GxImwXI9; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="GxImwXI9"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7376e311086so3722648b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1745616232; x=1746221032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+N5ZXuPJmZuQc99xAAjLNXn6gwTktfd4X1GnPJKgrTQ=;
        b=GxImwXI9CJTbGmFDuF4UujAKZ11TfNs3qhPp76lAyVfF72ZMvGPGYO5N82+g6HHt+l
         yaI5sdrLzmgZ3bJHi47yDxdFqWurXvtMMdZbB6Mgla99RMVKv4lmz1/BM0xXRB3TUS/1
         XkZzvoH37/OgoYfnHJG1exanfoYuXouUQE4o8C0+06J8bzJB2bweOkWTIqqkorxSLYLK
         KvuVgjqO4qgWLym6LIQyduF9wT+IKnO0jMoeZFS7XLnypUS9hb4CLn16rDdzKrwdmFFL
         F658VfnaG+182hEoC70E/Cqi4x0HS+ADWK7EXRZyDzrIOmDR2XrOE3QzSxs97XH/PIhi
         6zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745616232; x=1746221032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+N5ZXuPJmZuQc99xAAjLNXn6gwTktfd4X1GnPJKgrTQ=;
        b=KiMCIPxjmlGqeplFRdHkxo8gfsfvmRBKl2Sr1SZ93V2r9ghOTCALO6JvJ4Whu6mX+y
         YpDFnp9M90JcKt3Eg4R/WoxmJSkUu1h5OWd9s7EhpbOzgV42S5rRjv6tf0SP+ACUi/nd
         WasTaNwdE+8p30PG/f8q/cFsSMGTJfhjC+2XYwsBKS5HSddgSp1/zulcQkMmTJoTDXwt
         Oa39NEGDxkcWRfiP/wD54lJMjnrM9yPptj5JUw9JHyXwCDRekmdvcmIpqDibLAGnI8n/
         CCHf05HHg4B5Nfns5UDjGYPigkD4Y6C4RyBmgLaC8hoBoILNVI1CsjFRvl2PnYLZaoxA
         1ZSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkMPoa2pdcX3+ntiEauGDG34kNRjerZBP6B9qjc1HNBLB0QOs3mj37s3Mf0uYgSJTFTQrNYZeYOY4hQng=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXxIpuqnSQ+oVB8YpHmaO7TVjr70tVc3AjDdKoQSp56HXV4mpl
	Ncwdk6haovJ9tqBpzWEQBUrWpIz5Er30+wOu6LUeYuaQe4P3BAOjhdAbFHIJc8njixZVa1b/ash
	iEniPR3TGL7d095DliOawDNMYxKAn07DVdCMcjA==
X-Gm-Gg: ASbGncsSQFD9NQWV4RiWTSWsR/07GcHHZ+j8vhF0n0Q7H1XhOKPObylW7+tWUj5k9NK
	x/3jo+LFJ70HmqOfWAleoBcl4ErLXUoYgzwxwDn+kz+mHj8OEXWkJ5LVjYnTs+fbuHnSPXUDMYn
	/jM1l9b5yGsjlCrhoV33CChDeM9DTlIIhA6YYZxwOqiIPoFj482y9j8pA3
X-Google-Smtp-Source: AGHT+IH+WQDBB3Fu5VlR8Kv3UYAY96aM8bor7T9EYDlIflZy5YU3g1UQDmsgBf7vxIY/GCfD/PZwqaR5JdJt/p7ts+g=
X-Received: by 2002:a05:6a00:3914:b0:736:ab21:8a69 with SMTP id
 d2e1a72fcca58-73fc7a58aacmr5584385b3a.0.1745616232120; Fri, 25 Apr 2025
 14:23:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416001350.2066008-1-william@wkennington.com> <9dc96af3-239f-4cb6-b095-875b862be493@kernel.org>
In-Reply-To: <9dc96af3-239f-4cb6-b095-875b862be493@kernel.org>
From: William Kennington <william@wkennington.com>
Date: Fri, 25 Apr 2025 14:23:40 -0700
X-Gm-Features: ATxdqUGHYVrfCeHb0u0tZuF5aEnGBbC2V4MOthFhY_gHe1B20A9hf7mCdE6-_C4
Message-ID: <CAD_4BXhMs4sopska1=czqWDM8nY6gswXv3LBeUGNzFWn1+7V8g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: nuvoton: Add EDAC controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 11:53=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 16/04/2025 02:13, William A. Kennington III wrote:
> > We have the driver support but need a common node for all the 8xx
> > platforms that contain this device.
> >
> > Signed-off-by: William A. Kennington III <william@wkennington.com>
> > ---
>
> You just sent it, so this is v2? If so, then use v2 in subject (see
> other patches) and provide changelog under ---.
>
> >  arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/=
arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > index 4da62308b274..ccebcb11c05e 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > @@ -56,6 +56,13 @@ clk: rstc: reset-controller@f0801000 {
> >                       #clock-cells =3D <1>;
> >               };
> >
> > +             mc: memory-controller@f0824000 {
> > +                     compatible =3D "nuvoton,npcm845-memory-controller=
";
> > +                     reg =3D <0x0 0xf0824000 0x0 0x2000>;
> > +                     interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > +                     status =3D "disabled";
>
> Why is this disabled? What resources are missing?
>

I was avoiding enabling anything would not be used in the most minimal
kernel configuration (Kdump). Anyone actually using the EDAC data from
the memory controller could enable it. The np]cm7xx common dts also
has this node disabled, so it would be consistent with that SoC.

>
> Best regards,
> Krzysztof
