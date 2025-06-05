Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874FA229B28
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128581; cv=none; b=qPiQn96kvV6HJYyMVCjESGMh3+jGjq3pvV35YC5Nra9oGoVjcGW70pMZVB7Ew0tzC/uZ5QCAfz3cuXkz86OjRtWBP07qUyifRvDBNe6pdpsjk55Wa8n4kLUsOXBYvuYItTborVMzwP0CehsdeRU71cBypX5bD5m9d3Ue48PtvIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128581; c=relaxed/simple;
	bh=PVT5EJpM+m1cOTQkhZPkhfUXOCLKAPtm4dYD8NRnSuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a4k7OjiQNkTPe4uM4vGee1c2TOD85ROYGzqj5OYRE6NJ0MYiWOqvBgRFSsfevxtW4ZBXYwQGTN60ckrbwgs7ZpOwYnBFuXOzhAASU3FEN6mCC6b6aS5nOTGuU81klY3gY4E5UGY1KfNFlmsEM0kwEL+uBwDvF9suwt/4puq0aDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kt+WSbE9; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kt+WSbE9"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55342bca34eso1011340e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 06:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128577; x=1749733377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVT5EJpM+m1cOTQkhZPkhfUXOCLKAPtm4dYD8NRnSuE=;
        b=kt+WSbE9nVghB9lTKcZ2gMF5L4D6eZWSU983I2zvI7VoQ7V5Hhv63E2xEnI74JT+o7
         sp0Ej8cbYaHBZzztRNl58gVwuOkRUz0bT6dw6qZ9kK7mNOsA301Dim+8bgVber4bsLlh
         mEownm34HDEqEkntfRI2TD2j9EnpxhTp1lidRVs9FRbrIhHgAZtJ79nEUHTV4G40uLED
         SrtmhtGs6JErShVfGD3yl7+c3vjN4elcQ9ab3wQGOz1C5N/8UreIcYzTdujSwIDGWyAR
         lglBNHPmSXcgnBRo1j0BviJ7uHwbi0Fr+uOZNS+tP6pSQxrL7Y57nna0TVMEnEeJrxgG
         VWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128577; x=1749733377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVT5EJpM+m1cOTQkhZPkhfUXOCLKAPtm4dYD8NRnSuE=;
        b=vHVgLXSof8xLdHS0Tmk0NIwTfEXDU4zJXGK2UtpDWIHD0sooop5wYrUvBpIhxQ2BXP
         q2T/273VmE5vy4qtK2TeCWJYdD+8wPzj5iyH2zoxzYGGM5bI/B5kaT8Ryi4DKQqn7pL7
         DBKqtU2emkr8y6RT4cq6IekjrzcNEVIKp9RjolKygS4RsQt2dDCzWTPwMlA67wtzeakO
         bwqUyPSgrTWixvcdI76TuaZ2rHMl0SKzHIA8dHCZDXfKF04Qr98j7/2dFMo40YHTinKC
         o+czjB9ZzWo9ZMGfXVevT7gi+J9LkHGwXtz+MZ3O6Hug4F+ryXnStYDHo/DecmGA/SxP
         L3JQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8xRJNoafJ4mgNt5VztlEfKOthucgT+BuJgrSfrWT1f4mRtu8i+4CHY77m396Hlg1OVBfpKKeYBafKDfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCT9ijASIsvu0OWH+LNFhh6tCpwOkcB979s5lQOcAiqSiTIKre
	isf73SkxeLQ5JDYzzYcx155o1sBuKmG1KVKnIZEiVe7l65l0HalJMCd0oDjCKT0ArxrJ7hDo3DM
	rim/ye2e9Xb9/PsVxP9/4GhgljZAQnE2AxmJiTVqLew==
X-Gm-Gg: ASbGnct2OKqwkDdKgk2iFvpBLz0gq0dRo5sbw+nZ7WB4njmrujSGnlnI+rs4iZGOmmg
	FxjLv+7TeUtyVHHrSkptihvOS/ftejmSfZOaJ4MDEzfM2KCCu7csOVCBf7xkrE+xx9xQzhl3zgU
	xo9UnMeBp17afo8trXK/VD2rZzbnKZbGkF
X-Google-Smtp-Source: AGHT+IEtlN9LmFKCqkTfr1fMDsTcWr6BPb/SNfXLFckAF9Sr8ZXGsmd9lFBvMAQkVfe0s88El5iAUEXMpQYKE5AAkEc=
X-Received: by 2002:a05:6512:3043:b0:553:5283:980f with SMTP id
 2adb3069b0e04-55356df2aeemr2183360e87.51.1749128577147; Thu, 05 Jun 2025
 06:02:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com> <20250528-hdp-upstream-v4-3-7e9b3ad2036d@foss.st.com>
In-Reply-To: <20250528-hdp-upstream-v4-3-7e9b3ad2036d@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:02:45 +0200
X-Gm-Features: AX0GCFun0Zlf8oI1kptxrVzEZHeoQoovvg-1R2vISTKQmzQE4bFTIdqUSf5gGUc
Message-ID: <CACRpkdZsyUR6_Rbxcbs-yUUm=U9UKGCuFp7kmmogqsUAxzTZuw@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] pinctrl: stm32: Introduce HDP driver
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 3:33=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clement.legoffic@foss.st.com> wrote:

> This patch introduce the driver for the Hardware Debug Port available on
> STM32MP platforms. The HDP allows the observation of internal SoC
> signals by using multiplexers. Each HDP port can provide up to 16
> internal signals (one of them can be software controlled as a GPO).
>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
