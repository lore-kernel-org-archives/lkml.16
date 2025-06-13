Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3403E2C08A9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749842530; cv=none; b=hw/L1mgdFdr9CglPn4/Q9VWPpLkXihJ2rLrkhWvutNO/v26syvZExzEu1UhX0M+8G4/fOVJLL51CqA/gcGgBNU6x8Ai9hVRss7eDYOHOoi/+UtagPE8wYnd+dHf1huPl0+9ak7AUI63Q9OzWnWfidVZ7WMVbuFxnj/zs12lVKIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749842530; c=relaxed/simple;
	bh=kjdeLQU96dEYYDcyMl6ECRH4RlehZZk75+Aic5a86Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=geFhS8F5kligMW1+FHY1e68h1ksTXAICJpsXEOlv8iJJR62IbC9mJtGX6vRHS0MTO0W5IyDKyY2I/uZTKwdNCdC7XXTpiJSMsX8sR9PbXnE4euHNa7zsJD6pqpJ7bKWuYlwQBP47X90h2Bu9fI8qPwtp0YYGR44dzeO08vszDO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=WQEdxli9; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="WQEdxli9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=E6Mm2OZZbDcANLdcVoLPbdCB0G9e+9yLUnHB36mTR2g=; b=WQEdxli9+XHoUl7bByr454segW
	j7YtPixs8XKBqvoC1Bd66PzaaLsN+uoJ6qfcNeQw/Cpk0rC7OEPN6ymL9ci0aIwRY8fVw2eTKr6Wb
	HjTL6l+MMuGCFJ8nd2soUHlkzXInMsIOTFtZobJnyxE3oxWrB572xxCYCLNvjFM0pe6c9rM9anJru
	WeCrGG22ej4xNYIE3t97bMFbY3iBANwOrUxBjht95/EIxAdpWIl6zqmsqYlE0SQRecEn/EpIf7Hrm
	mzsuKTekqOk8V+7JVAjUt27fnPzWSB0RQSMZzrVZ5avbmVCF4boMn8WVMPjMCTIchGlriJeFH3VyI
	RtFD9UAw==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uQ9yC-003AtJ-0R; Fri, 13 Jun 2025 21:21:44 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	Eugen Hristev <eugen.hristev@collabora.com>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH RESEND] nvme-pci: refresh visible attrs after being checked
Date: Fri, 13 Jun 2025 16:21:01 -0300
Message-ID: <20250613192102.1873918-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Eugen Hristev <eugen.hristev@collabora.com>

The sysfs attributes are registered early, but the driver does not
know whether they are needed or not at that moment.
For the cmb attributes, commit
e917a849c3fc ("nvme-pci: refresh visible attrs for cmb attributes")
solved this problem by calling `nvme_update_attrs` after mapping the cmb.
However the issue persists for the hmb attributes.
To solve the problem, moved the call to `nvme_update_attrs` after
`nvme_setup_host_mem` is called, the one that sets up the hmb, in probe
and in reset_work functions.

Fixes: e917a849c3fc ("nvme-pci: refresh visible attrs for cmb attributes")
Fixes: 86adbf0cdb9e ("nvme: simplify transport specific device attribute handling")
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
This commit was reviewed a long time ago but was never merged. This is
just a resend rebased on top of v6.16-rc1.

v1: https://lore.kernel.org/lkml/01020191b7b7adc0-bca16d06-b051-4ce2-bfee-c8038a62462f-000000@eu-west-1.amazonses.com/
---
 drivers/nvme/host/pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 8ff12e415cb5..320aaa41ec39 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -2101,8 +2101,6 @@ static void nvme_map_cmb(struct nvme_dev *dev)
 	if ((dev->cmbsz & (NVME_CMBSZ_WDS | NVME_CMBSZ_RDS)) ==
 			(NVME_CMBSZ_WDS | NVME_CMBSZ_RDS))
 		pci_p2pmem_publish(pdev, true);
-
-	nvme_update_attrs(dev);
 }
 
 static int nvme_set_host_mem(struct nvme_dev *dev, u32 bits)
@@ -3010,6 +3008,8 @@ static void nvme_reset_work(struct work_struct *work)
 	if (result < 0)
 		goto out;
 
+	nvme_update_attrs(dev);
+
 	result = nvme_setup_io_queues(dev);
 	if (result)
 		goto out;
@@ -3343,6 +3343,8 @@ static int nvme_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (result < 0)
 		goto out_disable;
 
+	nvme_update_attrs(dev);
+
 	result = nvme_setup_io_queues(dev);
 	if (result)
 		goto out_disable;
-- 
2.49.0

