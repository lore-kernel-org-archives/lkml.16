Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F821D61BB
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 11:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745063553; cv=none; b=mcGyMUMfTEmRipe/N0Lm/59Eq14W6kwzkPBqrodETuiShXwICRyHLSkRnoUXIm4fgItrsP3QF/N0NkZMgkdqe4iNJ5rOBod2eGcW3+SUzQj2Fq6oQGqGpJ64tHbEpPDWEwD5uFevFivK7HuF90ZQtkYGVYTsiXEAn8ZYaKOBCzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745063553; c=relaxed/simple;
	bh=qKCScRiTrGJSBiUpLn/HDVoJJ2eR6y7zraiOMMUk6Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mSN+/W2DhL6ncvEYq0C4XFEgGUJFqiIS/lvoKhZV38xrcNqte8Bo4NsaFBBOZ7ZXZqT+G5f8GMCDi2BE404ZnNemGqcYUqkeDoWfc6iVzGHbJzR2LhykdizMMRE0uQ8s1JPzr/+RKd0G34LskEJoGMFea4jx+q51+1peo6snqyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=REuvkCqC; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="REuvkCqC"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so2289435a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 04:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745063551; x=1745668351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=px0hPaEeyRW/CvDRRPztfyMotj+Xv6y6UjJ57CxB080=;
        b=REuvkCqC+bkJf3FkdwKvz7NnPzp7LeYZohW7O064oLAp8+MWRt/gtvsxlhnssOSu6r
         Rz8CR74D1ymUyIJr4L30zOoBW3Lyg29Y1WHiFvRV3h7j/jOiU0pqTPQMoLj5AtoBElMB
         0zoXfFWTzFX+ifWTWp1Y+VfEqWF3WTJtemMgZx3u2AcFe0Y7t9AmvgRGfnmhPHfIqLpA
         RQg/IWFTgx+cXNUPR+rYSVzxmAt3x7w/TJjQe7cuB4Gx4kdYUmrUge6ZjPGqaxRPJD+b
         jcc38qq0LAQxwL6epRiSl1h3acH4k0o/O1Tx0rqo61MARYg7FXfwFtcz2DRR/cA0OII0
         3dDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745063551; x=1745668351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=px0hPaEeyRW/CvDRRPztfyMotj+Xv6y6UjJ57CxB080=;
        b=WmTEjQHmBPFIYaTz3jZVTAerH87IYPkHmgXE2vbaPL5pibMJc2oAMpSU6F9rsOKmhV
         nP2LdFKKkCK4JPnIitlpfYo0uS94R+geQ7h8RqkafZFr2wBBU0No51jlZC6GsOsbWhzx
         KfgaDif7nnrjnlepw/0ypLt3U/ij8snSjfeTBYLzjIsoxKSRRQU+H29LVwf8KzmQ6pV9
         aJYhlRX0Nlz6T7O6X5eJ6geZUWjCt7eaVUapbFXzCk4UYBbgUVUPunYqmRmrkcAvYhtB
         pLncVTImDbn9dXG4MT03QtMtYVqAJZULytq93TPoKt0UYf8ytcDXO+LLTkyMLxOlkEc7
         kR+w==
X-Forwarded-Encrypted: i=1; AJvYcCX3wurIJV1+nyBUljSDR2t460oBqZAJU0s8NF//pbm0Ro/fzhLAY5R3mqHZkkrXfD7W13U495ztYAX2y9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGxtFuuSPhOOjSydQuJ5zFu5Fe5DrI7Cecf++vkmEnNuYVXCtU
	EFKsNbjx4MEnIZSuQ0pb7GVjKR5a0Xn5S9UDYZ7WaYX8wjbuN/nqGxRz6dC3Wg==
X-Gm-Gg: ASbGncspsTOPBy0Ap3LAf46Ghmr0HAJiri3dTcE4+0UtOshyxAC++7uzcZWrBfamn4V
	H91hUMnAMtp8p0W0zJ4HCGg+RY3RP6hiLOMW9pyYTPlFUY4qRVFxlSaNSM4p8ZzJCrHVsWtCKil
	ai+tgawek1DwN3IMJ1y4rrBeiX2TUY4EYF1nWcFT8c9KLEOnKzqPB/FTgLzYixzNLaDpwvfYe43
	6BvNwigY1f41XAZqDaANBkINBD2pq43oFRp5McIsikO+dW8p5I5HbBdcU+h+GlWOdKjBXpwEuNS
	sfDZ7LQGqJrdvEhbhVydBp8VCdknzxz0x+DJF/4GW8dkGDabHhPQiw==
X-Google-Smtp-Source: AGHT+IGxohOcrVLT2HpkDYi9xceN2Uhz9oDZW+ezY0LfwsFn53P6RbFmjao2TeMC0K8cXhOK65CtbQ==
X-Received: by 2002:a17:90a:d010:b0:2fe:7f40:420a with SMTP id 98e67ed59e1d1-3087bb69218mr9255068a91.17.1745063551225;
        Sat, 19 Apr 2025 04:52:31 -0700 (PDT)
Received: from thinkpad.. ([36.255.17.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ece2f8sm32069075ad.189.2025.04.19.04.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 04:52:30 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Anand Moon <linux.amoon@gmail.com>,
	Jensen Huang <jensenhuang@friendlyarm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: rockchip: Fix order of rockchip_pci_core_rsts
Date: Sat, 19 Apr 2025 17:22:22 +0530
Message-ID: <174506353387.39503.4719676281195371261.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328105822.3946767-1-jensenhuang@friendlyarm.com>
References: <20250328105822.3946767-1-jensenhuang@friendlyarm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 28 Mar 2025 18:58:22 +0800, Jensen Huang wrote:
> The order of rockchip_pci_core_rsts follows the previous comments suggesting
> to avoid reordering. However, reset_control_bulk_deassert() applies resets in
> reverse, which may lead to the link downgrading to 2.5 GT/s.
> 
> This patch restores the deassert order and comments for core_rsts, introduced in
> commit 58c6990c5ee7 ("PCI: rockchip: Improve the deassert sequence of four reset pins").
> 
> [...]

Applied, thanks!

[1/1] PCI: rockchip: Fix order of rockchip_pci_core_rsts
      commit: 84d79f3304645d6e87b936d2bf8b8310798efec2

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
