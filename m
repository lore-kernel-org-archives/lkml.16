Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D861EEA46
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038510; cv=none; b=fa3RHC984EeRnL3/CBGtwSEQtHvJY+ghrYOY69MJXl8ikeRXVW1y2TsFUMstK6Sl1UusvA34/+EHTspKKQ01KCjXY0yAnqLkQHEgFWMpUmFVKoH1327Ns1sFuju6/WT1YN0Vkn8ZzVWKDW9CXI+QhS4ksuSyEPPW8/L0SgvhDvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038510; c=relaxed/simple;
	bh=TUq2DOTUsyGeAFQFsktbvp0jcp9HEko6lVzJAFmj57U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HbQZdnPYn9CWVMd9NyFSSQrgDEA6FpN3W7wr/Np8oAlJUycE4qRY5ZrJh59l4NvNVvdHelyRoTdcTWIh76Mb697jV1othV3Ueu7SQWB9KtVeOS9rRVxOgjccFRWzNhuV2yHJxpVI/hzEzV2oD376jF4NpPconElKtkW+knzobi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qGVt87mm; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qGVt87mm"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3912622c9c0so1543f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746038507; x=1746643307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Otf/iu1Yf9aOcycjfUFRJv+7oQmWkMNHohXscxzbZsM=;
        b=qGVt87mmsV4wmKwKIt1qB+dbmB0W/3h/CkSVk09OFocckrbi+jmRGnUTjoBxclinoS
         6tMEwza0Dn+t5ieVM3G/JM0fDGp4LAtv+WgrWsYWsfOgsfOfoA0MxBPdPLrrJG89No7N
         UDsSrjsO6QhaSeKyYO3nvFMIEy4iWYOqj+823CHCjcHqBHwvOPbt8rGM3XVckxosnKvc
         HU9zeDcZ4JFb0TA9TnuIMZLzEyLkZW1vDG+Q5qibfEHp/YQ7JCCeqnGrcGz89Ly/YJ91
         feaxwuWXcLLWq5ytg+ls2iPtXFBdicFjyyR+VxpvWQ46kVqzQHoYhhF0ftvP4pCyo35E
         i/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038507; x=1746643307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Otf/iu1Yf9aOcycjfUFRJv+7oQmWkMNHohXscxzbZsM=;
        b=ZaL4rorr7MVgbmlNpWzzqUDQ8ULI019Hxmpcm7KG6Z6ks/FhhPK4cRBMGD8jkojh6f
         SL62cLhlemWaeb8dvHQdYuD6xAiqHIOUD5+1YwSsLGbReVpy46d5yUfQhQ8w42DfmNvk
         CrRMZZO5ThIvtol7MPUv4Dy9hhLxY/njshgV4DolZ3FCnTJdrDbM2FndeKAB7Cn/wtN8
         YmP9YyR8UQ3Yb4cnT5+xvtOH2plkGMaO0Yjo+6FARn+6z8322aUI+/pmXpS9HoZaotqj
         i9f4unoyMex5XnBjdcgQIL/ADyGz1yb4Lvq0vo3Ul8f7RuGf0k1snUs1xFwJXvKozoGJ
         WLOg==
X-Gm-Message-State: AOJu0YzdZImKpYYSbXkevA5sHpRIoM7RTwgWuG4IAAe7l0QicUG6URXo
	Tzky63F71/JACDlpo1mb48aGzqIFKRPMrEDzT7YSw8CTw4E/OFEL6EDlOGml/IFOVWV5CN8DxYV
	Y
X-Gm-Gg: ASbGncvAdsICB7vMni3tnjCdL+AIRe/TglDRy9n5Z+3YY6ev6uNbCZ0YTpdtbY1+aqw
	fyr4iiG/z7Cu/GiswiGF4N08dYju7LogL4KSUkHsQ01eAh8TI4LZsZQvIcL29Ih9YqV2UDo70z9
	l3R30TPD/cxM5GSKeuH79Y1SvcdioIGInS2WB/BQZ5E7SosC/jt0x60joOuZhRx4cubMK/4w2gv
	6FdWMh34KXYYEH57E2Rc2J542rmA9F5pQxF6XFWk8e8qj/RpaM20o0lEj90mfmBT6kfKfIvh51V
	iv87Rm25MNDNTBHRdZwTEKHvphBu3fL5TY+r9vsxROXmP2MHW5MFAP9NW6X3HDgfaVBTCA==
X-Google-Smtp-Source: AGHT+IF7tK/4JuCJ0X/LqhyyksW1k3CLCahqxqYBKvVY9NO63SJ55KBZfQ3b7I8Yk1WQLW3I2tsuTg==
X-Received: by 2002:a05:6000:43cc:10b0:3a0:65ac:2b46 with SMTP id ffacd0b85a97d-3a08ff351cbmr842088f8f.0.1746038507079;
        Wed, 30 Apr 2025 11:41:47 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46257sm17728991f8f.77.2025.04.30.11.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:41:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 20:41:30 +0200
Subject: [PATCH v2 2/6] cdx: controller: Simplify with dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-cdx-clean-v2-2-7dbfda9364a9@linaro.org>
References: <20250430-cdx-clean-v2-0-7dbfda9364a9@linaro.org>
In-Reply-To: <20250430-cdx-clean-v2-0-7dbfda9364a9@linaro.org>
To: Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1199;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TUq2DOTUsyGeAFQFsktbvp0jcp9HEko6lVzJAFmj57U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEm7hBFwG8HU+mv4IQt6aNcTkB7XUPoOe1/ETG
 DeUxTEVWmmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBJu4QAKCRDBN2bmhouD
 105lEACK5LREOuYNIRwBzpq3oLs8Us+ZM/decliTRf0r1MBBjyqyK8t4Z7D34qCqetMs7vTneh8
 4N2I2GTtaFLXvU7l0choncIZ/XApD+Qoe/GqDKd851n8BtSwqD/DHiu8Oqrsi3ylkxcWnbIVgY3
 9+ZPURaNV+9QgVByFrGdyXs3658R463Kswk5cmPhuop3nnQ1SB8TAQab/R11PtQ4C7Lqbj4tHp6
 6hqqaMma9QMXh4/txPHxcr3/sIzs8tfniTCgkw/zdTbnNbSYTPQtISgVq5GjQTyVqdpQEXv2uNu
 daLbL/n3G65uYaymKX0qeS1iZs/wiCpAtQrhsZKrgUCSHxaYVsrfduZDA2BhvdtqWQ0Tz6WdpqH
 OJTh9hnHHzm0gLfBxWvLqQn2QAa7ds27WchKOz/Ym2OT8dRXvuj7glIIx28b2Z9dsHl8BwqmM43
 Iyu8kLPqMRJpMrntlzhrWl3r9+DzABOhp4vIRgdDcQ4HBurkj8yROdpAN1J28bfS2EDcNgIfcAt
 X8nh/aF/R3cyozKGh0XnPpHOiqHBipZWUXawprAvFtgVCosxmYai9RgCDKmlIO454H9Z6V1TI/v
 jq7YzHjA6pcs+j+o5cRDMOzyTzS33CqOQP3DEH7gKewP7ayO1+1mEhbG2fI9emtd6ybvmQ7TH0u
 w31kZqpHyVRTm+Q==
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

