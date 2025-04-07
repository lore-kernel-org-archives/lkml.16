Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B90122D4C3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 12:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744027331; cv=none; b=mNmYeVQBLLaVv1o8iSLUl20Vy8VYGdDkSq51wtxR3PPvkaJ0osjVSyMCuTQF3sJ9BlfIzau+NjAp7mCfLcwwmqoUvPKZkDaMYnZo6Lqw6Yc9egizOD1U5Ed2QV1kQAGt2AcxhV8f6Lnnw8y1TBRdOE2rpLOwSBA0JxFBpClE+SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744027331; c=relaxed/simple;
	bh=++rBUctgo7WqhcGy75JwrymHZEqQIqCCai4AuvewSxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WQpMzm6UzzVMQ6mudWf602KpJn48x1GKQK2BN8pcUWxi4YoigeEQalz83j73iPiogekQFWo58VUNZ/eciZjzOQpbOumYhX8LMBsHv9MbIvvAILjOHKXH7V0GQTIn3XaWfvtNoJTUqjTApnW7kuCtkD3qW672yeGgKsqVFoxykgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TOZJpPZ/; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TOZJpPZ/"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-391342fc0b5so3345795f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 05:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744027328; x=1744632128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pnqaorkLrZEV4we2FcGB2lZ+lYdMYMSEtj/n+/qjUU=;
        b=TOZJpPZ/V+tKdKYgAUy8fLQNl9nNG5fzYXL2EK2oyNZHSufY2tlJBlEevjxKm10cfw
         RucL3DxI21acif7DuKu08UusDS/HVgpMEeT4a1IyOq71m5nZAd/61/TVzUQGmSMy7N8u
         FwU4N94D4wjQTu8cW3sxivJYEBRZH2EM3ZtFjdGFdkmlW0/I6EIxOKtBU72Nky1HCNlS
         Bkcpp84uz5Y1m0qsYaZW7fm4LS65qOWz8ULx6qU618j61NIluGAmKIk5M0eRArXZRlkg
         IKJcr3C1wiQ33PrgtdhTyFF8xtgBZrArOn2ZQB2nF033iulm5QYT50E2TVvheznkTM2z
         IUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027328; x=1744632128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pnqaorkLrZEV4we2FcGB2lZ+lYdMYMSEtj/n+/qjUU=;
        b=XsVRVnhpCPuuK/kTBLwI8CU62EdAdHjdfoyhyA+Sv0D0u0pQGYRinRKEYXO8B8e7It
         h2YItuvcttCa4WBcOfrBYgVB0aHB/osEsr4CTFURvey8nTYfJ5o8RX1Juz1VrnZaz9AF
         VP2xe34DJHkwRRSzVP9XA+aXOF/FLlzjT6niJ1MiDwDuV0DFgs8Pf93j6TgQ5H285ios
         QiI+ZCAUjGr4a7AStnuksfr2x7NDfbOAVkNl6PmFQcS+jA/6ZGz6jD4v7tiqVm0IRmLl
         ZlRBM8x7RYzsw87LgEOgzjkLHSMH8KuH/RsrMWyjl9FLjRdIv8zgWICOglAxAgUtJT8F
         JQlg==
X-Forwarded-Encrypted: i=1; AJvYcCWBG//xxDB2Z2Wt6EL2PuusqcRBGd0Ib81hB0U+ssSSCjoIafaEhewWQ7bc+ZAHjg9AQoNJMg2aQRAia34=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK2+v48nuoUqnTjBSpq30Y9l9fdPiDoRLhceSHGvPZgxItsAV7
	Vp2UGCTNs2wmWbe890oRD6xhSzwg03zk3/4mHfebxLok95fGoJj6M3bw2gm3FiQ=
X-Gm-Gg: ASbGnctoXizguO/7geYI3/fFVSkY3rFkiVAscBc7i03ScA0WoOUH/TvUyHQ1LhPAHVT
	uzU9uFRAUYXCvlG9paT2EJKcmAvWQ21Z0raLUX6vLzM15UDQXu47Y2vMVhQsZziS1gkB3taG+B+
	x8zeJjYNInIiTF1U45pwoS8Py6vKQlD0BAOSGYLtqDRzHDEF9wLRH7RPTc6O+OEUa6iuUsDRtY2
	swbYYyfgiBXD9hJbIj/NXoT2XndfM7/YX3wwJQD10qtyHBb9E1L452lXS2vVPERYn8LrN+UKiI3
	63UjasWab1ntkAJAelHmzCT0bQxHse5bdcfsrpyXCfFA
X-Google-Smtp-Source: AGHT+IHQzfBlcrdH5SeBUOUhvSnbXFRgYmEUvgyqEtRbmlRwoKeao0pvP22bOvClSu4BfKDmGCcmaw==
X-Received: by 2002:a05:6000:1788:b0:38d:d666:5457 with SMTP id ffacd0b85a97d-39cba982600mr9594792f8f.42.1744027328186;
        Mon, 07 Apr 2025 05:02:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6796sm12061650f8f.31.2025.04.07.05.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:02:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	James Cowgill <james.cowgill@blaize.com>,
	Matt Redfearn <matthew.redfearn@blaize.com>,
	Neil Jones <neil.jones@blaize.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/3] Add support for Blaize BLZP1600 GPIO driver
Date: Mon,  7 Apr 2025 14:02:05 +0200
Message-ID: <174402729978.46356.11201188338288043335.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327-kernel-upstreaming-add_gpio_support-v2-0-bbe51f8d66da@blaize.com>
References: <20250327-kernel-upstreaming-add_gpio_support-v2-0-bbe51f8d66da@blaize.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 27 Mar 2025 11:27:03 +0000, Nikolaos Pasaloukos wrote:
> This patchset adds a GPIO driver for the VeriSilicon APB v0.2
> hardware. This controller is used in the Blaize BLZP1600
> SoC for its GPIO interface. It is essential for upstream
> support since it is used to provide signals for the
> Ethernet, USB, SD and many other interfaces.
> 
> Adds the GPIO interface to the Blaize BLZP1600 SoC devicetree.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: Document Blaize BLZP1600 GPIO driver
      https://git.kernel.org/brgl/linux/c/5de6156a402b2d2432767478fe75c40f9755232f
[2/3] gpio: Enable Blaize BLZP1600 GPIO support
      https://git.kernel.org/brgl/linux/c/52eafd817651d44ab006c83ebd98f5dd687df2d3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
