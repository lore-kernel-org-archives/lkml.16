Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1444521E0B7
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211118; cv=none; b=eHWQpLK2vyqjokxBwbnB/5XxkBbBeHTG1mKG75610G2MnCt6g1hfLq6ahJaCDhBP4+rHjalgE3q9aU5p1X7PyDR+/KISfVzLIMi7459/8dc6sgp1SwaqDi7SLEui2JmetGEOSgXOOYIC6K4fnhu5JavroFkU0uoikm6qS/knJVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211118; c=relaxed/simple;
	bh=VuPsb9OXhGwndn/qTWajYUOCGIqhS428Kk9CJNyTJy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PSqnBCy9TdpFMPl/TTYGp5cxXMVEQf2BjaLP2fkbSijSyk/wcTaxpXlL8aiVys1sGBucbJRAYmWJdq5JR+8Z86T35ZJ1rnUJvt4bOL/1gH7Buo6g3Rn5yV2CfeYacWfhBdhkkxuWRe0WwCSrHp4dXpOomRjLFYXSR5qy/ojyLA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=aFQul6C5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="aFQul6C5"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso66554285e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211114; x=1747815914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2agCRR6IRGaR3EtCVbw6MISEmkDLJru9ZVgwOeM9qk=;
        b=aFQul6C5qjAFFI3JzW39LeqGtQFAXxYPBD1dE+KenmlhAV2OnvUi3p2YvBe1DyPojd
         lN199qg0vwp7JOqaAkp1mitPe3q1K3LzLzwQ848uYpjyGXJWD2b6VZF/29UwVe4Z2cEO
         0Q9IR9B2xzJjhGKNWJkrFnG4tF/mgHJnNiRQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211114; x=1747815914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2agCRR6IRGaR3EtCVbw6MISEmkDLJru9ZVgwOeM9qk=;
        b=sIrTNBJC4oEhRI8qo2CXjw17m167OhQFz59uG1zjqDaoLNmnPI4CfDaBRACc3enpQJ
         QxU+VtCh45YEFJlMGUwkVsy4N/bC74BQCKdIxW1DZNNyMhH+fUGORc5tTlrbBI6hlGq2
         Y8ePlC8i6Hq4TwOP8dQYSmtEFGzex4Wnhdn/NwQl5QERXbe+RF3OWQ6w9CxkZWkyT2s1
         4B1o3OtvUnTbxUOIwPDchRb4wHUeECZXlaEh6ZYD7tghTUiOzMB/UOXq2SQUQU0kweMZ
         R7aepD4qTj/xgXpXkSGpZVP73n6KwVZIYJK1zX02XFB1qN2vR2BT3GayU2VCIaienn1Q
         StPw==
X-Gm-Message-State: AOJu0YyUMCv8Cmm3mVsObjXIiV6MvQUEDZkmm8gcfpF0v7I9RnCzp2F6
	PyjqqPwcba9yeauv/mSw2z8fMJW2FcVnZEbUhfwPbdthNzdwgZqBmiSgGn+vjDuM86kgCGbfDSL
	5KJA=
X-Gm-Gg: ASbGncvhbyMHh4kTh2GCPZfAs5cFcCQcANgVl2UUWWbyX8Kmewx1MX6Cq8YYnjCO/oW
	3QPlWFr7uQEr8SBQV9XIFHWmjlU6qs6IPaUNu/rckWeLGV5YRYI/kNcHn7xEwuo9tN+Msfv6vLw
	6FlpbH+I5+g5pmZ2xIG0Oga3WKwVJn+YJN1vn+xTc/t2w5f+ljxwHH3h1bF9mJbztXgGuAJC1+3
	cMP91+qxlbnAfs+TtunNrgN6Nm8oNkTWdG0AJilphDikLCrZS44gI7jSrOoOQKAYUHo0KsunXJn
	U+abgvG9OrZCgIb9pJhEsqaZip8NZ7iMdwA7VMtsxpFqfAN/kLYunnC7m4XatgvwFeKCs20Cd+r
	zQuOIKIXBVAla8xVxQdLctlL6PPuw2Md2XtRbu1gpoow=
X-Google-Smtp-Source: AGHT+IHVtazkKOvjOJrOfm04DNRArnB952epM/1Ur7L3bzWPScmWVjAQPWu02+n0E7WC/TG7fAuzAQ==
X-Received: by 2002:a05:600c:34cf:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-442f21683cemr21843635e9.20.1747211114278;
        Wed, 14 May 2025 01:25:14 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH 2/9] arm64: dts: imx8mn-bsh-smm-s2-common: Leave regulator under hw state machine
Date: Wed, 14 May 2025 10:24:56 +0200
Message-ID: <20250514082507.1983849-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Trimarchi <michael@amarulasolutions.com>

Let regulator to be controlled by hardware state machine.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index 5a1ec2f6a552..0d343ffdb7f9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -144,6 +144,7 @@ buck4_reg: BUCK4 {
 				regulator-max-microvolt = <3300000>;
 				regulator-boot-on;
 				regulator-always-on;
+				rohm,no-regulator-enable-control;
 			};
 
 			buck5_reg: BUCK5 {
@@ -153,6 +154,7 @@ buck5_reg: BUCK5 {
 				regulator-max-microvolt = <1995000>;
 				regulator-boot-on;
 				regulator-always-on;
+				rohm,no-regulator-enable-control;
 			};
 
 			buck6_reg: BUCK6 {
@@ -162,6 +164,7 @@ buck6_reg: BUCK6 {
 				regulator-max-microvolt = <1400000>;
 				regulator-boot-on;
 				regulator-always-on;
+				rohm,no-regulator-enable-control;
 			};
 
 			ldo1_reg: LDO1 {
-- 
2.43.0

