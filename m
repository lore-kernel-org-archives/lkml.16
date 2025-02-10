Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2383C25C712
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216429; cv=none; b=oT0uCDIJ6syixiowRGZpxNy5It8TeNZuczTCP4ZDivp8N82YogpVNkF1zbsKsA5RHMx8PYnICwuK8QWi/CZwHfh0UFVgxfS22ID+aPyI+TydXZpCyfvX23zoCCPcmGpteMN/f8oSU2pYeWym9BhxlgGhUurEfozycC/zk0pKF+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216429; c=relaxed/simple;
	bh=vfY3Ml+fLw1XdmnLqUIQmLLEE3BWPKNL9c3pG0gr//M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ANkDMQyS96dFgn2oC6nsxeUQ287uusZ2//1GqwWsESVv9PSUOZYdlZtAtowp25u4nKVxkGl7XaWGjlPTN4Qvd+imc1nDFcGICOMh7qgoVAy3wXQGiYumEzGiwYVf5CXUxrJ/SVGG+2CKMIeAhxoCFi8p+eDbJZbUpVaW9n5TV7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=YP6oko9y; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="YP6oko9y"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739216425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fjtngZOALj0IdzC20tSSm4wP6kwl37jWj1bmM1dPR3M=;
	b=YP6oko9ydeGKDbCUXgUWDwZx7AmLeQHdkfPPiX0YgmxNqrGYhqcaz16AyITxVHYxiPRlDd
	mWzZ7zimIZuEzTq8TDoZcSIU17UGviFlmVa07thtRUEHeLayJI5Jz5t0sTASdLbc3PLS0r
	nMxuy6Ygqq3pi/c8mE5yzYDutR/en9KdJy/Zy0g4LowvqEEzgAt1f5mU/5KoY1LJKGn4mm
	7gDC7Gvb/xYrwa0QdJZufBcHz6mhrDI/21uLeDyZuxcX7sJO+t/p+ENgXGRNYi6p0dARAg
	Y22uBXJpWc/XwZfKIPQkdwlHxKpGXfqiO0O3d5s+dggAE776izoT0+XwH5tP0Q==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Date: Mon, 10 Feb 2025 14:39:55 -0500
Subject: [PATCH 3/5] iommu/dart: Set DMA domain for locked DARTs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-locked-dart-v1-3-5d97fe247f35@rosenzweig.io>
References: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
In-Reply-To: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
X-Developer-Signature: v=1; a=openpgp-sha256; l=688; i=alyssa@rosenzweig.io;
 h=from:subject:message-id; bh=vfY3Ml+fLw1XdmnLqUIQmLLEE3BWPKNL9c3pG0gr//M=;
 b=owEBbQKS/ZANAwAIAf7+UFoK9VgNAcsmYgBnqlYZaLYJk9YI39mlAZ7tjhDRbEXzpCnX3HelN
 hhl52qjIAWJAjMEAAEIAB0WIQRDXuCbsK8A0B2q9jj+/lBaCvVYDQUCZ6pWGQAKCRD+/lBaCvVY
 DQTKD/90hufX4dDRXOyWEiQmFI/VWv/5QX3qjHE7OWRfK5qgiPC5/291LA6X0ncH8GkjUPvV26O
 EQRBjaKcB4ej74zuhj/haSG8A+jR3JtYIlzwq4PQ0zcFVjQDCSA9KD5Pt9lZrrvKfCOv2jdlVd+
 el3H4KQ3d0VqveZcUjfQF5iqWFakbituKGIhVCIdKWThMh+gh+rf6An8U+aPx6LFc4nvizzKMGu
 Lnp4SX/ZTEODdKwWzeG4VnbtRt5yOlvpA3jeWgFPre1K+SJNL8O1hbXkjtX4QEQyGMEt3cbmk3K
 xzjQkofbN2ljTPKrgBPcMQKnqGmBr5uM4aTUkHou4m/mkx24VAUrlWZf3+kM+wU6v4iE17mmxf0
 /DkHDg+QIKnqFtbfBSqYn+dNGUR+a4UE3t0lktQu0VRd6efUrd06sAwoUs91QcQviVYaRmHAzSL
 Ch82dZ/XLzlPC14r0hnmjaPmnFDlKXw1z9z68Pxpnbz1w0RPwI0nyhCgCwffvxBsr5xpij94Rj7
 Ot+9UAEgQXk7Q5g4rTckNe/A+nRr1GZmOERATyyZFI4wehp9rYB8t3mZgbaFJ7E3bfXIlGDr7rP
 I+QCjuC2ov+yTcJ+ZPLi42kCmMGb0G/9pPn59Z8JNaI3SLY1cFcxpcXLQj4HSSLcXWmMQWhi7hC
 lDZ3xcY606Wx95Q==
X-Developer-Key: i=alyssa@rosenzweig.io; a=openpgp;
 fpr=435EE09BB0AF00D01DAAF638FEFE505A0AF5580D
X-Migadu-Flow: FLOW_OUT

This is required.

Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
---
 drivers/iommu/apple-dart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 9c74a95eb7e819e94ab2fb47ed0d411a1eba8bf7..9c6f780dc7220096ed6bba692fa1a4bd859b0d61 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -941,6 +941,8 @@ static int apple_dart_def_domain_type(struct device *dev)
 		return IOMMU_DOMAIN_IDENTITY;
 	if (!cfg->stream_maps[0].dart->supports_bypass)
 		return IOMMU_DOMAIN_DMA;
+	if (cfg->stream_maps[0].dart->locked)
+		return IOMMU_DOMAIN_DMA;
 
 	return 0;
 }

-- 
2.48.1

