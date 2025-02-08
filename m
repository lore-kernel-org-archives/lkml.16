Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96F81B85D2
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 10:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739011219; cv=none; b=WbaxXPWCZSgsqACGan+AaSzVtwAC2vu1T4/yCUOeD2tfLTAw6i8nAltWaVaK5WAkGV41t5TjjHFjIujiey0ZmLEwj7t4GpdoCR7RYyuVVVxVHW7TjaL/2Ni+0+WnO+/3zpTe8dOFWs4/omfCeYMFblodffJDuy61sTtYApicqug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739011219; c=relaxed/simple;
	bh=n03AzBOBWmT08Gaw2Fpnbf95ax4MQddkTuaxTNL3zP8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bj3Bm1jrzdk1crQBGNM1woHvEPRcxjT8IAjr/Q/aAWm92ounZiP8JFuXd0eG+ldEvEHNr/KHW9Q9+qHkfIml6eojAoZBgxuJ0xARSXXiK2X98jS1moltiS3J3mDA+6AWxqXtORCgEfjeakJYrWPq1K3qEwvvhig2N+weZtb+sVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JboYmYA5; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="JboYmYA5"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f48ab13d5so42522085ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 02:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739011217; x=1739616017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQGQvZxBQgd+2Ma/k6f6Q/GLYBdp+hkg2ZeYWxhonnA=;
        b=JboYmYA56F94fUshJ0HZ2gOFmCF0Wdw5txp0sj6ReP5FGnUPHbbIalHDpoefzrGMGx
         PWgcEr3c0qxPWd6Yg6B2YtAzgNm+Hyzp96YdXvv5G6CYr0ZNAylgvxCzYCC52c2Y4aw6
         cLUYudS54DSUsSnavOD2pICevDWj5VqKO1YbhVfj9z0R5PKUEkcV6ckr4Zshq8lbswDF
         udNZgfKRPPRfb3M0lIUQWWuaU8Vesfw/mQg3GOSr4Mru8pZ73tgy0kxDFq9mspIkwcBi
         gPbVzbZMa4/wPZsKjKjCrgfkAVLsPQsVDxrZ41fJYeT9UzGlc6lxLQXbQxR3hXMGay/t
         Li3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739011217; x=1739616017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQGQvZxBQgd+2Ma/k6f6Q/GLYBdp+hkg2ZeYWxhonnA=;
        b=RjTErByeApQu3t1FGvrzUKJf+W/S5YGSmmpYDpchsa2Hz1o7yrDtUBus2klEt19M8X
         Yq8UakheVIE4TrkOGY8w0xWoSvr6z+bTSCzOsfCvro7x6f808m+bZQ+L5HCfZkfhRHzN
         wjYwa1Y8u1cOCaJM+jvVlyLqJ/taplZthaK60NajHSUageuBMdlZEFBzlNcEUwEYeqU7
         o87+4f3JLgWurNsDk+QJOD6kyPbQd3REzTMdHSMo5cJ7HMYCSjQjNxHpW96kXQD5aHIS
         O7/SpEb1ZkdMGcy4b1wCOylHVvY6K30OpFCdL/Xl0aCUSbTYypFWRXUo/MTX1H9TuRGE
         0qVg==
X-Forwarded-Encrypted: i=1; AJvYcCXSyxcyFHRlLXLX8jPJ6Gk0roDPT2pjqaO9lvNKbcgqiVwVN9YaKuwjNUuGqKmYUYR6gqhUtCk58ass2PU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcHS6eGHz8/PCMR5aEiX5UJjwbrQjQJkEHyARE6gYH7fyt2Hvs
	wsbng0YSJwTe6Gr8rVADbVwf4UvYejhLr5FWOj7P2oPojBz8WmaA8MeJLQXmDU8=
X-Gm-Gg: ASbGncutqyRXYxX4frjUvvPBcKDj35gfhO73tzStkd6h3hzCr+5lh/96kniPt+kfPR1
	z/7g5vep5BdaeXOVGKypUkSvpsep3HN3+wg+Qp1ArZOI5YYD01OFPE1YtYomxXWbEkM3e47+Z1N
	7mBD55wagWlWk0M8h9mJ+zbKDuJ3oYznKtuXAWcpPm+WvgAuP+Nr5aff8V8SdsPm9W+mILxnK0T
	fZEGZp+AQwQPBmJQwZipP3+uk8sWvHPHPA5gQhKtqwtfoQGjsqS0c5ST9OsXDRtPdAGTlkftsOc
	yBkPEiQ2/1K6Fa2zIjFmDnkQLN73UtlrjJ2n8I4DgLHGqokycg==
X-Google-Smtp-Source: AGHT+IFwKZ4ENzUKalHf5+THzKNZ277YQzoHoj85tFF8ysZVymo0KlkXTEeb4xQMHVqxLg83ynp2eA==
X-Received: by 2002:a05:6a21:918b:b0:1ea:ddd1:2fcf with SMTP id adf61e73a8af0-1ee03a22bb9mr10999850637.4.1739011217015;
        Sat, 08 Feb 2025 02:40:17 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad5460b8d4bsm216325a12.11.2025.02.08.02.40.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Feb 2025 02:40:16 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v3 2/2] perf/dwc_pcie: fix duplicate pci_dev devices
Date: Sat,  8 Feb 2025 18:40:02 +0800
Message-Id: <20250208104002.60332-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250208104002.60332-1-cuiyunhui@bytedance.com>
References: <20250208104002.60332-1-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During platform_device_register, wrongly using struct device
pci_dev as platform_data caused a kmemdup copy of pci_dev. Worse
still, accessing the duplicated device leads to list corruption as its
mutex content (e.g., list, magic) remains the same as the original.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 drivers/perf/dwc_pcie_pmu.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index 19fa2ba8dd67..4f6599e32bba 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -565,9 +565,7 @@ static int dwc_pcie_register_dev(struct pci_dev *pdev)
 	u32 sbdf;
 
 	sbdf = (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(pdev->bus->number, pdev->devfn);
-	plat_dev = platform_device_register_data(NULL, "dwc_pcie_pmu", sbdf,
-						 pdev, sizeof(*pdev));
-
+	plat_dev = platform_device_register_simple("platform_dwc_pcie", sbdf, NULL, 0);
 	if (IS_ERR(plat_dev))
 		return PTR_ERR(plat_dev);
 
@@ -616,18 +614,26 @@ static struct notifier_block dwc_pcie_pmu_nb = {
 
 static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
 {
-	struct pci_dev *pdev = plat_dev->dev.platform_data;
+	struct pci_dev *pdev;
 	struct dwc_pcie_pmu *pcie_pmu;
 	char *name;
 	u32 sbdf;
 	u16 vsec;
 	int ret;
 
+	sbdf = plat_dev->id;
+	pdev = pci_get_domain_bus_and_slot(sbdf >> 16, PCI_BUS_NUM(sbdf & 0xffff),
+					   sbdf & 0xff);
+	if (!pdev) {
+		pr_err("No pdev found for the sbdf 0x%x\n", sbdf);
+		return -ENODEV;
+	}
+
 	vsec = dwc_pcie_des_cap(pdev);
 	if (!vsec)
 		return -ENODEV;
 
-	sbdf = plat_dev->id;
+	pci_dev_put(pdev);
 	name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%x", sbdf);
 	if (!name)
 		return -ENOMEM;
@@ -642,7 +648,7 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
 	pcie_pmu->on_cpu = -1;
 	pcie_pmu->pmu = (struct pmu){
 		.name		= name,
-		.parent		= &pdev->dev,
+		.parent		= &plat_dev->dev,
 		.module		= THIS_MODULE,
 		.attr_groups	= dwc_pcie_attr_groups,
 		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
@@ -729,7 +735,7 @@ static int dwc_pcie_pmu_offline_cpu(unsigned int cpu, struct hlist_node *cpuhp_n
 
 static struct platform_driver dwc_pcie_pmu_driver = {
 	.probe = dwc_pcie_pmu_probe,
-	.driver = {.name = "dwc_pcie_pmu",},
+	.driver = {.name = "platform_dwc_pcie",},
 };
 
 static void dwc_pcie_cleanup_devices(void)
-- 
2.39.2

