Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8672625569
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 05:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743832624; cv=none; b=DV1ETi9v0gER7hqH1GUe1StAPJ06qQCa9785KZUEsgkjIQYgl6IstbcFNF799bqlaYDmZ1tS/mWMEuD7QpreHzqavyeK1jpkLqPPLrDCSemyPIrQs9wqwIztgOkgrmmXhlCjA5uoJ1a+HoT1+L3qa2WDl75SZKvIPrtd69PrSY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743832624; c=relaxed/simple;
	bh=3GbTpxF2qobSJ72OAqmH8chJX9p3IrPLJsuJKlDgEjs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SCzKcgcO/uO9FwtL+2QyUiS9WEHu6z5x8r4sr5EyHItUMi4qekZlrCGUThqBb/ft1X8O/2zCLr1+5rsq9YENGdDN4DQYf/aTmmVDkH5+DvNDfDULUf0njKgGS9SVLUUjsZYITSJwegl+EPhpgTfoZri9Lu+zmdchAt2tow88Ixc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5RnI/7a; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5RnI/7a"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-476a720e806so25404491cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 22:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743832621; x=1744437421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cXoXu32p+yvTpl/FA9Tehjz+TiUIPbg3Cf0b50lx5gA=;
        b=g5RnI/7a0CIACoDWqrjNMPUzRMe+V27M0eI3VQTvZjpK4Cu+xBHBbUx2zqVd4Yc1u6
         77UhKXW7QN0PGvg9yUIiWC9MqAGSr6hv0zWknvDaUDH481zgQ3GDrzrHeQKZ6QdZmpkj
         wzIPSP30JBeQdBYDgALHeVp+SpszpxGbRhEBsfq9bXX3pKFyz76+3SBAWQC2dZGtmCTA
         9+CBCwmp5UZNpWHolopcYUEF4HclFNQyyupKNIZktR24eyAWuVc3EGZYkmHQXZ6g1p6t
         GM9mg0ucGujNmmk5FubA05e49bbn0NnP/NwLe+X3nBZK67/H7MRDfCUIRv7hApKFx7pf
         6QJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743832621; x=1744437421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXoXu32p+yvTpl/FA9Tehjz+TiUIPbg3Cf0b50lx5gA=;
        b=j5/iKunTYmyno1lEIMAemEkPLrMOG62j0CqaeNWbZrKVLPmXkpuwl6i8LAS6tQ/mHl
         B933UrmJBd0JmQXZzmV8/HNzuL2XMzeRpRv5YwZ9FvC802WS5Bfhg0E7iIJqX91ZcdJs
         k1TTf4axxmngFr3dXc3esVhsE9lFqB+yqSAotbhMNGEb0je9vY3l5eXl1Z4L53TZpzy4
         JRwqPjyhyXDhJHkHOgOZ1/3MRsu86VHEaBQmVhviNjrv0uIEgW7cgOo2Gj8BjQOx47dH
         c6EsAcbDkQcySqH1JDjWRFraNktIdG0GbgPHEZwOvmsOB1spnBdctlOGPa7ArDZWCTt6
         KPDA==
X-Gm-Message-State: AOJu0YwAkAhGMeYRPCUSIiBmh4SuBPjCOA6AATjhp6fHOsjZHjjTeNv1
	9V7Ca4jApZwXJqqQZd/yBDRDii2/eL5ZMyufEFOCcTIWnLMloE+M
X-Gm-Gg: ASbGncvftYzHIHCkNkeAa7ee5ZjTHeO3RjO5y1FFBYgcUmPVzZ1+cwjrxLXck5UBIWr
	+H5+OAUYLJYsK+CPxSKlfnlqZff1ouRSv0256HL/g6Z+V3T40NNW1pJPQ4lajFCOqEe12gQ/sVa
	lnzxL/aZhjaJxTkmE1sLeP2nNWUB/az2TkqAXQJIM08eiCS1S4ts38lA/rcRiJ9AykhEgdrlE7O
	IFcCbIr1t+9v9TzvAvQ/KBHFzDWbwJU0jy94bptAJwB3tebJbOcOdhtl46ZDcniPDr5CLu5j82y
	VpDmFJL1xqSRaTQ1eYh8
X-Google-Smtp-Source: AGHT+IHAkPXVNuZK8g4LJVmN9ULIIsQVLAhkLP0CEKfRTTKkKgAPfpJtdiPWCmOWoxI+XPLm+vZfnw==
X-Received: by 2002:a05:622a:1994:b0:476:7b0b:30fb with SMTP id d75a77b69052e-47924953eaemr93760161cf.22.1743832621375;
        Fri, 04 Apr 2025 22:57:01 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4791b071b42sm31190551cf.27.2025.04.04.22.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 22:57:01 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>
Cc: linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH] irq: sg2042-msi: add missed chip flags
Date: Sat,  5 Apr 2025 13:56:24 +0800
Message-ID: <20250405055625.1530180-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sg2042-msi driver used fallback set by msi_lib_init_dev_msi_info()
As commit 1c000dcaad2b ("irqchip/irq-msi-lib: Optionally set default
irq_eoi()/irq_ack()") changes the behavior of the default fallback,
which break the driver and causes NULL pointer dereference.

Add necessary chip flags of msi_parent_ops in this driver to fix it.

Fixes: c66741549424 ("irqchip: Add the Sophgo SG2042 MSI interrupt controller")
Link: https://lore.kernel.org/all/20250217085657.789309-3-apatel@ventanamicro.com
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/irqchip/irq-sg2042-msi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
index ee682e87eb8b..375b55aa0acd 100644
--- a/drivers/irqchip/irq-sg2042-msi.c
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -151,6 +151,7 @@ static const struct irq_domain_ops sg2042_msi_middle_domain_ops = {
 static const struct msi_parent_ops sg2042_msi_parent_ops = {
 	.required_flags		= SG2042_MSI_FLAGS_REQUIRED,
 	.supported_flags	= SG2042_MSI_FLAGS_SUPPORTED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_mask	= MATCH_PCI_MSI,
 	.bus_select_token	= DOMAIN_BUS_NEXUS,
 	.prefix			= "SG2042-",
-- 
2.49.0

