Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9242928F501
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748515696; cv=none; b=hCCVSKH2Y2FILXyuz1Rmz8tnFIyg0vlAaIGdZ8MJ6p+9dhUiRjEzUprqHlQgxTXtOXeZ3Jdqt9ZByAPkl+qLF43yIWqcp994VbMCwG5TUCkuhMU+CRvb3A+pr3cLjc+YCKgQNBsoZL2ogeybD7AdjBML7kA/zK27zC8GZL7g9P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748515696; c=relaxed/simple;
	bh=tcS1OdtYYeMI7g/XHAbOHs513PqKnIFqXgFxXuW43MM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HxIxf2tx+LlmhKdbYGhnlAVrqlbdyOODUvgzLz1YswpZ3ZvWNo/fkB/bJqhXLKbtZzRQRVyKXPQsIsTvUejGQ0U1rriDfW3hZHfqDA5QJfX7sn/EsgO2GHZ1bIogd6fUdw+19whN0REc8qeqyLsxNVGGGq51+RGR0DPT7k0Y1d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NicgD0hc; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NicgD0hc"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6045e69c9a8so1270688a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 03:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748515692; x=1749120492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=NicgD0hcLgy6HhP4OZp0J0IkRCXImymRLlH2QGUeKC0+SkJtpwN60jgVSpWKp060vD
         6hoTDaU6VBFNWiAihQJFfpwVumzupQpN32vH7wXyqByzcN3wGkRRIy4IilRL9thniVMz
         JfU1yONPVIrCOTdJvveopWTUIjskKZFnoZsS38pya+5ZFg3KPQOrAb+mKB12XDcuC6sa
         ujUcFUmkMVBgWs+PthQ1BUU8iwqlZP9YjFE3fO4o1oZQ3Cyq0lD/eJ5Z7fP1wlfih8KW
         JPb0UMXTTS8ORaCHlQinep31n//VxOvpe3ka5IHPx/fskzgTk35+GmKH3h5SXf7r60fB
         b73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515692; x=1749120492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=QWee4K05LYyvOqE1ar1/eowr77ndOhmPhNRMTrBuMni+Oyz6Oy38L74zw0Q102wXpV
         /Q6ZgUGE8bH145eTkkgk6sOICKd0iMK3Ifw7qPv+9VJI+5RXMgekaNZR+5pSnE6RnjvB
         BMMpUYpsfqp0XFWtRqA7roy8j2yyfGjZTHRoG3DjoTB47UE0TkMhi1iahMgzRjSPoc9O
         aJ1SuxN3ZHLCeDhgtlVadxPFmwK2Y/P7bHMDWZ2DxKGJHwDiSXtOjHBWoamN/AWQi9CE
         TxdeF12/LRHUThyp4KlrFxdpzPjpTAHrlmh+cDIcEf7OrZ20UVpRKFmVEkzU720GaXG9
         j7cw==
X-Forwarded-Encrypted: i=1; AJvYcCW1JtZE/w2sTyaI3d1x0QVOGeSp/g9Y5K4f/QqW9qz9U5AcCN7PAOjIm/hxP4fz+BkWC4k028q7fkihU7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6n7XnDnx7jF9S1mveIfd/aYxdXdacyy3HqbV+d2jXdULAFkjj
	VecEwBtWCMqOWnd/J6DQ147DZ1qrh5zg7Jf35mcVLp/bi1R4OeuzJAIefxRu565o1TQ=
X-Gm-Gg: ASbGncscQVtF0AJ7A6eDPrQUkcyS0nypd4p/CttIOUXRqJHGJrTqSFeNyydLZ2KRIK9
	gFObOADUewhR489m9MrkU8aLIWl6PNVzBux3Oizrt7ODCoWh7g99seb2+jfsgDvNob5frDiviEQ
	lsP1dAjiSPy7TXaWNs92vqNQ7+xanowlLcQOx1ZMRhOQ5lM1KTxzHh7MlQU/ew/HO8vpomwUVtH
	YhXbzWNpxn9yci6xFvE9DRv1+sSUojLR2xKOpoKj0p2UoOY5mr1xkSLAxUW2WBkFJWcAgtXgfzn
	7U0ixflQFzSL9NkVaEvfoITeBwhI/pwik6jWmgjeakZQMB0kRWoHbgQZEuuu/C7lU4RFtdW6GOT
	8vP7Iz9f7vdONapvsN2E4Gg==
X-Google-Smtp-Source: AGHT+IEOw5cpXlLDmXIJhM8OBLcgF8g3GUa1YjbEQIaeSF9CfzHeg4v+PZD6a/l5I2bu7UALxAndOg==
X-Received: by 2002:a17:906:2809:b0:ad8:9997:aa76 with SMTP id a640c23a62f3a-ad89997ab7amr545955266b.37.1748515691621;
        Thu, 29 May 2025 03:48:11 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad3acf4sm118421066b.150.2025.05.29.03.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:48:11 -0700 (PDT)
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
Subject: [PATCH v10 11/12] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Thu, 29 May 2025 12:49:28 +0200
Message-ID: <20250529104940.23053-6-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748514765.git.andrea.porta@suse.com>
References: <cover.1748514765.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Select the RP1 drivers needed to operate the PCI endpoint containing
several peripherals such as Ethernet and USB Controller. This chip is
present on RaspberryPi 5.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..f6e9bb2a3578 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -620,6 +620,7 @@ CONFIG_PINCTRL_QCS615=y
 CONFIG_PINCTRL_QCS8300=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
+CONFIG_PINCTRL_RP1=m
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
@@ -702,6 +703,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
@@ -1299,6 +1301,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.35.3

