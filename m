Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0C3235C1E
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621280; cv=none; b=MP21KkB/KrYYl0xPaHsh23RQ0bUOFCaPmsHrEOxk+oaMu3nJYxApT/3a0wapaqmrt/wjXWBYAMEdof29eu/f5EsNTBjUHiLvif/QnXAlTp+KvC8SLF/cHCTcZpBm0THk5y6SKICBf+x8f2J/S4qTqpN7lgwuwo8lacfym9LsGN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621280; c=relaxed/simple;
	bh=sKyyp9KsoPPae0scG2TJa4HQa9SfU2SZ+xFe9IFIWMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=El8Qn+xdhtFOOghIOHxx6qL8ul358QWURWE/WK1sz6Xc4B/EF0+5u+LtGFqdvc/aSKt4xd8cTVQ8Iddgum2bF4YbGpWXe7hgbmnWpog5RlnT/Q8T4JtVMnzBLT3vpc6JiTE5iLllBMpfZTTjdTEkInB6DQEuyGoYPI15Mp7wivI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=WA0pHN9w; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="WA0pHN9w"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450ce671a08so13959945e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748621276; x=1749226076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugagfCqzkkb6ZXT3N2b0w96FZKb2OG83xQzQHJvA1Sw=;
        b=WA0pHN9wZ3LOeGi1BJKeZndLXrKcfYK3cxcHtR13XmzcWKkPLMlEC8sO0euKfYBhWV
         SivDdzV6gkPbE/oAl6tKEk2WkeCC3iu3EVKlOX6UjYha5/RNrR8RkQLM85U7Wsj+cNMr
         IoNsScwiulgiYDWoizc8ckw87nG7zr0HyZJL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621276; x=1749226076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugagfCqzkkb6ZXT3N2b0w96FZKb2OG83xQzQHJvA1Sw=;
        b=FjHmIWhQl6uo/fXSacv2J8B3jBfTBRXepB9gSscrofPJQlUf0j3vkRfYKotzxptD2l
         uETvtPzVd7MykQhY2tEhvCSFldjscizxCh5ReywGpz4MVCOyvmUydFb3kBKe14ucun67
         NYQHW/2dqlngFOsoar6ZofGZG5FDO1BGUHEd2xfSPAMO2m2M3MIf1ZTjH6YoFRbk0CLs
         n6/GDzk6ySCVaJjU8tYtEqaSUxIJaj2oM45uRhbE94DsKuVr00auZW5OkTEa0lWw3TbO
         zbR4Uj446j/o19+xpYnLT4Hguid/6jANo3wk8H+6OpMqGhEkwZEHP97xqBZXD4bEaT1I
         sRXQ==
X-Gm-Message-State: AOJu0Yxx8aZwXGmyPnpk2EMh1LwUHsccT6jeqn7pxduGezymjHIGE4db
	DP87V/yNFHE+XuPT0Q4Br9rlqe4cYb8reoVCpSulN3DG67dq1UL9zcBArXK8PMVk+v+gVDxbLhy
	GyV/Y
X-Gm-Gg: ASbGnct+lkKTNWRE25BV0U5/eKe63i5fzULAuzt7V5ugDIOLl+9Z0bF9W9tusi2J4bm
	6NjFbZhE6CZwiabBQPb1AS1YR9GubcY9E/CPdMpnbyGXCv0s4ejJYiuMWo/hkWToupAg+MRJzv4
	utfc1GIXdZukMWYfEPljXmYhHe/IHq4iLpUQiqUirO+lpMBWk4HKeKpaTohrEQL4fcnZCtPndkZ
	yYZAayEH0cOMjtityn29oKp1nSixZuJ5ncYX/JfMxu6UMMsPd8ynzlwAXe6EXgBByqCWpmmArTe
	znOFUnkum2y2TiAhVnFrOGsR47RWLzL3fbFQCOO0F47LLrPTH7iNfmM3e1PBms7O5Z/cNhxkEMw
	ZCBcLBGK0ybS6XeuJYay5VlSK9arVXfywziH6KjmO
X-Google-Smtp-Source: AGHT+IF/FFTEstI8VczI8bSd8uyPZIXtdnlGAyynzNnJaNGF3uvbYAuD6vs/4UH6m6kIb/231ZEJww==
X-Received: by 2002:a05:600c:8207:b0:450:d586:25ad with SMTP id 5b1f17b1804b1-450d6543cf3mr43891965e9.15.1748621275772;
        Fri, 30 May 2025 09:07:55 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dcc18a80sm9716365e9.38.2025.05.30.09.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:07:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v5 2/6] ARM: dts: imx28: add pwm7 muxing options
Date: Fri, 30 May 2025 18:07:33 +0200
Message-ID: <20250530160748.2476088-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
References: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add alternative pinmuxing for pwm7.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

Changes in v5:
- Add Reviewed-by tag of Frank Li

Changes in v3:
- Add commit body

 arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index bbea8b77386f..ece46d0e7c7f 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -755,6 +755,16 @@ MX28_PAD_PWM4__PWM_4
 					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
+				pwm7_pins_a: pwm7@0 {
+					reg = <0>;
+					fsl,pinmux-ids = <
+						MX28_PAD_SAIF1_SDATA0__PWM_7
+					>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+
 				lcdif_24bit_pins_a: lcdif-24bit@0 {
 					reg = <0>;
 					fsl,pinmux-ids = <
-- 
2.43.0

