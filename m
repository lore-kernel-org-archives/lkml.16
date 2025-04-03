Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F019A24290C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 12:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743682031; cv=none; b=HCXXtLA3Fz3WOKNcHIlnymTuwxh9rAbHtNlDMeFk9YVRoxYzbyF0CKZK4ciLZX3Nn98j/JP8ATGueXr32qhGHb3s3ni8G2DrBdrLorHuuE9N4anp6uKq0tBEUdA3dBnIzTM/lQmcWVwQdhJrdGDCfiuJ5eCDnv2kAvr4DtqMxyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743682031; c=relaxed/simple;
	bh=AUGwc8vNaMx0xMpLyypn8iC7Ralu2FuIKpZSHAykq5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z8KPQy70qUANipOD4YYMSnHARSr5mDN8M6cRJJwShY4csu36FrNfGD7rSNAp31LG/TYNs99rrMIO+hhUAskBLyWBncTlX6ex7yPk9T26zO2kVxLWVC++1wVpvKARQURVC1AERw+uSWpgE+H6p4prAxFEwSl+opmy5waa0rqqfPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BAT8qsuT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BAT8qsuT"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso7616095e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 05:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743682028; x=1744286828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyWeHio5rUlPWWMN0PJ6IWQ1QQ/CGysbg+GQWLUUSf4=;
        b=BAT8qsuTcCr9c79Rfo9Fk+aWNwbLz2KM66IcYPjc31QX8D72yZDnCbmdP8nICpDWKj
         ywc3HDtjSvM1LzPVHoZ29Fl7Bw6Ht9FthPLhycZEmRrxmaWOCwRxO6vN/+FKhSl/z+G2
         vTEuTFbH6Mxl/rQkW0ila50cJ8paLNh+f3rx0QghQEOAb6lzuwWul1013DTUO69Hyg6S
         a5oBtX6dsR9YrQ9ToHNz3RAl7vAURiaJeABM8s+GUfAygfP4OKztpGTbLOJRpmMS8yZ0
         5PNT/VLGHlWCy69ruog7tHDdGqoUM8qOs8eeviZgjMjyMqhTEnu/uB5sXJIWHIfgTOeZ
         7eRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743682028; x=1744286828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyWeHio5rUlPWWMN0PJ6IWQ1QQ/CGysbg+GQWLUUSf4=;
        b=sAB2gD/SUW0uvic/jPS9WsHG+GqFrtxsA/YZM7tmUSS2EpE4OcJf4JU51YXMyQBVxy
         0UHllfg4ftZkDPmgmsh9GuOPc/3a9dJMHg2COHgDALdjqVbU6PvAZFaJivATb4qeenDA
         2eQ36tmBjYFaQMRuA0rHhB9ADGc+uOhHz0Oi9m6KhJnqgbilQXu5ecULw0Fm9+zUjNt5
         ZBfb1NGfskGRl/+gK8kx4QpkLmpJDskzk90gHp2yWZJgGFY7HUCGuUFR05UATT+gzOYo
         mopyPMKaYqJf8bjTK/yGicrcBXRLOltRiH7HOFSCszj3z3EJPDkQqzrPDB5SEwmtwCtW
         kjEg==
X-Forwarded-Encrypted: i=1; AJvYcCWlGue66IScGjgekOH0MEmzDwhSGE9avec9kAPDNIKj04r08cTUZIBEOhMzcG//mo6Dl4JXa+RiU0z3h9E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy59Z4/395eugjtFIp3nenQ2o1v9dhjpdOGWWvhw2RURlfpj1c8
	z2sY3kV8nxtq6H4WSVXJ2mlQ1WCAh/idRsKHIM2uRBEyHz/4Tjr6fHVZnrYMSqQ=
X-Gm-Gg: ASbGncts9lhLIFRbiUw/4J4fX4GUsUzVCviIBQrf34R1m+/tXjQAd7lvYMcKNri9Z+k
	065P0aKy0nqqNI+HeghgsGl3Je6oVWnKF7CDI79Xe5nhyMhE8sO8LGVAagcjzLiit5iwuPxV2on
	unT6AXJvsYHgbxsbJunLcaqI1Ms/CfedY9NyFLI7RaGZDc+7teofJOQ9n0/d53ak9LJHCzxrALd
	e8siJvN5ooG/Z8oLnWkpBwqtBeDu0AOVAOnFmRFutJW1i+NhnpYmtgo2IaqZF7q/a9OBIukQV2K
	PGWvGOpFrHC1ME2hbylULJtQeSUFZuObSZu80zv1gTNaFKzYpfH8dQ==
X-Google-Smtp-Source: AGHT+IEq8jwy0FRZPvdikp5/fC/RjWsCA3+i9c2Jlli3ODQyHjXIXByQoGwyhWK1t7ABx0W5Gw6Rjg==
X-Received: by 2002:a05:600c:3b9d:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-43db6227a09mr184515495e9.9.1743682028242;
        Thu, 03 Apr 2025 05:07:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:298f:3031:1c99:fc5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d980sm1645357f8f.61.2025.04.03.05.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:07:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marek Vasut <marek.vasut@gmail.com>,
	stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] gpio: pca953x: fix IRQ storm on system wake up
Date: Thu,  3 Apr 2025 14:07:05 +0200
Message-ID: <174368202234.27533.1000100252310062471.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250326173838.4617-1-francesco@dolcini.it>
References: <20250326173838.4617-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 26 Mar 2025 18:38:38 +0100, Francesco Dolcini wrote:
> If an input changes state during wake-up and is used as an interrupt
> source, the IRQ handler reads the volatile input register to clear the
> interrupt mask and deassert the IRQ line. However, the IRQ handler is
> triggered before access to the register is granted, causing the read
> operation to fail.
> 
> As a result, the IRQ handler enters a loop, repeatedly printing the
> "failed reading register" message, until `pca953x_resume` is eventually
> called, which restores the driver context and enables access to
> registers.
> 
> [...]

Applied, thanks!

[1/1] gpio: pca953x: fix IRQ storm on system wake up
      commit: 23334dfbeec89bf79f2ab893034b50612d039594

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
