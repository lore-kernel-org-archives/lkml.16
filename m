Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A34C72618;
	Thu, 12 Jun 2025 00:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749688773; cv=none; b=I+rCUqfLc5z3eQtHYGrYlTsRTebV4mWrzXkk7D1hsnZjpjF4xUY3w+k2gt5S/xOKQlW0vz2Klo/NNskHhoC7zsyXucjAPqwZ4fxW5x8JW1rR2NvAaGPaTNKgQGRp1KTu1EoZhm/qFIBC7uNN0cYeRTyod1OHaGEyyGSUOPvC+b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749688773; c=relaxed/simple;
	bh=OCRJy48VjGjdt7maCoRzcrU0HXVOPhE9bV0BifHD7QA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EkWfTLV/LEBIFRIuzPRuD67UzroFaIy4vYheip1OfJF1DG6AKFCi1mp7iMzfKRxngWpAUu6VsthEQ/d7V0NM8En4sdv2Ti7gUBAxcX7MhLs05iGtoDYgF4djBfuL/S0IB1/lsS7UYB6sSOLj0KoJK5mB+T4CdDtl1LXQ4sfQtno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoWBjaOj; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoWBjaOj"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c597760323so40461485a.3;
        Wed, 11 Jun 2025 17:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749688770; x=1750293570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fZSTUHnpCdIkoln/SmuVNeKT4swv6cpg6DfKi1SYao=;
        b=aoWBjaOjKv+5bI9MgIQN4uDPNpULZrbWCIcAoePzEKzBLbJZf9DkJv+3Aub6XkwHxX
         I3qvgYlVFEKS9v0M6IQmD/n5BXvqguXAjNTn/Fa4WqCRSuYqcXFKeeAPXEq554XxHvY1
         0tXyHgt8hygjvdyqf+zE0S9mQ+PXuob7N5DO1dsaxkv1ZJeBKG6yniczSOxkKhDjeyfi
         nAXxBxJJl2DVlhEZjLs+W1gIRwY7TSODlCpbZK6XliBiu8ryX3gaAQKIz0Pma2QBnyNy
         jhDWhfvolUdBGg9p17jTrjcOgIMtwaG5FOItgesnIyWUgQtocyx3r2ED0zHgWRtUb5Ux
         nPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749688770; x=1750293570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/fZSTUHnpCdIkoln/SmuVNeKT4swv6cpg6DfKi1SYao=;
        b=DluFp01QIe6dPQojITsmSGY+VqbMu+ZXKyd5VY7c01NPAEN3fUZfqMBAzZHJI/YbM8
         CPpwNTouBVcIPTjaex88aM44x4aOvJ8f7Hbg2i4oRCOPn8WjionmaYbZsOra3HEfhqP0
         bTVd7Chq+zEdW95QavPUMPSBNlHr+6x7ZgbSImmhWW82aeTPn2lMmopjMmTqd5PgmKBo
         P2QR/WrZGHCR2A1tOdDpIZ31T3tY1on9ZQQCzPug3LDtTMZVaHQB+UnkKgvoR/tFWVqL
         JHnCu2+1N9fAAUXiEjB8gaczg+THyhObcWkp2JayR+ndzeY7HiNsNqS7ENbOtgFllK3v
         r6nA==
X-Forwarded-Encrypted: i=1; AJvYcCUbcVlSBS7nJ4m4gvqFTeuFg8q+QNZUHTUp/LCw6taoKZqj3/sv+i5ITtZHXZtBsAfCs/XuSGW1zmLggJF/@vger.kernel.org, AJvYcCXzJfcjbq2dGrXGqbDifBxDx+70aDI9vrJqEXaDybKspXVvpi595CkQug1UBe0G8+oiQBhEvsNhf9jX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7BVy5ql0JUejIFIuynTYV9yDP73J/F7bVG54VDzV7H0DOQB6j
	wv2oyc2pJWh3qFbxqI3G0Mt2rVt6wD6cT7cArg/RDysEotJPfVTWlFD1
X-Gm-Gg: ASbGncuDV7yW419oONYohPqDXRVN4uPec8vLS4M3rjlzYS/a/FBWbyma/mgmrLkEbGE
	OPB9aKRBpKFUE0UHTu4X+FHih3SnXY4VMliVuuqXzgt0/sgARgeVCp1vYvwMLsjjBvec7+c/GJe
	I6gjHdHXQ5zBVvckB5rCeeQciEPF3915koCzYg9fbqFjnlE8go/ts8GWKrtwuRQxPLG3vjQVsKG
	UvfutTMCoVOH/r0XQzrTocv571VW8zcsfrWS+Z3XYYxLs46DMFA1t60JHSZVBMVZE6S9i5CTQcU
	FZcQDN+jyJLalfFsfTgy9AKojfVVRpoKgoyWAhM5YsHUEYRe7QJQjeBGU9SolUZsg5WTcTOKqjN
	pxV9JHJxlRlyL3EwSiaRqZ1ImnuSwbjEn4SlGWyUbF7R4CPc=
X-Google-Smtp-Source: AGHT+IE0T4IWYcc2xUgd7VquqVdTsmUZWXLcctw/Eb+M2rfGp4uWepFmDd7rs2MYip49/yRfcZCKug==
X-Received: by 2002:a05:620a:1a21:b0:7cd:2857:331c with SMTP id af79cd13be357-7d3a893a2demr669978285a.42.1749688770447;
        Wed, 11 Jun 2025 17:39:30 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b528c300sm35935485a.101.2025.06.11.17.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:39:30 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
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
Subject: [PATCH V2 2/4] arm64: dts: imx8mp: fix VPU_BUS clock setting
Date: Wed, 11 Jun 2025 19:39:20 -0500
Message-ID: <20250612003924.178251-3-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250612003924.178251-1-aford173@gmail.com>
References: <20250612003924.178251-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marco Felsch <m.felsch@pengutronix.de>

The VPU_PLL clock must be set before the VPU_BUS clock which is derived
from the VPU_PLL clock else the VPU_BUS clock is 300MHz and not 600MHz.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 1bf15c502280..909555a5da4b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2283,8 +2283,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
 				 <&clk IMX8MP_CLK_VPU_G2_ROOT>,
 				 <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
 			clock-names = "g1", "g2", "vc8000e";
-			assigned-clocks = <&clk IMX8MP_CLK_VPU_BUS>, <&clk IMX8MP_VPU_PLL>;
-			assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
+			assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
+			assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
 			assigned-clock-rates = <600000000>, <600000000>;
 			interconnects = <&noc IMX8MP_ICM_VPU_G1 &noc IMX8MP_ICN_VIDEO>,
 					<&noc IMX8MP_ICM_VPU_G2 &noc IMX8MP_ICN_VIDEO>,
-- 
2.48.1

