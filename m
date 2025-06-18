Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546662E54B8
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750252830; cv=none; b=jxuELJMsFEMlYEFbN/M7imtLKdwhhTEze59eMzj2JohdPkz8UiCTiv+lMDQYfIP9anfRizfSUvwVW2Esf2poQvz3oQzasOpbYcIFXh+q3djFQf2Tobp3c0WPY0nmB4at9+te7VltnSyuegICehb/bA9zMAUNnEMJt2uELWuneTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750252830; c=relaxed/simple;
	bh=pTJodfwDi8QPGf5WUlAYBwDMYVFJGpwnkqkpDJ/bZ6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQ3aqDwyul2v546uar3Pl4xSWFUP9Kr0/qCjJ57w8dZ3r8Kt48rnmjOWMZ49iEvOYhYcfZ+k+aD9q9AYLQqmYItD/ZEns7eksqp7DFSiGFJ52TcTv89ItNg/9/cHm+xsJuFU6Mf66m6Qa3Fv9jIj12WjoBCO0SlcHfioZY8w54Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zbatMD3p; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zbatMD3p"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5534edc6493so7426904e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750252827; x=1750857627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTJodfwDi8QPGf5WUlAYBwDMYVFJGpwnkqkpDJ/bZ6s=;
        b=zbatMD3pr29TlJKA3nraDWfRJpQ8Z7Ny39U4JWTjtJGPY1sP5RgC7Zvs+2rQatiKm3
         IoL/Wq4ymBIEOyAPJc877iNO93bP5m9R7l6G+XznYx1ikrocQAKeqlLWbRC8jKh9For1
         /229qQ8oaJWtqLWTiiLgYUrq7qMjf+yUBY5I2dWBeV+HQt4O6flaaFbrrsQSTebzJljY
         asmsPFcgjJNDcKK0oN1HRkJWiudgqxVhQnIU7GF8RO7Aew0/4yR8ZRRAQLW4Hk+hbz9+
         X6523v1ub+wGAwMiu3+eb3eqsIyOD32CwR+ntnRdriFdR5SCAlFxG7N1DpqpzQVGOf9I
         rS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750252827; x=1750857627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pTJodfwDi8QPGf5WUlAYBwDMYVFJGpwnkqkpDJ/bZ6s=;
        b=wzl7HnLV2cZciziCzSp2YydejVm0l/4yNxr4CpLR83j4Q9Joc1CIH9+U6pBHGs8zKb
         /8zdJElXAMMMacpWsP1SRr3l+oWlTPIvfYrZh4Bgl6eSASOYEXPOiidEVZmV3bGEYZOZ
         KfpwtZhForlgwAQEqs/JFf5ZGRH1FU7aIZYcKiXWel/6wHkQ3lK71yxlWDxVCSCIjOxa
         BmcicxxMky7IRi26N71FeOrUSQRg08Q64emMCB0ca14EX3BsYqZuWFCdekhld0iu+duF
         xo+9QIiFTElayyL5tR5rz9WevKESL7s/BD6pDI3Wnp+qaiUARf8R186csAIHgivlLp7V
         Kwog==
X-Forwarded-Encrypted: i=1; AJvYcCVb/8c2kfWwFkHWxUKIqJ8m8ZYGFBjyhC4kAyioJ6QPE7zudKMHSz7DqaGQY+xVPBNWWKtFaQXyzDc7r3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVwvTpKsqoeI/jOxOi2VfmPwEuxV9gO3H2zplq3/+6fm87SgSt
	Wt118e2Ad30c96Y5V3RupLOAk1gTrpMQJSHwI0Ov4+RAyDKouoxWDT1so/xYEfjaczSWguVp6V+
	/1v9r7Zpex0cq8nz9A6j7GRCXgJhPYZJl6lOLqGkE85PylTx9bSefoaI=
X-Gm-Gg: ASbGncvbGXznna2WWXBzVp8XjnLG7mpBK5bDutD5uKrrRagozJrg/XqzzX5MKlWBDAU
	RHUHpMbJbaymdIqsUx/5eTNjghG2zs8QKHugjeKXMbJniooNaSJINsU9zQ9vZFBzfRZ9IUThmTc
	zuFM5FIqryBIJOgmsMvhYVvA1hLYruHAB5ehpU+Nb5vKtGsyGpWsDGcdc6hgAPdplo7TJWDS+A1
	A==
X-Google-Smtp-Source: AGHT+IEnYD8c9DRu+sgeZ4/zra50A8zvr1u0tIjWrrYY7aXbyZM2E14drwd7rS61sdCTAqyts6sNZw5w8k+gQFEYycQ=
X-Received: by 2002:a05:6512:b2a:b0:553:5e35:b250 with SMTP id
 2adb3069b0e04-553b6f2106cmr5254173e87.32.1750252827241; Wed, 18 Jun 2025
 06:20:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618124319.19220-1-kabel@kernel.org>
In-Reply-To: <20250618124319.19220-1-kabel@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:20:15 +0200
X-Gm-Features: AX0GCFvPKxznhkvAPEwnvWIVZ6FbwqZ_QWUKHDjPShs0JKLfijHXyi7OUR-B7c8
Message-ID: <CAMRc=MfdPc0T_6G7uRUW7BAjFaBQYFFs=u2NGKj29eJGSjRVCw@mail.gmail.com>
Subject: Re: [PATCH] platform: cznic: turris-omnia-mcu: Use new GPIO line
 value setter callbacks
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 2:43=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> ---

What's going on with this patch? I sent it a few days ago, now you
just resent it without changes. Who should pick it up?

Bart
