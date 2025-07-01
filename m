Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72B02798E6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383031; cv=none; b=IKuqEMF3ByBioqHx/4CgoPuXmzo8NabS6/NWXvcBeK3iezpOzojXMi93EG9BJBNfoodJTKEuyd4RVwP7CzI8V06Q836ydam/VhqDIkqQ+IYCVs6UXfmIJls6O8ceuX9nAsSi30kyvgHmtZrbTxMcm5m5Thqy9sISEhnLZWNWAUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383031; c=relaxed/simple;
	bh=UzPkDkcjv+i8GzG9JMJlLQc03B+nxyKMyUaYhYyrDlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=neNgRrq91z7qFvvtFFPhU/2Z7taKRqqOYLnMu0xYIKP9Jc+ba/FTvuMBYT54FwDeKHD85AovhKSb9tteqVgg21bY9C4GeOj464rywzQ9R0f2DsGz8RI956J/Kcr3wyJFboL4zBltrG9apTmjncezkrK/kZ4GELJevGOi9oNkxww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XOSA/652; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XOSA/652"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2edec6c5511so1593407fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 08:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751383026; x=1751987826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kto2WDWq8SXrCfQMl14bP+htdglCH2HfwzImspNOE2s=;
        b=XOSA/6528ctl1Ap6NQ4YpzmiuvH/X1llg7Tgi17xP3BB9TUiLMiE6ZvjPb78usLSwB
         /59oHHb7xYPfStxnjmWpozPvOxgeEgjn03pX1EObKtIYX73XVlkrajYlf16lDahGUEet
         TnHEiPLo32gxf7FGyAzJec1HDo2b6SK6zy5tQ3c8NZnS/uITLQJLpn71tygZJYXDQhyV
         HSL1C7zeXGYZd3EPrVOF0jFNJ984Kqlh8eAkQleLorzCxv+NwWCfs5R1QP+ry1tNU3wG
         juksHpzo0U24UddBFPTKlcMlc9G/cJ5WTNCnUZNFuG9iV2u+R46L7BETJqLIPbIsTeGb
         pbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383026; x=1751987826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kto2WDWq8SXrCfQMl14bP+htdglCH2HfwzImspNOE2s=;
        b=YhdJkovZUHh8b07DyKHmcztVmEmE9BipuDjBhBwO8rh/OpKmajshmnMQpEQSJBjTFn
         BhYw1Dofqu7XcMUKgWI8lDvJKuBjj5wncB7SaBhdGJuapua4t+W1LOnYHdVIUJ+9lgvx
         AuEpNFgFR0b9FELxmbuylFZuTdDVnVCmdAht1dYj/bgn0sRDA2//8aACiIIl2O4xdbYv
         DDqepC/jaw28sfGfjUYsQ9PUb9+kqBH6jxGbzq1YroHhZehijoQX4iJ51iLHm5H1cPWD
         1E96pqRca7adFvoymQI1Kj8od2DAqqsNb4XQRgkT2DmB7uUp5Fa1Y5OIJh53YsRSIm07
         d5vg==
X-Forwarded-Encrypted: i=1; AJvYcCUsbZeoAhCehsN6y3oIjWa0qnxVEtUgBpvSW+OWaPjGNZvvwb5qZMjuRiUnr8b5ZySp2CTj2RFdPXLc9L8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzispvs9LjHA5ojWwbbdkEei3paCep707GvM7bs5Fw3WI96GrXa
	eLsRQ5ry4YT30v3TYMYYT71VsyN/31DPhSERw/m9cB9aQrzwyFJgCom2JElGxeFwrNE=
X-Gm-Gg: ASbGnctA3uP5l6UPj1IA3GxM9WZanGOB19z/KMnr4NcLZ1Zf1Ud8mZcjhjbc/c7JbGP
	vBtwbwOUZNpSdId8bZSe0WQ2STgnozf/TmZZqNxcerhBiYta3TsN55wNWfJwbXqXpVUyePuPlrG
	/xo4hn5K7sXCVMmAqUOEsnVdvzVeSAEQcGJvUXS9qZHBuoRtIO5nPYPKqflwHyURvSg/WiA3tRo
	QAaL/GT2SaiabjErtmbfRwK9dN87BdGQWBz2dke5VuoZLYUvjiT05PW0yJDOBhP+P/eIQcke24l
	faVd0ZLJwLViK7i20MJ7Yz/ioC+YduTcG63mAFxwHFHW7pzCZdYhBe71Y7DOAz8ieth78NZoncg
	iDD3sIQdgF7K4PgTXVTr8K0zWaX0WHfLPpX8de1w=
X-Google-Smtp-Source: AGHT+IGFKFZEsYZ4erbtAtqvl8tEHdHdyZFtcG8OKzWXPDqsQnJB5BtiKcEBEjaczDbwqY+Qnse9tA==
X-Received: by 2002:a05:6871:82a:b0:2c7:6f57:3645 with SMTP id 586e51a60fabf-2efed67879emr12142176fac.18.1751383010329;
        Tue, 01 Jul 2025 08:16:50 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:70a7:ca49:a250:f1d5? ([2600:8803:e7e4:1d00:70a7:ca49:a250:f1d5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd50fb14esm3319606fac.42.2025.07.01.08.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 08:16:49 -0700 (PDT)
Message-ID: <3df2c424-297e-4538-b350-5c465b22fa39@baylibre.com>
Date: Tue, 1 Jul 2025 10:16:47 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Remove error prints for devm_add_action_or_reset()
To: Waqar Hameed <waqar.hameed@axis.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Julien Panis <jpanis@baylibre.com>,
 William Breathitt Gray <wbg@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Peter Rosin <peda@axentia.se>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matteo Martelli <matteomartelli3@gmail.com>, Heiko Stuebner
 <heiko@sntech.de>, Francesco Dolcini <francesco@dolcini.it>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>,
 Mudit Sharma <muditsharma.info@gmail.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Song Qiang <songqiang1304521@gmail.com>, Crt Mori <cmo@melexis.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Karol Gugala <kgugala@antmicro.com>,
 Mateusz Holenko <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Sebastian Reichel <sre@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Han Xu <han.xu@nxp.com>, Haibo Chen <haibo.chen@nxp.com>,
 Yogesh Gaur <yogeshgaur.83@gmail.com>, Mark Brown <broonie@kernel.org>,
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: kernel@axis.com, linux-iio@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-input@vger.kernel.org, linux-mmc@vger.kernel.org, imx@lists.linux.dev,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org
References: <pnd7c0s6ji2.fsf@axis.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <pnd7c0s6ji2.fsf@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/1/25 10:03 AM, Waqar Hameed wrote:
> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> return the value instead.
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---
I can't speak for all subsystems, but this would probably be acceptable
in the iio subsystem.

However, I don't think anyone is going to accept a patch that touches
all of these files at the same time across subsystems.

So I would suggest to split this up into one patch per driver and create
one series per subsystem. This way, each subsystem isn't bothered by unrelated
patches that they don't particularly need to care about. And note that some
subsystems like net have additional expectations, e.g for the patch subject
so that it gets picked up by automated tools, so be sure to check the docs
for this.


