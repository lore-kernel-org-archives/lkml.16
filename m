Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BE1255240
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750317245; cv=none; b=iWMQIZjwgrJkbpIkmiXjvMqChQPBNvSByuEnfELOU23QsBR99DxbMIE/ffUOCBbAP+sV4zm3Qn9XX21ukyMcAyPmG0lTg66XD9Cinpetx5iEg8m+c3tJyF3nkXi7cli2h9YYLiTvc8A3T7KrTVOAXi7BR77GyfnX/hycKPzFxxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750317245; c=relaxed/simple;
	bh=Yq2FlbkzUqerQAzRvLsP0m+ZTiUSI2pXvwMlAMDLmKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JaB/07CgXRtiD2aCRwyDMYPYxjE3TJ3OowOjsKNzEcc7GZfPO5kuR9rd4b1TvSCdti4wIJUdijmVj+pvHGEFHNB8dZzsa1Jw2jYliK6Irh0LyEXpj5gsr+/3r29cTywcoifFSgP8L6gihTfio5g6HlV0ceu0Q5Qnr8YC3iqUk+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=C4B6EK5h; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="C4B6EK5h"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so3090935e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750317242; x=1750922042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cq44AhL1m8zmm2BXeTzju6Z4jxLaMdXtrDcTCP3h0bM=;
        b=C4B6EK5hbxZPet6m3ea1A9rz6nq44MgCHmGwRT8hFQ0FFpqchTSlBTvytlgKQopIcf
         rQnZQ1ekvHLt8hPpdNr2JejCiU/hOd+VBKeP5WGoVQ1vUsbSfM6uw0KlCUFaRDcwzpiC
         NZL4vzHVvPqnvvCz3X1oHWCI4+ka3c+RmEh573oIseFRAPWdcCmFaucK7pGQNPWFSawk
         xaT5x9dzn9mkkI+BdJCpgCKHrkKMYBuTpJowJ3IrRco4HsPTez8iWHr5H1S9NklQcS7p
         LJ2T1ZckgZIZmhGr/5cgHPvLI6jTUbEJ3dkGgAQBmauElvOG2nm1jETCOEpojZAiY8+5
         2mQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750317242; x=1750922042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cq44AhL1m8zmm2BXeTzju6Z4jxLaMdXtrDcTCP3h0bM=;
        b=XcjW1utNnDBU19GcKxAiFh7NPyiiyWV33mpPdPWrU8u7612q8WJTpWutG34pW4zLSN
         tBTIGDEYuWtivW3pd6wcw1CdXgU63RxGa2z7WYjqwStABgLEQJyejNr8TTpY4dEvPWeY
         zhfQYEpMEpIcc4YZvpSp+D3MykiikCbA83MAkywBVd2SdLFoBTvrc3NQFrWDXUNiyErA
         M9atx5HdCjM+ltHfStDo+So87kppCocmO/zkM7V5R1j4tCCxU2X/OtQGV62PmJI2Wvj6
         bM/TsqjZNQP97imQ89b3JClYnPBk+WHar2dYDHosVyyUvA0RaWgEI3QCysMg6I/ZP1Lp
         MyXA==
X-Forwarded-Encrypted: i=1; AJvYcCUOUAvFlyMSDa4kTg0ljyP0YtHo9hC2AR62trGN0HKnM4RxRnfwvOoAHnyHmFmVB1FjBO2bmN4/VLdBFjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YybaAhD09KDIpa50/qR3JnVjAVBWnEVBvzzJuisTYXox5uA3A0N
	7mog0MF0oYt8Z1bq1PfFQBpkaVDpbVxZP4RUvfST4nmkjzg471/pfhHHnX9hBNHc34g=
X-Gm-Gg: ASbGncsoMi7o7+9lRk10v2lh3prSpMBAxohGe2LWVpfbNBUXwkaxtxQ1bO8TadCVB/l
	by7OmGufjFg/kjpFR2Uq1BneVPjR3r85pqupc8wwTekCD9Fps6VbeUQZ+YyetI4xiVxX4Mq1kth
	uvDXHlRAaVBiwGKQfnyL0H40BOKdExjFL+c+j/5afQPcV++MeHZiUf1nx2gkk+yFvBzSBsMhbMV
	ypMOjRYrkQZIo6qCkRZixlDEgfg2JOvYIynW+clnFC4QYIecB6B08PSbZwgmlwshBBt+By58v8c
	y2Q0a2HZfM48JiKzMxkw5eJzRV8pKravKhSdVsl2RNOxF75YHciKh8UlNiKsTekJmZmdS8EmeQ=
	=
X-Google-Smtp-Source: AGHT+IGlNantl4wJm6RCvWBimekXrYP8rB5NeN1SXtm5TjP6e7AZBjb9h39LOn+KDLomqiXHR+OvRQ==
X-Received: by 2002:a05:6000:71c:b0:3a4:dc80:b932 with SMTP id ffacd0b85a97d-3a572367dd8mr13904267f8f.8.1750317241916;
        Thu, 19 Jun 2025 00:14:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b087b4sm19153422f8f.51.2025.06.19.00.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 00:14:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Klara Modin <klarasmodin@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: fix NULL-pointer dereferences introduced in GPIO chip setter conversion
Date: Thu, 19 Jun 2025 09:14:00 +0200
Message-ID: <175031723753.8751.12135495432904618963.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
References: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 18 Jun 2025 15:02:05 +0200, Bartosz Golaszewski wrote:
> I should have paid more attention when doing the GPIO chip setter
> conversions that there are instances where the setters are accessed
> directly using the function pointers in struct gpio_chip.
> 
> This is not optimal and I am making a mental note to track all such
> use-cases and use the appropriate wrapper instead. For now: let's just
> fix the issue in gpio-mmio and its users as well as one other converted
> driver that suffers from it.
> 
> [...]

Applied, thanks!

[1/2] gpio: npcm-sgpio: don't use legacy GPIO chip setters
      https://git.kernel.org/brgl/linux/c/1fd7d210952938e8ef6d87287e056e25a2fc0547
[2/2] gpio: mmio: don't use legacy GPIO chip setters
      https://git.kernel.org/brgl/linux/c/cbb887a76b788d8e9646fdd785f43745a3a662bb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
