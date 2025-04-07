Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21943225402
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011742; cv=none; b=Y1ZszdKYjMVg5E/Vm1Uskt3jLeew7cOYR2qReZZxN0wdhTYDacJzf5P9QEeA5aqa2sHrdfSr8D+zJ8godtvL9EjDKENyk9LvW6p13RVqSXmjLajcn13BCrrQQ9l+5TJ+UDP4loEyb0WSKgglbECm6P5NwcyZUBFQV3DFJvAQAWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011742; c=relaxed/simple;
	bh=V38eq7FCelCROs42raMwfhM/55ImU/2u3l53cm6mEn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YV2Sy3n6fTbwiK4ipwQR+fkrzQhWU2hRciLFiQ80jmP/xC8yW+QPslWJQ4rmSF9AAYVHqt8iJn8+fmQbqDFTZ1yYXpgFgIdrufgPyRKZK9e2cTJuKzVfm+hJv+9lSm88GhglmtHZiVHhiwqsa+nGmeNKuGp4tzq3qIz3XNLD0lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kjNHKqEr; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kjNHKqEr"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3913d129c1aso2712006f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744011739; x=1744616539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaxmJdvdhtX7hTbnte9HAxlvmD2ZRh/FVwxHdpp18yQ=;
        b=kjNHKqEr+q1fYV9nEQxljZd1AFCuIR2oo6xz8NaZJhxdhJUkWuFLOs2r2e/PCbZeNW
         eoG406Jn9pArw/E4qX18RnD2jgBp843kLs7jT7FalwXhCNOFBUkwxFEQVFeC/ZfJp/aN
         1uzGU/vh1DiDVMoahseXd+DrY9Z+3TH5YIpDTLgB/v1kb0FJeGpwxquTT8lh1NjApujZ
         +h/WmkEKuDZROKRC0QWjaolC6E9uJP5JtH8b2eGDchfMQ+TE9hXB4eeM1p97AQeKoO0u
         IlmuzsvzpbdKMDtAOBpZ8I1FvCp9cd3jsmnEaSEhVD9lrLoshJ3fzeXKUUEYuE1hnTFF
         f+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744011739; x=1744616539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaxmJdvdhtX7hTbnte9HAxlvmD2ZRh/FVwxHdpp18yQ=;
        b=ggC0jNHL3MKCBShBxQL0S2sxPvlkxBEC/eGwzF29r87nj7YkD5Di6Mh1Tnp+V8vlFq
         zZ2nQEOHgDCBFqRIw7YohCqSJKmMokB3kYj5Q5O8JhoZWBA3b0cbpd17FXVH6wcwm5d/
         HRx5Uy4moNWdhh+CVCvOtj7zDXTfiHOtKW+WmosaTbmn5b4Z0VB+kzKenVom0JA6VgNP
         6VOF16dPaiXtSr1R6lKUjhuHh4+oKzMFQLc40QovNsQ5RZxObCOASu22dyN92oM1dtEF
         gggHTi60+ngMT7j8EjCIVtjEiBODEl/gmvJWMoS6ITxjB7UeFWezH3KgeVw/x32dADBn
         Zbvg==
X-Forwarded-Encrypted: i=1; AJvYcCVpTMdpwx5f4XiLUoKN0xJQiO27f1ISL/qg3Akx6FKkdXuC3JZDDL5DIqkTqkcceXrFfaWiKQprRbtpyEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKlL9n8f5x7kLqCUSNHjin3DnsFrs7HAfD5+a1chhi74AcZLnD
	9wY3adTDxzmk+5N+YQ3bvpEifYwnNwGXiI1RRKjHOmY+/rD/bl4T5MTMlnIuYpo=
X-Gm-Gg: ASbGncs+ZEtEpv/RKu6a5zIO42fYIhk5j1y1Nva3N1CeZ3HDqTYtVzFnAMEU/HLMYGC
	9ISbR/4Igu2cpVCy0ZHbkMdQzIGKdrHD0Jad94Rhocfu9MZ6hEwAhmdLl4eKwQQJaz92NDKgR91
	SGMbj9bsMHDl5Nam4H2N96B2P/s8k3MpgPiV3Sa6ZBgcVaZha9dATpudN3uls9zEw2b//Ols1cM
	tVMgH7ltnWiqIweEotC/8/qdIJ/JsvqkpSZBINs6DCZlS74G1P5SXdHxTBvFb7/mT9SVEpfsVwQ
	0S3N2nWsGm+TagThk6nn+L6/hybVqm61hWTkFQQjg+64
X-Google-Smtp-Source: AGHT+IE6QgJB9JshmZZcPlhwCB6EA7JVQMD4x3bAODJvhStUzpBPIJijVfdsvTwXBWDIy69lNco/0A==
X-Received: by 2002:a05:6000:420f:b0:39b:f44b:e176 with SMTP id ffacd0b85a97d-39c2e65a08bmr14907199f8f.24.1744011739377;
        Mon, 07 Apr 2025 00:42:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301acec9sm11131294f8f.40.2025.04.07.00.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:42:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	krzk@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	andriy.shevchenko@intel.com,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: (subset) [PATCH V2 1/2] gpiolib: of: Add polarity quirk for s5m8767
Date: Mon,  7 Apr 2025 09:42:15 +0200
Message-ID: <174401173191.24103.4199616669647190339.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327004945.563765-1-peng.fan@oss.nxp.com>
References: <20250327004945.563765-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 27 Mar 2025 08:49:44 +0800, Peng Fan (OSS) wrote:
> This is prepare patch for switching s5m8767 regulator driver to
> use GPIO descriptor. DTS for exynos5250 spring incorrectly specifies
> "active low" polarity for the DVS and DS line. But per datasheet,
> they are actually active high. So add polarity quirk for it.
> 
> 

Applied, thanks!

[1/2] gpiolib: of: Add polarity quirk for s5m8767
      commit: 4e310626eb4df52a31a142c1360fead0fcbd3793

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
