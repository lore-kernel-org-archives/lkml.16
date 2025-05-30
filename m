Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B522D28B7DB;
	Fri, 30 May 2025 22:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748643450; cv=none; b=E1/u/8qlPPZFijNyshTbkBVf6OwDzyWMT706eOvw9cKNfKfE5sVyLcJoXr8Bma9hADH6KVM9ENpgrummWKZHBlv4k4HKR1X4Ot6Q+x7gHW8SvBbLx6mgOTY4WqHaVqNQtfwAPnb1G/r8Dj/mS2dxTbSMAQiDspvW4DdbZWyIHcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748643450; c=relaxed/simple;
	bh=E5H/erw5y923F19p2XHINFrU5SM3HyTy5X/CEi1U/M8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MhoMB9yNY6Ikoq8XnO9rBqlcsnI2v0NNDdFeOUV1ejOeHmp+AZaCDNppLBz3vEp4TTTM01s1ozttfvoUM0fK6sw/QGJL+OBHY19gheKXaYqjy9TdP92pssBcITibm3U1rvZSSB90rwlcUnTpukymxeJ/rGsTk658OrpBD4LIZbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=idrJgqIy; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="idrJgqIy"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fad3400ea3so9757036d6.0;
        Fri, 30 May 2025 15:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748643447; x=1749248247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYgSXYoxLM00aOyWXvUIDH2ECy0jZwwoRHPTqVPqBfY=;
        b=idrJgqIy1C3Nue4KYvmSTFrgj5Pbm5WLRa+nQWXx85JpCS6bw7n0g11w/Tr9qMgc3/
         TTkUZZ+MW6HbTkJXiBIwkx2q9njcbMFkPkSxAgEWg5cWI7sSHwg52pL80/3uTZ0/v2Uk
         eNerUyXg1+e/ReyhmXQubsgyT2lAZIDpUuuQdec3ytzXMsu0v+mrlbGtKkc0VkMl4zJs
         d+fnM0SrIRgw8rDlYdcdNTl5KDlBJWMMb6f4gGxzCl+CVo7dr5i//i+9EDxw1Q3MM1jy
         q+3GytzF5v7CBnR0rkR7TZLHS0sToCGJ7Q0jt8SNYMsVcmmvyj8TwFtorvA3+SlyVj/B
         CTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748643447; x=1749248247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYgSXYoxLM00aOyWXvUIDH2ECy0jZwwoRHPTqVPqBfY=;
        b=s2CZ8MajfeN16NhJqcfRiveDABkl64fu3fk6PObRPQr4HC49R8B5RQyXeUTuJl6s4S
         sBgOeraDv8IWcMXS0YEaxsxK0zNl4LuRCCStBYoaRAERWIu+huaCj3LHhSBwbQ62MHhH
         3V/hnZrJ5B1UkX8dl50w9qmpUp7+XPWLtFx+4lKQMMrYaAUZ7OLYF/YZ8O77DZ+3EJAT
         aux9qteKDwFA92bJ1WYp78GgAwz7XfHHtYWcIZG7OM3DB8ldMmn51Kip/DmC/Sl/NWT8
         Jgi3AJZT1j4qYuhKU5YiznOdE4l7WzNwS6D2NCTCDkc8A3pnN0mjLUpqFayQj0Y80aQ2
         K+XA==
X-Forwarded-Encrypted: i=1; AJvYcCWnl7C+I2reyC02mfeT3+IaDpd2dWU1CXYBZ+h0pW+Ya6Rlms6FtNyk5TkkMrBgWSyBx0uFrNmgGtrYAPP/@vger.kernel.org, AJvYcCXhDvbuueXc8TsmMIVcb2vKSKVMEW7pFjiY79heDOrWuaU1MhcFi9m5rY59z07zvQdgxudzRYwRBW3Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2D741yUtjFetj+7wZiuCytjUvPPiXqgWgdj+FSCiWdcxWFwDH
	w0EA637uNaTEPwnnvhKW9UodLdI8z6v2zIVai6iTmaoK6kNtl/pmbk99
X-Gm-Gg: ASbGncvglI6yjZmBDFefJzkMC1DcM7bjZpemH7M07W4H8UIItmymGXUdmYShToKTZ1I
	XLQq6rHBFY3aJvQjWGPKmGDuJwMLuZDtwy6D8DlRangnR+Z/IL3odAdLuQPDkGtxJHFm+7Y0iaI
	JslgsscawWnIsJvBdYgHrPUnP38dH7h/iA25G6ymur9DbfcoYNSLYc7o9akCIMSUl8LRiPkM1CV
	xARZeSmzk4L66p7xjiYCTyVur0+JGlMKkDjNRgbWUQzdtS0Pw8mDEoYF0wOnDmX+H8q1BHiepXB
	gueadgCc91LeaSUXHbnMYicDQ2sh8fqF8M6MXHguS5+oN0QkR4GNhoTwrZd8hK8o0Gyfv+jD5hu
	qp6faOSDnqm5z1jmF1qtBeopC0WdLo94Lfbrz
X-Google-Smtp-Source: AGHT+IHVMoarSqMhD1xuUWKY4a33bFNL62O9B28e7MoyTtfr7/Zp5UT6kyBFKWJTYEphHxoEKF6rQw==
X-Received: by 2002:a05:6214:4119:b0:6fa:c0c8:4666 with SMTP id 6a1803df08f44-6faceba8590mr72186116d6.11.1748643447544;
        Fri, 30 May 2025 15:17:27 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4d0cesm29986866d6.35.2025.05.30.15.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:17:27 -0700 (PDT)
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
Subject: [PATCH 3/4] arm64: dts: imx8mp-nominal: Explicitly configure nominal VPU clocks
Date: Fri, 30 May 2025 17:17:10 -0500
Message-ID: <20250530221713.54804-4-aford173@gmail.com>
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

In preparation for increasing the default VPU clocks to overdrive,
configure the nominal values first to avoid running the nominal
devices out of spec when imx8mp.dtsi is changed.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 .../boot/dts/freescale/imx8mp-nominal.dtsi     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

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

