Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37148224AF9
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 22:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749507442; cv=none; b=kc2XA64U6ubH54cb2Xk2CoJ2ao7nLmYfXW4yqJUVC4ipW9ykN/ZqlO0z7nrS8AcBMf/zs72jQuRGyEOZrKffSLf42Z8I76b6ihd4UFpIsXNkLRqLOfA9DIFsrktHhaq5x6gJPruesHaCE/KUnkTpp+r8vECgYyN1KV2oQ0AaPI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749507442; c=relaxed/simple;
	bh=PTJgwmboDh3zwtCWo3X0HdMzg1bjCtzlOP89sJZk87U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uHv0QzK2BT7ZOauTUXG+X3pvMVkaG2wiJaMYHZzslCxdR30e9jeESSBkp3nj62MMpdUtBHkTyzLW8rf08Ft9Z9UlyR71VSEHg1VjKj6n/XEMV44kXBlSiEMubd8nwY85+RKUl9CkXIUpjiV582PJ4Aa0RdV3K7+5+tkctRh9RIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=KQHk3kPX; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KQHk3kPX"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af6a315b491so4009819a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 15:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749507440; x=1750112240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh/JtGXJq1ScSanttjAc4pgnb9sqVVMcQN566gVE5Cg=;
        b=KQHk3kPX6AbRGseD7ZJk+RehSdnU2Hvit0xwGXTOxGe+7lmS3bZ6GzNYVOlogzoGE4
         2NagoQhiP/eKPNTFR3TaIp2WKpK92mBKNlnQP7lXCNFJptocyaHvoaI2+T31Q1z692Jn
         fMiUzdowM+d9pfN/w63PPa39YQRly1eUNw0Oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749507440; x=1750112240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vh/JtGXJq1ScSanttjAc4pgnb9sqVVMcQN566gVE5Cg=;
        b=o5Q3lorhAPmmp0xPGr/dMOTBIYi7902rjZHRMnJd32WrWA5yFGoVhLDiFZwo0l1NuQ
         Tn2magFhgT+4Z1IN2uq5W4qIaqo7gTgrsNNDtpHhrBsbibv0mxeCoKc9dFTk/ZcGJeU3
         xqTe6QTvuazj1xTQP5/662ICQicD4lQSPUhnBoB0sNNIXn1kLjDf293fQORxdHqnoBxa
         ewWGHd/OuQ7EFkhS2XpGRYq2Ad2frJYDzmlfXQFi/u4IbmUE91suR+GB0+w/43DBLI69
         62WAxvjxvcpAU7EMwEWu6fncf0C6ssBWtjfBjwkdcVhAFzJ1qW70x0b+wC1lQ7XWV+0G
         7Uzw==
X-Forwarded-Encrypted: i=1; AJvYcCXu54oNjgaRMWNfXZmYVSBJZRGtHSqKkmbEWdI5Y17Etteoc3n3WODqgR65dm57rDdwcGKwkfGjdeBUxmI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Qh8AXjwGsP7EGLhqx+Ec24rDtA8VUVsngV+i9YeRRqW+/IOg
	lXiwDGqGre/zx4yGMnPGNv5FdkpJVOGsDeM6SSbzsUlz5q1MjCki0Bk+hoAb84YQ6g==
X-Gm-Gg: ASbGncvzW85y8eplL7cMgyOgezM60F1aWcq2Eo0L/NgVJOy/UEg7JuowQVben1z7MRH
	6yUueamAIrAY+RssVSDXi9m0KmqHfER/jEjtWkvBrQbRtGeUJ9zJceAEiOLVNXLZgH59kYD+plT
	lsaO9uW7I+zO2dKeRmcAElCvItkxHh8i8RtPR0Osv6B9wOiU0trPlWXpqyE+9dIyYfexoIcZlwg
	qPJy7VkUvPr0QS0phP2f0+Rppl2UkaOgX2BT5cdvJE/CSjmuvJTifbHhyUcKrvjzDncsU9oRE9H
	oaaTfPw7NHQv/i0YJLVP/qqeWzxscsmXWF69407Q2doEH84GzvYiKr9TCfBw/ditLEv1shnSw28
	7QUUCpyz8kU5MDA+WeAn/J3Z3Ilcw6NunH0l1yjH5Ow==
X-Google-Smtp-Source: AGHT+IGu+nDuRxQ9N/1g/F5ZQ5bigX27pmvAno5gKj+c/t7BgQSFCAow3ysCS4pqkXEmCzwSGjxbww==
X-Received: by 2002:a17:90b:3c8b:b0:311:f99e:7f4a with SMTP id 98e67ed59e1d1-313476822a8mr16779583a91.26.1749507440399;
        Mon, 09 Jun 2025 15:17:20 -0700 (PDT)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078d65sm59290415ad.5.2025.06.09.15.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:17:19 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] dt bindings: PCI: brcmstb: Include cable-modem SoCs
Date: Mon,  9 Jun 2025 18:17:04 -0400
Message-ID: <20250609221710.10315-2-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609221710.10315-1-james.quinlan@broadcom.com>
References: <20250609221710.10315-1-james.quinlan@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add four Broadcom Cable Modem SoCs to the compatibility list.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
index c4f9674e8695..5a7b0ed9464d 100644
--- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
@@ -15,6 +15,9 @@ properties:
       - enum:
           - brcm,bcm2711-pcie # The Raspberry Pi 4
           - brcm,bcm2712-pcie # Raspberry Pi 5
+          - brcm,bcm3162-pcie # Broadcom DOCSIS 4.0 CMTS w/ 64b ARM
+          - brcm,bcm3390-pcie # Broadcom DOCSIS 3.1 CM w/ 32b ARM
+          - brcm,bcm3392-pcie # Broadcom DOCSIS 3.1 CM w/ 64b ARM
           - brcm,bcm4908-pcie
           - brcm,bcm7211-pcie # Broadcom STB version of RPi4
           - brcm,bcm7216-pcie # Broadcom 7216 Arm
@@ -23,6 +26,7 @@ properties:
           - brcm,bcm7435-pcie # Broadcom 7435 MIPs
           - brcm,bcm7445-pcie # Broadcom 7445 Arm
           - brcm,bcm7712-pcie # Broadcom STB sibling of Rpi 5
+          - brcm,bcm33940-pcie # Broadcom DOCSIS 4.0 CM w/ 64b ARM
 
   reg:
     maxItems: 1
-- 
2.43.0

