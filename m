Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866A426B08C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746621341; cv=none; b=audTjaQ4JJRVdDcaxKC32ouWG22+wOJzg104sGbsfbd41KYGkUhCle9QmEpYzMJbwKnYd/mqpfPJygQrsDXmxucTjTPhIr6B8LW0VzuSp9iSpMsyS0BiES2kNz1w5zRRYx/j7Rb4r83O/j/HZBa1hkBxQUx7ZclBIlBrNFJBzUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746621341; c=relaxed/simple;
	bh=W/jXllp7QKxqo10uYHex1yrZDnuxG/dHXbYSQf58jCA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Py27gJO+EKMUGBM4XKWzaJyKpqhyibMpznPIvCj21yS+whzEHzaKW3lu8x3y2xjHwBeRCCGpTxIiLedTH3V577S1M++0i+6eK7zVOTS37yvNzpPx2RJAZUrw2PhddLjXZ0zy6E+1obBN4gyN3lwCfvATk/LjDLAUUz2fx2M2INw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VMNOgP8b; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VMNOgP8b"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acacb8743a7so162485366b.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 05:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746621338; x=1747226138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xWON9I4ameGxWiEKwkDziYc8iN3l6k5w6SWR59IgmyI=;
        b=VMNOgP8bLj4AVsSyMG7GFjNj1ljxv5Qc9LFV+17zVZa+eKaVQazoUTb7SLBLoZUzXD
         R7XwvHGU7dOWl+uLp2gmVDvMj9uYT/WsuE9e2ffY7eQ9dn0bGLotWYIjSgQrUEayAay6
         YgoI9h319Ppx1K55O8GZi9zsJ5Wr0PONOC/weaqKTCQ6GgSikFRmngzuiSc1l/3SnWlL
         KyFbc3pjLKXRU8luFAU2lm5jITtDS+Wipwtaj06DKmI27jekC1FBA3DUHccgYG7jyC13
         CgRjd6pIqMfGjrQZQ554UeSCYXVqHtBD7ZdbTBCuv+fAUKvdrO/qHTqe0RiBpIFneqcU
         ap0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746621338; x=1747226138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xWON9I4ameGxWiEKwkDziYc8iN3l6k5w6SWR59IgmyI=;
        b=rclRrKZZdQLvAyqr9nkZBXbjTa7hyiA2QVPjyqAiDINHfCw6ltk3W11GAQkZ7v/gUC
         Oohg2y19X2az6aZp95fPH5tbl/42bhTMqhdevC39DYfC/xB0/v+Upz0NnPzPQcPI8g9x
         bym5CUu398qp1SbJ9al9RoraUnM1vHHMo0HTlSDfP+Aq3eLHMl7QNobkLkyx464o1YZ0
         syhQq2tILLtjHC2SJ+Dme/dLwdz80gX9IXuasnWcSeZawymj/8BFjOab7W7hcLJHRHH2
         YB+0fVCl8fXEDhBZUvbbtj0f/q8Pc4mSh4HCILD6k/Cp1XIkwAis45jksI8c3wqI1lju
         vlLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcZLBzM2qv/PLedbtV9zRdrOtI5W8RaROI9xIa2XfSLsLRa8nC6nBU+sNX6DUlA1gCZAVY86jO78mPFmI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx97bBU2ioeJmu/1nVthfgLwggBRtLxYzATcPZnAFA374F2Huh8
	EDvqZVNpyIMmqo4uCT0iPQbGSXe3g6MTHI2bXuTIaJvPjNgeokYVU6jlLYe0XoY=
X-Gm-Gg: ASbGncubsNxvHWYWxS78b+0HfLGSFzu8YyPJZ5VKFUEjxA9FeYGbKsZBrJR2IZbWTqJ
	GXHcVpU1MdbZMqEsGWshIx77xN83Z0oYkdeDlHdwRSkETeM/pVMw4z5/l7ZoCXR0LcTpkI+S29o
	WE5dZukQSSmqpjCa0dkZF1ziI8OmpnuHZ/B8dyl1KNos9weXsdNKLb/VMF/Q2Hx31HRwQwrenB3
	3pnzMyDWDP4N/BcZlRMybtGixyAWRqQVHBwpGoszIwDVW31FBwYCSyYx3HqpG6KvMQYpviLGPFf
	l0Y3zfQkyqB2i+P7Pgz9kG4EHvmLxvZg3Ss6CIk=
X-Google-Smtp-Source: AGHT+IEMmTi4bmJFoUPDT0YBq0AgR9RZuiis3rxqwa+boAiz7GJ/sZbLrp/zC5X9/7Njxkr4VGX0Ww==
X-Received: by 2002:a17:907:6eaa:b0:ac7:b1eb:8283 with SMTP id a640c23a62f3a-ad1e7830348mr370649066b.17.1746621337789;
        Wed, 07 May 2025 05:35:37 -0700 (PDT)
Received: from hackbox.lan ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891f04absm897883966b.78.2025.05.07.05.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:35:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.16
Date: Wed,  7 May 2025 15:35:28 +0300
Message-Id: <20250507123528.585447-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.16

for you to fetch changes up to 6a55647af3334f1d935ece67de4a838a864b53fc:

  dt-bindings: clock: imx8m-clock: add PLLs (2025-05-05 10:48:56 +0300)

----------------------------------------------------------------
i.MX clock changes for 6.16

- Add video PLL clocks to both i.MX8MM and i.MX8MP
  while dropping the numeral suffix.
- Add imx_anatop_get_clk_hw helper
- Add anatop clock providers for i.MX8M[MNP]
- Drop ccm_ prefix from base in i.MX8MP clock provider
- Document bindings for PLLs in imx8m-clock schema

----------------------------------------------------------------
Dario Binacchi (11):
      dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
      clk: imx8mm: rename video_pll1 to video_pll
      dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
      clk: imx8mp: rename video_pll1 to video_pll
      dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
      clk: imx: add hw API imx_anatop_get_clk_hw
      clk: imx: add support for i.MX8MM anatop clock driver
      clk: imx: add support for i.MX8MN anatop clock driver
      clk: imx: add support for i.MX8MP anatop clock driver
      clk: imx8mp: rename ccm_base to base
      dt-bindings: clock: imx8m-clock: add PLLs

 .../bindings/clock/fsl,imx8m-anatop.yaml           |  53 +-
 .../devicetree/bindings/clock/imx8m-clock.yaml     |  27 +-
 drivers/clk/imx/Makefile                           |   6 +-
 drivers/clk/imx/clk-imx8mm-anatop.c                | 287 +++++++++
 drivers/clk/imx/clk-imx8mm.c                       | 262 ++++----
 drivers/clk/imx/clk-imx8mn-anatop.c                | 283 +++++++++
 drivers/clk/imx/clk-imx8mn.c                       | 183 +++---
 drivers/clk/imx/clk-imx8mp-anatop.c                | 306 ++++++++++
 drivers/clk/imx/clk-imx8mp.c                       | 672 ++++++++++-----------
 drivers/clk/imx/clk.c                              |  15 +
 drivers/clk/imx/clk.h                              |   2 +
 include/dt-bindings/clock/imx8mm-clock.h           |  76 ++-
 include/dt-bindings/clock/imx8mn-clock.h           |  64 ++
 include/dt-bindings/clock/imx8mp-clock.h           |  80 ++-
 14 files changed, 1711 insertions(+), 605 deletions(-)
 create mode 100644 drivers/clk/imx/clk-imx8mm-anatop.c
 create mode 100644 drivers/clk/imx/clk-imx8mn-anatop.c
 create mode 100644 drivers/clk/imx/clk-imx8mp-anatop.c
