Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1073728EA62
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 10:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748515693; cv=none; b=YDtgiizL1Xu6r49PDEdtBsRWy5FWsKLIfpovOvPGnkTqprf1FWMQhE2bnca7NxqZ0riGEenO9FzXbcxrznAk5lZ9QLJwhpXhJDw+ahWqXkUkmcPSF8TpIAsSe008FpQhCvUwkEmcvGU9cPIbH+48KVkbG9vGahaUtvcpykEXhuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748515693; c=relaxed/simple;
	bh=VtQ1ljfmYtyXEA61aEiaZEeKdDz/H5SMisehIOwJ9No=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QpbwUTmFXNWTZIJTCYmXD7RCHnGBWA+wQZRI8FM/y83S0vcVJox73gMbu/gG7DM2W1RkybqlO79lkfOvOHX6wmeU4JfS0RJ6UVk3DXUxmWZngC1j7WOx+j2sa+T/0+9Vmc1G2SeaGto85VHfvqYf9y/2vovH6AIWFp2P0l9mcf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Fkp+QuPB; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Fkp+QuPB"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6020ff8d51dso1228755a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 03:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748515688; x=1749120488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=Fkp+QuPBK4GWbFuu1Pahspby51rSD3uS3W2X9cQDg0Gswch/zFWPnDuud1D/6c0rMv
         w5GvAV1w7xnI4hVE2+T9m5VYCDOllLd22UNy79x2GK2dZT9xL7gz4nQ6vLikQ4/tNu0q
         XImdT06OeC/4yGTHiFJPRPRNI0wwQesgtZgIsvc0C5hKlyY1LXuDOQTwOWTOxvCP+0S6
         MrUdQUjJRzPu6ueQ/JwnsecxSoQ4vQr7rHBBD4OJekeAv1087h6a3zj5z5Qz1dSmg2An
         wZWfGOpiijO+Nz+HQT84sbJ2JSt7lyPkyBiArbdoXcjDvdRR69tAGSsp1ibiTY1KnQEx
         8nVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515688; x=1749120488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=BasZAsv1YZaC4iJfGVpXe5ea3BzAHxpGgD+dw/VdVMiKtcUP+IE59HB28qcWaSmp5+
         m8vmXrgv44hPAwXO4sCHYFTJTJhAbahr06ceewjW1qqf63fEneCRvHyXJ+18zE846vRN
         T+eMIfoixvRIrnv4Nx799qxJyCRcQpPSLVGxYJL4aB+FDZ0S3+sV4691bxZnzgQnOg56
         5lxr7YxiMqdEP0UcZ08nvl7//mcbIRcnK5NmIJ4KCEF9Rivz6W+JwAUxFMlM/uI+AeVK
         Mno2MI/XBv3WWTHLsOwJ7tw2ny6nDBfPaqkOKagKkXzkeeNTI/whEwHXB1l/+d4VxR47
         2/DQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4TDHSpeSlElasUJvJ8PhR3LhR/EGUI+Vo1IoJPIpJGYPCeKIjVv8vF9T4xTKnXmBMZP4f+eOPf57+9dQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQeoExGGdmnzHZmrPfoyfmNHxTQG3IpTlRkfmnzDkWvvM1aI7e
	JxnTtawZ1LU5jnXyq6HN6m6/Q5+v8/UBVE3PRnN/yBUHc2w2B/O6A0PeF8xxdlcHWU4=
X-Gm-Gg: ASbGncvpsqIms/DRpjkvJ6olIBf8GK6yvSXXTOmKtkDsTbC/2CrqFeHwBQquhpYoESU
	+CocIf106V/WTQEMOoJSw799gckZxYOiQtVaFMIwGbsDsRp67oG+BOgrTu2jkALwlLKR7JBQkUp
	Psj1aMXIoKctOwKMr4YukXeRrwzIWcATYquCW2SQQIbRKsuBeUZqyqV7MZwmkav13NZqZqMwGrY
	NbVWrlbO1BMopRIN0ymvuWGQnNMw3gYjnlfb64EiV9hm+hYWUNeLyTXqfIle6+Vx6suwzlZQv/Y
	myIa2gSLEtTthqpOzbius+R1Gs2URWnpZf9YeAB9g679ob4c+OazER7bX9SJf9oxSd3/C/rKQf5
	WSybjh67hjXdXAa0q3dWVqA==
X-Google-Smtp-Source: AGHT+IEUoRzh2zTeQG5yMgxNNzsY26nnUhyjPcEFO1UqoG+878XF9t9s26ZMRJo1VML2M8CmoU+PSA==
X-Received: by 2002:a05:6402:254a:b0:5fb:f31a:df83 with SMTP id 4fb4d7f45d1cf-60545ee95a8mr1317809a12.3.1748515688256;
        Thu, 29 May 2025 03:48:08 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d5f22c6sm2175505a12.18.2025.05.29.03.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:48:07 -0700 (PDT)
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
Subject: [PATCH v10 08/10] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Thu, 29 May 2025 12:49:25 +0200
Message-ID: <20250529104940.23053-3-andrea.porta@suse.com>
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

The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
Add clk_rp1_xosc node to provide that.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index fbc56309660f..1850a575e708 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -16,6 +16,13 @@ chosen: chosen {
 		stdout-path = "serial10:115200n8";
 	};
 
+	clk_rp1_xosc: clock-50000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "rp1-xosc";
+		clock-frequency = <50000000>;
+	};
+
 	/* Will be filled by the bootloader */
 	memory@0 {
 		device_type = "memory";
-- 
2.35.3

