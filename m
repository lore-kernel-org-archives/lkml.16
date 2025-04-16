Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D9A1A315F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818995; cv=none; b=QNfnY7mbWgJuWoUplha6B2DOtvpAXiX8pTksv0ITTLTEQ8rDLJ1GqiWeWZlM11m5sSB22KgLmbXQV5sju9qC3D0LW23Sl9BMMxAhQiU5waBGSfJXnc/HXeipwEHoLGVA0bkvhNf0NcDb0M5I0YZ4tgEPcwgZSUaxJ7GzqxZsHAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818995; c=relaxed/simple;
	bh=YM9zi+kOtxfP5E+wBpfWpsmMBG0Ma0EA/c0HJo8Tme0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bpv42FFsNLSmkdaqdO0u58YAectTMKBNyQO41E1IF0WLQnLRKkq49DY4jwr7gxZu5Sj0VMGudIaY0+Yx4J25/o0RvN7snUp5IyEe1VUWApWQiO5d+JLZHI0n1EZ2MCpJ4Lf3xJ/73n0xHjdRWuLNhjIj3taFs6wVzlupFrtTDds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qgsyf4fL; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qgsyf4fL"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so34134885e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744818991; x=1745423791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a94M0ymOqffHM8faeNroH3ykIR/ZTOIWb+VkApInaMs=;
        b=qgsyf4fL/GASYZvBhgYf3NkEJJZnYTpo6JjIxcHHdQnfZHuYtCHseVemGS6eApa3Gt
         IpgMTUoXOkrqkf5BNu3W2cypCuZx8n4HGjVbkVPpdU8vpG/XpwCSqLnSUPw2t7UVs3Rd
         OO+Mm0zO2v24BOwIcEoJuGCplFRxV8IFAkMYcWR7o5IgHj4+1/NuV+1VsyYtmbzFX4wA
         EiHvwWAF6bLH3GjmQWNrrDS13j9xNnGYmBZymn4GWH6ato9fENIzpV2ySZFC1chCUKAh
         9EjuyAOM7iXb5s2nnSUJHgj2A8JEqjzQl+OlPAy+LUuSUJB/93Rw/DBK9WnLJ5dsnjMO
         M04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744818991; x=1745423791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a94M0ymOqffHM8faeNroH3ykIR/ZTOIWb+VkApInaMs=;
        b=If1vSJQQ71UE+9u668iedQJuJfODl/C/nRVgBGbez1mvx9b8v7sW40l5Cain2OOiHq
         x8STd8zzltA3zAlhbk85PJ6rngn1GelsY+JWJQD2gSHxiezohzJeUpT7PcE/+LyZu+7+
         qUlqoBEbY6spILIksnauT6LIT9AmlYt0N4e0XF5VuzKfCJhcAezzdwWJlu0GJ3iTr6VJ
         QOxjmHQlAADM2D0gbGhz1iqTu28eJ5jZ1n/K05INouV56qHMPrX8JN4C6bYRHClyJUvd
         kPCFIXizLG+TWNoGy35IMdZ8OsZF0hWZv+fuL/KnA19MOq7f3IhSbtRUV/EjeRbCzGQQ
         pZNg==
X-Forwarded-Encrypted: i=1; AJvYcCVuDaOylOiZaCx19uTpSp6bp1pAKYSUsz74Weae4gC0HRbqh1h0Lj4JoIs0XKnkBGLfmHfA/O0WFUyXCTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIw+rn6mrp1ndWqMMKLFGUX1VB+V5JlapEizZtHVrTqTFdRuzI
	YoPUN8kLYGngsRLGnDt3odqcbNT4UCyJ6FqS3dMx/5K4zr8uKqIk9cjDPTVu/z8=
X-Gm-Gg: ASbGncvSSsp41cbba+IE+ApS3+f5Ry+5AZ+75HudhLOJ8zHpoKwqnwXVtLufdkbCXFE
	irJZnQayRmdf0V3eiWFJnR4GcNRw5Fd3GSiQYvL1ekbtsSDq0ukeixccJE7LfEad/RGj5JSq0tG
	OSyc0j9FIDoKU6EKPnmsHs8w/l1+jdsI49mL1REL2zuir9Ab/6UZpaDkjDWftpzZm3ImvGakeg3
	qn3v3yih2GYdZJFIHVklsXuXBuTFolR9IWGBEzZekG2Zq00tGFA5UcGdY9z4BdUm5zs8hlILBg6
	sBTgG8usrc2PwSOCbNVYTRcaYfgVjTCWShVtbZWu
X-Google-Smtp-Source: AGHT+IHdKNI6hyGPzGgFf5fHX3qw3Otr1c1zzkPAkc5yYzhNBYKNJ1QofozTxuH6uqxYT6WbIuMfCw==
X-Received: by 2002:a05:600c:54c1:b0:43d:10a:1b90 with SMTP id 5b1f17b1804b1-4405e3cb261mr22306725e9.16.1744818991221;
        Wed, 16 Apr 2025 08:56:31 -0700 (PDT)
Received: from brgl-pocket.lan ([2001:861:4445:5860:9621:2787:c462:7dd5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4404352a5f0sm37224015e9.1.2025.04.16.08.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 08:56:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Peter Tyser <ptyser@xes-inc.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 00/12] gpio: convert more GPIO chips to using new value setters
Date: Wed, 16 Apr 2025 17:56:24 +0200
Message-ID: <174481898215.8191.2166208947252160548.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 07 Apr 2025 09:13:09 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> another round of GPIO controllers.
> 
> 

Applied, thanks!

[01/12] gpio: dln2: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/afb4aed832f9000a5d15ecd28a7b2faa5789d28d
[02/12] gpio: eic-sprd: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/21d3c6531b113b1aaecd99ae90dddd55c20f372b
[03/12] gpio: em: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/097cf61ba5bd69328a69c4920f3454089fae0a43
[04/12] gpio: exar: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/bcdd5b37640cc577cd93d20f00519e70d7add8a6
[05/12] gpio: allow building port-mapped GPIO drivers with COMPILE_TEST=y
        https://git.kernel.org/brgl/linux/c/f031312c8e1903859a3a2a58ab5a3f97ba8b0ae9
[06/12] gpio: f7188: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/56193775d1ec9ab5ac23b05c821c26704debe040
[07/12] gpio: graniterapids: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/04eaa41eb8ebb7be4c78d1e57442a581d0bfdc22
[08/12] gpio: gw-pld: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/674817f336bdde5887191c61eaecf3f0a70cd405
[09/12] gpio: htc-egpio: enable building with COMPILE_TEST=y
        https://git.kernel.org/brgl/linux/c/6be51668eda37089d9a484bc8a41c1e9ecd6f577
[10/12] gpio: htc-egpio: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/4c71b46278c2b0cfc8e019e4fe3ec31ce258741e
[11/12] gpio: ich: enable building with COMPILE_TEST=y
        https://git.kernel.org/brgl/linux/c/10b16abc29e17c6ca86bcb8ceebf840e509b0ce5
[12/12] gpio: ich: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/69e230a0a288a73ce2a8e9373bcb7b37239cafaa

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>
