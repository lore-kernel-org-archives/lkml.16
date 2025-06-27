Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715962D3EDA
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751026560; cv=none; b=c7Bugwh+QeajYB5M3prvDBUvBKUyhrqzJQQQCAVJ/YoKkbAquLS2PCeX1QRlp0zMwymtjyMUkTDMewTteuBUMGXMP+2nyarbaWLFti2Eny0w3IR+bcuamBBThqd0y8nXSxU9nOgu6pFAaRH04xrUYrmtUZqxmA+rJ5vrraCjW0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751026560; c=relaxed/simple;
	bh=5bnO/bwKwvz0W9dml3PFN0tff+1CpXP9/A1In0KM8MU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IRpGFyuyjbSyccoZ7DJNp2BZwlgzi8tprCwmKGS0I2+1IFBe0/RLswu3A7BXmPpCIIWLHdOLqi5uNztlHiwUErDcf0suAr1sqxBYmXSGPcJgbBLbmjmJ6AP/BJo3dZTjqhzeMWvN4uKpy7Cj/5j3ul+5Rat0r8Rb/70vT10v9zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fh1mssCM; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fh1mssCM"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so2085531f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751026557; x=1751631357; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5bnO/bwKwvz0W9dml3PFN0tff+1CpXP9/A1In0KM8MU=;
        b=fh1mssCMbwMs6+0c8SaQ1DL4WEUjPfHl44PEovi3ImZqcHUlWw/2iokUKIo5jtlw5n
         irNdOSQdtQp4h9+9NULTdwwfErSr5Ew+IAkMflLxbqsWHhrVg++4gARJR0OSwOWtQe9S
         xvdYt5unnfTZ7Go4UItxHEPC7cDqTJ6asy0kBxerZtXhjbDN835E063MTNT5KYxh5MkS
         euYZqoxK1WoMfNSnASUClEnoG6cx+RutnGcu+BaPEtw4N0kT5LSvct2rdddKBimxEyIX
         Z5xAkH5q6zMgatVEAaX8Xx3pmtaWtujrUsLR4zjaEHt8KEPlSPp82t58dRUKlWoL2BYp
         I0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751026557; x=1751631357;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5bnO/bwKwvz0W9dml3PFN0tff+1CpXP9/A1In0KM8MU=;
        b=dxiM094W/EaOVp+kdi1xmWzvF2EwW9ICIgUd7MHVtV2ggwSn6UcLPoYLhb+CRy9Bxm
         HYF5VJ4vC2rHyfWTWFyKANwfuUU+iTmyX8poHoIsAtVFlmCTj3zhPJgBEKiuiHL6aY8I
         E0M+fwVeUjvh+/e9KzQfL53s65X4Z/E6BWqTg43shVRtaX0zwo3DUndGddFg6jVSemqQ
         ewHGnNIQGHsIq81ta1MSyQX9Ok9qTxzqnOUb24GSJnUkNA/mQCRvh5ohwcUPJ6Ebcy1a
         bcF1YPbQGwesSWYV9vFUoWChUn7APLO2QpBf0vCRJn7cL9FJaEFaO14GFVLYuB2lkJPy
         LU1w==
X-Forwarded-Encrypted: i=1; AJvYcCWCCqA4COE0+7lkuIx/g3LTLINvUW7V9YtBZALtRmEllVziz8Wie/gqbzM0UyhjBwSmfKs3HoJSYlk9wrw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yydx1ealunNH+ILR8Xw2eLpqfoUQ/Fwyofbda6KKEP9cf64+6zV
	3W8bi9l+iIMbhzh7jdzYysWMk5D3q9P1cdu3N1gofU0xKx95T7L83kNhgJ4QaNDMhBI=
X-Gm-Gg: ASbGncubrHVUymZ5KMdU6ZM/nbVWD4aI5EsVBny2IsyETWNC82t7ZL8iOebr7thzTGb
	g/W8sOo9/niZTiXFJQMuzFBxWOXwkMHLzLg6WSnJrmq4g1un1Xpkw6FIIbAeauqWa0esmwC1M5S
	JRe1HtKMD6W3XeNgtwlbMve8s3DpS+E15uwEZ2WxuCM5ojbi4cHiXOeV6b9T8b8oyUyO+MRl5v0
	AwkQtwRXlbLN4mfbgylYylAQ3RasZC6M9CJDhWBrxNg/RKU3DHGxBw4hExMNw4rvTbyB4C6MFCx
	3k4lSXOYsSNodYFRsDXJ8+HqqGKF8qkAFSYCFRWV+DWr+5IT9ozgKR5lNhsGqC5Aw9Q=
X-Google-Smtp-Source: AGHT+IEQFM3pQCiRU5lNSKxbqFCgvUVf7e/LcmOK+L4hhlaL9cMKkmMb9g/3CGCF3L4wxugIwNImYA==
X-Received: by 2002:a05:6000:40d9:b0:3a4:cec5:b59c with SMTP id ffacd0b85a97d-3a6f3162238mr7238080f8f.25.1751026556678;
        Fri, 27 Jun 2025 05:15:56 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a4076ebsm48177435e9.31.2025.06.27.05.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 05:15:56 -0700 (PDT)
Message-ID: <ba42a719df8dfb74406336e8adb80b5286bd6fbc.camel@linaro.org>
Subject: Re: [PATCH v4 02/32] dt-bindings: clock: samsung,s2mps11: add
 s2mpg10
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Fri, 27 Jun 2025 13:15:54 +0100
In-Reply-To: <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
	 <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-04-09 at 21:37 +0100, Andr=C3=A9 Draszik wrote:
> The Samsung S2MPG10 clock controller is similar to the existing clock
> controllers supported by this binding. Register offsets / layout are
> slightly different, so it needs its own compatible.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Friendly ping.

Cheers,
Andre'
