Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98A61B4133
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 11:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738926750; cv=none; b=HVFvSNL9ErNh0N4SxzH+8yOvyYsyBercI6gBy7dODUc9Gb7Dn0xlVpzkRluId5QuYol450mD+WpiXQnS5TOld4bqsQPHp8jE/aRUdV2VIdkjdrwR/P0j+88N8EUUZnGZREbJ/14Aj262nzdsdYi6rYEODB7W2rqnd0Qyrd8DToo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738926750; c=relaxed/simple;
	bh=UVhLtM/e/Ecu9w7ogun1ZPTVaG58q25LWUWoAh5yJXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ODIJx7X5MdC8hvOxCffrKU0sh23KfSs7mBdeOVITWHq6v0HkLvCwMeJKQDdMAORiBbct/p9gOvMqgTEUxtej54EGtQdLaQQhdaTf65iAKfLhgNPaSedNqjT4TDgF2/YG/8xRgm+mGOaqNIFyv/kjDRrK/MsMwEI3mO77YcBFbnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=FrSR74TM; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="FrSR74TM"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1738926739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ggZDy9K0QrESSAr+dEXYVccxkvpDwQbtlF19t9QLxNU=;
	b=FrSR74TMyWdTtAjGtKHYnqxV8zPXfJhNyyBsdsMklihOHeM5TI1huTO9BajAk3LCtHmF5G
	1b7mqcTk1hWuzDXqFwrQrcrcJUW1dUo4Pnx5bxASqKpEZp4B9yAePPiMfYMvzkeV6B3rNA
	eRgjnYCBtcxCYdP+C6rZl1P3BDd70bVXOCygyfEG/heeY09QLGBooV48c2IC6zwKQ/nux5
	xAlCQD/Nd85BD7Fr8DQljO9+zpY0dI3jNZFUHwbafz7VQ9Z7LBnZDP77HeoEnOxJYwt1xq
	BeQRFjXP6y3+uG8/8Y+rfV+pZe7zJcmqebJIlF3Td3W5gdxf6Uua68N1mDrtWw==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Maximilian Weigand <mweigand@mweigand.net>,
	Marek Kraus <gamiee@pine64.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v1] arm64: dts: rockchip: add 'chassis-type' property on PineNote
Date: Fri,  7 Feb 2025 12:11:39 +0100
Message-ID: <20250207111157.297276-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add the recommended chassis-type root node property so userspace can
request the form factor and adjust their behavior accordingly.

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
Link: https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter3-devicenodes.rst#root-node
---
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
index 2d3ae1544822..3613661417b2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
@@ -9,6 +9,8 @@
 #include "rk3566.dtsi"
 
 / {
+	chassis-type = "tablet";
+
 	aliases {
 		mmc0 = &sdhci;
 	};
-- 
2.47.2

