Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0ED54BC6
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059269; cv=none; b=YCkpue6OuUYnSwR2TMqzU6bMBHjB4bQcYwz+tO2oMRO43K1TKl4T0UKQeRbCLa13id3QnYP8zET2nSfzURfIy/yyw6iBjV/HmkCOaBzq1bsO1Aa7r+rn0fyQWTWSy/3LqHzhUJLV4qC2HXPsj7fufNS7v7i26hzgED/oQlPtwZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059269; c=relaxed/simple;
	bh=g2iX34IoxrIaM3UBcHz+mdIuH/BJpUNpXaFUUcajRvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qt9/oMRc9ePh8BLTHIRJ7TLZb0zLAbuyLTPqI5b+HzQLPzoX1TF+AyLo50EC+BuS1Uzs9cDnFHyqwNjIsngv1Gtrg8Ti0SW0mJgHaScjMHD0rvcVqIdjUOIFtUKq3dKPm3EfPcZE00zapcL785gZ4Uo7oKvaeX3RONIzaoeQDe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XWq5w4cu; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XWq5w4cu"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4530921461aso34338515e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750059266; x=1750664066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NufnnT2z/L01xcT8J/hVS5CTO/xRwDlIelt9on8BTLQ=;
        b=XWq5w4cuLD+9cn6ZYOrhDgpODg4mehTkFByZqT2czVUzAKpe7TrT2f8naPCzYetQcf
         J0WlAvII6X0C6ceIa0j/1yfuLPd3chSrCibu198DD1ES13/Av0ldyadFzkoOesy2c9FT
         ELC9QJ+LXiKRLdo3ewezsKPGGIyEMTxtvEToiRU+gjWouLB+8SL0LQNcxvYPM+0bl0MX
         egEj8bybRM34NBgtY2Es7mMXJEy47oIlhKBjNLXhV0cGb2nj8DpPAIzwEB2ku3LXQC/6
         3Y66KlHaoL561HNR7R3Jt6vkWy/qremLE+e9I8B22iqnexUOr08o1O8qf3p3iqpOy0z9
         NdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059266; x=1750664066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NufnnT2z/L01xcT8J/hVS5CTO/xRwDlIelt9on8BTLQ=;
        b=gupDN8AkRU7i0B7CZ+cEWqtCFcdmdfVbQHkdPb4yMp8EkTdrTwX7H7nX5et4Qv3acF
         D96JErZqDKVJStas6OWCP0GakH1BuIuaDQyZTjGEujZzT37wfK2m6w4tiEmxkBBI0YvU
         q4+qyqBTH3S1AHgydIlBB2GsOIC73WxGqsIqL4uoyWgd551eQsR2qWtvharLiHJx2wr0
         GCv3edCrhR6quKb5yAvyephuQIt+FG6OeD/i1QerllJOaz7o9HbvtdHuehs/bPS8OVAh
         YOWSfjmOhoa553nlBHquu61NMkNi441/lh61ctOGc1q8A0QSu49XF6TgfguoSJuUj1Dl
         nW0g==
X-Forwarded-Encrypted: i=1; AJvYcCWjP0klKSLovQGISz8c8+qWtl23gM0cpnf3SNFUd/ptegP0Equo5vxiIhPZ4HQT9Spo3ScWCAhaHaO/bVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxybElh8zrV1szsCeS9xUs5fj6PCbm4c9Tbo5NifVAf9rJOvn13
	I6Ebtkv7r8NH1VLWU4Ov0rKzUEJX2G+5ZHbk1kcurBH+fbjxPPWdwBUdN3eCgQ6BYWu0VdnEHS8
	FQUAsjrA=
X-Gm-Gg: ASbGncs0R5kesNA+iT+3WVIBHJ6c3UzgLpT6WeaCajkWkq881XavBL29YzxhRuBeNZ8
	xUtIGfIg89QE2ju9qCkwXBY6X28jinkUOvDgp1JefFZ/4Iv+8o1R7eH/eB7m7gzQoATzPNx91bJ
	YoDatcXstaKarTG5TRzTECNXlIXyoMuK7jiDs9YnrGuD5wsb3gsS4rlx8DBXiDCbIyWxadUeflv
	w5GCu3RSjYKkXbRQMz+O4z/JoPK3wuZdyUlxy6CJR32Hj/D5ifBcBjnzam6YHruXZO7OpWRGjRT
	0TMgPgBqt9BfbcvFw2b2aVk/KITw2HOaxyF5GmzqhD5AKptohDVnVV5RftBHvIg=
X-Google-Smtp-Source: AGHT+IFV0yz0l2515IeeTm9GioSRgS+MJm0JO7b1ZICcf7COUEwdawqQ7EAIvhjQwyAaNliNSkmk4Q==
X-Received: by 2002:a05:6000:2c13:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a5723a2d79mr7119025f8f.27.1750059265794;
        Mon, 16 Jun 2025 00:34:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54b7asm10388705f8f.16.2025.06.16.00.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:34:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	David Lechner <dlechner@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: virtuser: use gpiod_multi_set_value_cansleep()
Date: Mon, 16 Jun 2025 09:34:22 +0200
Message-ID: <175005925792.13944.4716742075474493399.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250611-gpio-virtuser-use-gpiod_multi_set_value_cansleep-v1-1-43b4adf6c807@baylibre.com>
References: <20250611-gpio-virtuser-use-gpiod_multi_set_value_cansleep-v1-1-43b4adf6c807@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 11 Jun 2025 13:50:26 -0500, David Lechner wrote:
> Reduce verbosity by using gpiod_multi_set_value_cansleep() instead of
> gpiod_set_array_value_cansleep().
> 
> 

Applied, thanks!

[1/1] gpio: virtuser: use gpiod_multi_set_value_cansleep()
      https://git.kernel.org/brgl/linux/c/0a99f2d8ff5b31c3aaa70b23bde58692d1300bdc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
