Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A6D202F8F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206354; cv=none; b=uHftV9U9u6CLEbeXpCZnYdSCxJwbmbcOLGo5b+kv4FZyEYU9sEY8CbsqgLhIJOC3DMn1+8rln2NOAR9Qw+K3+uoy6IghxtqXAp51WxOO5N6cf6qRo+LVB1KCsbqTu083QaCflfm+PNQyPie2UKhg+5cbo1oPAV4mc0itEuBfZ9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206354; c=relaxed/simple;
	bh=MlAwe0KDim9lB2A+cl+ofBu26pMokRaTACOI/0YspYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YnaGCWCqAgc/Syt8e9sWNDhTO8R7PAEdZJ+TBfit7WclFNLua7oaFbcpdJGWCOT/wsnztEHrI5q0aDmH688lovJ0hQlL7wnBcGt1F8F2bS9IozH4TjRd87X1kdq1OX/QJMMt0+HSfCdXEeQdhs7Oa3NB4q2h8wMbcscqwzuq0RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=pAxIH8SZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="pAxIH8SZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so3946995e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 00:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747206351; x=1747811151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnMERAkqxqmioTW1rVTb8VFktf28RT8bmo3e4/AkA8s=;
        b=pAxIH8SZlpQHcqx36hWzzOWk8qd2X1gG+NxcDWK81rPA2C/Jq2i9PCAQ9XZgoc/vdU
         lWlwSiJqK8sGAoNKPJI7tHLgwMZ7HgxlokEUbujwl2Hk+prseJHDKc+LxVYCL1/MPs9b
         ixafcOGKcq7YDE46C4tqFTr2qZy75qNgEhf2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747206351; x=1747811151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LnMERAkqxqmioTW1rVTb8VFktf28RT8bmo3e4/AkA8s=;
        b=QMYv5YXsh37NXin5uufGlgxG+6/1WyupVZAsXHhLXRbhS2MjD0ekPBuu9ubrH+3lt8
         Cb1Eq0ebdaaCkkOnEPe1t48sdtKNNj5uY2zah4Fd9qqPnHADlO1k97Pma5siicLlRWpK
         J5ly87Dm6voIQ52oucofMh2avK9tJ9xDcIs4mu6a6KR2DYbpuyDJaKnQgGdV0z/PkT5M
         lT5gTFagUjlY/f/f5UsWEm7gZLPMHtWC5LWYVXYyTnD5OAOkqh4/dGUXCpi8dLsqNwu9
         BwNE732pzotZSlMuMj7JaU8yxs1/vh/rg3oiQkAl265uCoxIdZXl0rJIchT0zQJEuJ8z
         yCwQ==
X-Gm-Message-State: AOJu0YzT536Tj5UExJKm1Yn4cGMw0qAKpi1Er4+oEh1AGDMlpc4PNfSo
	uKlAQUSMf2EWHZLGM7iM0dS+jN1mhB2ZJHdfmkJX5JdOA3wvdveqg3Uh08NMs34qgy3cEag8yo8
	Zrhg=
X-Gm-Gg: ASbGncvR20HlnjJFTGIWEtOIciRpHYYvSR+LtQM/rpgw8obLWKq3r+m92UtptnDjA5D
	22LGisH5D/fhSi63y96/Mn0semTwgbPFuMRmQzmexGDv3duy2nuoS6IWaiGWaDDmgLicEZQ6WzP
	yeeGo5BRE8fB3rspXRu0JvXDgLL8SeVct4lFE/LSHZOT+TQRT3KoYxjURSMsTj43Kho/X/1Qhj/
	1hmMF8HUBe7AoD57DC2++7HXoBJUEHV1SHVPVx1dX8EaTAZXi2Ty3s0xeJOmD+heOhHpNGoCQVE
	T+TZY8wTjZOtmKOjaBxxvwCADY+33X3g0+mSmOSDiUmaUWmIXUtlgcGB7YRneOYkpL5ACpYqCsq
	QYbIdbkwa7oCr2VOTpJEdIpU3IdOvJbHowI6qbDjjLW8=
X-Google-Smtp-Source: AGHT+IFJLzZyKmbngWgI+TzCZIEKEd11d7XNg6HIx4Hnb5kwZoKuTMfo+AMd0dF9M5np+Fv1sDDtKg==
X-Received: by 2002:a05:600c:37c7:b0:442:d9fb:d9a5 with SMTP id 5b1f17b1804b1-442f1a428a5mr20748315e9.9.1747206350998;
        Wed, 14 May 2025 00:05:50 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f396c052sm16688175e9.29.2025.05.14.00.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 00:05:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] ARM: dts: imx6ulz-bsh-smm-m2: Enable uart2
Date: Wed, 14 May 2025 09:05:34 +0200
Message-ID: <20250514070545.1868850-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514070545.1868850-1-dario.binacchi@amarulasolutions.com>
References: <20250514070545.1868850-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wolfgang Birkner <wolfgang.birkner@bshg.com>

uart2 is used as wake up source.

Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index 5c32d1e3675c..fff21f28c552 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -37,6 +37,10 @@ &snvs_poweroff {
 	status = "okay";
 };
 
+&uart2 {
+	status = "okay";
+};
+
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3>;
-- 
2.43.0

base-commit: e9565e23cd89d4d5cd4388f8742130be1d6f182d
branch: bsh-202505-imx6ulz_smm_m2
