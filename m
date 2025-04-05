Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22481E5B81
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 13:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743861003; cv=none; b=HbXG1gGmkWRq55ErasM3Wsjp4hgrex6ZXdNMMuRVB4hBZ9bejBg9/QTZfhJx9beMCqvbKONxC/H/RVVXllY+JGytT52NVRm+4WIwWI9dnXw+Pbdkgb+4xJdQVwHhorkPc8hOyOU0MfsfIXnpo0dwzh9Jk0S5INiozUML/pahOB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743861003; c=relaxed/simple;
	bh=+aUz9xevIHtQ5HcguqoQTB6cntYV4+ru80uxVrIvvK0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oa6836g6FXdn3Kiy2BJafRtLqoM2E2EIDHC5LGnpujKPdkoT8xtmXmmG7v1TaKOAcFKhZEYq+cNaptJtwoSPpLXUizpAATWhR1PLzJepm7woq370BVEwqAjIguY9E/wOna/8zC5/JZ78B7Pt3kKPLaJV30V5F873swyxcLuZr70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TOTdj5Iu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TOTdj5Iu"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394a823036so26379595e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 06:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743860999; x=1744465799; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+aUz9xevIHtQ5HcguqoQTB6cntYV4+ru80uxVrIvvK0=;
        b=TOTdj5IuSNrPV2Vr7vPxTkVcu7vcFvoXtbQTTX6oVDF97u3cUaojL7CzU9Wtx5K603
         5ToOZnLPG+iLubjPooHjtMCDrmOn4aZD9SOkHzKlTfrgX3rumvYs21VfhSk3E94jlZ4x
         aXewctMBVKSyLEb2GF+VXVNcG0Li26u1X0AAW6S2fsSaPVlYvhMB9hqXDoyjEZayrmp3
         7iEMLIyH5l6aNnF7syChCInkgjfCOG0KpKsMuYE2zlOYyETtHqbm8tPodgcwa6uplHtV
         2raoAEdPas7uCMsuD5kJk1jyOnqTFFtDNU0Jjyu5faqTks/D6H6a2zANSUuYBRBpBImg
         szNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743860999; x=1744465799;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+aUz9xevIHtQ5HcguqoQTB6cntYV4+ru80uxVrIvvK0=;
        b=O/BGm5UiHKCg6GLfGWoQlhSs9L9q+W0kZK1vpHbQxbv/vaqHQxwW4mlEQTIhHSswKk
         6SgqFbjTy+fTMl0opbrLDqE9bNxhnb6FcmmXKyV3CsXQk+4CsS0Nds6gUO99AV/jFWRv
         XLXIwL4hRA6x4h4VsfUAqEzzwOJR7iY/4E/fMOCafYQ0as0YBmOA5uQt+9EA/Xo5y4DE
         j6oOBZ4nvsAorkuh/bA/r3g9bMQtxB0444aFOCmThfYjdtueQwf8o6qKzGBRqetXDHn0
         u6pqDEkR+n2Ukvp6DtCGST9geufS/36aycGzrQp+mst6MvJ0EAE9jjV3xdwXHutPozO/
         LnNg==
X-Forwarded-Encrypted: i=1; AJvYcCU9h/bO9v/vaYYANlSYoQKu7kHt5z6qKKL+sygfMlKSaG5JDLZofhNMMbxSraHJrJVaGBviv4xRzQjcIP0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5h2lOjj9dIUqyMXQejvKILHHiPj8DNB5hIFNGaUkf0pthAWuN
	avWScVUUzxMiqFx1M9KaU5W14S5yOvRL/JXDtN5klNNSOlaDn9LW2DqZjthpS2k=
X-Gm-Gg: ASbGnctt6vnIGMGQVsWGvdt6eeHwlJjpc9dejHdb2d3N7KO1JhYDL1XdKSTI6sxNi9I
	lUR/FmCMP1B/Yg7Qtn6b0wcLNIVMsESOecPhbLJTOEn8M3ejcvzKy2wzonmKBZdKGg2O5jV60OW
	zPjnD+C5xOX5jML0dO2OOhSxLhTVXxk+NeU1jsW1ihFmDfDieRGK7xXXeQtcpNOaSWBM8Tpevwb
	k4ngFAJlUXqXsAy24SsmasoIv32GOdFY12tmLMDuFzqBgz+4Y5Q3lzMqgvm7dMu5EjLo1BloWK+
	9kMeXnervs/TjMXhJMbvqFfhgXQfJKxlwnJPlZW05OIx7NUr
X-Google-Smtp-Source: AGHT+IGEMTPUEjKXv72J87fcLD9Q/jwVNzAqgI5y+bsn5JH5gR2xHN4lAAplyWAjbnnOZ73qIK0SCQ==
X-Received: by 2002:a05:600c:4754:b0:43c:eec7:eab7 with SMTP id 5b1f17b1804b1-43ee0640054mr27782485e9.11.1743860999041;
        Sat, 05 Apr 2025 06:49:59 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226f2bsm7018626f8f.96.2025.04.05.06.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 06:49:58 -0700 (PDT)
Message-ID: <3d688dbd2f88ce8db854f6972ce9105202ed4c06.camel@linaro.org>
Subject: Re: [PATCH v3 23/32] mfd: sec: add myself as module author
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi	 <cw00.choi@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Russell King	
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon	 <will@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Date: Sat, 05 Apr 2025 14:49:59 +0100
In-Reply-To: <20250404094229.GF43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
	 <20250403-s2mpg10-v3-23-b542b3505e68@linaro.org>
	 <20250404094229.GF43241@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-04-04 at 10:42 +0100, Lee Jones wrote:
> On Thu, 03 Apr 2025, Andr=C3=A9 Draszik wrote:
>=20
> > Add myself as module author, so people know whom to complain to about
> > after the recent updates :-)
>=20
> Full-stop.
>=20
> Smiley faces might be okay on the list, but not sure we want them in
> commit messages.

OK.

>=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0drivers/mfd/sec-common.c | 1 +
> > =C2=A0drivers/mfd/sec-i2c.c=C2=A0=C2=A0=C2=A0 | 1 +
> > =C2=A02 files changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
> > index 448300ab547c10d81f9f2b2798d54c8a03c714d8..05658f05cb857a784c7d01b=
1cf25de4870e1a95e 100644
> > --- a/drivers/mfd/sec-common.c
> > +++ b/drivers/mfd/sec-common.c
> > @@ -293,6 +293,7 @@ static int sec_pmic_resume(struct device *dev)
> > =C2=A0DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_p=
mic_resume);
> > =C2=A0EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
> > =C2=A0
> > +MODULE_AUTHOR("Andr=C3=A9 Draszik <andre.draszik@linaro.org>");
>=20
> Might be more polite to put yourself at the bottom.
>=20
> Not sure these are ordered alphabetically on purpose.

Yes, I wanted to keep the alphabetical order (by first name), no ill intent=
ion
here. Will do.

Cheers,
A.

>=20
> > =C2=A0MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
> > =C2=A0MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
> > =C2=A0MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");

