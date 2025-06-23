Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F2E26AC3;
	Mon, 23 Jun 2025 02:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750647008; cv=none; b=dOBbp3GTjlCnsSIGKMutNly93Z0xPjeVnlemNL/EyB/TkMCGrgEMGj2HvEc/kTA+BfN31poZU4LgVaMkhA3gIOaGu1cY9U9bLKiU7mfovPTnyMyTYPTDKjGWXtSB1kqIqRpa9wEYKUup5gkJ50ChzRT6bZpvLDAzKKzE+q0qAbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750647008; c=relaxed/simple;
	bh=XPV1rdJd9lcxvZ432ZYlUA+7VFbk50oZq/aOndVWVAs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KytWIMWMUv/FVD6ZJu6Lw0LnuSAb6BusRn7Fv6TFUWQx5pctcnSqo8xnBCORn+T/5UjhDBIdQ1h409TM/uUpYWTRdqFwhjVIg/0g81/NGSXf74K+zEC7XrxRtJRMIW3O0nGIPraxOATJ1UJPWaSFAKCHRond8hkXysllhcyDdV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 23 Jun
 2025 10:44:56 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 23 Jun 2025 10:44:56 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v4 0/2] [PATCH v4 0/2] ASPEED: Add mailbox driver for AST2700 series
Date: Mon, 23 Jun 2025 10:44:54 +0800
Message-ID: <20250623024456.2068370-1-jammy_huang@aspeedtech.com>
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

 .../mailbox/aspeed,ast2700-mailbox.yaml       |  57 +++++
 drivers/mailbox/Kconfig                       |   8 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/ast2700-mailbox.c             | 230 ++++++++++++++++++
 4 files changed, 297 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.yaml
 create mode 100644 drivers/mailbox/ast2700-mailbox.c


base-commit: ec7714e4947909190ffb3041a03311a975350fe0
-- 
2.25.1

