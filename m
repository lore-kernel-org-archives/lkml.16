Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8469022D7A1
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 06:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564099; cv=none; b=gYUqPvLZIyLnsRVkGUCxj5hTmBfxSnkuq3H7tyXXrGrgIOjFt+djeUQjNXUNp4Ps4YFG9fkJtxU1KGlYRaW68vMkrfuP1iglu8NIkQbYaM0vGgntS9gEcfZphsuaJw/vhTjXNp2vzZMtvgFl95wUz6KL0phHHHOV7Nt3QfzAwu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564099; c=relaxed/simple;
	bh=AuIYf6cuEPM2I1pj5QmyT3WTpVD+4qPkOEdINsIPKkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mrqX2aDL0iNQfRO12JGKOfK9CJv5VUzzLfdSv8XpIcQzuGObvCYQggaP7oSNaAXm69E+db5q7/sGPdTmjhq8svX/DPQ3qJG1lERpQobzQrMPBtjph/E42LnozKg40PbjZnPbD3lObuYfNKv1HyAOLjnAzRWdEYjvkyVFhXLJta0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fynF9LD4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fynF9LD4"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43e9ccaa1ebso2176335e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745564096; x=1746168896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALjZo4nsA5qjfQOan39po5IsHvWCWo2OF7h1r4+hFaU=;
        b=fynF9LD4Grk+UzL42ZJ82NVzwPSyQtGaNzyH1xk4FJSN0evn/jEx9e3/kORXscGl+v
         L0egMSiD/GuDQi7PxNGEZW0kTAQykcjbtFMaVI2WDVBzgxBjBevNkqZh3bur8xLmnxNi
         lcdGFYHJyThw+yTIFv0XfSauTYyF+fSSPDZbH6wK5TukErqRJ8a8bJQHvGiWG5Fe4+Od
         6pH7WrvhaTPL6GrMin9GJHvNMyP3BTGPTUcGIyolVwtXnCPnEvruvsBNH537lOKy7E3N
         EKUjlETju/IbtaOoBUUOBOkd+FoBH7ZsUrUG0LCpGudiDJ1aQNfNaYrnyUqjTHuDhwRX
         C+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564096; x=1746168896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALjZo4nsA5qjfQOan39po5IsHvWCWo2OF7h1r4+hFaU=;
        b=j7XhGecRkZIoQqVqJijr2+uSUlIQV3SRGR+cba5BpLoinzIxHf8ws6sDL3i9Tep95y
         vyS9aAh5Rl9nP6s/lDKyuvPCV0vaybXG7c8VGcu0aOQw4OQeT8QOFf7HCwY9yu7PbE2/
         WpOWpx7++CPwn49Z0uT+RJajxYpq+t/q/IBalIvkSRL9XMuRWmUW+rg2vqqAiCGIu0v/
         KDmLwV2g7p6c/x6eHYggfD7MtNB2QfF8aiSV1pLb3el4Z+a2XdIvINHomGh41YyjU8i7
         +t4ZGaWkBd4dAu//HNjJBNjTs9Fl5kiwPGaPLcsMfid48Bl5tAnQAZKTk4NsCSeVtxjW
         99Kw==
X-Gm-Message-State: AOJu0YxXhGv3vhiig+dSTnVs1GlbyrpxDe9ZXRAYuoQoWSs2pK1Fp32z
	W65TOjaCG/7/qh7CaNNnhokDIUvCcPNRk5NJD8EdpxDU01GAG8ICd1sygkjMOeQ=
X-Gm-Gg: ASbGncupKdmKHs9jLe6ianC2o2Rn+/uxYYViRmA5vFVFTmfJZGURFMKs7SoOqOnh3lG
	BPhFjvxCJnbTGi3mul0p7JKr+JfJXvStOFCToX0UYz1IU6wW/w5iFsnCF9clWDvYgW2wkY9d9s2
	++Ond7tH9WTll7pqUfmOjv3omJN6NX+8jQ8LKOMQFCD4maoOKWwln0vzRdaMc2YFyoJ/DEru0k8
	9Gb89doL8H+I/zpubheKEMEV8d1gNb6vVTSyjB9Jb4J5XKaJUZ5Zhr2wdXfwk1Nu7MOnWUt0mSE
	dfnt+bJw0zHVCb1JOrF0UhgFOfpiWNHkxxlDGB3ZO/2WanYwVwwgvdaaR5o=
X-Google-Smtp-Source: AGHT+IEC+v7fz9eu9VPT41HHxda/zWQ8jH5iBK0aVC4KRE7b/S0RXnfV0Eg9Dkyx+W5+ieAMRYak5w==
X-Received: by 2002:a05:600c:1d9e:b0:43b:c938:1d0e with SMTP id 5b1f17b1804b1-440a65bad64mr3005675e9.2.1745564095808;
        Thu, 24 Apr 2025 23:54:55 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm14369405e9.7.2025.04.24.23.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 23:54:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 25 Apr 2025 08:54:39 +0200
Subject: [PATCH 3/5] cdx: controller: Drop useless probe success message
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-cdx-clean-v1-3-ea2002dd400d@linaro.org>
References: <20250425-cdx-clean-v1-0-ea2002dd400d@linaro.org>
In-Reply-To: <20250425-cdx-clean-v1-0-ea2002dd400d@linaro.org>
To: Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=AuIYf6cuEPM2I1pj5QmyT3WTpVD+4qPkOEdINsIPKkE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoCzG32p8/1Pk6cRF23d7+VW3sq+iIsx0Jljp8N
 TC2UqzN9QOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAsxtwAKCRDBN2bmhouD
 15i3D/9QQxIE62r0Dxyc2knipZ6kSU+713AaSySwKUvTm5cJy7NLRKGBQVrJWqyC5fBu1uKsKLf
 fsHaPn0VZcV4oFWEXe6sVJeplXpJTKOSrpSjGy0tvg3bT8j1oVmu8SK9OONHevgBY15H4uy1ZZb
 Jrfsreai1AUzX9yD+hAyJQo+PLw0muVghsLbIy1RjJY1flfFmXX5LsvF0jfgs0FWWxFtmj+SWUv
 qVQPFyYkKK8aSe6BoreyyG0WU+m6+eXzo8X6NK6ch5N04OeX5FZ7BfvR5aBfclRIqOlripCmt+k
 MIRcuOt/zIhWuNRLzkg0fuvYZDtbFTgRW1ONq5IX2ZBA/wn5s74AC2t2dw+WEMEJDww64RhSuKj
 T7mNrmmuzfnOlzKNT2Jmk/W9mej3tF1swrnephtM/AVXbw7HibpjBEuNWAsGfqPsfvD6awb/DJc
 xH4cPprS/UIzQVxuNd2jhQeTJBQ2xirxdFr4ilx4qtegdonHOAM/iNqMCXyzeebEgFoaORir6gy
 Xtd/k06z4Lg3oKQJ/OLLPBv0tnftpj0g5dxy3BQJfKTopHdLvRmqH36EhZFTq8qzkgN+Loa1mvQ
 7Zo9rDz+QoeoMIiA/mnD1hd5LgWixeWlzMhmyDWAHxj9bkCWK5a4UT6Aks7Q+tjw2amb8/wDKja
 zjDOAX925Iv0IRw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Drivers should be silent on probe success, unless they print some useful
information.  Printing "hey I probed" is not useful and kernel already
gives mechanism to investigate that (e.g. sysfs, tracing, initcall
debug).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/cdx/controller/cdx_controller.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cdx/controller/cdx_controller.c b/drivers/cdx/controller/cdx_controller.c
index 3df35833f0e0a994af0606eee0dc1dfc9c7c22f9..fce90926d3378ae60166426cbf8e4a4fe014af86 100644
--- a/drivers/cdx/controller/cdx_controller.c
+++ b/drivers/cdx/controller/cdx_controller.c
@@ -205,7 +205,6 @@ static int xlnx_cdx_probe(struct platform_device *pdev)
 		goto cdx_rpmsg_fail;
 	}
 
-	dev_info(&pdev->dev, "Successfully registered CDX controller with RPMsg as transport\n");
 	return 0;
 
 cdx_rpmsg_fail:

-- 
2.45.2

