Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B91A221283
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747391040; cv=none; b=TpSMvRQlFF09dmNqRC1iuHp7rF++zurmlxnDG1xloetCopOmpeBZzryDdJ5ahMrWfM0bWU5mE6ypVXsVrip7VpM7F74m20MMM2cqzuD4MNwJ5yKdF4tyV75IB9vYhRAa3g9QSuTnCZNCgcgfY6zwpwfnqftIrw539VFkwYOlU5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747391040; c=relaxed/simple;
	bh=kX8C4riqmdvhNYzjXAN9FBLZqrBSEMscQB6yaApzJbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GL2o8feBI8mbN/m+zlucKvHCRSKmIthVjJRkFagwVavbwJ1uozAUqZKHskHBAnKsZGiv5NGWuW5YgaPSTQ4UiliK7SaZDQLt6n+OKCC2rT5gMkfRj3RmxI8R4DaEe7zfdkPi1BXEXIs5eGm1VChfdB9F62ieev22WYvCYMkdjv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geotab.com; spf=pass smtp.mailfrom=geotab.com; dkim=pass (2048-bit key) header.d=geotab.com header.i=@geotab.com header.b=VwdjB6u8; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geotab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geotab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geotab.com header.i=@geotab.com header.b="VwdjB6u8"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so18119026d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=geotab.com; s=google; t=1747391038; x=1747995838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSWKgyvnroR1BW7IVNgVxry/JzplDnRtvXjCHt5HFJ8=;
        b=VwdjB6u8fC9ENZxJdhpzJFPlMOEVQdsj0mqHjCYShTcggjLiF08C6ZCCoJ5fM9hM65
         a6WG8/13j3svPRiPOQtS4rTd4bskzRjIm3cwq3KRohX11X64c/1/IqUQT6rBTcepiQiV
         rxCRkLZir0XJRKlKQS/Hcz7iEoZjQLQ2j5IjYUZx0hX4NoSylwhlVp4foKYRo6yS183f
         frNWFwj+U6sbbBygjhtfrdF+zFL1wYD6CwPxq4mCurpZ+v/fj3yoeyLrrJohmoJlultG
         8eG2VTOqctlYDVpPuT5QoumOwPmV0DNfvQLtO0+hg7+RvN6y2Pvdb838m2dfb8YN8vga
         ERfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747391038; x=1747995838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSWKgyvnroR1BW7IVNgVxry/JzplDnRtvXjCHt5HFJ8=;
        b=SGuIDAxyrUaDxL3BIicqhwoc6bH354k9uLfglgC2BVFJgkeYkDZSvukSP5EyiihAEM
         4ZhxSquMgy9yzjvoCbBPZysSRxPrZvpgwjBcZk0tXeNTnlAdFpo1sHuWHohj+5zTVf0c
         wrmKeyIE2LHXvY98n5rvtb7STwlizr7xOgkz1SlfeXV22jWHJk7HGEkMJV115YwXv+qD
         E4ZcseYc8tNVJZ2ugpo5IEsrVFLg6LTX8WeCYahnhZ2iI5FgIPJy1X4uBFbypObEVl+H
         2RfxuQnmFDtiYLAamwk27mGfssA8sSB1JGSuBMVfsrcWOqUrwTcNTpwGEDliZa61oabk
         nxeg==
X-Forwarded-Encrypted: i=1; AJvYcCUvOzNlOCDpNmLUYs6vVEmckMIEPFqgRE2rnJwa2HkA/d04rh2Ih97hE3IGnWfmyFh1mmAhDS2QsFhMoaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOJsuSlgiMyJihF/hVELejakbEYPa82JjpaksVmcqyIYHc2QSn
	bf5KKDyPkM2Z75Nle39lDmuGzY53L7mLbApWJJlv1f+1E4/LZ3q6VCribCQqB8HMflkMg2DZZaC
	9/hVzDUVRrSipe8Aeuctae803l7yaXlV1Y/4StRFstAZgbS4oYn8QULOzlA==
X-Gm-Gg: ASbGncsmm/A3WnKIRdpX5b9a+Agztk4zKHZJlqvNjZRXKya0Ugd8M7acsjx9wzw2ba2
	tGKpptGs4QFQPwhrGkMH2xLi2zDHLG8+uiuWgdOrrGGX8Q1eQ19E0eE11NbwjUmZMaDIs1g4nI8
	U/GnEgb5uhtyKD2fHN+O4hHi6o2eOECoguLA28wn3IxvcTYYyCQ1DczSbRvxwDTGw8sw==
X-Google-Smtp-Source: AGHT+IFh8efmf9PRAMrZc4K2Z8Gvs4gsieCI9x444infnsCJARCipPRL4wFTODnmENO1rPgK7fNUDGBrvA0uGWbk5LM=
X-Received: by 2002:a05:6602:3a81:b0:867:3889:45e2 with SMTP id
 ca18e2360f4ac-86a2322a6cfmr379802039f.10.1747391026352; Fri, 16 May 2025
 03:23:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514-ubx-m9-v1-0-193973a4f3ca@geotab.com> <20250514-ubx-m9-v1-1-193973a4f3ca@geotab.com>
 <20250514-saggy-shifter-e4ac7152f823@spud> <CAN=L63qsjEAvfocgP0tGrpe-x6Rx1gvTAkPE9i99Ai2zJj6ssA@mail.gmail.com>
 <20250515-varying-swan-31ca63615b43@spud>
In-Reply-To: <20250515-varying-swan-31ca63615b43@spud>
From: Alejandro Enrique <alejandroe1@geotab.com>
Date: Fri, 16 May 2025 12:23:35 +0200
X-Gm-Features: AX0GCFuBOqb1SIowingiNrMQQe0Y70xsdgvTHYHt-8V_ptqMp7MjogQl5JSOXCY
Message-ID: <CAN=L63oc7a6+_e+nhiyCkttX-TSbcjcwBmSzPsSk94m1ebGt4w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: add zfh for sg2042
To: Conor Dooley <conor@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 5:02=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Wed, May 14, 2025 at 06:53:25PM +0200, Alejandro Enrique wrote:
> > On Wed, May 14, 2025 at 5:49=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> >
> > > On Wed, May 14, 2025 at 01:55:54PM +0200, Alejandro Enrique via B4 Re=
lay
> > > wrote:
> > > > From: Alejandro Enrique <alejandroe1@geotab.com>
> > > >
> > > > Add compatible for u-blox NEO-9M GPS module.
> > > >
> > > > Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.y=
aml
> > > b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > > > index
> > > 7d4b6d49e5eea2201ac05ba6d54b1c1721172f26..cf5ff051b9ab03e5bfed8156a72=
170965929bb7e
> > > 100644
> > > > --- a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > > > +++ b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > > > @@ -22,6 +22,7 @@ properties:
> > > >        - u-blox,neo-6m
> > > >        - u-blox,neo-8
> > > >        - u-blox,neo-m8
> > > > +      - u-blox,neo-m9
> > >
> > > No match data in the driver, why is a fallback not sufficient?
> > >
> >
> > I added the match data in the driver in the PATCH 2/2 of this series
> > in the same fashion as previously supported modules.
>
> Did you? When I looked, there was just a compatible and no match data.

You are right. I just added a compatible string, no match data. Sorry,
I was not following.
I just added the neo-m9 compatible the same way the neo-6m was previously
added.

What do you mean by using a fallback? Using one of the existent
compatibles (none have match data) or adding a new fallback
compatible, something like just "u-blox,neo"?
