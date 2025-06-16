Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1728D1DF982
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750065092; cv=none; b=gVN8ivaj7TpGgUE9ZwTdAZEOcG/TTlgfLTHExfMp0Y6nh76CW39t+Xade9XG5LZQXI07fXVswp1Vt7oFYyVI9/LBl3RgjVR4lDqIsW9qRFXMj7xWzqthdmWRVfEgiP8mE90Dw9E1aeEUYoOAqzLEs2qun5R5t9o2eeB6O8hNMuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750065092; c=relaxed/simple;
	bh=vEElryBNL7zZFeTJ1s4TPhoEWiGcSxvnISjWLIlQN9U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hBvSoAT+U4TkgayOsYWLdT+OaUQ4eGjs1ugoxvoGh6LIc6JE7ZwS/PaBKDsioyqz52MY3UK9nlsE1fpDmqPizX2nTfsgyKc2Y9akU07DAE71+baiMFwidIHN/RddADpnLceCdIibUCLeY1UmkWD2yttEyFOJRGTHzeqFXuEyqU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nc9LZ5SY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nc9LZ5SY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a524caf77eso641142f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750065089; x=1750669889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GG2mpeuISDpXhdrt6iGw2KiNF6LC3P7QlYizdJ45M+c=;
        b=nc9LZ5SYxVDgRVaw4/zii/NkZU5/9WimubReXFMTXQl2PcvfxGrSwjHM3QE1RiulMA
         5B61RScbWC2deadYIBT2L/Sz7sUasDuB/7c5bFtm1gC8b7TpzCAcHCGzqNzDfvv9Plsk
         nI2mM3mox7gr5YhWBa+3wTQz2DAFGScpJEojRL6sheOvxbL5Cef4KzaBMrtLDwejzP3o
         gQN98MFJKig+Sle0xsLEtJUOXfOKDn5Q8KbUGiPNLixSzArzsDvAEgxNvrvwjnnjnrLq
         Wa4sBXuJP+u9s9OpPoOcOb3zhtF6LPoi4SNx0lEwLL1J3NiHmC3JFVYt5FwasQxafj+5
         WNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750065089; x=1750669889;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GG2mpeuISDpXhdrt6iGw2KiNF6LC3P7QlYizdJ45M+c=;
        b=tXcNjZM+04emjQGo6QkVdoM/1K6qo86uZ1JBCD/Twoxhk+7iGHb6RyWcU6OkQDmHc+
         th5LzGYZXkKFJ9C6lrxI9yjqlzSYes5QnfgaSPD/seO1flHKBQYDwllnTJWg8iVRXioQ
         5HiIRVRaQ1AtihNn/2F4/gF3ZbnMOZsSTZhYX19iGjJbkiPXuOx9vetyFX7eNVYEGt9g
         B0JHyXUb2rOtwXacexuYmFcJgE8K/AKZRLEspOus0rX174AcqDW33I5rG2M6YYT1Mz6U
         oxsj0zXxZZFhWhC0JdPrVN2gt3VrRaH/xo7biav9UJspdOOudBloLUzIB9tY0HRqM1av
         QbMw==
X-Forwarded-Encrypted: i=1; AJvYcCW9gENoJ01rH/tm6YcPUyqnAO8CZVBBkZJHiddqhgNvrsb5D3vOrYs1EVG1j42/PpCnw01D0utY53HlF0M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws/p6/5vihI0Oz2eztub3xthOeX9C2TfcpJBhWmxSaMa72l9LV
	sGH1BUKjYuy0WoB3S2utrIjiEG4Tfiy7+FlleqxTFsmI9Mtqq8OZsCKJNIePuiq0uhM=
X-Gm-Gg: ASbGncu6YRy0zDRz5LONMD2bFbcwrXT11mId2a1GEuwUGeMz3CaDuYynm9UXB9PO5UK
	rCvrqS0EcNnIHLCFeC96wKIuUM6UOrU2ZNSW0KUlh37EwWOorZlDXIPP4F6UTteADAFBOs1Z19H
	go+ZBTdxAqZAlaBKBpZEtR6LJhUL4pvaGsmERKNQjNAhV8NneWPQvXNlmmbFjLxbFFc+8enaikF
	t96m+T9RTSgPanO3BO46vP+VphE+T86JQhyYUCwBhJJUPn06/4KptiZA/RIJy3mHW6sI0lJeBUC
	1xoNvoayMrBc+B+Jpk+8aT5ef57M2AK3qldHhdegDbtus3Q7eDfvIyW06vx/znEjWOzqn77fJwO
	UVvjoQWs=
X-Google-Smtp-Source: AGHT+IH1WB0/sw9sqaChH695gvNYuYsdGilhFE4QGQCFNv0A2lCd1A3eZdG1Rw5dHdNgAoDh7P85qw==
X-Received: by 2002:a05:600c:3f9b:b0:442:fff5:5185 with SMTP id 5b1f17b1804b1-4533cab4477mr28464145e9.6.1750065089320;
        Mon, 16 Jun 2025 02:11:29 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1cc5sm142655045e9.16.2025.06.16.02.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:11:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, asahi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org
In-Reply-To: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
References: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] arm64: defconfig: Switch SOUND to module
Message-Id: <175006508796.28664.548838572668518596.b4-ty@linaro.org>
Date: Mon, 16 Jun 2025 11:11:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 12 Jun 2025 15:44:22 +0200, Krzysztof Kozlowski wrote:
> Sound drivers are not essential to boot boards or mount rootfs,
> therefore in effort to reduce the size of kernel image (and boot images)
> switch the ASoC drivers to modules to decrease the size:
> 
>   vmlinux: 152864 kB -> 154528 kB
>   Image: 39391 kB -> 39067 kB
> 
> [...]

Applied, thanks!

[1/2] arm64: defconfig: Switch SOUND to module
      https://git.kernel.org/krzk/linux/c/927f1259c517ec0dc589f5014c4edbdc87591cd8
[2/2] arm64: defconfig: Drop unneeded unselectable sound drivers
      https://git.kernel.org/krzk/linux/c/a8365bfb249907069fb584a535d03c291157ddbb

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

