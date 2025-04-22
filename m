Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BAC29899F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 18:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745347939; cv=none; b=gQaoq/QHn5W/sDNJ3gZKbYPS/t4gdPAabzZcz4LfAJ2lBuY75jm3FOfL3YyZs4qbM7YIBkNesTsHnLVrBr8QKDO6qP6jb0yqbINbIgN1ahkUj/kCA6Q2eNhWUv/j0qcFreEkU2AWDHfoz+PbklXG/R/5x63xn0MYDAXYHcajRDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745347939; c=relaxed/simple;
	bh=0d0KA2JIWD01SkBHQ+kOHI1VXSE1uJ+d/H8RXibXQzA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eL91NJEfXthFB0uIPNjPYUpkFuIW+jKC/164SyUXaXPHSd3F12a1sN+voaLsgByVb7DTQ5U6eSapumnU7SRRksI43ADoeeZUm1YrXWWUWT9eSKt6IUb73ABECLaZC5zVIQ/DksValAk7Grn00PG/tf+0CdQ4d+cr/OxhR71IAis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LendghkY; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LendghkY"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so63540715e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745347934; x=1745952734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5FlXTAP/GpzsHWsqpirXk/6wSg5qJznRRV+qS9c6do=;
        b=LendghkYGagvcvmHX5iiXGSDlaL8T2+7waq0rFS6Z6L3RK/GibhBYuAVtx+PTArNoN
         UYYI8NXuifFUZ8oo5QSpVGqNcbz02VuoXtXmjV6AOzCHE0XnXZPXx80UhgpRn2iRpGuU
         erQoyu8N7EkkzKU/J39LZNAZyqiv9c9R4ZDZGZVR1n9n4tTrrGz6/5g/DtC+73WZ7H+H
         aGoKsxqTtvVx8nXVMQvDwqlA71dOY9MvTmVsTnc1P5BaqupNwZU8BgQFvprMiNEW6iWO
         SJzh8drSkYPXQUe2Ef4TshUs0X+cDciY3EIuR51wL2hnnBynfw6jkVAoBy95A3HzqwZz
         VkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745347934; x=1745952734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5FlXTAP/GpzsHWsqpirXk/6wSg5qJznRRV+qS9c6do=;
        b=co4dnzgADpEXlG4MnpTt/zExuxQMWTD8eRJa+dTvaLKMtEBLeVJrFiOVr9BGT9wCyu
         xfRsyau+EvKY3OETx7GPdUgdiNvk6dxqOsaQFio1UKEce07KCTI1+WAgsuMyWFDIqMgW
         ry0XTxNFIrfJd0TvpLB/wKBxRhqBKWAAN8/1gRdyYzpLPg6b5smGV9DHqMtOtLoVuBym
         vQsLCvyJLD2cJTX5/r+Jj42iNQF/vyTol9eGg1/Ht2ybRmkebL4s3nERyoz+k/4NBuEj
         kpB10fWBXs2WIyPr1pe+frKkDkDXK6HjV6+knrno+jnAUjsmvTfJv4983rgIgsh3RcO+
         N+uw==
X-Forwarded-Encrypted: i=1; AJvYcCWjRQ75ucshEFxQM0mrOw690F/tz4+Uba0WKn4/R4qhJlhRWdB04gPjZRusZ0EwCfeg7N96d2jPQt8BK0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFf1ravFLQkkts7+v351lk/Nv8Yjf+N9VJ+LXi5s7Sp35gj0me
	dIfvcL5yPOCke21lGQ/5utFhTGvojTItzGnwJSk6SHMzIfCtD2JJY7BApPBmvZk=
X-Gm-Gg: ASbGnctfyB2hfWwJo9XaBOQ8f7VZytG7osmXf/MC/A8BY+RSgzfGZu8zCvD/k8NkQa/
	mS5VUxl0vvnNCBY4//TuCD7NfVvzD4O8TKh2ftRuCkoqh4EjfbvCF6dntkS+OCZXG5/gK7wXlmF
	L/XXwjaldypdD7c0QGTu0nWgOFTp3uu0hxEhaSw80WLykkSlMo1RcWD3nGAb/qN4LJzwFWWGnj/
	7CXNNfwQOAI5yX8hHDeE1N4cHCclJ/VpMPvqRoPGAF0BPrTEMJNo7XbD5b19Ss4sXliKqNfmn8j
	j6DgJjj3b4WuauRRRXozZU1zg0qjJjf9CCb8NYNZpnoV4ujAv7bckIXACd9MJDPq+k/0klE=
X-Google-Smtp-Source: AGHT+IEVk3l0u74vuAp+CF5lDNrV556fT1PXsYCuMHNy3f4iRhiDQz8At/q2Af1Bf9oamgLCLia6EQ==
X-Received: by 2002:a05:600c:1c8e:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-4406ab6c278mr159813835e9.2.1745347933551;
        Tue, 22 Apr 2025 11:52:13 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5bbcb6sm181216235e9.18.2025.04.22.11.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 11:52:13 -0700 (PDT)
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
Subject: [PATCH v9 -next 10/12] arm64: dts: broadcom: Add overlay for RP1 device
Date: Tue, 22 Apr 2025 20:53:19 +0200
Message-ID: <4bd8dbb374f15a01e3b3ea27f9e802cd702c1bab.1745347417.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1745347417.git.andrea.porta@suse.com>
References: <cover.1745347417.git.andrea.porta@suse.com>
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
---
 arch/arm64/boot/dts/broadcom/Makefile |  3 ++-
 arch/arm64/boot/dts/broadcom/rp1.dtso | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 09563c41ea6b..2c6a717040b8 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -13,7 +13,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
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

