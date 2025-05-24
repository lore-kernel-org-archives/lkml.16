Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26931F03EF
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 18:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748112800; cv=none; b=RfOhja4ieFEHNYabKb5VhPJRzSocxjBRHR/jbQRnn1ZymMt6I8MqZ3g5yylOZZJ0hhiK/j3wI9y+rO78IGq83ALkDUnScs5c5ZN/CI0AI9caMTeuoqV0V9WKe67FohzoTnKi4iCNENwhVDmrr57AzkHRuwxNv34e/q8waFrQ3/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748112800; c=relaxed/simple;
	bh=kPBTZmljEuhDGk2ErBFVwmGtLoHH2MQuuDrbHZOdfIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LT3NSHOOMVaYvd75BVk53/XLA2wcK54q+hqHdA/6bQMZB++0VLJxG8jpHByKbgZ4+UrydxEemp8kENt/oWHjM4z/IcRvQbERL/E6WRCC32+22ksG6+Pgz1cEX+EX6uRx7fP3xgIL+wh6OQ8U3xxSPWiY1pqa2HbZKz0XWp9uf0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HAIp/99g; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HAIp/99g"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-742b0840d98so653276b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 11:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748112798; x=1748717598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFpWtTUVCy45y8KpE1YWlnoXsJZ2GgrsFpHF1cJftMU=;
        b=HAIp/99g93tCpbJR2dJO0wtLChCE6pfYOY5wZyUdbFFQe6ZUcnrXeFc5M7cdVznDNB
         tUueMV8I0fBIQaTDlWIPkmUQEmb/srRfPVgiWra1b2jbSx1Z8wPfQNbYNCV5v+le2+RL
         4bHLuiNdnYqSFXpNVW9Etk744lrV1rFFtazJYaz4cTER0bMPvTfzGBFLXUEOIqAtMLmi
         YMcXh/EPNbluR6ExVdi2ZPM5kCaKeYLpUTPvYwo99CAWcrbvuV+NbIpIjMtI9js463FI
         OxTms1fmG12RWl2m3M/Jp2GoDLjqT2nkpWEZOlZFhcT/TMKbZ8mYTxs0f/CnEAUN3hsb
         3iUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748112798; x=1748717598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFpWtTUVCy45y8KpE1YWlnoXsJZ2GgrsFpHF1cJftMU=;
        b=FHx8Bv8sCqpMrICJ0IHq7iWI2+Xw7VWy0j9YRdskTr8tBGCo1VLhJ6ZRhMPg+Mat1G
         XXGGN45vQY3xBJ2ZoM9+/eVfi0HMqhxrmDmHSxv2G9bcItm3Y9p9clvnr6+Mm0cxHiNK
         +mPfgzouSEOVmfYHwQGC8EOlMWbeS+PImprj/3L0Pu+jqUbHqKsX+MzxkTpUia4qaldb
         d+rcfNWiNdDfs1gR8KvVhEaSnDBYf70V2xR/8WP+8aqZTUHO+BiPuBnSQDUlekM9TTJC
         Z4FvA/NprCiZKFUabH8OYRkJ94JSNtWLGqIo05j52Eh0t096xUdDR/S3J3pXd7gBb8cv
         DikQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6b2curzhIRR+niyZiQEkKrHx5U57sWk/YYD4E9SWIk3HnVxSRysOi9RSvcm7zZLK+N29AjMjhvfNWqVs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz77lyzyesRW+SdNqWLRReZ6JiB08WSbyysJJh3Z7eSZ+wnvEp
	yKgwE1Eb0rZEQYvdcEvW9cX2WmrRRz2ehLmRNv6K+N9TmnECPXoNkUp4PoMctMM6nA==
X-Gm-Gg: ASbGncsgv9pSS9VA0cWOOry4SRp6MD4r1nLDqAqu+fkekD2TwDzxPZwhOStCqGNv2Q9
	EOR1BHcTjogO98H1uWijk/g1zpQKGM/QV30H2Laf6PqIemQPkrMkBOFrr99zwdTk+b4M6rDSPVF
	Ls9JXPqoKoaaFeJqUR7kpFiRyarl3inE3ymOUuWNCxp3zvq1YTCDqVOqhnbnDNXx95vDJOvdbCR
	qkX7RApGI63QTRS4gJkyGiqy1E2p/UlXqpBDsoiT5c1ZJ9LIBMG0/CQlTFlNN/O+X01BxVCOFgi
	CyDtcGTEQ1m28jf1LQhjaZbX6ZmVm1FDoom+Z0T0qcQX9W75nlHYjx6YckOQ7SMR
X-Google-Smtp-Source: AGHT+IFTaPyM14w9Q4zemsGbNZMO1mPe5g7dLj3PlVCsB7p2Kh20T9kEekBWHuXLHjAU931mjogyhA==
X-Received: by 2002:a05:6a21:9208:b0:1f5:7ba7:69d8 with SMTP id adf61e73a8af0-2188c259141mr6240048637.15.1748112798039;
        Sat, 24 May 2025 11:53:18 -0700 (PDT)
Received: from thinkpad.. ([120.56.192.43])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb0a906bsm14532931a12.71.2025.05.24.11.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 11:53:17 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cassel@kernel.org,
	wilfred.mallawa@wdc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 1/2] PCI: Save and restore root port config space in pcibios_reset_secondary_bus()
Date: Sun, 25 May 2025 00:23:03 +0530
Message-ID: <20250524185304.26698-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250524185304.26698-1-manivannan.sadhasivam@linaro.org>
References: <20250524185304.26698-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

host_bridge::reset_slot() is supposed to reset the PCI root port/slot. Once
that happens, the config space content would be lost. This was reported by
Niklas on the dw-rockchip based platform where the MPS setting of the root
port was lost after the host_bridge::reset_slot() callback. Hence, save the
config space before calling the host_bridge::reset_slot() callback and
restore it afterwards.

While at it, make sure that the callback is only called for root ports by
checking if the bridge is behind the root bus.

Fixes: d5c1e1c25b37 ("PCI/ERR: Add support for resetting the slots in a platform specific way")
Reported-by: Niklas Cassel <cassel@kernel.org>
Closes: https://lore.kernel.org/linux-pci/aC9OrPAfpzB_A4K2@ryzen
Suggested-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/pci.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 4d396bbab4a8..6d6e9ce2bbcc 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4985,10 +4985,19 @@ void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
 	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
 	int ret;
 
-	if (host->reset_slot) {
+	if (pci_is_root_bus(dev->bus) && host->reset_slot) {
+		/*
+		 * Save the config space of the root port before doing the
+		 * reset, since the state could be lost. The device state
+		 * should've been saved by the caller.
+		 */
+		pci_save_state(dev);
 		ret = host->reset_slot(host, dev);
 		if (ret)
 			pci_err(dev, "failed to reset slot: %d\n", ret);
+		else
+			/* Now restore it on success */
+			pci_restore_state(dev);
 
 		return;
 	}
-- 
2.43.0

