Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD2E225A3B
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 12:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748522567; cv=none; b=rOljP1yxmscheMWJyO2ajbYWzHGXjM7Z5nSemvM+KPy31KWTR9TiLzI9KB45Lm4ojFaOhqBNaTj8GX68tbNofhgN+jIt3m9jTFUPIZ9tuu5tCJ+xPsIObi0eQXbrrAR+Caq947ejAtqeFCkSJoF2yAdHrMCEJKbLr9UNzSzZmvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748522567; c=relaxed/simple;
	bh=e7L18GWSgyaQx+VyeKnctdC1G5/fpSrazf2H4MTEiJg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GelHgrKLA2e7lufPcdNL4i+Xu30tLqu5S81VyVPPNWEQy6Vm2r7dxGoVgR3NblQWy/KMp2nqt3AL1ydFnE23Iv3vTTNojQVlHjt9zrNAnq+9CZzbBOJxnfFOVKDIqVDmF4pQ90rr4W1glPBJajmsu2ArfeA8u+wa+28AuJ8KfQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZvntV0qa; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZvntV0qa"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad574992fcaso149173566b.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 05:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748522562; x=1749127362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=ZvntV0qa0UsTFoAE+fQinBri4B3PW7NYJQB9Xf2DxM+0hBjxStavSqh+QnZ9w1Q5BS
         OpylNLrArCPZVYxGkfIq/8Cty7vy4NfKt20U9dekpavkHN/WwvIeai+KB3mST4CpGwJA
         l6fwg+wIIbV0bdTNxOIl1nhFnAzWPo3gFMV8fO0OdgFXe5ERnCm3y86csky+hHWjKx/5
         3rqFWb1xwpoDTw7ecT8XH4eD7j4AkS6f0VF2ghXYG/ei9nu7wEJI0PDUEGQuTaR4tkzo
         YeAsV8DCJCn8RIziMhwD9tlSSSlKyx6heaXECaWpy3iIp6+T3s9F7Zvv13kIfA/9iMdr
         WEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522562; x=1749127362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=pmiulNjIzLLpStxO9fqp09zmXfHlklUGWIBEX4UVdrssGDauF7JKydm/Dy0BuDaO82
         xwqe3OZDdXinELJilsCk6hqrs80a/OVpd25k2qPTtvlwKvve7+yPQrseNaHUwSDUh9b6
         PbkrFTdT7C22DUn4gOdCBYOn3NY9QX6RSt8ZDw5/ILVXe04SlAtv5georg28/MvRrRFb
         ag+9u3ddAZdOIe1P3zRSDr69dPZR2SEB9PfV0WNNCsYLjA9CCs3g5+lbXPohsmKw+W0x
         NuRPRrpkxMekErza1bXcPCwHL3cKyBEzuBHsfQtty9MPSpfUol9u8OSzCDLtruU1f/xi
         ohHg==
X-Forwarded-Encrypted: i=1; AJvYcCVAiOb4QTRhcH9rdMI52jqQDPtojokX7daM8FWivUCFSG+ZhA86KG0siaYmN9AA1R/toxAUxolApCWGf34=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUrYoFiRxPjFQ4xIedElHWDfCfi+D1ctXcgvYvUBdpSKLI/nAC
	GN28bch2pRUvwvPN2Izgi8MLdLruMK31ruO7z1Oxg2f0W0m0AxoPoncXo4f8hQE74iI=
X-Gm-Gg: ASbGncsiU8jo9xOgnb8jiAu5DNMT69eIaZexLg6+Jkno8WHgNYCW8wZYSNCM+vqGcgd
	MrRXRE2rryS+GSYoImio0I/q4+kFT5ZdYeInATpoJbeIhpx3HedSowR1RuOY7ul61/yTUf6AB3z
	+9L7gM3DD64LgRZcbLE7dykUxbUNAlqJPdoONk0V4D2dSwLUnx+VGyAipdTi8gF0m2APzG063AB
	AgQJ++DxjY9bAAtes3P0HIsz2sjDUwC0Z2dEAR+bx6qyNOjw50pMjtDWpYbhOtL0EO7ULkL53oX
	+lzgUwIUwqTw8VptIonTGwGKNm+MehuWcdhRNrn7KQnSRZ+bHk0be1fSTFrFaT/aq+voZOTA0vN
	Il9syJfrrwXjkN70wRHmIFjyxU6lWmuE8
X-Google-Smtp-Source: AGHT+IGNiDnmL33gl89vnGs+/ABlMcodAbvG3T1PvC7+mWmEo5zj5kUpEb/gkX3S1G8x/gUNclU3eQ==
X-Received: by 2002:a17:906:6a10:b0:ad8:a935:b8ff with SMTP id a640c23a62f3a-ad8a935c9b6mr486027666b.31.1748522561822;
        Thu, 29 May 2025 05:42:41 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5dd04579sm134495166b.87.2025.05.29.05.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:42:41 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v11 10/13] arm64: dts: broadcom: Add overlay for RP1 device
Date: Thu, 29 May 2025 14:43:59 +0200
Message-ID: <20250529124412.26311-5-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748522349.git.andrea.porta@suse.com>
References: <cover.1748522349.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the RP1 node in an overlay. The inclusion tree is
as follow (the arrow points to the includer):

                      rp1.dtso
                          ^
                          |
rp1-common.dtsi ----> rp1-nexus.dtsi

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/Makefile |  3 ++-
 arch/arm64/boot/dts/broadcom/rp1.dtso | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 031875a277d7..83d45afc6588 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -14,7 +14,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2837-rpi-3-b.dtb \
 			      bcm2837-rpi-3-b-plus.dtb \
 			      bcm2837-rpi-cm3-io3.dtb \
-			      bcm2837-rpi-zero-2-w.dtb
+			      bcm2837-rpi-zero-2-w.dtb \
+			      rp1.dtbo
 
 subdir-y	+= bcmbca
 subdir-y	+= northstar2
diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
new file mode 100644
index 000000000000..ab4f146d22c0
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+/plugin/;
+
+&pcie2 {
+	#address-cells = <3>;
+	#size-cells = <2>;
+
+	#include "rp1-nexus.dtsi"
+};
-- 
2.35.3

