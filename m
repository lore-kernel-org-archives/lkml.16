Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D6524C67A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703750; cv=none; b=twxqBZ3cph9LgMnwjOokCU5NIgLfaXoNzmN67HBHTBuLId/pQEOizzzcQFgpj16pb9i85HA2d9JX0zpYYG3PeFJPrnTosw2G4LANpOEFrZdJy1+P6z4ZLtGdEPMpHe78C3nxNKABDphNlMq6frby9XxP90vTXaSAH4emaqmMyPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703750; c=relaxed/simple;
	bh=YYqmdGWqTh2Zlj11kfwicGpoEMJ9HdJBcKGJ5TTeHcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lgVDuyZPgV8svMPCJUXri/gk+W5vFeYaZxctTCSFm+WqYSfKPTEVC8Jb2XYfSh6v+eTnAclMzENtg+pl96NLoR9o/DSc5+DZDdeJfKLIreX1ALFphY2XQbyGUiyntFc6dvmNdPXbrHRJS6bretydIIpXyswXetCGVdqAxMPYy9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OehvcAxG; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OehvcAxG"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30ddad694c1so52226771fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744703746; x=1745308546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYqmdGWqTh2Zlj11kfwicGpoEMJ9HdJBcKGJ5TTeHcY=;
        b=OehvcAxGfG/APACuiUEUyxhqQ6UleZ/jUX0OruoxDs7gEBe3rU+VoXsEn3BRUu5/ut
         S6mXG3yW/fw9oq8zaDGnF++ED1qilTOZg6bthZWF+94vVc4gtr+RuRsTTNZyTe1kzLFQ
         FHV3qN5PX7dzACEURE99CZAWgILEH0dkpOIPHW4xoiJy34HPvCWK8q258/RKNBhlg8ac
         jhKkLHUHsw9WQIivTdQ/e1mk/Vp4ZlA7aGHdh9n719CczqyzyxCxq48lCBNRqKwdoAFJ
         Fp5z0P+tUSSmHY1/6ozNbxbl+JL9QB8/mF2QSJLim8qdrAdTozm/uQUnKkYpoE4xCUzE
         hBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703746; x=1745308546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYqmdGWqTh2Zlj11kfwicGpoEMJ9HdJBcKGJ5TTeHcY=;
        b=ZhmShuw57FQqFK/lr3fAS/om9qgRfSCPOTcTUARJOVJ9QOLo98xOXEEUrAjaf854eR
         cziIfiwEcKiVwzZvLdrO3cQvm7WK3xmCzZtCq+oBTYTWMr8PQlxVkyduWcGM7+2WsNON
         DAQpdCBsoNGEUzNsLL3oImDwOurXYfU378idFmth9uMfkMuOL74nnN5Kc5yGf3unZgEA
         PKhR+BdcHqi0y9soXrcHqENxtiQol6qCohHpmJjxnavsgFZ/vOSqt+I2iDh4YJiGej6i
         fD01s6kriXiXMkXxvBB6SBD1Dw5OBeqF0/s4nS8yDQr2eBBU8u0PfPb4O75REcqwmNji
         a7WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtCcePushxPE6nvP5smVIlmIqQgmoCJNGFybAtix2G3t739IIhsC7O6eSXO644LDYc16CR0w/2+6lBIAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFrWMmA2RNZNQ06JdvIKrmt+ui5i/KTRaIqhKCnL24H1fJj3lV
	nAbepWKunLECnOkPwQES7BYpbMxix5l0Va/gwllU+fG5XZwxuvVMhZlj5XgynyJJstgk/rU4d1T
	EwjlLFeo6AD2Q4EQcZA9xgkdtEmeS8fV0U7HLIA==
X-Gm-Gg: ASbGnctOB3MLozE0Qx/oqeyzQYJihq0n1RXkkAX8l8AwT1Mpwgjov6jkkAb0fsnGtf3
	FBAmdZO5H+gZFgqG2FMiW73Xy1a4XY0G7GNkyzWGvrb64/NjdZCNveBFyjXzUlL39bE+cfm2QNG
	nZaMPXU/xZWJTfsJ3pifRn/Q==
X-Google-Smtp-Source: AGHT+IFs/nUVE9ZHpBsM9ISeqvfrNgJXQKoiGQRya625PualetasE53RPjloI8lyn4EgmyL5PlrCTCKXaoZAKNCtz2s=
X-Received: by 2002:a05:651c:146c:b0:306:10d6:28b0 with SMTP id
 38308e7fff4ca-310499b5baamr48649081fa.1.1744703746535; Tue, 15 Apr 2025
 00:55:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
 <20250401-gpio-todo-remove-nonexclusive-v2-2-7c1380797b0d@linaro.org>
In-Reply-To: <20250401-gpio-todo-remove-nonexclusive-v2-2-7c1380797b0d@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:55:35 +0200
X-Gm-Features: ATxdqUE321qDjf0iPOYzjELC5SbNbPWdhKHQ6bsHvDdXjB1_8CjTFcaqogQt9nM
Message-ID: <CACRpkdbV=n1BjiTni44BbNnLqPtE+oirX4wbmHcGvdhi_3Va6w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] gpio: deprecate devm_gpiod_unhinge()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 2:46=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This function was introduced as a workaround for an issue with resource
> ownership in the regulator subsystem. Rather than passing the ownership
> of a GPIO, we should make the regulator core be able to deal with
> resources it didn't request. Deprecate this function so that we don't
> get more users in the tree.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
