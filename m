Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1343E28FA85
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750242145; cv=none; b=kwNm36GqZkdWvFXx20d7K2NELcKC7dTYig3TjjyVRR2ra+MsScz5BO7fGSMhaQqTTyIu0Of2RNFy6fG66Wiz1f//vaHLNMKUPw2JRusNYIzT+7dp5ETuoM5gcGu1AR0Qoa+RKVOpF2ykOPlAHuksUBF3piHJSrxkC2OJ9+8WY5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750242145; c=relaxed/simple;
	bh=+qOQU17OoM8/KAmW2Xgq7JH5nbAjGTw3ExvQ9U5cu7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C1REEO62sCEF0e07/FJcBY/t8qfV3pUSTQybSa5x9FzqhlTkqw26JkiBAOFKESd2y17ykP7voWNwgjvFgdhL4jTULpnXTt4WdMJn+YAhlcZVli0m+Ur8nVXVNZihCPcv5orUvy9iyaPw5AtexLhgjBZBdaz1a29qmPliGrzBdfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CoUrotv/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CoUrotv/"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso60215595e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 03:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750242142; x=1750846942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcY0E63xRmQxwqQZ0aZVZsL1+UafBW6eRdmA8hP7p/o=;
        b=CoUrotv/z3TvglJKc4tf/X3/DHlMUI66sYQSzgfxbU02AFZUkZmoSee/nKHJgCvIzw
         d0I5q+9khi/TN1Z4gSQS0xWCekA8ynsY7kgZYyDm/Yrtho5i3njGJVbHUtIDQAWIkHZI
         xujqpCINLCSgKNQT9deB/wtCq6Qis0aqE+pa+N7fyYkg3kDI1Hw1mzHwlMCPR1F101+0
         nNelRJ3WzG+EFNxesNf/jmXo+VsNECFv+O3eRRYitGdoDMW6+aOEk1YXG9CnOm2v9Wwf
         LBYupTbXNPYuiq2D91uCga9L/qYQXF57+3DT6Sx818ejkLprDrj4iEfPqMylagKcWqNo
         l0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750242142; x=1750846942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcY0E63xRmQxwqQZ0aZVZsL1+UafBW6eRdmA8hP7p/o=;
        b=OWuXDHCm2HBSeaF/656XxtFeEiRU5MYD3UFsEF++MvHsO+R+lZBaukU70cW/L2qYHa
         BtFyM6/8+yvDGbB3e02GEkseL96Dv3zUEm769oiYjy/hP84yUvJVKEDG46E1Zc5DzlLN
         Z31WGNCFZ0EqII6DrlwOgDGh2rn3+ZEJo7K60aWJ1cZVqV/Cwg/Qy92NF300Amzl0ssG
         /dCcKUrgLkissIHEPVEWWtWinC5PMZe19+PPM1n7WTQSjiSdQ9ehPtKigEbE3CJZFxJu
         kVghp1s8qfBes0E4EyNHkWlcn4ldqZWFpqiwnSdUqF8o6qDrhy0/e3nPa3fYAWUOj/Q7
         cGbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpDOqCJK7KftOmEVy7Xrzz8xZgxBb9Gb1FakMzbmJmZbT4FGPuRfHql1jd4lUZ3jVFrVUSkiZVR2Sd5IU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/MrlrffTL9uJTbb4COl2EP++IZ2tphHhFCU6y94S3GFrkq+A4
	BFsekRHCU4VpWu+8fVdApmJRWZsRCBkT1Cya1HGVny6+ZyPmv2iq99SvRtmoHE5TxG0=
X-Gm-Gg: ASbGncsJgOTTJvAXNHxqW2Z92f8gb+/mR8VXZPSh6kxG+uaLdold8iL0Kva3lF/95mI
	k2vigAIb8q0mUiZmd8HqgxV2xFY065moQRAFz8K3JdOA5own8nqxCjHoHAkSuoQNqEL4r1E/3f8
	dxzBiO4k8Po4K1ZVVWBvQoIqyVp/QjBCkorNUsRfaUkmoCBSRX/AmVaqpSdREqr3V89ZODNu/oo
	oZKdqRAguDbtdEtjZ2HxgpDB2aHMyd3zoRmk5YU7wyBza1iCUzbTpYz19mu/M8WfFZvGOCwOhBN
	iZnWoM05yM68tcMYDmOn6pB5iNaub0DbzpXBxq+wrZ8Nid1gh8dp/386HhqTYA==
X-Google-Smtp-Source: AGHT+IHn0n3NmTaxbvzRw1SdIFvw3ZSwW9W0E1EQegpOOqY+iv4O0dkFwIU4AIp8rNLGr1+PEgFNrg==
X-Received: by 2002:a05:600c:3e19:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-4533cadf928mr161514965e9.30.1750242142318;
        Wed, 18 Jun 2025 03:22:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ad8:9ec2:efc8:7797])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13d014sm202946185e9.24.2025.06.18.03.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 03:22:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: arm,pl011: Drop interrupt properties as required
Date: Wed, 18 Jun 2025 12:22:20 +0200
Message-ID: <175024212201.53500.363665357985105443.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250609220900.3035642-1-robh@kernel.org>
References: <20250609220900.3035642-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 09 Jun 2025 17:08:59 -0500, Rob Herring (Arm) wrote:
> It is possible that the PL011 doesn't have any interrupt connected and
> can't be an interrupt provider, so drop the interrupt properties as
> required.
> 
> The LG LG131x SoCs are one example of this.
> 
> 
> [...]

I changed pl011 to pl061 manually.

Applied, thanks!

[1/1] dt-bindings: gpio: arm,pl011: Drop interrupt properties as required
      https://git.kernel.org/brgl/linux/c/7b20980ffc11514d8849811857d915001236bcfa

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
