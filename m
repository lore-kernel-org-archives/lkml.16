Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F08022A4C5
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 12:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748522565; cv=none; b=F0rUwnJOX8m4aquwPhKOdU82hHsocUeo68gnbZmqeZAFV/Hne7Z180OwYXjsNnJx8OK4BXR2XjQbfoApp+0n75942awfcyJq/7SoD5K7xvJKJqGi97U86j/YHNfVVfIZreB2KXOmVQ7zc8vo1+7Ye7jocx+p+9a2mcny8zOrAtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748522565; c=relaxed/simple;
	bh=VtQ1ljfmYtyXEA61aEiaZEeKdDz/H5SMisehIOwJ9No=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G9/eNqz1ECTmYc7vmp40p2HzsAXX/riMqUBX+vyBt+55fiJWW0kCyAdylbOl+urTgaHzsIy9cisNie0pEaw2SNCKeVN7S9NwdSfaLZ0Xmg/iR40OCS2aTYQzkJhOspF3PWIyXpK0sR+L/r2AJmU3KNiWqG/Id4oiHirhcAx+fnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IXoLPF06; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IXoLPF06"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad89d8a270fso408971266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 05:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748522560; x=1749127360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=IXoLPF06Wtm1mnRmNiZ2E7CTph3qpAYt7GTealiijdfLvygXpdrTf3j3tDZSy4ncJV
         ZPmWXCGat8spdaQNQIaGo28iw6s3YuryGuJVrtdxX9mlaso24PPiXVWjCourLn91X157
         FuAe/c7HV2CAkB/AxNNYyGDl7TUJspRTw34oWtXaceEW5EJfqrj8l6STbcq0mQHH8cub
         BY3H4G84Y8wtnO1qXZdhfeXkp7TCFjUrQtH/LircMTpoI610A4GGz1y9tu5kRzg3y76l
         vX9A/AL87HwNk7R1vmdH1A2NMmwi1t2B00u2N66qGsLOI8cjn0x+ztXknwyLOEuU0EET
         99bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522560; x=1749127360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=av7UaabENSYjJJ/hahjnBMnsmqVZveekb/Kbndf27ifRcv51Isi0U1+v+K4rGEbikw
         lEgy+QpVpM/uk3CpCrZjn2gO/DaLEhLs9FILDPxnRkNINNiJm3yW2v1jHNMtv0DXqobO
         XP0CM6+sksw6FqqlQeRiwsXBENCRb84AfgaVi1BKxni64cWlZwXdvEC0urCWCzt6H/tf
         Bm2XNfS919SQ9aNh58cjv99DcHJd6kPQUpERac3vdGo7QK06wMC7HMPjHfY/rQYzf0ea
         eYnEz3oM48YliZr3fKmEsq7K17JDvYqwiqzBiJeNV2curIEDtzMHaSa7rL/e187Brh5Z
         mplw==
X-Forwarded-Encrypted: i=1; AJvYcCV8A2NIWeIWh9lfDWSNDcDTgesaPh6jiPWE8pDdddArZADW3NoH9GJFINUAhcup60uSDj+/IUPR+tyS8Ss=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOD97mMGlz/Sn0vhVl4gfYM5d0mLRQk5fgJggUWzgVppjGi2t4
	a5vENWUMlivZlLnDYpH8iDWx3hRxnRJWZvulrFKJvJX8UwyKcti5otonPX/IdphgobQ=
X-Gm-Gg: ASbGnctEzXkahpzCDZHOr9rYrwCZO1rOz75FV3RKyefs5aoJoF+FeU08WLuqvoNHyHV
	sNCKEcFZ/sZPC52X3QTs/axJe/D+d9VHa6mwTLC6bYjTCQfAbtOD44hPe12gG5ReCqtXvyVrZFN
	VlQ+Ep3LooVYciARpnr5qupQTs0oxxIbSNc/mfJd3MYWTWJiIgOuvhyLAWJEutAtmIDeOt6KGQP
	IbZsYfp1mQ2x9NvdXcUu8S3m+FJGBJZIJPQ562y6xrkpgmujcRzuuFfeaZYUOE+iedgU8Vnaxfe
	Kp+Msr1BjNf9Gb8xr9W3Ps392nKVdx5QxTAZKzjFf1HjLcfkgDq3fR4VYwF+T/JJYdIAw+FQ09s
	zK76cpzaTqj1Z6F2pkIODqMe4fL2TcO0y
X-Google-Smtp-Source: AGHT+IGmBWL+ssQiDerV1S1/XxydSfAjqd0NvxPIChK+RKZPzFhr3ejbEm+LE6gwooRX73fUz2rmnA==
X-Received: by 2002:a17:907:3d88:b0:ad2:27b1:7214 with SMTP id a640c23a62f3a-ad8b0e63c34mr325370166b.17.1748522559741;
        Thu, 29 May 2025 05:42:39 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fecebsm138373466b.1.2025.05.29.05.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:42:39 -0700 (PDT)
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
Subject: [PATCH v11 08/13] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Thu, 29 May 2025 14:43:57 +0200
Message-ID: <20250529124412.26311-3-andrea.porta@suse.com>
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

