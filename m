Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7101D131E49;
	Thu, 12 Jun 2025 00:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749688775; cv=none; b=HK9O2lboDV6SSbZjPSEGmNnR2Y++pWodm0F7iduv0XUQp1YyDTvNz1hl1CWwwelzZDddTTVgJVWaNHyalEtqiGpXvSlRYMLDP2/k6AZvK1sV1qqwNcaR0i5ZTYk53tJnSxaJXj8iIfIy53G8CIhuVwg2aBOyw57otgDN7Ld6FY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749688775; c=relaxed/simple;
	bh=5R1Da6HbnY95VpTxU9D1slBlRFhdcsQvBhecrlxys6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=up9AaOYioYv16k1foJY43H+RDVj+hWgseVHYBOMZvqS4Nc2SEsYZKBogP7aploW5zZ9+MZkq0e7gRhgzuzDjrlSvNGhlSstEaO2LjSn40L7PiNw3kxH3KUYeNsKWgYpsEG9WfNtJcDoQ4MaHA5hb6H9dxOcdrXhBTaE5iRvCR48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCHtCwhy; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCHtCwhy"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d09a17d2f7so37095085a.1;
        Wed, 11 Jun 2025 17:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749688772; x=1750293572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZcV6dgLUABISNoRbLStZXdX9ieJsM3t2TsGeLFmrck=;
        b=DCHtCwhy4NfST1QkPAi8zmbtVNyMpakxuFlSQRlTVGGp/HHdVGAttOFx7/kvd0zDl9
         LGzaVuMMLs8NT0T/UdEYjGlvehItJspgASiKuce0S/8P4oiQiHEnrhG+udLrStwl69Rb
         c/L6AybZTehONx7PNJedi2U1LN+uN1kkZ9WW+DpwfojfEbrUkNuJcLkzs5s0DMKKvnGZ
         yQ8KzdhRtJSsEJ0JkIfzy+lxwDrdaWabG5JUlRU1w6D7BX2E1weR0FoJjv/PTTkfCdQr
         wo4Z0HrNNouAVPg3v1+a/0i951LueIw7xO4Rar7PCuKPeuMtcBwY6e9bXKCTYy5brEJI
         usIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749688772; x=1750293572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZcV6dgLUABISNoRbLStZXdX9ieJsM3t2TsGeLFmrck=;
        b=UM0I3JFeRJKdPG5g9GHZz/TjCpFMx51Y4MPDJlneVzHcf1Zcq5JXzXER5+haT9NoKQ
         6Ig/LPfdbSMT0lVTmyZ2mC+Z9tZ0v+GV/wrLaF//nyWBnyYhIAX5bKiWgeeHrqLBmKY2
         bbutwD5ZQYVn1Yi2L8VClSu02YBbxC08dRbqGRZU9mCDLUWYAvl733TYBFo9/kj4sHRy
         gu7CH5RiUM9jqrI4EIhk0jzHK3aJL6PpQVoxbUo0yUFDnvYB1zVWwUcoW/UQJo3JxWoF
         /yN8tdTsl+xzAKpyhPfPDim2Fyh4pZ0OjVAscAZhTqYAEdxlhirkfgyHwiXbkpt3eZdU
         dRwg==
X-Forwarded-Encrypted: i=1; AJvYcCU0QEfjLJgHpd6Mn6EsisU3DL55YMwD0d3olALenwR4ciaX12nVV3M0oIWz/TmLsoMCr8zWOcrInZT0/3T2@vger.kernel.org, AJvYcCXKYFgoh1RVkOlpdSNwGmCZ9Lma4KtKeRBvGezOsHkHKfBlK5m24wcxdSkM7mFtd0e/UD5C8ppwZQaz@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdtx6TcjdpcLnIcq7flAge2ZzTpYB4mhmNx7RMw2RwN0gp7u9y
	iikPKOyKXIVZ0AepVlyKl7rVlS5ZeWgqS2RMnpQQ7hKjkQJvCBcQsVEz
X-Gm-Gg: ASbGncu77eFQ8Wy10qOH+MqxEDwfi+477CngI4dFMscEuybi0/scUbLslcF4ZwUrfZn
	Sc1L1oPXj5JYmYO8vpNJnS4/0wt9PgNRwK6a4Cihw2cNXUOdl2pWJ5YkKOkdv/973HexDp7QhRN
	/JtKVKYbT7xVxTk7UDnjWYzkr8FdPg5qJJGHLgpEl64DRBwoNH28Ijs9ahRZB6/12QGSEz2/xZl
	C4S6TK0JeN2Yu1SR/JJ0mNDHyIgdFJximzyfnq37Caq6RiXYwj49qiDo+S6kPRisO1uA3h8Ek7C
	5KOMKWIP0O9Zg2Yr9QoBVlTcHSB6/t/K+fSzhU9twM7bkDx4cXhX+uSfP5NKmFVwxcmEqePQXih
	ChhNpXUs38rCMIzl6MM7EJOmRS+9NYha5tInCzLvxmgHYBrk=
X-Google-Smtp-Source: AGHT+IGRbZTWvC22X7R6MpybUVtQlEi9vm+wQQ7hM+fS2BleTAKnnL9FMh3Xr4rqjJfDAkR/GVwBLA==
X-Received: by 2002:a05:620a:1d0e:b0:7d2:2833:6dff with SMTP id af79cd13be357-7d3b367bd6fmr167393485a.26.1749688772273;
        Wed, 11 Jun 2025 17:39:32 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b528c300sm35935485a.101.2025.06.11.17.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:39:31 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
	Adam Ford <aford173@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
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
Subject: [PATCH V2 3/4] arm64: dts: imx8mp-nominal: Explicitly configure nominal VPU clocks
Date: Wed, 11 Jun 2025 19:39:21 -0500
Message-ID: <20250612003924.178251-4-aford173@gmail.com>
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

In preparation for increasing the default VPU clocks to overdrive,
configure the nominal values first to avoid running the nominal
devices out of spec when imx8mp.dtsi is changed.

Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
index 2ce1860b244d..f269f7a004fc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
@@ -89,4 +89,22 @@ &media_blk_ctrl {
 			       <1039500000>;
 };
 
+&vpu_g1 {
+	assigned-clocks = <&clk IMX8MP_CLK_VPU_G1>;
+	assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
+	assigned-clock-rates = <600000000>;
+};
+
+&vpu_g2 {
+	assigned-clocks = <&clk IMX8MP_CLK_VPU_G2>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
+	assigned-clock-rates = <500000000>;
+};
+
+&vpumix_blk_ctrl {
+	assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
+	assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
+	assigned-clock-rates = <600000000>, <600000000>;
+};
+
 /delete-node/ &{noc_opp_table/opp-1000000000};
-- 
2.48.1

