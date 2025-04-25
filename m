Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD0022D4D9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 06:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564098; cv=none; b=QIgRdm5PyyWnPPrbf0FsPNHveHtTtmpSCNOPOvPx4SSVjLSB5GC4oYIwhbYokl8LASPoiUsAJNhzwCJKp7ZJdqPGcJMPR8SB3RN9v77CGQxOgHsNgeByuMPTxB/i4IaBLF+m3rNnqLzr8UYnNxU2QcqEuOOf9Rd5kbHqtsZ4Ai4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564098; c=relaxed/simple;
	bh=TUq2DOTUsyGeAFQFsktbvp0jcp9HEko6lVzJAFmj57U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kq26VeIODmVGAEcNBa8u+SnBIxshGCKoNEAQAFLhizbKIEFtAtdIl8M2tDi8vtjoldREaJ2q8Br1AVjM8vshA7ORxGQTO3NohPM9HxsM3sJ+0DooOFqnKp6lGivCTIeVWfGv8B4aGs6mwLCSP3yuWT+KDtAZqorIDUN04KQmZXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rf8x4nJK; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rf8x4nJK"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39d94327297so230241f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745564094; x=1746168894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Otf/iu1Yf9aOcycjfUFRJv+7oQmWkMNHohXscxzbZsM=;
        b=rf8x4nJKfUA3Q0K3GaJmsB6CCI5LDAq/Mcb7icfVy08ReP6cY03g6FBBnwqbOTMmm9
         CX22YKo5MZeFOD+V/gIu/WQSxAzH9ZPVZZgKy5GtDEFQLFZFAxsYNh103PyWS3EW3pdI
         Id6j9WJVb1em5JKRhieh35/XWt5gnzdFDNH9RHojvnw3qoN72A8Hoivs6/thlcN4/pKa
         A3s/iHFczdrzMEgPT63gADMyVyZZVUdAGGIJb4VLEgidmrxU/XVjGSYuwiGA6K0aCvx8
         WfURsukkvF8A0QpcJOl7aXFuYMUB1cwGQdyePlZWQ5dKrIq85Ftd9SVxZg0IpK0oJAlA
         BtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564094; x=1746168894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Otf/iu1Yf9aOcycjfUFRJv+7oQmWkMNHohXscxzbZsM=;
        b=CDlv7e5u384pH2AlrcJU+EdmH27/8NL4LkZVJhugGbGRS9OZNKfM1Y1Wa3kkNFc+hx
         hbbD7mzpYCVf2EkuGwOKlrzYLZaLXTVrxjYQm3AVUR7rXbY9Ux+4NXu0MZiVLmxqqDVK
         +HZMzFHrWguGkqzobCnIYljsrfhzg2v5Xpy/LyQEl1uR1xVMMebw1rZMF5Z78ELe/leQ
         I/mPM+vZVE79f8swABro0BMF0g43X3DSNB2MnvmpzL5WdnBqfpR61JDEPMmW/W7UI6KN
         0u8AcZC0y6/iqWYB00lzE2U+ceLIXZsCCJ7cXGXA0EUKTVvDaDbLrZkwUwftweOyPfPD
         zDIw==
X-Gm-Message-State: AOJu0YyQgZODBTXrVjofqnqnzIWbkaQs8RBHEM/QaU9lRrP0KcSqUemS
	GFPZT60YvBEBGThGulyWSEA12+OusMlcCSOp8A/S0HwR/EYInSJ+wRthCtFjeZVCtOkoXYixTDk
	J
X-Gm-Gg: ASbGncsZCNsqwhx3k5fwO7SGYnpE974152GKjUhERkOS1XuWSa6bbVsqq8yf0uM2FcG
	98i5eb1O3e7ir/iKJZ8eSy906VZTJhgmasM9uVSZKKQsBTfPIZnPuv/BmSZyKE9B/L1/l6MG3ae
	IcRX3O+FNChCO/gvPMpdGhGq406dOE14F4nOctm2TYKJK85PzzlsggrAy73sx9Dl2nZ7ugG1w4q
	FUDdnuRDIvK5QkgWiKBkwfDyTsjkczCasu7+eOslRLF+QoIdHWelbF5CRMc8xbIAzRWsVCNjnaA
	m5BJrCfOBce5RzbHCF8WTXJO7qoVPoW+Qw0rXj876Kg/CRSuCj2F6mZzyp0=
X-Google-Smtp-Source: AGHT+IGWIF2nNe+ZUxrH4wTsQL9aYvGqe+wdQ8LjrwFqM8kvNIQHxQZKOQf4M6z8Jbvh65PCLE9eMA==
X-Received: by 2002:a05:600c:4ecc:b0:43b:c825:6cde with SMTP id 5b1f17b1804b1-440a65dededmr3045575e9.3.1745564094615;
        Thu, 24 Apr 2025 23:54:54 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm14369405e9.7.2025.04.24.23.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 23:54:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 25 Apr 2025 08:54:38 +0200
Subject: [PATCH 2/5] cdx: controller: Simplify with dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-cdx-clean-v1-2-ea2002dd400d@linaro.org>
References: <20250425-cdx-clean-v1-0-ea2002dd400d@linaro.org>
In-Reply-To: <20250425-cdx-clean-v1-0-ea2002dd400d@linaro.org>
To: Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1199;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TUq2DOTUsyGeAFQFsktbvp0jcp9HEko6lVzJAFmj57U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoCzG2ZmvW6L+JK5kr+oabYat/9HA4vMU59pmQD
 MZYD5NZLeyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAsxtgAKCRDBN2bmhouD
 11WJD/91rGVfC5YRATkaLsm5BfufAcqKtrZRDYhaS6QftDEnsvV0AwDKc7VDqtLUsORv9dBdfkn
 QGwgoZf4kn5JfurdjLftQRyyMtQMBa/t4b2RBFp5UxJrH0+Jn4bmxX/604zI6oPDHgt6O223Qm3
 TCmT98tzZTEXk4BeWZKANJTIcivP77HwD5t6RlDYGOpc4xJJTg4cc33MAFVchjjTgB3ypk6lzK5
 6OkQOMVDTuqV7DliqpogV9jCsNqkco5UFCPuZtRgoNznbXHueavo2Yj2RsrDs9Eye7GTkI+Sz0o
 DnnRKdIxr3xeLpycyvCrD+otckVtLxEavNfz0VvclF1ibKYHVPKLg5Ft+D1WWGOix/Aoa2+pzpF
 p+DJa+O2qOe47xwgf9bZFi2Mnor47cjynbg36L5WoYe1ir5sFgacRFl4yWjUAjMUu6FcyeNSLGR
 QL6hr4BwVxt3JEPCusypFwHSWyxuzTX3ld/rjT2yFoaZLWm9Iu9S5g1s0occvK4mphqo29t5JYX
 7P1qDexe+2fKH/GHTpIbXi308oF7cKE2ZCeevVER5UsWo+tBDIL6ZurwT1d79yQyVKsEXljtFS9
 hbb7kHlTdN5rHhqrMcqSA/JuzhTSNBLC4WErHJ448o6N0QjHEnRlreI9KXCKWEffYSalZ3ZQoFo
 /9PCma2iqSsRpRw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify printing probe failures and handling deferred probe with
dev_err_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/cdx/controller/cdx_controller.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/cdx/controller/cdx_controller.c b/drivers/cdx/controller/cdx_controller.c
index d623f9c7517a86c06082c0db348688e7f33b7be6..3df35833f0e0a994af0606eee0dc1dfc9c7c22f9 100644
--- a/drivers/cdx/controller/cdx_controller.c
+++ b/drivers/cdx/controller/cdx_controller.c
@@ -195,15 +195,13 @@ static int xlnx_cdx_probe(struct platform_device *pdev)
 	/* Create MSI domain */
 	cdx->msi_domain = cdx_msi_domain_init(&pdev->dev);
 	if (!cdx->msi_domain) {
-		dev_err(&pdev->dev, "cdx_msi_domain_init() failed");
-		ret = -ENODEV;
+		ret = dev_err_probe(&pdev->dev, -ENODEV, "cdx_msi_domain_init() failed");
 		goto cdx_msi_fail;
 	}
 
 	ret = cdx_setup_rpmsg(pdev);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to register CDX RPMsg transport\n");
+		dev_err_probe(&pdev->dev, ret, "Failed to register CDX RPMsg transport\n");
 		goto cdx_rpmsg_fail;
 	}
 

-- 
2.45.2

