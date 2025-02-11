Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970B224C690
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739298367; cv=none; b=M8p+iu7AJ/+5uiudKD9eDodaI346F860OxHQPg0uipPlde2oxI7gEXAKWvzGndxonJo06OFklpu85TnCwEL7dPPisvsXcMTWM1eBbYNkVEez7Rtbhawc0fiDXwqaZZ5qfIGmfAZ+AtlMpFviZzn1wlaGmtxOyMoh1rewvYolutg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739298367; c=relaxed/simple;
	bh=0gCZGHfdGU8//8Avd545jbaLhxjsJY7QoZdswjXKd9U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O4A9x7319VqGYnnEw7V0Fb4tpOGDgqQlm1uRllTLTgVuXp7EMYs/7SbnDgYUe4RkO7HlOwHNGV6mo6mJm/mfFSe8LpdXF1aqmo8n7KJwg8SPqL2dn1IzqsmS7qbzz28fbGcuRG8JVphAPAn88oWLYeHw2wsjPQDqctSIYF09O6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=l2XwgcrE; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="l2XwgcrE"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739298361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1AiaIP//M8WqD4dxy7fDutkXfjVTrFqsAP5JrCGoW9k=;
	b=l2XwgcrEvmmJ1ZWNybXTH+EtietGpZihBPDDaeJW6YKeYZ3JyEg8suYzPDWXcB4L2Z1LOb
	s/gA+VpQli2gp7Yxt2QZksOdvOcBFjbTb2fvya4l+Vv+aQOjjr+9+k5cPtOiavou98L2Mq
	piVTocwwAuwxjpG3Sz6/Ug/1TXVWer0WqfIogn4tt10LjoAoEenwOc8FBm6utEYEeaANBs
	R8A+3K0JY7BTtnwgMHkdRozYirf6SFU0lAbrDKBHnbDqpDny2T1cMZnD+DUp2K9MHnvBpG
	mOnnZiV4Mz1F6AsZrv53EGlhygBUZr5wlAuv7iblugB0OV6zWscMLi5wZ+fctA==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH 0/3] apple-nvme: bug and perf fixes
Date: Tue, 11 Feb 2025 13:25:56 -0500
Message-Id: <20250211-nvme-fixes-v1-0-6958b3aa49fe@rosenzweig.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADSWq2cC/x2LQQqAIBAAvyJ7bkG3PNhXokPYWnvIQkEC8e9Jx
 2FmKmROwhlmVSFxkSx37GAGBf7c4sEoe2cgTVaTMRjLxRjk5Yzk/KSdJ2vHAH14Ev+i98va2gc
 xJRZhXAAAAA==
X-Change-ID: 20250211-nvme-fixes-29c409c2553f
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028; i=alyssa@rosenzweig.io;
 h=from:subject:message-id; bh=0gCZGHfdGU8//8Avd545jbaLhxjsJY7QoZdswjXKd9U=;
 b=owEBbQKS/ZANAwAIAf7+UFoK9VgNAcsmYgBnq5Y3Bvk569yv+q2HP9FrS/HTrAyd5yOIbC2m8
 F8dvl+ikM+JAjMEAAEIAB0WIQRDXuCbsK8A0B2q9jj+/lBaCvVYDQUCZ6uWNwAKCRD+/lBaCvVY
 DXtVEACHXlU9HvWPNeRFrQx56yTXHAmyS65cSe9sGDD2aZ3id4sg4mUfVrMCIADNXrniTC9ikhU
 DPx6dGns77YE8Jbp/EGsfju+3smsarCaaBHKgqZrKZNe0ZqMa3J+3hVp70sSL2TSwlZayl0uA8U
 joelBYnFTtsJy/0RXRFQpHXl66ipJEXnUg4EA6eb4yfrHuwNL4Ujcd1cs8kKxKdU9ZgiNIWgp2F
 eZXHv/MViEAG6/Ev7StkmVeKq09GcK1VQ7dDGd014s8t48L2ib3OQIomsk1UP8IJOkP0KtxtzDh
 +SEs9dmlee4rdwd076gLlLqDgdrPeA9vLyfPWKVs9ewUCM9zse6cxMYL2gCiMYEmrZBMPNPjjp0
 54r9mwDgaQK43Ws1ecjdivftoKBPqHcY6K7Y5dloDdQy7eIKp98dKmUbhrrfOgPloBVwY+6uySB
 QHJhCLvzaks9Rhiw3jPV422KnJUjo3PY6kkTFjdtyqByoZfRd6J+Mrf92MAAHrQSoLlIMJa3HwV
 RZRe1SXYDKQhb73L++J4dxU62ZsydgXJApThOaZm6UGJLHeadjT5iN8eI7LJcWuUOi6CtiaFRhU
 D41qjUFBPzw12RGREkoKYpx41lm7a0YeNmD4bBT/k1BzK2PjCp+Q3jiB9OcBxe9bV8s2dsRalpP
 U5mfwOU7wFHSn8Q==
X-Developer-Key: i=alyssa@rosenzweig.io; a=openpgp;
 fpr=435EE09BB0AF00D01DAAF638FEFE505A0AF5580D
X-Migadu-Flow: FLOW_OUT

This small series fixes three unrelated issues with the Apple NVMe
driver.

* fix NVMe on firmware/machine
* fix a power domain leak
* fix pathological driver performance with random writes

The first two are strict bug fixes, the last is technically an
optimization but given the measured 200x performance difference I do
consider to be a fix ;-)

Given the early stage of mainlining for these SoCs, none of this needs
to be backported.

Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
---
Hector Martin (2):
      apple-nvme: Support coprocessors left idle
      apple-nvme: Release power domains when probe fails

Jens Axboe (1):
      apple-nvme: defer cache flushes by a specified amount

 drivers/nvme/host/apple.c | 124 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 107 insertions(+), 17 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250211-nvme-fixes-29c409c2553f

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

