Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A1E288CB1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705884; cv=none; b=eh82sBlUTE69sb5kHYr9amjMN+cIxwteZzlwloeVTPF3F8/z25C9MTEv0G2BRL5emVFWNV44U5BAEJbNdo0pHjyoqhP6qAyGYG5wMJy1QTnrW+KG48TztnirbY5INeYLbOj2AILxctaLRpfRskxSLYc8F3eFVTNQT09Wn6pUgTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705884; c=relaxed/simple;
	bh=AGTQ61IkoM056vi86kWymU/PNLuo6lfyrF+/X5Qi5ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=USWOzLqdVqnqqW+tEUSV0u/P33FtPIUV695fGOVDw3FUxDDYd6z7JYkms9HCe9xMHUS8c8v1c5ZcaAtKTSxpl8ctYi5RGndp/ZCpZyky/KRZEWO6nZ8zAffH7szZLX8qwMrXXT4phQvYN6TXKMHLpXjsCHkEUie/4E79bYo7OCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w4HB4EZL; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w4HB4EZL"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso6594352e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705881; x=1745310681; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGTQ61IkoM056vi86kWymU/PNLuo6lfyrF+/X5Qi5ps=;
        b=w4HB4EZLK9bYTT/phsvkrqF14jJR1Ing0Abx1PGo4AIfXIzUn/i2/TSb6nXIi5tv56
         ZCRkJLLZVQAh4WVRePVPo03DKxBWMDenyzhGT1Ah6yuy3aukMSs8TT2wa1F4VMFZNgys
         UHLzPzbNPqxX8sRmtfI09uRjqBwOi6kNIQZWKPOQU7J2RjR59B0JdfAso2ERx+Sv4G3d
         B+hCk44TqIj26d65rhpHsAcRxqz+Ha97XdpokhgHE0Q34ShcN3O79CYGTVaKfWh2lNsp
         NipN2X6z++liSXiYZMtGB6PtMTsUGqUid1hdQKi0pHX9UYv7oP1Su/J4S7eAIV983MMs
         +c6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705881; x=1745310681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGTQ61IkoM056vi86kWymU/PNLuo6lfyrF+/X5Qi5ps=;
        b=PjwCTKXYPiz3Dy9L97tR0FE6NBtzxdFcoNQx2YBiK79uT7ZI/9gP99lGhwoi6Wkfok
         C4PHtbcJiz5RJPOr0E+eez+9TYolowEt2eZGHE1YhdQI7hdJ6vupCB32aqvuybb6gxI5
         +v+jrfepiBTA9Fpi83oX7Ocsr3PuwBLsfBb3eBSO1x/FntQU5TqIC5JufnZuOiAyG+Yw
         rXc2rG1FIK5denRLqwXwnISeaYUNp5guFdznOsoV4QwEBRrC2fhPqs7l/aqOyvthUzDL
         0w77JLfwo7EFzIHABjB7BFmCSwQWvCSjdVbPokci5JyOrOTyqI4Bx56ji45ezUYGGaiz
         eaJw==
X-Forwarded-Encrypted: i=1; AJvYcCWR/Mqlku6nY5vgvTZyTvQROu6uY0HAoUf0EPXDnX999OGrxp+lMCtZfWnnsDE00qJ6moBMGXCMxaetcLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCtXO07Cewzj1linQLNtacV+x9wTtd5tfHeKmQMfPyiLlVI10J
	zSIb6uBqxbgZKCuoLlJDDPSNr96c06kRiCbOflYVuJgE37Xf3Ao9tOAdnAWABE6eED+YLE0ekmn
	urSNztnztElTyh7gglP/uuaEizAOa6n3FkL6Tw5Xr6U5U0ABvYt8=
X-Gm-Gg: ASbGncv6LyPdKqAF5/KrOMTP29eX+jbMy9EqHIwurHxkcSF02jAzA4xRaN2qdZo8LnR
	Y09h7/fR0Cd+pMe6yfs3htjytjEa48gtGmPL2S4nk7PRQsohIsEi9JrhB2BCT7V2E1J3p0Wf0rZ
	VVGaCnSUstECNFuBgaQqajTQ==
X-Google-Smtp-Source: AGHT+IHD1bKQe2Mn+6xEULr//Xzasxy/d9khfqWn+UjN2VWJgAl9VuhBCbnmnHHLrAApVzeC5eCCITcOA2lzCH4tom8=
X-Received: by 2002:a05:6512:2305:b0:549:8f06:8239 with SMTP id
 2adb3069b0e04-54d452e160emr5021750e87.51.1744705880800; Tue, 15 Apr 2025
 01:31:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-hwmon-v1-0-1fa38f34dc07@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-hwmon-v1-0-1fa38f34dc07@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:31:09 +0200
X-Gm-Features: ATxdqUFSm_t0Z-MhiOZk0J9emOXPp3yGfQ0b0Vs1DgJrJxq1RyyCd_nIwV8m5GE
Message-ID: <CACRpkdYdoZ7q6x89emeo3wtJpDOvA3N6Re3PF_XyCJT4jF=GmQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] hwmon: convert GPIO chips to using new value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:16=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all the hwmon drivers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
