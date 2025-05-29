Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5725A28FFD4
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748517754; cv=none; b=Nr9GHkgxR5fBAjJhIryUwwD1i2X5ei6ctR+S5wm4smdWl+XB4c/zsrkE1Nld7M5El+Ko5Z5xCGDHCP3dCgZUkUXSFDSuhloULKsQXEFQ8YyvU/lGynqvc4JSWYtZTKj3Cl+X1LWAuOp5lzvfDJTqg0DJYVjgVR+DwFx4mHKNF/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748517754; c=relaxed/simple;
	bh=RRM404hdZVflbCbuZ7OBxFTgWWaneCmtEfkgg/Xp1Lk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IM4pZhlSIFkipFEDVEaBof+lXQ8MiYGoyYRhVJj6MRKh+PxRh6q3SmNbZT04plIeMIjDew4GY4HdIfpsLAO0KV9pyjIHGnQ8dYYEOo41FuIhmMri/5Vyr1xWfwQbhhdx9qvpn3NttjrdfxC0oLyEnNUmWnTlKODTUshLLJVnzd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OLltV4hv; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OLltV4hv"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60410a9c6dcso1478147a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 04:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748517749; x=1749122549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=;
        b=OLltV4hvknXuVnFrkc6OH76sfwxPheNSSKO9WAhv27oqOhYFwUZ0fcYM66jggE2qMb
         dhSXD3dUgnLcRpgTpYpFfB5ARgsWeO7ugUXeq4KRD8tYPpwiQo2mqjgsETUTGiCCTelo
         5Y36I2RBrVZlDsgMVsIqHPeACpL2yNrvJf4qjzjBtdTT8SZ7KMgHAhZiOx5qDGz/JO79
         hY9tqzJOeeUAqDHqmO7+TF3csmABHyZIlPFdiIwGV1PaTxcQsOw4FirU7rFZDDcMeYPn
         ascXf/f7bhNLfZgURyCuD8xjfMCdBeP47c/S8+6+ftGVf8uLjiu5knFrN0IEl+LsayBH
         DV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748517749; x=1749122549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=;
        b=n0JfTlvhfdU/gH7xmi2HORAlKjmAMu4u6re4mPiv89wIbN+GPRs55JQuV9Iz8npvVY
         XwkCPz/GZIp3iFWE9T3wQyOtMzbGDBeMLgg4vAsULa142Mh9D9lS0HnGN9HYFuE9rAym
         Ezx4dzoUj31quBnVbMRBSsvDKSdjp78oZjMIOe4w9dkH6o4vf8wcELATiAIMtiEzsm1y
         lM2gEtIHnd1n3hsrZmeaZUCgm6blzhyPtr2ygFduBasVrTYxHrcw52GOUEm12Z9IGm4G
         XrAm0NphHi2ZUUnf+NN2VNaGVRfYX9D5h4Ku0ROF9Xw9w2D9L4yKxeQtt85t+SirL2VY
         XtSw==
X-Forwarded-Encrypted: i=1; AJvYcCVn50097QzOIxlotGNgP492cycHjin5S4Q3GVOOXgaFsokIVGJP9it5GApXh87ppnzARvyvxSQBwgEzqkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsC+VQMP2+tQcwjKFpV1F5H1Q3ESz4sl1OxsCLwu6vqgtRgKE2
	/NA80JFSG+o8s+cfiXdtb9O4j08RBcQX+bBsaNbHAgRXhYXOJjFAEwBl8+0hahrWrFk=
X-Gm-Gg: ASbGncuCJKQJAoC3A0+pzZxKhSEtCIEpvMc2D074DP4g10u1RWMJwyFOGUmXExsek+7
	n+Qsi7fSwyk09SelRtspInyFXemA0QiCL/wduWNt2dSNgRtxytz+HvmxQqfw1meg12qHNdAc1MH
	HEnaf9/0MXRtQRIgi6yAnEWeP68SGwYAaDkVGBoZg09J5EFqpLRRijztyWua1n67PvdzOfhDUpQ
	5qAm2xhloAT0HQAwsm9kcqxg7DCHMpBOBiDGxiEwEVbeM4azeKYa6HIKvtqX8GIzAkdIewUoR68
	453lHKrAc/COeVIWAwtbVIG1WB45kn7D/9NJh31nABM6qFlH5lkIoV/D88TMrMH2kxeccaxX6Ii
	amLBdYrRhz6z3DE+3uyBqj7zStzBtS95T
X-Google-Smtp-Source: AGHT+IGIHEB4AcuERSFwVfLZXlxZybEzRkofnOTwqfs80hqrEJ33hE4h3yIsIdTYmxCJoTKFbmQFHA==
X-Received: by 2002:a05:6402:90e:b0:601:9531:68b8 with SMTP id 4fb4d7f45d1cf-605460f42f1mr1154010a12.18.1748517749396;
        Thu, 29 May 2025 04:22:29 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d6091d9sm2291814a12.44.2025.05.29.04.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:22:29 -0700 (PDT)
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
Subject: [PATCH v10 12/13] arm64: defconfig: Enable OF_OVERLAY option
Date: Thu, 29 May 2025 13:23:47 +0200
Message-ID: <20250529112357.24182-7-andrea.porta@suse.com>
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

The RP1 driver uses the infrastructure enabled by OF_OVERLAY config
option. Enable that option in defconfig in order to produce a kernel
usable on RaspberryPi5 avoiding to enable it separately.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f6e9bb2a3578..ccf2f50673a3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1659,6 +1659,7 @@ CONFIG_FPGA_BRIDGE=m
 CONFIG_ALTERA_FREEZE_BRIDGE=m
 CONFIG_FPGA_REGION=m
 CONFIG_OF_FPGA_REGION=m
+CONFIG_OF_OVERLAY=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 CONFIG_MUX_GPIO=m
-- 
2.35.3

