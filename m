Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECDA19995E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826374; cv=none; b=TyiMYQC8982ir4YmbJYubUXiDE18kxxs45CsP7ebkdCVN/bgS1Kg659MIUY0FdW82PcMVM6iWxil0FQDrm+Jiiy3kOcT2R3/0Le1/uk+1eb3AHRTPOLUGXCaqJyTvKSuJQP2Y1a95US+NiaW/NNp9TpdcydAt/KuCEtgRnNWfUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826374; c=relaxed/simple;
	bh=uzggHLNmauKyLZnZNxfkll09fUrU/RimXTpX7sjHfFM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n/NJdy2B4c9lxKQkPX52aUKRovDAauy2ql87tWnKIdUUT8S2FJ0TxzRjp1o0ZK6KqtqtUAWQ7ADWHX+T+s/ofmyMDotN/UaspK0AmgoQbDe1P/kYfsX06JDya84oYjokxysDuqNFbZWotZARaqZdxsHQsgxWyOE+P9WDex82kFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j0dzixTX; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j0dzixTX"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a51d552de4so1391387f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749826371; x=1750431171; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uzggHLNmauKyLZnZNxfkll09fUrU/RimXTpX7sjHfFM=;
        b=j0dzixTXQjLZuCnkXsUKNjYlOy8bAUFIYvhWs7g3ncYFoM5h8UbZDC2qLfqKPL0Z21
         QKB+7HJjdyzqfHiNEMIq+A0uVwwtuj75oDaSdsQYOVERwBhvoLLhkVaPAmqq+kF0vU3o
         s55EFWDwcAyDnc1i4n1ZOvSaLBjUEqNYlUKnrUOjDGJZ+XntSBwI2yrhx9ZV0xvWtMoU
         oCukR0eBpcAp5BI974S9XMIia3i4FWKzVP6NgCvfc/aOXTuzn/eBJpnBjEmcqb4x4u8D
         bnFVf5bx5iuwajJXcUYj9uVXxxs2v6OTPXk2QiUN4LsnwCj5XT5R8ipyfy3jvTQ0BGCF
         qeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749826371; x=1750431171;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uzggHLNmauKyLZnZNxfkll09fUrU/RimXTpX7sjHfFM=;
        b=iLOgtJVLFVD4bu9m3Clde8xurCxPBNM9+ly2eu8zbwY/YI29r3Qg3Qr2k9Ah6HxAI9
         LBvaZSeKvXM/ggG8dc4QY6+fm/Aq3p0lRaGxkeaJIjuNkaERpKgbHmImizj8jS/asqm7
         gKUq/HfyClKoeC6RaUObomxn3Rzj3QMDFmxFCsd7AueqdCw65ymVpEIyR8J9Rdz3+JDW
         Qh+fVYXt5LQq0Nh02VLPxm18qziHqddVDql+bgP25Yoo2/CfeB+i8TRUpclzfU+/A2L6
         9aCNlbTvEnZPEdy+uWOfJ8tItSWHUFZrEbkxBUNlSNYd8JjKt45YlTuh8OcNHLh6JyNq
         P5ig==
X-Forwarded-Encrypted: i=1; AJvYcCUBu8utcWrq921gU567R3wpxKzTVf5jruco4DYn6D2tRt/GxdVZ01m8XmCQI/da/1IbIOQWYMifSvAYYi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuLJP8meY1r6txaosWiO5Czq4mm4YsTwLpBz46B74FvXJnNKHX
	7aC8LdRxJGrmYdDRPxMg1X1i9Wc4OtyYe6yX3/e/toAyWFMGdIGdJhgz5Flt85HU3aA=
X-Gm-Gg: ASbGncvZNF+QptJDXXg4vXnyNeGTkMwgsvHmNHO5QuEo4DBVXBhB4t/ZFvTf1vl1fby
	KdvDcGW4W4Q9UjQVVU3z2MPLjA7UsWXoYvBpZLJRPAmmQ7XTI1iixjnyD0yr5JIqeFdTcMbXJzW
	/KcXxZsvsMAZf/LMyI3X9RhgjnqshfquSH4XQP1v6nnkTpETc9GnSlGRFU8IU/1IDe/A4+PCk4v
	T2WkKkDrgpI+P/NjYFSoNJSoJwZyDxFbhah+Vh/VCF0vrfZ9DyuE7q4qyQMKgFxJkcJpneMB3xw
	Q6UR7i+HjFGI6HxAgmDb5MuI8Rni1UKM1H7b4LuRUWraI4HAx7n38DSthcUMyAi/Lg==
X-Google-Smtp-Source: AGHT+IG2os3T69uU8xe8GheoIqFNES/C1cIVspYlMQzrl2qRtOCi+gxQL8uj3nxW1PiifYDCebD1JQ==
X-Received: by 2002:a05:6000:4a03:b0:3a4:fc0a:33ca with SMTP id ffacd0b85a97d-3a572397d6amr13520f8f.4.1749826370906;
        Fri, 13 Jun 2025 07:52:50 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25e89fsm53198455e9.33.2025.06.13.07.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:52:50 -0700 (PDT)
Message-ID: <17434d4ceae1e65a5151bb1308b8e49dbbdaf021.camel@linaro.org>
Subject: Re: [PATCH 07/17] mfd: sec-common: Instantiate s2mpg10 bucks and
 ldos separately
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski	
 <brgl@bgdev.pl>, Peter Griffin <peter.griffin@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Fri, 13 Jun 2025 15:52:49 +0100
In-Reply-To: <05b9862c9a8f11bf7d7c8afdf60ecff30716a196.camel@linaro.org>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
		 <20250604-s2mpg1x-regulators-v1-7-6038740f49ae@linaro.org>
		 <20250613141902.GI897353@google.com>
	 <05b9862c9a8f11bf7d7c8afdf60ecff30716a196.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-06-13 at 15:49 +0100, Andr=C3=A9 Draszik wrote:
> Hi Lee,
>=20
> Thanks for your review!
>=20
> On Fri, 2025-06-13 at 15:19 +0100, Lee Jones wrote:
> > On Wed, 04 Jun 2025, Andr=C3=A9 Draszik wrote:
> >=20
> > > Bucks can conceivably be used as supplies for LDOs, which means we ne=
ed
> > > to instantiate them separately from each other so that the supply-
> > > consumer links can be resolved successfully at probe time.
> > >=20
> > > By doing so, the kernel will defer and retry instantiating the LDOs
> > > once BUCKs have been created while without this change, it can be
> > > impossible to mark BUCKs as LDO supplies. This becomes particularly
> > > an issue with the upcoming support for the S2MPG11 PMIC, where
> > > typically certain S2MP10/11 buck rails supply certain S2MP11/10 LDO
> > > rails.
> > >=20
> > > The platform_device's ::id field is used to inform the regulator driv=
er
> > > which type of regulators (buck or ldo) to instantiate.
> >=20
> > I'm confused.
> >=20
> > There is nothing that differentiates the two, so why do you need to?
>=20
> On gs101, we have two PMICs, s2mpg10 and s2mpg11. Several s2mpg10 LDOs
> are consumers of various s2mpg10 bucks & s2mpg10 bucks, and several

Small typo, should read:

... Several s2mpg10 LDOs are consumers of various s2mpg10 bucks & s2mpg11
bucks...

> s2mpg11 LDOs are also supplied by various s2mpg10 bucks & s2mpg11 bucks.
>=20
> So we have a circular dependency here. LDOs of one PMIC depend on bucks
> of the other.
>=20
> If all s2mpg10 rails are handled by the same instance of the s2mpg10
> regulator driver, probe will defer (and ultimately fail), because the
> supplies to the LDOs can not be resolved during probe.
>=20
> The same goes for s2mpg11.
>=20
> The result is that neither driver can probe successfully (unless you're
> _extremely_ lucky due to parallel probing, but we can not rely on that,
> of course).
>=20
> By splitting LDO and buck rails into separate instances, this circular
> dependency is gone, the buck-instance of each respective driver can probe=
,
> which then allows the LDO instance of the other driver to probe.
>=20
> Does that answer the question, or did I misunderstand it?
>=20
>=20
> Cheers,
> Andre'
