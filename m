Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2735C96
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 02:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749176288; cv=none; b=Xx+bMUR+N7lIYVfUa7r2PgGsjTyKwWMtD91j8R12Fj1llJ8SPfCMBtRapFMSmAXFVLUzYNn5wurKaF2VcGxo0hReSKdQ49mlZpuEfOHkKPfVNeYiHtNE2dOJ9X2TArZIYC7UPhTbNIdYAlOPa6FuwVQT3b2y+db1yZrum0UUlqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749176288; c=relaxed/simple;
	bh=6qA7YBQpFiK4Ibv64ZbIu8PGXennlTHCTuEMTnnA2+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i9Q7kcrNtEVG0dil7FqVB8H3ZBZhiOTkZUMTlAW8tfOg1/zYnTtVJkwmijYMqPJz53l9U4FgW+5KiJ0I4RIWrQ8meSR8y9OIjLGmmqLLJn12rqF8coniWCW9PIgfVNb53YLtQjY2gzfiXewiJtCf6OEbLBXUJs/URY+Qh3WUYfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqJhFoOV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqJhFoOV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF703C4CEF2
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 02:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749176287;
	bh=6qA7YBQpFiK4Ibv64ZbIu8PGXennlTHCTuEMTnnA2+A=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=KqJhFoOVKrziTHIUrXZpN//39jSp3rRY0YE4Ll642fNVb89wEV//IQz0PHrqNSSDs
	 hXq7i6ovic24xieFPXevCFZV9tb/D4IMr0e/SeBtSipfZEM8ZAjhY0jWS6tFC91Z5l
	 21rV8QlQDpKiYwLWXBYfkq/wF8BauBX5JPL+Ga+VtS/0JyzAYC6P499h95SrozDtSs
	 qRqN9+RZku0dO18yk8t0oQ31LW/eaBcXf8sbulOo060fWbyhTtIX7RIyLhnjMNdgIm
	 aOZecUZbzJZhVTyihLN5wojnpZTYG6I000O8YkNy2gs3EYmlkhC/nhRkWu/4V9++nG
	 wdflXV5cK5kTA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55324e35f49so1706228e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 19:18:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKcCqjHMnz6VX9XdyPIFJqyl583qhyKmteVmCUSW7ehzATBnPN3rpXSNlxzve0CTkTxqXv26jw1bEZQ5E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7hmZVv+HmVxak2I5J4M+hbDBg2hF3EMuhT/lr6d3d/ZBE/I+l
	cXa38qNKDMUwRyfYqLtw9z7XCR0jWMQJ5zWFrsaIV+f9lTnrnbW8b/DdQBPfR9omA2V4eFkmv2g
	3nDSScL0cIreRqT5fNI+4cdu+4u33lX4=
X-Google-Smtp-Source: AGHT+IGO0F1wP7gpgYi2lunUSLtB2eWuNwcIOZ7QiYAP+juBVh9hkY1iACCnipgD2v8g1JzHxJSNVztgLLcWQwygpeU=
X-Received: by 2002:a05:6512:4026:b0:553:663c:584e with SMTP id
 2adb3069b0e04-55366c413f3mr305058e87.47.1749176286022; Thu, 05 Jun 2025
 19:18:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605185001.377055-1-heiko@sntech.de>
In-Reply-To: <20250605185001.377055-1-heiko@sntech.de>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 6 Jun 2025 10:17:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v65C0jHsD2HD_AEt+AGqMfWUUwwWV0bXw4i9Hw2tCNHZpA@mail.gmail.com>
X-Gm-Features: AX0GCFuToKRUmITqgDNGpW_ZR3HS5yeuUl6k2yiigcbUSEF1x31-6X5nEgTdfNg
Message-ID: <CAGb2v65C0jHsD2HD_AEt+AGqMfWUUwwWV0bXw4i9Hw2tCNHZpA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: add regulator-enable-ramp-delay
 to RK860-0/-2/-3 regulators
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@cherry.de, jonas@kwiboo.se, dsimic@manjaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 2:57=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> wro=
te:
>
> The RK860-0/-1/-2/-3 regulators are used on rk3588 boards in addition to
> the main pmic, to supply components like the big cpu-clusters and npu.
>
> So far nobody had a use-case for turning these off. The supplies for the
> big cpu-clusters are on by default and those clusters normally are not
> completely turned off during runtime.
>
> This changed with the new Rocket driver for the NPU, which does use
> runtime-pm and thus does turn off and on the NPU's supply regulator as
> needed. This regulator is also needed to run to actually turn on the
> power-domain for the NPU.
>
> If the rocket driver now runtime-suspends while running a load and then
> runtime-resumes again, hangs can be observed with messages like
>
>   rockchip-pm-domain fd8d8000.power-management:power-controller: failed t=
o set domain 'nputop' on, val=3D0
>
> A way to "fix" that issue when it happens, is to set the regulator to
> always-on. This suggests that the power-domain is trying to get power
> from the regulator before it is ready to deliver power.
>
> And in fact the datasheet for the regulator defines an "Internal soft-sta=
rt
> time" characteristic. For a target output voltage of 1.0V the _typical_
> time to reach at least 92% of the output, is given as 260uS.
>
> That means the time is dependent on the target voltage (up to 1.5V for
> the type) and also the rest of the board design.
>
> So add a regulator-enable-ramp-delay to all rk860-2/-3 nodes we have in
> mainline right now. I've chosen 500uS to be on the safe side, as
> 260uS is the "typical" value for 1.0V and sadly no max value is given
> in the datasheet.

Since these are characteristics of the PMIC, I wonder if it makes more
sense to put them in the driver? At least that's what we've done with a
similar fix for the AXP PMICs.

ChenYu

>
> This adds the property to all rk8600, rk8602 and rk8603 occurences that
> are in mainline as of 6.16-rc1. There is currently no rk8601 used in
> any in-kernel devicetree.
