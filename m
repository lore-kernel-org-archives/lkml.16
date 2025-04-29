Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2E9278E42
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916571; cv=none; b=JPnDSs3nGOQEaJNZ+EMFoZXd2l7ewKGGXujmD65WC5ITLMN966TSQu7HP3Wtyn7EBzkvE9FYD+RVp0a31vhfI1l7aaiVNrxyRdh1r2HGmmCnp4uFwcfsx8QgAhEt8OWyxxK2+eRNtZjPuL/Vr3S3e8A8CbZPLi56rsIagfQmmWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916571; c=relaxed/simple;
	bh=N+d25lIyuA4+uDCjeJ4M6c3noZAy7mbvqBUm6F3f99U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fFyg6lZEnK1gLfEFtUny6De2yL0JCG5iFYWlQCBAF1x3oG+9tB7wSBsyPCv49AKPt/Dum7kgDHTCjWrCRUx7UpM0lQnYK6WgLHbXlcBnB9mPzWVObtYWusdTkT7Mke8Jqi6Kh/KNujaUhyaPfNQDI6bBCnF/ZovkxZCA+YyP2Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NEyG4YEg; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NEyG4YEg"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso7040684a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745916568; x=1746521368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOHk0EcvHS1m6pI1CWGPH0pDdJT4Hc9pp689arLCCW0=;
        b=NEyG4YEgDPNvvJIt7SwQydrWAwvUCtG2Lr4u7JOvp3gZFZw+oLFJsQB/9nCQEi4TtY
         EDEopsQMAVLYGNMWhej03JWDTun3phkNRlQi6PhGQQN8tnK8ie9BvelaShBJ8/+ej14H
         wMrf/jAkBlZCZL1bqH+kF5RUiDO+MEoGAJpoikhTnIAbsgMv5YBCvq11zlmBeBaKZf8T
         QVF2rWZKrSjaIZDimlYt6HECAFTvSUTbuSGDZJcLVMyU44soXsDHDjbYahdgnrPbKcsr
         jS+Fp64GIv+14twh04SESA9pPs6IJGWAoixDmGrc/H06B4oKseOK4jowysAAg9HCGIv3
         7PNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916568; x=1746521368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOHk0EcvHS1m6pI1CWGPH0pDdJT4Hc9pp689arLCCW0=;
        b=tzUkGQcH5j8iZ7epTReK0rV389+u5bbgcWDa/2LF5G2M6ZHc72AWY2ae6PfY2J0fsB
         hGASGNl1Ddpx460UvGNm7Rd2Y/Go2/BAmrPPx6O4+PL/AJSgY2wuXyRxyW2nlnti/ffR
         +2JY4RpBVjVkXyvQKZBj3EKXujk8FVhUqQVIG9oEd+J2jS/NCLCxVKcWaayQlI4pC1Hr
         3+zxWPEGu9o8AWShLpVrOO42rwKS0nT3dDNOGGQIXSzAYe6koo+C9IRTQUrhaAu32Vk9
         wNry3vg0LLUHBUjtM0+E3MclBqb03Z1vNT0O+8XGM0GBRNVVnlcNt5WGYxQTMAO0Xawh
         WgIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnksPiZ/hoi47DW4vd6f2SpwKHb+CMi34VH1eGSPd+ks/Sx5BINmxM0qFfiwreS4pBcxTy0mC2TLzLxXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsvMD6MC/wJe/9WvTrejHX7yyrxSG8RfPof/62J4r0PKyuk+OE
	+5XwC6sHrBagBK/agJrQMTrQJvZqlWMsqfM7NrFQE9f7smvcvQ9pJZKZaO0TUuI=
X-Gm-Gg: ASbGnctvH6TG3q/pTHqZoLvjOfyXzri4JLSausI3FoVAZToEkG/odqWeTvbVlziFCNA
	U2UK1MDScgpOfoSYKPggiiwy+WZ41z9DSDqy9D7WYsVcT3L+WD6kXLV2W6EWer64/+XhoIC2mQS
	J9y9tM+1OMxKrcl3T0Mj6qD4K2GEhWrXw2DL+J2troPFiDFPXWyjrTPG9GJE2HrpjgiRGJllJWR
	S6qAl7+rO4iv8xkCZTlY2SNhqa2Et6xQl4lfCIDP4WWHxUjKItn+sNBDejoz+hAgytu8KVk6RWA
	lXsMXiHQVcc1mpNpvUzsWkc53sZBr9iEzXllIDffnMK8GEFBh4t15xLpa4Ng/MkpqNb7dVBfecc
	+XGVz6gRrQi2bZ97UvbNcgsG+8rfKY6rD4pQ=
X-Google-Smtp-Source: AGHT+IHXapYhYNQRO/RaBffrKQEMjGSVNPTmRkoaa654MIwJC23akNlWVNoXM5sb6eltRo6RavJmhA==
X-Received: by 2002:a05:6402:51ca:b0:5e4:d52b:78a2 with SMTP id 4fb4d7f45d1cf-5f839b22e1cmr1914271a12.15.1745916567896;
        Tue, 29 Apr 2025 01:49:27 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7ec0e6331sm3546619a12.78.2025.04.29.01.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:49:27 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 29 Apr 2025 09:49:24 +0100
Subject: [PATCH 1/2] phy: exynos5-usbdrd: fix setting LINKSYSTEM_FLADJ on
 exynos7870
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250429-exynos5-phy-field-prep-v1-1-39eb279a3e0e@linaro.org>
References: <20250429-exynos5-phy-field-prep-v1-0-39eb279a3e0e@linaro.org>
In-Reply-To: <20250429-exynos5-phy-field-prep-v1-0-39eb279a3e0e@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The code here is trying to set the FLADJ field to 0x20, so it should
clear any previous value in that field before or'ing-in the new value.

Fixes: 588d5d20ca8d ("phy: exynos5-usbdrd: add exynos7870 USBDRD support")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 634c4310c660a50e5d0869645506ab1b64fffd4b..4ea1fabd4d6f9c9fe412f17d4d26be07724b6361 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1186,6 +1186,7 @@ static void exynos7870_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	 * See xHCI 1.0 spec, 5.2.4
 	 */
 	reg |= LINKSYSTEM_XHCI_VERSION_CONTROL;
+	reg &= ~LINKSYSTEM_FLADJ;
 	reg |= FIELD_PREP_CONST(LINKSYSTEM_FLADJ, 0x20);
 	/* Set VBUSVALID signal as the VBUS pad is not used */
 	reg |= LINKSYSTEM_FORCE_BVALID;

-- 
2.49.0.901.g37484f566f-goog

