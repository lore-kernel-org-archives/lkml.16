Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5181A188006
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196443; cv=none; b=T4vkv/HAPu+JAc47KdOrZkLfa7CmZ7Z9BLnd2QXgzsEb1w5Qu5wX2CL1+xkr87mS4M58AWvJhJ8ZqHMp/ubHTL9ja4SsnqXuAfO2GOKSYx1YHnlP5jKkG5dhp99Tz8ID39uXHQRhFNnkDoc3rMj/FoTbuID0YOvyGCsPlFIlZuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196443; c=relaxed/simple;
	bh=E5E1BmPjEKd9c0c0GxDB+1P9MW+/Vj/8fin/Wp/T8W0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BCwx7YnM2NKRgVgMt/SibyS/UwiCF8qhDJXBqFZKVfDXfhtPqFqmWmneFlrmONxUTlK5Mtq32WS98I7x88qGDjxQYZ1drnlWlYbWm2QBY7jQLRTwTOTejeFfijBPxLYSuaxNYGzxht+BYEvklPqdGED7sgkB+eDVYxa0IL/PNhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rx4Nqzjh; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rx4Nqzjh"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3913b539aabso4012771f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 04:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744196439; x=1744801239; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dMsTxQJ4MJkThAh69c9vTEJavOMnmubT5UY82dUq9UM=;
        b=Rx4NqzjhVxUK2pgfGghu5EFAHEgZMr+INUhpcbd7iu/meSwnlPSyDBlrWG3VNWeh91
         4AtYw5Wpj1woLRm6asY0dcpCgAAmUfte4SUR31MoMfs4tOS+GdNwgCr4lDoEZ22wfHy6
         a8dykjEE+3LSLYWcHx/u+QIbvKaiPvy7PftSN9uQE17U4VpYawY5YrHnwQbbS1y91T+x
         z3g/a5W9q0qpYPQGIe9esf9s0JbVaRIiiHUmnFvbMCgcwhY+klRwA8rqeCDHT6G/5fi1
         0pKTQMoMdjXYBZ0uM2PSR76DBOST9JdEYZVjDQxTfnz07qEdL7tW0c4XhbLOwKUzS7IT
         RPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744196439; x=1744801239;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dMsTxQJ4MJkThAh69c9vTEJavOMnmubT5UY82dUq9UM=;
        b=BilmlJu27ESVpOC2yhOZKBP6nLP13TsYnsxKX+8NfTsovf8uEKEDHH9M6FlhGc70W7
         1feIq24kE1wptqXzXl6wWxS4KdT+qd07kWl7kU7dkvuN0p1fSjfTBOnPZETxkCdUJTUT
         2xjM66cUIbDqmccJFC7BRBf7FeJwBL6Fnb5jBF3LAd3ip6+VSl2sOkMIlnqZwtSPqBnb
         BGabzGWmShRH96yyZAR3BZTArOK3NBSD3cv2a9DvxLnVnfV8aHMthSDiRCj+fCxpIb4n
         a1gTxzOcz4ApFJMJ6nPOaLB3oM/rnx51EZ25fKl/DmZpiB96uP4D8I+iys74uxzQOgpp
         3a1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJbFvGsvtLjPE0hhuDKJaelQFcNGs1KdhNb47BIantwX5/4BXcJt1TCKvZmhhmimk4/o8ksYUYOLLCzq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQgLaWD4bPIBNem+F6dNa2eE8j/1puo74M9eNG0uWti45bnrDw
	qTXRV4alQBptlq6UcNpFY/oq45r8PwM2UrTobJT2Z6+81Q/j9fhE1LUTv6XYJCk=
X-Gm-Gg: ASbGncvBqYGX4OHDsBFKs8C8vhZJ1hQOgmU89ytQ41OPh7YKcf/L+rUBIhg2qr7n2Ky
	1WXGhnbc/moeL0QJQJtjqdcV2LSSenngnQlK/wf4URrfGwIuUq4CO/8lmGHC7sXe0A9KeO5T17p
	juAmO1DDY537jRTRIGN2oLARtbsCSjlaYNgVf+kCOt4oxwjFIyskTsyzvpgMH/p/N3HpITSK6iN
	SM8METLXO7Sak1bd+GIEgZ5tu1VdfCRZDxzxsePB9BUfpeTnflx638UqKBJp7W1xIFWvj8mWB0m
	NRwmy1w2nDjmVSl3+mvPcfl8101ZdQCnKt1JtfVcW4eLrA==
X-Google-Smtp-Source: AGHT+IHjGuoRPXApmr/fLNcJT+pJu0CQiZAC37N0JslksHu6yjn064Cn1Gd7YxJ1WwJwxyqUVuhsOw==
X-Received: by 2002:a05:6000:4308:b0:39d:6f2b:e74d with SMTP id ffacd0b85a97d-39d88564b64mr1742489f8f.39.1744196439615;
        Wed, 09 Apr 2025 04:00:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d89361170sm1297162f8f.2.2025.04.09.04.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 04:00:39 -0700 (PDT)
Date: Wed, 9 Apr 2025 14:00:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Raju Rangoju <Raju.Rangoju@amd.com>
Cc: Mark Brown <broonie@kernel.org>,
	Akshata MukundShetty <akshata.mukundshetty@amd.com>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] spi: spi_amd: Fix an IS_ERR() vs NULL check in probe
Message-ID: <0e0f5ede-8993-4fac-967c-51e46b095416@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_ioremap() function returns NULL on error, it doesn't
return error pointers.  Update the error checking to match.

Fixes: b644c2776652 ("spi: spi_amd: Add PCI-based driver for AMD HID2 SPI controller")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spi/spi-amd-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-amd-pci.c b/drivers/spi/spi-amd-pci.c
index e1ecab755fe9..e5faab414c17 100644
--- a/drivers/spi/spi-amd-pci.c
+++ b/drivers/spi/spi-amd-pci.c
@@ -46,8 +46,8 @@ static int amd_spi_pci_probe(struct pci_dev *pdev,
 	io_base_addr = (io_base_addr & AMD_SPI_BASE_ADDR_MASK) + AMD_HID2_PCI_BAR_OFFSET;
 	amd_spi->io_remap_addr = devm_ioremap(dev, io_base_addr, AMD_HID2_MEM_SIZE);
 
-	if (IS_ERR(amd_spi->io_remap_addr))
-		return dev_err_probe(dev, PTR_ERR(amd_spi->io_remap_addr),
+	if (!amd_spi->io_remap_addr)
+		return dev_err_probe(dev, -ENOMEM,
 				"ioremap of SPI registers failed\n");
 
 	dev_dbg(dev, "io_remap_address: %p\n", amd_spi->io_remap_addr);
-- 
2.47.2

