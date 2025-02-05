Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08C51FF7CD
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738782752; cv=none; b=NeWTkk6p6XeLFx5L2j9LMcpnYDvB1btpg8N/X+tYE3gv+5+LGzYQTAHLZstIOIhHJ2AN6c/z1w7LZiR/r6Vmj25FiaKknJWJsq5jIWm2FB2rTK8gk0AUoO3h0A0TR0V7aMw8R2E2hHFD9anYuh8mLzHZP5EmkA4gAS/nbpnbRzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738782752; c=relaxed/simple;
	bh=pnzOH1e2axdVqJngQp6tdqFmDskboQFLalroUwFTUdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bx1OkPJ6ra6kK+oXIGFdH5VIz5oR06XX4CxPJgD1FPTZyF18gs/JdNoWjsLsz+8x9uOTL/xXoYqnOlCv/F3WBEXOC73EAgOQp/MaFXPe0EENaPxEsjDkVHXOW+SHXTNaeQI6H4KZJBcH2BnvSBW1cDa1dPgR9oe1tqw4uNFhA2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=G34l7Riw; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="G34l7Riw"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f2cfd821eso2909905ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 11:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738782750; x=1739387550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rshGoTVKNv7yJ8UG0ncdA2L3Ez+eMRudoZQa+hQwzgo=;
        b=G34l7Riw5CEHbbRxZts1CYc48HpXGjRfgWl5FQoMWp8Oo28jSTwQRwdu3DvfK5RjfP
         yX58EoHrk8Ndjp+fezovoQh9xvZDb2lqna+hPkT9ECX8e2NDwNXRN0pxx0PFLrkwJ/km
         Mqq2WEcfwyhhkuuNOMUS769/Nj8gI2tCmzI/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738782750; x=1739387550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rshGoTVKNv7yJ8UG0ncdA2L3Ez+eMRudoZQa+hQwzgo=;
        b=EmTMo7rJjiOR3M+GrlHwFxCXycxrTl4OJpTc7ROa++Yu0aTHeyvtF8n26PjUWHrKrL
         8Mpo2+ZX0g2OFn/rwFe0YJCmUmWfehMa5C8I3ad39EIh1GuaM3mfdadJzVTT1UPD/V7e
         fu0s5KuxnQO9CRjpvnfz4R+jqxS7gHEQyukZQQctz6tmWQQoYoAVr6dC+w32Q6AwjB1P
         yn70HU0n6VZDRMcF6t7dBOkQ8vFrhApxiVjvJP6zLXRLOtzRg93eAEUKgqBUiph1uLan
         bbU0BzyrazU6B020dbXsLv1iYEKrLFLM3e9joi2ZH3zkM+ZQg0LJWAJ0ArUeDwihxUGj
         pb7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtoljkxMMkEb4oBGmzBKDOt1NxCPwQbBwxGSiMfiJosGxTP80DZ7isovXrAeoFHeGJKB4RTHBVFQ6net8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhB84phC6S/ExJ8awta1qsvvd6qWKsd2Zr+c/0wjUpi0Iq/907
	bi0XpGpuGhHUw14AzxpywvFQGykpfOPOO9bREMYCzMvPt8LkmONCMGd0wr1PJA==
X-Gm-Gg: ASbGnct+NZJTivAovrXrsNUOFdlxH668qIDTuHiXB8mCrv94pfHASHUPXK/imtu3yr6
	m9x907S4Hm5yZqsXhtvX9zOrrh+6d1hadeV1P0ry4FfmgLUi8+dbHX4B7lvLiF116tyCIdu3XGU
	NdrZ0nbOz3SOrag+Tz74mSzb6q5+IEwWYifKKNGBcxoE1Iy87F2KRgUeU4pP9OSqhGuHaUIkuuP
	C5zhpGietdyj2F3XXgQa7//yakewX5QM5yHTfgQ0vXojqgZGeI/pGpx8CB5YuQH3yQxpgqUup47
	aXjvYuF32aFyeXLIBjpGWyTfBmwc2keUxA/di4XGGuBuINNUhH5w/8N+LRgwMEot1p6BXSQ=
X-Google-Smtp-Source: AGHT+IEvH1UsOv2Pdep53yziZn/D7SThmLNGW4jFaeetD7lQZsfU1M4mdvMGq8u34jzx7Ya85/+NnQ==
X-Received: by 2002:a05:6a20:2d0b:b0:1ea:ddd1:2fa7 with SMTP id adf61e73a8af0-1ede88b9994mr7396175637.28.1738782750080;
        Wed, 05 Feb 2025 11:12:30 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ceb1csm12670842b3a.151.2025.02.05.11.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:12:29 -0800 (PST)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 2/6] PCI: brcmstb: Fix error path upon call of regulator_bulk_get()
Date: Wed,  5 Feb 2025 14:12:02 -0500
Message-ID: <20250205191213.29202-3-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205191213.29202-1-james.quinlan@broadcom.com>
References: <20250205191213.29202-1-james.quinlan@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If regulator_bulk_get() returns an error, no regulators are
created and we need to set their number to zero.  If we do
not do this and the PCIe link-up fails, regulator_bulk_free()
will be invoked and effect a panic.

Also print out the error value, as we cannot return an error
upwards as Linux will WARN on an error from add_bus().

Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulators from DT")
Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index f8fc3d620ee2..bf919467cbcd 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -1417,7 +1417,8 @@ static int brcm_pcie_add_bus(struct pci_bus *bus)
 
 		ret = regulator_bulk_get(dev, sr->num_supplies, sr->supplies);
 		if (ret) {
-			dev_info(dev, "No regulators for downstream device\n");
+			dev_info(dev, "Did not get regulators; err=%d\n", ret);
+			sr->num_supplies = 0;
 			goto no_regulators;
 		}
 
-- 
2.43.0

