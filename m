Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B0F2741AC;
	Tue, 15 Apr 2025 06:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744700068; cv=none; b=S8dRM3bTOs8kpy2Z/jy8b41NepysSBJF0yOAlQS7xl15/KOTbXWuQKoDAXc8DPfF1k+loWxh+uYFq6l8vGSjoczZwLj8+aO9ndJXW/HgDesG7EQwr9bdo3ByGmd5mOb7U5K/mRLwvgeIPiokv5UsIENmmXez0+SsgNQcMaY5WWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744700068; c=relaxed/simple;
	bh=gJf5CbBqH0C0nOOWFRC8Iyrhov631LfP4YHpR5pnMYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oiDqZCNEJN9T9akwwy/2AkOha7kxJlcI1CR3IDVdkxItXM1DFktfutE2t7b9PeoHUoeeMwl8HihEFUJrsn64myFcyVI0vQVCyMuncplFhfGLIhMh4Lxe0fCqNu1ShDnq16ovJ9E8jG7bPwR9hgZ7pcoO+v0Vj1jXClD8w+YuGRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNqyVoFL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNqyVoFL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18E56C4CEF1;
	Tue, 15 Apr 2025 06:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744700068;
	bh=gJf5CbBqH0C0nOOWFRC8Iyrhov631LfP4YHpR5pnMYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lNqyVoFL3vczZ4D0itLuTut4XuCVa5NLiNv4JHRQRa5uqn3x3j4Q0TaQ16KW4dXfV
	 O9T7G9GR523uY2kEDAgEAFiwT6A3GeEY6nUH1OWxI6SJMfJU9Bie/OtgQP7wz6lKHv
	 hBGdMkPNP9RI5aHMu9nMt9G0+AKupd9SI1M+OijpubKUOIinEaLs/RFlpFa1ihqe1w
	 kqPsiLn6U8dfbFvmp5NJ8+WNiMHesrZ00wGKnkthdS+WeMWZx7DZ8nwqwkjBKD31NA
	 3KzVldqkVyQH6OeBJT8uiLzLH8MeULof5T/rpUoIyxzW8SZEEMd4PD0cietWvlh3Qc
	 djRvn4zA/XC5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF91C369B8;
	Tue, 15 Apr 2025 06:54:28 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Tue, 15 Apr 2025 08:54:26 +0200
Subject: [PATCH v5 3/8] MAINTAINERS: add maintainer for the Ka-Ro tx8p-ml81
 COM module
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-initial_display-v5-3-f309f8d71499@gocontroll.com>
References: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
In-Reply-To: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744700066; l=931;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=45G3DurvF3CmLAxUTF3brxzwuPgV1THWsW5gIgc1doQ=;
 b=nGJd77N9KMAhYG/bxN87/liFszpFCA+IAx/lg6GciwYCsSRdSBfUL0jsOF9uAOF+NttgxcF/8
 PDbRCxyupOtCg3H08tIlLmBBqMp6zl5+eQLgGD+zbwjTraFC/uKOeiv
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


