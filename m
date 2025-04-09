Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B37158218
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 13:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744207097; cv=none; b=tKpA/O4kUh8ZRL7foC1pJP3ToZu7fRGtW7cYoszU8pQUIKBOK2SDBkAxjbJTdrtCT+R0JGqbpoAkrvqCfUTgfGHReCPR9KjLD4AacE3dmca4855UivC8KjtouCQhlJIT3c5aO0HRbTFQPWZepLW+FtxAGPwSj7JQeisbFkx2FgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744207097; c=relaxed/simple;
	bh=4wiG1oWsFDNXV9hkIUq/KfIYAJEAjN3PQIPKRD55XsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OdoVnCGmzmODFKhGAOmQYpOpOZRRCTod1Vv7pxVEckkFG1rRUPTorE+qyvbP8DTeuOvSjXcAn6pLzdunMDU1WWIqxkArzrI/63rvQqEqLAgrmMVnOozI9oE0fwLSE2rPrMHPFHekUMMFPZ0DqAlw/wTc6hGCk9ELQaRrQ8GrdNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dHlXrdwz; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dHlXrdwz"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so4213320f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 06:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744207093; x=1744811893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqNDGbtGLo2t+c/K/+WxlFYfgefVNdcRkPfKSN2QwBU=;
        b=dHlXrdwzjercwMVdpSmXID0fO6ArYPCEEeF4ZyCT7iP6Yr8c72Ya6u2XrWLDoilLvT
         FxiMJAYaTocj/0qbVqrjNbhnR4GRr3gLtmpZqJQCihGU97z6al1JKJvZEQ0ttp4XbreX
         Fq398AC1RvQaMo+aZzGQuGRhT1IUlNI5HLfsluqI51i2yisNHNY9puQ+AfRqDdaLF8Q8
         df/gTa0kQRB34Dm7AmjKgizCCjSpMhidE9rdFV1yG6Wjkn+GVNdsENDaUZnd/beK3T9A
         7lnmjVjNYGcJvMqUILp16LzOEv3ccW1Dz7oipHRI6xhduSQ5wcUdhYe3kVfWgCUcIfKf
         hXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207093; x=1744811893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqNDGbtGLo2t+c/K/+WxlFYfgefVNdcRkPfKSN2QwBU=;
        b=INQu/ob1icdhLIPxgEG6CPi6Ri7tzjHB0HF55x+m1YDfhWdNCIDSFBlFGqnzICxzYj
         1W9ui/iNlZit/awKrsd4iwU023c/Uq+eV6rssIJh/Ak6s7/0v1dn1HK2aGcKJK+LBYc7
         P/VtxlzrauWLngGten41pcgrWKXEGjbF/D0cTI/yQ/qwq2cy5IXhVt8TaVhg5ZNlWaAY
         KWt0MBWiCjtVGQZEQf5DYb6Fdfh5pwdaKXq+UkH/9ZcvxXBlTBR7rUuEIVWQV7Gbf4HW
         eyXr0Y72V6AqH8El5eR4ZN6iH1xcYGdQhx5SRmS7Qv9PYPjT1e7KcMcVZpt/doWvxHGc
         tLMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbuILsl12ZWj92yKlq4yzczqE1yQxLSYpZy6vtSibQUnj5qkSQac7JB+LY9i8m8DlEjK53+EqAF2tObCc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3wjj+2p9XCeDe9MJh7AbH6i6UE/RC379UFcLgisxjAa8TSmm1
	3d0WorE+UveWYZim+v+7rBuMJRSXgJbMDtmvt/6nXiGg00g+4HycXhlq1Y33ajA=
X-Gm-Gg: ASbGncvOBR+D9XH2R/RE5NI4tT/Jzgvf+hsZ5c+zQKk23hNcBxqH9aSq5rWIwnnGjsQ
	IIOQyib+VnEmS0EauOY9Jb+HzfBBBFBJ8z6IWeqNuNehKYr+EqpJGzT7r1rIykJOdWs9zSZTvl2
	D7XfX6bk5b6B6E0zZd6Dw0dxqULxOySIAXHO08LsX70Cz1ol3GQSnTD+jJMevO0WKYCDX3YK3J4
	ohELXhW3qKZol8VLFJsQkGp7e/di0S/ykRGFw79pRpk6BLY1EGDC+Od6fsYFoJgjCeKFMuTYKRR
	aYGXk9ixUizaQmiWr1x6rvD2SGwU67ZqnnIT9rms
X-Google-Smtp-Source: AGHT+IHIVX12DG4UJMD+npbr7T0nRY9vFkjh96NzqxVpkK8HbCN57Cr3fp13NFCMVTQ558A+SUwSQw==
X-Received: by 2002:a05:6000:1888:b0:39c:2688:6904 with SMTP id ffacd0b85a97d-39d87cd34afmr2909304f8f.39.1744207092923;
        Wed, 09 Apr 2025 06:58:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0a80sm1768025f8f.68.2025.04.09.06.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 06:58:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Koichiro Den <koichiro.den@canonical.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/9] Introduce configfs-based interface for gpio-aggregator
Date: Wed,  9 Apr 2025 15:58:10 +0200
Message-ID: <174420708545.59017.7631940211921310879.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250407043019.4105613-1-koichiro.den@canonical.com>
References: <20250407043019.4105613-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 07 Apr 2025 13:30:10 +0900, Koichiro Den wrote:
> This patch series introduces a configfs-based interface to gpio-aggregator
> to address limitations in the existing 'new_device' interface.
> 
> The existing 'new_device' interface has several limitations:
> 
>   Issue#1. No way to determine when GPIO aggregator creation is complete.
>   Issue#2. No way to retrieve errors when creating a GPIO aggregator.
>   Issue#3. No way to trace a GPIO line of an aggregator back to its
>            corresponding physical device.
>   Issue#4. The 'new_device' echo does not indicate which virtual
>            gpiochip<N> was created.
>   Issue#5. No way to assign names to GPIO lines exported through an
>            aggregator.
> 
> [...]

Applied, thanks!

[1/9] gpio: aggregator: reorder functions to prepare for configfs introduction
      https://git.kernel.org/brgl/linux/c/7a56efeabffd13a162073068b8e29113c65f9e64
[2/9] gpio: aggregator: unify function naming
      https://git.kernel.org/brgl/linux/c/7616dd97ae22e5f69b24774455673d183d4191c9
[3/9] gpio: aggregator: add gpio_aggregator_{alloc,free}()
      https://git.kernel.org/brgl/linux/c/88fe1d1a646b3b01dcc335c44e7b33ea510f620e
[4/9] gpio: aggregator: introduce basic configfs interface
      https://git.kernel.org/brgl/linux/c/2b72a5399eae25ee2cfd447efa3012f1d9d7257d
[5/9] gpio: aggregator: rename 'name' to 'key' in gpio_aggregator_parse()
      https://git.kernel.org/brgl/linux/c/26ec717c3b160d00a91e647c8ecfa33eaf645b05
[6/9] gpio: aggregator: expose aggregator created via legacy sysfs to configfs
      https://git.kernel.org/brgl/linux/c/09708f2b1cee33d585606932fb0ff5bb4c49f48d
[7/9] gpio: aggregator: cancel deferred probe for devices created via configfs
      https://git.kernel.org/brgl/linux/c/62cf750f23a8905be5cf4471087068c1fe2e2d5b
[8/9] Documentation: gpio: document configfs interface for gpio-aggregator
      https://git.kernel.org/brgl/linux/c/017ae62c1d0bb4b3c29c8a15dc7c130e3c4783b8
[9/9] selftests: gpio: add test cases for gpio-aggregator
      https://git.kernel.org/brgl/linux/c/93ada5ce07889271aefb22147280cfd9cf3da5d8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
