Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626EC25C6EF
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216424; cv=none; b=nFCC2Nji+NBufFPTexT2I71za871nlzSxev7mkNGofKQXX84NjSfNkovUdndE94Fac1+vR+Eo8P5tErwiyNfgfKuZTHGNEQzEqwRCrJdT79eCkv3fAjA9Esl563d1KYKtg2Yzs1DUTpA0bz5OCmXl5gr43KqErqjHhdiuPQ0yT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216424; c=relaxed/simple;
	bh=4m41YzXmjKupOvgxXvACISwj81PDpF3Wa8u8owr0LLQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k5S2L5Gjw+Br/LvvntJQo7mKAYaSji+02fxYUXiDGkGSbtEX5fs6ozXg7WPBP5mzj0pGZvqVqP2Cq5r4HHdcSZbfhqNcvRBMxxqZqqFTQdfvLG/ZhhN7rgAnXM+rGiaLiYlKaXjKsiQhJ6ji1sxf4kNhGz2IG65TbEmtlQWKevQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=FObrw5BQ; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="FObrw5BQ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739216416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YJ5yRhEXoyr3qFo0UosrAK3gyLR08Z9zFBUtrpqidkc=;
	b=FObrw5BQoektcwRD88CI4sswFGdzZKPAOG391abd55vqBDZJxnnDee2bVCWPpYaLHUDBks
	UAllmQ2NXPaYPQwNMIumDDSrVLmdTqCZVqKwhn3rzuJUgCU6cyuIj7LIP7weEmBvft2DG7
	VWXoxkQX32srM4IWjHs0QEtTxOwIskiJpUhgsDTya2xriGAcmIJMsbXk8IPJjTZGI0h8Uz
	K2qbj91EoW+cxbnK2zRxWFJ8isAbwb1JIMiF6jFOBX2jo94xbT2sLy49Tmh3i2+g/zLpUk
	Zc9CA5IAYO+uGA+O343unSKe6xHW3HPJnQ0Vi1I42UaWchB0U61Njcj5Ib8H2g==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH 0/5] iommu: apple-dart: Support locked DARTs
Date: Mon, 10 Feb 2025 14:39:52 -0500
Message-Id: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAhWqmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0MD3Zz85OzUFN2UxKIS3RTz1ORUA9M0Q8tECyWgjoKi1LTMCrBp0bG
 1tQCmRutuXQAAAA==
X-Change-ID: 20250210-locked-dart-d7ece05f19a8
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin <marcan@marcan.st>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202; i=alyssa@rosenzweig.io;
 h=from:subject:message-id; bh=4m41YzXmjKupOvgxXvACISwj81PDpF3Wa8u8owr0LLQ=;
 b=owEBbQKS/ZANAwAIAf7+UFoK9VgNAcsmYgBnqlYRCsvA2TKU35TcwcTeHEjZDfJWZAbzoZMTu
 mDScW8XTe6JAjMEAAEIAB0WIQRDXuCbsK8A0B2q9jj+/lBaCvVYDQUCZ6pWEQAKCRD+/lBaCvVY
 DZvkD/wNBKHL8Sj5ae3cTzcgtwP45qQujSUaDxn1qQgJsm5YqbVs7R3C4ieWiZE/eTMaGUvBG41
 zCGYUAPMHoknvwcZYAVH1Fz5i2VNgzjebqbKM6YP6ahwftq5IyApgx8kJ9xoY3L5mrqmcFmTe4R
 dhpKffn9nKce2cxh/pM5hnGom9PsLY0xytF41tMWMooEt4o+CCgW0HVtgCSLgy7Oj8zlJIfGJQj
 1IJyc6o2GgnfWAdk8SMurRfy4onuacWbrgmaw+9QRHZxQaVGpISjXR5QnmPROPvpq+Ig6xwBLti
 Aitm1g6tj1uLHNZfTvuGuj0GUFww4EwVYsjl9NI4y1MzABqxPWVn9qE/aI5SkYB16AXdpmBuVhv
 Dca0fBpPxEq7DY71fdbKkRXlzNj5YxrMxjDhK29FImvPZpBpH/I/4xGGHhqpSaxQSu3pH2xlUj+
 076kKmBWzOGCQkFY+HASbdZMUpI5e9mzPGL899jQ4pjjBVsNutF3GHeQtIztEKTuL4XivNjLLxW
 2Auqlc9wa/fmhHHbHLVsZtTyrkF1uvU0ZdxF32JBjWNK2NjuMjyRDVRR5fkR+cmhxs9MzwF4LnI
 PjZQt3YVlM4vznT39QoOx9iunn84/ib5QoA3GsR5YKyDPM/gluIu2wLVIbbGYnLL/qE4951esln
 UmyvEHb6RWXN3Zg==
X-Developer-Key: i=alyssa@rosenzweig.io; a=openpgp;
 fpr=435EE09BB0AF00D01DAAF638FEFE505A0AF5580D
X-Migadu-Flow: FLOW_OUT

Some DARTs on Apple SoCs are "locked" at boot time, meaning we cannot
write most of their configuration registers. Currently, we refuse to
probe locked DARTs and do not include any in the upstream device trees.
However, the DARTs used for the display controller are locked, so we
need to handle locked DARTs as a prerequisite for a KMS driver.

This series teaches the iommu/apple-dart driver about locked DARTs,
preparing for a future upstream display driver. It has been extensively
tested downstream with our work-in-progress display driver.

Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
---
Alyssa Rosenzweig (5):
      iommu/dart: Track if the DART is locked
      iommu/dart: Skip reset for locked DARTs
      iommu/dart: Set DMA domain for locked DARTs
      iommu/dart: Reject identity domain for locked DARTs
      iommu/dart: Assert !locked when configuring

 drivers/iommu/apple-dart.c | 47 +++++++++++++++++++++++++++++++---------------
 1 file changed, 32 insertions(+), 15 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250210-locked-dart-d7ece05f19a8

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

