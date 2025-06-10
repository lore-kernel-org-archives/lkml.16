Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B857201034
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749570068; cv=none; b=WlWcOjrM1usWjVkpE7RSPrIYi5yI72no4As0cwokOqmrfjDmB7yve7vcgR4xXWbtQsHbhb96V0ur/drdwz+V2hfy0gWV8AWtkniVLvQJJ9NMJ6MInUpb69aBHs5jSKJY7jWlBBazBugKxzV8rQxwmt7VoCfdZUMPbMu3fgJOOr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749570068; c=relaxed/simple;
	bh=zqf8GLcacnKjJ/AoCG8d54bI1CWRF1G2wwbOsQiMpZc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Bdl7zJ52LxJ1f979nzldZZ56ht8kj8c7ewFsC4PaJn0oLAOShPChPxuTFtK0FeTSwinWDPQ85WR9rZHeYh1qPBZSX+xwqCAHvFQ2v69Rv8wupYQ2S18C4c5XYg/Rx4WOfMfjzaLvbBmOPfK31VHoAxaO6thRvw2sg/e0qDFUS0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tmichalec.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j8YNwhbG; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tmichalec.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j8YNwhbG"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-ac3e0c1336dso402777666b.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749570066; x=1750174866; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hWoDsN/EY8YsDqOcW9EsViFv1XPUq7vijx49zRxtnfM=;
        b=j8YNwhbGeEj3WxkpyH8bHr3v1QZJets3yptlQAWrlF1dnOWvSnUUhjt8jtSlSSQRNm
         gD5bDjNjRqZaoSe40Nk/NhMFqa7YPlxexr0DuMmTM070iOYVToW+Yl7p9jrXAJMUvSbW
         MyRnuXiy2/LzQGDGakc3PrknfATxrmzU/fyTe6IQ6SCGXWBT7Hf0HpikVXYp/m8SwxN3
         5VimXReYRTLpcWE13wbQXpflax/99nG05bXajpcUBCtHa1pCuN8XdhdxfYGFubefNcJL
         bj2ME+n7v9NDUsrhB7JDm6tMh/aLCuXr4yJmHmvQD9NRzBHo1fU/xrbts8iteuP4+4Za
         dcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749570066; x=1750174866;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWoDsN/EY8YsDqOcW9EsViFv1XPUq7vijx49zRxtnfM=;
        b=h8PxsPXLpO6vQDorLjz1iPsjTOj1cWMGSCc2cd/DxwM3Cavf8SclI9e3OjAmeghrrF
         XlqmG0aSrCaC81p9mxxh+VJ2wExkBFoYsSY3yo6IXfNJQRp57XDDC+SU2sBBPhCV7LQH
         T86IN2VSoqGTqzUPRSFeFSkL7QtfMaGzhvObsGlDDAicBiYzG0zocEJFIDF5+gLYIccL
         nnKUMEBIbxEnryHq/NkUtCgV8qjIXJz7wd+DgVOkV/k4DkvvsGTtpy94yfgDATXwOmen
         znEsH/5U5lXZgO2KbzN7n1HRGzorVnvdv0YsEMLvWqaJciGsmGVbS9qkT3ADmvdARUex
         O1Kw==
X-Forwarded-Encrypted: i=1; AJvYcCU/mrpngZbyyjrxBYyTm4q14I97MkK4OLG+RmE7iTvdd2WtUtSQcASRmvBnHx0YXt0pREuPB1GsIAY02BQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzCXm1SXO83pSgdUmvYC1ChFQQbsoh7LdZaU2VoFG8ZkOfVd6b
	okv/x9es/6FfyaoHW/4aMuae0diUXN/lUvCOgbb99Pk9JS+18aaP2Nnn9MBitTzqV6y9dR287Kh
	Z/C/4ijFnKehgE9GA9A==
X-Google-Smtp-Source: AGHT+IFFmIF80oWRhi9QTdJwDrH/lMsXmzWSGM4rM4pruPyZM6nyadSsKNCDtHhTtcqohcsb4ljfEsyglqz50wk=
X-Received: from ejcrc18.prod.google.com ([2002:a17:907:a312:b0:ad9:a8b7:f7b9])
 (user=tmichalec job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e14:b0:ad8:a935:b90f with SMTP id a640c23a62f3a-ade1aa5c993mr1640676466b.7.1749570065883;
 Tue, 10 Jun 2025 08:41:05 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:40:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250610154058.1859812-1-tmichalec@google.com>
Subject: [PATCH] usb: typec: intel_pmc_mux: Defer probe if SCU IPC isn't present
From: Tomasz Michalec <tmichalec@google.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Konrad Adamczyk <konrada@google.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chromeos-krk-upstreaming@google.com, 
	Tomasz Michalec <tmichalec@google.com>
Content-Type: text/plain; charset="UTF-8"

If pmc_usb_probe is called before SCU IPC is registered, pmc_usb_probe
will fail.

Return -EPROBE_DEFER when pmc_usb_probe doesn't get SCU IPC device, so
the probe function can be called again after SCU IPC is initialized.

Signed-off-by: Tomasz Michalec <tmichalec@google.com>
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 65dda9183e6f..1698428654ab 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -754,7 +754,7 @@ static int pmc_usb_probe(struct platform_device *pdev)
 
 	pmc->ipc = devm_intel_scu_ipc_dev_get(&pdev->dev);
 	if (!pmc->ipc)
-		return -ENODEV;
+		return -EPROBE_DEFER;
 
 	pmc->dev = &pdev->dev;
 
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

