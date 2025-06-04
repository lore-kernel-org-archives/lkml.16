Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1991A314F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 03:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749008611; cv=none; b=GEPcOTvmEogfM3tyZTeZG2NJscn4yctfbdWlRzWL8cHFW6+/KnbzhTANGfcdtp8co5e2nn6lndP66rJft5wiUwoe801QLKXgu+/mvN15DJ/7XOclfYbyQhhH5YVPDCk0WxGIcqGKgbPuE0En4jKdjt98CJVlKtyoQIfvqRii8r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749008611; c=relaxed/simple;
	bh=Sf/4+POn7BVTFHEDrs6asZumcOeQmLNTI7IjWHUUShg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qa4hhlCpiidfR+2MzKE3gWZknxdjTqVe/wDgV975Jgswz5SS8RMps3rMz//F4e1kwvM83SPuFAXP1DGJ0wWqRZXML+48LTkA3aYFgZJNBOsYFQz4ThvBSQccLT+mUhvK67BDuU+2adX1l6i+d3xHqwEkDe2ddD/CVrFCj0MdoAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mJWG7Nr8; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mJWG7Nr8"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32a72e61a3fso5584181fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 20:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749008606; x=1749613406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sf/4+POn7BVTFHEDrs6asZumcOeQmLNTI7IjWHUUShg=;
        b=mJWG7Nr8R+3Nk0ovAgf0iNudseMMDB6mVjXhfPn70sDGjUpCtXGXs/BrcpuCIEE5Yf
         UT7iUbhMXjigUo63Yb9m9Q0RoICmqZXfExmlFE2ccvCsspCeOQK34sWzefjQTXd9MdEW
         fYL4e259Y1XqLbA0EQWfnctzzhnsnweNzwKTNlI9PnBtn6/d2WuP8EFyR5slYDTnBfyM
         8TJpEqYtBf0A7dq2DE8+HM7ZVdZ0ZnkIg8T+TI4HninWyO0h80MbnTZ0gcifWrzDM14z
         DYpr46zQJNP8aMNxkmb154oahSOF7/1Pxq+Ud6Tmx4TPOi6OuTDQh/bnDiTOytD4AVpT
         us9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749008606; x=1749613406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sf/4+POn7BVTFHEDrs6asZumcOeQmLNTI7IjWHUUShg=;
        b=e1HPoQvMHOgEpF5WUSIIji9Cjuz2hTtwepXT1x1rp9jehQtGT3I7UIks8EpxF/nJH7
         Eij66qqWeOXcM+45aXOH4CvRpxr7wB1IaJBjPo8Nm0sOo1ntcmdTd4j+y7n6IApLKV/7
         583Egd9DfJ2TO1V3g4UlBCrPjBRSNocxehkg17l4atVyTywhr5RLVhQSLHO97X9sfRlW
         JUr6AKI2x7hyPSjp/zBjnMqsD7NguQm57xucNH6owA+yQr4LMMju7jejdg4wYu2Xxnfa
         h4ox9TIxR9PoU2h22fy0QWZYZu6Tzur9+i4p0RKtCeLaoAcm57eGNqdznYRVD+Osd3F1
         puaA==
X-Forwarded-Encrypted: i=1; AJvYcCXLHyBaFMqB9Kh8d9hHSKLoZqYyvfqAS7gPuL323yEIEA9s65KalV1Yu8iolorzbngm/guHWD+wLMUhAlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJH5T2tMfsM0hQsvYjx2HoSQGZiKjwZRwnL6ntbz0gmvaKieWL
	fVaZzh2hQcP+v2y4QHg9HLBPevPkni8qjEoY552GSBX6eZ9ekoNpJyuNGZa6XSiehgNSDptQyrM
	6iZjHPDpnG8nZnwkbUsFIhO7vyzte5ljG+J+oAy8Ie1GTJ1Vbm5FhweN0NJNp
X-Gm-Gg: ASbGncuON3BAEsBoMxZcoy6KOcW5I18uueQ0hDojbowRu6X2FmU9e/iR2yrv+TkuK6n
	TbH6kkHcflBug6otF68SbgAXIPfprnFR7u7/bmEz1sMfxFFY8u+KS4JX72N0Idv0buWawOlUoZt
	dwhvvL6ICwB+hn53MG63X1mrsptzDmwWOaFRcwa13cHJsa6we/7w5tO4Jpl/V6B57/2HqhTei1
X-Google-Smtp-Source: AGHT+IH8ZR09cOwjQWxlzzIIzvv/qRTFHJMY8a37VDJ4S/kE7pfdaVMCEhiK2Gv1YMR2kEbER3eXRAurwmgsUUQyZRY=
X-Received: by 2002:a05:6512:1110:b0:549:8c0c:ea15 with SMTP id
 2adb3069b0e04-553530e6bddmr1432974e87.0.1749008605694; Tue, 03 Jun 2025
 20:43:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org> <20250602151853.1942521-8-daniel.lezcano@linaro.org>
In-Reply-To: <20250602151853.1942521-8-daniel.lezcano@linaro.org>
From: John Stultz <jstultz@google.com>
Date: Tue, 3 Jun 2025 20:43:12 -0700
X-Gm-Features: AX0GCFvc7MVw8hFnvp1SKu5kFSFas_79C7UyjmOU1fxABMnJcu53irlnUJ9Jiw0
Message-ID: <CANDhNCpngvSEC1bXP_djk2957n-_LF1CUXNgZ-eEQ8vcCsizMw@mail.gmail.com>
Subject: Re: [PATCH v1 7/7] time: Export symbol for sched_clock register function
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, Jim Cromie <jim.cromie@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, Will McVicker <willmcvicker@google.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Saravan Kanna <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 8:19=E2=80=AFAM Daniel Lezcano <daniel.lezcano@linar=
o.org> wrote:
>
> The timer drivers could be converted into modules. The different
> functions to register the clocksource or the clockevent are already
> exporting their symbols for modules but the sched_clock_register()
> function is missing.
>
> Export the symbols so the drivers using this function can be converted
> into modules.

Thanks for chasing down all the details around this issue Daniel!

Acked-by: John Stultz <jstultz@google.com>
