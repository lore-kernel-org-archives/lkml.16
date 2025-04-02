Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DD0231CB0;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577642; cv=none; b=eh10/9nQqn1TfHZ52w3x70vs5V5B8OAnlcyTwwdIb6Xc/A+Fz0o7FwG0RQhWC/atJRWXpLcHZ0vdxA5Q6/5sDmZjY3MoJ8blyEKYkOWrRmIony8c+jwfNycYkflaPHOnGgUH3xDzEXlauRjY13bD7C68PPHpHPQeZFvTHSadutI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577642; c=relaxed/simple;
	bh=3tZjvhGaCLGf/bfrh4i6DClZf6aQTuwis+UL4UaKZdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uj7E5ygbN9MJVU42PHJUpj8DcY2+VXYrEMp/G4nBM/rHcPbl8F99m0G2pjrtUsHY8bEb1C0+WgQu8UIrZET2zW0wA+zxzDzEfPRE64AHvZkElNyIJpTnbnB5BB+C/99eBOsnpTwuULRxO6uo2pJpS6GIXxK2iUHE0ejfMthC/OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cpWgwRj+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpWgwRj+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38557C4CEEF;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743577642;
	bh=3tZjvhGaCLGf/bfrh4i6DClZf6aQTuwis+UL4UaKZdw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cpWgwRj+sL7vHXbJLHsQxegZVLSTRlXvj18n64tu8DQf58uzt2N0SnXe0n3bM/soO
	 eM59KL4TjK7JHt7LSew0j6ytRWv86X/YOBmF7p/6B4YuWhngMmsS+ledi+zz5OkdKF
	 IsZHLTBxrQv8qnVdfNjx/c+GBwLi/O8S48KImbBHNiwTmwSzJURCi4IEftt3tNrdqw
	 Fbs85T2LW2426H+2eo/N451adMrSdKvA0QoIfB8p9BLoie6D7k9tQ1GA9jK1kAS9BO
	 34SwmV1jjuDZ1RaGttSCxM+fj6LtwFchMBui+3gaQRs2B4CTuQDAQ/1Q/k1KvVoe2S
	 cg7ZEvyihz6UA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D680C36014;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Wed, 02 Apr 2025 09:07:07 +0200
Subject: [PATCH v4 4/9] MAINTAINERS: add maintainer for the GOcontroll
 Moduline controllers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-initial_display-v4-4-9f898838a864@gocontroll.com>
References: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
In-Reply-To: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743577640; l=784;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=Kodl+8kPIGsleRbs7jxCH5LW1v9NBKtCtLsNy8vvbV0=;
 b=COnYDITO8KLBM330+KlG1z4sWgqvpLjhbp6rySeWf1NXyACYSbRmrN+MS0nti86mEaSBaCFZQ
 rWus+T1FYIuCZ9h9Q4sLbSkC7jDIhAGDE/Wla6MLpa3+xXnBQUv/R3h
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
index 4b3864a9852f9fca2be48987d383c0671e668336..7d4fbfdaaac1776fc7c4a569f7ab667f0a485eab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10043,6 +10043,12 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/usb/go7007/
 
+GOCONTROLL MODULINE CONTROLLERS
+M:	Maud Spierings <maudspierings@gocontroll.com>
+L:	devicetree@vger.kernel.org
+S:	Maintained
+F:	arch/arm64/boot/dts/freescale/*moduline*.dts*
+
 GOCONTROLL MODULINE MODULE SLOT
 M:	Maud Spierings <maudspierings@gocontroll.com>
 S:	Maintained

-- 
2.49.0


