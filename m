Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2188022126D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 22:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749507445; cv=none; b=O5JK6Nkoxsr1uFTFldTKEsueG5nS1tOVdbjcb2UhYXqbNo0AXKmcmBA5xYZSUGuFqacbQJK4kxV25w9DnnY2XnpJem39udpsbNpg+taA3T+poov0MoiTUO7CJ3ErNZHWtjcnLIeguqG3tMh2c0Cq7dKt/WjCrimjOBGTe1rjlIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749507445; c=relaxed/simple;
	bh=UBflQpbbZ7w3WTTGgjY5gFLz6h4vwKvYcXA9ikEVJt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLZwFJZIjmL5FLrwUMU3w6Q+SJl9K96SiGI9G2XwvHBvnCXUTUlr1aMfaq2+CCbnTrrUnL/TmRCEc0+Lf+Tovebpr1M55xgJZP2fwx+MVCHVbhG3tbKypphwtDZ7AQuJbFSPlOyePT4qy9MEQLRgMhbZYNiFFSFAcryqUOPaPJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DbprGGZF; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DbprGGZF"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22e09f57ed4so51918435ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 15:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749507443; x=1750112243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBUD75Q3AziMcY5PYVnKHBZmS1CbPzVtDbztEvvN+00=;
        b=DbprGGZFISL/kka4ONVfLXKwFsqj6h270ByNe9DW7c7xnkfX9tKnVesB2RJqcRfHtZ
         z9dhlP/IGiYEqbxGC12krmUtk0ykAbQ4WEbqynb7QCdDmf+AfwIeZidj35GlGKx86E2c
         I/A+3iQIVkJ+Fi91HHZeXQr6WTkV6uPHTAMB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749507443; x=1750112243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NBUD75Q3AziMcY5PYVnKHBZmS1CbPzVtDbztEvvN+00=;
        b=JnDayvvWDMI8vUK0IKHhCUF1iZceu36NI+6StCXfhb2wlsvcGL4nfadmti3dYVwQG2
         oUWgUhs80ie2e3XVGGfDMdHWE92zf7up1IZbF2gx8VEAA9i4+dgEJC0vwnThOav0SZ+9
         J5JTJdFNJfcIGrC/LINP5f5Gy75k0XCKu7oAHLqZ+UFO3wp4H+EbTJTITBkHTucsqCKr
         4cO7azS+URUFPjZHP4fSbAa/HjX2RRFu5yDPwhVKn7UpZi37gMbc/ut5L5IJrIzCPMOI
         SQhHMh5ka8loUoVZ0KNWNCXgZgRLldqDFMZHQLUTbvLJ569+ZnqojtYUQhIgBCSe4gp6
         Hczg==
X-Forwarded-Encrypted: i=1; AJvYcCX5MRB7kp1snWhvvB8SxBoalHlbuSWdaL+kEBlDJ22QxF7DtNkSFu+4W6v97iOBqJAzhRDJ7dEGZhGyMuw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ZQDOjZZeZ6D14u6arysrHuOhSEv98a96xQTnw806wW7i8ZqR
	fiztRR7Pfg++5VlBrduWtINnY5LU57R13eISujN0+12t9E5gr4D9f0XysFhgSYzWhA==
X-Gm-Gg: ASbGncuOoiWUEklrRdiQs8Q79QyoiuQRA1cwOYSEcv4Ld5Rtfa3mlVVzHgcDvomnf7O
	RFs3ADrl4LyE7S2fv2KCXOvXDc0TfB01x3UdHz6RQcfnfpaSpNWqpBq3cystEm8PvoR124uGCLo
	RT8knLTUmgK/dSTde1mHTwsYyG6JpB7mUXoK95TKt9Re1/aneO+z4SoJ1xVKGnIlGXqOIq+o8Fm
	H+YwciycrJse/9IE2yDN6zIScx+63T4mw3T4xsUx1jF6grYmiT4Axi/Ixg3fRNii0dOz0kuqy9p
	ktuC+bq6/vMxe89m3tMJgAdgMvmsGNi6JallbCqy25tcLmwDJP8ax5Ji6K4vWCWK5Hk/4TD2MYK
	fuOCSRjHo9N49kbVWbqcuuLAQeh0sg2uh88EPFE6sLQ==
X-Google-Smtp-Source: AGHT+IE1FNMKtiTApYjphNha+o5VVMyg4NsmX0jAuwgOPEaUxUgCBJ815QhGkEUl1A7feIyNVDvKnQ==
X-Received: by 2002:a17:903:2f81:b0:221:751f:cfbe with SMTP id d9443c01a7336-23635c522f7mr16738715ad.19.1749507443428;
        Mon, 09 Jun 2025 15:17:23 -0700 (PDT)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078d65sm59290415ad.5.2025.06.09.15.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:17:23 -0700 (PDT)
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
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] PCI: brcmstb: Refactor indication of SSC status
Date: Mon,  9 Jun 2025 18:17:05 -0400
Message-ID: <20250609221710.10315-3-james.quinlan@broadcom.com>
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

Instead of using a bool to track the Spread Spectrum Clocking (SSC), just
use a string constant since that will be the end result anyway.  The
motivation for this change is underscored by a subsequent commit that adds
Cable Modem SoCs to the driver.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 92887b394eb4..db7872cda960 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -1320,8 +1320,8 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
 	void __iomem *base = pcie->base;
+	const char *ssc_str = "(!SSC)";
 	u16 nlw, cls, lnksta;
-	bool ssc_good = false;
 	int ret, i;
 
 	/* Limit the generation if specified */
@@ -1357,7 +1357,7 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
 	if (pcie->ssc) {
 		ret = brcm_pcie_set_ssc(pcie);
 		if (ret == 0)
-			ssc_good = true;
+			ssc_str = "(SSC)";
 		else
 			dev_err(dev, "failed attempt to enter ssc mode\n");
 	}
@@ -1366,8 +1366,7 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
 	cls = FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta);
 	nlw = FIELD_GET(PCI_EXP_LNKSTA_NLW, lnksta);
 	dev_info(dev, "link up, %s x%u %s\n",
-		 pci_speed_string(pcie_link_speed[cls]), nlw,
-		 ssc_good ? "(SSC)" : "(!SSC)");
+		 pci_speed_string(pcie_link_speed[cls]), nlw, ssc_str);
 
 	return 0;
 }
-- 
2.43.0

