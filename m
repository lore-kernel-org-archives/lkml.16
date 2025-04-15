Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE7F2561C7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 21:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744753736; cv=none; b=FSVFTg7N3QOUXQurzx+UH0nFqrNx9QjnsSKOowKfnO3vCAwG2FMdE1rwhdRMwo9IVbtk8zGgGTix4kFfU8GxHl6DjMQg+85Pg7MPQA0mnofMGEN66oXlrauYQkODD86ZTTCV6mPVDnWkNo9Sk8T3NTy4RCwcfVTZaWTvKTJUHpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744753736; c=relaxed/simple;
	bh=w/GU520f/3jBAe24+ir+D2COnHV2dCfaPkORIPMWF9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kJwjAIEfrbPKHxpcO8lW7/wqT/ehFjnj6dfhk3hW+2kbBoOkhptE6iTngW3B2Xfngfau1THBOHBTOLh4gkFCRuLNqOCUst2RRH9e0RwtP15sE54Hpw759STZmnOUycGG5F6USuCsVBWj2OX1/P914SLIaNjb7poIY3L6xo7mgTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZgY2IwG; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZgY2IwG"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54d42884842so1510921e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744753732; x=1745358532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/GU520f/3jBAe24+ir+D2COnHV2dCfaPkORIPMWF9U=;
        b=yZgY2IwGwDD6Xd1zIz8g/u09tiEAOCez4tZ5CdZUFsZJjjDLSgO5Gxo8lpp7B7EjST
         sq+4GG9ENMkoVBfyvICDzcFB6u+d0kZX6icRosvU9fu+0QKsOhoPRf5zzr/ikZnSohk9
         7b0AOHl6uX8I7uk917QviuwUTS0SrROnsqgE0vWzXDUM/zxCq+TXy9mcd/o6Ah58E2ep
         NcbRs4OoOtbeI1TVl9B2EIy+YxU2nUps9M5XMYRXBzTO+kUi7zGfRBej6koYTaynmGKk
         iKIqonx1bF5L55gUPvLfXkLnHK9igRQL57+aGP1jrzNeKMoIYkjDmM1C+qASqqWYqMkx
         q4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744753732; x=1745358532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/GU520f/3jBAe24+ir+D2COnHV2dCfaPkORIPMWF9U=;
        b=RkGEYLTQSBK/JTNlxZAhfURnSyl8nSW/LiFnNghNFIZm4k57Sfbukg+g/Y50yW6flF
         Rm7Z3c2GuEHtlCanykSFrOH6y/AUpIGb/H+SsuSYfjsABrpnvF5KeYHPnXXAfS+rkAue
         cvsrmKZxlF9oagMDNS3WamcnEUoghRoN4MwsziyQs5OTuXqSaD64/H00BHgQ74AAESRQ
         2qGwi92ghVWgur3vVcdp/iqX5AbbQZHJh0is2Gn9uRQsfm9/d660TsWlz8uNbb3RQaN4
         0eDHWpd1iiHQzyWRmUbe/fRPzCDoHgPh7Pb993MGb48ii6JWCuPgWLVK/agk+RU60+I3
         FNwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiYOa56d2kB7JL3BkqsDoNHBOz/pAr8aqmYEbF9LNK38AKnccGNLf/Eh6euHr8Xcahq/Up11+1o6zYOwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFo/6WKyGoyoSgUsO9i6AC15u7zhebzRt//j6Z3eU/or/xmx86
	MeFjComwupWfmFoSQlxC+EZRtbCMt3jfkzf0W+A6G4LUoGiXhcaZv+xlFVGuBFQ9xCOX0qe6CmD
	hLAa8SmoJEqt7QF0dhTWCxueufX17ykdjRBT+Ug==
X-Gm-Gg: ASbGncs7A4J+XavzuMxRun+bXJcohj5d+3YlaWgnzoBbsi8hd4xk4q67Lm9DE/QuegL
	LfV0l/WmLmz/Z6TAosCvvy8AgUEkbnhOGzdW6EEqpwHaR5QfTt23a52wReYFxcggQ6extKE5gCg
	ErgunD6Gok+Hpenynkq2fPzA==
X-Google-Smtp-Source: AGHT+IFSu+OKLB2VNur9Dle83J6HMvG4kflsWZSu9S8S6IR4G67eFIhSB0oS7wnO/q/UzPPA34KfjLwXTtDj9Vzih0s=
X-Received: by 2002:a05:6512:1328:b0:54b:f04:59e8 with SMTP id
 2adb3069b0e04-54d60517c07mr145437e87.23.1744753732331; Tue, 15 Apr 2025
 14:48:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 23:48:40 +0200
X-Gm-Features: ATxdqUHvlNdtzl3Q_1xgpiYLVxVG4W9MxWXBnWdrebvCbvJB7NiLnFtisrLsjeo
Message-ID: <CACRpkdZGmHqS=Ln=YF26aCLcuJOB-Zx3AUA8sSyf+Z_LJiC2Uw@mail.gmail.com>
Subject: Re: [PATCH 00/10] pinctrl: convert GPIO chips to using new value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Patrick Rudolph <patrick.rudolph@9elements.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 9:17=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> the first part of pinctrl GPIO controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

All patches applied for next!

Yours,
Linus Walleij
