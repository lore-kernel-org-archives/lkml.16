Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D68927A456
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 20:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746303059; cv=none; b=qML8iSWIaiT4Q9acKyfXySuG4xoqzC5fR6+z8p9oIzHRviwdd2UrmTjEvLHKunvZXAuiYt0HcFco61zzYlO6eCXhnRB75psIpc4hnAJDr/pRjLJiTeg5dXsqU7FRoGV+f2ap1vlfaBnxKIGde8Lb+Pbvp4JXJ31PwYndOILlYsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746303059; c=relaxed/simple;
	bh=2C8DCRpsj5lwMCMzMGWwjw5wOSNUjn1OKfOEOMSqh+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/J14RiyyFdAW2VarzLI0Xae5sWT2cTQE25RXM3tkc45E2rCK+uVVTNIdiIIZDZZdkZCpz+B6g/VZKOu7rTwD8agpI+YqPyGNxFnKb+eO3eOxl2KmuXb63yf7iOUli0VN5FVE4M7ZiEsYJSSVHGz/as7kOdlMyuw38tGJ1Pn1hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=G8gMw5aE; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="G8gMw5aE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=kAwHYojG1aPJfO9Hl6pfdlm+D2vQUm9z2JIU0ErTGKI=; b=G8gMw5aE4QiO6nZB5CPEZp+maw
	sU4fp6DCZHj2xclqjB+5g7QeV/WEZ/UTOWA/zVXp/nSoe2a8CZ0yAwLTteMsDmdlGq9CxfyM7O1BC
	t0EXCVUfommdD0hDpdJbUQixKcABOeaCs33wyfO56v4QiI8YlHtb9F3l1GJMALu4LULygPD3JeWPD
	AaTt903pjAdmDDNGoOCSlMOGZWJnk8Nj037YEfCLQUG0BDaPczSlwT4ycIL3h0Xm7kA66RiKSCKyV
	IFiABwBsZRxk0D2kyj0tlIm5SyXSE5fJq96K984MX3dukqgOzHO16R2US3QdMbhIG7fKx3m8XXA5C
	G4PmqULA==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBJCI-0001e6-BM; Sat, 03 May 2025 22:10:54 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: rockchip: enable Mali gpu on rk3066 marsboard
Date: Sat,  3 May 2025 22:10:43 +0200
Message-ID: <20250503201043.990933-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503201043.990933-1-heiko@sntech.de>
References: <20250503201043.990933-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rk3066 contains a Mali400 GPU, so enable it.

There is no individual (or even controllable) supply for the GPU
on the board.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts b/arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts
index d2924aca6f2d..de42d1855121 100644
--- a/arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts
+++ b/arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts
@@ -69,6 +69,10 @@ &cpu1 {
 	cpu-supply = <&vdd_arm>;
 };
 
+&gpu {
+	status = "okay";
+};
+
 &hdmi {
 	status = "okay";
 };
-- 
2.47.2

