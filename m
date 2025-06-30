Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC5019E98C;
	Mon, 30 Jun 2025 09:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751276767; cv=none; b=bqh0XRKQOMHvfkNO/T3Z07iSrSCXF82XDqmD8xOCwpYJID+dheeMoooCFjTfmO6ZR4zEyPQPxqNS/nHmzwlrJoQ8rJh88xsZHmTYsjo2yri1H3VLqBOw7ATTVvVSwgR1ArOprP7TQ3JNONsfFuJH249f69CLv1PaN0wrcLZrHT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751276767; c=relaxed/simple;
	bh=+8V7dOtmBFJoDzBlksd62ZTKgtyQL3j5AzWfhmyixtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HwTUmUc+aYl59Vs/OuizFtLEBWYN2HHO6dzUBUxAQHwWGuRmZ/6Q2fy2buxNjeNuUkaFg27h3hbh51T1PAvYKGMrkjNiWzHkB8b38EmUv/+Y5W1ssUi2/W+ab7Xqfkqxy4aRi5+kqFECmq/FA+qcfBV88um4CP5DcUU9VBJFXQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Iy+lnfhe; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Iy+lnfhe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Cn8BMki2iNN1P/r7R/LxfdYCZZ1q8hREXMj3I0Sa8ZE=; b=Iy+lnfhedJb8ntN9LrDCbgPqG8
	S/rRq668VaAryVBv5dvtasNvt5dUT4AvN3LaIe8wc0KhtQHG0lK66c+Np1yNMnpyk0Fq0XSyxX8Y7
	0HM73wMZnS3fclioohKbi5VwYne6rfP2KBRETPcPs3KdlltdMcuNJ0u5JtH+Fac9XUV2Uc6W+qD1s
	I2P4w14BQU/4OQP1ZRoJ7bxg1JVY5GJI4KEIsSuIaUSExaxaEN86DrfGNH+i1rfCe1ggUoqjtt0Fr
	NmsD7VTBdcyZXGUAfDCfkiLdA1pf1MXKDljzGcwrd5Z1Z5AIGS+cnj5cq4JTlHdrbmGGIO8CwFkOq
	RMcDd1NQ==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWB5L-0006Zc-EA; Mon, 30 Jun 2025 11:45:59 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Valentin=20H=C4=83loiu?= <valentin.haloiu@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable HDMI receiver on CM3588
Date: Mon, 30 Jun 2025 11:45:47 +0200
Message-ID: <175127673171.138768.10885736294525239875.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250622185814.35031-1-valentin.haloiu@gmail.com>
References: <20250622185814.35031-1-valentin.haloiu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 22 Jun 2025 19:58:12 +0100, Valentin Hăloiu wrote:
> Enable support for the HDMI input port found on FriendlyElec CM3588 and
> CM3588 Plus.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable HDMI receiver on CM3588
      commit: f9f45293f0d8bdc5e2d0d255cafa0acdb2c94616

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
