Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA3222FDE6
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 13:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748526577; cv=none; b=WAwgH1RdcE73aNfM3/Q8MRzTTq1ITdBxypftOs9nBFZe/T/JpP7AuqwCXwC3G2S12mqSt0+VCbCBlbiwi/8GjalXYEcre6XgQr+jIyT3WVzklx7PT/cyXLLUyg9SbN2iNqoGWQcvZ+OC15SxdJ+uvzhh6kcC9F7y614GafoIVlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748526577; c=relaxed/simple;
	bh=Cxv3DdNSTbG6mkWW+XlQDzM5M3k//FCq7uG/9MGjWvM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zq7cA3IZBYxYeZxFEfXzwCpJhfjn2Tu8S7F3yf8XIlEu0JvlLOlWPDn+qzCm6TOf3NPD0iEW6VHHIw7H/nFCgwuJmpUkBjDVlnh8drbJQ2drNL3lKKTXQUHfVI0e6ggW7iCjFqDfL+4awxTeluAETVuMeH2cmdyfakE7o37XbpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eGS1Igyc; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eGS1Igyc"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-adb2e9fd208so24737966b.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 06:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748526571; x=1749131371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=eGS1IgyclvGSIy6260QVKug6Q0q5318WFzJYqZpFW2iiEJRks596dnO0gEv7Mts1jQ
         vP6w5iMVryhjTcPJAG9Zuk/MYXUL76oKXan9or++cRwzkImkistF80MieiI1oz3Oo+ek
         X6K7Nwa65BCxfawoNNE57SiLEDs+6RAcESlAGpsCvZPSTOQZJyIeeIpzziWUPPHJN4xt
         6ZlR8K9uoaNJecLTZf4knKI6qI1xy12bhrerEqe3Bv832ypvT50gvmGPwKxFoAQmEcjg
         DWJyKRR8XLkx0zgi6ycwn9AYrOXB96R+bNjPVNss03usyD6XQyfv1uvP8emZpkg8nMqZ
         nEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526571; x=1749131371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=F1fJT50KUOZmD37NTZXguXgvYlovWTVbh7sf10Y8cH2SQpC6zWTq++7qxy6/XhtPQy
         CfyXnSIXFqaXC6OuaXa+/MFA4eiX/SFzPZdfPZkGK1qCbpjZlVgPvSA4TeUQEQUPJpJV
         uJWZd0n7rM2zr3J3cQUkchYhpDG64tZKyYL975/Zh14uonyCdG74or29wMj1UjMv/uqD
         J8YoZcK9hKmzFDETDVMf8CaJykvzS7thsoiPlDVFfD4AK4j+uzrbHDiZo0+c/1VswoYs
         F1RsfHzGZvRHvHregFBtt08bbQIZlKpk7IRSxQz4VrRRXPXcstOQ/icvNjPZuPShhg7c
         Y+ww==
X-Forwarded-Encrypted: i=1; AJvYcCWhmWJV3EyExaxM5Eev0878iga+lzrj8KsJfn//K6cG7nSfrYrWqwxYNGp4kluqBAM2HmW0P+VzqK+Z/gU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yynzx+LazcyYfwKQBU90rIvdgx3o5nuojHjKSQyF8X920FOUMc7
	Rh2HaG1+RPtWUA4J7SSUj9WUW9FTGJQ36P5YgqqpjD1s4wXtN1/gogMrBzL1sFFOvIY=
X-Gm-Gg: ASbGnct5rBIMLOzE+dlCeDitu0e+vib+ftg7gF5th1vY3sPmJD/Dki3nV8d/5Gq9Yxj
	T1NIX+74H2pPdPXf99itvZj9ri8Mc1H/cb0rLpGpA16/Ej4OpNw6hboi2Kl54zLPIwQNayDzbBl
	ThOtaOlJCvG7ENC6LSXwjbi54CmQAAvuglvG/1MYgq+IChx7v4gOvm+qwR/HeXllsZoQPYM8VpF
	qpUwPJeoPFhOEDqcDqpQ/KRzX1QlOzPadG6xpCax3KuHrcNKdrsB91L2bEdZG4dHtid9Asnmtki
	rsndTQb+vQ0buX0qGatlargQmki7dYQFGjvezOfcStm76z3tL0+NZD8SyhEF7j06gKJeySg7vXz
	6hEwZkVggfKMYV/98Z55bPw==
X-Google-Smtp-Source: AGHT+IGTIeG3mVlDM/pGEiWdSac6XNjdCnFnJho9+z4FTO/GHQp7LGbIzdlwn2yCN4YylKzaO3lweg==
X-Received: by 2002:a17:907:72cb:b0:ad5:6928:1492 with SMTP id a640c23a62f3a-ad8a1fcd804mr607783366b.45.1748526570900;
        Thu, 29 May 2025 06:49:30 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad6aaf5sm144764266b.183.2025.05.29.06.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:49:30 -0700 (PDT)
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
Subject: [PATCH v12 13/13] MAINTAINERS: add Raspberry Pi RP1 section
Date: Thu, 29 May 2025 15:50:50 +0200
Message-ID: <20250529135052.28398-13-andrea.porta@suse.com>
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

Raspberry Pi RP1 is a southbridge PCIe device which embeds several
peripherals.
Add a new section to cover the main RP1 driver, DTS and specific
subperipherals (such as clock and pinconf/pinmux/gpio controller).

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b16ba4eb1ce..2add073f5bdf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20197,6 +20197,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
 F:	drivers/media/platform/raspberrypi/rp1-cfe/
 
+RASPBERRY PI RP1 PCI DRIVER
+M:	Andrea della Porta <andrea.porta@suse.com>
+S:	Maintained
+F:	arch/arm64/boot/dts/broadcom/rp1*.dts*
+F:	drivers/clk/clk-rp1.c
+F:	drivers/misc/rp1/
+F:	drivers/pinctrl/pinctrl-rp1.c
+
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
-- 
2.35.3

