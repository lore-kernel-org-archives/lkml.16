Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2574281535
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745330820; cv=none; b=VO9B5vmbHwM/2pSQY97g36egnMpzOaqmKXRB476XoqoVGGpyT+e/O2bdwnTxbKobZZa368pmQyiuBXdcycoduNHRl3h+WvkgcYrAQJ3bXihrfbyIObLyx9LMizk3x9j5Q4Zus0pfQvrLW0hyiSU3/4uLtm5CG6+biADsNNY4krk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745330820; c=relaxed/simple;
	bh=Oryn9ySIryVpHrGVoxkqAjqwi8kpr2fXSiVFCTh/yBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kh8Xko70JzA9+RnXeVIlAflTFKXlSTwGKvUrnGu9mCuh6ZHExy82CaDWPx9ypDyt/W2mY59BFnssbDdlgKYu8PPauSim7eqGex7QKxQaz/wKM8ZPCk1lwocYzrmu24TN48kcwnUOT4PDkCdzNfgB6COR+HryxbIzQwaUinfFwY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xlH5qHVN; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xlH5qHVN"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5f6222c6c4cso7098938a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745330817; x=1745935617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jd3xJuk6FST7n0S2TVkTNzsFUMjoZp3JZccjQ28WDhI=;
        b=xlH5qHVNkZw6vnYuSoxRpfFBaWfjnw85i/cB/tKrx+rX/cBbIY4MnZzxlzfn2HFhEs
         p59wkzhzZK6P9HscwtNnbhcT4CuHi26Pp++oT8n+1nqIJIkgrbSg09qy6xAdPyq2D670
         OTuXZZp28SiRZGH4y0gYikuWIOoNWFHAwuVxURVTbhC4K36tLDWbAlPeMzt5ZJNuW0rE
         Bz76e0MsG6Uc0yjVGNjGy0gfXas/dBiWAMdjjki0njWrSKgVQY67OsJs6uQyVlskOAD9
         YfbMfZkt2XzUxX7W/9jw73KrRJ6G/rox6KAgqp2iQdgttcJIf/8w4B6B74GuDHmVBWTL
         p5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745330817; x=1745935617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jd3xJuk6FST7n0S2TVkTNzsFUMjoZp3JZccjQ28WDhI=;
        b=pg7u/bXZanCPY47xZOcpr1Q04UzQGb3Ir35kBXTej1Xv0yMCUAyjLuuxakhHNtFTwl
         eY0ucuhShs3yVawAkYoNqFLZatIR2luvQ6bdPxvzGv5tgDBuntmzSkrONk7SUOtGbx9L
         gsJYrV+rfBhqo8QMt73bGofnNJ7zK5O1AALGwTyokIMLuuAJ9ZmW+LR1vK52PZyF1riT
         pEQkKQI/msEaSSZKdsjYJjH5ZgXu3J1gkSonodUyKgagg1Phg2n8AxoMldaCc2e3c+lu
         pkfFxJcE8U480ON46jp42L4n7+GN9iAkNKPrKf33YZxLbHVTqt6UaDWzFjRfg8mAHrvJ
         Qzjw==
X-Forwarded-Encrypted: i=1; AJvYcCVieSNCTQx8R6l0ICBilVRJaXdKbcLmmlC6tBGUf5Fvqrp7D70DChC+SC86W9T2l/C8YLjuI7X4COie2NE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsv/8hMkjDYnI1ikeIuYcLmd4ZrHSeFsDYqfCVbLbnPXa0rBSb
	25d1/juKgb0UZfcktBTAuK/WtKLNXBwwzv5S9mfsER3ANv3U5YHl17/DVJJ2psw=
X-Gm-Gg: ASbGncukYlquGTwz0KBpY8/Yoh4ZF7r5UlYpHDdv2OA6tiX2p19py+fS2COpl6fDcPg
	4ZDsaPYwBNBC6EuDTxo5V96tAVkfUYcfbUhuy2SsqXSDEH8VoWBhAQ4n2VmP1TAJPYwroX0gqA/
	KzLaKYL9Ooh/41IHHGqCHN6pWI9YbX+6UJreDHSnvfQe5yU4Dwpjs4FCsZYZEX/OmQgnqbrrmQd
	ts7TPkcwWaf+pRkIe7Uoe9YJl7HvV3HHJ3e7CpYzj8PlVVFNBnaWiV73JGcR3xFkYWu0SIhD8Kx
	82x7q8J240BIxTiEPG3/pxIyaTHB6JsFeRgwgA==
X-Google-Smtp-Source: AGHT+IE6qyTXes9SNmoJNFucgPGNq3S9gJF/Z5FLJA8q1EwlXstU/Kat+/34d9QRRlSBxR2b2iRPKQ==
X-Received: by 2002:a05:6402:13ce:b0:5e6:bba0:6778 with SMTP id 4fb4d7f45d1cf-5f6285ed3e0mr12811708a12.23.1745330816878;
        Tue, 22 Apr 2025 07:06:56 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f62583400csm5965159a12.59.2025.04.22.07.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:06:56 -0700 (PDT)
Date: Tue, 22 Apr 2025 17:06:54 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/11] pmdomain: core: Add the genpd->dev to the genpd
 provider bus
Message-ID: <aAeifr60sdT/AENz@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-7-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417142513.312939-7-ulf.hansson@linaro.org>

On 25-04-17 16:25:04, Ulf Hansson wrote:
> To take the next step for a more common handling of the genpd providers,
> let's add the genpd->dev to the genpd provider bus when registering a genpd
> OF provider.
> 
> Beyond this, the corresponding genpd provider driver's ->probe(),
> ->remove() and ->sync_state() callbacks starts to be invoked. However,
> let's leave those callbacks as empty functions for now. Instead, subsequent
> changes will implement them.
> 
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
