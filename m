Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335CC2376EF
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750748697; cv=none; b=YtcDaEKrpuwDJnGi5eJbyZSV35Fm1G/uub7JbUfMZLGOOMoN7Pl6F8Ho1n8WgDS5ecYJ0JRND107HPFGV8b+zjyAUNeexcrCbUdh0dDrghaN4p9ybINBKJtEOpAew+FkmjCWPl6XV4iav+E1rrzQ/Zkc6vNh5XHqiYUqM7qSFf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750748697; c=relaxed/simple;
	bh=WQIe86JuUNhj2gkklQzuWuDuGEmfX2qJAnjURmdjQsM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AsCdO+zOKZLbbD/WGdlsg2SeqThqxjd+y5L+xC0b/6UTuWTSbGP9aYS0gM2mSnhrw9kH3LbzDx6+ndUhGgnt6kfHVymuZ7QiDFf1GPMpOgEkZsqK8tO+/Ud6C9wG0bWr7u6udG59pKQtOdAqqa8W8IIrlwD2usCIs6+Uyw4qs64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZSQcD8M; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZSQcD8M"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b34a6d0c9a3so194397a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750748694; x=1751353494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NFaPEwYqVk8swUeuusja02739T2S2QTaLE27xP5T8F4=;
        b=FZSQcD8ME2w5VKmeooMc/wLzXIF1QaS6AuHZLMZDiRnWh5KyO6AwKYzYFXPpbhRCK7
         UaPQsClgQxpMhsYfDA+Ejmm1ckKxbatFMR96b8UOopYRz/Y05HVN5IGRyxwgo0In9Jzq
         jomJwPthW7Ex8VVccEH2Ymhf9J0TqQEazn0IQ43YzSQ+VOs0YgzxeCK4/va0SingnQRD
         QraRihidsCkXgk5dr6ooTBJxs4dZg13s1+bucBpyVoyohmWwg20uv6SdEEdWboQftnxG
         krHdh7tQ4kHZbc27706rK7AjZplwUZGzD+xyPbZ2mvbZ0Tm+KA8KRdC8UvSqU7d1Wg4v
         n7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750748694; x=1751353494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFaPEwYqVk8swUeuusja02739T2S2QTaLE27xP5T8F4=;
        b=f54arSMtMu1dIYLVTrtvZ0G3T/pVO4HIFFS2wawhT4ECl7JiX27bttBS41H8ugRQ3i
         WAA0IWwSbQNvS1WK/n96ugqDqsPEnzq8aVSNpoqvbL95GMbDgT79+zl9iugaImsNDOoO
         IZHHcrZZ+Dg3PBWVsikofPMEDpmzjmSXlzDYTLOo1y9yu3d0RmmqO/46Wu44LelwNaqv
         vbhxbSvfXiucVx+q+JcyP3ZDSz7kA4f2nSSeiWkiUXy1bVkd1n4sTBOf6Zc+foIqOyWL
         zWWYOMkgDkpqH5OdVNzCHj6mcfYEuNo+c7Q4v4kY5GOdJJtMdDjRotxO0zRv4Y5gOGOj
         MeXQ==
X-Gm-Message-State: AOJu0YxCbRk2JWdfCTUtLvcvKBWuOu5Ahj4YAhUiYjsMqiYe4IKT517x
	nKQqmEem2A3+M2Y0+/ehw5/mcppH3CCEWRJsfQtBm9cF9+YcP6XZNjLy
X-Gm-Gg: ASbGncuwilWzWsbtPhm1iirLL19mXjHAsgz7TdMZ1dSofjbOcX2JzpRqcqG+HVjSWPD
	p95lguX+fMMiVh5/p1DKz1capIZPnFjeP9R1gAwxP1+jMuT4IiV37g03PuMCP/MRq5tEZA0yIX5
	Nz6NIP/C8Ot9TFAqsYaKeJ+A/pU0s38BWry8Zd45nmr04a0XosMDnt5ku7KCrKm4vatfSVVXEdg
	n9Vo2HcJ00EkbuhlZ1D+evixdkCuMvAYiicxth1y+kyFnTWn2GI1m3y1yt6Nmqws3f61XQ9JIy/
	plQG56wk7YcUQQ0gdVZIv1iGpFpMc6QuCHYm8Ew2y7fGimVJKPhvH8enVntjvlsb6lsIZgVpHCn
	mmGoI
X-Google-Smtp-Source: AGHT+IEhlwIsSspUcRAJkdSSVmCisgdMIL1hyOAtY/muUDQ/EBJGGCf1AuTRLdemhb2h+4QRgwCiMA==
X-Received: by 2002:a17:90b:3cc5:b0:312:959:dc4d with SMTP id 98e67ed59e1d1-3159d6260efmr25628648a91.7.1750748694011;
        Tue, 24 Jun 2025 00:04:54 -0700 (PDT)
Received: from seokw-960QHA.lan ([210.100.209.148])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159e06acfesm10479145a91.36.2025.06.24.00.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 00:04:53 -0700 (PDT)
From: Ryan Chung <seokwoo.chung130@gmail.com>
To: jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Ryan Chung <seokwoo.chung130@gmail.com>
Subject: [PATCH v2] xen-pciback: Replace scnprintf() with sysfs_emit_at()
Date: Tue, 24 Jun 2025 16:04:42 +0900
Message-ID: <20250624070443.11740-1-seokwoo.chung130@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change uses sysfs_emit() API usage for sysfs 'show'
functions as recommended from Documentation/filesystems/sysfs.rst.

No functional change intended.
Signed-off-by: Ryan Chung <seokwoo.chung130@gmail.com>
---
 drivers/xen/xen-pciback/pci_stub.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
index 5c2f829d5b0b..045e74847fe6 100644
--- a/drivers/xen/xen-pciback/pci_stub.c
+++ b/drivers/xen/xen-pciback/pci_stub.c
@@ -1261,7 +1261,7 @@ static ssize_t slots_show(struct device_driver *drv, char *buf)
 		if (count >= PAGE_SIZE)
 			break;
 
-		count += scnprintf(buf + count, PAGE_SIZE - count,
+		count += sysfs_emit_at(buf, count,
 				   "%04x:%02x:%02x.%d\n",
 				   pci_dev_id->domain, pci_dev_id->bus,
 				   PCI_SLOT(pci_dev_id->devfn),
@@ -1290,7 +1290,7 @@ static ssize_t irq_handlers_show(struct device_driver *drv, char *buf)
 		if (!dev_data)
 			continue;
 		count +=
-		    scnprintf(buf + count, PAGE_SIZE - count,
+		    sysfs_emit_at(buf, count,
 			      "%s:%s:%sing:%ld\n",
 			      pci_name(psdev->dev),
 			      dev_data->isr_on ? "on" : "off",
@@ -1375,7 +1375,7 @@ static ssize_t quirks_show(struct device_driver *drv, char *buf)
 		if (count >= PAGE_SIZE)
 			goto out;
 
-		count += scnprintf(buf + count, PAGE_SIZE - count,
+		count += sysfs_emit_at(buf, count,
 				   "%02x:%02x.%01x\n\t%04x:%04x:%04x:%04x\n",
 				   quirk->pdev->bus->number,
 				   PCI_SLOT(quirk->pdev->devfn),
@@ -1391,7 +1391,7 @@ static ssize_t quirks_show(struct device_driver *drv, char *buf)
 			if (count >= PAGE_SIZE)
 				goto out;
 
-			count += scnprintf(buf + count, PAGE_SIZE - count,
+			count += sysfs_emit_at(buf, count,
 					   "\t\t%08x:%01x:%08x\n",
 					   cfg_entry->base_offset +
 					   field->offset, field->size,
@@ -1462,7 +1462,7 @@ static ssize_t permissive_show(struct device_driver *drv, char *buf)
 		if (!dev_data || !dev_data->permissive)
 			continue;
 		count +=
-		    scnprintf(buf + count, PAGE_SIZE - count, "%s\n",
+		    sysfs_emit_at(buf, count, "%s\n",
 			      pci_name(psdev->dev));
 	}
 	spin_unlock_irqrestore(&pcistub_devices_lock, flags);
@@ -1521,7 +1521,7 @@ static ssize_t allow_interrupt_control_show(struct device_driver *drv,
 		if (!dev_data || !dev_data->allow_interrupt_control)
 			continue;
 		count +=
-		    scnprintf(buf + count, PAGE_SIZE - count, "%s\n",
+		    sysfs_emit_at(buf, count, "%s\n",
 			      pci_name(psdev->dev));
 	}
 	spin_unlock_irqrestore(&pcistub_devices_lock, flags);
-- 
2.43.0

