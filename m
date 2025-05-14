Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6846223710
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211127; cv=none; b=aQcQf2eO2EFJPqFAdV8rE/77XLubX1ZgYQWqxNqIEhKqQN5vOGDQE5QEwNdPiu6zMBizvsjCxFYwa//z2iWwdRmhYKi7oGJoINUAYYm2IXwu22CqSeF81GWREm3QD/mJ1v1qzyV/KlrrAYVTe+adZYhXqGNgaF7DOri2zhZt0Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211127; c=relaxed/simple;
	bh=v1lj6aIoiBJtVUQdgMlwatZDrIj+3w6BOUH1TvFoWTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oxSER6a490313qKtmTpUsb+QJhLOcOJmBkIL7pwUufrk0nZwad/W/nAyTj9aCV7ms1oaYQX8Mt2liZNrucH+gjeiuUsgb8rO3pZcU3zftJgOMAzq8erukJSLb5RygLoFlkXW1djRFq6SAMw0FcOKYjIdBjX163bFgCd4rRvT9jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=hJsmYaRW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="hJsmYaRW"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so48623535e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211124; x=1747815924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhlcmOITgWC0ZjhzH5YcAyhWpu7bV5qwJnw5n2FjucQ=;
        b=hJsmYaRW7HNHK0L2Zdi3JE5rzMq2I+0EsbEVC+0WExVXn5R4heh8PJFniZwhcEXIu4
         6TLK7cpM2A8tkJpQFPo5SKFaY4MNt5Bw/TR/vWTUcfzhlz42tjlZTbbraaUIXxO6lKmR
         RId5Lz6j4RaIVAJF2oAslm7iB6CaQhryhnrZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211124; x=1747815924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhlcmOITgWC0ZjhzH5YcAyhWpu7bV5qwJnw5n2FjucQ=;
        b=PdAnz0/ZgwyUpOirFbuX5QR/b4FtX2ccdppgPaBPMjpUfBHATmmhpf0PNeOaLkUWrQ
         7/XN6N8sUAvD1lKBpvCqfNNNx9/4Zckf15WMkdnWPmA1f+DUsJnqp4wPfTqhGTS7gW3R
         MUcFEY23nOOeIR37W2CJGJLQWIJ+pISIeIkmYsxiY4WuxlE1AVrc3uVxOPLxPpHo1DXL
         rOrpzE+m2HjKq0iNs6wDnLtDccUbGJ3OgRKQzLcIh7Y3uJsgFWIE+LtCaIzhtn929MGs
         CJWWA0zWXBzkcUmSou/Q2Kdv+ucUL+fawNs4OZxw4MoWiAvAo8sM7s3FLFj7tBj/O1Yj
         aQgw==
X-Gm-Message-State: AOJu0Yzm33L9anR4XIrPnhqnTQKGxSJ/GWRwHgqeqeG9NbBNUi4uUH0G
	rgUSzALU4cfGZGWsvb9zlK2dY82AjLAWorey1Zz3fvEM/tQ+VwJm+uuCkABM8BzZXv8VIIX6z3z
	jRPg=
X-Gm-Gg: ASbGncsEzyHe19+ujvttRRczodr8U+BnY9a+fOihyyHDm9b2TCGFiTBcFZFXxSM61o9
	9N1Vf2mGOMsHzBcdTnsCQyNtmp1F9iM+G0Ju36Gt8vpaCTEWmznzY7di5HktvUG/hbVP+xHEROT
	cWGsZRMpKPo8WqTox5NWW2MbGd702ESX1iGKJN217UXHPq5ItBFcawddE2084JX5+vvdowomSbt
	3iah6O2G+dUXwgqDjnGS2C4ZUCy9EMiRm0QXu824H4MSup36wNP0YV+Ss6lZXA2S5iq7WVCv5Si
	9wBddbt/0dRNhLKxNnxYahj1uqbHXHKL/sq5DMtCv+ZmYZF7Zxa3DuAHiqE4aRIYBWaND7bueVf
	fI4IF2cOCHj9oxBM8D1a+rbKus4zLA+7K8H3zT6mUNU0=
X-Google-Smtp-Source: AGHT+IGAQQ9NlUKuvedZ7pLG0Sc9I8RQwhVN2gN0j3XvRSIGwZgxGrZPudb3M0+2G9JZsIqwK0mXVQ==
X-Received: by 2002:a05:600d:d:b0:442:f44f:65b with SMTP id 5b1f17b1804b1-442f44f09a9mr11192865e9.32.1747211124008;
        Wed, 14 May 2025 01:25:24 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:23 -0700 (PDT)
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
Subject: [PATCH 9/9] arm64: dts: imx8mn-bsh-smm-s2-common: Disable PMIC SNVS reset target state
Date: Wed, 14 May 2025 10:25:03 +0200
Message-ID: <20250514082507.1983849-10-dario.binacchi@amarulasolutions.com>
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

From: Wolfgang Birkner <wolfgang.birkner@bshg.com>

VDD_DRAM was disabled on standby, therefore the reference hardware did not
wake up reliable. Use PMIC reset target state READY instead of SNVS, to
keep VDD_DRAM active during standby.

Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index ea8d741c6904..633874b3bf66 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -94,7 +94,6 @@ bd71847: pmic@4b {
 		pinctrl-0 = <&pinctrl_pmic>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
-		rohm,reset-snvs-powered;
 
 		#clock-cells = <0>;
 		clocks = <&osc_32k>;
-- 
2.43.0

