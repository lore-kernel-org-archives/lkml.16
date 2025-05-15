Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B91F204592
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747321301; cv=none; b=O/xEeZ245/+Bft1TidEAhocJWKDpltH/gN9rPmuGW9+I1HnNc8h4QvbJtHcSM7X/rdj/I1CYOl5C9fL66RAaeHrlctl8vEijyA+ZxZaBuHqHXlS70vZdVhCo5G4GLuon8ZuLWbcuVnm2BPsYHO+2GK8SKb/75Md/Pr7ICQ/rzCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747321301; c=relaxed/simple;
	bh=gwvgls2VA7YH6b1HH+79Y0OYUFtcsjeEGBTt2xXU8y8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E54p/VRIJlkM/jrDJc4CXLYSNaZMBjHX3DBRBDrHJ3cuq8yJKDoymAc0XBYRg0CSLuxmrMowC9ia5JgHLVldvyHYKMt1xlZ4zfYZWkZaGZDAppDlndq7DKhNxFIRKG/07lPP3gxQptSKVurKbRgXNKlc7QIn42yC/LO5Xjid7II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Y0QEaw2K; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Y0QEaw2K"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a1d8c09683so702329f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747321297; x=1747926097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLqMkFSPNEN1hS2qnrOzMpkhN6pHh1aoC/AzKLBLV/4=;
        b=Y0QEaw2KJsrhW2agUQoy+ViVYVnkIBHTpnn/nzdmiG/PbGIMAzkkdc5Ku/N+IXqL9d
         STNr2Y3zqe1QLwVxEivYRZF26iRYlNMjMpoWKFTCaP7zUSknW/ey2dAOAYdYk6KwN0LK
         yArS5VFfNaLHH3anDHdDAihG4GLQCtIYEH+WrxrJ124LHRyIzLtymn/raxz4FgBVqZi5
         F6Fl7PKF6tIxwRO76TuwwPmtme49mWwmEMVUMaLDIBGc2JntROICp+VTt/Vit3uUN7Ds
         rGurBsuCEYUc6lB8U8p/rQMjqh+fOOR185m1m9+HGsgN/RVVqsTeQdQvgwBmY8SPa7+h
         jo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747321297; x=1747926097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLqMkFSPNEN1hS2qnrOzMpkhN6pHh1aoC/AzKLBLV/4=;
        b=bpLr550mXjlgGYaDGFrSTMr4qIlYW0izpwjLtN8yrD7G4BDs87J1uRmzWTeQFuRAy5
         Wc/46f7kqI4vWa8EMVEhcQsUxDwok35D69GLgCMPZXVR0Gs3KIwvFbF8Gv1Bc+24JBOw
         +/9A+wLB7dpBl+CERj12bUCTXOkDFNu+JW+DHIV6fFiNErdTgpb1bfQUA41Z0HU77PYH
         apOiyjl4xPpiaVwVpVyoe9QTSGRz+n4MmiLx50HDqnC10ydzh2RU4fjWec703hrqtJiO
         oTF1xDsxw4YpL22f/mSBqH63xhhgm1uXalraJtqFD0kQPpn8+em5zZkfKBPtYL7Cw+Oo
         QhEA==
X-Forwarded-Encrypted: i=1; AJvYcCWl0JogtQzz/FHow/3N33/0gjLLFgGTqANmyfJ+8j0CIgisyTpXqebPF79H1mSB6O6GeAHKAkpK2g7hrdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGpi+AHF7F5gnjmdQSWZd7EgEohfspZAqh3oSMBgRDYHjb4fx7
	equE2QgLvku1t3g9KkyQKhGSQGvF0sJ5CZenWE7FaXivZ2tEZEvjksa+WiepY3/ixHk=
X-Gm-Gg: ASbGncvZMdiVtjBJn4IBFeup9e2ZRkIii0LXS37vgHcgbDSC4gcqfoj8a6TXZXZWlFr
	daBrRYeKp6vG9aiWRKrJfpBHSMZFUEwsJQ90nm8HpsOWn/EUjDw7UCq+9duaATO4HmmMHAyBy5h
	LuZXfEOeX77L35ikNK1R6HuF5CVmlAnIk7iZBRUE4j5mPTG7aGM4Ko6SEB6fIf19M4uOauqVIaa
	WD8Stsck7Wz/6moPCdEHMoHhkBZ4gUnZjkY28HGM2cxUhOUncqSW2jAwaZV5qnaJkdyltdxx4V7
	nGyiwyzelK+ebSCC+Q/Gxd1whZx7rdmMdtHy8I6YiS1SkOUXIMh0A+4ciysjWxobYPVj2E5Qtf+
	K6EMT0RVzw7U/UAUDoVXYrbF4
X-Google-Smtp-Source: AGHT+IGsAKFgjs66CEclWGo2OAGE7x2yF/O4CZXrBnVvBqkKBdDXu1lvcu3um1VWUo4w6Oo4wz8SIA==
X-Received: by 2002:a05:6000:4313:b0:3a1:f67e:37bc with SMTP id ffacd0b85a97d-3a35c7dca79mr128071f8f.0.1747321295486;
        Thu, 15 May 2025 08:01:35 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde01sm23388046f8f.15.2025.05.15.08.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 08:01:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: mxc: configure dynamic GPIO base for CONFIG_GPIO_SYSFS=n
Date: Thu, 15 May 2025 17:01:29 +0200
Message-ID: <174732127889.17102.8532614606603162153.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250507-b4-imx-gpio-base-warning-v2-1-d43d09e2c6bf@pengutronix.de>
References: <20250507-b4-imx-gpio-base-warning-v2-1-d43d09e2c6bf@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 07 May 2025 15:07:25 +0200, Ahmad Fatoum wrote:
> i.MX GPIO numbering has been deterministic since commit 7e6086d9e54a
> ("gpio/mxc: specify gpio base for device tree probe"), a year after
> device tree support was first added back in 2011.
> 
> Reverting to dynamically allocated GPIO base now would break most
> systems making use of the sysfs API. These systems will be eventually
> broken by the removal of the sysfs API, but that would result in GPIO
> scripts not working instead of essentially toggling at random according
> to probe order, which would happen if we unconditionally set base to -1.
> 
> [...]

Applied, thanks!

[1/1] gpio: mxc: configure dynamic GPIO base for CONFIG_GPIO_SYSFS=n
      https://git.kernel.org/brgl/linux/c/0a45c1a002705c8622738fbd2a2913acf886ea27

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
