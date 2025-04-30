Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4BB270556
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038513; cv=none; b=HHl0MHIyS/xR1dKRHLWiNwjbFO4X8MhYD1F1+gwy/U7WDUPYpz7b9YXJ5icDO0M98jninKwIoCB6R38rECMsex0LJt0W84NFDfqEWVyMqF4tUFCY0eS6AUal+bhsZDif2WBnMypMQeX9ykPUPPq1/gsynj7RV85oujIoeW+uRqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038513; c=relaxed/simple;
	bh=lPWy4bOLyUZ+9BmsblQ+hYim7bIM9SUYPuuB7xK9K0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GjCsAEkmrra0hnDgCXuXcEWqIr+otPXIQWXvTMaEPqkyHBWqq7aOMvNWkt8CzuaNE9b9jBo13NRm37PaX9Nougkc8U74fcBvhdBVN2roZva/1HrRua6HLM5X2Ighufhz0w9IxdmDhc9rNkly6plrV1Tl0KN+WYtsb10LxQQIytg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E0MLOaEv; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E0MLOaEv"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39ab85402c9so1190f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746038509; x=1746643309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dhEFQGpYf0nHWdlWr5W0WRnazrmSz4hEICnVYSr5qM=;
        b=E0MLOaEvJTONV0fmqvBoATgVcM90NuyVQ0rg4p91a6z02WSxl6RmiXpQB4B9TfIxqA
         +6EqipeDgcIxU3bG0iST+aHF72SuNg8D9B2EvOhuR0fkv8lPNzClEdUvSBnTDObEvYFO
         JWdACXTrkPcc07wo9v0huk9JVzp4nKvs5tJY4h4UYxNtTiZRHW35Zmbs+xiO+7QTp2jJ
         yJJaT4yb1QVirKBdA/sKRRoSGXcIst9jYNUA6H2PWEXYlPLLY+san45N6BeXlvshEbk9
         K5XOt7WxfQ9y3UxnhzuS+fnTOAM5KBRV0lMRCRaR8aH6kmoU8iCLR8EtkR5CP7E+vUW5
         hL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038509; x=1746643309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dhEFQGpYf0nHWdlWr5W0WRnazrmSz4hEICnVYSr5qM=;
        b=K9UR0ET9vQTTP9DViruXJG/+LDdKYVWtOmQSqx0BMwpqfYKfeoDmNhVI9JVXXVA/3C
         WntvdOWaCnptkFL8TidyeR0G/MmDNs/FhO2/Qk9koKRwWj0TJXNI3a2wNENG2GgEzFw6
         B4ysXYAsxltMBZghHj0P6CUfEiTU0qhCos6TuTny5JZtUn9/ySzd1qevaZB3QPQnC7aj
         ER9faiKGJfcov1C7Xkv4cBxhO1/qWPYfZMfS4H1fRtPc9CmY18Z5PyxHaAdKjnc0gwA0
         u0DqfUYAmCEIrIe16HrUCEzPSTYYauEb5QkXGfWwfEH7Gu0KdtGvbuE3WUM2v1xL38tF
         h8ig==
X-Gm-Message-State: AOJu0Yxt0Ru4HHK9D7jXAGtH27ZbqivC8uvw2lk/Q/qpeqANMQlpncdi
	FmOUdtvbdO15y3weQBhJhmQX8xkpjRszIiPwOtBUhOf1J0jLamchf6F4kUnbXNg=
X-Gm-Gg: ASbGnct9qBEMdSswp/feHfglPkeXjYlJZdOE+HU+oaUAsjrAktgCyBMurNofa1f/dEO
	vhBogxmZ62W5kLCHrpSKFCliXtUAQlbg6cZVRWBQ+McHYI1W/SZCxQvIdzvkY6KNnQ6V2S/nQNy
	YOvtbGrsdBkUoyxzhzm/odd6SxQwyQJMh4A+9NdNohytGnQam4jZZvV3bkaUN5Qlw2ep2U86Ilt
	hEFpsA0Qul2djUJjvXLyPHAB6mf/hAVDpTu4dxFYE7mOFRrvyBRG5muPOB7IarE1mLgnRFQAvS3
	1BM6CZ9paSRzjbbfHV/+NcCxyPbFav6Ly1BA9Jqo08M9cUYg4cZPHoj34j4=
X-Google-Smtp-Source: AGHT+IEIWNDKbFGFu8qKyHg3SpGUSZ8GwlI5Y4p0eqXgCC1gkfd0c1LsLe0rOYe81LudANN7VYGPTw==
X-Received: by 2002:a05:6000:4027:b0:39a:c9ae:db5d with SMTP id ffacd0b85a97d-3a08ff80b89mr1128240f8f.9.1746038509491;
        Wed, 30 Apr 2025 11:41:49 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46257sm17728991f8f.77.2025.04.30.11.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:41:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 20:41:32 +0200
Subject: [PATCH v2 4/6] cdx: controller: Do not open-code
 module_platform_driver()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-cdx-clean-v2-4-7dbfda9364a9@linaro.org>
References: <20250430-cdx-clean-v2-0-7dbfda9364a9@linaro.org>
In-Reply-To: <20250430-cdx-clean-v2-0-7dbfda9364a9@linaro.org>
To: Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1226;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=lPWy4bOLyUZ+9BmsblQ+hYim7bIM9SUYPuuB7xK9K0A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEm7jcorE3P6BnjhUS/fJ+WEALi+bhe3eB+wq5
 c+t2Ml8pzSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBJu4wAKCRDBN2bmhouD
 1yLiD/wJ6zUO7pF1NKe0n9s+ZvZzs4LO3cq2bqkAQYUUw/vXZq2Z+DsG2TWbIg/SYvOM/DPj+9E
 svyA16FMACadS3vvIz2BhES0AvP4TeIxfUI4f7ot6oq4rK8SB/zH4EQg7h9eLVqhe6FC6jq9o18
 cmcj8ZkzKUKXZ3q53QoxPwZom1ZJOlhCyEFyrHzapbqNE+dfu18erVGELdklIfYPOx28xG5TUdA
 ZmQwg0e8VRq+kNvMX7uZtfUHlpZPmLALcgHEAkLxZ7+bb66xN8FLGCcLsoFeSp9u5Liv+A3fF2P
 qEfjkggov4ApJmqBWeoZuso+Be2MPEP+dOXeGQXdPh/5LVW3Xkd8yegJHHgD/erjAtp3FYQ+WW8
 61ojgGdHLF4ySmHhIWntzs/y+oATRM1i+ZX2sktOTTkgDekyvF8F6lDtnwJj8y9IAmxGH6ozYvl
 Jiuefl4YdpWa4sO3Yqk9xMWj5fkCcMeUlmBFfXKY8N1dZUXq29OYD0FWSICbgj5UJic+/HdVTfW
 i48P45ODEyonVK25jBPZH4934xOSNcwVd5J9rghKpIM8nj3d+PPMDUJtEW899a2OgSxn4/dUq/d
 TlEw8ZOJ4Kc8muiRUujNVDGjqnxAMxGL1o/9ClOmsSYaQVxE2BdofsvcwsjvCi8INBN7cqRqnbO
 4WfaG2H7+mPL1uA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace standard platform_driver_register() boilerplate with
module_platform_driver() to make code smaller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/cdx/controller/cdx_controller.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/cdx/controller/cdx_controller.c b/drivers/cdx/controller/cdx_controller.c
index fce90926d3378ae60166426cbf8e4a4fe014af86..bfb5ac2d861f2708214ae28922a7c0cfdcdf5cc6 100644
--- a/drivers/cdx/controller/cdx_controller.c
+++ b/drivers/cdx/controller/cdx_controller.c
@@ -250,24 +250,7 @@ static struct platform_driver cdx_pdriver = {
 	.remove = xlnx_cdx_remove,
 };
 
-static int __init cdx_controller_init(void)
-{
-	int ret;
-
-	ret = platform_driver_register(&cdx_pdriver);
-	if (ret)
-		pr_err("platform_driver_register() failed: %d\n", ret);
-
-	return ret;
-}
-
-static void __exit cdx_controller_exit(void)
-{
-	platform_driver_unregister(&cdx_pdriver);
-}
-
-module_init(cdx_controller_init);
-module_exit(cdx_controller_exit);
+module_platform_driver(cdx_pdriver);
 
 MODULE_AUTHOR("AMD Inc.");
 MODULE_DESCRIPTION("CDX controller for AMD devices");

-- 
2.45.2

