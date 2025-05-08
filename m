Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E502741CB
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716230; cv=none; b=sNfPrAORdfDhtCdTd+RRmKKzM1YYd+Tu1DNgiQn2OGUFrzFjXufQ0aU+PklekHwXMLSEQFs4+2wiDQFQBxcxQY6CV9iYkKMA4hgOOciPI4RZQluARXNC+7bV/jPtqSwHvzruJyRIOCafAqxl09Yb9LX0Gnqd2P+S2jeKZR3fqMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716230; c=relaxed/simple;
	bh=u6YIWCcbD2cIB6QfQaeiHH3AqkjJXoUcIqRzbWkTC0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ft8jUE3HEAwPKtzedze2Rak1Pn+IPnh9bCfPJP+2NMmfPBzO4U0gjRYZLsH82eBdV3wlWCeaf85GrMTJvOnSyyPEeRPbSEWzPGF0lgUx9aRoP/E4zL8/NyxegI+6tW5XNysvS5ZdPvHAStAGlxbUK8WXvOBGp6t1P04wRNpr/9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3JeHbA7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3JeHbA7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC62C4CEE7;
	Thu,  8 May 2025 14:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746716230;
	bh=u6YIWCcbD2cIB6QfQaeiHH3AqkjJXoUcIqRzbWkTC0g=;
	h=From:Date:Subject:To:Cc:From;
	b=M3JeHbA7WL0AZvAuLwdhhsH9A30wuyatAY8Dj2R8jy7HrSxCP8h9tI2TscFSk963u
	 m9OhlUxtUeyfvRj7llu+WYCQlAx1305A/3dibeAXUV5ssuOK/PLKElGtp98WWHn+/7
	 ly5hYffqiRdY4IwREQ6h4/nEXYiO9+YTYdNqhBhjl6GVwliihArGVjbF0p5eTdOnRj
	 mGG5NujXfw02I2rRAlyamHqHyv/MnbUolysh3PU14zvxndRfKU67toVTX/1yZf9XdY
	 HKkFka9q4BIHYCmXmn/RSFYchE0NJ+Sozjk5eudUvNoC5JSWy8S/fCOcx1q2bxXxBL
	 p0LYaXZw7Nd7w==
From: Daniel Wagner <wagi@kernel.org>
Date: Thu, 08 May 2025 16:57:06 +0200
Subject: [PATCH v2] nvme-pci: lock per namespace in nvme_poll_irqdisable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-nvme-pci-polling-v2-1-0c7e1edad476@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEHGHGgC/32NQQ7CIBBFr9LM2jEU0wCuvIfpAulIJ1YgYIim6
 d3FHsDle8l/f4VCmanAuVshU+XCMTSQhw7cbIMn5KkxSCEHMQiNoT4Jk2NMcVk4eLRaO6vETdn
 JQpulTHd+78nr2Hjm8or5sz/U/mf/xGqPPUpjyQhBypymy4NyoOUYs4dx27YvmWYQOLEAAAA=
X-Change-ID: 20250508-nvme-pci-polling-a88ca70b7ada
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Hannes Reinecke <hare@kernel.org>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

From: Keith Busch <kbusch@kernel.org>

We need to lock this queue for that condition because the timeout work
executes per-namespace.

Reported-by: Hannes Reinecke <hare@kernel.org>
Closes: https://lore.kernel.org/all/20240902130728.1999-1-hare@kernel.org/
Fixes: a0fa9647a54e ("NVMe: add blk polling support")
Signed-off-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
Changes in v2:
- disable irq first, then take the lock
- Link to v1: https://patch.msgid.link/20250508-nvme-pci-polling-v1-1-29ae900e793d@kernel.org
---
 drivers/nvme/host/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 2e30e9be7408cba9dbb8918f066717b3a1c24010..c86af9e9211353d1713569c294899b0fde229020 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -1202,7 +1202,9 @@ static void nvme_poll_irqdisable(struct nvme_queue *nvmeq)
 	WARN_ON_ONCE(test_bit(NVMEQ_POLLED, &nvmeq->flags));
 
 	disable_irq(pci_irq_vector(pdev, nvmeq->cq_vector));
+	spin_lock(&nvmeq->cq_poll_lock);
 	nvme_poll_cq(nvmeq, NULL);
+	spin_unlock(&nvmeq->cq_poll_lock);
 	enable_irq(pci_irq_vector(pdev, nvmeq->cq_vector));
 }
 

---
base-commit: 0ea9b1f7aabb8af08649048d04fa3cee44dac4ab
change-id: 20250508-nvme-pci-polling-a88ca70b7ada

Best regards,
-- 
Daniel Wagner <wagi@kernel.org>

