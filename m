Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E990128F92A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745519772; cv=none; b=cjsRMcUY8WMCJ8CIcGjH10sdBPX4SPYw0sf0UaCTRg2EQ/msnHWqXomJXaMswth0kSn57e3zjMkuTjtvgfBbIjTfkhpVf2UjyDipQPsI48t/DJEpDkh6cfrUUJeCJKoDP+Ttbe+Nh8XmpDh0gSIbgbgSrVh+V7Yui9EPBbHY+38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745519772; c=relaxed/simple;
	bh=PJOB22Kv3PJwwTTW6D5ax3TpHEhXSzaZpTr6rXL+klk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RpsYL0u4pNDzMhosVftzbtQIqg+B0EIThEiuYKnwnDBybZfNTT6jBuXSrB222I41NFTKYKx9yQYW64QY3OZV6JQ/ZkY5uC2af+LdZI1F05Aoyx/VRKEK7+HhMM+VZluSnxgGWoCI/8prElDcbMqO9bOkfcU/mmSYPKZQOZ/TMh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fq/K59FK; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fq/K59FK"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-225477548e1so16330625ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745519770; x=1746124570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWBrjH6js2nFce+bLoPB/th2NWEOtvdRjUhQW1smgG0=;
        b=fq/K59FKIu6BDdcCXACme86ytZqKi6EUAeLPZXaGRTwBPau/bm+aMB1q8OaQ1Bzuiy
         PDhl/GvOZDzbxUrle0ULPGTkmJBdJTISuoPre4tVxVHY8V+upfVUwjbzF35fqS9Um3Sk
         Kucpp/NfR4uDTqYmg3o4HNVQQkscoLlFkcJwf9ytDgXUcG+1JsGTuaPUaImxE7YQuYnu
         aILbEp3Fu2vbSEIgQuvzj+I9/CHL1+ffNiWY0d50ejWGa7teuEimCmNtNuZ2c3bAn8df
         4p6PBSF7kWuSHhFGctAZ56qP0WfRf9kBKlt5VWNFi7Lx+f6Rvrj1OEx+lIw0NeronVtu
         xL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745519770; x=1746124570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rWBrjH6js2nFce+bLoPB/th2NWEOtvdRjUhQW1smgG0=;
        b=BjLcqRfuYc0CTdhkhXFl99fVoU27/leeESFfgdjb67wQAVXrFFrdMWm6v3mDJm9PzM
         qaJHAd/nP0oVwsAF3/KwBhEMsy+3idswGjFo54Z32cc79mvOGtIjW3z9/UBuWUHXA4m6
         fulYLTIQAwQc8I/V6HfhKcMyMlewyMYyZlGPwpPg9hHKFFhDeoK9qFcuG0CHMNLN7gZb
         Ko9KrhwXn9/4dytad73Wf1M3CMvsbmd4a2/FdJE05gZWUeEAYwG8YL6tykmHWNEjj7L5
         uW8jUu/UL68Lsdezq97L4vfRTlYci30Mcr556aLLxDISRh30mJ9/Ea9Vevw5CkUFAAq6
         rnjQ==
X-Gm-Message-State: AOJu0Yy/+sDdXhO22ZvwM5NDEYYeWOnMDj3xpwtGfFUAQFgNgfwfQz6n
	tww2dutDMD8ZbD8rD2cYWRTSds+IbE7ua5G3mSi7/EQ3DDrcCgAY
X-Gm-Gg: ASbGncuCVxQi44dGZOhCyCvG7fizbOOYlPwl0NMxLEsipdvw+ezHioBMcY69wGLtcNA
	9XJ55zd3UwuWkH7MEL0vC+S7cAup5V/L3kpah+1tW2vTBJoYRtIvjGezgQm9CDrDaaQEDHt+HOG
	/MTB8SBG+vlbx7J5g6Nk3o6kmvwCOkSXW25YZ1jl8D+M2FVsdXstSQa+2zdi+FNtdxOfy3Fn2r9
	CdRaOcAQ0WjRNwt8SOgBTBjaQdSVdEBYW/DktQcB7IFIC6vvZUOvLNRT+jrC6pP7LZE5w5IyIAU
	expDCT6rMcHFQA6AX4Aau/RB0EWiSqRxJ/y6py+1TrW8wQhbde3e
X-Google-Smtp-Source: AGHT+IHqLH2t4islHCN7Xsxvq/NEq6ccj520erbcioNpl3nA4bpgChYKH6CToUgPC/7beqqrzgGCyg==
X-Received: by 2002:a17:902:ec81:b0:223:fabd:4f99 with SMTP id d9443c01a7336-22dbd43fc8emr7760115ad.5.1745519770146;
        Thu, 24 Apr 2025 11:36:10 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef0b9df8sm1744660a91.35.2025.04.24.11.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:36:08 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 24 Apr 2025 22:35:44 +0400
Subject: [PATCH 3/5] irqchip: vt8500: Don't require 8 interrupts from a
 chained controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-vt8500-intc-updates-v1-3-4ab7397155b3@gmail.com>
References: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
In-Reply-To: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745519768; l=1330;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=PJOB22Kv3PJwwTTW6D5ax3TpHEhXSzaZpTr6rXL+klk=;
 b=Glbq3otvptbFSsdcQRjXjts5iEYe4uLGA6irB9favgR/xaAVY7e0Cm+voNcmZtDw3B2tcydc8
 RUPsx0DVE4IAre19Fw2E5tie81ktqVAIrYohjUOogGNvhu5CN2C0TNC
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

VT8500 chained controller can route its interrupts to either or all
of its 8 interrupt outputs. Current code actually routes all of them
to the first output, so there is no need to create mappings for all
eight.

Drop redundant checks, and only map as many chained controller
interrupts as are defined in the device tree.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/irqchip/irq-vt8500.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-vt8500.c b/drivers/irqchip/irq-vt8500.c
index 6d46e1a0fda953d76679ad2318674fdf0a977f0b..cf24a88f52d1b90f033d429288c88398439b92d1 100644
--- a/drivers/irqchip/irq-vt8500.c
+++ b/drivers/irqchip/irq-vt8500.c
@@ -220,16 +220,9 @@ static int __init vt8500_irq_init(struct device_node *node,
 
 	active_cnt++;
 
-	/* check if this is a slaved controller */
+	/* check if this is a chained controller */
 	if (of_irq_count(node) != 0) {
-		/* check that we have the correct number of interrupts */
-		if (of_irq_count(node) != 8) {
-			pr_err("%s: Incorrect IRQ map for slaved controller\n",
-					__func__);
-			return -EINVAL;
-		}
-
-		for (i = 0; i < 8; i++) {
+		for (i = 0; i < of_irq_count(node); i++) {
 			irq = irq_of_parse_and_map(node, i);
 			enable_irq(irq);
 		}

-- 
2.49.0

