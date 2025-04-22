Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383181F09B3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322143; cv=none; b=dJoRVD/ERKnJ5dHFVxZ9GwjNfqv3H9wP0BVmHqwVb9H8Xx5PSHM1xy81iy0RO6q/0FA8jol32W+/jS3sXaP16rHge56ayW1T2uZ4AgYcobBZv7PTIcj5aCQHXXr2BX6kT3jHXwFSTRZkjDhFBVOBU1yh3COsBg+gC1nVEm8aY1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322143; c=relaxed/simple;
	bh=JKE184lpOsbPrO/7aA0AY/dhX9Uo/v/klX5HLzOqM+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PM9yqxgTzmJB9P+J2/VVjzs38RAMhMSCUBe831tmB6tyrARfq/0gKBc5phr05Wy5B8f1SMDsy19z7P3TTZ6lax0z4GPnmagbIAR6DMJ/8YXZXS5+QCKEHWpNKZiCqgGPsjqoxJPKQJilO7JVxIATcaHtvy+oSZObC+wg5zbqFh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c2xrWOo/; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c2xrWOo/"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso47840091fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745322139; x=1745926939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKE184lpOsbPrO/7aA0AY/dhX9Uo/v/klX5HLzOqM+8=;
        b=c2xrWOo/pSPNDno9WPia3pw+yri4OVuu4Mmt2UISEaC+qgUKjrtmEtNPMiV3C388T3
         vsMJ+46u+BQcnc+x/jxw73izecEyuqFdzYpijEaJJ2BZWR0n3/dVL3hRntJj8BM55n6w
         frdfXVr9TnkoaCtmx8YZaqn97Rdak+bHbUzE6bOqSvIRe2gl/PeGAQjlmn82X8ANpH3W
         ZB5JS+ZMvS8B0bJT9Q1nLc2ZcztoCmx2D3tGICINN6id4LbUkL3LmVFVvKVfUZNaSh+d
         HGvHBkthtsW7GYqlO7LdAAgX7E3nfAL1IncfYjLy1j/2taiCMJAEh28vdOKN42ncWUkF
         sxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745322139; x=1745926939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKE184lpOsbPrO/7aA0AY/dhX9Uo/v/klX5HLzOqM+8=;
        b=eg0NSS+/G3oiPKGgLmZeBuP6ILIeehgvRnZFw8axckcxIdzRfof+RGFvoUoY5X7viZ
         Qj9XDHjd9e9f/4F7Op869goS2mPEZxZ/i03SWm6sIbPIPN16UMEegZjK4Ui6eEm08zzZ
         ltCLzP0CLA3sorxOFiRlIjwdikqBn6DedrqxZdAGSUthpdPbQSNWZWfsa138H54dR6CT
         fZBndZaMSHnFLQ5dzOWAwdUCznRO8nBna/DNbm2gdXuEHI+/mCT1U6T75fe5sXWCYITs
         7VM7X89HuQIAwNVXyZ5wAsrluMQXbYtWsvXq5iB3aoR1VH70Lc0AQM1WqdeLN6jIwDBe
         h4Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXXVHmchV7rSs3pENl4LanWp9CEZ/LK3/ymMKEfYoUSQTQQfD1BmDCBL1ba5ozb0pjTi5pvT+I4W09awqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYQ7BpHgKClKapWspZwe2AMgsE89oI1SpoQNPeduZOrc9IFp+y
	lgTcDInL6ACPbX4PRTav7SEsKBBvY2J9j2pAfOw5BGcWgiew8dtyBtZTQkqDl8beX5yLCZ6OPQf
	mwcq1HXy70tzTDnnEQ1alAMegTWj2ZiRkngRNjA==
X-Gm-Gg: ASbGncsLJ/xVysF71wSgLSG3GHCCS7bSLmidFGnY9EKRzKufoWRlkxfJ3higO8Q7Lnb
	MmMuxl5kTF7x8LY4aqvC8oVjUV9BH09GJ94AnoFoILe98fVF++2fcm3t/t42WA6a9Pyr1yEgW7U
	JII3okK5YWqRqhVSyt5ix9Uw==
X-Google-Smtp-Source: AGHT+IFm0QuF+MKzFVuJfeElIzDwo5DNp4RQe/j6WQIWdZRVRgiFC+4alaFtOW4po2uWD3T3nU+AwhkSj7DYWaP/Qtw=
X-Received: by 2002:a2e:bc88:0:b0:30b:9813:b010 with SMTP id
 38308e7fff4ca-31090554278mr45541741fa.31.1745322139074; Tue, 22 Apr 2025
 04:42:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422095718.17360-1-kabel@kernel.org>
In-Reply-To: <20250422095718.17360-1-kabel@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 22 Apr 2025 13:42:07 +0200
X-Gm-Features: ATxdqUFgffJrkHBIiGCKHha-7JyV-dOWeH_lR9YCYT2CA8Voz9ZgL4-ux_Xly6Y
Message-ID: <CACRpkdZ5EBiyEwEY68_bufnO-qFFH-XKzv5RmRn6=K+rN_NFBQ@mail.gmail.com>
Subject: Re: [PATCH] crypto: atmel-sha204a - Set hwrng quality to lowest possible
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 11:57=E2=80=AFAM Marek Beh=C3=BAn <kabel@kernel.org=
> wrote:

> According to the review by Bill Cox [1], the Atmel SHA204A random number
> generator produces random numbers with very low entropy.
>
> Set the lowest possible entropy for this chip just to be safe.
>
> [1] https://www.metzdowd.com/pipermail/cryptography/2014-December/023858.=
html
>
> Fixes: da001fb651b00e1d ("crypto: atmel-i2c - add support for SHA204A ran=
dom number generator")
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>

Ugh
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I would even tag:
Cc: stable@vger.kernel.org

on this, but it's up to Herbert.

Yours,
Linus Walleij
