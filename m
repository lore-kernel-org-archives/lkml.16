Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD2C19066D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662704; cv=none; b=EWhcjbzFW+SNkEk+lGLx3J41Ca4TmIMKLJeC5rSkYGM07p/1sKx8SPepUlpcD6QktwhUcizUOg6iv39tWEN71tCNYq7c1XjMoEn6cZ/mjZUNdkWnnfeoMc3DhTnKYgcSu07fHoJ8PorlXbHlLcQCPul/VgKdqJudzc+KWLFE+Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662704; c=relaxed/simple;
	bh=2PSxxWavILOvietk2Mrh+EphTILxeogdqSaJNRrG06A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W9/Ryu8Dx1nI3o2Wt70Wq7weGZBi0VBHXAiu5nyS+849Shtyo41/kioicCyvHFH3QrlgTLHfFcfsJQEo6GJ2yYuwfqsV2DYGQkcfZERweeFdWXh5v59eO23bcTXpwbfZUbtD5UMu9cjkWNZUm6S/0GQ5KKfwtWunHwL3RPDdK+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SbFWs7t4; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SbFWs7t4"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39d83782ef6so3775598f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744662701; x=1745267501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8k1lPJdEDsaBNNdAeLAeb28VT6mxpEKn5noA0tSe1oM=;
        b=SbFWs7t4fDAM+eTfuZTJrCs9LgbfkGAXaaqRj3nx9JRk4OEbmD1UHfyaWHC/OobmqB
         5F5yqsa7YLeDdz4oI/0zjT2iEmxdTkUvGP48zIRKeBB/ZQMJ3px5kPdt5znDLYKSKSIZ
         8fMDt6cxQ3hwafNDvUbTYqmn8Tsk3g4OmiB6oGJjv0Dnn+5vH8XFNGsC19J1Mu5ULQ2d
         6lwgnvWzO6P7Jd9qqPz1nQv415+CapSY9uioetP40zIi3/ErkP0LeHy2eM+F+VapOq0k
         TJ+XGabGYfXvi9Y4j9HmjaYGEIyGPsAdjlH9OdUz/2qp/gSvxd3fjYVwrTvmMwADwzXX
         l4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744662701; x=1745267501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8k1lPJdEDsaBNNdAeLAeb28VT6mxpEKn5noA0tSe1oM=;
        b=eWS+BwVFfYV4Lt3su20XGgVNxckVo+bUPwTT5G+7nr2By1i0wK/PBVnGxJvz7d8Itt
         y6RNrST3CMgydGwdc9xL9kv4iL/4I/4cCcYZ5Dpg8RVjLVgff1MSRiqnMlaR8Q3crz2d
         60ZGZJJJvtZ3qml4xmtPLIpzJqlq2+4mMFmWFMwLCNrVjpCbysQlPaVYffrX2CEj5jiu
         a+vBNmTXaVLzOxey9eHegqWujgMUmoXdKXFkVQ9zWpF7x9tfIViCcpetN4VF6Ni5ruzF
         k1CZxBwg3kqlCzYWyfQkYG2i3/+KHi96VIzPz/CzUNEcSNEtrQF22F9wImlXc2l6KV9H
         0m+g==
X-Forwarded-Encrypted: i=1; AJvYcCVaVPfr/6FO8WuSmg1XgW4a9+yOSCcbnKhonTCg6LkRY6CXGfbQm0loajsvEQBLMxOoaPAGHWAGfBJP/cc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVCw8Kav1lhdLJrajXBdmxpj5ub4cLi6f7q6DieXD2OLrAFviD
	NlZcELrgqXmnl0wzR9yOtgnKXoRduPfz/gYdkCNSqzY+luKz0rxCqnyarkFNTQg=
X-Gm-Gg: ASbGncuil0SM6ZABsP5vNdXLKsWfpqfe/SRMwvxVe6utoQ+K1fkpDjJdRif7pHv1JcU
	I6eNRnKhg8WyQ0kQj+HrurUChmq63ObN8KgV9ts7OVdyDbwnU0MtLSaT9smaDGTU8RJd9trJS9P
	6/t8CgSYwL0/0KvDON0GTLZ1RvW7REOIya5NvbmskQaVD8zscdwWx+Q77+8CZLR2TBnaDHqM/5F
	hDBe6/g8G2uO/33w1mxbG4COEQ+w9tzLREXXrbOnPibWkEACyiUVi5VkJRYzYfm8BRu4XgewjXP
	aTxSsSs4aJZkfFuTHB8BqTs6EOyHbgb0/iOJ
X-Google-Smtp-Source: AGHT+IGjweXG0QAiH9p+N0mLmFNs5VroFjk6aq5NkYBlrF543xeFSObf7dyVUt/MzAbe+aiLyZzklQ==
X-Received: by 2002:a05:6000:2582:b0:39c:e0e:b7ea with SMTP id ffacd0b85a97d-39edc311dabmr510216f8f.20.1744662701607;
        Mon, 14 Apr 2025 13:31:41 -0700 (PDT)
Received: from brgl-pocket.. ([2a01:e0a:81f:5e10:5368:1715:4c6b:8be6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445737sm11722553f8f.88.2025.04.14.13.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 13:31:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: GPIO_BLZP1600 should depend on ARCH_BLAIZE
Date: Mon, 14 Apr 2025 22:31:39 +0200
Message-ID: <174466269705.5429.17461051259009988594.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <a75af4b623579a193b4a59350c063969aabb5b71.1744190524.git.geert+renesas@glider.be>
References: <a75af4b623579a193b4a59350c063969aabb5b71.1744190524.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 09 Apr 2025 11:22:35 +0200, Geert Uytterhoeven wrote:
> The Blaize BLZP1600 GPIO controller is only present on BLaize BLZP1600
> SoCs.  Hence add a dependency on ARCH_BLAIZE, to prevent asking the user
> about this driver when configuring a kernel without Blaize platform
> support.
> 
> 

Applied, thanks!

[1/1] gpio: GPIO_BLZP1600 should depend on ARCH_BLAIZE
      https://git.kernel.org/brgl/linux/c/df9b3454a00ed9e4c85295611b28b7041fc2a1d9

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>
