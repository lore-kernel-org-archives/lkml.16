Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59966214A7F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 03:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738725288; cv=none; b=U0M2yaso+LckMeZwakiSxFi8IoLKV6Ah0iuRYMBhpht1he4oySwVEN7U2OfDo8aarE92Th3xS0wrW7GBvyr/cba61vklUoztJHS9UWD3S6hbQT4pXo/TudtJbqtVUjZcLmxPi4SYzq5cShwQUgSzxCEtDotPj8Y2ifH/dAv28L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738725288; c=relaxed/simple;
	bh=tcYOHjx42YriyQhtrWAEfCCCVv4tYquOWsL6woQR6wY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u2G5gSO7edD/sunmdf42yy1WtUoZ0fPkB1z71/jUUkQXTXKPc0FOr3/+K44O0LGuqFa1j4imCqOT5CP/ImDupnPZ4z9PL41DAszxTgtXgywdcbqaONFsGmnwdvCRymPd4I/JEHx9nuHcaZ2VUCjTEVFcTx7hl+yMmmcIO8Iq1VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=J7qQNdW2; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="J7qQNdW2"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2161eb95317so112140985ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 19:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738725285; x=1739330085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZtwwLK7UbW+7SeKV2tsQ5uK6rRg+ZSYyqZGaCPCC0I=;
        b=J7qQNdW2oC1QTNWLDZHoabNV+F5CiPZrGjPYWaEGsYoZVZpTx8yiUPTnKlOtJFwo8U
         KL0zpcOtASw4jl3+E6gI4W7YVbzRSJMjn/nnuj51Iqd+oYeQBUen1HiOKMmNvyQlkljt
         ISW88nFIkCJSBiWssVri40OlERC+W5JpzFZGHgj3PIoCXpiVcyx7osXu+rWQ5sp35J0w
         O8zr3TSoCwYyuF66VGrUQdafZS8eT1QfU69dcSkOtfGPbOTDH6ZZ95RE/S8kQ0fpxXER
         Zsqo7OrHbPoJvFZQxjnE6bGSIzDO8CLP1JiXcfVelzMuw81eJawsHBCEZNVU5YDvmx6b
         B0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738725285; x=1739330085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZtwwLK7UbW+7SeKV2tsQ5uK6rRg+ZSYyqZGaCPCC0I=;
        b=wEoBi7tj54GVlm6vpF8L4prAvlbBKWUk7k3woiYW/ETO76hNC+XXX69tZvaYjIulox
         qKmXoHdfrzlzb41LTPo7sDoLx8ibxcTMffGUPTVnlu/vt+tjkTgF+k7il88DU4y4rYmg
         vXkkMZWJvVMTGtPpxmQ8It+arYXAolyzkTQeJmU3gcbH3BPGQYjGkxtsW43nj3cK8GXq
         acWQQLf7zg3QL07LOYOd6KxSv4V4tdX6CGBYZqwuvf5uL+ksrCPKmeXqD++eyq3dkPA+
         wKfA14eOUtNcEcSfnogcGbFZ3wUbvNGQBihNUcubxQSf8LWTzGlgt3Pyj+G4b14ylL1F
         FGXA==
X-Forwarded-Encrypted: i=1; AJvYcCU//oRaX5zCz8n5iSsybTLhT6J8Z+hGroVX5hqAnKDjenVCOzYxl4H4CJBmnmofvt++D7krVeut4Ey0BIE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7fy94BO/ryOw/58jAIVQbV7yJXdP5q57iNvp29TBta8ThW4Ew
	C0dqRU0zuyuBf4KZuOITKnezkDjSYVwl9nYJ+jhNrsSP047shf0phrebvW5LFyDrYowooOHfJXE
	ILZ4=
X-Gm-Gg: ASbGncsJgm7KCmwhgwrGkk4cqe4453acFXJ9qqbNGJKHSYWO5YU2Ga3teEj2GE9XaEm
	CULWjucKEcQgYk4oqyhBNhwAyW4EM66j+CAw8XaaY1QnogFNrvubifVplwvU8Mp5s4P6c7G02dY
	1RE5Jdqso4ZHgZiabxPdRQoi8i0aHTmEFubvlU+f084HXv0ZbD21Bk52VWzmRB/GlU/y0V3mOVp
	tn82gzeRbWGib454NOFY5Dhmwimkjmk9XcyrdTgQEyPuQRPoUyTC8OwzBDAPksB675RAQJq0HYM
	h6lfzees4XRtWpgjv4GuCjkHwQncbkvYljcSBhVe/dbcegykgA==
X-Google-Smtp-Source: AGHT+IGvs9YlJSJ4IV1c8mfZKeNsIc8mGiu0UvBJnVQ8jcswFf6SnQ+8jYxvoQNAtQ8+6zh7iONi5A==
X-Received: by 2002:a17:902:ecc1:b0:205:4721:19c with SMTP id d9443c01a7336-21f17eb9bb1mr16527375ad.37.1738725285599;
        Tue, 04 Feb 2025 19:14:45 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de330342asm103509115ad.193.2025.02.04.19.14.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Feb 2025 19:14:44 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 2/2] perf/dwc_pcie: fix duplicate pci_dev devices
Date: Wed,  5 Feb 2025 11:14:25 +0800
Message-Id: <20250205031425.67265-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250205031425.67265-1-cuiyunhui@bytedance.com>
References: <20250205031425.67265-1-cuiyunhui@bytedance.com>
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
index 4ac53167d7ab..fd9d87b4f201 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -566,9 +566,7 @@ static int dwc_pcie_register_dev(struct pci_dev *pdev)
 	u32 sbdf;
 
 	sbdf = (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(pdev->bus->number, pdev->devfn);
-	plat_dev = platform_device_register_data(NULL, "dwc_pcie_pmu", sbdf,
-						 pdev, sizeof(*pdev));
-
+	plat_dev = platform_device_register_simple("platform_dwc_pcie", sbdf, NULL, 0);
 	if (IS_ERR(plat_dev))
 		return PTR_ERR(plat_dev);
 
@@ -620,18 +618,26 @@ static struct notifier_block dwc_pcie_pmu_nb = {
 
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
+		pr_err("No pdev found for the sbdf");
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
@@ -646,7 +652,7 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
 	pcie_pmu->on_cpu = -1;
 	pcie_pmu->pmu = (struct pmu){
 		.name		= name,
-		.parent		= &pdev->dev,
+		.parent		= &plat_dev->dev,
 		.module		= THIS_MODULE,
 		.attr_groups	= dwc_pcie_attr_groups,
 		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
@@ -733,7 +739,7 @@ static int dwc_pcie_pmu_offline_cpu(unsigned int cpu, struct hlist_node *cpuhp_n
 
 static struct platform_driver dwc_pcie_pmu_driver = {
 	.probe = dwc_pcie_pmu_probe,
-	.driver = {.name = "dwc_pcie_pmu",},
+	.driver = {.name = "platform_dwc_pcie",},
 };
 
 static void dwc_pcie_cleanup_devices(void)
-- 
2.39.2

