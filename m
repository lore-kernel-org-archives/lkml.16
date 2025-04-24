Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3FC1F3BAE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475734; cv=none; b=uVPDxZUt1J6NvgMJw93WOeMhgdddeJbfvK9rvgWynd73EQaH196JwzsarAv+IDsdHZASWOCokApX96xHznVG3FISMOTOoaaQk9oFnLNMDyHl9qJVapnKcxCweZDDB3ynemWzW94xcDgmFd/2B9D7j3NhCeUQCVhher4y3Y/VaU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475734; c=relaxed/simple;
	bh=4JJzIfTPYd1xwS7ML8LLTZkwdWqlo3aofGz7RuYx0M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xqk1jpTzU9R7R9Z5lovHSvUk8m5PD8Nz4SWQBQ9RPXapIwfPUn851LBtFbq26mliBJWOB8ofWA673b27NgO1d+HjoIBwviNLtULxy/dHgzJVJOZMFTUNMRmVs/qFHZn/I0uzZ3k/TJQAz3YGPovJGhzXNq9GuttTD/tpOOVjJLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=a8zDdSgA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="a8zDdSgA"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso6338275e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475729; x=1746080529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=a8zDdSgAkFQrp1XundHUb9IZGL4A0qBSZrFuyLfXIJQXW/yz47QGeQQbzU4jsAX4+5
         m8MtbwEXRl/074HWr90zm2NU4kiw0ZCFec/9K1U3SZjGulR/eeYPIIqTqMz6kSi/SGct
         4oJxEuNPUnx4Rg04/e8OpRty3AHt2lxIByKf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475729; x=1746080529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=YpRqG1K5iO4ksc5OZ4B7vFqs45CQbg7vnykpecXfBKae6lU9oEBkgJyB4mQzlq2XOo
         xkwC+75iXnnLsKUjnXVocFxznH+FVSnb7784sDYFIZDk5aUnYIVhHYYBn0YyMN5uYfB1
         t7z9w6GYhhklY1RG4ELoro849H+jGw1io5yMbcFgi90nWmK22K04y2mftqdGOppKWtkF
         usdJ7WxDySNyqRgTlwSd2eMsyD7V4njRC3pIBujPB7xJpWIpv1aB7Bvc7xjJJpp57ijX
         RXufGzFwUavNTe2k24A/F8CfVhk+GXEopI0sjp5UMdqcvnap+aYX0PyiFwczoepLDLNe
         K7RA==
X-Gm-Message-State: AOJu0YyPeKM7Ycn2NMkrPxO0jOISkxjJA2+v0wuNHPAnBd26JB2M2SxU
	SEcDyQpoTmrPbpgYXz7c2eqPxf9nEYbNUfHmRwtlSPoHHVsZydHZLquDIhVfU8R64lvZHOi31Sp
	8
X-Gm-Gg: ASbGncu7rJnVV2JJ7RrWh30F8n9GnEg4ugaDwOAbo2WPjdltsD26rGrSuxVI4YIPZMO
	5jR4c+IHOWTAHaf8UmE+FrzR0qtass4xjzXw/W+eZB7CPL4LcVTnmu5LaScF8653ABt1rZK9L5C
	wWdh8BIUa0uvEyDbdC9eODq8qnOErii/FVNgqBmCjzvOB5NG/05nRxkFyIMZhvgVVuLCdvNn2jO
	1EQyw2TGRQxZIb7K1gCubtpEfLWpZBXYiq5b/sQNhA9Ng8ZKGinU3kfkK/xcUVVMUYaoiv2BfW4
	tOvQ+yDsAl62d6nGrzhiFcMdoi6brJ7/R6Wt53UnJA4/xblO6NazcIT4gmUzaEXiwQDMxWccGVV
	Dncwy
X-Google-Smtp-Source: AGHT+IG82yOPXpYwfi2WQXemi3Y+w+Y+YBgmmwEarjbKGosn9nFuDaCtfqEsVXKjXrDc3OfGAVxz3Q==
X-Received: by 2002:a05:600c:444f:b0:43c:f689:88ce with SMTP id 5b1f17b1804b1-4409bd8f0cbmr8682185e9.20.1745475729593;
        Wed, 23 Apr 2025 23:22:09 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:09 -0700 (PDT)
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
Subject: [PATCH v12 06/19] arm64: dts: imx8mm: add anatop clocks
Date: Thu, 24 Apr 2025 08:21:36 +0200
Message-ID: <20250424062154.2999219-7-dario.binacchi@amarulasolutions.com>
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

Add clocks to anatop node.

Add the bindings definitions for the anatop node. The patch is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 4de3bf22902b..597041a05073 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -600,6 +600,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

