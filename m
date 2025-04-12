Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D8117C77
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 04:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744430471; cv=none; b=fU+gqcBiI1Dr1qGWt/3rkKkc6wBDebdywC1g0jlKAU2vcoLVku+mNCEjk8HQgw02vJXs1XL4wUhjpgr5d8SkLDhwoPc+U4Knj8MQ/edddtQ9T1ybqclMTLO/JSMwAdugwOMK8VtbVT3l3EP/F83z7amS8schy79OqyVziMsXG9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744430471; c=relaxed/simple;
	bh=/oaDy5SzWfzyFBs8bTU2LHsjy16/G0IhlbubH2Ym338=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p/HCvKovKsXaHBZAL6+JRPpyoPe4DyUapE5+sanuKghgWBin05tvIM4D5esSlEuKPVlg1vZ2AoRwGOJpr2niEtUKkRY3Hb2LJUNJH52b7NxLUCN2NLhrOjNm3+cU3P7WGPWihhWBcLX2i+Vzt0nUzQwLzDr7pldMEHxCTsxf908=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=VXSWyCys; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="VXSWyCys"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso4157159a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 21:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744430466; x=1745035266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CRPWfzlQeNRznSdwAcCFwL0YU/Q8vcd3a6wdTbE3VY=;
        b=VXSWyCys6KU+a6U5T4TSlQD19NnPRyi3Pm00IJ+KrfOFilFkzY2VwO5JK7kXaAG28G
         CmbfF4f22ZuhCkmMhOuUjyWjDsR8PGtdLdCGiQqMhj8Sxun+NEqTOmkVxqDEdidhFWqm
         1CSPxamDgZqwKwvFocUb6yxciBqvMlaUQEs/O8Bh8UB+mFAgr3kxWp3CRSSXeHD88wMf
         Og8DrtqyQvtUp2ITx9K92fbm9ooqYKB/eZCvWhPohCqdS3fbEe6wffQ4XNz84jsln1ik
         qGD6fRqnjP9ctZxh6DojlsSYx9Sxfrhj5awvMfXj204kHrL6h4TbEtTzG4xKOiBILJyx
         elqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744430466; x=1745035266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CRPWfzlQeNRznSdwAcCFwL0YU/Q8vcd3a6wdTbE3VY=;
        b=vri6ELrg8d8+JQ0aiMgRcbVCQ3PVwFSXop7u6mTr0IkWbLGJKH8PVMgRR1ZDwJlmix
         J0sfow6V7sR3aHEOAql/I/A4H9LFcFx5UMeN7KgaMPxi4YXei+/1H0VcNhnE+fNZ5I5l
         H+pjcsybn6vQKmvIVqTdgtFxsV5WpFyytutpdRUULAzMOsBdw6wgEkiZqQMmmKTekSoX
         IfEX4IGYeppK2YybgOJHdL/dEl90QiYYI9JUuTVEs4FTM3Rw4MTEJQnGwNSeAYHvtgPQ
         kA2OLItZe6ZiSjnji/LM1bEHUo+vkjkAtadqsteajgoQxSornJUhouJj7z+pI0v0dEXk
         4qEw==
X-Forwarded-Encrypted: i=1; AJvYcCVA9aDbevIWWOhMR8b/hYn3EgAN5QBd5T5j3EPanjyrdDEPBF2UASUCjAV+TybjL0VCRKptbkdgamcw1eU=@vger.kernel.org
X-Gm-Message-State: AOJu0YykAn1npcPSjb5AehbFtmJxLcEEz35q4YBEoHMRzbs6EHOHZeon
	pzXDiY3SLgOz2QEGMJp+HMTYSGob/V0KBCamh81rj3fccv9JIOju6PVdKAXSN0QmIr6In6lrPCT
	507zepfdp2vGjsnXgZdvS8pTHd7cLvjIV+AeoHQ==
X-Gm-Gg: ASbGncvt6/vRLz3hGy2iqo3Fzxyskm80eYSeGX3CHOEwMH90z5jrT26J+QO0Z/+tCjV
	gheooJ3bDhI2V7kc5i8BIJQZm6SC/r9WTO/ztfg6CckDkjWea4hTkDVdy7I1kqAL0EN4gFXpREW
	YZiNNg5jj45JIb+2hwcVZLIBaHNw==
X-Google-Smtp-Source: AGHT+IENp9Rsn1tl1gtpbQVTMzSC6/93PX9bXuEoDkAlRHWwSvf7X/I+LUs0PiXsS9JvQ3CIAnw0CeEUzESATSMDzW8=
X-Received: by 2002:a17:907:c22:b0:ac1:e881:8997 with SMTP id
 a640c23a62f3a-acad3445eb0mr424260766b.3.1744430465564; Fri, 11 Apr 2025
 21:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-4-guodong@riscstar.com> <20250411-spoiler-dispatch-8f709700a996@spud>
In-Reply-To: <20250411-spoiler-dispatch-8f709700a996@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 12 Apr 2025 12:00:53 +0800
X-Gm-Features: ATxdqUGgkB-PsMfv6YqmcddOd__4CXMlcvN5r0cbFMC6NhGoCTmz_wliYFT0jOQ
Message-ID: <CAH1PCMZcevte5kJ9PUO3cvoaFwdido=WboNcLV9dTk9SJuLGBQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] dt-bindings: pwm: marvell,pxa: add support to
 spacemit K1
To: Conor Dooley <conor@kernel.org>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org, p.zabel@pengutronix.de, 
	drew@pdp7.com, inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, 
	tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com, 
	duje.mihanovic@skole.hr, elder@riscstar.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 12:43=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Fri, Apr 11, 2025 at 09:14:17PM +0800, Guodong Xu wrote:
> > Add "spacemit,k1-pwm" as a compatible string to support the PWM
> > controller on the SpacemiT K1 platform.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml=
 b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> > index 9640d4b627c2..1e3cabf6a89a 100644
> > --- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> > +++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> > @@ -19,6 +19,7 @@ properties:
> >        - marvell,pxa270-pwm
> >        - marvell,pxa168-pwm
> >        - marvell,pxa910-pwm
> > +      - spacemit,k1-pwm
>
> The driver doesn't appear to handle this differently to existing
> compatibles, why is a fallback not used?
>

The only difference in the SpacemiT K1 PWM controller is the addition of
a resets line. This property is not used by any existing PXA-based platform=
s.

Since resets is defined as optional, I agree that continuing to use
the existing marvell,pxa... compatible string is reasonable.

I'll update the next version accordingly and include an explanation of this
decision in the commit message.

-Guodong

> >
> >    reg:
> >      # Length should be 0x10
> > --
> > 2.43.0
> >
