Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDDB8828
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 08:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746175176; cv=none; b=kp4C705VoflZ3GzcNfK14euGL2m2N9ZiVC3QCYYWua9hXPqNR2F9uxTQYEQJwLU4ZFUJK5CiFbAt879WJb8sEqEzAf/5D2Zs/8TWdM9hFdBkCPKyWtzlND09twudUBYeLstRnrds2FU/yC5jgYDOSRemktcQ6EEX1pz0HJqGrK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746175176; c=relaxed/simple;
	bh=Fc6VGyglFbCU4Zg5Mw2hQNZJJof9kthAbyW2Wut9M2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WW0heIobT85dg+lihmjxaamj4PYiWebAvvNkbLH1Pl+seTc0MWEOPXNzMTJUDkFGNIcwZBTSpwahMV7Bzkx7QOHib0OTRpHOVlj+oernY6ju3TsDM7vfjdcEAvojh+a2m7pgyXT3OlwA7LZ63nanr5OOpRsNKWbj2M1ThE/12JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pgkeSmGo; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pgkeSmGo"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso1182959f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 01:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746175173; x=1746779973; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YTp1n3CXi4d/IkYoP7iNGIaUGP0jg9QVzJw7i5UhA5Y=;
        b=pgkeSmGoxGb3NfuIJob4Qla0scUPSMXoTsndHmbdmjevpXYIfbDx4MAZn4oT6YbLOm
         xw0IrMORmI9j9tflWnq3tb+KApmrfvvNjN5AQhARq+w+0R5nmLM9mnMKFqCS5XJPyHxo
         ZGy4DKfP0RBUJXBZsDPWD3ETQHuMl8oOD/lLf24/i+dn38TW/79l2ayYffez7wkm2LB6
         E0vFUMDR1QP3WqhZwGzws5jaC+Bu7ylByJz58gdyGInOUsMUythMtSzs2KESFQncXLsF
         nIyZ795yXc42yqI0ohwTiiqGI0EFaOaE6ACA90QLsHmK26oLqIN//JN+vcHHfpJhFdED
         g1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746175173; x=1746779973;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YTp1n3CXi4d/IkYoP7iNGIaUGP0jg9QVzJw7i5UhA5Y=;
        b=udq4ywGP8IJYbIxcqzF7JDuOL5F8lhTAOKRKD+YAXpaWfn10kginMHg5I0JxdLlvxF
         bGAxU4FKAVFilPcFL5k3oFQ2lPkmHqqfKCmzRMVqjYrY1mHe565jan/fwnwdoCfzm4Nf
         PgYZJyeoph7IZKejf73Gn5jya17zRTIZXQHHepVqhkZzGVgiWzC3k5oXjV+yW5fC8wW5
         XvM/WtF4hc8RZ7QKDQKdr5NtaIuMKFANOVCUVih9J4hl2OBLnhPZaX67QJkuyS2Xgps3
         3deXbEDpijXoBsUVrioD+FxrjjKxRva3s6+aKaKlkPkk7oph7SL1KX1nliiBqCy7zdEo
         3eXw==
X-Forwarded-Encrypted: i=1; AJvYcCU4vZliHcZy0b3OBdGteVoKW6sF06XD7Sw3T76VHn3XnuytMpLX3VyPKcb9fFbVsCj5AIvmHKWkkiIMLAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV8VlIOP5eVCltzfMAABxY2fqpE1Bk6fhipxx/6dKCJb5f8q8N
	5nTY/Gts/nROYWAMy1RMCksodCPWJpOYSs8pAagiJSqulcTDc0PnDDP60ayBTqI=
X-Gm-Gg: ASbGnctgocIiN4hETSrVmEf0OYN3LSWI1RVj+0HxKQ5pOttDdcwEGkWJFYbtMmayVqH
	Z7H6rcfbNuxjh4oTxCA9ABkpgrR95enPJm7wqaToIkweMIagCDn9GhZ+cIytmsiUqthc1FdFt4B
	++s6eTZjm8IvKOwlx7BUs3pssrxWCqYpLoV9GOhRAZmQ1f6MPmkQgpZUIh65OUTHR8YZ3UHT9di
	TdO9eOpgZRyLjcArWZoTab6F8UuA/f7A40JActOBpnoRuUvf6msyQ/bzuxBoVToCPePg3WHYaiT
	C5ysvaxgrLnu4LeStyS0+qW4MoEsR53VN4D8qRTdmWm6lg==
X-Google-Smtp-Source: AGHT+IGb74sv8hsGiSyin0BDmnbpMA2IZnPZBnAg8xwnjuUfYCPDX9NlYI/bGPAEUyHsmHQ+F3zSMg==
X-Received: by 2002:a5d:588b:0:b0:39c:1f10:ba54 with SMTP id ffacd0b85a97d-3a099adeae2mr1444276f8f.35.1746175173327;
        Fri, 02 May 2025 01:39:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae0d2csm1473852f8f.2.2025.05.02.01.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:39:32 -0700 (PDT)
Date: Fri, 2 May 2025 11:39:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] mtd: rawnand: loongson1: Fix error code in
 ls1x_nand_dma_transfer()
Message-ID: <aBSEwag_ducqOwy7@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "desc" variable is NULL and PTR_ERR(NULL) is zero/success.  Return
a negative error code instead.

Fixes: d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controller Driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
It's hard to know what the patch prefix should be here.  Ideally when we
add a new driver we would use the patch prefix for the driver.

Tired: subsystem: Add driver XXX
Wired: subsystem: XXX: Add driver for XXX

 drivers/mtd/nand/raw/loongson1-nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/loongson1-nand-controller.c b/drivers/mtd/nand/raw/loongson1-nand-controller.c
index 6a369b1c7d86..8754bb4f8b56 100644
--- a/drivers/mtd/nand/raw/loongson1-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson1-nand-controller.c
@@ -371,7 +371,7 @@ static int ls1x_nand_dma_transfer(struct ls1x_nand_host *host, struct ls1x_nand_
 	desc = dmaengine_prep_slave_single(chan, dma_addr, op->len, xfer_dir, DMA_PREP_INTERRUPT);
 	if (!desc) {
 		dev_err(dev, "failed to prepare DMA descriptor\n");
-		ret = PTR_ERR(desc);
+		ret = -ENOMEM;
 		goto err;
 	}
 	desc->callback = ls1x_nand_dma_callback;
-- 
2.47.2

