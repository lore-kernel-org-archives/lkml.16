Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2754A9444
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826155; cv=none; b=tTIxlEiP6ypyV+lpPAtAEDJATYX7Pqg7C4SL8DeSc/JmswMAl9ixUWHDEG7gZ+zhHjlSyp8pjeVnxcE9NO7CyrENIP+nZnDzqs9MCrYMQPDQg3REpeEr27nZfUZkUkAi3vLctlPxmG+UdzJBPTBNGhASuAq/kx4lOuObyktMR0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826155; c=relaxed/simple;
	bh=2cJno2Hoj8gBQakrsjFx1WU6qLvNRnglSPMrwyBSsfw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OpUTArr6thCpFb9Kfhbs408sdNpQdioppTZ3Wwy4v+2OGjERoActE7P8qTOsYuV/sp9HUt4dlrnAFzSmt3WVyFTRIDLI9Kx6g8DBHq+hdunktqtBcPcXkuX/Fuq60SPmkHSWVrU3/66HCAuiML9HnOhgipELWp3OK+RFVzp5vlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rVsnaivI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rVsnaivI"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-453066fad06so17178725e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749826152; x=1750430952; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2cJno2Hoj8gBQakrsjFx1WU6qLvNRnglSPMrwyBSsfw=;
        b=rVsnaivIXxckmHKkmEdauL+K9MnYezTJZ4JKghLmBef49U3l1sGT2L+nKfYOvTor3U
         mZA2IWvhNwOiSuyRVYdpFRjnMPV6b8rCkqP4DHpowjrhEhrFGoCWj9vxJIbiSo0Vb2Vo
         Lv43QVid+50SdqVOwt9fMR6ia0hgeF8vqqzucF/5CedOEGwP+u5bz03I0vbc7UuMB2x7
         YHVsreRiIS49pa1bO+clZRn2EeTfsysRfTIybW5YlH1NNlesKwDOnW2zM2oC7/0ZEjik
         T7FTmW/7ZOgch4nMvTmU9UTifZypG1x+TeNgbDYyOpeiDWyIAqrX7IelXLUbYFSMNw/F
         +nlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749826152; x=1750430952;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2cJno2Hoj8gBQakrsjFx1WU6qLvNRnglSPMrwyBSsfw=;
        b=A7CPK2PC9/iVUqj1omVnGzXSzQLebn4w4zflYvznFMb4Rn5dJhKdgJJMlBFWk51pnm
         YhSfxCLjDqDsuz6clWAAPpavNXOGIZRFwT6YVMohbFdcVkOfBmHc3UH00oDS8gmWLhcN
         PyMExRIdA1asFluoZjbo1Q/7rv5Kg1iqSvTnWAQ23XZeGrXxAr9sSknYyKrmdAbkBGv0
         76Yoe9AgsJNjMj7PzU+5rzV3UUU/39XJQwr/KTl1iVgpRxlpvmEQyvIJ/KhRR5Tkcn6h
         FZ4jNj5/v536yWXBYXg9ohO9sjh4Ru9NB481KDxKtydJGhDpPW9TGihvsGE0HDvtrVSY
         Ie1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRFqZyEpmhEOd2NQ/QgI1i91yRbxIRhhdX+fcBBg1WoNobRmlHMUfESQphttem4yc+g2xVqudKW6Jvr0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWIqbemLLAiZkurrYX7dC1KCZGyJoYwImwaUzKSXtKZEOS98om
	I70J+g8eYCKAyz5XtrHw0TuGHSJ7KEbZ7qDzchNlo2lHKxt/nERiNmcJnefBIzTj0rE=
X-Gm-Gg: ASbGncvTxYOBcorzyOC9XaZnrZwWr1Qm4pojGskCwwtQgsX0nZWkAd0zacXA4Zn1u85
	SJdt6Dz3otmh0U0FrN2e9Q1bvv9bi5UFkEvBqW1MT4Ylu9XrVy4rRgi0vOYqbwkO4yGF0MiEYl3
	7Z2L/8Fu9gMJE6iw3Dik7Pg1B98i9mcwXtjScuWoAT3keO5Gi3nxAk6iWYrTEyESTMfHHmwb2Yt
	6JrvR27dwNUpsNCIB85OuonoMGf+PUvSPJuJFL94Y0pzXbzhNljyzhmKE/VMTMB87xreqWFMOWl
	IP3HhkCg5nxsJFvu7mKuPRcpneEoami8Yz59KedvqyFE+UFBbhXe0P2bhaMr6Op3YQ==
X-Google-Smtp-Source: AGHT+IHGGsFtFCfbuYCXq3oL8odq3HLL7l0GwRKDXbGKH51pl4haYPNqSjXxdeo1IqvXv5YDBnxJAw==
X-Received: by 2002:a05:6000:250c:b0:3a5:2cca:6054 with SMTP id ffacd0b85a97d-3a572367c51mr3741f8f.4.1749826152548;
        Fri, 13 Jun 2025 07:49:12 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b5c372sm2510723f8f.89.2025.06.13.07.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:49:12 -0700 (PDT)
Message-ID: <05b9862c9a8f11bf7d7c8afdf60ecff30716a196.camel@linaro.org>
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
Date: Fri, 13 Jun 2025 15:49:10 +0100
In-Reply-To: <20250613141902.GI897353@google.com>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
	 <20250604-s2mpg1x-regulators-v1-7-6038740f49ae@linaro.org>
	 <20250613141902.GI897353@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Lee,

Thanks for your review!

On Fri, 2025-06-13 at 15:19 +0100, Lee Jones wrote:
> On Wed, 04 Jun 2025, Andr=C3=A9 Draszik wrote:
>=20
> > Bucks can conceivably be used as supplies for LDOs, which means we need
> > to instantiate them separately from each other so that the supply-
> > consumer links can be resolved successfully at probe time.
> >=20
> > By doing so, the kernel will defer and retry instantiating the LDOs
> > once BUCKs have been created while without this change, it can be
> > impossible to mark BUCKs as LDO supplies. This becomes particularly
> > an issue with the upcoming support for the S2MPG11 PMIC, where
> > typically certain S2MP10/11 buck rails supply certain S2MP11/10 LDO
> > rails.
> >=20
> > The platform_device's ::id field is used to inform the regulator driver
> > which type of regulators (buck or ldo) to instantiate.
>=20
> I'm confused.
>=20
> There is nothing that differentiates the two, so why do you need to?

On gs101, we have two PMICs, s2mpg10 and s2mpg11. Several s2mpg10 LDOs
are consumers of various s2mpg10 bucks & s2mpg10 bucks, and several
s2mpg11 LDOs are also supplied by various s2mpg10 bucks & s2mpg11 bucks.

So we have a circular dependency here. LDOs of one PMIC depend on bucks
of the other.

If all s2mpg10 rails are handled by the same instance of the s2mpg10
regulator driver, probe will defer (and ultimately fail), because the
supplies to the LDOs can not be resolved during probe.

The same goes for s2mpg11.

The result is that neither driver can probe successfully (unless you're
_extremely_ lucky due to parallel probing, but we can not rely on that,
of course).

By splitting LDO and buck rails into separate instances, this circular
dependency is gone, the buck-instance of each respective driver can probe,
which then allows the LDO instance of the other driver to probe.

Does that answer the question, or did I misunderstand it?


Cheers,
Andre'

