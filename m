Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606711B4F0F
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 09:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745056213; cv=none; b=LLAZeDJNl+YE36HOOGlTyy61PHGkr0kg5n9mVazzlAco/jKxvNqY+FqU+cZi/YwuWMwn87GFTn95yN42ZDhrxceI6/TwCCrU41LqKqTZujlgCDzydoiEnidFTaM0xPEyY+GBVMpmoaCGxtlbGgxYlhggvCZwWsGD7nyM4w1jaSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745056213; c=relaxed/simple;
	bh=OCJCK8IzVfDDMk/Wahm3g+Lsd3Yj6wZBzFZ29NKosLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P2Nx112pGqCfZvraD8RwuUrx+/hZLd67viiyCrqj54pc7gUjXNxVzFARUVJIAufVV8k1e5+FiEL8e9ANwSm6FvFWpL9hAuQVzpGM0syfrM3snY60caYHuH9/yEB5MgbmspJD4Yoyz3Ck0RUR9jDDYeZkayGbRK1axuYQfQyYkEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rhgFJfQv; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rhgFJfQv"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af908bb32fdso2219420a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 02:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745056211; x=1745661011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1smWoXBsF07yb0kdhSazKV5zZrD5jTCHEvASrG6ZXY=;
        b=rhgFJfQvBEQ3MuHJ+9f1DqKoWJ7JoHseq00r8qNeghZbjNT4yhWHrZjrNzIzbOw3Su
         ZJij+fgHUgEGx1NZyIGoUqMLK4962fE+WDmTigWX/p5VJnvF4cXR1//OwL6FHy7ONBzB
         VxwdBsS4lEhxyPHIfVYtPaFvK9psAchv1n4CuF9NuGwSJCnt6MUSomT/o/6pYRvd+sEz
         Fop8euFqObuwYiYzsoySXTEMTlJUprJXaKrFRHuYFoymLC8nE2YIQioF4h4i/YzcsS+F
         ORsI4oYuc3MEOTgu9x6650ryUnWbg9qpd+0LD5iK2w5hFjQkPHbpjnqdBCeimsi5f+q1
         Rwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745056211; x=1745661011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1smWoXBsF07yb0kdhSazKV5zZrD5jTCHEvASrG6ZXY=;
        b=c9ocO0HKvqc742v27jgurmvv4j3FpQ+v5i6ef2HuMc2GDud4LsXgEhw033Zpuv6dTl
         dB58zvI5rnSJrCHUwjotQIce5gWt3Sz7JY3I6RqYcciCNDcqSdVavOA5RVKixpON/BFT
         wJcsTiTFqRniR7SO/cG6a0RPCzjRKTetYSglZq2cztVKaUgQ+gViX+3Kmrol8vxeGJmy
         jac8cNXOd07eNpNNBTn5FwWarW0RcbF7OyGNzv7pgCzN/MibvtSs8x8uMuNxkSm/iQSB
         6aI1Yc5Y5xPGpEssKD0t/XDoaY7exgav8LFB20j1b4oR5Kxt2nslWRSsEmB/2FmElSbz
         7b0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfg/dUiE2OMozTTD+YKk3yQ6JHupGLgt1doaxaYhlEbjK6z9yujvpAk+T+YHYVsBJiFM6TY1Lg8Gilhkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YztWm4Lg2cqYoztXNYeObiwdtSkaIJ6PNHtunmTPP0kkkJiqbbW
	MuRZA7b4ImiJkqYqffDScxzgxSK2GDhbFCoDqq27hM+MVZlE0MumaI7oD4CCig==
X-Gm-Gg: ASbGncunNp9ArjaxVhy2ZRFHSHA7Kuz0HQIp9zPDDEgg9+xthbHHMoarzMLR4AI6LQs
	xW7ekzQVQ7LOPpqXwizSSFgzDupGdECBo/ijTunAHNtPn3VmbxvjDAMQQfjZiMi5LEvKK1VZKLt
	zJsH7Rz7VByFpK4jzm1pvIrQXki9MuPrBBfUi4ypuxWwcUXHuVpdox74lGrtL8hjuarfCBb1zq7
	4At9kEJRhFxdd0CdT9eTqbuCtwyiOuEDaU7b5N9OnkauPtkgK2AvXKYWU8ELaja93u5BZKfomO0
	Z5qLRMEMDlmylUUqz5eMhdHmLdfaSfXpC4pKYv3QCSJiLoPMOJ4s7Q==
X-Google-Smtp-Source: AGHT+IEq9phG3rDT0nEB9hkvWvaXKiYNwe1s5RXKu8uLzKTD8MFTWep3kqRGNKf8OTR2vRkuBkxE6g==
X-Received: by 2002:a17:90b:2705:b0:2ee:8cbb:de28 with SMTP id 98e67ed59e1d1-3087c2ca65fmr8403803a91.8.1745056211696;
        Sat, 19 Apr 2025 02:50:11 -0700 (PDT)
Received: from thinkpad.. ([36.255.17.167])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df4e12asm2697981a91.37.2025.04.19.02.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 02:50:11 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: heiko@sntech.de,
	Kever Yang <kever.yang@rock-chips.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	andersson@kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Simon Xue <xxm@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 1/2] dt-bindings: PCI: dw: rockchip: Add rk3576 support
Date: Sat, 19 Apr 2025 15:19:59 +0530
Message-ID: <174505612709.29229.7221551173436866910.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414145110.11275-2-kever.yang@rock-chips.com>
References: <20250414145110.11275-1-kever.yang@rock-chips.com> <20250414145110.11275-2-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Apr 2025 22:51:09 +0800, Kever Yang wrote:
> rk3576 is using DWC PCIe controller, with msi interrupt directly to GIC
> instead of using GIC ITS, so
> - no ITS support is required and the 'msi-map' is not required,
> - a new 'msi' interrupt is needed.
> 
> 

Applied to pci/dt-bindings, thanks!

[1/2] dt-bindings: PCI: dw: rockchip: Add rk3576 support
      commit: b5516efc1ec610e75f320385a3a2ecb5932a49d3

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
