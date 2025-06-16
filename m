Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7422204863
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059784; cv=none; b=JwK2Skq238JYWaE09m71ZZzz0sczcNG8FaoLpqkUfpIsxYcxMetLbtg5gE//Ac+mKtfHz2ucpm6oVjNBXHS1H3lir/pVptl1cmM4bhTGfcXMFsU5QQ3bpNtMe+8rnumG0IxDeu5cttj82nthd3hHMvL+3DVowEMckrjfDZwjXNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059784; c=relaxed/simple;
	bh=XmwoZ/1rXiFFhp5Ery36mi7aKpTwkqPeml15koxIPs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PWHxA4fOoucCTjVURWBeRq/l02g2tOkyPLV5qR1P6ktgcjOvoCvh8N9wz0GsEH2l6uIV0mmLZlX5Zd+GE3qc+OzYZDL2zA9c4y+na4g/BCitk+u/fAEJ2AxmMFwvxqDo1CZsxqnUrB0iRpVSzNdOvB7pfv/PqXIX8Zo1H5Nw2Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bB22ruTR; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bB22ruTR"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a375e72473so2345792f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750059781; x=1750664581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTU9Zax5kLpMeKPmyeLAiww8adzxErGgDJ424AqFWP8=;
        b=bB22ruTR1CRc4zosTiyYLHOhV3+wlgE6YQfD1gSlbnsY7MzW3GJSqvCD0uKJfmiJJe
         m6pCkdGQ/T+N6n8F6RuGTLmLowFvLkv3FMxD81Uh/o3nBDazSZWqKPIiKyVEFroHMlFb
         ReDTckMqu7lxNCq89O446IvHrRd+8wqNeJjqAMj6U46r4UhcxSrRT1mYFLnWd5PT4iki
         JZl47NO10bZSaR1CnBh9/Z7Tm5yEZJwwcDwBpOHii5QtKYRNZ4hcRy/1sAtTSAJVdS79
         u1R+oM8OnLCi/jUmhQlPZ1pPOqTb3ib+jlrnnEL6m6/b5mf2uARkKnipb40vNIhA+fM3
         uGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059781; x=1750664581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTU9Zax5kLpMeKPmyeLAiww8adzxErGgDJ424AqFWP8=;
        b=kR+4xHHuSlAxG7C+KL25KbjKCHIf9KgfFXYh/o5Z8WSMpQDydYRvEyKTNAUmD/gow3
         bOOGYbm/4y38BpyGABLyncMNekfEEdZea+Sz4eUbH7Bml8iPpwiu+uBvMoQXESyIAfED
         Jd7vlSVrvPHZNaZCxnAWIa3xlo2ITUwh2jiAe3ozVIGpv1vOmPxop8RaW5AeW1Uhl0vJ
         3JU8NRjOwDqhYsAvl7r0SkpldtBnL8SPBGelLQbiRmDZ691rIErlyHMhlJqC03ty9fRu
         OYIZQld4/O1wGq+Zy5Ouef6aWkHDNuzTWmY7xCcgj2D/tAq1dh/X2EUkHLLKY42kpVzU
         piiQ==
X-Gm-Message-State: AOJu0YyNv6mUSq0EHRRytvvc5uRIYdYgSo8CUOf942FaWVLXKdKFQWMt
	FQ4uCkL0O4XjuI/FfW4XTsLoG5MyNDeFejtNtyOmiPqxOq2BKTfoo2sKlq7vohFrfn6CVPes3dU
	jXVpr11A=
X-Gm-Gg: ASbGncsW8Bvunedcelk3Hthv3kTUPRDh/iKzr1VUY6roKE/x8GuVNjFJYEUAKVrOVYL
	hzAs/vnJl/1otKNz9FHQcZoriFttrHKucca9OCat23bymoAmZzH5LwCKl7i/QKR8xUzD4E5qXlY
	fuuIrLey/S+wdx09Lc8n1y1jUGXWOXqV2DQ3fjdy8Fi6iX/dgfSdYEiJW9PZT8HA84Fbm1S9QhE
	MmNnNA7HHjmXUhHSTvcrOLmW8TYBmk/aA+x4ePtqd6af/eVokC2C8+QjZHqXc6DHrPJerF31eQ/
	akJnRSpRJZ4IQFKonnqbwhSZ8Wd+s58lvGTqsjuuAGMgyNk3LW0muIPQASLsOjc=
X-Google-Smtp-Source: AGHT+IGNJS0KEiSwDJqSBbXx8uRkNhJkRtvXE4ajBKXtNWO8NPC5+V6AIpPTIVHjojheL91aJSa8eg==
X-Received: by 2002:a05:6000:25c5:b0:3a5:26eb:b4af with SMTP id ffacd0b85a97d-3a572373c7fmr6714675f8f.18.1750059780880;
        Mon, 16 Jun 2025 00:43:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d1fsm10151340f8f.2.2025.06.16.00.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:43:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	tglx@linutronix.de,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Keerthy <j-keerthy@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] gpio: Use dev_fwnode()
Date: Mon, 16 Jun 2025 09:42:58 +0200
Message-ID: <175005977568.15490.4738567496048769972.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250611104348.192092-6-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org> <20250611104348.192092-6-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 11 Jun 2025 12:43:34 +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: Use dev_fwnode()
      https://git.kernel.org/brgl/linux/c/7b2c2f1eb3914f5214a5b2ae966d7d7bb0057582

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
