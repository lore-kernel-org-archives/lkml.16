Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B52AD530
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 14:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745246406; cv=none; b=WtKUsXfJuu2uqazrrED7s2NgNf1pZWxFt19KL6q/RL7d5j26uk2eWbdPexTY9JUnUZfiT98a6z5pSTo84Su5jm4OYxLNf2Fc+Qzi9zlBGw+hUhbPJW0ykW7Q+XcR93REdTjuRtEnjmxvY/6eJiJGBSaSiz8nl68BMWh12vx6Jmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745246406; c=relaxed/simple;
	bh=FUd4zIIEEfMcLNcI3p05RiYAgATF/FNk05heCTYH25c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KC2VIPzzWVP6ohjYR16SttI+6HX199jy2552TYZbzejJGmdo7pUrBdjX6eCm32B+P0Hsr/KoTj3zbtP9pYSfPi0u+YvkGj7ljfPCluxMzoTM9nnjufQqa4thiVOyjJtivrmYE//1c7UhrBhMhoOoPLU/UzB9aQS71J26HQX2jmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MrGJmc0Z; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MrGJmc0Z"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LEdfEW1580299
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 09:39:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745246381;
	bh=F8AKj2YObR4Taah/FaOEohXDrkw5jSSBe3cYaXaS8YA=;
	h=From:To:CC:Subject:Date;
	b=MrGJmc0Z3SlDfI3zymsMjwivlMHAy/4XjR1j6duLPMbbc+uDX8g8m662o2hmC9Y8n
	 /E2QkBWvavNX5j2sTaiEwyPYC4BVv9Zuz2XHw38XKQqT+iTE12/9WZJe4SCXBP0lXB
	 o6Ev/+Cd8KQJq3vhQaBm1xAj7Y+bRpXZIjyf8ruI=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LEdfS1005847
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 09:39:41 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 09:39:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 09:39:40 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LEdfFR077828;
	Mon, 21 Apr 2025 09:39:41 -0500
From: Nishanth Menon <nm@ti.com>
To: Ross Burton <ross.burton@arm.com>, Eric Biggers <ebiggers@google.com>,
        Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
	<nfraprado@collabora.com>,
        Taniya Das <quic_tdas@quicinc.com>, Nishanth Menon
	<nm@ti.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] arm64: defconfig: Enable TPIC2810 GPIO expander
Date: Mon, 21 Apr 2025 09:39:26 -0500
Message-ID: <20250421143926.2009535-1-nm@ti.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

AM642-SK uses TPIC2810 I2C GPIO expander for LEDs.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..49a98275fa3d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -672,6 +672,7 @@ CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_GPIO_ADP5585=m
 CONFIG_GPIO_PCF857X=m
+CONFIG_GPIO_TPIC2810=m
 CONFIG_GPIO_BD9571MWV=m
 CONFIG_GPIO_MAX77620=y
 CONFIG_GPIO_SL28CPLD=m
-- 
2.47.0

