Received: from ssh247.corpemail.net (ssh247.corpemail.net [210.51.61.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC912494ED
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750317249; cv=none; b=MJ/DsQefKlX7qxVC7ah8ytQubcJgUryTsWSuBquitJm12CNqg3v8XzjdBd8oKiJTn7xNGWmcQitWlZeAVI2e+ljLowcCVqhzQIARhFnLvE+E7JPqTQzieqBrzoKNyvTRUnUdte75grpm2x94duKkDcg4QgkSQHPXPdikTSVuRNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750317249; c=relaxed/simple;
	bh=AAgvmBqsd+NvBhudgv7M6iRTFypWRRyxHZ/vPM7pEE8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o6bi/0VAFn55ywatwl3F+uMbNS1eWX75pgW2YBS/631G+7tVjRvEpRBaS+16mQsf3wyHCmJvnTR/TMwKKHTR0HSHU3m4Ww7U9j0SZ01bpOu/bImzqHaB9JdmmGsCquxK392/8F93Rg9zx6o4AYjoyH3YlMOTcXK7N79IJQdu8mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from Jtjnmail201618.home.langchao.com
        by ssh247.corpemail.net ((D)) with ASMTP (SSL) id 202506191513513460;
        Thu, 19 Jun 2025 15:13:51 +0800
Received: from localhost.localdomain.com (10.94.7.47) by
 Jtjnmail201618.home.langchao.com (10.100.2.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 19 Jun 2025 15:13:50 +0800
From: chuguangqing <chuguangqing@inspur.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel
	<przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: <linux-kernel@vger.kernel.org>, chuguangqing <chuguangqing@inspur.com>
Subject: [PATCH 1/1] ixgbe: check the ioremap return value first (supplementary CC)
Date: Thu, 19 Jun 2025 15:11:21 +0800
Message-ID: <20250619071253.3498-2-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250619071253.3498-1-chuguangqing@inspur.com>
References: <20250618092544.53696-1-chuguangqing@inspur.com>
 <20250619071253.3498-1-chuguangqing@inspur.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Jtjnmail201617.home.langchao.com (10.100.2.17) To
 Jtjnmail201618.home.langchao.com (10.100.2.18)
tUid: 20256191513514699e9fac132e6ca4917fb5f5223e432
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

We should first check whether the ioremap return value is NULL before using it.

Signed-off-by: chuguangqing <chuguangqing@inspur.com>
---
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
index 6eccfba51fac..97a49463b09d 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
@@ -11431,11 +11431,11 @@ static int ixgbe_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	hw->hw_addr = ioremap(pci_resource_start(pdev, 0),
 			      pci_resource_len(pdev, 0));
-	adapter->io_addr = hw->hw_addr;
 	if (!hw->hw_addr) {
 		err = -EIO;
 		goto err_ioremap;
 	}
+	adapter->io_addr = hw->hw_addr;
 
 	/* Setup hw api */
 	hw->mac.ops   = *ii->mac_ops;
-- 
2.43.5

