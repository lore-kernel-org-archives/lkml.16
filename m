Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46F41F03D1
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263298; cv=none; b=i1mnV8Ba8WtQawnQDnHyuv/3qNSL6flGJ2xs+fltiqw+gdG2HbVZC7ugqI4j5gg6IzvWYAGb+XdHazS9JvFMv9U3BB/aFm67cNNd6DhbpXk/BvNwu/2NAuOmWh53QBvLM/uWZoDTUdTAqQiMNCJL8UiNUAtcqMcIn6l8WbFzKt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263298; c=relaxed/simple;
	bh=pcZrX+J37mEd/JG2HKfBGz4YgsAx+tMGKxw2mQHHV/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ekfMrS8guYeMFO+KyE63vWYMzEr1/+wxfwJa/l6zoWmFo8MKA2ZBFRDS92qH+Gqjyfz2vEgF3z7FcPQ9HCe0l51+vYtFg4UeE8kIKYv9pIIJcvnrmRl+q6kQl+3eDu0Yy05sAtRZmtIJ1NzIxYW/upHA/ginCMIZ6lSLMcRSB14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=deOZDTR1; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="deOZDTR1"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-438a39e659cso36026265e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739263295; x=1739868095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqT3P+FafKsTve9iwlQFfzcqESHrnY+X7Hzoqpf6cy0=;
        b=deOZDTR1akEYZAngizMvGEGdIitxRbrg3VAGN2He9JSwz8PGZYGIbPfziPbRU8PpZr
         9CqkxvrmyEF9zzhm7JhA2kCR+L3OlzKhXLcYlwFViolegwaWB7hq0VK73MeQiDuPpRQm
         nxUTrS2vAKU4p1HrjEjd/imIe+k9Y9daF7ddTFbmTb52LisvXFqnamywLJjNK6C62p6m
         zVmEXaqicgeJfRhfe63dxrVVXTNZtZ2MJHh1kcuJBx2JqHU/SQANfO15V/+q1BSHguHj
         pvV3uiS+xR34Nxi/xNnmkKo2NS2To6/V13AF13hEswBDALS+vDs316ybqoTEjizRIcjj
         USvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263295; x=1739868095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqT3P+FafKsTve9iwlQFfzcqESHrnY+X7Hzoqpf6cy0=;
        b=NG38UYq6BvAguudYjWHOxXxY0JGMH9ObLODLDZqq2i8Lw1bAxsMvEgUbojHu1sAxDv
         t2f0mEGQQq47msjc1rWcmAebeaoSKbsdJ2DRYUbVZMlfZ2Bf4GYrF+5PPacQ2tM89FNb
         JVTMY2GiTeQEz1lpGXP66PlX0XYca6hnM38lzFmvsV2Bm8nRKzPvQnEL+hdCShFTYiCo
         8Evd2nEwqM6dpyXCD5eD36eBG6HspGfRF1dbXdAaq2A0gjd+3P2q3L7jneQ0OXI/vTGk
         k6j+ZpDL1hLN36dFb1M4DwUcyWAfgyyH8PtNFRm3X7NJCnIhZyejfu7pzF8yU1Vu49xq
         cC1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeDLtNu6yAtLOm5kgPhDoohZibxx8JFBbFdDQRwDo5OYu+A/7Vx+29e1owQYO5jpwOD70rEaL1s0Xzg+w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2jBlU6OriE8FwsEsSE11FiQUeaXCU6PW211ftVsHPZfl0Bv6X
	i+MPKLGQ5S2ieA6mF+Oh9BBhQw+n9+MEt2eVHOT3w9DxmXH1OJtjJP87KOMe3zc=
X-Gm-Gg: ASbGncuXwOuWcF7yy/ahMVHdSbi+AngkJXhP4mWb1Xs6/L3rmMGTwuJqk6QXNH8v06y
	XVtBgorEbk7D75ZRwpLvehxqUyjKmldCDKnVWfjbfMnaEUShg6HUaBfBsjxmNkfqxdc0hCwW/uP
	XYJG2YNhV+IhVqkbkYLbi1L2XCDi4Qb6bI1TIfKUNSJR3jQKu3d18F25AU/Gt2DoyTOA+IiNTM8
	wYHvS03JGuwgNawc6Iv4k5SRtqenP2lZZswapaPHEYrjTipWncaT5iL/WhdG6albA77VDalSlhn
	AT0DZZeGAZDyKw==
X-Google-Smtp-Source: AGHT+IGPEm991NB1BbIvptry/MmFm+kPJii/eBe5ogouwGf1sSmq4KA2slfZ+QecZeKet1nHZpZAYg==
X-Received: by 2002:a05:600c:468e:b0:439:47dc:e383 with SMTP id 5b1f17b1804b1-43947dce501mr55579065e9.12.1739263294987;
        Tue, 11 Feb 2025 00:41:34 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dca34a8sm168723615e9.16.2025.02.11.00.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 00:41:34 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v2 0/7] gpio: 74x164: Refactor and clean up the driver
Date: Tue, 11 Feb 2025 09:41:32 +0100
Message-ID: <173926329086.23265.1166908966030656021.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250207151825.2122419-1-andriy.shevchenko@linux.intel.com>
References: <20250207151825.2122419-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 07 Feb 2025 17:17:07 +0200, Andy Shevchenko wrote:
> Seems like I have had a cleanup series for 74x164, but forgot to send it
> last year, here it is.
> 
> Changelog v2:
> - remove ->remove() leftover (Bart)
> - collected tags (Geert, Gustavo)
> 
> [...]

Applied, thanks!

[1/7] gpio: 74x164: Remove unneeded dependency to OF_GPIO
      commit: cd323c6e62dd98035c141b6f751e5b2b7d490b2e
[2/7] gpio: 74x164: Simplify code with cleanup helpers
      commit: bdd603acf6a2b5056dc174e52bc8b285da529dc4
[3/7] gpio: 74x164: Annotate buffer with __counted_by()
      commit: d746cc6e64027e331769f871a595a3dd2c6b30ff
[4/7] gpio: 74x164: Make use of the macros from bits.h
      commit: e742e6b02d858ff9f6a7b43d0b1b5aae9c7e5cf5
[5/7] gpio: 74x164: Fully convert to use managed resources
      commit: abe3817fa1dcae480ec7b71ec1608454cb65d0b8
[6/7] gpio: 74x164: Switch to use dev_err_probe()
      commit: 9bd2dbe4066b3821b68f3e18ba91a3a1cd6354df
[7/7] gpio: 74x164: Utilise temporary variable for struct device
      commit: 5892cfc7db9814a71c991da7024fa03384e48924

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
