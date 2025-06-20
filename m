Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814C117A2FC
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 20:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750451232; cv=none; b=a6I/mh+xfCrtVwgdUsN/fx/+4C7C62m3FxxYCMT7y/WiggLey/9BkcACqHvuZt9l+MsihDEtsYULfhcSeT28rrNXglGlJlrBP+0bk0MxzHRr1zd3jqyKCJG8eOrJyo6Bo0pypQSKO1OTfIdf1MKq6SgbeUQXlgswKxYZEyArK9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750451232; c=relaxed/simple;
	bh=f8QBo7I1WRpVvZxfxRgbRTRR3HZAE4SdeL8FRmGw55g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kO8OweYO8Zv3qiG7LUFSfh2RFAvFMhS1Qwkr31pQIm2My5Pd7N2Mes4raKDrwUBW2pmrfNpsV5xbQlzz5nJj6Rqo3Qe3wcJcLHtuAq8y6SqDKYQ1CoUzIGMHKzaXs0+4HdVBwy5cOTqrnPOApb5SdC0KJeFRuOjMeTzhpT1E9Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vcojWlaA; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vcojWlaA"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55351af2fc6so2460309e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 13:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750451228; x=1751056028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8QBo7I1WRpVvZxfxRgbRTRR3HZAE4SdeL8FRmGw55g=;
        b=vcojWlaA0Hxtgt65As6JE0mMBfZewN0wIhW/x9t5Ix2goh1NnCrixwLg2UpeFnMGFD
         Ll9PULLCdkQc5DRo9+QUIVGU/H23btCYFnnltXYJuKCY869gy2eQIecNACvaxMF0DfgN
         Q9lGcXKYATCDc3DSwuRb3NrsSExN1LL+ylBVCa9avzG212lFTXwRHLmJOZv8p3qPQoJd
         uiEYJrb3GKepc5g4Jh9HTWkWH2/8x/uI2dYYPwUu0WNvOVfOqk0OjXmLDRcYUw9jM5u2
         O5NRS6kaBB3tK5mDhTEZEm92iLHoAFUfPGdJYjSPvlLdnfOLD4dIvNnsXOf17T0hkXtV
         n/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750451228; x=1751056028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8QBo7I1WRpVvZxfxRgbRTRR3HZAE4SdeL8FRmGw55g=;
        b=U2SO6nuGdmbRr//+VrmE0WN4dzdX0w1chxNqAi7CAphoZFopTABlxkM8+1/6EK90qG
         2IMOEDUyuVYDheI28/b1X4/kNFa6j7bmyQHZ7HPNgwDc+2k4NUmZi28yFyZG7TlK1p4o
         tg1KtvlfCUSE//PHBnq1pN4Vb054lV5Dr7THuK8K2rhIx9PYkgjIlUUgLcpcj7D3i3PY
         YJugT2pYaCGs4iO0GhBykVGwDmKms3GNaD837HN/f08Tak2EWWZmLqaSRmzLFP0jL0o8
         QB9ELEpP1SC2THE9ZBU4E6uG2j0oHquhJP66IgTldd7jlZ/Llfi7tBSupDA7TAZ1y+zE
         pqXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT6TrO/AXB9alG84n9d0d98IP7BJAYgducNqoz5aAkouOmhYj88o6elztQXLA6J4t3x8In34G4bHUNlL0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2UexwtbmT30Jomb6R5jX0Io2pK3LDjq9t5OmLmuQaxBY9CpjL
	sBQHQtmwezwaWJZvNkP+uHUpgNSMfcFJwEaokUdRfoCVcZwdUL4JwpGpnJGf0gXUHzjWRXxc1LA
	JQWMIxQO56iK46LDecI5LRYn58wm9hipLjrEF7SIQhg==
X-Gm-Gg: ASbGncuBTnLbSH7cSsMeKogIByki/mHxuLW3dl66ZsEfl8EGCxVbN556iGK57Qtysk5
	tKRP2hXMb7QDswyRtCqg4jNGY9Gce1r/YcpUhCgk7EzIZdv24p+4D1FEsh97DXTKWsY+rTlJh2R
	NdV5mzbMItEivAQabEoQsjYOr6ATNPz2ilqBcstCLKfHM=
X-Google-Smtp-Source: AGHT+IHz94hRrEwwkjw4WiRDoSc3MUv6m88S6TTbUeVjSJxJ3VdOJuKjRU4AfBWHOWifxWnhx4vVHj0Yz8hcJ0Bj1Ng=
X-Received: by 2002:ac2:4c48:0:b0:552:2257:93dd with SMTP id
 2adb3069b0e04-553e3bcc3b6mr1248695e87.25.1750451227394; Fri, 20 Jun 2025
 13:27:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620111257.3365489-1-arnd@kernel.org>
In-Reply-To: <20250620111257.3365489-1-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Jun 2025 22:26:55 +0200
X-Gm-Features: AX0GCFsffUVLgSu0U2KPzmpnvQsAmO2VLzwwQc1qhRBEB7gSUJwT8WC6J3gNd4w
Message-ID: <CACRpkdZgggMYqm1OBOUZtWQo2jArFcK8QqCf5Z1rviqk=r83mg@mail.gmail.com>
Subject: Re: [PATCH] ARM: export __memset/__memcpy/__memmove
To: Arnd Bergmann <arnd@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Abbott Liu <liuwenliang@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 1:13=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> When KASAN is locally disabled for one file, the string functions
> get redirected to internal helpers, but those are not actually exported,
> so this only works in built-in code but fails for loadable modules:
>
> ERROR: modpost: "__memset" [crypto/ecc.ko] undefined!
> ERROR: modpost: "__memcpy" [crypto/ecc.ko] undefined!
>
> Add the missig exports.

missing

>
> Fixes: d6d51a96c7d6 ("ARM: 9014/2: Replace string mem* functions for KASa=
n")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
