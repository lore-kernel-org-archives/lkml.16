Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511F422D780
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 13:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748526570; cv=none; b=XsWMQkbp0QfcOWMYgRSYtXKpWEztmbNuhwdWecuD+gC3iLq57qTpH8ho2lT24trEuPl/B7ts1iCnE1ibTvzTUJz6YLV2pVsXJQVeNjlnX9XXsARtUCQjcCpk6xLIt54qM3Gej0uacmh9GFcvXI6RRP3+YSRIYh7m7t5T6U+ZIjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748526570; c=relaxed/simple;
	bh=VtQ1ljfmYtyXEA61aEiaZEeKdDz/H5SMisehIOwJ9No=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nE8f1z27becWYARhxLq1gbjs8ioHoAhT057B8GK+20sMLTeSstQJY5Qmrb2zfV2HC+lBnp1PsZ7F7OevWjllj8Tk3kPhlMIJCD2GoHtMCEUv0T6PoLLHHRhBoUZsFjdmP7bnlemxXRD0Q0Kg+4TIrBUVKcythVUEzaytr0O76KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HATLB0e6; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HATLB0e6"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad574992fcaso161420466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 06:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748526565; x=1749131365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=HATLB0e6dVjhkr7Z8px3MKY1ov9tb4ftfukTCoh9i2lksHUn6WyqesEt/4Fov7CRvZ
         MkA6P5VO5/4RPTZc7kgaA81aWRoR2NMogJgH5HHxq2MVCbxzGPfhHGSQdyIgH4x/HZQy
         NAPBKY/h7wZPJMywNfWBfo4CLuVi+lsvRmFXOMkSupLaj6rh7CiuADjLdzZu/XXNd95l
         xdao2BdhRP7NmsRk03rlK34bsI4b3Ums/D0l3Y72+TiqUEEtJC+D32vUPoB5O2665xCy
         UwmRmGxr2XrT2PC9uhVRYxGmQTTsuVwDOVXRIwnz07lDvONk8mWCNA+SjNdDnhLB/F2E
         tSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526565; x=1749131365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=AAXivEmnB5SP2TNDPpt/gms8NQlMCZAPD2v3u/+fhdAQ8bgq4szrASDq7r5aKHyufa
         poFMXKNGM7+LtY4OQGSMVJUIiBg74cdtvmOlAfPHMOhXUXsE4df1GQ0gqOh3TWFuhRkH
         ZB4zuC+LQnXe1mBn+SzFTg8I1TyZSvQPdmfB9s03AOrTocc81h1AwepiMLxfEunDSrqA
         +5WVQFwPhBSzD1dAxKp5hml5aQBWCWso9FVJNUpWp0W0sR4qFvc2lu//ex9rvRNFNOMq
         dMm03+mP3QdRWc9XkPyBvIp+Q4lapHv+qiZgXGA83+My3On5Cv4TzG1inRvWr/k8K9Bi
         +gKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGF+GFa1EpNL2asnChz0Z7dMUMqzPZDaadB7vv6fD4Jga+PbouidbrWLCrSOX7JB/bfBm3uPkwjfO6oWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiW8Jp35JZHV8WS+ZWihJnHMIC43LjRfT4+/0W8VTFCb4TXOy2
	L7Ms+3JAVwt60Bk3X8LyrATVYjNw8YfCIAWteeuQ+EYaZNmpnzN50o8TfHJ0aGv8v+M=
X-Gm-Gg: ASbGnctlgubWeJ36q3BASgT0MAWYrA25K09YkgKL9oDMlsfaHG9AJFJsrznK0yai+b+
	UcRUBIsxsEarRsxQV4ctyzr2qIbKV0Rn9HhfxfXaaKz2txvWmHDklhR3ccLQWWFyNFfFSWicqIK
	mczipJcQ52ibJwdj9NDTAuJaqWZoQyfDRzlVnHS4FivXsFBrwmRDMTcpSuJSvfAni/KRFjJpcg1
	vliEP2WQ7aR8lv+i8bEWN0MRNn8WqSFIM5SMkmK58bp1jMc81/D0Ix+M8bzR63K2MIhdcajppM9
	gCCmrDxrW7OZXcLqZWyjOGCY6vhZwW4OACzCYYWSPVOhef0ZKmv6Rl0GwcnZKtzd28KdgVzIZSd
	9bf6FG4YcFJzDpJyi4UnyFg==
X-Google-Smtp-Source: AGHT+IFaYnKDP4OR65WeNJFXd2Qcwxypx676SRlwxR+m7cKcv9QtiqthZ5su11rGaYFNLwt9bEtnuA==
X-Received: by 2002:a17:907:971a:b0:ad8:9b5d:2c2b with SMTP id a640c23a62f3a-ad89b5d2e71mr801614666b.25.1748526565369;
        Thu, 29 May 2025 06:49:25 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb2fb63cdasm4600266b.120.2025.05.29.06.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:49:25 -0700 (PDT)
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
Subject: [PATCH v12 08/13] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Thu, 29 May 2025 15:50:45 +0200
Message-ID: <20250529135052.28398-8-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748526284.git.andrea.porta@suse.com>
References: <cover.1748526284.git.andrea.porta@suse.com>
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

