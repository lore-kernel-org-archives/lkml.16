Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA2622B8AA
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 14:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748529359; cv=none; b=WRcC+Lc42rvv+lTQWUiHxWyp/Aj3cdH9/lHVmN/TxqQ+rAFYQuNkoV5pbDKvtaUCyuSKl/yo9WrYCwWVNBr41OYR+23SwLPvc2XtoAECyTDxKyJYf64Whv2oFmuLjYmOn9dou6EGgdT/jmAwc0IfJeZUwz6old7/qovZ/f3aBcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748529359; c=relaxed/simple;
	bh=b25DzXlkwtKRtrQxMdt2zt8u3SZtqu8bn40z4T7R6MA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SF9xL1T3tRnoBo0dlLDS+NhYexTzta0h+W+nrwipS2X141gp4P1Y+aOgIZuRHGxn55ZYSyykLp3gDgYV/yh+3dc3gac9hdyxySL/B1ecAdHe5wKKFPqMjrjGlV6ETIzRdeBuQBp/0s2TQVWg+Dy4NfymG7fHQoIeypthysjbd0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=qkPow+Co; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="qkPow+Co"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acbb85ce788so183424766b.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 07:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748529356; x=1749134156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkvbYTVTJvU7EjQbzb6YoDEjgSySPh9u6IORDwoh9j4=;
        b=qkPow+CoTIdJJ6jVbxpk+JwYterefFqeM3NI+irJZtd9T55NpokQgHBoj5tF/zK7Pr
         qmwelk0uUKQmXad8//cXFjxaJSwKSt6fRyqY24IAUoAPcf4DlA0BiUsiJ7wyY0kpEJKO
         vOK8E7+X6FWt0lySMkmqyRVTi7cQseuIbUB5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748529356; x=1749134156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UkvbYTVTJvU7EjQbzb6YoDEjgSySPh9u6IORDwoh9j4=;
        b=o/AaLagbuTSztadinuEZyFXJ3FWK6CRNEGhR5KzFoxu2VF9C9inCaqF6/uHlDdLbf5
         Zubxl5KouBUBcQxo236clyx4llhMHsLbwgVjvAS0n+o2LGE61f8HttQmXQYaqmVpNeL/
         0xNSORd/GJ1H9VBPHLswUi3RJe8O5Rx3kg/N7eluDTpumRYUEfKtRbH0oOjulYf6SDW4
         6mBNYD0ai1MQs9I5SY6PqLCAqeAaeew+5Dpha2U+QUblnRafYahgljhsKCMeeyGc1qYc
         7MLlEYXP3XDq7f2LElK1ioVaIO8YoyH0OZtcxiYohnIkLR8xPg/WauyZrPm+db7kfXuJ
         n5/g==
X-Gm-Message-State: AOJu0Yx2DEOUxiFXPqjKEk4PwaUtrmCwnydoiOEqZaJJ1GhOutoPpWOa
	pTSjy0pRWIeDWFaZFF9ezeBb+R9dJLotwmxiabOP5M4YO375RPFiAU1tjJgyreX1kzi7G++1U6b
	vU7nM
X-Gm-Gg: ASbGnctIDWB1fHME1/JukITEZet/CVk/jUpRCpxhCH4E9skFHb4oRTpTGRvz6AZDcDu
	BOKBEl9aOTL8mAVkInapVcb3OvsSnvgOXxpyyo8M450NWpK2QLO63NNxNQW5sqzW5cofxk581x1
	XU5Yl8x3U/MELr6MBh2au9yLV7ZdoCHfQjN0GT59K5wkGMPPR92taCxo/rnX0bwCdfRh2cTx+p/
	ucGX83LQXdYbmqlHi5VLkDb6Pv61tbUBE4c6BTeHlwbQHIQwkwXc47WF6UdWx48XS9yrvFkTQuJ
	tSeqTfztktsfxpsYldTnwZlRX7n70AHzyNQYMlfUdD1hq9vKtyh36MwDeu3gf1wTcMRVevsGnAJ
	peMXtJEMBR2l5t2VJ
X-Google-Smtp-Source: AGHT+IH7hMfCJ++G2vbyG6z3aDCBiHFQjVGVk7csEQiSuSaeqRhezGzT9pf16kPHKXh10/ID/WoiyQ==
X-Received: by 2002:a17:907:3f29:b0:ad8:8529:4f73 with SMTP id a640c23a62f3a-adadf2a1046mr245445766b.49.1748529355765;
        Thu, 29 May 2025 07:35:55 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff075sm154305866b.37.2025.05.29.07.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 07:35:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
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
Subject: [PATCH v4 2/6] ARM: dts: imx28: add pwm7 muxing options
Date: Thu, 29 May 2025 16:35:09 +0200
Message-ID: <20250529143544.2381031-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
References: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add alternative pinmuxing for pwm7.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v3)

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

