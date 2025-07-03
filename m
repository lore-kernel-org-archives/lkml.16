Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFF02DE701
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 21:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751579601; cv=none; b=bB5zFQ7AqItvbaXzz2GePm7n9AJZ6+5qdkju3/vU6RYt8L/majnPBHaRS34DmYzFPyK0g5/akDy4bU1sA2ZcajYyyN9R46wyGXJQ9AwC15RbXo3hY5dgDFKsCgGxs2vR2pDFkLlkl2lW4eNBWALNCd32/Nm8mytyZLVnxzMKizw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751579601; c=relaxed/simple;
	bh=bz9k4I8wu4ITHd/c7cF+YBbeAeEaMUkwROjqtGrJrXU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T0GSQd2nnnY08DIh36voUh2IFj7s/JPzkvw3pdST9XnYJ2g5lZDdKyZr/nTt7TzHFSWxuZUtxVLLrZhfH+wj0BJD9Y0vF18eETbAYWfvdGvXCtIAzJoabF64Zi3m99ixSuiHT1JsKSsX32eJrUt4XCqS540SrYCpeP0U3F8i/WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Y+7Ti1aK; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Y+7Ti1aK"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235a3dd4f0dso3105385ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 14:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751579600; x=1752184400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6QHOFRNJhHhOjARobq8OyaLuqSsqExhlwJCJ5EBtPr8=;
        b=Y+7Ti1aKOQ0HgYidESseYDvDgrl1w8h5uL5M+hyHHXV5h22sb0KFWeOMpVptF2jN0g
         DY9Biy2GnNc7FgZ93NVLXZeolnUzc0ESRf9xtxQjc4dMJS5LyaOnoJo2nk1C/CuKQ0SF
         vS3n4VYKno93Z46ce4LCBzoleexV3Lrdc0ekI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579600; x=1752184400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QHOFRNJhHhOjARobq8OyaLuqSsqExhlwJCJ5EBtPr8=;
        b=LAdzHVM8fj5UqOWGGov6oZeFIjLvqS7DxlEZ8IFlpoe6cay4BCqy6HOImteFa+aW34
         0PFaACf9bifua/w/LNDszHWwNN1t9eao3iCYgo9ex0HzqbEQeLEW3NAAswz6NCaYLgdJ
         Y/21bCU+VniAYJ6n3EtDZOw2mPBJ21TWS4wdeU60ZjY3qJwLdeztNq0dTuH0YQ5CFArX
         pirnxddcXePsBEnzLEDtHSkisolKbXs5BMYXSkVKYgSHmITYPATcGxXJZYFcIVB+E1cN
         YMIv6ZLbJkVkg873ZQroj1yXREzQP9QdNCPDuGFN9L29OEzYlX3hPxg351Uu4ocYy+BG
         FdTw==
X-Forwarded-Encrypted: i=1; AJvYcCUUNQkyyd+pWWe3IX7A7Yy5FPpjRq8xh5aP7WKwCtb6n3V8Zo/vQExfwuluDamOLhQwPQ4s5M1v7BzZ/so=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9TX//NirMayR84zgDSKt7036JXT7jtnVlf6v49FtSadqRYTNM
	EKnZkc/XAmxqw3YgMWNb9O3zKcd13waBVwiu9DhgKHLBIqMwXq1sQBV1V0DKqZ7YeA==
X-Gm-Gg: ASbGncuVYt12YxrUVLqfWPEUJ//JVTR6jj/pKRa9LZVmjcP+FoWVf+Q4Ft8+++paISg
	K78obGwaQwyAFwpBL0FiPlT9VndZopaXAJRDgC1opupYDWKpGJpDW4AGy7CT8I5AiHqElJTYaaD
	bSTs5W3yLU1x+tKp0qpo+UMuiFgDK/0MEi4af7QiNl9wWPuNBEYr2M38Lmj4XGeWIfdr6KeyuWJ
	/B4qguqwGju8eS0Jq7a1swxErHqo5Krtx8FwniboQ3WVSZN2m0ZdSI5ad2TJmooLEtJJRALFd/t
	i9jMYLXnVkpmD32dHFi/eUeoB8zjigMWzKm0zbiVUCL2igTnysHC/Bhg0kmO/uq06Gj0alVHQHM
	hjgJXLLHeq1NrDF3NpceQpOA/kdKdUDBCqcYA+oex1Q==
X-Google-Smtp-Source: AGHT+IH1w/Scs51jqqCK2u43ZpgzBf5ux9DORxds0o5CL5IqTPJAJcSzUBzUBTLiAES9RgG+Ppy0jQ==
X-Received: by 2002:a17:902:f641:b0:235:779:ede5 with SMTP id d9443c01a7336-23c86132b70mr3755145ad.40.1751579599657;
        Thu, 03 Jul 2025 14:53:19 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8459b3a0sm4249645ad.219.2025.07.03.14.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 14:53:19 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/3] PCI: brcmstb: Add 74110a0 SoC configuration
Date: Thu,  3 Jul 2025 17:53:10 -0400
Message-Id: <20250703215314.3971473-1-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables a new SoC to run with the existing Brcm STB PCIe
driver.  Previous chips all required that an inbound window have a size
that is a power of two; this chip, and next generations chips like it, can
have windows of any reasonable size.

Note: This series must follow the commits of two previous and pending
      series [1,2].

[1] https://lore.kernel.org/linux-pci/20250613220843.698227-1-james.quinlan@broadcom.com/
[2] https://lore.kernel.org/linux-pci/20250609221710.10315-1-james.quinlan@broadcom.com/

Jim Quinlan (3):
  dt-bindings: PCI: brcm,stb-pcie: Add 74110 SoC
  PCI: brcmstb: Acommodate newer SOCs with next-gen PCIe inbound mapping
  PCI: brcmstb: Add 74110a0 SoC configuration details

 .../bindings/pci/brcm,stb-pcie.yaml           |  1 +
 drivers/pci/controller/pcie-brcmstb.c         | 80 ++++++++++++++++++-
 2 files changed, 80 insertions(+), 1 deletion(-)


base-commit: 17bbde2e1716e2ee4b997d476b48ae85c5a47671
prerequisite-patch-id: 82aa80f7ebaa1ee1d48b59bd7f1eb6b21db3c41d
prerequisite-patch-id: e7b6b6e618ee225c9f4892a6078e7b3c4f8b1c73
prerequisite-patch-id: 66cabe0efb02132ce7cf8a849b5bb7f19ab407a2
prerequisite-patch-id: 118fda1b363bc18ef0736f917d1dd5497699156e
prerequisite-patch-id: a48573e6eca090a032c0932ff89f26eae4162db8
-- 
2.34.1

