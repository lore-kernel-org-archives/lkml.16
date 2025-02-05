Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C467944F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738782755; cv=none; b=YxQI3eJ8lHu0BNgoi6uLtQmDFrU7SR+j8Txx23T3x0Jh/4tydIv3Ds9sjb8fJTqrv0CAItDAVg8qfQp44Z9Hl41MXQPHFKp9B1SB7ZjBfN5ovly9F2DLyuq0Xp2lxpLijDwIMJ0WjJiQJeA6cVuZUUk8iMLDD9TBt9X60pZHl4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738782755; c=relaxed/simple;
	bh=UOaTvQH694j5NPXqH8YX0yM0fuej0rpwLUTQghdWl0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CpebZC0NLHPIriSgbcXgu8TwIb4Cz9Zofxc9LIsYmkn8KsWnztgeQTxUeQS3maq88EwkamMF4/aRW9evIhVPxC1aRUJamOZlHyfC9JVfMQtGMPB61479QUZG/voBafqMImaTAVQ/i1OT16l4XGI3K/YlgXajD7IOwuZHIx3rWZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=A9GElEUe; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="A9GElEUe"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21ddab8800bso2623265ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 11:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738782753; x=1739387553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rl5E0UVjy+KHHY0GruFIRH1nxCM5/nCEesXNNBsIatY=;
        b=A9GElEUeIbvmJcxzBukyz1jbrl+RbOeLkyl5HcUG284mWMyWpX9mAI4Wh/a2U+PG5e
         yglnbrryzc/8NupWix+bgE8V1wGSU4eVXw/w3wOi2qx027CpYrUBagMGDz8VX6Q3Y1Y0
         kLdS/1tpe86tnsuaAWOdcsuD1yIVrAvGHTxSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738782753; x=1739387553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rl5E0UVjy+KHHY0GruFIRH1nxCM5/nCEesXNNBsIatY=;
        b=Z797ZIVhAhLiZ0YXfcQFVVgBkqYBN7FGFLOglnzuCzd9u6tKSNv09yoqCansgBovnE
         DHuczkqueoDVBi1hPNRjY9WVn2tmU+WA8wzy8OQPDYy81+MN0I5QB8gk/xq5mjv0HBSk
         pHXdE2Dbxcd5j/JU84xgGqHDGM7Sm2G6UaLfOenVrGYMjndT2/pGg2MX0t5mibOgulGR
         MdRUF8zk8QsL1FGrvVCEmQQePS1l+IPC/pGUmzIw9BrHAm8bDIItyKvxw4gS6ck5okmG
         jQA15qUEM5y2HaeQqeRsejfyiBIU87msgVKsFmaQkOWzxbSFrfBUxKkzYSRH96huiNU6
         WRxw==
X-Forwarded-Encrypted: i=1; AJvYcCXqicAxq84c13nrAO2OtZrZL0tyMtlNfiJdr1ibM4R9FZ6YhIJmEtx2Jm08GzATCzXNPiWiJWU6XoXG6f8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEWNzaM61RNJbNnMeKvyuHJCAuzgAOQGsK6K6Dmedavkt58YyR
	FCb9bFbqm6fADoO8QbudQgNxfDb9XsbO8trnBcMz/IKD8rdW4BbC8lGjN/otfA==
X-Gm-Gg: ASbGncsVbvUMebHZOC7PuBt2eRtrw5JkQzrYvkD8rrTYGJWu/Fmr2ChVxPvjbgGeBsW
	JJJ8U8LP0U/49BCKjR+q54mXGl9g2/AnDyKQmv1AwYBSAqV/gxFOI0oC56gf6xE64zlazEu6cW8
	88ilex/SvFz0ja06m3rNQGpbzhCZ5cfoejAyco7c2imQUFHBZoS5XkcMhL+T13y71+1Fer1fALj
	KQEvvuNIipUF8ib/TyKH1OwgaWF8InAMw0BbksFs0pyn+nlmIaTyzM8XYgQyQ/pWPEAlvFdSlGi
	Q7Nwya0bEdaGpWp8k4/OriUOzdnX2K6Oa8+ruywoLS3BGIrOcdKx+lEYVmmbjZFrruC9XH0=
X-Google-Smtp-Source: AGHT+IGHNDQdUmc+0d+Oa25tolqBbEh64Eprx1WXUEnsJUtgXypSDf+wemV6e9iAiBws6tIO7Kj01Q==
X-Received: by 2002:a05:6a00:3cc3:b0:72d:3c4d:c1ea with SMTP id d2e1a72fcca58-730351017f7mr5551115b3a.7.1738782753270;
        Wed, 05 Feb 2025 11:12:33 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ceb1csm12670842b3a.151.2025.02.05.11.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:12:32 -0800 (PST)
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
Subject: [PATCH v1 3/6] PCI: brcmstb: Fix potential premature regluator disabling
Date: Wed,  5 Feb 2025 14:12:03 -0500
Message-ID: <20250205191213.29202-4-james.quinlan@broadcom.com>
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

Our system for enabling and disabling regulators is designed to work
only on the port driver below the root complex.  The conditions to
discriminate for this case should be the same when we are adding or
removing the bus.  Without this change the regulators may be disabled
prematurely when a bus further down the tree is removed.

Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulators from DT")
Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index bf919467cbcd..4f5d751cbdd7 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -1441,7 +1441,7 @@ static void brcm_pcie_remove_bus(struct pci_bus *bus)
 	struct subdev_regulators *sr = pcie->sr;
 	struct device *dev = &bus->dev;
 
-	if (!sr)
+	if (!sr || !bus->parent || !pci_is_root_bus(bus->parent))
 		return;
 
 	if (regulator_bulk_disable(sr->num_supplies, sr->supplies))
-- 
2.43.0

