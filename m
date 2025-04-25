Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A16245014;
	Fri, 25 Apr 2025 11:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745581280; cv=none; b=twr/QHgL07cvvdkaUMjNliwM2Qp40etCUPB1S/nAV4zAg5oCFrovvVz++o0hfVtQUiUILitGkVlONPz14PuowhlmTz4ufpOxyMprMxWEIAE9NU0ekoSgi9rpb5d/b2zDOu2RcoMUDqW1gqzVsP74F6CruMjijbQ9O8T8fV8m9qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745581280; c=relaxed/simple;
	bh=hPfGrECKFcWEMNQnIM2AZVH2K6h+gcz0LypC0f8QB8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=StdOpbm1B+AhDJAL1OGto63w+m7TQvN2NqjtuwAHjQZ/rD6ljgqp6tv0M74Ngm2mkmDt01t/DwyZIPpjiySfAtwb95n/p3XgKUzgQ0VG4dSEPukdxkQWSrGC6KV6z4gHhjhSOZyQP22N0jL1HZw2vJJ/r8Wdiz7lo1LnLVA0uxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jiHVua4C; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jiHVua4C"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47691d82bfbso46640931cf.0;
        Fri, 25 Apr 2025 04:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745581277; x=1746186077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zHcCfM1HSsSCDVCLPk6d+vTWAqwAKyrWGRSQ0Rhx+U=;
        b=jiHVua4C2ShZVzHLsxVDx7A3wYamzrgB41OCCCR/MWKVWd4l0SEoDxzP7ErDya7ocs
         UB61F2o+XoyL1c+PLdyXeY2jNHC2rCro8dlk/PsUv6uhhVG/6Bf7kospS0zw/4sg0lmD
         /Qu7MuQrkKTRRUkS2AbP0lEQKmYPAN19uLv7SJP8yCaBLRDmtfA7rVrB1125/t26jhX8
         YPkYOSuIfbbdTncej7XNNH2SOJNMA+4tE2P54Bb8yMG/e5AEb+wyG3BDoopK3oyRjBFR
         JuGsMtfHV3+ORxImNwZ1CJpjDUGfiMLZRBHF/Doy5h32+uijkE8v7Mz3WmCauLrS8pGG
         atkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745581277; x=1746186077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zHcCfM1HSsSCDVCLPk6d+vTWAqwAKyrWGRSQ0Rhx+U=;
        b=UjEzKDhrl6+xI/GI22OM6QXxpgksJqmI5aor0amaEGe5Np3YRhn5NzizMsdB9pJvgP
         dbf1DJvis8JpjgtNN8dh+WP7Fm9X8vK/8ELa4mo0+2n6hHFGSAagkFx5/yI72g2uIoDy
         vCSw6onWXO3YMknTUusM9cAMmeuSeEJ8yG7QWjYqD5JDd2ay0k3F9IQUtqBpwZeeKNZP
         YI3N13sJOnXeLVuBu9nrNP8mPsMg7omKsTffL8Uz3T4vTOVZxwMfOmxMsniaIkHd7eIP
         dDrqhey9Apgmj899/5K+8l25wivhi5HkdpHckjp2VEX6sCDzdkKEDVcX5XpKKjxASFjb
         IGuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhZWRdhMsrmf6ViaByQsL1h+T737zXdm0SvChMxmL/sHhm081dPEA96Q5KUWBXQjU2aAowfjV/SfUQ58sk@vger.kernel.org, AJvYcCUpJf8IQ0cu6QPZzHiwxUDSjk0yCS/J8h+T/uTxUkmD14L4vZ5Rz89HgLmhUl+DJf3VZTXaUgcNXErn@vger.kernel.org
X-Gm-Message-State: AOJu0YzZGA9DuBmaNM/EliFtNzg9sthtZCsSz+aJY3cV7rBCCnyXL95M
	nbsbgEYAFZfava9L+YaNkt3pznLzgbDQO/z5Qum60J24nLulMijRYjl7rRIf6TSTeMgMhu6J5Xz
	BgAiPNwdoyrZGXvYmtg6LXhrddEvBxbWrqFs=
X-Gm-Gg: ASbGncuUafn+12ehJECWk0BDE+4xDFx3+GypjVafswcz+9ThDIhcgQAEL7CwedmymNA
	r7DPSM0uq3t9o2pBF32BPJozeho2djewVIh5Bxmnwm2JIw2kuTD15q3IXUzFqpWZKYMuhND6cO8
	8FOInjuBIDLaaSnutncLS5NnBKo7BcYwBb+PhitSNAvdTjeQ08anGUVQ==
X-Google-Smtp-Source: AGHT+IFkNfMrEkt2OLQpD1shT90xHG1USl6LfDxZ2FGfY367Tscfx0A4o/7r3mMaoZQdqcAjqfmpcFi/fYlqoZbRX+g=
X-Received: by 2002:a05:622a:1991:b0:476:8f90:b5b5 with SMTP id
 d75a77b69052e-4801d13fcdcmr35202461cf.27.1745581277388; Fri, 25 Apr 2025
 04:41:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418-apc_paper_binding-v2-1-17c9023b7c9b@gmail.com> <20250425-polar-tamarin-of-reward-c57e01@kuoka>
In-Reply-To: <20250425-polar-tamarin-of-reward-c57e01@kuoka>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 25 Apr 2025 15:41:28 +0400
X-Gm-Features: ATxdqUEpNuktPOA4KReBJ0ipSgTM3Bzqbz64PRQCms9H1j8nBpSuJhCOtEASRAc
Message-ID: <CABjd4YynxcBT+q69GuXwM447uXmGbkZ4JxFF=c0M9+R25dnvtQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 2:19=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Apr 18, 2025 at 07:24:25PM GMT, Alexey Charkov wrote:
> > APC Rock is a development board based on WonderMedia WM8950 SoC
> > released around 2013. Paper is the same as Rock but lacking a
> > VGA port and shipped with a recycled cardboard case.
> >
> > While at that, put myself as the maintainer, given that Tony is
> > unavailable as of lately.
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> > Split the series from v1 into separate bindings patches so as not to
>
> Hm? That's odd.

Now that you've asked it (and in light of your comment below) I
realize that Rob referred to rewrites of old textual bindings into
YAML schemas, and probably not this patch in particular.

> > spam all the subsystems with unrelated changes, per Rob's suggestion
> >
> > Changes in v2:
> > - kept single-valued compatibles in a single enum (thanks Rob)
> > - dropped the empty overall description node
>
> ...
>
> > +
> > +      - description: VIA APC Rock and Paper boards
> > +        items:
> > +          - const: via,apc-rock
>
> Where is any user of this? Bindings always come with the user. Board
> compatible comes with its user - board - both to SoC subsystem (in this
> case me).

The DTS addition was in the original "merged" series [1]. I will
resubmit it along with this binding change: it has no external
dependencies so should not create any hassle (i.e. it can be merged in
any order vs. other VT8500 DTS additions and cleanups that I'm doing).

> See also SoC maintainer profile describing this or my guides how to
> properly target SoC subsystems:
> https://lore.kernel.org/linux-samsung-soc/CADrjBPq_0nUYRABKpskRF_dhHu+4K=
=3DduPVZX=3D=3D0pr+cjSL_caQ@mail.gmail.com/T/#m2d9130a1342ab201ab49670fa6c8=
58ee3724c83c
>
> and great example:
> https://lore.kernel.org/all/20231121-topic-sm8650-upstream-dt-v3-0-db9d05=
07ffd3@linaro.org/

These are great explainers, thanks a lot for pointing them out!

Best regards,
Alexey
