Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1716425C831
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723548; cv=none; b=IQLDX1raov2l+JyEoDxXqVRsA4Fx5COac/5N0RyYgu6sxwe3kzjIhSYyTpsASysr1d+myHvmx/YDhltmQUHal0OuEZ57HNV9+RHh4cI0ntyDrzgpSwHroFno/VWBFB2cQDgwXssuGMbYOq2Xd8NHsfN4K4jXV9NLEQmLuC2rkNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723548; c=relaxed/simple;
	bh=P8d/IuXP++zCB6Blh67Pa80slPlhVjST05vmIgCy2lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AbPhDFw0wZnJ1JsG7Tzln2HHFVei3IcWoBWdEjOMORwJugR7FZNDXMpc2GMotD1fcedureY++4wG7Q6LzzAJvcB8fiV8rUf9oi4EQ8D3I3o6qeo3Xb/EmBNa8v8lOgQTCVECz42aRrzPigtGqgSFLlaXr8aKvWYO7q4y7pphlLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LcxCljz8; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LcxCljz8"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a064a3e143so2815365f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 23:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747723544; x=1748328344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAMPdzl2AAvyOPiCE2elPcygqsOszaH6ctA4iqiXgBw=;
        b=LcxCljz8a/UzA+aCnxbcMBhAzOGRRhjZVlkbi5tG/z066zJm5d4/ArUWEMFn9PJOkx
         FgcuOrVWLNn3piKqEFctdYMSAOHOotgop5WDFO9HnzzQRRwA3scv94ooTJkHZMrmsu2z
         NRkrRpF/WsnvEqdvbvYIS4TXeSfPIfYS+u5aqKmDSbNDqkmMbVKmUXyJI2euhyBi0VYL
         +6fejcMZi/OFCC/nA2U7CbBaTaSw7BBM6TKJIPMVhVdAxbXPqEdGXrAt110DGnRGW573
         Q3k+LcuJO4fzoz5odiwJ64qbAnlh9Wru4UHZjATz/U6VrnyIL/KQ/wBt8DVeK2YDYCG8
         YUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747723544; x=1748328344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAMPdzl2AAvyOPiCE2elPcygqsOszaH6ctA4iqiXgBw=;
        b=MpjYTnj2k4NWXfo6BU5EvYrZehf46XtNGCH/lT+PFXgyWfZ6kxovJyZNwcFgDt20Ke
         8rUAuysvy7O740HVecIcn0u5QqUwBTOeL1tz6XHysfhu1WFilSjfhzu2A9WLvHKQ+ZwJ
         VEZsUX3TBzjtatbreoJPBJk9phWeie+Xk4xhw9gDclcaNrdOinRXnkpfDzqyglMQ1fmk
         jTrsAaW5++tdJY8Sb/VKGPpJexYAM0CO6j1YpMMqWt08aphwKQsChmZVAYT/lgR+sgpZ
         12wZbtuEAYnQnY3yqdJXFOji/OJYWX3d2Mnsumr19OOGxF51LXMNwbeVCM2FW8j8t+Ax
         KubA==
X-Forwarded-Encrypted: i=1; AJvYcCVv4yM9bp+0lX/sVXA8ITaeJFdsK+ksUkjcN+79Z9gVIDA9v5PZMdUm3HYPz8gc5BzH0u9U/3tEuT2jzrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVEDRSCGqnKYqfaanDA+lu94AWIeybNMDq85OSS5ufLfqHAngv
	oRTGrCzKo5VfZbn74RcIfD7HvO7qpdj7XBx6gSNL5myA1Av10KoTsou8D1RA+O6+2W8=
X-Gm-Gg: ASbGncsuuNAah/bNkw+939rzk118YOBG0VfVXiH/fIR00nilE4pKkI42jWl1aLN8oDz
	xPmDpAty1K0v3o1bID6j/mjCKydAs2q31WdZrP7Wc767VforeCXD5S7pYo6g8fI6TcSR0ZSfQ4h
	Ua51c71QQ4omK5p25kaDCkKSQiaDHcE/SfXHDDuiPfeYDu3YMsEIB5R32ka2Pq+355eBvL0QoXo
	qhEEJqr74ZKn7oJ9g6iIamdJF/adul8j++J3tax8lXHNPva0IFie0QZ+nUXzXZ4wWKlglhfH6Wj
	wttSyhaDXF7M6ggIOHMXHqeEU+MERtpK5Yfa5+DOmCip0jjXqCGn
X-Google-Smtp-Source: AGHT+IH4cIKivXXpB58yg2kOD6SRNlcLlJhLLGF+B9dpXs2VRqbmf/U9Mj+4c+Rz8jNw/vz9uz6gpg==
X-Received: by 2002:a05:6000:186d:b0:3a3:6b0c:a8a3 with SMTP id ffacd0b85a97d-3a36b0ca9b1mr6519169f8f.17.1747723544128;
        Mon, 19 May 2025 23:45:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8de1:6e0a:4ae4:1cd5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a365bc0b5esm11585660f8f.9.2025.05.19.23.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 23:45:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Peng Fan <peng.fan@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/3] gpio: fix Kconfig issues
Date: Tue, 20 May 2025 08:45:42 +0200
Message-ID: <174772354096.8700.10357878300665068417.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org>
References: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 19 May 2025 13:10:40 +0200, Bartosz Golaszewski wrote:
> This fixes two issues with the current immutable irqchip rework
> signalled by the build bot.
> 
> 

Applied, thanks!

[1/3] gpio: pxa: select GPIOLIB_IRQCHIP
      https://git.kernel.org/brgl/linux/c/e2d9a7ead8ffbf562c4f38d3115f98d1933e360a
[2/3] gpio: mpc8xxx: select GPIOLIB_IRQCHIP
      https://git.kernel.org/brgl/linux/c/8da238b15cf5eb8a8dd318bd47e4d6050f5ca5d0
[3/3] gpiolib: remove unneeded #ifdef
      https://git.kernel.org/brgl/linux/c/274fd5fe911956cdebeeed65981b7182d57c2773

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
