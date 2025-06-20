Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582C6238143;
	Fri, 20 Jun 2025 21:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750455293; cv=none; b=o0pubHG45htlQyniWrsl8lwfpVm+4DXraB5cLE1yqCWGD4x6zrS/VnoVrLh3DzTgoC6xc882E8c1b7pnmOWJyV55WiZSplQpSS72yuC39cP/K8z2+LCx5rVFNBVCdJ6U1uaACoEDGKKEUDglBFlsZ6HhY7dHc8SuWc7FB0R44YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750455293; c=relaxed/simple;
	bh=JZcPrmMT5XJkv0+F82G6GQ0CgzHmHpYaIi6+hrUGM9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EiK3uoexxySA1ywdBTAag+ieco5OUlG2BSrYI4j/q51Wm3Wm37oeSr6lDdXOn+Xhd/9Ev9qbZSBBzX9n5NvDexakyJpu+wkwDG0Ina+tW9Lk+Wm+wD5+m0mP7tla8J7oYSDDxDt8MXJ+31G/ECGxCwFKMAC4jrA2oL4W0z7TrmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arbkEczQ; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arbkEczQ"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-875f57e0cb9so209778739f.3;
        Fri, 20 Jun 2025 14:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750455290; x=1751060090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2bV4/erAwfXPlPi2hHxXtxfl2Kz2FSJD4cbVQEOlp7w=;
        b=arbkEczQuK7EJVnjmcvBhhySa2YU45a9aVkhxygak+8fzaMV1hFLJX+MlNKJHOS+XE
         2oOKvg4AqQ/Jxc834nWEbJptZQJgk5ZCavAw5KZRzzVN2js4NS920WivMkoLI516pK8n
         Oc4kM6xFT1gJ/mFBjCkB1sR4JkoENrclymCbMtDXXaUsyMecReLBvuEfhG3kEdbI1ztE
         a0cjtsOzNBVHRxQOzuj1Vkz83oy8fHIrEsJf+bZREknMjy+4l2LEw16BbDZkSgEAJEDD
         f4EIfZSZPVU+sM+5b+U9eQA5s3Fusj5s7Ag3ayIyvHDwBfdpWgVfsTzV8ePWqe8PbMPh
         HRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750455290; x=1751060090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bV4/erAwfXPlPi2hHxXtxfl2Kz2FSJD4cbVQEOlp7w=;
        b=MNtoA9pO9NKrsozM9ypYcHzuyxxyo98n841iOZ9IFXf1iGxNKuhC7+vLZVF3Oa3nqn
         n058metaCYupGsWRYc5d8uK+vxZQJSN6GV9IkQstbPlRbA73pZdkoXYPpt3IdeEWCblU
         x/CuA0tnlAzMGvdhtyGVAcvRzFREQJs2FfB+fivTeeJNcjF0kPGPysYYl7CoqY5b4tyr
         6tw5wt5eZp8xF0T6AlLm0Oky5aN7lWDEf4H1wiJUure93OqpgQ+hwaOj5M0FLPrdXWXJ
         2sGAASwqIYDVWlFkaAVTMEdi0TWdbfE510qleWSR2SCqB2Q1i261Z+8ZVFIr6ylvnFR9
         cu+w==
X-Forwarded-Encrypted: i=1; AJvYcCW14h8M1UYatkB28XVfj8SeBIZVM3lb+k8StwyWWYMKODdmhjAFzFr2hwivMQoe9eVb3qeJ5PFLkzEn@vger.kernel.org, AJvYcCWLYwYsd9aWj/Px4p/WsMBUkDhtl9YrI9FCzi2kybj0nHL9AB4C/dHwXuNFvBxL1UcmJqsH2b/9uaRtfVIg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzc2rY7KYdaMWgx+4Poe198HS6E09Q1aYt4ycmjjTCDBmv4vNJ
	KBSH7TrQQNfMIQtj5eWvvr6Fj/mbvxWpy10+G9qsvxyBwStn+yZlnOt7zJ7a+Q==
X-Gm-Gg: ASbGncsKzu+WpLqdcQLeXJTT84Uc8Ik0ftOQyC0ZfW6dpLtkq9bGBYS1Q8kZlKjekjh
	gj8aSKALy3NwSumtKh5dCthbaszbz9LG+bMaY7Wu7n5irGjMeTQPoTqMf3jp76Z8J4QEqglvpGG
	bZ0Z+JWOc8vEseQqgSH5Q1hQlGglXwEaoxK4xONAAj/LStNIMZU1JjPW0LtEAnINL/P2319rof6
	mYowv56gQeQatdFsIZNvP7Y9y7srJdy1U9KkasgVU2G4DDBUuXyTnBiDNTWu+nothe2mWGvaOZh
	/Dj4oX/BVsIb3/D+Eqt+UgbWNVMhWBpqPWM1q7aqRuvxruAtJgTnlCHD0bWGf8ezHMI+5Xaqe91
	BgUuQNTDHd2igc1MSv1397uFPDAyirzRV5n3v
X-Google-Smtp-Source: AGHT+IFXCoHIdC1hxKQ8Wh2O6ePURz9GDmLlEmjUZKSPhjqSp4Y9n5TQYb99KGPA9gmaBHSnoG7uqw==
X-Received: by 2002:a05:6e02:228e:b0:3dc:87c7:a5a6 with SMTP id e9e14a558f8ab-3de38c1e68cmr54940105ab.4.1750455290137;
        Fri, 20 Jun 2025 14:34:50 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5019e0d03e7sm546707173.139.2025.06.20.14.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:34:49 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock speed
Date: Fri, 20 Jun 2025 16:34:45 -0500
Message-ID: <20250620213447.56392-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reference manual for the i.MX8MM states the clock rate in
MMC mode is 1/2 of the input clock, therefore to properly run
at HS400 rates, the input clock must be 400MHz to operate at
200MHz.  Currently the clock is set to 200MHz which is half the
rate it should be, so the throughput is half of what it should be
for HS400 operation.

Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development kit")
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index 21bcd82fd092..8287a7f66ed3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -294,6 +294,8 @@ &usdhc3 {
 	pinctrl-0 = <&pinctrl_usdhc3>;
 	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
 	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	assigned-clocks = <&clk IMX8MM_CLK_USDHC3>;
+	assigned-clock-rates = <400000000>;
 	bus-width = <8>;
 	non-removable;
 	status = "okay";
-- 
2.48.1

