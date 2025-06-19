Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBA426A0D5
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750323515; cv=none; b=l8NsY6kLdakLYwH7Ya2i1UB07bux26jgSwh++H9pFK8Smwn/0+P0LH8W/c2WK84KyGrmjaCkJqesAnjsvItdObs6ZsLtx6zLHFk/mI32LjhmSXWtnPFg6oc+QWG7I8OFWJgN/iMwF+kgdoP7j4fskgMTjLxHamZSiSYxS+xbJ1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750323515; c=relaxed/simple;
	bh=YQQ3Ad8xd/gXzhSgWbJo7HjFzyCo0MZmJJg+rjfMpiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=becshZcQFlmgqwrEhlSJCIwrmiwz//KUYSqhlPgh6EFzgfws4TFcdUs0oUAIdyNWvAi08Ejl223DUyE9GYhNef1kl+La8aVyitbBgYO1q2OPnMCDi5MoAq3FYo9gGD+o1TIBCnCJrZDonC29TEZIvmqfBUsAyw3Xw6iHFEHqPps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=syAzda4n; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="syAzda4n"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-551efd86048so516321e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750323512; x=1750928312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQQ3Ad8xd/gXzhSgWbJo7HjFzyCo0MZmJJg+rjfMpiA=;
        b=syAzda4nUuFCXxkOwFO1PtX+6nURrXJAvwVnHPX8U1QHHTm1gVVjVGybPEIX0sm4jZ
         b6YMbsSjk1yq2ondBPURwYByC/C8n8XB5vPCouw+GJQtd2T9b7FEE0vpjfK8GPCgFkLf
         HP0uDiga4lRV12XbHvlY3A8t65CL9XhpszVg2/ikjtALSvUCzk7c91SfLsUIEpduifKi
         2KmmhY6mrTEP75sSMXwi8QJEQrvXOnxQ0jGCU4xYSsPxv0FvGhrvFwqbrZb4t10Q8WaE
         iJlZCg8cIQA6wQA8KWQxicorAzK2kfXv4HFruS2NKDIPw3PsH7hG3goFOlwqoitiQ+F0
         gQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750323512; x=1750928312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQQ3Ad8xd/gXzhSgWbJo7HjFzyCo0MZmJJg+rjfMpiA=;
        b=f5cbWNE5L+bKUMLGWUu9V5cSDgGauUc8G3B/OG9fVq7QwgtaG+Jb+O9rrXWxc98SJ1
         45GDViJFLPj90xaxTpv67p0smAN0q8cFPqg0kqMuGk7K7kUFHPW3SMCH1As+2b3e+4hV
         hjAfJ7SH1yMhg2GumSX1iBtaIXt0KDbl+OHXzl6Mpw0fuTy3qQitnpCxSOq7ytC9F8b4
         Mo+M0PlURrZTpt9FaJGbmTgRr1oRLT3cZdb0+2ZNVEi6UW+0zCmhsJhyI0SFoOach0jj
         592tpW8Plvxs79RmvUWTCVU0zCksfgfKfimTn1CMex4VGJRQ50it1toLcMNa64DHkyOm
         gR1w==
X-Forwarded-Encrypted: i=1; AJvYcCWcmKNvVHzcF0OTgmuGa5FvImUke/4iQsgDltEF+UovDmbm+6L5B5UYtY6seQJqrd5iUNehE1unl1VzQDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YypXKYiq1L0AIAWuJego6nRMwdzT2bMvC0ZToMEnq/bVrJvcv1+
	+5N0wrEFuOy0xgLj/THiAgTn5DUSFR8VHfM0UTrNPyd4bj08Hvp8f8J4WwUyu7yzXbYnqLsQfFU
	21QVQPWpgM1GT4D83+VVifw4uSYKq/HnjdFUU60IgCQ==
X-Gm-Gg: ASbGncuGHmuS2rI5WhEQf33MlR2NH4ZzaLZhlkexEE96Ckq1IakEJ+noFNJ846/prmy
	t3OcfO8sfd+nBGjHDncjZWT4O0JXjVOmqtoigQBH4aLnQ39hdhj0B7PpzYsnPjS1rxWnoMBUOOi
	8q2PuXEttvqtdIG8iVRJFGRzc8a2vDhpm32duIrpfxc56mwzhuUw3pIpZ3RN8RUZM880yr+OEAd
	iY=
X-Google-Smtp-Source: AGHT+IFdD/1jTvO6x1IgzidwZt2XK0VP7pgS282orlNSuUnNeGDtt9tznwgJaV6i/23DDXdw4QcbDmhWF5puBYWdpsw=
X-Received: by 2002:a05:6512:638b:10b0:553:cede:6a9 with SMTP id
 2adb3069b0e04-553cede087cmr2038325e87.55.1750323512059; Thu, 19 Jun 2025
 01:58:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org> <20250619-gpiochip-set-rv-gpio-v2-5-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-5-74abf689fbd8@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:58:19 +0200
X-Gm-Features: AX0GCFvFwqdMku6Ga1EUw2bxcWk7yA8B4y-QiGMepH4vtYQKsxYzuxQuOLrii5k
Message-ID: <CAMRc=Mdrg+0xUcWnvk6Z8bDP9JuU0ZoVfD3kfaMv+a+dO4AzQQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] gpio: pmic-eic-sprd: drop unneeded .set() callback
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 10:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The lines on this chip are input-only. GPIO core can handle the missing
> .set() callback so there's no need to implement a dummy here. Drop it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
