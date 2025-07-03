Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24692BF013
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582356; cv=none; b=Z62vvTywohE6Wy+OsM6mBEZsTNOgSxBhlm5/k/WtRQCqmvv5PmpWio29ZA9TNuedHA+JLCzfif0lKpWXUkc9KkgtVL8BNsCEojRgyI0uHeRr8G0Scqh36IfL2Y/nf/vsSdnVP8eB1FRXnjGlUyf7jar2xbMVNEo2RY/FZ19wzKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582356; c=relaxed/simple;
	bh=qHiJGvw/4jGa4QsGOCrg7eO9558uRKsIgpy7SwSLppQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eYnH6q0JiS3yrkdQfAqbsUhl5cmveALqnnYGVWfSlktCVXffYZSDl5TJKJzpkUjDAvEaRpDrZ2u0JZU19kxb5Np1NyCv+/EqAKnQE420CUmkMnSuXfZHYRU2xg1kJZ8a4WRgGYMdpBWXyJOlA7LSOIr/OkIHdX+01TpKG6iQn74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fJJuxuyd; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fJJuxuyd"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-555163cd09aso360563e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 15:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751582353; x=1752187153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHiJGvw/4jGa4QsGOCrg7eO9558uRKsIgpy7SwSLppQ=;
        b=fJJuxuydbWi1fBH+rZ+u6VqGTiuFmdhNuDBHoAEiA2EP/VcIBFbpuljSObYqIx3QxT
         TxXQWRpeLBS+o0Tjc/vzxU7nLvozxVMl1o4ESAXN97oLqp8IA/Bv7Agu5BMoY2g5lZ6t
         kEX+ASWGkO7JZKok0QL7tjXzeK2bfitJbzUbPGFmObpIup1Ye8EUoMCmZthC36mVTWKZ
         NFqoFBguOm7UFPp39y19cvfhIjcwCJCGoy2NDQaVo5kpH6PyDRlP/I0fkHb70K+6dUuq
         Ne+Ilfbnfihzu9qDamktPzbF7jdazBOY7MZpxW2OgfN3qyF5PfabsTXVEyMM0LM6jvD8
         JwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751582353; x=1752187153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHiJGvw/4jGa4QsGOCrg7eO9558uRKsIgpy7SwSLppQ=;
        b=KX9XLjX6SSHCcEGUfM0jjsf4njCOFh+kZmFrnwnXuWzazh37G0ONftu60pjHVOQu7R
         cfsAIjYberULXvAh/WDkvZ9xJzoKGW8LS0ERsT1dQ3NrZJMUb0n45N003p7zI6Ty8B3P
         NcuxtgTlXnLtnmlzm5mjmfWZ/7oqtw/Z6XUzkU0NtXeMUgqM5bxgZxzZPabvpodTdswH
         Sa/Ehepzs94FFRFTIsfhqXTMSqqUKWNScjsfGBRp5BzvlqAGtxXmEgNPk7kwGPFZBzbB
         h6j4rZWWrlXcWYmqnh7s3powl2Tmy4KXjfWRcmFLzAGdahbWGnL5nbugfsHJM6bVZ9Je
         9GFw==
X-Forwarded-Encrypted: i=1; AJvYcCXyh34zgR7B5KJRnUnmNbffGs8w+GKknSMl/J1d6+7VEn3c7heJNSPOUcUsJ5kIe+09Ek4sf4UaZxHTWHI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywimhh2ln0F+M/0dmVysfsoYqF3oqAK+5e4OJG1aL9z4dCdde7j
	PiD+AuS+dvFrEv46Gn942ZagKq/0Uyab+4meKOidRLG0B9wBoW5bjze2GW/vwCkAQgVEXRrue6w
	n760af4WeqIJPO+wDntOiu9o2ZfWpMCM8CDuz9I3J3Q==
X-Gm-Gg: ASbGncsULl7rAvtsK9oGIJxRAE4Zz+4S7lZA1nFVrhvgiKGIGRLqmDwC7U9wBmXRVAo
	IiADv+t8ryyeckb/Y1IJcdEp28hWnfGLlo++M+z20Cs5k8KGLsHl/i+JfwQGyTAoX7mA71Fft0X
	770rof8akZA5JdkuRD2qArZTcsKd4wpAmAHEjDOY0as2s=
X-Google-Smtp-Source: AGHT+IGv3ck00tYjA0oJ1uAFiXX8dKOpbmMnkAsSvX3eRdG6T6/6PMHb5TEQ2nljlmc/vsAEZrYKze2AdV98N+dH7KI=
X-Received: by 2002:a05:6512:1589:b0:553:2e37:6952 with SMTP id
 2adb3069b0e04-556e73fd335mr44356e87.55.1751582352961; Thu, 03 Jul 2025
 15:39:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
In-Reply-To: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 00:39:01 +0200
X-Gm-Features: Ac12FXxyLpl7_cYrO9sRsqDV9GRQvTlee2Fpz1xlmG_qIRP703som7M3nlLO-ZY
Message-ID: <CACRpkdZKsfFWCKxd8QbUjrgrzHind6fJcZ0n0LeHmE1xPdUxuw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/5] pinctrl: introduce the concept of a GPIO pin
 function category
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 10:45=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Note: this really is an RFC. Please don't spend too much time revieweing
> the code in detail. I'd like to figure out if that's a good approach at
> all first.

I like what I see.

Go ahead with this patch series!

I can use this to strictify other pin controllers as well.

Yours,
Linus Walleij
