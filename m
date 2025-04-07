Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32206224B1B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744012590; cv=none; b=WXqLGWk5qQmbGEJSjaCMLQ16D4GFNNMmWpFHVXkzKPn3AQ9LSoxQVVXfw2Bh152H+rsDkKCcpmcHoDvjn+D3X1w3cyQiuCuF9mxzqsF4YIPc71xbKGSPyBkBXcmk+wEw+i/ApyDDQ4BGip74dIcFd/pDzz+pL+rv+Lab7jLTLQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744012590; c=relaxed/simple;
	bh=PbY2iBAdM5uxUm/Yc7ACLFge/aGVZH5yA6UNUuaJAC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NHG9tsAE0AoQIwtUXtNuM0C4AaTImAUC0VXTwzlQA5z1ZcjYG49VKD5qRbeCYB3lmGDc/2WQOnmpx7xxjOD1idAN96vtX5vQ7HujplJjQZmYuo/TMAlMpe7HMrepJWNvhR7GeA8dIiA81F8yRwGyHiBjLD4MzRxvZvJz0kXBnXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BwPSTjes; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BwPSTjes"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394a823036so36604885e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744012587; x=1744617387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gk3PDXrCi4i7kOY1hv+ABXdA6tfPrmWwO1BXasAm+5Q=;
        b=BwPSTjesCiFJDV/QiCsU2xVJhnireEBjb7MLV2nnQBCYgyH1xy9NjwwuuaFDa0eEWL
         9TZ/D8mSpqAF5kdTRlKjL9vZZVTHKZqOYUYRDkYIKNn1h8phKDKcviFjH3fkJwLwqZeD
         wMHAGUmrK1Q81hhEitmUWrbRZKoSU3ZAOM8adPkm8PxJAwQBtHY6fySfn+rZKF11yxnM
         kTOd4lv16tL2dTtNYW33qK6wQWl/pmxajs0cK6LM0fksVwc9GHNS2t5Rf9gBATV8Futm
         ruUHSZbTwu2fx8Zk8fWWnDfxlompsXzFBdS/uT6cxTmcSK47yCA/Bo9uZ6zQuHSxYLEN
         BfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744012587; x=1744617387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gk3PDXrCi4i7kOY1hv+ABXdA6tfPrmWwO1BXasAm+5Q=;
        b=f7D9vIzdKAPwYoAmngnVgxzimmYtkihR5S2zxk+YNghemhGj5whOx4Sa6J+7w1bnfz
         cGtdEB2M0jXIrvhZLV2iaQvgvnShOl64/11WIjK90jx+TfcEwyk0zW8EYPANpacaXKds
         4kXeOoyGoMRBakW6rdfv7Kht7M49FPkjKiIf3ggdUIgBwCGnFc9Ixa1A3n7/mPCIiKqS
         IKpnliiYPWmW00F69ShOj9Fux6Q/Chs7S9X4c8D93asBM72ZvU0e55k7JLiOLy3NxCCY
         yByqY1l/IEL2wG25PeD3+SE3tSjmKAQ82xMdQPgndLsTia++COAhCPK46NKFOgQYGpNI
         pNfg==
X-Forwarded-Encrypted: i=1; AJvYcCVvepF4r/WbVJKgrJBM95n39spPzKaf+a0fpBHy/yn2IklJGWifJF4BprqXHVvKeBD5oTNpbkIaleH7NxU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo3JFS6ooMbhVZ8CDv1V1njlF56knqjoAaG5Vs05a9YS9p4W0T
	Aot/M97brhFb2+Bv911oYHiObjjmA73O99jOaRPT3Srul7iaYvTbh9YbXjf0+Ag=
X-Gm-Gg: ASbGnct3f7Lo1pR6vPMs++NhJQLn3hBArcd+I5VY0oBqRLoOr/u8iZWWOFN/zOLWmIr
	v5EACQqxf3ZCWgwfwpN1+wD+nrDMxz/XXPZQtEzVkguYreif0ljOATAA6AHC55Sht+E7DEWKAds
	HGSZn1XPvPiL7pTXlEpvaV9D9BA+EHF+40HWjWvZF2Z6Ell+gmcM44hNEQvseSpsNzf27TSbhg0
	11B12Go96cRlT8DjCHYyZMvlOsf4sszlWuydfp8bsuncIOVSmcHD3QmcEEDFUFc8UVYQE4gxxcg
	tNpsuivF1WAbwc+KDtECaROh+IfvRHQZQftbQ4Zs9CkGO9EykeXzAZ4=
X-Google-Smtp-Source: AGHT+IFuGAUYDVlIZ8EonvKfI1JZejqOAN2FYZFOVuldP7Sk6j7fmFby9VeiU0OPy9L4I7Jcqwq13g==
X-Received: by 2002:a05:600c:2157:b0:43c:f87c:24d3 with SMTP id 5b1f17b1804b1-43ee0878e6emr46890815e9.20.1744012587467;
        Mon, 07 Apr 2025 00:56:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342a3dfsm123483685e9.4.2025.04.07.00.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:56:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v2] dt-bindings: gpio: pca95xx: add Toradex ecgpiol16
Date: Mon,  7 Apr 2025 09:56:20 +0200
Message-ID: <174401255666.28656.10157337361652941194.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250331072644.17921-1-francesco@dolcini.it>
References: <20250331072644.17921-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 31 Mar 2025 09:26:44 +0200, Francesco Dolcini wrote:
> The Toradex ecgpiol16 is a 16-bit I2C I/O expander implemented using a
> small MCU.
> Its register interface and behavior are compatible with the PCAL6416.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: pca95xx: add Toradex ecgpiol16
      commit: ac7d33f3899762b5d0c90a51a96ea11b6d7660ba

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
