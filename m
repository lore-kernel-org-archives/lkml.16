Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D56F274FCE
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748517752; cv=none; b=ehthDR8oQkbpB+l6C6vuwunOWIJdOl5EhLX+MycQZA1jN1Kdv+NcqL1VWOBb5L8CRzAzU3jrIHzYw67Fq6XokoO4H4c/ekhx/Q0Yj+iJgMzSWp16TTHm/0ECG4m/UvNB7VZIzkFiLcuPVkXkicRFDnq32ySG7D56kjBR60EXhu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748517752; c=relaxed/simple;
	bh=e7L18GWSgyaQx+VyeKnctdC1G5/fpSrazf2H4MTEiJg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D+DJyX0VuR2iIFbVnFFtR1o/LZVUHUmXIerOfnUwlklXrnHtIj2HkJFyrGFQQP7aUkF5kXLK1nSDLxQ33IIFqlKMs5kFPkCqCrRKE+0mjXrzi8UFlGiklmXyMF5DZLveqpWoG7cG2cNO7Xq4+QnJw7SCc4dEcXqdHoEFN6E3BKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HHLi4Mt9; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HHLi4Mt9"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso143222566b.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 04:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748517747; x=1749122547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=HHLi4Mt9Lln4pcT4L6Xd3N1GXlHz7BDDoxySer0woUvYIWJJELGO7JIf9WfjPJ6cXj
         4ImFijnm6NW4NG/QdWxxQ+dqQX6tMva8c8ePW/oGJDM63+4kxqznmvI+Y+sJ659VNfQt
         iG7xr2UmH4UZ3yKjPwAc3cWWA2WtlRB4tddY7tyhKzR7tbsMG31Ogx2ioz3PBPCEJu5l
         c42yOzi1oNHglAKZpSH3WKjgnQhR+e/E/zpDG3nRtu6SPQPbREP+8Uc1+BVLpZSFkYwk
         2MXQio55tNHFjCNCxyXA76UWkVYS7/ohn/hF1oTRUFTx2rgbofgzhOJ238aknY360kyM
         cb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748517747; x=1749122547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=Q0IFPwk9XeMgLMmzizkm9Hi18oIirXl9Qfiyfq7ld/tYKJ6seSxjXgO9yHcVc/G9Ut
         RBLiLncbCUNNDU21he0eXXL8IuN0o8ielAflg5zsLMWQGDNc5KXjByQWEp9l29i2HmYQ
         lbJafjxEhT7L8cMJz2bR2xJ77Jnzw8iYAqihl0Fd1fr88YOhZ2+P2C+OH5pCsuI4ybua
         y/X+hLoiG0JbXLA9QY5gYnHXq6nxfdbifSzKjnz0Y84lTaU9zUY4T+mYy597WH5fwD/s
         c+bFPzpd+AmGTnl64w6JzNj3NS01EdS3VyX4sOO0ej0hUoqNnhV48br4KPj8seS32r7G
         Z4pA==
X-Forwarded-Encrypted: i=1; AJvYcCXj9o95HCqDHtJ+xnZsznJTnDMV/7da262iVBEVx98+9eA2prhfEldhAmtSHafzHU1vpTtQA8jPeWdq7iw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcyl+ZpX/rys8xuxvehhXEyL6QFwxwJceEx9neTvVGBoZzozRc
	9WwMiD2iUTbUju1fOMdsmEyYtuxxlzq9RqWFRe8sOSrNgYaDLHbCMNFzlRVzS5Ub7ro=
X-Gm-Gg: ASbGncsrgDraafrCvoP+kY37ar9jFFFGwaVUU6sJ65kVduvPGCvJ0SobXGSqcNlXupy
	MOf5rMVHKAxMoRLxwAhveRhwYxUaWQebom5W/N7Nxie4ZXVK98df/gWYFQT/QLnu1qfLTkjCSw3
	IcOsyiXEfjuDDmtaw+KMnIlZfxLrd+HvOMgxBCZ0Pi/yBZyjidf9R20+fY5Kp5KuxDMVXw4oOSp
	ZNr94wFjSKllffFwiSP/+bNKENO16fO2mq46mq0xXgu+gHQu5Vbw5KW63M661TnZ9kNfVqO6Mau
	SPVAgs/W+4I5lDuBIfz/OWScP5b4JzhXdSgADYRtRTIE0QysC7Yflvr1NL669JGs++/V96q0tGS
	uyMx/qqhU1f8b7dxkpIse9w==
X-Google-Smtp-Source: AGHT+IExbV09IZHdmSyIO8/MZ+aJ19yLFTdRAcaGW0FODNSxn4P22MjKjPsKbpNd0Snebf8CqktlXQ==
X-Received: by 2002:a17:907:9495:b0:ad8:9b5d:2c1e with SMTP id a640c23a62f3a-ad8a1f3115amr539658066b.29.1748517747202;
        Thu, 29 May 2025 04:22:27 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff0d4sm124837666b.31.2025.05.29.04.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:22:26 -0700 (PDT)
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
Subject: [PATCH v10 10/13] arm64: dts: broadcom: Add overlay for RP1 device
Date: Thu, 29 May 2025 13:23:45 +0200
Message-ID: <20250529112357.24182-5-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748516814.git.andrea.porta@suse.com>
References: <cover.1748516814.git.andrea.porta@suse.com>
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

