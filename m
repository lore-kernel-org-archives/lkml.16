Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E58823C8A4
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632903; cv=none; b=RQutL0Q4K7Lhd8ehQ0fGBveC9KIF+/VFqqvqcYjlO9EXvCPQ3gGGVLyuocVPvYF9Cgsnlu8c3Sv2LGw0jgoudpr+q2yzk5exLqq4k7Ry1ooZyGPpunY+Twv8jQTcsxjw0IbX+ndStAZiB8cPIJZM/pquUuWI+oqDLNrbGYR3H5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632903; c=relaxed/simple;
	bh=XI9MRgqXRnhIDDskprAJ7Lp7MjrJKOdvMtsvO4mRxYc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bqxWe+5J1hNDxJ0/trBphJaMPBKVsVQqkHBq7yw+0kY7UT29tNQhpg0JqZOCjcmiSMvDV+jvQ9akiogHpJnOZxkXQR0RactALmast8RMmKOldO72qAodReEFi1B8KU5jkWbcIUpylTpyV6/O6oqDo0BXyO0z2FsOFeQkU0z2v3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=volHhDyH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="volHhDyH"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so54096675e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749632899; x=1750237699; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XI9MRgqXRnhIDDskprAJ7Lp7MjrJKOdvMtsvO4mRxYc=;
        b=volHhDyH09v3nDkjEPsHoS4m7mTkTHd8/bUsINK0T0c5j5qXLpe4xTZanBXhOBaINA
         JWg/megBqwymRpHiUmDyrdxbiEJFk3DlhZY711SPmcZPq1LXTim+IHquIzB7OZy/NI2Q
         K88Bn0OUTKPi0oMl2Vuj2/iN3ZCQX3NQJjJfDpleWKRKS3Yk7DpzjQX1xQ/FtNlgqhSk
         qQCo24+CfG/rdWdLG+b/3hqmmYlFx1DN86onnyXmH/JjTDsaSXMkVrdhPpefUG8hP8Xb
         eRl+SYrv2zJOqFX4ns8VGxip2+iu81jLlQIo13qFt4uT/R+ECASuObjup48vD0FJ6nrW
         IhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749632899; x=1750237699;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XI9MRgqXRnhIDDskprAJ7Lp7MjrJKOdvMtsvO4mRxYc=;
        b=gsDvlQIVSrv4xc+oSmbE+H1/40K2FR1oWtpxaTmmQ0BUbMCXuGSgXvOqstA19hR7M5
         dBuoJeBpmbanqREsODuRxPmRIkMazs7PXykWuVCo8cl5Li4f1RX190H54dB04DQTauEZ
         Qo07zZTRmMKNgezXX20DF1/LURC3nkLHoUJ6ZmOAze1YVIowPgKsF+vcg/6ht/lumBoX
         DzSQmcdEo3nkrAVrQaDovjZUeq4ZhyTbxUMhWsZUzYREkOOrwKgKLomS7lmn5ofMW+LL
         woGke+VVfEhbl4gmYBbbWT1CC9TQ/Dhx85kHxGdt0hLdyOFnC6RWfBYVycSryVlxx5+V
         UfJA==
X-Forwarded-Encrypted: i=1; AJvYcCUQH+MhTB891CI9P6OLZjXAaBY8wz9kmLVY18qkNuJgy7Svb9PvCD/uBqDhWuluACVpVAqfsQn9V/MiLFA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9BbSLE0PBIHOCSM/PLGKC4perJt7HgK9M7Y8AlMBekiCmFLiz
	mFtyCkGN41n0Oj8KuZXr3I+VIVtHYqo7Pv9UGA5t1RE0HrUGrlk77G4Oeh4RfLQlDgA=
X-Gm-Gg: ASbGncvDXwBxAptj2/spl+3JCPB1HCYKurfqVKOltQWw8zSHiEVFeYRo2xcR4jDMFYe
	YCpRDr6G2P+50ojRDUwHnIFKF60q0pRpN0UTyN3Znn0Qy/IYUPT1ykb2sv02LD8F0w3iK2l+HxY
	znG4fLgFVBfqOjrbgDLNQxssE/ARXhIb8fxfExWOayk9AKa7KV5Pgmi8KWD3oxfg3tFkWlKq4ne
	IVBNQ3spDRnRMrCKeN4BPu7UMGpPUJNsXmHsiIX77wYOJE9xMU0juAt7LWgH5RYFR/es+wrkN9E
	c4E2fVyD1pUSIx5QJZ01xrsvWC/KAFeLnfRp6v3uEgKuBUul9jhoTEqlEF1tbIGNpw==
X-Google-Smtp-Source: AGHT+IEMk6D24rAbr4EjAYiW9bu//xAst28BwxOZGS7RIT+PIp1VlXvEeVos4jHxD+q9aHTVPlGzRA==
X-Received: by 2002:a05:600c:4e4f:b0:450:d01e:78ee with SMTP id 5b1f17b1804b1-45324f421c8mr17677035e9.24.1749632899307;
        Wed, 11 Jun 2025 02:08:19 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244e0e3sm14903832f8f.68.2025.06.11.02.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 02:08:16 -0700 (PDT)
Message-ID: <013f55a0adf0b23e0836e33ee4ea0e1e7864a467.camel@linaro.org>
Subject: Re: [PATCH v2 01/17] dt-bindings: firmware: google,gs101-acpm-ipc:
 convert regulators to lowercase
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,  Lee Jones <lee@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski	 <brgl@bgdev.pl>, Peter
 Griffin <peter.griffin@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Wed, 11 Jun 2025 10:08:14 +0100
In-Reply-To: <20250611-robust-vehement-dog-2bf6ac@kuoka>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
	 <20250606-s2mpg1x-regulators-v2-1-b03feffd2621@linaro.org>
	 <20250611-robust-vehement-dog-2bf6ac@kuoka>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Wed, 2025-06-11 at 11:04 +0200, Krzysztof Kozlowski wrote:
> On Fri, Jun 06, 2025 at 04:02:57PM GMT, Andr=C3=A9 Draszik wrote:
> > Using lowercase for the buck and ldo nodenames is preferred, as
> > evidenced e.g. in [1].
> >=20
> > Convert the example here to lowercase before we add any bindings
> > describing the s2mpg1x regulators that will enforce the spelling.
> >=20
> > Link: https://lore.kernel.org/all/20250223-mysterious-infrared-civet-e5=
bcbf@krzk-bin/=C2=A0[1]
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.=
yaml | 4 ++--
> > =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> So this is also a dependency for the rest of the patches?

My thinking was that it makes sense to have it in context with
the other patches, but it indeed could go stand-alone if that's the
preference.

Cheers,
Andre'
