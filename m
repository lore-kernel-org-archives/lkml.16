Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24986224AF6
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 08:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738830690; cv=none; b=ownrudX5uGkAExD+W/Uw+scIVYU+ihDbcCxtM0lSyFT7XR/kiWOjPfm0SXHMx1MtQIBKWouyMIPYmlNKEVm+SQtyyohH/QH+0vNirJWe8vBrFEE1CjEUA06JJTA0bghTJSqHQ0G2rOT2HvWopgzN/YcpVI2J4pIQ9ZPzONEwCrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738830690; c=relaxed/simple;
	bh=7qnU6rY9JGAiQw9ngdfQCIXhxFfBeDNlVH7mfZkuXn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g291sHKGU75Yen4ymssyxUquY1xriXXp7UwS99ePhQCDkki2P73neZcgUFb4ZM9nIHIh0xz+XD5M21miRSSi+A+Ly4MWur8U+ZKczqvfMcqc3SupVmLTXpASonN84InsvmTxdyOGDanK73SHczA1WQho1e/VKs353WKmDvKP6Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gpq17J/i; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gpq17J/i"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5440d5aae5cso736428e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 00:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738830686; x=1739435486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0j9kQxiJvv//qp2UxGHjz99hk0uXs/FtVP89U+kWJw=;
        b=gpq17J/iUi+gO2oMFgdGX9zelIHs06bkJzFG/OV7R0jSBYBQ+9sG1OH2gVf9xp3dnV
         d1hNt2F5bhuZgurBvoRKeUG1JgsWx4c2oAN/rNyEYaZl/MLpSGBYFt4ZGrbQYIlrToj5
         A1Jl9BP1R75mNW+oCXiIkBe09jSBneCCARYvTsG8VOV7bFtFQqBVUsi4wGToxHL+LrHS
         Ao9CKOHwdySiAJoORbPHs90ZPVnkkzG1SEi1PlyIM8QqRYsGan6JI6aTlCR8M8o16hp1
         MIF3EKZFWsb0JETveFgx1n+S9nCgcCDV2zMx0zJRGFe0W3AmGZrgOY9v7e72t2i3TsgB
         lFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738830686; x=1739435486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0j9kQxiJvv//qp2UxGHjz99hk0uXs/FtVP89U+kWJw=;
        b=tsruyvNWKKfu1ytROHkDRgV3hXwb39UendX5pHnGkazijqYhXT969HvvWrX3xPoCnl
         kkjfof2VkEzvS7Qgqp7+Z4OwnSwYMwyHtO+boyJnWyBDAYxV25+S1Pd7sxx7qwFgPm8x
         7+4ZpEK2y8HBAF24jUdc99oLTcnK/E9aRmPIGWJMKg3Ai9Op3J9AUNjXzsVEec0MvbxG
         ZywRdTHk0R3D8n70bLNJ65eAKkQxMgbpXYGDwEmM5jsRgaVcps21kf0uMYg3bnAr0Qef
         4B6+CUpaXCFpgDKVL/Q4zPtlv/6fAkCE5k4bBT1i/0Wnj07zl0PEJQgEkOVNnbU2vIjv
         lG7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBBL4dZroJ89vzLuB8iuCMSDO4yEW1m2wDMgx7SfZyD6nLYB14Kix9YqAhS5aj68JEplXCWoGrhGDO0FY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqOttbt5q/f+je6MIhxcxJuATvzZ+fNYuad0xxkU8DpVEhJhfO
	m7Fv8jPy4ssXn/02p48tGLb7Jv9o/OB2Q3pViKG9zFVhLerUe3w1SE7Otys+kD4fk8a4lbFZVDu
	tMXWrg5sd05qhcC6a8T3tV45uWSoxBuK7PLhIRTYH2Dho6YTb
X-Gm-Gg: ASbGncslvFSp1fcFE+ChEZ58N1h8YyFaACRlWTYVZCXRVA4WcFYeScr2WxGB50qOYdY
	oOX88lXnqB00QEmNE3dQAIXh/EU0L9EsHEwMqH/fV6WG5H59DDolrNL4ER/HoQZ3T4m1W5Fc=
X-Google-Smtp-Source: AGHT+IGljZ9LAstQqpqagTlSof+IuUKRf1dlpjSfx8lVyzkdJRmDio6WGX+nacEMBSYtIcJMw8stP3S1Sw/zXWjx+Ms=
X-Received: by 2002:a05:6512:3b08:b0:542:2990:6e99 with SMTP id
 2adb3069b0e04-544059fc5f3mr1615392e87.2.1738830686028; Thu, 06 Feb 2025
 00:31:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116170009.2075544-1-valentin.caron@foss.st.com>
In-Reply-To: <20250116170009.2075544-1-valentin.caron@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 09:31:15 +0100
X-Gm-Features: AWEUYZnu8WCLX7J7mwrJJb0MWJ0q0ejsOcvgpGEfaxC0eT_vG_3fVD_amGso3r8
Message-ID: <CACRpkda7MbBmas+jcPJ4k=L6ab+EHkKRA3LrTGQfWPKsHeMdWA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: devicetree: do not goto err when probing hogs in pinctrl_dt_to_map
To: Valentin Caron <valentin.caron@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 6:02=E2=80=AFPM Valentin Caron
<valentin.caron@foss.st.com> wrote:

> Cross case in pinctrl framework make impossible to an hogged pin and
> another, not hogged, used within the same device-tree node. For example
> with this simplified device-tree :
>
>   &pinctrl {
>     pinctrl_pin_1: pinctrl-pin-1 {
>       pins =3D "dummy-pinctrl-pin";
>     };
>   };
>
>   &rtc {
>     pinctrl-names =3D "default"
>     pinctrl-0 =3D <&pinctrl_pin_1 &rtc_pin_1>
>
>     rtc_pin_1: rtc-pin-1 {
>       pins =3D "dummy-rtc-pin";
>     };
>   };
>
> "pinctrl_pin_1" configuration is never set. This produces this path in
> the code:
>
>   really_probe()
>     pinctrl_bind_pins()
>     | devm_pinctrl_get()
>     |   pinctrl_get()
>     |     create_pinctrl()
>     |       pinctrl_dt_to_map()
>     |         // Hog pin create an abort for all pins of the node
>     |         ret =3D dt_to_map_one_config()
>     |         | /* Do not defer probing of hogs (circular loop) */
>     |         | if (np_pctldev =3D=3D p->dev->of_node)
>     |         |   return -ENODEV;
>     |         if (ret)
>     |           goto err
>     |
>     call_driver_probe()
>       stm32_rtc_probe()
>         pinctrl_enable()
>           pinctrl_claim_hogs()
>             create_pinctrl()
>               for_each_maps(maps_node, i, map)
>                 // Not hog pin is skipped
>                 if (pctldev && strcmp(dev_name(pctldev->dev),
>                                       map->ctrl_dev_name))
>                   continue;
>
> At the first call of create_pinctrl() the hogged pin produces an abort to
> avoid a defer of hogged pins. All other pin configurations are trashed.
>
> At the second call, create_pinctrl is now called with pctldev parameter t=
o
> get hogs, but in this context only hogs are set. And other pins are
> skipped.
>
> To handle this, do not produce an abort in the first call of
> create_pinctrl(). Classic pin configuration will be set in
> pinctrl_bind_pins() context. And the hogged pin configuration will be set
> in pinctrl_claim_hogs() context.
>
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>

It looks correct to me, so patch is applied for v6.15!

Yours,
Linus Walleij
