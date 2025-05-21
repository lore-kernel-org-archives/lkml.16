Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FDE25C71B
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822393; cv=none; b=ujv96OoKHLppX/ZOnmNQrc+vjkYfG43zBgwDgvJRW3lc5G3ZvPgkD1hmKpVhW8kmf6V2uOqf/+HzaciaZ0P3BbeGRfeuhwxKub6QmbfqDzWZHCMz9Ny+sW90V3D1GRrKFHPrTlO4BHX/9GyKvEYt3zbRFiiXs4CjPFfxtUwkJ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822393; c=relaxed/simple;
	bh=30RzcsCoEyXgUjL24+dJHmPekPE8wlca3SQY/Kk/u60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lFGMMO7AukFGwYXd9neY1FQ4nDo1PnnbueeQcpppf+s5d+ld1AcsH06UiYNXGmHo4o4Gpl+XeLao5fOq0lHL/RFefQvDErvFuyh3+YzV0fZQbxZ+XfyrK4gJclL1zMX0QySZajLenp5cNprXuMYpwQe1RPnamTOZ1tE+z6MrgGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iqqGJS/B; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iqqGJS/B"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a374f727dbso2102729f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 03:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747822389; x=1748427189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOKdgzujWfm3KBSSP4/65E32YoCR5dzJaAcTw4JFX84=;
        b=iqqGJS/BaAtTWCAx1Uc3P8w7UlxEwpjQYKSeqbZy7p7bZtYwkhNy/FGzOygzouWmum
         TCntLmcqb9WfbUSn3S8g8LD0hFEo7XOu/aL1gPudRaeC5+9lgqYE+3LVzK+QHgovzmiR
         XwYWZjFvIM5sFJLAUMLksu/z3lrF9WVVg52KvGxqHOZWjizG5pItAvcDw7RBauVMqMEJ
         V7PXtx2L7dF2J42D7I1ClpENCOziuE+0VwDB0mO07FrytOqwhHaaLh+w/SVs7KW5ZmXU
         bX8/7Hp8fph3wIHWn7bv80CYBRo4ceveJsbpO6yE9tnNr5mqnX7ZPsv0w0mi/0uUq+XL
         OJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747822389; x=1748427189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOKdgzujWfm3KBSSP4/65E32YoCR5dzJaAcTw4JFX84=;
        b=pGTrLShPNhDpV637xMyCmxsiG7yNFNYplqyP4LozGsapJ55uvmWmulB6w4mRBH5RVj
         e9tIur8aJQKmqjsXkuI+MofaimP7G2vLgzR9RTRGSgIudyCenTD6qjHRGZ90E3elUa+u
         gvSPP+8k5S399kR+g7BHV92xYgVCSboTB1z5bWnk+XvFM7Hn8r0ms6TXa6qpR7HMuSk3
         tOB5gpocDSzsbETrJ3N4lcYZXqcnluIa7T0AgUVx8PKONmbdMDwAL3Ke30u9ALoCxS4i
         JSPJM6oev0LbqxlRpqWYcqZYCyztfSC8i9Sc0VWySIyffqUcR5x5E+owRCvZ0stofSEZ
         lt3A==
X-Forwarded-Encrypted: i=1; AJvYcCUrem18dD7xAKUdP9roxZyV6444Bvd/d4Q+fxCniiWfVTKgQgXLDFX3j/RRLlLksET9ORTi+n8qPGxQFoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWjjBbnFyErAijATn2sQe04EDoIRISgl5fEZ8UOiTDgVN/yBBg
	pHeIce/RFcsJTfJwDxeqQHT4FohrUOapRrNHPQlHQzvki0OoEEjtJLGMwI95qp/PnUMFoooyEOK
	G5vwp
X-Gm-Gg: ASbGncvB+4APR/z9O2OVG+lLF5JU2M45PMWONpv4f0WRnspGDiPwKSQd3iP2ag+lTPf
	YUltX4mOX43vz3mYLbSCwkuQDARWKpkfox6/qKZXEeJfQMEXXBxGpwtI6dZ3dBBCLmkRzKITVhU
	KozBn4TRO+SXIm+yDhVXPBHyB8cCLHdWzzYPewyyFNvu6ZOO4ackKBM+p1KN7cKE47Go5JRs64Q
	/QxqXr4s6BZ+Gsasa2RnP578DyYyFy0SY83xUssfCZtQzWJ9oE4bB4MFbCT2ivcyiBWHNfytuqT
	urJLsRRo3k1ojQHcBQW1954QTeYYCRHGAruS0YpAYVdJTsQVano=
X-Google-Smtp-Source: AGHT+IFmlF8vnuGHMp3RJ5/Djt0dpLEuHYOqlFd6utlbjkqYo15Y/8isMxsuHqmgv8Bsis1iZ+SoCA==
X-Received: by 2002:a05:6000:2083:b0:3a4:92fb:378a with SMTP id ffacd0b85a97d-3a492fb378cmr1081431f8f.12.1747822388568;
        Wed, 21 May 2025 03:13:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b545:3055:5b24:d6c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a37b0bbd1fsm4883523f8f.100.2025.05.21.03.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 03:13:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
Date: Wed, 21 May 2025 12:13:07 +0200
Message-ID: <174782238505.74429.518130637718844568.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250521072048.1053190-1-peng.fan@oss.nxp.com>
References: <20250521072048.1053190-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 21 May 2025 15:20:48 +0800, Peng Fan (OSS) wrote:
> This driver uses gpiochip_irq_reqres() and gpiochip_irq_relres() which
> are only built with GPIOLIB_IRQCHIP=y. Add the missing Kconfig select.
> 
> 

Applied, thanks!

[1/1] gpio: davinci: select GPIOLIB_IRQCHIP
      https://git.kernel.org/brgl/linux/c/4347566404a0f01e9dc654a0b806a582ee63f68b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
