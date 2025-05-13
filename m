Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EE1215073
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747132959; cv=none; b=cgyRxpK1EVVBOzZkmfaDFSnTzxUqFsagGDC3gER/bNRMD4yz9llAzkDohnf6+E8cv7GLD924574ds9O2vsQPh+s/A7PFi8yQUm6qHzgj5BqSHZSm/j1dbuFKTnGq8Aqi91kyp1YWfWPNtAVW6xKAyOOtHDGMkcjRtPBv7UE+/QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747132959; c=relaxed/simple;
	bh=fokGcLsIOmbEu4g9bN0T2DCQmHZHP4mgH0SmNKAFeX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G64YC1mJwgXNSEsPDr9L+IatOY8XVYDzSnUccuYNbX02oMDC4DIg7h7uDVOnTOne0faW1r7QXIHg5Sf3Om/wDiKZlFwE7Gmf/8+RUXrmeR8YdmmOzWXm3/SsSoB3IMK0t+JYlwrlaWwn6UKRuohpjlbfxswUJa3FFyr1Nph/TWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dh3dyQ2e; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dh3dyQ2e"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso2758335e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747132956; x=1747737756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMN9753UXJgMGlHWxPvLoZFYIWjOvZWc83VINEWUfQw=;
        b=dh3dyQ2esUe0pqi+pH6ShDZntWMpYvgwMmgN0DNN86VIIRK/841NC/UFVniFjqhzLo
         N4K4QzF5rhZns9y1sV3IITBIaCQAfz3RuTh6oyRgmzs+w9OJR3mSAsZaznp7n9f2d+qP
         5ABjwPRbTsSyB3nDfDUJvmu//SZQVLNTukQOHJYRtcYEbJKVnP9tePWPjuPI8gD4QwfP
         jrvImJtB4sGcB51BZHnqda9oPnoBEhnnVc4w6vEK1kip24bLci3iXZQW2hB6nw+MP4vt
         xXuaHdDZahD/5QeqCqJGIR5KUO3GQiICr7DTLwmbRPWpdfGS6Nf/XzuXz8BozcnMVyR2
         hs4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747132956; x=1747737756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMN9753UXJgMGlHWxPvLoZFYIWjOvZWc83VINEWUfQw=;
        b=e2ddjF8Hdsd9a/r9eOM29yHGbl0uyquLjuxAlc1uzL5mxReBH52rn/JeYYSO2+uxON
         zBI1dXiLtgJ77Onrx5JnLfqaI+qV7AJv2eDAhik3IFEq1OVycU5xOFo7vzzzLrb5aMNw
         /EzpeSOw9e+96a/a90h01M3HBq0JoA4c+PsVMEx+487qJbQ6lNP5QdzKZgLHqHJIkdqF
         9WbwF3bEFXsK1hNTWYHcew5WSCeMB++b65DW2K5J8TF2KZVXKGHKex0sWnkKZYqj66Zb
         kfkMZoTCgRvIOpnH21OQyDOs2yxwMSG9e0FpeHBCg3hOgFSqg6qZC8+BcoCBwlIqo4O+
         G2Gw==
X-Forwarded-Encrypted: i=1; AJvYcCX6nSo/s2KN8jV7ebLhSvLdd2+Dbg/0fSQa0ULEKdtiTgBZORyHKGJzc6XtYfnD39zSCP/PeERBPNtszHw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8FRuC137vDuXxEAiSMBV9HsH3hsajLc1VAJE/E2AlDywCiSH1
	Ucx2uaoEINcaSTkNG6k5T6WXneIjwrRjviakpFdDb8p2nQ4s9d8BEOmABAKTgoM=
X-Gm-Gg: ASbGncvR3qLyS7CVxSfeo+pr+siqKWG2OwQRd4wD6H7Xd3zlcTxm+SebK+WuxhE0z8S
	HiSWSkAs05mrqIyqlXSWX5pt81DoviaRLWe3FyqkkELvk0QFoM3cl09UTYiexcXUpEfjdvkJqTU
	DNqkrQvFOlnVrjIFFuMRrw52sPGiw0Q1vCZNAjXIwF7t45WWc35PEOxYGhWvE/a4XWLWI6utowk
	Q+ue48KnRKPJr0Gy0NBEMr8ZR6iXYuaz0pkaxrp2uYf++Fcb7z2dMQEiHU7YVK6oiQVkCXgw8tW
	vjoGBGzCU3EDdS2X2j/1+iKmZG088WOCtJAUPps8ICjjTXgjsf1aFVG0NNq1YLxkWiWwNxnzg7p
	r4+xWEZkxGbVLkx2Oo9QSV62T58TPEnN+NbhhKCE=
X-Google-Smtp-Source: AGHT+IHOq9wDUB3NBL4uBQAkPwUPPMBeYUkzKZZmYc5cIyQSuJLzw220X0/6E4ODrKyFjUwBurM/sg==
X-Received: by 2002:a05:600c:4451:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-442d6dc7d2dmr55868475e9.4.1747132955709;
        Tue, 13 May 2025 03:42:35 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae10sm161002435e9.37.2025.05.13.03.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:42:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/3] drivers: soc for v6.16
Date: Tue, 13 May 2025 12:42:17 +0200
Message-ID: <20250513104216.25803-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513104216.25803-4-krzysztof.kozlowski@linaro.org>
References: <20250513104216.25803-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=fokGcLsIOmbEu4g9bN0T2DCQmHZHP4mgH0SmNKAFeX4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIyIKrgxxoL45QT+rnqkaHUKTJMI/avkjlenS0
 6TGXC02IjyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMiCgAKCRDBN2bmhouD
 146iD/913dxu6RKr/3+0K6a7kzNjVd3XSOvxOGAVerfPsGmLrafIx4WkeJZKcW+ZoP1t5T2yVyA
 rp9keyaj4tIq31VuHspm+cOMdMbQRIkTMljTgon42wZkGgyR3LXsIB1yZTNE7lMSNG7ZshzifrT
 H+jV2VClk3vKlLsFwIXqPXxbuRa2EYtOzGWnUmENVYTVdKCvFrI2XQAJM57uV8Sd/3qQzG5aMKQ
 YiEi/LpPAUj20FvndyobAeo25WUgexUqOsqDTya18cmCPcN66rR5q74U2mCofbp1ycm02O40yIX
 Nt7xgn5vJRLhU5B/JcCtc/e+XJZMCXhCMwRLlDZK6UAU1kRyjKt2+2IBoLSSwuhQ14L9RMVdaR2
 UKuqaWm59h9ycoECPfpEBeQfSQ9w9ufdSmPIYGUfLikJUrNIlP794mJrAuFBYIdsO85o5oKx3uq
 +3bOxfXbgybxiN3bRdCq4H0gJ7AcxeJ0X4sgqNnTzgvrSIJ1UITxKNgdUuvYCAMWqCRnCVUJV0Q
 9h9yt9KSz446lZvSJC6Ffujrv9f+MwtB0qdwTnD9jgeDlDBKfb7n62sqQdfLGYZb0Bde6R6WD21
 FXV5iODrDkbfepMG+0aNnrJs3SlZ03ILLrDzCpapG/mr2MKF1wPecv9p+h3ez/DPd6E9TlMGnL/ bipdi70bq+2havQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

PowerPC soc driver was on the lists in 2021 and never picked up....

Best regards,
Krzysztof


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/soc-drivers-6.16

for you to fetch changes up to d47f1233374597c348696c3da2142cc92a36fc90:

  soc: fsl: qe: remove unused qe_ic_from_irq function (2025-05-09 16:26:58 +0200)

----------------------------------------------------------------
VT8500 (and FSL) SoC drivers for v6.16

1. VT8500: Add SCC socinfo/hwinfo driver.
2. Cleanup unused function in PowerPC Freescale QE driver to have W=1
   builds warnings free.

----------------------------------------------------------------
Alexey Charkov (2):
      dt-bindings: hwinfo: Add VIA/WonderMedia SoC identification
      soc: Add VIA/WonderMedia SoC identification driver

Krzysztof Kozlowski (1):
      ARM: vt8500: MAINTAINERS: Include vt8500 soc driver in maintainers entry

Tom Rix (1):
      soc: fsl: qe: remove unused qe_ic_from_irq function

 .../bindings/hwinfo/via,vt8500-scc-id.yaml         |  37 ++++++
 MAINTAINERS                                        |   2 +
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/fsl/qe/qe_ic.c                         |   5 -
 drivers/soc/vt8500/Kconfig                         |  19 ++++
 drivers/soc/vt8500/Makefile                        |   2 +
 drivers/soc/vt8500/wmt-socinfo.c                   | 125 +++++++++++++++++++++
 8 files changed, 187 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
 create mode 100644 drivers/soc/vt8500/Kconfig
 create mode 100644 drivers/soc/vt8500/Makefile
 create mode 100644 drivers/soc/vt8500/wmt-socinfo.c
