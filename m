Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D774822DA06
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 17:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750785408; cv=none; b=DFj7yxZFu6hS9O4HjB37emL71Dvs0LW31m0qOhLLR39LSgS+k0vCwDicCLTCuxAw5pQWh8Lvz4VXcQ3gg4mmcZjUuMyb28ToKkEPY0fOh7XalBQmoIeHQW4eQai1d6cLMvcLIWOHPK4AfpoI2VXliWJwYm+X+OO+XkHzLD32M0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750785408; c=relaxed/simple;
	bh=UzeZm2Dy/mhkv8CVcruISnEH4zMnwLd2oQpCKisf3RM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=hX1NikUDPlnu4LHiJrx0O+4JYP30Ai60kjI2f0x3jYcOIZSlXl+JgFE2vvcKALNm3oPwldNnT7PtJnxXaU75aIRYzU8hjv2gIYs6lqqaHrmgIkqPgqVRYfP+eXWat0BVACoRaCXn++pJu+Dg/h0rcC6KazjkgLCsNRjab6DNMNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B7mdwUhf; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B7mdwUhf"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-311d670ad35so5337579a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750785405; x=1751390205; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPtppNiFBf/kpQxTJ/QVNZEJkcz7SYItGSNnHN7Dvg4=;
        b=B7mdwUhfmyh890YqVNJFPe5Nezb256WFO9AQlg3FrSZmbJmJttNJ3EtaK4VyjygNVg
         nwAf1HeXXjxY1pqHQXAsEx0hXC6IRXKoxHmfxKF0h6sBCUgYkmemaO/hi+czmkw1MZCo
         9L5RBiNPnRre8UigRtSSCiB0Kbf5mcgkTAldgPKD4FUB19Yc0SLPZUC/6JTP7VGaG5NA
         ihwcgxprUSTsb6PUj23AxkHAOTLnNN2uG3zIK7Q0Tr8pS4Yk0IpSo4Kx3CBq9nBPhGyA
         6d+wXI+rfOOtLvhlG5wlr+5oBeZCHvw+1yed8LJ9/IsMMfCybvLsKyMxQh/PeYrPF2sX
         gOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750785405; x=1751390205;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lPtppNiFBf/kpQxTJ/QVNZEJkcz7SYItGSNnHN7Dvg4=;
        b=fauiWMhu5dJt2rH1UAj4sngH3WQM1bzArRM8Ex/AbfVN9neP0iNyPueVn4skEBeoTU
         PVTBq9VCTSGkw8xZBwc0nbcLGpMYjo9xoqQS5LHvi0njknbd92BECZMs2TBQz+MtvXEY
         YPKLqWXx6DQdzQG+Gbp9Wx8X+mWGGucs6hAcP65DFVnda8TUNLcvAvVwgPZd1/FMEbeM
         zbaseh6TSw2Mbov7vRts60FF+qKT02vJxibeRcxMnEtWFSJaxllw7+loWYSgYYnMVqLk
         VFDuOI6Qq5QxCl4+bXVPNtnN7pa1oqTWT6gKWRqDDWI6ekZRcxP83tSZBRwCN1wgb/9F
         cepQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx+ii4qOnz0FoDNGGJIs/Ykpq9B5zXcxQfg8V34MG7UtNqwxpJjQWRqXc8fGy/rkvkFvQwCfgxqCm4EGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJcLeioQfjSIRCbb1yFWpYfjPAVm9jdOJopJi4Bfo1nkt9/iEN
	isG4OJcDonEx0sJRCVFvXn8EoU31kba2japhAxEyivDQ2eSNpdNhqDsyFzyzLRnmigLmMvyTl5k
	g/hQx/g==
X-Google-Smtp-Source: AGHT+IFQh6rUf6fsoF1t2iLUmyALBoHLClEocHM1YgkuSdWwDe4MSrhtzjYWYkrbMppOXI0EHromoCwUqBk=
X-Received: from pjbqo12.prod.google.com ([2002:a17:90b:3dcc:b0:311:f699:df0a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2650:b0:313:dcf4:37bc
 with SMTP id 98e67ed59e1d1-3159d8fee49mr23229037a91.34.1750785405290; Tue, 24
 Jun 2025 10:16:45 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 24 Jun 2025 10:16:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250624171637.485616-1-seanjc@google.com>
Subject: [RFC PATCH] PCI: Support Immediate Readiness on devices without PM capabilities
From: Sean Christopherson <seanjc@google.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

Query support for Immediate Readiness irrespective of whether or not the
device supports PM capabilities, as nothing in the PCIe spec suggests that
Immediate Readiness is in any way dependent on PM functionality.

Opportunistically add a comment to explain why "errors" during PM setup
are effectively ignored.

Fixes: d6112f8def51 ("PCI: Add support for Immediate Readiness")
Cc: David Matlack <dmatlack@google.com>
Cc: Vipin Sharma <vipinsh@google.com>
Cc: Aaron Lewis <aaronlewis@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---

RFC as I'm not entirely sure this is useful/correct.

Found by inspection when debugging a VFIO VF passthrough issue that turned out
to be 907a7a2e5bf4 ("PCI/PM: Set up runtime PM even for devices without PCI PM").

The folks on the Cc list are looking at parallelizing VF assignment to avoid
serializing the 100ms wait on FLR.  I'm hoping we'll get lucky and the VFs in
question do (or can) support PCI_STATUS_IMM_READY.

 drivers/pci/pci.c | 40 +++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 9e42090fb108..cd91adbf0269 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3198,33 +3198,22 @@ void pci_pm_power_up_and_verify_state(struct pci_dev *pci_dev)
 	pci_update_current_state(pci_dev, PCI_D0);
 }
 
-/**
- * pci_pm_init - Initialize PM functions of given PCI device
- * @dev: PCI device to handle.
- */
-void pci_pm_init(struct pci_dev *dev)
+static void __pci_pm_init(struct pci_dev *dev)
 {
 	int pm;
-	u16 status;
 	u16 pmc;
 
-	device_enable_async_suspend(&dev->dev);
-	dev->wakeup_prepared = false;
-
-	dev->pm_cap = 0;
-	dev->pme_support = 0;
-
 	/* find PCI PM capability in list */
 	pm = pci_find_capability(dev, PCI_CAP_ID_PM);
 	if (!pm)
-		goto poweron;
+		return;
 	/* Check device's ability to generate PME# */
 	pci_read_config_word(dev, pm + PCI_PM_PMC, &pmc);
 
 	if ((pmc & PCI_PM_CAP_VER_MASK) > 3) {
 		pci_err(dev, "unsupported PM cap regs version (%u)\n",
 			pmc & PCI_PM_CAP_VER_MASK);
-		goto poweron;
+		return;
 	}
 
 	dev->pm_cap = pm;
@@ -3265,11 +3254,32 @@ void pci_pm_init(struct pci_dev *dev)
 		/* Disable the PME# generation functionality */
 		pci_pme_active(dev, false);
 	}
+}
+
+/**
+ * pci_pm_init - Initialize PM functions of given PCI device
+ * @dev: PCI device to handle.
+ */
+void pci_pm_init(struct pci_dev *dev)
+{
+	u16 status;
+
+	device_enable_async_suspend(&dev->dev);
+	dev->wakeup_prepared = false;
+
+	dev->pm_cap = 0;
+	dev->pme_support = 0;
+
+	/*
+	 * Note, support for the PCI PM spec is optional for legacy PCI devices
+	 * and for VFs.  Continue on even if no PM capabilities are supported.
+	 */
+	__pci_pm_init(dev);
 
 	pci_read_config_word(dev, PCI_STATUS, &status);
 	if (status & PCI_STATUS_IMM_READY)
 		dev->imm_ready = 1;
-poweron:
+
 	pci_pm_power_up_and_verify_state(dev);
 	pm_runtime_forbid(&dev->dev);
 	pm_runtime_set_active(&dev->dev);

base-commit: 86731a2a651e58953fc949573895f2fa6d456841
-- 
2.50.0.714.g196bf9f422-goog

