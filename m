Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7A5A59
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745282327; cv=none; b=XyWk+G/VVh+KIFrHpTh47+Vx9T8Xc/CWTEY/YldaD/7kmpfp3Rnphc6x/vMgxxfb38GzhiB38TuVmWAI6vd6WnABJcuOTqczIsEliG24QiZptgeCR3+HmwhYMbCSQMuXbR0IS1J8mY6R6wmysibKXknUQE0P8C0glxUHAAIdBFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745282327; c=relaxed/simple;
	bh=w+d+pUN36k9YOpblWGPUEj310BPeyY0pPiC7Yfm1ZWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uy5SW9jBxzSdIOaZK6FZY0ZW629bvp9CjJZifosZH6p3vJaSzCCqeWYpc07gIEjQNK00IpzuWno4OsTIW+jtnviSnOFqqoj51ly3zufGnsPH8UqBKMC7xYYU5je5AUZh3/k0bKKQdRXgkWNPJyFiIxEt0VyIx/WSebytmQcw6tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWTC32LP; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWTC32LP"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6ecf0e07954so67934146d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 17:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745282324; x=1745887124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L82qDCUatIW5bho65GQYzAANIICbxdJ8oguoMtwbks0=;
        b=lWTC32LPJrDiAensVVAfAGYXicDV3bqklQfGmQolrpmelxSyuT3P8KOsXi6ZCZErXK
         i5s3PR0cZpPD/DswnbW1ihqkbpChwvQ3G+vGUvoaQpgLtgRCJP8GotzqEa3GmsLaQu2f
         zyhOpKYHU4SvfQuVpRPNua3yREW4BGSsU8ZkTNHAb+eZly3aXX3z+Kwp8RGkNIHsp21S
         Fke2WmhOmJMsj/L42+iah0sEa8cHagq7GPltQiDX/zWphKLiN+pVSIRMwzoaVRqMLT+w
         1YE8AZGaTFrGbP89cgm090b2i3H30sYsgPDET9HoVhaePUzWsAc3dQWcS5ECa0hfjbpB
         2KAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745282324; x=1745887124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L82qDCUatIW5bho65GQYzAANIICbxdJ8oguoMtwbks0=;
        b=MU6wbkrxEdgd7kLKkEH8gDvt+lrn8u1SUhCIEH77pAk4OfP4vEUV4BbukE/g8AYdKZ
         XeaQh1fiD+sZFsp8a0a4zI8Hj9Y+tDU5iBMhYCGFtAadQjchxxX0z+FCJQJTzabhEiiY
         t2UUdlCvMzlKP6BiUDAjlnLO+HNTNySEnjhg5sNwP8YE2v5riH8PdXZwWalxGplkNJez
         FiFhWGjn9G82EjyNuqCApQX1DBwt2P+OE+BYUw+F3Ibf5QLppbN2ve1geBNpg7IpkkIW
         8tfpx2cY/ROUDMd89tIwa8Ly+NUqBANmrscMQl30dev5t0day+8AuXTQ3BjaRm9guMQi
         tp1Q==
X-Gm-Message-State: AOJu0YwvL7g8+jHsOHt708GKJoMRngx1VUv1VoxOuI4rvFVPugnbh2a1
	1p9IJCBOpwtOtG3e7A4Ovjbb61hEKR7qtyW5x4qebDQQxp1Stm7h
X-Gm-Gg: ASbGncuVmw/4sxToB/IU+jXN0mAJtdGjAFLSUx1ia4Wno5tnZJ8U1Ey5ARmcVlbyGSm
	DksgDxC3pxnSQDhM9DS4O62jLdEtG6jknh6z83Ybl17KQwyUNReSs1lZQbF3LbVDaZDvk0j35Dx
	l9B1AKIfSiKYQUmQhIY5eRrMhlPlDDdus4q+FSW4GkrxiQbmWISl0BWhw7cXmzWIz4XIMeFJlmM
	LhY/ZwKoRsJywmUOOrCRZYeB3vnXJK3eHeGMBSG6KENVb58h+dWoBDmaXiMfv/9jO0DokaYfvoT
	+ikax6t+ferQWuCV
X-Google-Smtp-Source: AGHT+IErRaqG+adhvD6mHxTU0a+h46xgh8g/AT+jqVW4OBY2eT+8Cx1sJjoFhAZcPdMkvwBkYOUfKA==
X-Received: by 2002:a05:6214:1c49:b0:6e5:bc9:95f8 with SMTP id 6a1803df08f44-6f2c455329cmr224472876d6.17.1745282324330;
        Mon, 21 Apr 2025 17:38:44 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f2c2b33134sm50376116d6.54.2025.04.21.17.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 17:38:43 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>
Cc: linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] irqchip/sg2042-msi: Fix wrong type cast in sg2044_msi_irq_ack
Date: Tue, 22 Apr 2025 08:38:03 +0800
Message-ID: <20250422003804.214264-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The type cast in sg2044_msi_irq_ack lost __iomem attribute,
which make the pointer type incorrect.

Add the miss "__iomem" attribute to fix it.

Fixes: e96b93a97c90 ("irqchip/sg2042-msi: Add the Sophgo SG2044 MSI interrupt controller")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504211251.B3aesulq-lkp@intel.com/
---
 drivers/irqchip/irq-sg2042-msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
index 8a83c690b760..a3e2a26d8495 100644
--- a/drivers/irqchip/irq-sg2042-msi.c
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -98,7 +98,7 @@ static void sg2044_msi_irq_ack(struct irq_data *d)
 {
 	struct sg204x_msi_chipdata *data = irq_data_get_irq_chip_data(d);

-	writel(0, (u32 *)data->reg_clr + d->hwirq);
+	writel(0, (u32 __iomem *)data->reg_clr + d->hwirq);
 	irq_chip_ack_parent(d);
 }

--
2.49.0

