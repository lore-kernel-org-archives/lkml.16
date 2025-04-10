Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7A21EF375
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302383; cv=none; b=kog5z3REBvs/x6EulgQ4TrfH/wMpNHDFUDbFxWZUzEy1NMRLDcxQkwSU7P15aaDKs5nzIxBSnj2plRwRpE2zsIsf7t3Q6ovnIGx+nc7UZED2LwiWkR9EdkZ0/b+9WYM6dzWqlM4hzENFx+KwefTdQUI1uV30zDQOar7TD+h3VX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302383; c=relaxed/simple;
	bh=uahR4xkljdW6YAEH4HqJNn8IYJmLvcayuCU2q8UueVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eo4ueFv9zsHQh8hJn5j3HgciF+lK6T1/4UiSZxXqsuZJXX1A8ZPPTf9a5MnpE24LDCDRoTWw0GF2M0LN1Bjxl+nI1l+Iz3EdTPhdEP/1dnz6ROb8Mmm5VwzV8IsCj7WQHblvTzkdBpg1G/Tyz9LL6D6DJ/CmcybaF3gbVlgWOTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l9sSImZE; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l9sSImZE"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so9609615e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744302380; x=1744907180; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y9ckJ5dfd0gLEO4J9dWqs05uCPbUjSjr2AMEvPSWIg4=;
        b=l9sSImZE0eZRKee+ZfzwBqfW4Tq+KbG0zohtpgkkS7v6ndsheUuHJcxggaoqeIEdfT
         sZWTbAQvdbqieo+2jOXwnJdDuG+Ya2IAz2foFfvpDLS+nCin0Jy3aZdlLwxgThxJ0YLS
         TkQJ0UCcT4mvRz5bAr5YhqmNY6XgRm01tZLBmZJVbuntE74z2MWSxsgRbA6SZYw8xFHc
         X+riralRPQycB3srXYL+3uEh6/+zf7i8KU24ALwZx6VIhXy7Kdy3hmnapZlS0ZpvJy5M
         3WWXFsdO38dzYlGIr4svKU6e+0lru94G3M2pNCtxbohG9nVza3NNA5JuyY2Jz+wmU6hk
         j4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302380; x=1744907180;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9ckJ5dfd0gLEO4J9dWqs05uCPbUjSjr2AMEvPSWIg4=;
        b=QDgtFM2dcIavWqt+y+q25ih1HC/gvaW2u3UHvHFU1u5x591FSxDaiq+sI9NIqg0PXB
         722Ntk/FEtJZPOCG+UbsgieDB3UmTgvviSCC+k1IPlO3cL4/Q3/aXWlJrIvKV0Pr7TOV
         INDcXKwNiVWr0bF19tmdK1QE3j2z/XPV9anDzwmnh5XfFzjofywGf7nxM8Ka94FRNPEw
         Oa4JY9UKjmKK+jjWNZBRaTeab+VPcutgahnXdJbHIZIvIUiRs1+EmIL5CZCfj92QuV0h
         likKa1CND+XrhTNQRBKZFftEUfh8YV4QBiL5UgQpyGLndi7eEVPhtrVBKwFQ/4uTYJ7U
         DPoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe+k9pZEIMbWKsAunZ4M1LihJwlE95XdXo4em08lj15Y2MlyW4MQrd77JIlbqcUiQv/bChzYYhnydY27U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGBRwVfZa0N3JZ5LEqd3CjBzNpoXbCDsIvcgtjVETjxkvjWiVz
	nKdcX+l5YDAfngkBc/ulIxLmowEt9ndBr9sk1rmak+MK+AAEA+kJ6hghxc42VMc=
X-Gm-Gg: ASbGnctUtW83VjJe5aEJdTnysQOQtFJQP/nCeCnyZDULk1649686ho5COEGGpd2bqDM
	mRh5nzUjUwyCoeLl3md20jd6QiW/Fx9TGZ/doXFgbd8fcGedeodUworw88p2od28MtG85RCFUqF
	cgxKdkVu/fFOgekkbM7nNnsKo2miPUnMC38J2K85Y6tNs7x0LBwdrMwsKqzpicM6oNO/qdL5kre
	DWNec4247gQMQV4dAIvI5n7m0LnMlAq/8sx7+iCQTwe8/I+6Wl3WvKcw/HTq9sOrfG2WSQAkpid
	6SbkkjtWvxLGynZuZOXVNioR5Wn9AJ2K3R1EWPcYGUQu3/trLnlcJ+tF
X-Google-Smtp-Source: AGHT+IE1nYH0HBU/WHO1w0aQZJhBOQ2ARrY9ROHGDPijYcKFnQf4Jd5ojzOvEeX3hT9ouKniOfxAnQ==
X-Received: by 2002:a05:600c:190c:b0:439:9e13:2dd7 with SMTP id 5b1f17b1804b1-43f2d798f17mr40725835e9.2.1744302379796;
        Thu, 10 Apr 2025 09:26:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d89389ed6sm5196989f8f.41.2025.04.10.09.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:26:19 -0700 (PDT)
Date: Thu, 10 Apr 2025 19:26:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Balamurugan S <quic_bselvara@quicinc.com>,
	P Praneesh <quic_ppranees@quicinc.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: ath12k: Fix a couple NULL vs IS_ERR() bugs
Message-ID: <937abc74-9648-4c05-a2c3-8db408b3ed9e@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_memremap() function returns error pointers on error and the
ioremap() function returns NULL on error.  The error checking here got
those flipped around.

Fixes: c01d5cc9b9fe ("wifi: ath12k: Power up userPD")
Fixes: 6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index a9d9943a73f4..636dfe237a79 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -360,10 +360,10 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 	mem_phys = rmem->base;
 	mem_size = rmem->size;
 	mem_region = devm_memremap(dev, mem_phys, mem_size, MEMREMAP_WC);
-	if (!mem_region) {
+	if (IS_ERR(mem_region)) {
 		ath12k_err(ab, "unable to map memory region: %pa+%pa\n",
 			   &rmem->base, &rmem->size);
-		return -ENOMEM;
+		return PTR_ERR(mem_region);
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "%s/%s/%s%d%s", ATH12K_FW_DIR,
@@ -929,7 +929,7 @@ static int ath12k_ahb_resource_init(struct ath12k_base *ab)
 		 * for accessing them.
 		 */
 		ab->mem_ce = ioremap(ce_remap->base, ce_remap->size);
-		if (IS_ERR(ab->mem_ce)) {
+		if (!ab->mem_ce) {
 			dev_err(&pdev->dev, "ce ioremap error\n");
 			ret = -ENOMEM;
 			goto err_mem_unmap;
-- 
2.47.2

