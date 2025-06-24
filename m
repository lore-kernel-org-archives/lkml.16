Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C4025C821
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761396; cv=none; b=NhD9vsvf6zuAsCgYT/INE91WHA1+cv2a2buUXNR+pJELgYNn/ely6CcMq3XfA54B6ZmZ/dxJI1TGcS7FOH8fn6zJAeV4ie8F1M+y3SWrU60khD88uRcr9SO+yA6a9V+Ovlwu9bOeUQ/XAEAjQUn/Tq9uDK14clerJZUC1wp/I+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761396; c=relaxed/simple;
	bh=s/p1Xv9n0I6aRsXvJfI6PtEEVZffpXSQRtqTJvgA7bo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P75yx5jnfQSVlZy2zSmGMQHf0ZY9Xhuppnd+XQOBR4hWkUjjxNVllW3UPCEP2CpgoEhUbGP5WwZuKvKOwr0/nRXfoVwdZXsAQpNvJchK5ED7yhFyGhOvXvKHFeNiLh6LFj8UiESM3sVoN6m/cl9ks5Y7Wn6ZYrcRtKeMOknP4wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HSI9dRYh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HSI9dRYh"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so38140995e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750761393; x=1751366193; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mV2F430M3zf1QNtT0HJo3gDR7bQHbqH+Rduaa+AqTs0=;
        b=HSI9dRYh4OmTep8TZdzSuurajAq9L20OJ9AjaRQ2eD+widQj7r1Yf5p8hYAvN970Ql
         l5cV7sAvHIDjpvzFdZ3MyvKNMQJNh+960jA1SJ0lzWeucx+WqsMaoplEOQvcH3sZ/RaF
         4F8OYtShXe98cHB3ddpbTGUCuAZt9oZBA4bAQq8ZAezuv4sQX75Ef06WP/zY9lmX0R7m
         Qh11z2O+zaOD42QgMr28YYC9hOuJcfsAK4qLDQxd2Z/d4kX+FHS2HgGecRvUCMh27r/V
         K6DoJXRTh5QVcmGmEs3fM6HtbOG8QfWXAibQKXlSmA4ypc2nrCU6OZ3viWtetQGB7by0
         dg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750761393; x=1751366193;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mV2F430M3zf1QNtT0HJo3gDR7bQHbqH+Rduaa+AqTs0=;
        b=EZf2lz5cOWCcF6BLJog5rduLzZ1yyNwamkmXwcA6JyxSP7R7APA9sQVsE7KsdBaED1
         kIvSJnHhpQOMGGaTuQ72wxzw2+/He3dGcS2FIfAiebOfs5MqP6EBKRNOIRFGbS0xkDrR
         iUc3uZcuAsW3aH7XaTMsOGrhxxEyf/Tjqje42ZWFwudHunm78zpmCQn0ABMEaoE8C3Nc
         Z8htfufgLj0tCdWb84+qMRoBoOIsErvlNAn9rvnDIK/QzhHevvsMMDAFlDdCvWdt0DaT
         uu3qBxPjMjJhRVs1G0NRPpvkUmATNjWJ6gRMxyOYLnrYRT+Zaax3pTL1QVc9My//sPhv
         Qijg==
X-Forwarded-Encrypted: i=1; AJvYcCUdldehv9eRFaCRp5bAt/wNVtRQqnCs7N5sq0PHtInoqiNx6F8+p1Ns7rWFN81gA1KdXcF3cPgFRZNHg2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLtn/wh2OVvSucJylwzwtGfJmsyjpxG6OEg2F+vYMjH0BvoTAO
	tHuRapEeqokQv2035wQfkH7M6jH46VArxWyANBCv+Hqq8HiF+DggUFNwAUFu5aAdQcY=
X-Gm-Gg: ASbGncsJOvX4P8y89vr8gNl/RtQii054lcSeE67Eg7OFSsqrnpd3dYzNjnl/QxSmtNk
	64iiN0O8J9M18Bn9ndd4YXRFMAkmuQilUO3O4JskSIkD9VBFeDx07eCAzSHV9D1ATUoQbcKsgxw
	eBX5EJZMVJSEKyGB1xKaOyepqFDVVSUFx0UM9OJiO6XZnnAespPonXikM0EIOrlEYT3yZgDgy2p
	MODMX4Tm8pXj/LfVN3eRgnGRsitxsJA2NwK4zFG1L4dKOJ+flxjD9kMnvYli8XZXHBcRidiPtIz
	fugtHL9mZp92E1rq8sGlaG5ABncGFo0w5AzvSyTZ/jafmes0e/VKO3kx9JriVPDBWNkyNrg=
X-Google-Smtp-Source: AGHT+IE0oRQNwaJh1+Up/aJBnSPbbAIWGlweTCtCPOeJbMewjs4LOHGtQALu971QtWWJIuf3LTdG6Q==
X-Received: by 2002:a05:600c:8b16:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-4537b7b9f4bmr27625885e9.15.1750761392859;
        Tue, 24 Jun 2025 03:36:32 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb641sm143398245e9.3.2025.06.24.03.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 03:36:32 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v3 0/6] spi: spi-fsl-dspi: Target mode improvements
Date: Tue, 24 Jun 2025 11:35:30 +0100
Message-Id: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHJ/WmgC/3WO0QqCMBSGX0V23WI76tSueo/oYtMzXeSULYYhv
 ntTiArs8jvwff+ZiUdn0JNTMhOHwXgz2AjpISF1J22L1DSRCTDIWQ5Ab7JHT+00Uj8a2vSSyqo
 qUKHSSigSvdGhNtPWvFwjd8Y/BvfcJgJfr+9auVMLnDLKmSgRUmS1Fue7sdINx8G1a31TBav+q
 aDKlGPBM4Xwra6fBPisC57uJSAmGC8Qaw2ZlOonsSzLCx0Ml+ExAQAA
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
 Larisa Grigore <larisa.grigore@nxp.com>, Frank Li <Frank.li@nxp.com>, 
 Christoph Hellwig <hch@lst.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Improve usability of target mode by reporting FIFO errors and increasing
the buffer size when DMA is used. While we're touching DMA stuff also
switch to non-coherent memory, although this is unrelated to target
mode.

The first commit is marked as a fix because it can fix intermittent
issues with existing transfers, rather than the later fixes which
improve larger than FIFO target mode transfers which would have never
worked.

With the combination of the commit to increase the DMA buffer size and
the commit to use non-coherent memory, the host mode performance figures
are as follows on S32G3:

  # spidev_test --device /dev/spidev1.0 --bpw 8 --size <test_size> --cpha --iter 10000000 --speed 10000000

  Coherent (4096 byte transfers): 6534 kbps
  Non-coherent:                   7347 kbps

  Coherent (16 byte transfers):    447 kbps
  Non-coherent:                    448 kbps

Just for comparison running the same test in XSPI mode:

  4096 byte transfers:            2143 kbps
  16 byte transfers:               637 kbps

These tests required hacking S32G3 to use DMA in host mode, although
the figures should be representative of target mode too where DMA is
used. And the other devices that use DMA in host mode should see similar
improvements.

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v3:
- Stub out DMA functions in the driver so no-DMA builds work
- Link to v2: https://lore.kernel.org/r/20250613-james-nxp-spi-dma-v2-0-017eecf24aab@linaro.org

Changes in v2:
- Store status in cur_msg->status rather than adding xfer_status
- Show exact underflow/overflow flags in error message
- Rate limit error messages
- Add a comment about resetting the completion counter prior to transfer
- Rename dspi_is_fifo_overflow() -> dspi_fifo_error()
- Add performance figures to cover letter
- Rebase onto https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/for-next
  to avoid some conflicts
- Link to v1: https://lore.kernel.org/r/20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org

---
James Clark (5):
      spi: spi-fsl-dspi: Clear completion counter before initiating transfer
      spi: spi-fsl-dspi: Store status directly in cur_msg->status
      spi: spi-fsl-dspi: Stub out DMA functions
      spi: spi-fsl-dspi: Use non-coherent memory for DMA
      spi: spi-fsl-dspi: Report FIFO overflows as errors

Larisa Grigore (1):
      spi: spi-fsl-dspi: Increase DMA buffer size

 drivers/spi/spi-fsl-dspi.c | 221 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 160 insertions(+), 61 deletions(-)
---
base-commit: 4f326fa6236787ca516ea6eab8e5e9dc5c236f03
change-id: 20250522-james-nxp-spi-dma-a997ebebfb6b

Best regards,
-- 
James Clark <james.clark@linaro.org>

