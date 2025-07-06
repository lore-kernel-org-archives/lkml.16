Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A67E19D092;
	Sun,  6 Jul 2025 04:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751775862; cv=none; b=S4ssrXrLiYm4VX5Ds5n7ieFoSSM6Rhu1RWIGn5jReVRORjQqEJVnRZDJzSbSravOVSA0MdRQyfqSjETSksTw1eyIXFtdhX8CuLnHubMbcU1NwmSh+mkL5wiu6gF921bCIeBFuGPZJ9fzHjLAdBbfePsdKfY9i2c/ZDP8H3CPPjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751775862; c=relaxed/simple;
	bh=cLy1wxvFpRpBDh0mzd9PpNOoB4HIpE389k0M8jopJeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQAe4paYsD5RT3H6ayprq/HKPvFIpbw6y3S6CMeuCH9tEvOuXhnll0HAtPwrM8TJC6f7Kg9VFqEAGfx3FG8E1LIN/BZkhU0x5+C1w72sr7YpwLnHoOvZaYaohMIT1CQrpw9bDZ3iIGCxeQaa7ANH/4B7ynn4/pK8/U9wVce4L+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqrUPYt/; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqrUPYt/"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b31e0ead80eso1458806a12.0;
        Sat, 05 Jul 2025 21:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775860; x=1752380660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvHmWGMNafItbzs5EJlmTvxiwq8MkDpapWuWormfitI=;
        b=fqrUPYt/BUYDF+b2S8TeX6G9ssjgj4VeymqNprVro5dkaTibAOLXmArLjyJ3sE7VsS
         mRe/Iy0KlSkQyPzy2epxfZIJF253J2dYRg+6rlFJxwEAOWJOHiXD1nhj9Cfil7daZcwF
         mtscQWLI2p/sgowxu58r9hRCiTv+faFqyA9jVQwFzwoHjwFkoleoWEmN+cqHdJcMDdFK
         ypskrfBFUg9EKFxr+VG4IIqYiqPTkAiFdl0MUFM94NYMUl0uuyFx7ecjg9CJJpRGNjBN
         6ARmtYpwLxxfThAX8xhqvwcS81zFUdUxIfrmVt3BTKPNpDbfmJP8E0Uia5FBfyHbfHro
         FU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775860; x=1752380660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WvHmWGMNafItbzs5EJlmTvxiwq8MkDpapWuWormfitI=;
        b=kS2S849zdCA9Z4WWJeEPhvGgEfoI2s7UouEFrffUbE2GDUpMQOnyM0LO+E34IJr7L4
         cMxi5i9WoMsLfKedQECXhC6fJ8hwQlp+ggBwpC1hdbfJu72HrN89ZpPub443WaesWw6l
         ODDkWXk5Id1N6CckS2SpOBTP5oP/vTPT9ItlhtnH4r5OVSVYPofmVGYYFy5rbJR+liLD
         kG943G+XCDdixsXD6OU9fqxhkijuCxxKNgjSaVs8Q3Fifian3qXx1Hj62TbVLsdHCwHn
         sNIE6hooIjS1tK9/kL7lJNVQY3MxCvHnVvIGlk4m74ocwQ5ffXMxoesOqb3Mq5F++mex
         7JaA==
X-Forwarded-Encrypted: i=1; AJvYcCUMBUw4N/TPmACtukN/X97na0QkjNqI54VwrdQ5QRQPPnSvLfQQHMLeMUnlb1plKL27/NmJLrZzRoi6LNvU@vger.kernel.org, AJvYcCVkrRQy27tAqcSscYL8hJf3LHRbZOdY6Vwnz1bp99sk+Eu70HXvHa4Nqrf44KyztN1L4sy+BtFvPqOm@vger.kernel.org
X-Gm-Message-State: AOJu0YwAV9+aXZ/iJo0/EI2xVfa77S2tfrFeHAWVlHEv6VqY5bhLg5VR
	Fz4bSVUfCrP6grUV0eNgRdnzd8pMhV6a5yoWkXDrvZsaDIrKVuG15CEc
X-Gm-Gg: ASbGnctXmjwMHMa8tv1C7BwUYlxXO0ra2mcflmp1xvGjEIqHTkDRAegvtB64fzAVikU
	2ctOnC0AGSxR0RJZMGpH8S2xvzJ9sGs+85X23BDoICr1eemYl6xV9ZBBOa5FIEkNxoi2vQcnph1
	/lkjtYFD6q744Rhom5qJkL0bKOBuvTyEA2fzoKNtxCx8yKJ7ENQ9g54BP/6ImJyszoQwOTD1yR5
	mpTV1UfynyWhWMad+jFYUgHkP0+ZMcABY+nlIqnADQfJIaj9arIhOWRkvaW+Y2nmKgny9TMorkO
	a0B1IbTQdsYeAIYOzDIiQ64r4kGQ4SvKoUV7urfoOfrI4cxvhMkfQAs2sQgMmv2Oe6il4I+BT8a
	nyISjjrlMNI8khYBN1bdGzbp5OKMq1ef5LnLVZ7JZgeLcsZo3Og==
X-Google-Smtp-Source: AGHT+IFq/DBo7mhtDc8JK2bnjTn0hYcALs6HE7/1Y9UZXQosY+9RqR3fwqBI4vPkehE6vG/rQihI9g==
X-Received: by 2002:a05:6a21:618e:b0:1f5:619a:7f4c with SMTP id adf61e73a8af0-22720fc395amr6562762637.29.1751775860542;
        Sat, 05 Jul 2025 21:24:20 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417f206sm5287067b3a.76.2025.07.05.21.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:24:20 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v2 7/9] ARM: dts: aspeed: Move eMMC out of ast2600-facebook-netbmc-common.dtsi
Date: Sat,  5 Jul 2025 21:23:57 -0700
Message-ID: <20250706042404.138128-8-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250706042404.138128-1-rentao.bupt@gmail.com>
References: <20250706042404.138128-1-rentao.bupt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Ren <rentao.bupt@gmail.com>

Move eMMC entries from ast2600-facebook-netbmc-common.dtsi to each
platform because eMMC is removed from future Meta/Facebook AST2600
Network BMC platforms.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v2:
  - The 3 emmc-related patches in v1 are squashed into this patch.

 .../boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts   | 12 ++++++++++++
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts | 12 ++++++++++++
 .../dts/aspeed/ast2600-facebook-netbmc-common.dtsi   | 12 ------------
 3 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
index 673cabbec92e..a21742daf899 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
@@ -207,3 +207,15 @@ fixed-link {
 		full-duplex;
 	};
 };
+
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	status = "okay";
+
+	non-removable;
+	max-frequency = <25000000>;
+	bus-width = <4>;
+};
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
index 71f58ad1ff06..0890b1728658 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
@@ -1249,3 +1249,15 @@ &mac3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii4_default>;
 };
+
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	status = "okay";
+
+	non-removable;
+	max-frequency = <25000000>;
+	bus-width = <4>;
+};
diff --git a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
index 4f819bf8c909..d19897ba5dbc 100644
--- a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
+++ b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
@@ -154,18 +154,6 @@ &vhub {
 	status = "okay";
 };
 
-&emmc_controller {
-	status = "okay";
-};
-
-&emmc {
-	status = "okay";
-
-	non-removable;
-	max-frequency = <25000000>;
-	bus-width = <4>;
-};
-
 &rtc {
 	status = "okay";
 };
-- 
2.47.1

