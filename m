Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833CA221F24;
	Fri, 30 May 2025 22:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748643447; cv=none; b=j7YsKMGrFUvrpb99WRSRI413glSsA/74Rfu1tnPm54V+2zfrISkmn5unaFrNWquWDAEDYE/61wHxo8qjz/K/RNbLt6u1+PBnhMYyV9B/fEF2jao75KFrApajcbj79n+ovsCc23LdJeIDMa/eXRAYrM3lgDVGQ1K+JdPZZKrRtDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748643447; c=relaxed/simple;
	bh=NI/DZMbhfVf0gYJHLEtDEmzY4sUAm9HVyL4cZFmkHQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TTPO++t5XojtcnGxJq7GwSettADdCY/rFSIkhoLTPB1Gjz2XOUYMsYTdBQYo3jHf/AHMPj8C1Kb7GhDE1xfveDYb78ZtvLn+8S873D5LDou2anXPKpDzAkrse1EPYbuyBczxX67dW8HXpXNXRDzKgDViqTJPBp0poaSLdbIfNo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fASy42+L; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fASy42+L"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fad4e6d949so5386776d6.0;
        Fri, 30 May 2025 15:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748643444; x=1749248244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIRBbaOEjVw+z1s6TRr7Y2JzFyyPMWjFFvzVpnYEfa4=;
        b=fASy42+LczSlBnm0UrHTjfm54LQpSvg6r8ojdLFjrXOIZUFHWvhqwu3BVjnKYUgP+e
         tpZZfcyc0n0eu6JrZQelYtVxHxCLeHCrMcXAtpnGIP9jwnBcONsUAU/PFm3qsEPnUygH
         I97bRkvtRjDnbHIkBSDaahDJSM5pOeZlN8LWE8AzN/ApX9teNiv08QtHnABXT8ml8eXx
         4y/2bgEaE1EsA9QBy5a8p9JTs7UT7J9ZVi3xyDdPN9J7c0GrXJfYyJiXcg+NAKON3FvW
         xCFGYk6jp4GdwPnJ56HA7/bFVLAx5RVgwtlRZpWIKEKauWnLlgXLo1YN1ZQSelwNXP9x
         97Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748643444; x=1749248244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIRBbaOEjVw+z1s6TRr7Y2JzFyyPMWjFFvzVpnYEfa4=;
        b=BDywvR3AVWZN42+YHsXdFq7ADcJ1OwatmT2k68MyxeQ7h3nRHrI7YY/S9mJj0QPkj7
         oQ4W6SZztGWCcIdApPFSjW9L0Ec5u8IfCDsnCBPI0ZLdYqTXnOqzZ/mO7Q0sO3Ha9g1H
         YLEmbdUrjgQYQTrkG4K5ddoIb09ummsovKokr8ASlYYuLI/HVPk46gje2v9RNuwqoMhE
         Ua1ws3c/YofamgbhTndzeRHP0Hk+2ZulToAIu3aA6qD8sziXxwFcESIu7up7Pw7VEKYg
         ikTWggAm4WLpU2tfhmRLBt1AxbZ+c+DSeE9vocYuTMibm2LnUAVR4KHXmHF/YtUt3aEb
         Sw4g==
X-Forwarded-Encrypted: i=1; AJvYcCWmmEYo47YJ+vx9VA1hKzxlLjY2hQUjS+o7zVcpWronK9hxiWA7doGS+PeVD7Jon0hwM/8UTaZIEamg@vger.kernel.org, AJvYcCWnhHN6ZSY75heaouFcVI1cCQqEWF72XSY5I6JM0+XFPsG+WpSkvo2VAYmeCMa/f910FgDtEcZxhu6rmPkZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzHIeTqQ3D3PhJy73RhjEVEkwwL5sqKDSGSuV+g1GovWAZAFtSb
	eiJp4s/GvuNyV+cGhb7hAOldXZvohZ1dQD1hZeh8rpg1zwYVTpOkz60h
X-Gm-Gg: ASbGncuzzJy8HEhhHWqmvHRi7zwlSRUJLe4OvAWhbusdFyeD/mG4IXWY97HlH1H1x6o
	2znA55Wep9Nv9B9e06SEphmAbZJi3LpsicInvhfN4QJFbDBU+Dlx9sdbfTROerkbpTsjN3flTWG
	xwYaWuf67zkVBeG6AMtIW+aXyl34T1gLLeaz3xIEtRYUKeznXEoKFxqISwvut3/FOF2yKorYxGR
	00RTDruozJhVal5di6Pv+jKQGrd1LI/fXW9yS6KqGVZDdGGIDRESjOlCOatwumQAbjFQy4SMcT2
	EKa4KCXSu8bJSD8tHt1Xfo9Wx5URzc2EiB2dwaepmqW3Uw7JTKWU9tv32S0SBLTj8rXjTVRwEUj
	fv5nIAYJgMmaSEoBqImtewL5BwA==
X-Google-Smtp-Source: AGHT+IHNIFceukgWG6Du13MXecS6a6ABaNhOzxuX3ppo7fgyDaEE/c/wlZh8kZOiyTHQ1Fg33/RQ8w==
X-Received: by 2002:a05:6214:2461:b0:6fa:ce87:230c with SMTP id 6a1803df08f44-6fad913ac01mr2942996d6.25.1748643444226;
        Fri, 30 May 2025 15:17:24 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4d0cesm29986866d6.35.2025.05.30.15.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:17:23 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
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
Subject: [PATCH 1/4] arm64: dts: imx8mp: drop gpcv2 vpu power-domains and clocks
Date: Fri, 30 May 2025 17:17:08 -0500
Message-ID: <20250530221713.54804-2-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250530221713.54804-1-aford173@gmail.com>
References: <20250530221713.54804-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marco Felsch <m.felsch@pengutronix.de>

The GPCv2 G1, G2 and VC8000E power-domain don't need to reference the
VPUMIX power-domain nor their module clocks since the power and reset
handling is done by the VPUMIX blkctrl driver.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 948b88cf5e9d..1bf15c502280 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -876,24 +876,17 @@ pgc_mediamix: power-domain@10 {
 
 					pgc_vpu_g1: power-domain@11 {
 						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
 						reg = <IMX8MP_POWER_DOMAIN_VPU_G1>;
-						clocks = <&clk IMX8MP_CLK_VPU_G1_ROOT>;
 					};
 
 					pgc_vpu_g2: power-domain@12 {
 						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
 						reg = <IMX8MP_POWER_DOMAIN_VPU_G2>;
-						clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
-
 					};
 
 					pgc_vpu_vc8000e: power-domain@13 {
 						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
 						reg = <IMX8MP_POWER_DOMAIN_VPU_VC8000E>;
-						clocks = <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
 					};
 
 					pgc_hdmimix: power-domain@14 {
-- 
2.48.1

