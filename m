Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5616A26772D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388193; cv=none; b=pfvWf2ZtAKlN99C76/ENcclHCmEkNLPVz6IyQwz1kuRmxkuPD4od0IN2KcESolbJpR17UlxPAo2VRlojjyNzdB0Vhy5c0/rkHwgWtOoBdxIVFxCfHabbmyoHDbZi5WpYhnGuMBFPVcxdHXPzGNE9qNJYdperKdis0oqcj/qw9sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388193; c=relaxed/simple;
	bh=vc25/TFqvg0Ekr2Sm4G/VkkviBdPeMF5e7FdTWNCvAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=svNDBJoIcYnIZhOG7u0l1vtfLDfUybQKS0cGmP3TCSpCT/735Q6sUQfP5yfM7BvlTiLoDUqQgW0ZOG0wNc+R4724nst3yHHbJXPDfiram/2empS4D+QdhHMdxvsa0GI3bjUehxlGovs71Q6jD1h+iGtEsqjpdepvTs6XeOAanwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Qim0qUA3; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Qim0qUA3"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acbb85ce788so440649966b.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388189; x=1745992989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=Qim0qUA33AOILkI9Ncp8BSemheH6i/CLgpGapCfVoLjcb74psfpkcEoIdJmGo2kSpD
         5cG23jZzVZhoLS21DYXZgEkziqQPwtoeK/NaP5eFs6/RPFM59hwgF/kJk8I2iS38HtvZ
         mvSyUVjyrBp12WIGTIgVJvYNCU1TpzL4vbsx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388189; x=1745992989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=dPnj6zkCMsK8ycnQ33bzXA/y/KDa9zr0ped0RxanYQ8M6p5EnJi8gpWWlqudV6hmHJ
         sxA6FxAyWDEVBR+rcSPXz/WIFyPO+hSLqIz9wnzuJwU5QfSse3HeQZKu5Tzb9pLD1aHe
         a6vxVRJszNy8+bUi9GMExd8rGQjv0YKRllRFgWiBetpQxJIu0F45VB8veUSN7IW+TO1h
         NqgRjzI9Nx+htCVXIKixG32Er6fl+lqQXhoNsLsvU0ji8pHKHGxV8QLHDlkWpL051igI
         0FFwDj04qEiYho9FHu6rXd+PudtSIu4TS+crV7HHB7mkck6FXxe8TQQ9wamrxYG1oMQF
         /sYg==
X-Gm-Message-State: AOJu0YxyZMoJ+I9otCjYvX7sHzpD6Zr4le8PJLIoRHdxFYsn/eJrM3+b
	izuVTTQ+KlPa5kkO41Wwm+ndOwhzQYkEhEya7uTT2e9sCO4PvEoMBPZuRkmZk+nSMQl/L3yjEPn
	q
X-Gm-Gg: ASbGncvF0M2mR0bt8tvg551hXM8dvPBuyIeDaOty2VCKYr1SBOej7aJC6YIdoVgmjnf
	diO7UEkoyl7XUka1HlLmAmIEjCTkJ7DNrHECsPiengSdwImJikIzDJhQOV9wzB9q5W8b4gf/GAQ
	nwi8XYF1BLg5blav2lVDSD0GnvT40dI0AfROy3fWCThWGfJcvFnt0vWplhE7+ljdCFoLXlZhn4C
	FyC3PO4vGgb9oHK/3N+fdvdFicDlO4YX2PTMoqS7VSflzvdQD69jZOg3MCAE8AIMHxasBqPbptj
	IiBgpcQjdB4jfhCT5otMfzAJGtZ25CNq4z9aX/FclrGpiwT1dAgrg3rdiZGZTmhGJtDKXVR861N
	VXE7T
X-Google-Smtp-Source: AGHT+IGJfBUmSx7xpArhxmxiAbzE5ABneyuLMS1Ivt2d0nKwCtdMFf2EWGfW8vDplA2S4cAk4a6aow==
X-Received: by 2002:a17:907:f496:b0:ace:3a3d:7e35 with SMTP id a640c23a62f3a-ace3a3d808bmr240038966b.53.1745388189491;
        Tue, 22 Apr 2025 23:03:09 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 09/18] arm64: dts: imx8mq: add anatop clocks
Date: Wed, 23 Apr 2025 08:02:26 +0200
Message-ID: <20250423060241.95521-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d51de8d899b2..1d1424a136f0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -817,6 +817,8 @@ anatop: clock-controller@30360000 {
 				reg = <0x30360000 0x10000>;
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
+				clocks = <&ckil>, <&osc_25m>, <&osc_27m>;
+				clock-names = "ckil", "osc_25m", "osc_27m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

