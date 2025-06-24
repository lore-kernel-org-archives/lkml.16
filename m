Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C29E2E7F24
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791905; cv=none; b=nC/T5CzAoWhQbWy0a1Zrcp9ixqGecevNew//tqkZLkjiwpAdJEFJ/TCFWy2jyHGsPX8mhRVb6iMUce4EqUFJvIUmYM86fCrce0M5gHmSLEFMLCrk9aZPJqGBJOY8kptJ2B2Y8Coi0LWvOeQeJUMHFu0YQeiylvwdM4RaY2r+Srg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791905; c=relaxed/simple;
	bh=mbsb9+fWnbzsLx5rxji39vFSDusnvdjQ+VlMMWao5NE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mPraDtIhTBJTM1UibnUeuw19wyLVbsft27kWGZLS0dTODtJsAHVErtt8efrrXFqbSXEwun6W4Dtu2SP1PowFMCaukpdhv/yRvRnq/yBg9pxOWNbHCEpvhZx4EX1N61ZPnCI9zI37HiyR9ofgCKO8Zl++Y6GuHAWOeqiBivLg+w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=greaUKvA; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="greaUKvA"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32b7cf56cacso7646431fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750791902; x=1751396702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgrYreYVLH8FvHoQvhsa3zUNDQAJAjppKx7XORV5c4c=;
        b=greaUKvA3QPRnMukNkOtP1Rs94G9Ik3Gynpo7TPJAyRdeEM9OjvRLrU3i2BCZwhSdL
         Xf6FZTMGRCZBRaXrjV7KEvJxLjCtam936SnmNhEbi5zGwqsQ8870DKYTZnZGjs/3ATZI
         vXQkYyIL+CU2XRdapzIgeH9hWKovuYpX/ceNUtEXFAlYSw+8uCj45VudVx9pKnyLReAy
         s6JbA2D67mA3mo1H02O/adj99e34r8NpL6nnuugv8FQJc8KHJU12ZvBjVbycR+tuu9ud
         l9vWfZuSSoBh0T2sw66WaF7RUGEIvjFNrbTbwpBFr7HUtKCIwZ+o+R0gLNaI9SukfQ66
         Fgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750791902; x=1751396702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgrYreYVLH8FvHoQvhsa3zUNDQAJAjppKx7XORV5c4c=;
        b=tfnRfMFR3JghBTqQRzR7ZqGVN1Qt01qzuoKRnQO51Bczat0Zr4wTU3DDJJ2ZMECsPF
         JR+e+gsGjOkzXTdqnvxyxki/7k9IqDU0ztsFhrfFGqgJqLfepTeXPnrYFVEn9IRKcg1z
         1PS7rc2Ya7y4Frpgo0SZMWxAnVxjM0ws9Tm1DcrXo0wqNtT/1GwGag9L1sPWowYbe2Ig
         AgvJHzBqmpwrqH0U/53Fo+XLxwFBVD4Ui1nZLw6tp2Nh5BQNP2tGXHuWWlZs5BaNoJOy
         OhO5y5wVEjvlmAzIwGru3GAfPSyZZ/X3grJGq4DWfM/kB4Iyjs5jZVzdQqa+g1hYdgvh
         Jnuw==
X-Forwarded-Encrypted: i=1; AJvYcCU4NR0q9E7BNS54lzeD+2TssBLRynzPJbf/aioztErAFm0hiU3mYgT/P1l7AwxthaqGMXkhouZbLze1QUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfHSwpR5STiH2sFGE5KT6p/BFXwM7vfqXOlcs7U8DAZUpb8hqs
	1QYmbkv8DglQJpfrcIRnm3v2Z4JCPkMTg+uFw8vAhIfDqQ2QfWNQ/73H97Il+woORYx5Xcb3a6q
	fswt21SADZnMKeTABGQls+PdRyf/0WUvA0LgNk6cZVEeS14e6/rj6a2Y=
X-Gm-Gg: ASbGncuSlCrvxdGPn2O9K++tjGBKgeyng9tNVIPbkYDmU2zpnA4z4NqkqBNPDZgD1Rd
	Fx7gzPSGt15Yst3zsmuZbo8/K7kTzvtAoozvgBl7UGK6Tp6kAWNzGibFaHF1esXdQI+jXaBCb43
	6iCMdWTIiXM9ZG/m3IGJE1jJFGLNjnckb2qTagOWhcWew=
X-Google-Smtp-Source: AGHT+IGRAdbblRlD3BsEideIncBbEmzKvsoZaeWYiP0C3/Bj6arnBv99h8pdXRsP35lURKgQ2I/vILxQ5IGPRudpng0=
X-Received: by 2002:a2e:a54c:0:b0:32b:72c8:9a5d with SMTP id
 38308e7fff4ca-32cc4d3d6f2mr2458331fa.0.1750791901594; Tue, 24 Jun 2025
 12:05:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <OSBPR01MB1670163BDCA60924B3671D45BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB1670163BDCA60924B3671D45BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:04:50 +0200
X-Gm-Features: AX0GCFtEg0ndXbqdWy7FvRv-qpkhJSjku68IPxwnvAyNolU9JWUszgMqSgQ21Yk
Message-ID: <CACRpkdZhHVBc+aGA91Y3hHOe13C4TYwM1E_mH526dTECBZaP8Q@mail.gmail.com>
Subject: Re: [PATCH 00/16] MIPS: some compilation fixes for the Lantiq platform
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	John Crispin <john@phrozen.org>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 4:54=E2=80=AFPM Shiji Yang <yangshiji66@outlook.com=
> wrote:

> This patch series fixes some MIPS Lantiq platform compilation issues
> found on the 6.12 kernel[1].

Thanks!

(...)
>   pinctrl: xway: mark xway_pinconf_group_set() as static

I already got a similar patch from Bartosz.

>   pinctrl: falcon: mark pinctrl_falcon_init() as static

Patch applied!

Yours,
Linus Walleij
