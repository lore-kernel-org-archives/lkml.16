Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4A8211A23
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 07:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743148208; cv=none; b=QK72cofBmtZVacBwd2L3fch3CgXXttyxs5KiuZ7L92Pgh45KmURZsf/PGNiy2+vdJEN1S6dczYk3VzX3kfiblGjMjfXxsJ5AC3cOE6llQ98AbpZkUbF4wXpX2ht71CYEuAg73zyH7qWt8MiNIpLaRUmpQzRJrnSFF5vXmoRxRKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743148208; c=relaxed/simple;
	bh=ZXbXxoTpkZ9XQjuSpddhUTrOU+MP7VY35ts0qEXgmq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HsunkxiCRw2Hh4nm8zs1CMba1CK7TxlVk2q6xmLPtVnBqm8LWxihq7FBu1bBhjj3lVQKyyscntJg/E7RZ11s5fDza4dFFuRuo5AMoCxCLr8MkUySiZ57y6LNX6ThiKK6OSNK8csLlMPoRd+gwsEXRlSIJuzTZJoqTQrgYr9hOYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PtmUakYA; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PtmUakYA"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso17843211fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 00:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743148205; x=1743753005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXbXxoTpkZ9XQjuSpddhUTrOU+MP7VY35ts0qEXgmq4=;
        b=PtmUakYArS0KPCpfzf5YC9gcaIxQYberTRweQwhCZ1dEBu/d1NI+bH7lhnL8p9jPpK
         ezz53NtMAJ0HYiNLvecJ/Y8oBbNaK1bCWXChmhQhTwRi4jhAXEcFqdYKUJe3gUT+Xo4D
         eUn3QAMpzDLtwIVL71w6U420GfGzZjFLLo0/fLKxbskf+M1EJUvmpazXKJe8KORea8dy
         FYQVkVIDlgIU6KZx4l5dr3O7iS96VQFcWcqreri5OPleuRYwZxHO5smA2B4t9ROHAkRy
         gQTxWQS53/vuQ9eKoXJfYjtfimxei6v8KpPJywUHVhm49TKxZu+eNll12WB5vhyM94Cs
         rjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743148205; x=1743753005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXbXxoTpkZ9XQjuSpddhUTrOU+MP7VY35ts0qEXgmq4=;
        b=kerXmIxATSuZPB4cH+4sl0KpEfKHN1TarMVe+s0v3Y1G1HOcF7MaQIV7GthSDDNRfM
         OVuS17gLRxjZl2IlD34ZSx2X0sdcPjU/7dta19JwfkFBRw3bhU1jJt9AD8qxzgCEoUhj
         MwJ/NttcTcQI3aEIAj1++Y3EKdn+1fscHVEbSV4DwsfoCZ2HL+f/7yfeK/WfI+MmZ5Kp
         JvA9jpqYDFVq+SZ5yfaUl0EU6zqri6DhLeFFpgljH61gIbUFOkjdhJZtf/naOklkovIe
         jt7Rf0XWzYYIotWmqdMmxSZU6GX2532lgTkUejQXcWQfTpD5vMwLMFoK6Tm30XprpOcn
         7wkw==
X-Forwarded-Encrypted: i=1; AJvYcCVHsvFmHiRqJ/H240pt8CCoeVbEngPybWvxDR8fDPIO4QclRr+MGBK1zAXBltJ1LncwKOQaj3khAJGd9R8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjMjd0iYKZWpDQtaBvrOFB50S484wt6p+GWA9NhuwGzP4TJPt6
	fykImxtJG/UFAkczHLsL2TcIOgx9hFnxhCx0IOhrQziwVKUyAzus8EB6bKYU8eg2ALMigPz6zvE
	DSkNKWMRiXInBVvf4w4aURCI7raciZXuAv3T11g==
X-Gm-Gg: ASbGncvAehXwL1EB7epKfQjtzT81NJ0ooSoWhjTXMJ1z1ENj9k6mgwqInN6iKoics4D
	KfEXbOI84iz+hp3Vl0WHdFSRlJpo0vY/Wy1XukBaIAVi0eEuh2Y4IL257fjIBDF8kNLl31eURMn
	pjMua4M64w6iNGGvZsUq44ouc=
X-Google-Smtp-Source: AGHT+IHnFW4Gf7w0WUxCzWgZrqEcIzapkxQXNY8Xq6/ejIm3eX3Z4HHEGCQZkHosMPCG+e1OmbhNxMtF+vYCyFmrwM8=
X-Received: by 2002:a2e:9e4f:0:b0:30c:433a:2886 with SMTP id
 38308e7fff4ca-30dd3fd73c4mr5854391fa.8.1743148204932; Fri, 28 Mar 2025
 00:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327004945.563765-1-peng.fan@oss.nxp.com> <20250327004945.563765-2-peng.fan@oss.nxp.com>
In-Reply-To: <20250327004945.563765-2-peng.fan@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Mar 2025 08:49:53 +0100
X-Gm-Features: AQ5f1JpLnpUy1enl9HLnS4Wp1zTe11w0UEroaaZ478cBUi3nUM67Bkq1pYEN9vw
Message-ID: <CACRpkdaR_muqL9W=-=vHeuA10R7yPqe4+ib3qb6daqZh1PUU9A@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] regulator: s5m8767: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: brgl@bgdev.pl, krzk@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, 
	andriy.shevchenko@intel.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 1:51=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Update the driver to fetch buck_gpio and buck_ds as GPIO descriptors.
> Then drop the usage of 'of_gpio.h' which should be deprecated.
> Based on commit 84618d5e31cf ("regulator: max8997:
> Convert to GPIO descriptors") as a reference to make the changes.
>
> With the quirk fix for s5m8767 in of_gpio_try_fixup_polarity,
> the polarity will be active-high, even if exynos5250 spring DTS
> wrongly use active-low polarity. So using GPIO descriptors,
> it should work as before.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
