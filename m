Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ADB1AA1E8
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 15:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746286186; cv=none; b=P0Lgw/aicpIBq18yviFtrwxrJtKrQeuQ+c2ZpzL2dj0Mbq8AS/c17/K+3W7andO+mHvLVxU4GSaXAKBod7fBkT2SXs+3E1Hk4NXrzJWcYztnyXX3xV/Lk17LmRkdvcQarV3JF4tyGqmCwcq+6iu5RPcn+UTsREkz+f3fBA6kiYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746286186; c=relaxed/simple;
	bh=tpaPvT47aBvZguhH2V6EL4v2nJvM4f4FDtOTXArLw5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eQQZMW/lv9+kqs8jWXxIRp1L4TuY4SNaiP7veOQy0Y/cFx9S1DgP/e2VionTeA1Fu/SpHVEwfBsPZjlqMvdcMZpZAl9HcLL3fx2T9e5oAVoQaZwrovgoQVe5IZqM2UIXhNueBcEqecsO2Y18un5JalBmXJbawT0WMnD67YQIRtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=wXY4hZNJ; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="wXY4hZNJ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1746286181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9kPzeNn/PbIKy+mZs6eCVZhmWhgjarI79NiBr0GcvpU=;
	b=wXY4hZNJg+DgzROyV+eG7p9cXGL+S4Gfqqp6d9pOGEiLYD0DBCayxVy2KPWZvxvG4wc4x9
	0F+eFo1atCuJNsvgomixVqGR98C8O20zHJY9MHWohsIAG6KFf1WpqOq3QwuLvXPEASMxVT
	2o9HusfPenEp8r0iyemlUaeAfoZcigs/l60mrzsVrFknRMNfwABHgHmxplafBubiv1FWjw
	Q96yfpJLOTtU0iCVz5NEuXkY6lu9SoCiLi5YuoLoomkGbb5Pg95QyMbc8lrhbAHqJoSDa1
	Yj4NlcXk2/OjQx/H6WYjD+HbMUs2PBGPK+h1mXcs+Y8F5yDHzVZiLpC6ZbwQ8Q==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dragan Simic <dsimic@manjaro.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Tianling Shen <cnsztl@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH 0/2] Add phy+vcc supply to NanoPi R5S and Q64-B
Date: Sat,  3 May 2025 17:22:17 +0200
Message-ID: <20250503152917.138648-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Testing on my NanoPi R5S and Quartz64 Model B brought some more issues
with power supplies to light, so fix them as well.

Diederik de Haas (2):
  arm64: dts: rockchip: Add phy-supply to gmac0 on NanoPi R5S
  arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-quartz64-b

 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts | 1 +
 2 files changed, 2 insertions(+)

-- 
2.49.0

