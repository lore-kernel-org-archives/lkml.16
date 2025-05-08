Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939D722172A
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 11:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746705358; cv=none; b=nDpAa3nXQkdv9CdkK5QvGZJU90UJmsMaNChQ3dToVvR41RbmJq/TS0ef67xodcczyyt1Yorc0hDU7UEnB7akWRPvMXh0jPt0Jwi3KzLXjk/TQv8mM1VBKUr4P7mymsOFrL6vaTbAQq2jBTbEHCFNjmX5etuOjXgIWyyE8OQWS3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746705358; c=relaxed/simple;
	bh=lDit1oyaFcxfGkC94lOoCNGwdvxZE9qyh5oj5Gw33QM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=in8Shb3PhJHJ5+MMgzun6mpPRNbRvxifG94Okth89khQmGUck7ygMlL3R5PehCRUIuPIWis47VWCSKRtgxifdJ7n5O8fdQ7TmYhp58THubiJ5xrKitfG/bl4DeB7u/Yly+Y4wiINwMSQETSGA7j1woVQTHyUsbOKmZiOjcPFgcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMHgFSd8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMHgFSd8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E87C4CEE7;
	Thu,  8 May 2025 11:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746705358;
	bh=lDit1oyaFcxfGkC94lOoCNGwdvxZE9qyh5oj5Gw33QM=;
	h=From:Date:Subject:To:Cc:From;
	b=GMHgFSd8a3aYlAABrm6tK+X/J1Mi9f/vuCWwTXF+EiuEHzyOuPFqZqvvG16stIJxl
	 nDhFuNhaoy19U1xhoHTDpMq/jNsxSGydDbysM6672fQVPgMLi877b3m8mO27F1pYX3
	 WUOGUfOE/fAEyecnnkqeaJuxF3BqDVo6SMc8ox+eigQTu2/ke/KdoHdA9EB44tntaj
	 TXbfAFZPSK+VG7AL8K9B/rS3nerq3eHbp8Wfm2f6TqV1tcERZ6soYnGYEVbyuf8udN
	 hgS0Yz9T/KkX7yKxpY9FQYB/hAg+H6KtVW1OTgErXQbKh5aCqPcJrJGe6QSXx+o6B4
	 JuzOetiSLHfQA==
From: Daniel Wagner <wagi@kernel.org>
Date: Thu, 08 May 2025 13:55:55 +0200
Subject: [PATCH] nvme-pci: lock per namespace in nvme_poll_irqdisable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-nvme-pci-polling-v1-1-29ae900e793d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMqbHGgC/x3MQQqAIBBA0avIrBswQZKuEi0mm2qgTBQiEO+et
 HyL/wtkTsIZRlUg8SNZ7tDQdwr8QWFnlLUZjDZWW+0wPBdj9ILxPk8JO5Jznga9DLQStCwm3uT
 9l9Nc6wdj+zVMYgAAAA==
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
Keith, I hope this is okay. I picked up your patch and added your SoB. As
mentioned in the thread, this fixed the problem reported by our customer.
And yes, it is a muliti-namespace controller.
---
 drivers/nvme/host/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 2e30e9be7408cba9dbb8918f066717b3a1c24010..b07ee427c311d508a95ab730c0b875f21fe5cc43 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -1201,9 +1201,11 @@ static void nvme_poll_irqdisable(struct nvme_queue *nvmeq)
 
 	WARN_ON_ONCE(test_bit(NVMEQ_POLLED, &nvmeq->flags));
 
+	spin_lock(&nvmeq->cq_poll_lock);
 	disable_irq(pci_irq_vector(pdev, nvmeq->cq_vector));
 	nvme_poll_cq(nvmeq, NULL);
 	enable_irq(pci_irq_vector(pdev, nvmeq->cq_vector));
+	spin_unlock(&nvmeq->cq_poll_lock);
 }
 
 static int nvme_poll(struct blk_mq_hw_ctx *hctx, struct io_comp_batch *iob)

---
base-commit: 0ea9b1f7aabb8af08649048d04fa3cee44dac4ab
change-id: 20250508-nvme-pci-polling-a88ca70b7ada

Best regards,
-- 
Daniel Wagner <wagi@kernel.org>

