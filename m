Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73053289E2D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751285537; cv=none; b=FK9A2B5zz3cZiHoc/pyuvIWHVsTWwhrurLS5+Y1qsyDoxWpjw5tbMBSQig/BVSMV/gmbaHt0FjZqjBJDv5WPleT2m4mV4jfbASAaSmVnwPo3fO+fX0JtETpdG21oVDpOFYbmdJMg0oxGzKX7vW2SZOcKUw4scFjScSCm3hgOuQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751285537; c=relaxed/simple;
	bh=bFpJof7nuUmGYqkm2KsPCZQjhSQXEXEiHNCnFh89z+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qiEEtRdcBFeZfKdV5VI7upADLfZ16VyTjTcYTRcM+Sp/HELh8MGqtwA2TWiA3UFu5n8obgsDkwdBnz8D+3pwxwCHz/Mdgyamx+Qpsuw48HYVogdeZIJ0QDqjNIw/y3gDDMs7lSXjGjivHyH4MJXDeCQGsuyN64rBYOiRYo1r6dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UDH4OMkd; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UDH4OMkd"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so2789690f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751285534; x=1751890334; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TH1fp4P+aeVvVYSCJGFpR12/g8gtwgbu556T9z0YPnk=;
        b=UDH4OMkd0QRpX99cNucYd5sLpTvoCwTF5IcJlBV8iT6c+moM/t/zCQAXAHFgQG0uDX
         kM5gIoJugyDlLbrfqfBBA1RcLlbUec8cyw+e8wVQiLh2Z/zIQJ1fIhKa6N+efFfywlu3
         x271sJVZyoqVK7a/fLFULURTaHu1R5ord5CUjBsJeHcv66kUJDKsRO11ufg4yhTBkaJL
         Ntjidtt4khPvu7hpT14zaKrJ9xxrGRbDzkt7A4XTiGDfs0TYfL/8BtK0VlkFjdzgrvcx
         lMIN2Nej6wh9XegWP0UIL/bqjZAhEHi/KVagz/pX/+8ilzNi5Q4GkBLJtfxDPBZf8M/8
         rXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751285534; x=1751890334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TH1fp4P+aeVvVYSCJGFpR12/g8gtwgbu556T9z0YPnk=;
        b=g+Xk4wbMN0zwnCcRRRBGa3agOhT53jfShJ8gQo8Owh5aqXe44vv+iAQ9wxWLPDxGij
         ul4vOWvkD1Nla4V71mRQiw+dY8jSAF+Sukz7KZlrXsSMtzV4lcHAeWk080k9Ilfk8X5Z
         2Vg3Ue6u81GjXKpk/w6AOrb1WflGDfqvb4SRyd3d6j3rCXTMhSmOqIPJlx6JmEPR4yME
         cGzzwhw7YyD5anhVum7G9oKreOZv3MOgNPbpFh+BXHGAuLXrBURBxidectwyGNtX/QZ5
         ttvjZvCD+dF8wT/EfGZjFt9yzRSuOD8tZoR826GBdHuaMFe1525LoWeRCBB4zq6xuJpk
         SwkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf60YS1JK/UrJBmjo7rWJraKGuWLB5zUjFuQrmus/7qUqkoPxXFZMT+eb9/k0c8Dl5u8qZcG2+xTEVQIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNq4shs39JWBfXZ2F/K9KfYYszGupEic+ITDiforpawoHYxBQc
	s04NSOfKuNaZyeOtbFh15TB0zyxOoPlud2PrOceDe7KwRKiIbW6tvQ666lcbYgkVEmo=
X-Gm-Gg: ASbGnct+nRNTqXu2JyLzxL1OVVssCvAiAuVZui91QV9GtPle5njxlFFgYM0ka8WTJJZ
	8rvPAAP6VwuDenpqafSKr23b8cFx82nhLc9VY05/NcKYK0XvcS3GibVJdkDTTKCKAELuafZr5dg
	VuPLvLQ+rjnP27+qlsdR+FsEaUYxJJ2eu+gfXwp7d8nZIxYHaIh76LWLEycc//8ZCpKwIqzFwBI
	tGh12Kx+6QPefGZWgNWsBx0jyZvDqEzy4XGwxrTuGxJekmUWIo7GQAQdZWGkhWg16oTb957HC2m
	z5DXVqsMRgUTu55hlHoAwhZM6McFT/dfrVQMDxqP2JoSQx4plIL0SnAd
X-Google-Smtp-Source: AGHT+IGTwXlLXs8MR/SSzHxMFqh4fK+JAUeg49T/YeD3Bz9Ie5DajX3NmkIxmF9d/AC5OC7FQmM9cQ==
X-Received: by 2002:a05:6000:4105:b0:3a4:e665:ca5 with SMTP id ffacd0b85a97d-3a8fe89162dmr8715759f8f.23.1751285533481;
        Mon, 30 Jun 2025 05:12:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:19e3:6e9c:f7cd:ff6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c800eaasm10470472f8f.37.2025.06.30.05.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 05:12:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 14:12:04 +0200
Subject: [PATCH v2 3/4] firmware: qcom: scm: initialize tzmem before
 marking SCM as available
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-qcom-scm-race-v2-3-fa3851c98611@linaro.org>
References: <20250630-qcom-scm-race-v2-0-fa3851c98611@linaro.org>
In-Reply-To: <20250630-qcom-scm-race-v2-0-fa3851c98611@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3258;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VMbPEeKpx4YSDu/1h5tBKKJJggttpFWBH/DjHj7Up2s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoYn8YdJX5oXippXdR1epJBhhVwCAQTEfcY+5WB
 zeWxonA/LKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGJ/GAAKCRARpy6gFHHX
 cgKhD/9qR0lxgs5cdnWfBc4yGo89ZUQdp/vZhVeSVNaKqX77RkqZ+JeGd0F9UDX5LxivCsrju7K
 UyiFSliWG1bsFETP71JbJROZFRWC3rM4FSe96Vj+G81s4n7Aek2t/VFv0WnsO2nSur5+Yh/Dr+u
 GBbcIUY1xuH8jF65+IJlGqeRCqFHaFb6/GQHUEeq93q7F309uDn6DdOKWuXtVUZdjs4bwHakGy3
 oL+SGtQDzsoed5luTNxuoDmGc+14fMh8txbQy9iivIecel+nPpL9HpuVezID5GwRrXgUSVqIV7Y
 lIfhC30rb2MvxNbihloC1M559XorGPgMeZbE4O+3+6k6VlnX2+4pqRwaDwbRT5xhT1WgXx/4ped
 N4NOxeCx76Sqnw1hCWGcGh3U0rdnROGgrZthLuoanclKIGu2JwRtksyMHAuzfxlo/sG7lHZaQFc
 oI3MmwvCdU2Yn2yht/aCzasKo6w7eZlOtqc/CxSb2EeY9c1oOm2bHttjGCrfyFaUGTT6FmcZ2nb
 WhNSpvXAERIlE4oEzuWUsLBeCSVQ/vV0x3YG9v6+iYK6TwHFzC1vScyF294dKRZAhechyf9nIQM
 eAPNXL8i6Tzbm+GOZyPGU6rbQkLRm4w4i9s5bm6udOEhUSgX82djJwKlVtiGf07CeVvT6woC2OY
 KcA8uzZGcQz7KAw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Now that qcom_scm_shm_bridge_enable() uses the struct device passed to
it as argument to make the QCOM_SCM_MP_SHM_BRIDGE_ENABLE SCM call, we
can move the TZMem initialization before the assignment of the __scm
pointer in the SCM driver (which marks SCM as ready to users) thus
fixing the potential race between consumer calls and the memory pool
initialization.

Reported-by: Johan Hovold <johan+linaro@kernel.org>
Closes: https://lore.kernel.org/all/20250120151000.13870-1-johan+linaro@kernel.org/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c | 53 ++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 27 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 09b698b9021644660468d59bef496cd7859aec7f..b6e0420bb2b72247e4d772b66314d81f336f5d9d 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2256,7 +2256,32 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	/* Paired with smp_load_acquire() in qcom_scm_is_available(). */
+	ret = of_reserved_mem_device_init(scm->dev);
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(scm->dev, ret,
+				     "Failed to setup the reserved memory region for TZ mem\n");
+
+	ret = qcom_tzmem_enable(scm->dev);
+	if (ret)
+		return dev_err_probe(scm->dev, ret,
+				     "Failed to enable the TrustZone memory allocator\n");
+
+	memset(&pool_config, 0, sizeof(pool_config));
+	pool_config.initial_size = 0;
+	pool_config.policy = QCOM_TZMEM_POLICY_ON_DEMAND;
+	pool_config.max_size = SZ_256K;
+
+	scm->mempool = devm_qcom_tzmem_pool_new(scm->dev, &pool_config);
+	if (IS_ERR(scm->mempool))
+		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
+				     "Failed to create the SCM memory pool\n");
+
+	/*
+	 * Paired with smp_load_acquire() in qcom_scm_is_available().
+	 *
+	 * This marks the SCM API as ready to accept user calls and can only
+	 * be called after the TrustZone memory pool is initialized.
+	 */
 	smp_store_release(&__scm, scm);
 
 	irq = platform_get_irq_optional(pdev, 0);
@@ -2289,32 +2314,6 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (of_property_read_bool(pdev->dev.of_node, "qcom,sdi-enabled") || !download_mode)
 		qcom_scm_disable_sdi();
 
-	ret = of_reserved_mem_device_init(__scm->dev);
-	if (ret && ret != -ENODEV) {
-		dev_err_probe(__scm->dev, ret,
-			      "Failed to setup the reserved memory region for TZ mem\n");
-		goto err;
-	}
-
-	ret = qcom_tzmem_enable(__scm->dev);
-	if (ret) {
-		dev_err_probe(__scm->dev, ret,
-			      "Failed to enable the TrustZone memory allocator\n");
-		goto err;
-	}
-
-	memset(&pool_config, 0, sizeof(pool_config));
-	pool_config.initial_size = 0;
-	pool_config.policy = QCOM_TZMEM_POLICY_ON_DEMAND;
-	pool_config.max_size = SZ_256K;
-
-	__scm->mempool = devm_qcom_tzmem_pool_new(__scm->dev, &pool_config);
-	if (IS_ERR(__scm->mempool)) {
-		ret = dev_err_probe(__scm->dev, PTR_ERR(__scm->mempool),
-				    "Failed to create the SCM memory pool\n");
-		goto err;
-	}
-
 	/*
 	 * Initialize the QSEECOM interface.
 	 *

-- 
2.48.1

