Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB37924889B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750317322; cv=none; b=BEpQMUu+0XEB+6O6m5K6Yv1wiqj0mfcxNqlkYgtTMmOv+QT58Cso0NZ/gSeQL+O1EdHsCd5tUbPs2B/tL6/6OmzH7Mwi/YnRXcOBa4cLEYGGCKsOy2Q6M0g5F1sR4vQx1o/tW/c9zkHcwJm2EoAf9JRyOjk41ObhW1daVlwiKE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750317322; c=relaxed/simple;
	bh=azsM6gK73QrTaoeRLkwV01gG94aCop9xxc9pn65tZ20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dcY9J0ENGI3ES0a0Evjk0LD4/57DZ5iAFAwujVs3hteE1QE5aGcLVnB2iuGjTvOZE9Jlkp143DIKt8UxSSEJdkBfxM24IwcAUs/+79DCZ1Cy7UUhQrjoRiDbFfDpIEkq4DgJ0pqdCfTgbUREQhBEC3ANig+b1irGgD+wbVgOXPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f5BCfJoQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f5BCfJoQ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so455118f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750317319; x=1750922119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKzUUF6/e+HfzK3546Xi+byshZVmod6GzlMs0shwqpw=;
        b=f5BCfJoQrXkeSyZ4Z9e1oqJ5Unh9JEOZIBsUfy2bfqXMz9DWnkT+JDk+DCbvEb1EC5
         6uD9Zu3WDDlR8lWhoUy3Sow55so2WveSQvWf/eLaGgv91MEkDAZwVTz1DIBMCSNEHALI
         VGZr/dlxlaY3ZHE2N7Pki270LMfwHmbetXG6I/XJPF0GaoXr+/Bj7MZQTQYjcC0gpPwR
         Wt3LO88VPZQdN2VwN05WjfN7I+TLkcU50Io03KyPXovUVEt2fXVDiP7NzlL67K9DX89I
         IWXIzlg0c8g5ScgkOSjxGNM5nmXG/bAbWb8ZQbzcboZWzOQeFo4Bp3hpLXegBR51ZXG0
         HYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750317319; x=1750922119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKzUUF6/e+HfzK3546Xi+byshZVmod6GzlMs0shwqpw=;
        b=DxeGllZ9M/Y0qZuka8IW8F096z4Yd9Ewk3JDH/Asg6JSNmV1Sq2cNFhU5TZQhdJepQ
         yIbqzjArUn1z7m6ucnPN4DBKgt2ePpfKjmFR111TWQf+uq9rQG0qXA4iExkiMlGE7Ul8
         MJ93rSYn7snwy0KarTIDtJuao6Kf2F5UuxwevEsHVOug3HbcdIH5CdBGKW6UxZdkCIbO
         vB3ued6YOB5zNQOR8QtQ7odgydrJbX2WSC4Fk1n5QoQuYR1VeR0qTHYtlByW03SxYkIi
         vl868OwtiVvzUVsvgFBkaRmpuwbNZ+56QNLlC+Wir/xMU2m8kj3IOMcX4MrS3qK4P3q8
         7RDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL5KV77oNcaWrGab0wdzh3jFAZqv0aiNsODYuRb82NdVN6J7EnGehSnGhAl3R+4jvEY6hQv1A+lZrMBAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI76Nky23kQpYvoHLc+vwZRIgFMSlrQWyMauQX3rMuYIWR15jW
	HxzLcS2JU5tkciwk3Psc9Q9VkGN+pugy4EqlPFrlgsasaxZJK8jwnGZNiy7MDFwE44o=
X-Gm-Gg: ASbGnctQWPhBOcCLRpS4+XFIro28vZekiQ0SHgDnq2Uotqr+5Fq25qdOz+ZsWJcoJSc
	ZoFt8nUt2WeaNIYx9VXYM2D6G4sczGoxw2TsXAjWHB24fi1DDVII12W2kifgVDb04ByB70et9BY
	hc1/rpO1RbLxVxGL9n1RDEdq0dc5b5bHITGRina0TmGaGFr1RKYhA+zBIQV4a9H5WjWK3fvWksG
	LqiTfZzyeCKmsc8Mga8S4ZI7RV10nEKOaukXZ4I6qFfxNg15dkN1lujRZS4gBtpbOqMZkyf2Sxw
	iYGlhnk2FDsQBbdyaP10+pw7e1aAFdAcgpxe2hU/1MnnCXO6IUgy5LrF9jzu08g=
X-Google-Smtp-Source: AGHT+IHzM9CDNvIYiN5160aK6wIt3C3U1tikuzm2U1UNcFFFcuB0cpRgCgEW4zxacwUIq5YyRNgINg==
X-Received: by 2002:a05:6000:2f84:b0:3a5:1241:c1a3 with SMTP id ffacd0b85a97d-3a572e99653mr15408173f8f.50.1750317319295;
        Thu, 19 Jun 2025 00:15:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a578510edcsm14685319f8f.8.2025.06.19.00.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 00:15:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH RESEND] platform: cznic: use new GPIO line value setter callbacks
Date: Thu, 19 Jun 2025 09:15:17 +0200
Message-ID: <175031731500.9019.10505927253620736687.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250610-gpiochip-set-rv-platform-cznic-v1-1-30afd2444756@linaro.org>
References: <20250610-gpiochip-set-rv-platform-cznic-v1-1-30afd2444756@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 10 Jun 2025 11:43:58 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> 

Applied, thanks!

[1/1] platform: cznic: use new GPIO line value setter callbacks
      https://git.kernel.org/brgl/linux/c/9da895e97057ad946b2e727694af3fa5ee51d527

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
