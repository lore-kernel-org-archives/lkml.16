Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3581A1FBCB0
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 05:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747202272; cv=none; b=azab8LwjG4okVNePA0LVBaPgLekzsL5mZH2EKwoEyX1IxfEHBAAiVO2jQtlcSCGFvLLdkIRfquOHd27HiVgg4ymUBBrQ3e/jhhJxzeBEnwKmRTdHD2g+vWrmwt07Y01Y3o1QwcZ26dTzTz4xDkTjm2NIVFHnVnyOFLGL7rmI9EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747202272; c=relaxed/simple;
	bh=j10W9ERtTCLuRtXkzV2FgTmpZyoQoyxJASYgwPYwbms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z3ZOtZ9dDAtRKzWiJ9k7J8JwSJb1On4/jpSKFKTwrPtif4tc4ZfwU47WIEO89LKUgalzVRu0u/M3skH0FGJVZJ1FHSpY4+Bxsu7GreD8QeYVNGRLK3KQSiB7EZawjy96DsUEJ1bv7brT+C4a9voBnExVRw7pjesunHjgzaHlKQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=acS4zCvn; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="acS4zCvn"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-879d2e419b9so5884373a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 22:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747202270; x=1747807070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnkjvbjcuENvVJ26saTSRizx+WjEaICu8Lhi+aJlcF8=;
        b=acS4zCvnlH0ZhS+mvxsQX3lGvU0SupI9o/3bFSXPS7s2zfMB+TKAsfsgHcaQCgersX
         iWsZMTNiGQtAVPbdoeC77/jKOB5puwghTYa9VRfTdl0WPahbA/ahAW3nfpWwUsHJH5xM
         9hF0sCXL9oK2ObwGsCgDtTw7Hv4d0QYhTJLb9Ym5z8CtCC+aWhFUppGkzjkkIKC4gAcH
         sPRIH1cJf/+FeCDay+dSWrZTiNd1mjdENp6+JA3NXvk7ZQMN0K/BlFR9RFB+3Xq+Hoyo
         8mt/a9PTHkYvV0nTU6cRPUvQ1BNA0AD/L3+SjqADEZlNwTqwMJX0gs67dZ0g2MiMzc30
         FEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747202270; x=1747807070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AnkjvbjcuENvVJ26saTSRizx+WjEaICu8Lhi+aJlcF8=;
        b=f2bbsa75uQCOB8AN+Ocxdma7NKPgr83xfPTgxsTxxEI9Cv2ZrfysRWtcfrs+OPW6DF
         miW4bkVCakjBj1FrXDrboQ42ae6wUvv8W5yusWvytymVQ+FRU4wUeedTzxAOqWcRLnE0
         UbXZAHQi1VqdQ6B++XLIwvJdn8+XOzWJ2btqGDJ/zA3ZEibc2txTDp35NmBrZmbekdIu
         +Aw2xegrEMnN1xcwiwXENAhirnlm7OfAVvfbHyvDdcvI5wkrfDLRswDXoeHZCUhL4LLA
         rPXirZLyeKeoUCYEyuBpF9NE528dWRGfvzaweBUQVDfqiG8+sPpSgVthu49t9OpZkCBt
         MExA==
X-Gm-Message-State: AOJu0YztRm5m4J3Qq6we3Z5Eq3i6z5sCjRb0hRIDQ5tU0JkJkjX8mOD7
	ATOVeie7VsIfKCBo8SeuAVBECcILGemNFN/uFqojszz5amRES/RqQumCR25SVnu9Wwa6BT7+Srd
	N6cA=
X-Gm-Gg: ASbGnct+INyRkeBZpcvhjEV48H1HT5oj/AOKVAXijl6fgy822DnUGNw1BkeuvFOV13t
	DcEwJx1GtKwVrIE6xmFTRwtXtrDZid3cO6EVssIOmCiAIx8cOFOx4eI+dBjiK/oUyyf5dAwYILW
	TVH1fv48wVkmyo+wVQJiv3p/Rxa0LfHn7zDz07/RbaAoWXch2iw5tr7F9E7ApGtZ8GDSt5Qt76T
	cf8G9gFKp0gbnNDJArNh2CttQCfBPy3mWa/5L70YV5oQKbZpKrV/JbFW/BFTKSmR6R9MUJwxi/h
	5W8yfn4hLM9EsCcqtmJFfP0z0y0ynePOEc1+fARorRCz7RrL6tBDt9jYBqe0jQ==
X-Google-Smtp-Source: AGHT+IGOnxIH4YjGEW5GtZaYNs+W/C6hB2R8AaG0BsyNWrPx0B0lajN6mf6PqMko8vPxUuZYiIe5uA==
X-Received: by 2002:a17:903:3ba3:b0:223:3396:15e8 with SMTP id d9443c01a7336-2319810114emr33089565ad.22.1747202270073;
        Tue, 13 May 2025 22:57:50 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.196.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271c2dsm91721615ad.135.2025.05.13.22.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 22:57:49 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev,
	acpica-devel@lists.linux.dev
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 3/4] ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
Date: Wed, 14 May 2025 11:27:22 +0530
Message-ID: <20250514055723.1328557-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514055723.1328557-1-sunilvl@ventanamicro.com>
References: <20250514055723.1328557-1-sunilvl@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

acpi_iommu_configure_id() currently supports only IORT (ARM) and VIOT.
Add support for RISC-V as well.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/scan.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index fb1fe9f3b1a3..70f57d58fd61 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/acpi.h>
 #include <linux/acpi_iort.h>
+#include <linux/acpi_rimt.h>
 #include <linux/acpi_viot.h>
 #include <linux/iommu.h>
 #include <linux/signal.h>
@@ -1628,8 +1629,12 @@ static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
 	}
 
 	err = iort_iommu_configure_id(dev, id_in);
-	if (err && err != -EPROBE_DEFER)
-		err = viot_iommu_configure(dev);
+	if (err && err != -EPROBE_DEFER) {
+		err = rimt_iommu_configure_id(dev, id_in);
+		if (err && err != -EPROBE_DEFER)
+			err = viot_iommu_configure(dev);
+	}
+
 	mutex_unlock(&iommu_probe_device_lock);
 
 	return err;
-- 
2.43.0

