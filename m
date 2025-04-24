Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9723820127B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475752; cv=none; b=Gh4l+fcqYpo7WTCHb4D2oV8Aa5EYi7Tv8xkNBv5YHqJwNB5ZCDHQKAyimlySxHJKDa6WOVO8yYg1apKO2QUC6h6dB7vpsdCcd0tKqdXOACOeBvQnB8J/VqBT1baLiASZ3tTC3fnEWOevr4mecQwBRqds3sKUN49aPZ5bBb7tHUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475752; c=relaxed/simple;
	bh=HWXVCNEIxoZ2DGv2oUaqkHyisgW7GzYfA3+b+MP7RzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eafScKQcyov8EePLbYrWSIISeKHJgGqgHdIfCuQwDpNqpS+5N+iaaUKjlKcedsgX/3M1m0nla9ssxRcOF+R5GeRnNG7wqwrLXpD64OEOwKtHN/jclvDKCqanAzZOHU9/cdk+cyjb3fRs/kv3xTrjtRD3jD2WfTr8AsO9Lhy5Jek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=mzQVgpBf; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="mzQVgpBf"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf680d351so10610515e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475748; x=1746080548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCP5wX50ZPJSIbPo78DniGK7SxiDEu6J15Xy0lcbUzo=;
        b=mzQVgpBfTvh0yQvVjXdiLZduXtG2OfIcfTTcdyoyUDYuS/MpqzjAivCJ80DlHCXAxk
         Mq7WskJGRuGvHMositggatNafBLxukWhv75fRnnt+3m5XztbMlsn4RminQSPxdC7p3PC
         tipPGTfxWRwUSDGaZNAazebqbkH9fR8sD6vNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475748; x=1746080548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCP5wX50ZPJSIbPo78DniGK7SxiDEu6J15Xy0lcbUzo=;
        b=cAmyeEXh44DqdOFV767dYuL6FPhzsuBzB9hsi/kjRvH8wlFXQqE5kB1fIEJMznHaKt
         9VkZy2xM7+Qu+T2B66tCbigpn1Wnp1SNSVeBjZeoYV3eA53EDS/0nrQlrCpiN1uBiw7c
         MsG4Py3VSKXY+1LS3b7TELHMvGw8EZSpuTEqTbdfdqE7kX/L436NfznFMQs5XoT4wqtH
         g1ZTkbAmIR3IIimsFycrt8wMe+6p2wPadm5vtC1zUKaY3XlYqa7weOkYx+wmI5xEZNr6
         j1otJKUVdukJTrMi56H2oanJQv1myBQPfMg75oCNFsI/thupM22gLUOHc8UfUgFDPHfg
         UvJg==
X-Gm-Message-State: AOJu0Yx6hDOMxy3P1NghY4hpjuS5dBFSqLVnmkI98WrktA5VuFUnDvsS
	OHhm6RmEdp6TFiMEWhMSG2w4KrHxAuinWT/h2PoKZzGSb4wq1Nuh2tLyvuILFxLlSrEJl293cuU
	W
X-Gm-Gg: ASbGncsMWspjleeLWvkWLgUYNcLyBEcCcx8ouU/fRSWfY+uA0nQfY6cv5aOZyMuKM3S
	XFkkpxboi1ZdsTryZx0ewP06j+YS+Sr3IeQ+4fXYr65TlPGbMcyUUx+G/pXKnfpX0kK5Cd/efeY
	7puhscPsXVD3K4SKECxt1ULbcVRrPGa8ZkcnWjvkuZCSpMG5gP/2ix8L1OsHY0dHR1OP3by/Xoa
	K6o7NsuZjyOMxql8JxfbPOgJYQ8KLyRI6XdC07YBpg/5m1KbAMi+MEZ3Gdbli7h3oyLxuN81u/g
	xoDO7hIhd0SoNoD8y0z/N9hce5yci5MJSErkhpNuygdtkz87c+OzZK28OEtknkgRKD96pyu1XT8
	Ib/JR
X-Google-Smtp-Source: AGHT+IFoHdGVBD8O1Hzz0CKgZ9opqhMg+ND/xcdm2+qcZWev45QsNCVd+jDdCasqwcizMo62oEm1gA==
X-Received: by 2002:a7b:ce14:0:b0:43b:baf7:76e4 with SMTP id 5b1f17b1804b1-4409c453b1fmr7692385e9.1.1745475747768;
        Wed, 23 Apr 2025 23:22:27 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
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
Subject: [PATCH v12 15/19] arm64: dts: imx8mp-aristainetos3a-som-v1: don't replicate clk properties
Date: Thu, 24 Apr 2025 08:21:45 +0200
Message-ID: <20250424062154.2999219-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clocks and clock-names properties are already defined in the same
way in the clock-controller@30380000 node found in imx8mp.dtsi.
This also helps avoid the need to replicate further changes in case of
any updates to the DT bindings for these two properties.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 .../boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi      | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
index 231e480acfd4..6c6c6f180785 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
@@ -151,10 +151,6 @@ &A53_3 {
 };
 
 &clk {
-	clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-		 <&clk_ext3>, <&clk_ext4>;
-	clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-		      "clk_ext3", "clk_ext4";
 	assigned-clocks = <&clk IMX8MP_CLK_A53_SRC>,
 			  <&clk IMX8MP_CLK_A53_CORE>,
 			  <&clk IMX8MP_CLK_NOC>,
-- 
2.43.0

