Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6BB2D29CC
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559535; cv=none; b=DaYgVB/PCge5/ywnRgxDPhxlqqpkPGZ+WgD4eCfp4o+9i14yX6e/qXj2P8oKfcukn3m0FcWsVFo4qDxj8bRbPLnBJPIhwWnyyif61yb/ML9kwaefoVn2hUiUuX9iL6GkeSVFcZC/1pocwx+mnaax4lnkfDjUplGj13pv7kyWcG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559535; c=relaxed/simple;
	bh=sF3FchzuHdlUwCW3Mdst6w7S6yA7e0tQPeXt1aAxPg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JdZ9mOWeNwyFyx27JKVD5C0UeSIpwR2am36HSUTmZwFZeP0fs1a9UgCkXPNrh9IrYQDzOwiMp5YTb3p7BgrdnoRJWaUmLP+1dt7uM5CCFEw2Drm7yEG+QmJ4dI7gfDMbuEI+WowPk5PP7CFDnu35q8ahi1Ceoa+UyjS7iQOyW1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cdWLT90K; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cdWLT90K"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55324587a53so5982564e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749559532; x=1750164332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sF3FchzuHdlUwCW3Mdst6w7S6yA7e0tQPeXt1aAxPg0=;
        b=cdWLT90KdVDdw1FeZRif/kXP3wq3j1yji3n831jAbXEWZI9FtBXYnUk6v0OwkDghpQ
         jeJjp9i/Ee1CdBTtS7sdRCEhRWsJWIcgg5naQlDPX5hzgiW/fB/6digZfrFcdnR7cdbW
         15h44GQZOW4hiUNmAaQBWJibbypGQ2wfj1PSao1pB7ZIYy66QhpRTmxxNk6JuQid/B+F
         dQDrwjib+jozs7g/T7Va1NE//MtpXrJj7Pn3xXMqKyNKsZXg6Qt9cAYkCFbIFYGYcuw4
         Q8wKyMOH08CNApCsvZINcw9tAVJw2CmABqzCt2WhwtaOm+hXoBhg11lLhL2tsBhhCaD8
         WNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559532; x=1750164332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sF3FchzuHdlUwCW3Mdst6w7S6yA7e0tQPeXt1aAxPg0=;
        b=KY7hZ7/w3jfQvQUp+F8rgjlq4395ApB2HItvSEasKttt4bMIyKmq8HN5QPMN8p30c7
         oa8V8POkN+Q7o33aaXrPQxTay1Vhw3mVx+o6exqMySmgxvNrwTPMnhwsnGIMrhk/3Ohz
         CnAw8o15Jx6sEgas09NpnyKl4/ZgyzbFvob45kU33ZVhkU9lHGOlPja6oSBpZRmzj3bT
         pjV1H1PHYZgE6SkNUkuNCPHda2JC9B+SYGO2Dl6wtql62pZEnw4ZLJA6kcDBsJGmrO6F
         NCnopEwcYI3RsZajABJMtR2PePVnKCQlik1L9GhgQ3L8DoZaUHLG0uA26oSNpgUrb+g8
         lJnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSwaWRXHF++zvcZbMbq6N049jZruF47yWAQ0XSDs7QffqOvvlIiCtupCyAfzXMVd4dYux4KPWhTbpYtTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLDN0RQ7DwWNlUR5wiZ6VMGCQzEACd1sYYEjb6ejFHYKlvuhaJ
	qZ8X92FQWWmgLDCI4ibiihxFiLUfcrUHkPxsp/jNsppB8pDbYA9T8vSg9n7glkdS3kGCIJNr4Zo
	Qpv/kp8W7nL9Sqwem9WvcILp9ANyOoorMCvQknZUQqQ==
X-Gm-Gg: ASbGncu0N6FnbKjLl2hsfnWjcR2X/2RJqjxpNUL6Rp83tVcaKlu7EfVI3noMlqF7LWP
	+zdeloYQr46+fTfgZvZf8fO8f7r20gFpwia/o38xlQwYJtcfmGLdG70kN9laq3mQmoO+6GVQYIk
	v9nEtxsoN0mkmChwc+kEXQHXpOOaImsto1VtPLTQVBxLuAEREHo4cpdg==
X-Google-Smtp-Source: AGHT+IGeGbzOznS3BG0D0jszT5lHYaE7HjuqbP1wt0m4nT4Evnfz8bKcaQ8NdIRwiSEm4rryiTNmXeZgEAh41G1MX+I=
X-Received: by 2002:a05:6512:12d2:b0:551:f166:bbb with SMTP id
 2adb3069b0e04-553931fec79mr844508e87.13.1749559532010; Tue, 10 Jun 2025
 05:45:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609-pinctrl-madera-devm-pinctrl-register-mappings-v1-1-ba2c2822cf6c@bootlin.com>
In-Reply-To: <20250609-pinctrl-madera-devm-pinctrl-register-mappings-v1-1-ba2c2822cf6c@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:45:20 +0200
X-Gm-Features: AX0GCFv8wM1qzK88fvC3YYxO09_iv1tchDQeyw0PYmsnKvpSJ44gK7Ltfx9W9bk
Message-ID: <CACRpkdZZoO4QxgiBr06BkzByiCouMNiP8jhz+qzxg5fQAjWDfQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: cirrus: madera-core: Use devm_pinctrl_register_mappings()
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 1:51=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> Use devm_pinctrl_register_mappings(), so the mappings are automatically
> unregistered by the core. If pinctrl_enable() failed during the probe,
> pinctrl_mappings were not freed. Now it is done by the core.
>
> Fixes: 218d72a77b0b ("pinctrl: madera: Add driver for Cirrus Logic Madera=
 codecs")
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Patch applied as non-urgent for v6.17.

Yours,
Linus Walleij
