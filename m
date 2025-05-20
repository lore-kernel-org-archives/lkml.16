Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499E025D1F3;
	Tue, 20 May 2025 06:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747722894; cv=none; b=RWxZwjdQuUS3UPB2k739aYWB4pAq6lgH8DP0zyyyc49qyWIQH4CpTZtpAwXRio3t80qYfrYZrdWP2t8FqEZs5gNi+JdFH7IC/tlzrUAEWXAgKGiooouHKCMd1D5JtcJqp9EUBsr/mHu8Ctrf/ZDnHJ2dqJZF9T2ido8aD2pzD0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747722894; c=relaxed/simple;
	bh=hrPSQeENU4uIDE2eHQ2o1WCsLDaulSSH1VdJmPvBaVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rm1tukx/r8+W1s3oDaaqVm71LU+Q1bkFDxH0yPZmFkniglzNaF2/oEbq6iSvFqiYrWV7eW0jhuoXmSYZh4Or87d271E++1w4K/hPxD1YeG5b/g3kyOipb4eCi6jR99VsTrTu0pby0GRRV4BpgveNeEXClA79x52Lx6j6NtaRq/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KYrlOubL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYrlOubL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9B10C4CEFB;
	Tue, 20 May 2025 06:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747722893;
	bh=hrPSQeENU4uIDE2eHQ2o1WCsLDaulSSH1VdJmPvBaVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KYrlOubLTtWEKp3nK4GvBlLlpKSvaRb4kEyXhAiyIhnItmSizBr5PJSUNT/ja7Ftc
	 Pf3JG+ahEnUfvAPunaJbK3vuy002SyM3b0YVZ0FWRtxztyMzfFZ3p/5tX6RhFQGYe3
	 JjGkoi//m72QB7QrmBvjPSpEZJkVicSJWrKLbNyYX6uhmQT5cJrhQYhu9biuHPIVH0
	 bPjxyte78hKxToOSBylLOqOHgTJLucZfhOJ3NJDdMHYBaut4Q9pz/QzJ02FCQooppe
	 c9GT9xGhqJAqWQF/r6Qz7ABFKGFCE2gLopnD68+U+LJP7A8omnRvJGP9LI/Prok3Xz
	 WmLHJx/EGo5nA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA63C54795;
	Tue, 20 May 2025 06:34:53 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Tue, 20 May 2025 08:34:53 +0200
Subject: [PATCH v7 4/8] MAINTAINERS: add maintainer for the GOcontroll
 Moduline controllers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-initial_display-v7-4-a8f0195420aa@gocontroll.com>
References: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
In-Reply-To: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747722892; l=777;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=U+cI301uttTYTg6gAR1QRerlXekISKPf4H+SFf8T4EI=;
 b=D4YE+tIA9ZZ295A2GbcFzNfA3FSfuW5DeNokNapeQ19ChCsTyMr7pDhFqJsa8wlsJrrmIHxJX
 m2z8fLN9QIfCCWgDghBhUEsFs+z8lQrihxWVIx7NTpOCAFjU4+J6nsm
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

Add a maintainer for the GOcontroll Moduline series of controllers.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1ca022081bcf564c8ec91fb6431570045495ec23..3c94e530d0784d90b50109d4f9e7e6ced40f08b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10060,6 +10060,12 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/usb/go7007/
 
+GOCONTROLL MODULINE CONTROLLERS
+M:	Maud Spierings <maudspierings@gocontroll.com>
+L:	imx@lists.linux.dev
+S:	Maintained
+F:	arch/arm64/boot/dts/freescale/*moduline*.dts*
+
 GOCONTROLL MODULINE MODULE SLOT
 M:	Maud Spierings <maudspierings@gocontroll.com>
 S:	Maintained

-- 
2.49.0


