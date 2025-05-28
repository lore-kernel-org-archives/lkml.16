Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C373E218EB1
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462230; cv=none; b=D/SH+CQnKhhKAXvh/6vT8s1xZ+NpuM3z41ctePAwRvfgj9SqAKlzqOLPs7JexD2q1RT1eSLxPysXr5EuTQOA/iirrZE0/d0ifdcGOdycxOaooO4X6mlxFs3iM8CuqP/PGeFC2egOMUCxpCMA8e69XV1KNCA2ayPp0Ec78kmxpv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462230; c=relaxed/simple;
	bh=Xsz6XZ7exOnaDVgyk9FhTekrCZof58PjSId5OiV3byk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OF6RqF9fsa/e8V3kirsNpeu+0Zsn8mUOK2i9usQhhD3i8bfwgve7ChwwKJPMR3YMEENlCxVjXwMvP0/0FxohGR8gEPQBN3qJWhNONvf9sYMUnTpLYscx1BSzRemBOppEtyjRkPAD0F/qfdrBzhWlsP8omq1nA9fFtRbZLdfZDjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tE00c5DN; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tE00c5DN"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0618746bso2089995e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462226; x=1749067026; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IsxIxIK6IO+/d1azvrpZkxNeZUasvn91vkyCez/ohhE=;
        b=tE00c5DNJnu0OZ7wUW1rEBAzPPAVW18Zhd8OhM7GEQ1k7cUxB8qgebRdkoL4XuMvCX
         iJ7j7yslIoI+Fzm6jDsns+lEDigG8HOiP5JvH0HsQSWQw0HfTzFVwcxi2HJMQdI16XJs
         Q4hg/s/PRNAuGEZfxdDEd2W3YGFe5UO2AP8Zp8+WAil/L+Ru/SLYrAD4xQpxos6TRckL
         pD/7xggoiSBedonw2I5vsR/48CeC1CVaZrb+BvGstfqOueNUoEhHS2ktIHN/8ghp7Y+H
         witMwDJgYSgvvtJaJpCzPN6mLXfQs6l3il6FJrpoALB7MJvS/sli4Q+CxZZpVt+lTc6b
         FJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462226; x=1749067026;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IsxIxIK6IO+/d1azvrpZkxNeZUasvn91vkyCez/ohhE=;
        b=kEZNqpY5qzswpM7Am96V9iCEAHUbzYJbLfUQ97LT7xALGuAazjInTdtxYsCZjBRNqo
         tRR7t2mn3EIbZEA2fv4GN4FN8vGtzjaCsrfle+MVR48/ojieTf7J7W8+r9ReCTgYtzmv
         fA/YkgaU6qchCjQItVxgnFHkpel4Vu4nZy3VuzG0j1HxjEa7Xyc2Gurms5ubwoFfPhYu
         SXO1HylqYcGZ5axNSJ0mw9BRrgrm8Vcub4pT/o0REctniifKOVCF5nfGgl19y8H6Ma7o
         84msdve7aSdFSUf5ta3SPr5X7TrutE33QLX3ZVPssZHqt/9pPSo0FWmwAO1++8BDu3QD
         8v2w==
X-Forwarded-Encrypted: i=1; AJvYcCU/FtemaBwJp+I0Z9gGVvolH3wQoxCw/gz8DZvlC9Y8ct8kCOlk1675Zko1dpwBspzXTexjzsnutSL4UB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjvcN7wkqVDupXbBY6BOjqApZbMF8Gr0nS25E/6lDSzKFA+CNc
	rxNzVcKDgu0KriBBph6y6HoE3C/zE/866CDuE5qNjV3/hW5JlxFs8c6cxQs4CfbneyY=
X-Gm-Gg: ASbGncsEIjvPM1XbZA7UeliZjNoaK6jYJckXWVCevTpp0JtT2RxZMFUOVqf1OIxQxPY
	66U/uk5nF4EG5hs2z9FGkpWmoXO/ch2weagF1HsbTfbUadBWR8xp5OiVZfDbFq7KAD3GM62kKJg
	U8Mw0tPqGmT3b0ZG3Xaz5Lc6Euj83SVfsrt+2iPMbrdwxVi6kulTxAU/yb7vDNBvoMMGjv3OCaE
	z/+gt1X+jakd5b2XoyxO3JterwXvf8jasgkMto4caK28p+DiZ6Hy1r1ndDpIhi/V9/8aZbB1eqH
	+bb2Z2aspMwyLLvpz4l+7e+Rr+4y0ZPDc0pFLtVu2fJVFGpWqqylhpQ=
X-Google-Smtp-Source: AGHT+IHO8Svq/QgVTHmZClL5gffMevyHOz1Cco0x7cPWvVyVd9ZXnG4onhYM/UN/PlwWdqGJFqmo+g==
X-Received: by 2002:a05:600c:35d3:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-44c9301650cmr187985425e9.4.1748462226120;
        Wed, 28 May 2025 12:57:06 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450cfc04120sm638565e9.16.2025.05.28.12.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:57:05 -0700 (PDT)
Date: Wed, 28 May 2025 22:57:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org
Subject: [PATCH 0/4] usb: chipidea: Add support for s32g2 and s32g3
Message-ID: <cover.1748453565.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset adds support for the s32g2 and s32g3 chips.

Dan Carpenter (4):
  dt-bindings: usb: Add compatible strings for s32g2/s32g3
  usb: chipidea: usbmisc: s32g: Re-apply init settings during resume
  usb: chipidea: s32g: Add usb support for s32g2
  usb: chipidea: s32g: Add usb support for s32g3

 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |  2 +
 .../devicetree/bindings/usb/fsl,usbmisc.yaml  |  2 +
 drivers/usb/chipidea/ci_hdrc_imx.c            |  6 ++
 drivers/usb/chipidea/usbmisc_imx.c            | 91 +++++++++++++++++++
 4 files changed, 101 insertions(+)

-- 
2.47.2

