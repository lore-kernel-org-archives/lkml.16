Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E79213E96
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 03:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738725283; cv=none; b=SoE5j56BwXEt+HUg3MG4EBQYSbQfVBgBxJLcz3D4PQHTLu+us8m4POVrQJY2TWpN//yx+eqGPwd+BMASWo9ssx5qaU2KN9AGSn3bFlWtQfvlF4M+Cn7jeoZXnAgu4A92JKkxwUivkMT3gsRyjz2X/JwMEUvA0SSKPeD83965DQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738725283; c=relaxed/simple;
	bh=OWJ+dxuESJLZbNTfU4WjF5Z6hiXP0zYAAk3az25e/Co=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I8NNoBmb4wMNUHnuL17ZPPGXFHJBsi3sP14QuVwudCbNE8dEg24jzKsutab5lZh1Rj6Oj1frCl56u7/Pq1mEZCwTpR8Kh5G4Itgjae/gzEANEgEHAhWvdDTp+E92rK4AzpqcUMdUv3tBi7g4k5reMAcaJVB4UcOep7fLoR2BdiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=D6mVAoP2; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="D6mVAoP2"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so677011a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 19:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738725281; x=1739330081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6rgULuGtXE32btbLFBjKmAy8JieCa+OnfxHI6tl0SM=;
        b=D6mVAoP2mN3OUwGIB1Rsbzb0X/laPF54q+YzVgjy83VTzdIu6J3RRSV0kUkpluFS03
         j8Zov2xJpJqHr+lpanDAAbLNI7T2lxJPjzv9jn1VRFOCnxADjORrnN35iJSqgIR0BOWk
         7H6wFtVnZuADgjyDNgeykWev743By/+S7fPK+RgMBSGE8kAJ2CVAAh4sH9OkK4Kv4Crh
         O4WBfOagF2ukfiGONnxE7ClQ/LApmq3j4IEhAuQfAY/MlwnsrW1cTb/cFrhDVh4ONCO4
         dcmaAuvu7/kOeXglmnb3BUWO0IhdqlkcxhbXTPmpDgUiYunvgCw3i1wDZAEz52EuEHjO
         xpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738725281; x=1739330081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A6rgULuGtXE32btbLFBjKmAy8JieCa+OnfxHI6tl0SM=;
        b=Ymnb2bjfuL4tF1fXaxdI5PvhBbs/fwjHaBcgR75/FNU3+gVFI8Kc6GnlCGPZDwzwbZ
         EbAMgYOzCeFU8R6QpIBlG3W2kALV4xo+3dSbYDRre83JoufSWCdDa9mwXvmZYbIycw3M
         x9EQY9NeLnrP5G4G0XGcPwnQdnxWnmT8ef83iC+g5y+aD7mLzdrEJZowCnYtlRtmpbZ5
         dcpq0jU93Z7nY+HHGWE2qN9bqAPmKXRzVbZ/6gG09PlFCqb8iFHb89ZghPEMMwx915+u
         QT/r7yqHh8DekLH+ya+OR8Hh0nUkGl+xpB0bzXKFYF6XD7Ds5M/L5xXDwtmaBD6HCmO6
         Z4ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkpqTEkcm7r0DZXdZBNlAg3WTRldJCmx8qmJ2A/ssa8zWY09OVuTaV+xIESynWGgZgg1wip5TRoFB+Z/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJyVRmRVqr8W6VQew2WnL8m8qWxwPNcG9d0kz3RlUk971/indx
	ct86JTYRNqSby29p9qTXveaGVKzr1s6O4FEh5wAfbJzf7Rl8aLkHFNH22i9nNfU=
X-Gm-Gg: ASbGncuOAI1nta+TbOrGpp+FMRRZpQQbP+sAWCnm6wHkSwDC07kz+0venR/kCLm7Qml
	iH1acoESwC2JU3WK7mRmVcefB45VGGOpyw/yp4RRDh3QAw5Ao5zWE9wptblfXWgRLXqnhNO0H7e
	/LFk4cK0g1MYMgo1ZT99/QsVJ8UpVUiLWQwwY3CAYGcAN9pjtNwfoIBTuGW8zbQoBtrR7yAMv2p
	ENqNjur63E2gYi5XOGG41N0Vp0+2GybkF8//+4hYNwIN+pVFaSL43Z7b7P+HTMs99Zd5kGJPG9x
	NOnUBF3VI9JhEYDMseR2MxqwgeSQVTvkeLd8Ln4/XpeLbDWQ5A==
X-Google-Smtp-Source: AGHT+IEgWoIyo+md6WjJjQsXcbOKmrxi/N2/4YdNia+eqfR9OqZiWotZNEXqD46THuMV2yKqlqjrYw==
X-Received: by 2002:a17:90b:1954:b0:2f6:e47c:1750 with SMTP id 98e67ed59e1d1-2f9dff6c294mr2267628a91.13.1738725281126;
        Tue, 04 Feb 2025 19:14:41 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de330342asm103509115ad.193.2025.02.04.19.14.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Feb 2025 19:14:40 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 1/2] perf/dwc_pcie: fix the incorrect reference count
Date: Wed,  5 Feb 2025 11:14:24 +0800
Message-Id: <20250205031425.67265-2-cuiyunhui@bytedance.com>
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

for_each_pci_dev increments pdev refcount. Call pci_dev_put after access
to decrement it.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 drivers/perf/dwc_pcie_pmu.c | 42 ++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index cccecae9823f..4ac53167d7ab 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -553,6 +553,7 @@ static u16 dwc_pcie_des_cap(struct pci_dev *pdev)
 
 static void dwc_pcie_unregister_dev(struct dwc_pcie_dev_info *dev_info)
 {
+	pci_dev_put(dev_info->pdev);
 	platform_device_unregister(dev_info->plat_dev);
 	list_del(&dev_info->dev_node);
 	kfree(dev_info);
@@ -572,8 +573,10 @@ static int dwc_pcie_register_dev(struct pci_dev *pdev)
 		return PTR_ERR(plat_dev);
 
 	dev_info = kzalloc(sizeof(*dev_info), GFP_KERNEL);
-	if (!dev_info)
+	if (!dev_info) {
+		platform_device_unregister(plat_dev);
 		return -ENOMEM;
+	}
 
 	/* Cache platform device to handle pci device hotplug */
 	dev_info->plat_dev = plat_dev;
@@ -594,8 +597,11 @@ static int dwc_pcie_pmu_notifier(struct notifier_block *nb,
 	case BUS_NOTIFY_ADD_DEVICE:
 		if (!dwc_pcie_des_cap(pdev))
 			return NOTIFY_DONE;
-		if (dwc_pcie_register_dev(pdev))
+		pci_dev_get(pdev);
+		if (dwc_pcie_register_dev(pdev)) {
+			pci_dev_put(pdev);
 			return NOTIFY_BAD;
+		}
 		break;
 	case BUS_NOTIFY_DEL_DEVICE:
 		dev_info = dwc_pcie_find_dev_info(pdev);
@@ -730,20 +736,29 @@ static struct platform_driver dwc_pcie_pmu_driver = {
 	.driver = {.name = "dwc_pcie_pmu",},
 };
 
+static void dwc_pcie_cleanup_devices(void)
+{
+	struct dwc_pcie_dev_info *dev_info, *tmp;
+
+	list_for_each_entry_safe(dev_info, tmp, &dwc_pcie_dev_info_head, dev_node) {
+		dwc_pcie_unregister_dev(dev_info);
+	}
+}
+
 static int __init dwc_pcie_pmu_init(void)
 {
 	struct pci_dev *pdev = NULL;
 	int ret;
 
 	for_each_pci_dev(pdev) {
-		if (!dwc_pcie_des_cap(pdev))
+		if (!dwc_pcie_des_cap(pdev)) {
+			pci_dev_put(pdev);
 			continue;
+		}
 
 		ret = dwc_pcie_register_dev(pdev);
-		if (ret) {
-			pci_dev_put(pdev);
-			return ret;
-		}
+		if (ret)
+			goto err_cleanup;
 	}
 
 	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
@@ -751,24 +766,27 @@ static int __init dwc_pcie_pmu_init(void)
 				      dwc_pcie_pmu_online_cpu,
 				      dwc_pcie_pmu_offline_cpu);
 	if (ret < 0)
-		return ret;
+		goto err_cleanup;
 
 	dwc_pcie_pmu_hp_state = ret;
 
 	ret = platform_driver_register(&dwc_pcie_pmu_driver);
 	if (ret)
-		goto platform_driver_register_err;
+		goto err_remove_cpuhp;
 
 	ret = bus_register_notifier(&pci_bus_type, &dwc_pcie_pmu_nb);
 	if (ret)
-		goto platform_driver_register_err;
+		goto err_unregister_driver;
 	notify = true;
 
 	return 0;
 
-platform_driver_register_err:
+err_unregister_driver:
+	platform_driver_unregister(&dwc_pcie_pmu_driver);
+err_remove_cpuhp:
 	cpuhp_remove_multi_state(dwc_pcie_pmu_hp_state);
-
+err_cleanup:
+	dwc_pcie_cleanup_devices();
 	return ret;
 }
 
-- 
2.39.2

