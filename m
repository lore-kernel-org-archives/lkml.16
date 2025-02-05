Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF511FFC4F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738782764; cv=none; b=SWEVMYnBMgIyrpgoLR1ADtFxNpPw+hIse51b8TavSGDpfk0IkEqT7Ubz8p14qtnaM+gKYmeEDykO2ChvjEqnX319idJAnj0hSgSnhtXVX9gxgouEMtCqjwU7y4zkhj0X/AU3rmrD0GbD/3SqZA2j4EyQnJEFMb7YLCN8o2VwBx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738782764; c=relaxed/simple;
	bh=QXoJSTy8Qec/wV8sRxRD2VX9SrJlzd1/bepXCqAcBgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NKydW0VLP6TX2SGNxUEvdw6g7gS39ltLn97eXi3cr2zyDlScD5O1ocsbOtFZHBtqg1ofQYtvquGL5yJmgD+GnYAKgDuT5xuROBgWaBkK8Jab1Yd5/bkMqVV3L7JM08iS1Bwmdcyzw7RWSpteOqx/ZBgqkFQjzTcJu+9xn1SYPZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=CWZ0OJDO; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="CWZ0OJDO"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f1d4111d4so2798075ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 11:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738782763; x=1739387563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0ZTsssVvHzsc0e1DxaZAFNaCnLOP9m4uEkLrLv90vI=;
        b=CWZ0OJDOmwGP708rLU98leg72Av/z5pMPNC1hmOYXttjcyY4glyYSPI0l5gogUSePi
         nkAXgToTQLOCnbjZrs6B8aUVm38gDbmi1qfYR1UdVDNJmIWmlBeHJUBS+fav/Inz543S
         ealfqxIFkE+375jly1Rs9TCuM7Icg47RPyuoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738782763; x=1739387563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X0ZTsssVvHzsc0e1DxaZAFNaCnLOP9m4uEkLrLv90vI=;
        b=RfNNOZUF3HwLdUQ8Gom7Iye1uYlZzftkCsmJQ+r6EtefTbD4OqhglxX3KBI+LIuWKh
         JYuyXBlezJCMDnMg0hsROqjx/OKGmjar6hqS1OBnEaiM9JiInUs7SvGSNJNRRMBbzfiI
         bO3t6rNC4fFdGp4hhkbwkHw3N/7aYVttQ8xSKR3L9LEX/l5qJIn57XFtvEQC1Z7kF2lm
         jPUGZFDXpAZpDUGr/clAR2MNnSFPGHDUvDY4G9tkTtjFddS1VBqlvydN6yBHIBA2BzPv
         dqvMmVYW0WPnS2vHOWaFL3uGpjRaAaCfK40fnvV9Vd0Uo33QLh1fpBoSoFdUeg5/qy7l
         kD9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUFZ3XVJWL2Agssn45AuX1cEK1sv6jbu78lNImLwYIy1m1wwzo+er3mahuTWip7qareEuFS1hHJJO552s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi9uUsxa4FAOfpvBZO834a+mNd2YsZqSqtsAZ5jcRJkJK0ep7D
	lnA4Ftjkdy6U07bU/R4zy5N3LNYkG/3mkJEd7dm1CtSBqlXjQGkF0E6LE1I2Mg==
X-Gm-Gg: ASbGncuxsPESSjXGtgVxbPvI1eREnJm3ctcRDcZOlPzkxCqe2h3eQGjXJiPgLCliYCJ
	Gc2OfB6yZtIbXPsIKidOyTDlV+U7KCYtJznmUSJ1s8YYDPVrKHTc/LG89hMEyF1XwX7z3v1vx5N
	Xy+jtjDFmpAdwqBVc31L1AiKTpklWaFnl8Gdh7UNY3cqImIAOZOtp6uq5gH7FPYTvgef0WR5mxm
	vJ+tCAApUujzX3pbXGvCZus1Q89QxC36cYGoHe9UaUiSoAHlA/ZDy39J4ksQE5hPnsrHw2noFyr
	ULls40G4ChL8qgZ39mMr1uq9LSLAbDR0dpnVybtHoW8R3C/gjkuvUgYwCin436F9sCjd72A=
X-Google-Smtp-Source: AGHT+IEXcZFzv42qZ8TJ/klgDwqqS/+A00tWNgeMvaWCk7kbJI8shXduYKzokviPveKCUA311SJ4wA==
X-Received: by 2002:a05:6a00:851:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-73035224858mr7975973b3a.24.1738782762954;
        Wed, 05 Feb 2025 11:12:42 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ceb1csm12670842b3a.151.2025.02.05.11.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:12:42 -0800 (PST)
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
Subject: [PATCH v1 6/6] PCI: brcmstb: Cast an int variable to an irq_hw_number_t
Date: Wed,  5 Feb 2025 14:12:06 -0500
Message-ID: <20250205191213.29202-7-james.quinlan@broadcom.com>
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

Just make it clear to the reader that there is a conversion happening,
in this case from an int type to an irq_hw_number_t, an unsigned long int.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index da7b10036948..1e24e7fc895c 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -560,7 +560,7 @@ static int brcm_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 		return hwirq;
 
 	for (i = 0; i < nr_irqs; i++)
-		irq_domain_set_info(domain, virq + i, hwirq + i,
+		irq_domain_set_info(domain, virq + i, (irq_hw_number_t)hwirq + i,
 				    &brcm_msi_bottom_irq_chip, domain->host_data,
 				    handle_edge_irq, NULL, NULL);
 	return 0;
-- 
2.43.0

