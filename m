Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841223C30;
	Wed,  2 Jul 2025 01:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751419208; cv=none; b=oTD+WVsQetdgluG/gr0sTmCIuGDwbsbefyXjQcGDgjLyAk2W4L416nKwqS7VAyHrPB8cqiWttbx39MIlDlPDAer1EpcYESjhf6plEBjpRm6ju42ORUM0WCXsX9JZOIcyqOspDKlF4vLz6v649ipgOnmoBegaUa3y8xktL+qBcT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751419208; c=relaxed/simple;
	bh=Hs3i768dwPsoUxNaz+oZSekXJNx0gsy8vC4jq+H4f0U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=su3hE7L1pVJ89mLlo5NXCF1fOIR20NJC2qN9VshAEI5V2pTXu8D2NADDeNlaKftA4RFoorZrgpLd1971BQl8253Bv46MfC5iHOEm1pfcZQ8z0MBY0pGIRGqauLsEXaKzj7vCmsoszQn27TTZ0LxapOmN7NYVCinev+jjv8WH1Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 2 Jul
 2025 09:19:56 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 2 Jul 2025 09:19:56 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v6 0/2] ASPEED: Add mailbox driver for AST2700 series
Date: Wed, 2 Jul 2025 09:19:54 +0800
Message-ID: <20250702011956.47479-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add mailbox controller driver for AST27XX SoCs, which provides
independent tx/rx mailbox between different processors. There are 4
channels for each tx/rx mailbox and each channel has an 32-byte FIFO.

 v6 changes:
  - Update document
     1. Update description to preserve paragraphs.
     2. Update for property, reg.
     3. Add reg-names.
     4. Add 'Reviewed-by' from Krok.
  - Update driver
     1. Use devm_platform_ioremap_resource_byname since we add reg-names now.
     2. Update error code for ch not enabled. 
 
 v5 changes:
  - Update document
     1. Separate reg from 1 to 2. 1st is tx controller; 2nd is rx.
     2. Remove 'Reviewed-by' since the patch has changed.
  - Update driver, no functional changes.
     1. Update since there is 2 reg base now.
     2. Refine reg definitions
     3. Add spinlock to protect registers
     4. Use bool as return value for ast2700_mbox_tx_done
     5. Rename variable from drv_data to dev_data.

 v4 changes:
  - Update driver, no functional changes.
     1. Remove unused variable, rx_buff, in struct ast2700_mbox.
     2. Remove unneeded cast on device_get_match_data.
     3. Remove the usage of writel/readl_relaxed.
     4. Improve readability.
 v3 changes:
  - Correct document
     1. Use 32-bit addressing in dts example property, reg.
 v2 changes:
  - Update document
     1. Correct error in dts example.
     2. Drop description for mbox-cell per suggestion previously.

Jammy Huang (2):
  dt-bindings: mailbox: Add ASPEED AST2700 series SoC
  mailbox: aspeed: add mailbox driver for AST27XX series SoC

 .../mailbox/aspeed,ast2700-mailbox.yaml       |  68 +++++
 drivers/mailbox/Kconfig                       |   8 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/ast2700-mailbox.c             | 240 ++++++++++++++++++
 4 files changed, 318 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.yaml
 create mode 100644 drivers/mailbox/ast2700-mailbox.c


base-commit: ec7714e4947909190ffb3041a03311a975350fe0
-- 
2.25.1

