Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B405721ABC6
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 08:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748507533; cv=none; b=M73GcYNq0gsKiNzZy4ZZcyXLNFUrP+ZWZwEiI8s7LAKWNfMvKNYVMI4taKIMCyv127bqrE5WUKvvUiSlsa/vUNlMopbP6T51G/X70C1cR0Abomo3/Xy/EN4XyV1P0eyVZokm8Bp55OW+JBxGcjzHvVoYMIKrNYSlPMHwmvQrFKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748507533; c=relaxed/simple;
	bh=4ITvAOY5SZnpMgKLoIBNZ/Af1z/Tno1JfKRlDjhk/AI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kwoZqp+rUfoV3F65hFjRyz8YUDUrrlO4X3E08QabGzkBWeU8jZbWo+muC9QhXPt0Y+J2QWfl5sCMd7Qa8u1f3P7MK+APjFRK6LVIKJcdcFAiX1lK7pCGJZIFVHruls0KMT3fOnzrS+HVQX57rQVPnRaqe/nXErXFR44FZM0ntSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=bRD7c4Lj; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="bRD7c4Lj"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acbb85ce788so115001966b.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 01:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748507530; x=1749112330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLld78XiVd+nLe8SAk0vnNkUleLC+2Mse8SgdBs27No=;
        b=bRD7c4LjK7sMpPvjk51CFbAabyi+yCOeC3RkFOXGpTDvO1VV/G0XIqVAhMe7o2uzyq
         W+PEI42KeSCtJ+eqGlfWD/Vncf9bd0MmXcA7Lb6JxhHJLPGa6r09GqoGCowaCUGtjdyt
         0IRtTm9NXj6b+SKFtbEEx+cKXYzWxV6arOf/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748507530; x=1749112330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLld78XiVd+nLe8SAk0vnNkUleLC+2Mse8SgdBs27No=;
        b=h/hm1gTvOV47E5gozOmrj3qA9GGMrJwqtrktagLzHYXVXhkyp0QnRWbDni8a32dka5
         hD9ELK/vnNiZza7mu6/HvF3GaJa1OUca9dqvTUCvqgtpZCbJQWyyHvSQmiaprwPgwcR8
         H22pxF1lqOs3X29ZuXFOtp18M+Z7ageEPaf5Y2DdAce3IOOZBVakqBlJGmMdNfkL6GhX
         jC3ia93WYCKOImNAFsCglN0WtrYd86hQqHnrijEFtvRZIGPsC8ts7kCeCHlhivGsvvAM
         tQhe9JREoKlLdg2+NGtNK3G+alfFz+GhW0jupmlTYgW3A26OEdadA7Ez3bgKUqJlA8L3
         W4ew==
X-Gm-Message-State: AOJu0Yw5zNVVcDuNS+OXkZzWH/bvJBk5tboNLaxaKyCdppO81O6izOqn
	jB6ofZ1BUbmXvVJIejinXVPEF8cImnFAuFIOEzsUzL6ssIuzcQvilTW9ETZUiBp99jrXi5EsB6J
	SOFNL
X-Gm-Gg: ASbGncslVtdNd5WC5kdDkPY7WTfuABqifuOU1iXWKyM98duGDBbj3r1wGnX88bNQcL3
	SAkOLpwvZ1tl2OL3FfvPeANwL9cAm/Z3oopcnsH9Z5g2f4AVAcJIawsYItoTLm5PcRpOBN718X5
	wdEVCyuaekJcDqcLRJg5T4VVoAOZo6Myi9kPxhD70LnITf5sSbSJnZFMQhXI7Zy3qq+WOt7IfW0
	KoOnIWV/ie89Pf2GPBWGH642JMZ+c7fZHafLtgNF9GwFYasKU86HvxCgMV4SkbZjXdhHiyPB72E
	EJJdDduJQQ8URhVd10tkEHdrCQ2Iz3kNcBgnfUPZDrb4w124T7W/EjNKoF+jct2UPY+ocYlsiBQ
	vwJTUG1IDQyR4GyixnSioBFuncYU=
X-Google-Smtp-Source: AGHT+IFdikkmzQilN7TiGR565IDIriKeCOFiTpijPBoqeaSwXu+CGLn9Jz9Qio+NdGj3viXD7/eBzw==
X-Received: by 2002:a17:907:6d11:b0:ad8:8ac5:c75e with SMTP id a640c23a62f3a-adadf2a2945mr112016566b.60.1748507529623;
        Thu, 29 May 2025 01:32:09 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e87esm100609866b.63.2025.05.29.01.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 01:32:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
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
Subject: [PATCH v3 2/4] ARM: dts: imx28: add pwm7 muxing options
Date: Thu, 29 May 2025 10:31:05 +0200
Message-ID: <20250529083201.2286915-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529083201.2286915-1-dario.binacchi@amarulasolutions.com>
References: <20250529083201.2286915-1-dario.binacchi@amarulasolutions.com>
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

