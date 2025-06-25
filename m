Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F303272619
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838061; cv=none; b=ryKknslIiBe7SkkPbDcP8ebS8AHqduOZNhPxPVVj0u1m7AO2aHUuHj4n1J+N6pmOPAgM7CGUEBQ8GBNbK2p7fN1jyvTSJkl38rNOPbmDQ+VKZrdxP/Hnhp7R5WrHXmKDMDVTYsxSKnAxOaTp+oYS0sbeYfIY5+AM9NvRDJMBQPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838061; c=relaxed/simple;
	bh=V/cKTqS5I6N6Gw4GRuMyE6GPe7ohHi82BZbeNsiAXtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pLK8wU+s7Xu32L6kq0j498Yc2jtEER7ni1EQRdzUomFiOU+B4rBQj4rBbXMtCQpHaULKa5a1yZLkkQCc+l7Ik65gVS6CcdfebxrqhnKxNb0PoxceM4HSnMm1AFwuNJdGqXxVMJZYzNi5c22KddIkR4e8T1rwLrhDopq4ps74N0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DINnN/Dk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DINnN/Dk"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so35031305e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750838056; x=1751442856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGIylCtWYzvUCW3Ait7fyeB6e45G1L47puxB8d2HHKs=;
        b=DINnN/DkAF6lDww1d7U5/+kXW5yzaaiXGjzEYzG1IpOTwbuPxNKoFLXx8MuaL421Q2
         tY4O7D9ycZZord6PnLh+bli2hPuqFmC9EPrGEJyofIrhqNmPDRIhtcrVmlx+tBYlnV7H
         aUfFomtBfPljJY7xuxRY4bJZnkrnJvEyeTSaiY3gb6/vhr+3a0Q4XtpUh2UHCW5M0wCn
         MNnjBCX7oyUQorfvFIIwQQ1vLHk5/Q/rbC2HJ5qSYJKLvPpDUicF0qgkdd5cTLin6JkM
         rH83/NGI6lZHU9KFApJVyc6+uRndWiG7tQ+IoiS1bWE6scOy8gkhrxnOdH1ss102JZeE
         uMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750838056; x=1751442856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGIylCtWYzvUCW3Ait7fyeB6e45G1L47puxB8d2HHKs=;
        b=m1LBDLC3M+dqq2cZY0jSZqWI+9l9O36XRG+2Cf7uG7WtTptQtKnwzJ4vs1hHCRIgra
         cCpNRcMuRRKm0s0lhhtAMK5k7DsS120Wmfh6rm0B7tOX/sEjXGBhR+9aza28mPI6ar3U
         RRIMYUTQBlcxYrRnK8us9DT1jzWO91AyalvBDyhNMI9A0h9RpOH6O3hIyE6SnWwxTjEm
         hF2Pl534+L9BN0S7FD3ThhBWnBGjtuLLZD06Ueu+9PJSpdX+qTiipUjFx6yBCkmcLgx0
         92yKl1B2/0OgNTI3/5f8kBBeaw9IHm+tQb8R8EgoBsKEo3XkT+6xBl6p/UaeOxIoscTw
         nKsA==
X-Forwarded-Encrypted: i=1; AJvYcCXJhHflETHVM7wkPGOl9UMU+5ZVgb8XawXxQa17WOMHQDgUV5PlPenYFP2Bb9C+0PT95ws6N9NSh3yIv+w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2ywd4i9qeg9UjCgzN4pKpW/brBiQp4x8kpWWEyPjFfBjc4WiR
	awPiwAA2pJKE/gM6m+F+6TKePfLqs0viOR0I8MYnhTBDK/HKYj05qbcKxWdLcYBa1Z4=
X-Gm-Gg: ASbGncsb4JLl6uZz1yqOgL//a+UJOCE/1h+UMlfI9F0Osc9xYWBdLUFYII28y0MF2AS
	Anfsr5o/ijhCXjYpTu2DDy1jOYE7f+39gWVlbURwd3B3d6pv+sAXDpETn9SZCPoDleRNh6/Twu3
	kfgk5DkelAfj80tgdxvHjQg1HMYJI0NWVMjGZ6k9NTZj7f0JCUgVmZXMoyOEGtWNP+q5vG4APOb
	9X7ruXW7JC8dwkZJW2mKuBXQ40Rip/VcAu+GNNr7oqztNytUSeMu4Bh6M4xRO0I/uko/VU2bNu4
	F3NfpeBFrkCQbs8MGMN4Sq8XeNc4cQTDTH06/AulzGepZdWsbYkwhst1Fxt9smn3dfNy9DOSFA=
	=
X-Google-Smtp-Source: AGHT+IFTN+pUF7ig2e5+eSgpV49BEm9FJsw7Px+Alu7qgTSm71Hqmqt+nSXb/t7u0Vhkr0V9xsRnTg==
X-Received: by 2002:a05:600c:a48:b0:450:d01e:78ee with SMTP id 5b1f17b1804b1-45381aeff7cmr14873805e9.24.1750838056039;
        Wed, 25 Jun 2025 00:54:16 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad03asm11650295e9.23.2025.06.25.00.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 00:54:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: clps711x: drop unneeded platform_set_drvdata()
Date: Wed, 25 Jun 2025 09:54:14 +0200
Message-ID: <175083805259.9312.14360612986153360461.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250618074653.25555-1-brgl@bgdev.pl>
References: <20250618074653.25555-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 18 Jun 2025 09:46:53 +0200, Bartosz Golaszewski wrote:
> There's no corresponding platform_get_drvdata() used in this module or
> the higher-level gpio-mmio. Let's remove the unneeded call to
> platform_set_drvdata().
> 
> 

Applied, thanks!

[1/1] gpio: clps711x: drop unneeded platform_set_drvdata()
      https://git.kernel.org/brgl/linux/c/23b33cf1244185d0432b25afdc04f2fe47a1cc2e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
