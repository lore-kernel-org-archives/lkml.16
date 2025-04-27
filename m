Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C159922F11
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 16:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745771220; cv=none; b=XlFonl13iuLX8Yd6tzjN4a87MnjiJ+TyBHlKOBnUDUytKU617fyp4URwkZFxgKwH4crPioTuVVGSyFYZHhKDLTtbbDg/1pkkQQqXzp/e18PrYuIkqqIinEbf0W7q6NJjAfwtJs9o7agRMMLayndOHVyWUUGh2g/XTJmPcZAhTrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745771220; c=relaxed/simple;
	bh=gK/GSzH9Orq/qWZ7kN2L7Q4nJaH1G+CWqxeLvWpcZrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W7QNvZgi0Wv5avpckATE0j+Zu4AM4MBD89B3K8ODAiYytPJNp6hmwFSnI8pgMdH4Ywk8RrJ3DLbJDdqsmXFH4e4cN6Djj9I/HNrqtOlBSWZlYUZI6h5EVYUp4yrsDj7Ew4/jpdPpT3IRiMYDhu5eo5GmAqd4YSKBeTqMFcr3swA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MBssuu5r; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MBssuu5r"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227a8cdd241so55116665ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 09:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745771218; x=1746376018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Hm8ymC3WlboH6v1puutB+PkeMUv87jriOcmD+BHZJ8=;
        b=MBssuu5rB7t+EueylX10Mtl9cHUpep+Xdb/9vLuPPNUWCsojFUGU5EpyCxxGsDiez1
         jv3hKq6oK5u9OFUoUNPYbVw4gmBB8Zp7IeMOSAU/M9EDTcKlGU0SxDiX/xMzcmlyKjrQ
         0DIIXzuaGhIhqlaXilJ8lgA0ThpWvNWlfPWq492IbcFbMskIgGaFdsb5Ka7qc+gNhqwO
         pLGq74xVKnMAttc2j6JR9mjvZn+CocP4UIsMJgpnafYtn/3APB9iDBi+1FkEfT+6Hydd
         P0fUv4TqRwCSlHZW6HjDR5sgzvopsCqEWrT+QhSyb11Ta7GTNH3NQaCvWCAjfWG3RkvA
         A1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745771218; x=1746376018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Hm8ymC3WlboH6v1puutB+PkeMUv87jriOcmD+BHZJ8=;
        b=FdzkKBwoGQiU5UgnoowizakstMqGjdsF22ez5UAJaeU4yBPCm1DfI3AymLkNdnKI4T
         M937KE8oy7xF6JoXHxsu6T9YP2IqUcM4pZrn/WPOYhOcUHRdmL+tTNikP5WUCYfEwy4F
         ua9P78ObVBRLf3QSTBLL6vARDicIHxwrJ9GdIvwxjXX5v4E3FQyXZppbrvaZvc4zf9uX
         iCPWhx0NKnF7tLTJOlFN7cpa2Kn/ZPVleD0aTZ63aLAMUjF3JW0V/sSAtdK7sRbX1COA
         mzsPvjGKogoJajvitEGXKklMa5Wjt8NeA+oTpBdwhCTMKfTldb6LbTks6XsAcBzJYdNR
         1a2A==
X-Forwarded-Encrypted: i=1; AJvYcCVEJtCDvyyAB5uODtwpEz2qN5k3AOtH7e/UAsSOGlFij1Z4gwLgojIpRF3rixycj49q8MMqKGyJCWawaoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnRSGQalo2uIXDHysXDZe72j2bUiQlbwau0XSKmfTKOFWY4LJK
	+AyxOgrMJkxW29XqAgcrrkULh9ZLF2KQxtvaGbkkN5FxEg1uNHbBrHdIEq/uzg==
X-Gm-Gg: ASbGncs78gaOPufa29EbikW5VaySROteahriW8bsMv3zOTrgyUtk+2dghKaHY3FEW38
	pWFwnYfwBo5ci3qQE2a0uA7RQX2BIHPvFzGTr154IFwwuaj19wuni2I83t0/zyIimWAdobd0ZT7
	hJNjoV0eU/HYyQuZOWb6V/m0ERChYzM6mqv128sgTTUDytqBOxnATgA/AwoLFfBgJ+SVRYVwbVD
	X/RseqYRsjLE7XuQSvhpH2fBAoiqzIaQLNp3EKmlFSzY+MywzubVcRgMvP6TYsAg1t/nQrhdv+h
	ItlTpbuY4o/iDqisiB7mKLAkb917lW9RHkyD9cg1dqKdSOyWDskX
X-Google-Smtp-Source: AGHT+IGewTBDql+2+UdyTbCLzjXJegcsr5fvdoDv6DORAwSGJR8R6yqyunL8uBX+TIfarA0AmXkmwQ==
X-Received: by 2002:a17:902:ccca:b0:220:f795:5f14 with SMTP id d9443c01a7336-22dbf5f0b82mr130834365ad.27.1745771218030;
        Sun, 27 Apr 2025 09:26:58 -0700 (PDT)
Received: from thinkpad.. ([120.60.52.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5216adbsm65705855ad.234.2025.04.27.09.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 09:26:57 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pci: j721e: fix host/endpoint dependencies
Date: Sun, 27 Apr 2025 21:56:46 +0530
Message-ID: <174577118328.83097.3904673051712701084.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423162523.2060405-1-arnd@kernel.org>
References: <20250423162523.2060405-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 23 Apr 2025 18:25:16 +0200, Arnd Bergmann wrote:
> The j721e driver has a single platform driver that can be built-in or
> a loadable module, but it calls two separate backend drivers depending
> on whether it is a host or endpoint.
> 
> If the two modes are not the same, we can end up with a situation where
> the built-in pci-j721e driver tries to call the modular host or endpoint
> driver, which causes a link failure:
> 
> [...]

Applied, thanks!

[1/1] pci: j721e: fix host/endpoint dependencies
      commit: 10aae64c2fb5148409cc9beba7f849a79fe82f17

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
