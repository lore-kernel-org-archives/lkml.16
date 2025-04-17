Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B78E226548;
	Thu, 17 Apr 2025 10:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744884850; cv=none; b=NdxSPPd1JuT3QwHjLxfB64AKjcz1klEGiErO8SLh7G40N4atuie+BLozLBMdnkho/pW9xLxk8+00AhI8wK3WBnMKh7pSWt5wNVP9m98BGhwP6twJOVthvcDJ+oIoEkVlrsRdJ7/BD8QeT0CELEcYYyFtY3v3Dmc95476f3e0IGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744884850; c=relaxed/simple;
	bh=gJf5CbBqH0C0nOOWFRC8Iyrhov631LfP4YHpR5pnMYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d+Nh4q//sXlxRLJcqhwiRm+Jz32v/TT7AQQGel69umyNOv3kZiJV8zmpBgma7A5ldUgDp9JgFLa4VxgjhL+ZKUQkgEmUKSwc3RfmN+e0S9RKEUP1ORhigjAgHYU2Ep6BsFs95f0T2bMddpm4Vgu4KNeb0trVg0m5fSp1jNqAjrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vBkojFrg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vBkojFrg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E109EC4CEF0;
	Thu, 17 Apr 2025 10:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744884850;
	bh=gJf5CbBqH0C0nOOWFRC8Iyrhov631LfP4YHpR5pnMYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vBkojFrg4AEg4so30RGYfvlsDQE7CBEPArs6DSBUdTUch2H8dlh22CaGmKqL3/6yg
	 eoIjelENFzHA3gcRa/QbVuJs9G/fX9d1SWMDDJxzc2NWaH+d8aBTTzmeMIqUvv6ycO
	 BHKCzj5EV7bZAsEBjBydd4xXjNJfI8IlXMe7PI2Mrfb7YfvytL4vPA51FzoI9uxHVz
	 QbwxRlBBSdPO8pQ+5uRmpeZZd8KmwgbIACEhrs4m1WjbgCLRi7VZgG0IsBhmBYUHe5
	 sCMJlaE8HLQSCr33GCCPpAH1B7PSqJHt5+R+UE3I92yFPCOrVlmE0o9LbEAxwgjvKo
	 J1wQe7K0WXbGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44BBC369C2;
	Thu, 17 Apr 2025 10:14:09 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 17 Apr 2025 12:14:04 +0200
Subject: [PATCH v6 3/8] MAINTAINERS: add maintainer for the Ka-Ro tx8p-ml81
 COM module
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-initial_display-v6-3-3c6f6d24c7af@gocontroll.com>
References: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
In-Reply-To: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744884848; l=931;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=45G3DurvF3CmLAxUTF3brxzwuPgV1THWsW5gIgc1doQ=;
 b=0kemfNwDDmojOXuR2EA4p8QrxOPQQI2uOJ3WFTeJ+/MfRuNalD12U8xbLbIKAWo6SN40/aVrc
 02vQ909PeDTAdomIAjNm1ZMg2+q0nG56/7VOCJTSQ1eeYiphIMJhM9z
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
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b5acf50fc6af4322dec0dad2169b46c6a1903e3c..1ca022081bcf564c8ec91fb6431570045495ec23 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12779,6 +12779,12 @@ S:	Maintained
 F:	Documentation/hwmon/k8temp.rst
 F:	drivers/hwmon/k8temp.c
 
+KA-RO TX8P COM MODULE
+M:	Maud Spierings <maudspierings@gocontroll.com>
+L:	imx@lists.linux.dev
+S:	Maintained
+F:	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
+
 KASAN
 M:	Andrey Ryabinin <ryabinin.a.a@gmail.com>
 R:	Alexander Potapenko <glider@google.com>

-- 
2.49.0


