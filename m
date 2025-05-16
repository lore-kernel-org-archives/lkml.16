Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB1D42056
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747407666; cv=none; b=EpjpnH4DjFYsKdpS0ekHvBSprs+UTYYhR0FWRNeD+HB9FRXaiMj7ThX2ku5qB9JJoABce2gknd6j4fkMqMMKRz7V+DaXQoNDS0g7yxRrGxtJBUiLATbM40vZOSWTGj3TUQn606+yyOisk6yCWePUKTfdxj8of+v5jIineTAS/qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747407666; c=relaxed/simple;
	bh=VXlJSWFc5Zq3VZZtNElTL1S+RE8tFsD4AFHclc0Ow7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JOoai2dIZTjdK65T4ALZzcT2gWx8WyxagEx6ffMvtkBQpbVjwloSyRBQO9IBhIIMuC7+zWqVdAEHPttON6jeuGISxg22bTCQwKH0H6MKxxREHfLxk9YxS/zaQjLJP3ShwcEYD7zjw6+b991xmPc76VcTzG33vznDMsgX5TiBLMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geotab.com; spf=pass smtp.mailfrom=geotab.com; dkim=pass (2048-bit key) header.d=geotab.com header.i=@geotab.com header.b=e1F/CeRf; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geotab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geotab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geotab.com header.i=@geotab.com header.b="e1F/CeRf"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-86135d11760so163886039f.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=geotab.com; s=google; t=1747407663; x=1748012463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Isgxaw3y9HV7OOycA4J0PsTij++eO3Vyqgu7PgnW9EU=;
        b=e1F/CeRfpEslMiK9m/9yOzKlcF1GOrxhtkVyssp0PPJHgI8/AhPeB48aTJv6GKlmvP
         OixbzfbJ3DbcMhTyteWBhyISUaRC07qUuqSh7DutA2buhr5Nt4IPnTZp/FNAqxoXgSSo
         yzfPGRBGjo1pFOh7j/dmOkpuRh5MBkdDvKQbVVgzR+ZadCQqofV3o8X+t54qG1ouS398
         TvESlGRS/zzCyvc/sIXrCC8c92XlE3YkVuIvGANIT9FZaKmeZ3lYOPDh8SxFbOlVZN1T
         KhuZBpFfERkbmNMKFG6VhI8tGttU2aD1b6M5iZLCMte/TabpOrvphEIJIab73hK82heU
         MZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747407663; x=1748012463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Isgxaw3y9HV7OOycA4J0PsTij++eO3Vyqgu7PgnW9EU=;
        b=ZQcDUrX8UCbovDfrZ3s4xM7H9pKu4wOTQP9NpTdxWkMbNXCGsoB8AYPop3tN6DFgE5
         YDW7RUGdpO6jzqxKT48867jo5EIYZcvYtZF3DctXRCV3Apjl/j/NoUNrv2sF91zye/cT
         xk6C1uQmUnZ3qMurOcn7QKoctI3ifE66v+eltRbVupeqamDhmE1ODAbUEULvRI3EEgde
         HKOPUZIA70BYGHd/JOpIKyfMVRt6h6ffCzmF1LeHPuW1+hUbtBBlDxZw3SFLAPYtxDWE
         ydTTe//E4DewQ4MIR3FpYy7m6iJBc33zu4JuJrlfxzHZtVxB7EBv1Mk6avzDVbeYpBrW
         kRnA==
X-Forwarded-Encrypted: i=1; AJvYcCWUjwhSjQmjNOan3CzUvFRjieQAak0NESWlOM3wY84aebx66KAWu7hEzQqifEHve5Nq0dP4/sYbM3efTy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpoGpRCWoi0Zxy35mRYiYIxO/J8h3/Lf1T9YrUY4+aU9cbp7UE
	uYfnehU6gShHuUazw8ZvZVaXc1kStIrnP0I6oTs+qcx2ZH8Ck+63LOu/bWNPKI/pWps2O6C8UWX
	9eSqnYeQ9VQM0Iq+UuWEb0xkhVLvo4RWFV8f6tLKz/A==
X-Gm-Gg: ASbGncvSKnqcodLKlPU2N+WE2o6OEAr0axYbu/fCHNCgWCEmxjJsvPeM9OdZjYiipGf
	0fLf4PPTj1NxrfSy4vxaoZZ7DNA0haGS3meySPd6LEL/VFwiQEUCbyQUhyvvMpDSjkEA5jt1FDR
	oRXvyHvNgZIAuoMVaSflfZdsvcXVgae9s1liHLBeEE/XclXXRxtlb2Srie7Lec9nrGpg==
X-Google-Smtp-Source: AGHT+IFjgy4PTFRg5gQXN3AYZ9qRrA+rqgjEor6gLIy5H1bI4/D1Ugp/0oi1Uz+3u4EU2q7B2R1qykz+kNuYWwKtRcs=
X-Received: by 2002:a05:6602:36ca:b0:85b:3c49:8811 with SMTP id
 ca18e2360f4ac-86a231b0d10mr685529539f.4.1747407662122; Fri, 16 May 2025
 08:01:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514-ubx-m9-v1-0-193973a4f3ca@geotab.com> <20250514-ubx-m9-v1-1-193973a4f3ca@geotab.com>
 <20250514-saggy-shifter-e4ac7152f823@spud> <CAN=L63qsjEAvfocgP0tGrpe-x6Rx1gvTAkPE9i99Ai2zJj6ssA@mail.gmail.com>
 <20250515-varying-swan-31ca63615b43@spud> <CAN=L63oc7a6+_e+nhiyCkttX-TSbcjcwBmSzPsSk94m1ebGt4w@mail.gmail.com>
 <20250516-unfasten-submersed-e854fc9a0142@spud>
In-Reply-To: <20250516-unfasten-submersed-e854fc9a0142@spud>
From: Alejandro Enrique <alejandroe1@geotab.com>
Date: Fri, 16 May 2025 17:00:50 +0200
X-Gm-Features: AX0GCFs2fiYCif8FzLWhxn2SYB4xmCrMNj4SEjmPv-P0k5pZNerM1y4pJoBW7_Q
Message-ID: <CAN=L63phSnssXs1p2HXhf08HMaHCE80EgMZQR0vPqhME2tknBQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: add zfh for sg2042
To: Conor Dooley <conor@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 4:01=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Fri, May 16, 2025 at 12:23:35PM +0200, Alejandro Enrique wrote:
> > On Thu, May 15, 2025 at 5:02=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > On Wed, May 14, 2025 at 06:53:25PM +0200, Alejandro Enrique wrote:
> > > > On Wed, May 14, 2025 at 5:49=E2=80=AFPM Conor Dooley <conor@kernel.=
org> wrote:
> > > >
> > > > > On Wed, May 14, 2025 at 01:55:54PM +0200, Alejandro Enrique via B=
4 Relay
> > > > > wrote:
> > > > > > From: Alejandro Enrique <alejandroe1@geotab.com>
> > > > > >
> > > > > > Add compatible for u-blox NEO-9M GPS module.
> > > > > >
> > > > > > Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
> > > > > > ---
> > > > > >  Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml | 1 =
+
> > > > > >  1 file changed, 1 insertion(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/gnss/u-blox,neo-=
6m.yaml
> > > > > b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > > > > > index
> > > > > 7d4b6d49e5eea2201ac05ba6d54b1c1721172f26..cf5ff051b9ab03e5bfed815=
6a72170965929bb7e
> > > > > 100644
> > > > > > --- a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > > > > > @@ -22,6 +22,7 @@ properties:
> > > > > >        - u-blox,neo-6m
> > > > > >        - u-blox,neo-8
> > > > > >        - u-blox,neo-m8
> > > > > > +      - u-blox,neo-m9
> > > > >
> > > > > No match data in the driver, why is a fallback not sufficient?
> > > > >
> > > >
> > > > I added the match data in the driver in the PATCH 2/2 of this serie=
s
> > > > in the same fashion as previously supported modules.
> > >
> > > Did you? When I looked, there was just a compatible and no match data=
.
> >
> > You are right. I just added a compatible string, no match data. Sorry,
> > I was not following.
> > I just added the neo-m9 compatible the same way the neo-6m was previous=
ly
> > added.
> >
> > What do you mean by using a fallback? Using one of the existent
> > compatibles (none have match data) or adding a new fallback
> > compatible, something like just "u-blox,neo"?
>
> Falling back to one of the existing ones, like neo-m8.

That is perfectly possible. I added the new compatible string based
on what was previously done for the neo-6m one.
https://lore.kernel.org/lkml/20190401115616.21337-5-megous@megous.com/

If that is not a good approach I think this series can be discarded already=
.
