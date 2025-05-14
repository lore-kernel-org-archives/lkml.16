Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D772C221540
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211120; cv=none; b=GIbV+LpeVuNzd1XH3XkFZbI19CNGDj9G7+Z2PKqyJT5CJLhbE6iAu9bTiycaEkHrRWVBIlkNtmTkwBP7RHI0913uBLl0JbkxE5oJvd3C6MJvnEmaXhDCswqi4eIjyJSafv3lv4V8+4RnCtEPeJPKyzJ4ZaoPcvvdoMR9z14Vw2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211120; c=relaxed/simple;
	bh=N9X9vZIT1A6rctLeeZT1ABMvd9sNG2VCtajtyJLONQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vm5bL1hVSGtR5Ohy/ns4zzMws17J8KEIKd+AvvkZTInGqYRLpgC3CTy/GmZ/j/8yi8BjJahK829Bbn6mrZRwPF7beqhLEzQbhWxM+Xe6TRcf6aDc7AdNxYdC3cc0cU1l9qjXAH9vpb6f1NHBO+n3SlZIJPdkzEiOLB4exoq8VDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=EFwWVFo6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="EFwWVFo6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so73309885e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211117; x=1747815917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CU3p2HZazfv/x9pcuc+uTWk5M51PePRd/7turTCqc5k=;
        b=EFwWVFo6MOjrBFsl+yc+01qh0upFgSuk1wuDNoTuev4Z/oeq/z/q9FfB574ZgWTqb5
         5UlbMxVsxG/oEhNOHrJHh01N/XYUjctaU2SBxTw4YSBYttz/0THyzoxSz811VtFRrpAK
         V6C7gBsWyWycgGFdNfF/ZMLjBzZk2DlnHO7Kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211117; x=1747815917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CU3p2HZazfv/x9pcuc+uTWk5M51PePRd/7turTCqc5k=;
        b=EkOBAvRo1zHRohZ3KPSXxkAnW7ukKofeR1q+XarvSeASEok0Yk7Kcwa78GAkOJKbk6
         ViqbAKXHDLyx/jq854cJnqyis1dTB9/6/BUf98msnZhckOMTyBbFt2eEzNC/mBYYYblU
         rY6VfOAriUda84vZgEt+5H5aR0rba/p8/lk6POOmVDKD+kSorxXUb0iFywHCtnUOD4Vn
         UmH6d77MADBc2lWrnCNiCluLjVpOS+8CwV09OO9R9f9PqPVZEwQCKnfPx13M7KDftNXk
         5EXNhir1uisiZEXpvBV7KDtsY+oHwoF8J99kBuu/vQu784p8MVayKTAldBEBWs6ZpBFk
         +G/A==
X-Gm-Message-State: AOJu0YxYYFWDIl18Yg3nlfqSDI3zL8TntrovEwLWh47tCLhnBPnChDKz
	SBpOo/1a5Yo36wX2tTuoeNOC3KLtgDQh4dINWnUHMJMz1/95Cd8cCIMri7a9UT9Ng+/u23qAakC
	Ptns=
X-Gm-Gg: ASbGncsb4bAqHxdRwQHN5AwNkVAu0lJDBa0v7XRbTlung/neGt5qlD2tOVlDLHXqBb0
	Hx0OZbIdCtsVTY6c8O9ZfUCZNYH+KIV9xMZOn3GM0ueUFRfxYr77XfG+Jp1rU9u6wmct890ERz3
	8CXo/zVhrCxAN5zBXk1ONpVCrWJ3uSlwALXmisc++GJuDe7bryUgso/u+Dfr/3u8hxbA9CIhnl9
	6mEw5QWoGeSs8PpzSn5jYrrVBUggmjZ4BqxmkfKkms1Czt7BJYGJNFVcSCOEzXQk2PcIo6W/5bI
	Jk2boqq3LXFK2a51pcwt4tkENLYv65Snm+by09ZlU0xfysgd6g+6NWG3dVGMTtYd35V0+fRAzSR
	t4JmTKCnrv5T0SZvnrjRv+sqs9dNPKPwdsetRLFLloa4=
X-Google-Smtp-Source: AGHT+IH06rcSnfaOB2OZhMFuSXU3getNgBYXw3VlOzykqn2k2DHIALSzS9mBkCxcxDKGZiq9xxXxLQ==
X-Received: by 2002:a05:600c:1da5:b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-442f20dc6e7mr19271805e9.11.1747211117060;
        Wed, 14 May 2025 01:25:17 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:16 -0700 (PDT)
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
Subject: [PATCH 4/9] arm64: dts: imx8mn-bsh-smm-s2-common: Enable GPU for smms2 and smms2pro
Date: Wed, 14 May 2025 10:24:58 +0200
Message-ID: <20250514082507.1983849-5-dario.binacchi@amarulasolutions.com>
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

From: Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>

GPU is enabled in order to use image processing so it must not depend on
display

Signed-off-by: Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index a983072fb835..de70cd3a392f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -77,6 +77,10 @@ ethphy0: ethernet-phy@0 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
-- 
2.43.0

