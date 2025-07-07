Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [207.226.244.123])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36421C5485
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 11:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.226.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751889172; cv=none; b=NMqW+pWGw1icyTtUAexweIh3qHzwuox5HhlTaknFwmgGBjYhuOEg1wjnal+71XHe4OO4vWyyO0yG7E+8oDSt0KVcAmEZa8I+sl4b7gZmFXHRWT7JTNHMuB2xdZfEQ1JU0Ql0//vbIzWNBsjruLb7PDALoVaplTGiLmlChjDxw6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751889172; c=relaxed/simple;
	bh=12FCicUjjfZ9lxeY4mSTbNezI/AtmCjgVoNY8oN8zh4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CNpfNAieFwDynfSnAugZczU5XIRomqzLPSXN7CwZJtgI8dODTEaT+pNlT8RVdwbErClFDWMwWYwD4VLVlE2rW8HZRSb5XzFMml8CW/jNC7+APcbo9KNETpYIcRM10gBFeUvJkJlOFYFqvMe2JYpU3mlSeROJLHvU2UrKdWOn5ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=207.226.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: AEeIoheoSZiPmupsFeL80Q==
X-CSE-MsgGUID: av3+6Od3SDWD+KmU0zfBfg==
X-IronPort-AV: E=Sophos;i="6.16,294,1744041600"; 
   d="scan'208";a="145457956"
From: weilinghan <weilinghan@xiaomi.com>
To: Bjorn Helgaas <bhelgaas@google.com>
CC: <linux-kernel@vger.kernel.org>, hulingchen <hulingchen@xiaomi.com>,
	weilinghan <weilinghan@xiaomi.com>, weipengliang <weipengliang@xiaomi.com>
Subject: [PATCH] PCI: remove call pci_save_aspm_l1ss_state() from pci_save_pcie_state()
Date: Mon, 7 Jul 2025 19:52:36 +0800
Message-ID: <20250707115236.3076-1-weilinghan@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJ-MBX01.mioffice.cn (10.237.8.121) To BJ-MBX03.mioffice.cn
 (10.237.8.123)

During the suspend-resume process, PCIe resumes by enabling L1.2
in the pci_restore_state function due to patch 4ff116d0d5fd.
However, in the following scenario, the resume process
becomes very time-consuming:

1.The platform has multiple PCI buses.
2.The link transition time from L1.2 to L0 exceeds 100 microseconds by
accessing the configuration space of the EP.
3.The PCI framework has async_suspend enabled
(by calling device_enable_async_suspend(&dev->dev)
in pci_pm_init(struct pci_dev *dev)).
4.On ARM platforms, CONFIG_PCI_LOCKLESS_CONFIG is not enabled, which means
the pci_bus_read_config_##size interfaces contain locks (spinlock).

Practical measurements show that enabling L1.2 during the
resume process introduces an additional delay of approximately
150ms in the pci_pm_resume_noirq() function for platforms
with two PCI buses, compared to when L1.2 is disabled.

Signed-off-by: weilinghan <weilinghan@xiaomi.com>
---
 drivers/pci/pci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 9e42090fb108..0834211b0f8c 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1708,7 +1708,6 @@ static int pci_save_pcie_state(struct pci_dev *dev)
 	pcie_capability_read_word(dev, PCI_EXP_LNKCTL2, &cap[i++]);
 	pcie_capability_read_word(dev, PCI_EXP_SLTCTL2, &cap[i++]);
 
-	pci_save_aspm_l1ss_state(dev);
 	pci_save_ltr_state(dev);
 
 	return 0;
@@ -1725,7 +1724,6 @@ static void pci_restore_pcie_state(struct pci_dev *dev)
 	 * LTR itself in PCI_EXP_DEVCTL2.
 	 */
 	pci_restore_ltr_state(dev);
-	pci_restore_aspm_l1ss_state(dev);
 
 	save_state = pci_find_saved_cap(dev, PCI_CAP_ID_EXP);
 	if (!save_state)
-- 
2.43.0

