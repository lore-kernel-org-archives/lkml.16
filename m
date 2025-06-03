Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5564227F195;
	Tue,  3 Jun 2025 07:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748937296; cv=none; b=SWd4rfr2HG7YYT4/NvF/ysdBtlNBF+AfHmbqTzQqnfBadInmPRCoqxl54EBCMFDjGkHeMKUoG70CYnw8ZqItmJCGRRFpB5lT2prswuWYwu3UfzDdNswGcwBXUQbKr+sCjminNTm5zeLAmuRAIznnqLuJ8qJFqpGFvqCqcsdxvuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748937296; c=relaxed/simple;
	bh=z5+m8V0Ms3AUop1fmCfOASFxTcdyt+T6iFmUnrF4Dh0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HiDcFMERpNDnRhonli8e5GR/MDCrNZZHFUw//SaBE7crCzOWeQthImWpmMGRf27C+m7252zqDLEMxGlYbhJ8TnE4jK66F9iklvsRAHykplT6oLMFr7XRRisTbol6W8NGQqhIl9jq9GPYEPR5E/tkNKY7UVg0J4gkKgA+O4iYy58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 3 Jun
 2025 15:54:50 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 3 Jun 2025 15:54:50 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<jammy_huang@aspeedtech.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/2] ASPEED: Add mailbox driver for AST2700 series
Date: Tue, 3 Jun 2025 15:54:48 +0800
Message-ID: <20250603075450.133604-1-jammy_huang@aspeedtech.com>
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

Jammy Huang (2):
  dt-bindings: mailbox: Add ASPEED AST2700 series SoC
  mailbox: aspeed: add mailbox driver for AST27XX series SoC

 .../mailbox/aspeed,ast2700-mailbox.yaml       |  61 +++++
 drivers/mailbox/Kconfig                       |   8 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/ast2700-mailbox.c             | 226 ++++++++++++++++++
 4 files changed, 297 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.yaml
 create mode 100644 drivers/mailbox/ast2700-mailbox.c


base-commit: 546b1c9e93c2bb8cf5ed24e0be1c86bb089b3253
-- 
2.25.1

