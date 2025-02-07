Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718F51D5ADA
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 21:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738963873; cv=none; b=s0IsExRVRIcwDWbpO2tPEQluNZ9hlN6M4iar6Nt8jYAxPhd1rr4LrROu5ng87041NjN98/fVa7lNzDJaF8Ou0QB+JGES/zR40R87zpqYxpe3uOUjanhoJ2XmJ7izzv9YhnfHVJyyNMREojj0mo8UIC3XyaxluYqB7qtIXn/cRwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738963873; c=relaxed/simple;
	bh=VtQ1ljfmYtyXEA61aEiaZEeKdDz/H5SMisehIOwJ9No=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lYWBxkJ1ZJ0waxv2EWOaJPRw/PJZijhydoqAeCT0ogwYKz0zWH/mipmcx/PXqi+gt8jmSY8471FZGFSEq9GWFT7WgE9DyWYZSZi87ToIpfP+rWT3JArcfS+K2+XXuSfNmUWYX4p5Z3YGDMQx2btM8Rh4JTO1Du4piJPTxMSftn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XkxFHFuK; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XkxFHFuK"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaec111762bso608614166b.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 13:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738963868; x=1739568668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=XkxFHFuK/l9LvD5agP4n1Phkw4F9H+705BDsnlnkkZ/uslBVQPQtOxSDJbvlUEHlaU
         6AX5slyctm5J8ss92Qf2Puw427wTeAbihj4rFscP5I13rwsPLuv4iNakQQ0yXoY/Zog2
         PIHkQc/CUCILKbdma5Tfrb62k4qEbFtacTJqGrIlYWULrShf0dxZiMWaWebfGOK1CRsA
         x2SePYs6LyaYxlGm7JlcYGT2Auf/sTMck9amecpWg1t2a9P0FKD3NtGF0Jzv6KH7lzA3
         Qn7mPufNVBBB1ES2zaNgM8PCXFU3IK4yEGEfs7BVNsHVr0iXBiqCoH2G8E6bGidwwt6f
         fwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963868; x=1739568668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=M/OMFDo31kPNyiLuG82HJbZsXgG/P0Ac4l1VrvqxSWK30Ias+MH6F9f7oOgAYDVD4h
         gJbanjkeClc7E5r1CoEeETWEYkDjw3H7QgX07OV1K+ewdLOR2m1L9EE/Finwc7nsqqJM
         Gq0vyqFNr3t/YDaKrsEtRfBLMFcm3T37U/kiYpceM4eXsspWyFswlyjMGsAm4xFOioMa
         yxrdygoBO/iCm+qDjLjZteQFvqYp5qs6Aztr7Xmaq8n3LuNNN0KAg3PwLvNtuTOFhyYG
         +YmrW/u3C8LrQS1QV9cMJYyHIUDMgEfULRzkuRkKdacHbWlrfJ7VYEzAE6NKczuY6Z8x
         kNOg==
X-Forwarded-Encrypted: i=1; AJvYcCUTSkq4NMzW6t4e9wsYdkBPpNyAhhGzlobxF2daXwkfJukhhMn+Ap8406Ah1y7tU/dsp0Jnoe+mG85gWMg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjr6MrBhtNNTRdv+L9FgHh+BKLTjWrT1doOyrOGqSKbvQTvQ6Y
	23V1a0YlhW7NB1c8G/RnWIwc8S9EIF9b11lgr/IiC3IVgdBIFpwBpg4DZNfR1QY=
X-Gm-Gg: ASbGnctwkUVUDuno2mzn0qgf53gyq4ONUKIru3LoaNkWmR/koeYWNpyyEV6K1juwjm9
	/SjSCJ1PIFp3HALE5FsqLFvZPDqvhwT/jACYrJKPyIJhHq7f9f25zLxQgp3KSR+eIz4VK28PaaB
	anynImrtmT8k04c11FNE6Rt3DjtL5fitvi4R/NVkT8g0VbN9Th/92e94/nTEVRIsULuRm4B1aeK
	yMLZvnXA/Wml/RsDDPx6dx3Xytwv84mhulNJu0gbnXFBsJEFPPSIrChbHOcuhnzh+xGYt7vdNlx
	UoBMkJ3gjQEGz4qILpjhtQCZdj+BMmEhZj15ZfCQGAOHG8KGQIPNA+BkzW8=
X-Google-Smtp-Source: AGHT+IFnue8aM5uMyuzX6JhUGUVfjNquFfLUAy682QmcZWe7J/NUbnpi5Rbddmy7cdrZqcN/Fq3qvA==
X-Received: by 2002:a17:906:f5a4:b0:ab7:b08:dab2 with SMTP id a640c23a62f3a-ab789b39591mr578677566b.22.1738963868593;
        Fri, 07 Feb 2025 13:31:08 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f485dfsm333069866b.28.2025.02.07.13.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:31:07 -0800 (PST)
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
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v7 09/11] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Fri,  7 Feb 2025 22:31:49 +0100
Message-ID: <d77f34885b21a1953a5a498d397432ef377bd6e6.1738963156.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1738963156.git.andrea.porta@suse.com>
References: <cover.1738963156.git.andrea.porta@suse.com>
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

