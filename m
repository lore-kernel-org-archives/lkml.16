Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D6E231A51;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577642; cv=none; b=LXw5J7gxO+70Jfuh/o5A6/4auzyEJ+0RZKx6MiZ53A8eKXf94L1sRD0ACoJTUjbVAbqLGu+uLfTUNJTj48HuxEPsEpDxMlpfET6U9Flfvs5mDTUh9979kxHLJabf5fU6Y1kimzcf0sjMsaqoofIH3YgXExDB2KnDrYawa4WpLTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577642; c=relaxed/simple;
	bh=jpdQ9x2KB6YU1AdE5ize9x+hCIPQdl1FPElgQUnDaVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a0NqinBowqrEMekj8lPiqMDyKWNijPH8L2lmiqdss5zeyJT+VOxb8+slGeM3GGzPtLj6HjViQnFUG21xoYAoYLG/xovROjQaUaKplSLk+KZ/3iz4HHIAUUds5mV47fXjYoHRYgGxIVEsElRfroziy+FXFAvCj3lLm4ik6IW91tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5IM2iIL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5IM2iIL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25DA6C4CEE9;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743577642;
	bh=jpdQ9x2KB6YU1AdE5ize9x+hCIPQdl1FPElgQUnDaVA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=e5IM2iILJMP6eYQQhyNs8kWB2XCEY97JvdjqEr4zIk3EYJ2Z5jolZs746Ktczy6iO
	 ndCh9ZqWLevFAmHUijV6SGgkmV5FjpgfEoDE8LGvm8ZtUiyVEYdQWBnN1zXMcrCCJn
	 kWIu0w7eNsZIP2hSt63ZG8eNh7+wn2yrWwSMdLCXlQ8yaMDbNeXhHDGgUsczP9UF6Y
	 aps328FgvZwfjbJhlKYjflUXNOSldRMEMoB68a788tcQ3VQt04XxCIrOLaCEyYDP6c
	 BUYQtGWv1gp4PSJbAJXRV7+BAlzYCpApGDh95+5u/CjLMnrjy9AHU3ASe2+kLP471c
	 bQlW0rj0lrE2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD4BC28B20;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Wed, 02 Apr 2025 09:07:06 +0200
Subject: [PATCH v4 3/9] MAINTAINERS: add maintainer for the Ka-Ro tx8p-ml81
 COM module
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-initial_display-v4-3-9f898838a864@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743577640; l=964;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=zHAL4M9Ap2CnMpPrredehNxGxgNHYTNlXYI4S4RtDVc=;
 b=fqr88wOkEHIfZheKBwhiLf5mu0oT8rOHpAlk9ZwFlEK0GsvQjRInjHjKBzfNm/ttaSVaGggvr
 pgsmlKQ1DGAD628fds+fRZMoTYgf9ybR4N9/9YP9VdN9qBlJnmA1Y9t
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

Add GOcontroll as unofficial maintainers of the Ka-Ro tx8p-ml81 COM
module bindings.

This support is not officially done by Ka-Ro electronics, if they at
some point will supporting mainline, this should be changed to them.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 322ee00547f6e494a96d2495092f72148da22bd0..4b3864a9852f9fca2be48987d383c0671e668336 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12752,6 +12752,13 @@ S:	Maintained
 F:	Documentation/hwmon/k8temp.rst
 F:	drivers/hwmon/k8temp.c
 
+KA-RO TX8P COM MODULE
+M:	Maud Spierings <maudspierings@gocontroll.com>
+L:	devicetree@vger.kernel.org
+L:	imx@lists.linux.dev
+S:	Maintained
+F:	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
+
 KASAN
 M:	Andrey Ryabinin <ryabinin.a.a@gmail.com>
 R:	Alexander Potapenko <glider@google.com>

-- 
2.49.0


