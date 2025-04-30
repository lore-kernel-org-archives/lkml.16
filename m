Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F408526A098
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038511; cv=none; b=P841FuWuDjz8Yfa1w/zlCSWJfg5HWw6/l6kdOBOfeNLaYTfx9m1IAMA5dEFdOVLgILUbhCUN789PY7R5UjBBMRZuaqbqdLytvagqgQKK0U071U42Sm11ekHK+YtwJj4oNTV3XGGj4VGIWc4YvwG24ZaW9lWRJGP4Zl09D3MG1ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038511; c=relaxed/simple;
	bh=AuIYf6cuEPM2I1pj5QmyT3WTpVD+4qPkOEdINsIPKkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FHhl1kfOx7o9JiCgV+sthow+un0NVm+HO4LtfKUMmlg5HzIB4qz+opdeNM2Kae+j8IzMnyhWzl4RGiDJW/fqfY30JeQSTS4vmAXRgGdMXilciHEPopsXITbZJfHzBhgp4JeSl1m6+eFIas/66V4LZ0LykvjgzqsbJJvvNbtG+vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vH7p6gvp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vH7p6gvp"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf861f936so246405e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746038508; x=1746643308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALjZo4nsA5qjfQOan39po5IsHvWCWo2OF7h1r4+hFaU=;
        b=vH7p6gvpb8vauK8wU4DXctIMwuaMqcjSE+Fxico8W5GeQnMIl28lo3UBMZ/GyXxJf4
         uG99t4ijKwrX8Q/fl6LEV4pX7/4UY1SWE1LNmHfPZ/bC7+lXYMDkrhLVAFQgxkOrEiUm
         AmaJMi3mTkxWQOgiCQzCSw50HBStCHl3Dh86KWrj7mVQ6tSJEdY/D7wvY4y2NF5v8Vd9
         SE7BIKZwrtCfo8bUQsjtIKLEP3KPixcZpWuKOcaQFAF+xjLSIv+gw4kpJ2EB0HRItnyi
         YXcYGUlUOykVLrNbLXbUG4p5iWb9gJQ+E3swMCck33FJFW4c+DG5ioRQeRfN8dwAOgAw
         Hs7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038508; x=1746643308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALjZo4nsA5qjfQOan39po5IsHvWCWo2OF7h1r4+hFaU=;
        b=dfwPsrklLa/rVtvcmqWJ6rjaStWYOPNoNo4TYfNoRGoysUnW69+IRgTAQZcqpUYnQK
         MUk0KCefVtSDrFQXrark2SXsOuMpZnY0nyJvU4pCiltZnYoyETQslVmqwgnT8j0PKRoF
         cPizzqbOAiLUi4KhA72//zGalYzkGshRqiz9i2VGwLUH7nUd0UHxJrR1NnKZ26r4mXfr
         7dnGh4dd5DKaM9KzIcieeK7Kycm/9cbgeVojXysQZOokI6Lrddq4lLtUFoCR+JA4SWpW
         Th4BOGi9LJ4WJpes4gxjp1n/4IOJ/qcuIum+o1W596rTzIdxnQNvkvxyGTheDVgWm8M6
         yQKw==
X-Gm-Message-State: AOJu0YwhqqgeIDeulERgj9QtK0QQ/8nJUGhTVdT88X6FH0nqS6qjP9Ni
	t7FcZmxJdnkJmQGzk0d14tdvcXQcf1qJurNB7rPNV/DoXQDfuRFlDJ9e46k+nNc=
X-Gm-Gg: ASbGncsvY4GLZcv89JSQ+wP79iQnJCsSSJfldwPJzV0ibSLXfHjTmJuJ9yzFYCmnXFH
	2FlGAsW4Wf9FaxrbYFGfqJhCW6RVulThYpwe84aaDBxgyZI5uecxLwTgZYj3HL/XEV4DdiHob9d
	+MOBxUQOs3VqOMxRVRMVcO91jVGYNYWlbZNGZ0E2Kzdwj4Zir9TV4GqnfLXDFeLTrn0u8KnJQ1w
	4WhM/Hwq5V6dxhfcVcp80HkGx4pZ4ovHIsPdA14pGbnFVqY0DqNhkM0/o664NPhea0s+mv/DAVc
	cH167nPAONyir9GKOv9Ob36O+Z2gpaAHAGKFD8UWSAbA4EygldrXANZbfSk=
X-Google-Smtp-Source: AGHT+IGhQdWT4f7SczEqtnyrmvQMjCZQvL8/IXKl7/Kl48gPc4zyA3uLlLktKUdJiqhGQM2apz3BGQ==
X-Received: by 2002:a05:6000:2906:b0:39f:6d4:fd44 with SMTP id ffacd0b85a97d-3a09009b823mr1173916f8f.14.1746038508203;
        Wed, 30 Apr 2025 11:41:48 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46257sm17728991f8f.77.2025.04.30.11.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:41:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 20:41:31 +0200
Subject: [PATCH v2 3/6] cdx: controller: Drop useless probe success message
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-cdx-clean-v2-3-7dbfda9364a9@linaro.org>
References: <20250430-cdx-clean-v2-0-7dbfda9364a9@linaro.org>
In-Reply-To: <20250430-cdx-clean-v2-0-7dbfda9364a9@linaro.org>
To: Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=AuIYf6cuEPM2I1pj5QmyT3WTpVD+4qPkOEdINsIPKkE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEm7iLxrwcyM1V/qLg4N9vt4BbEnyTM8pbDDQI
 6iN4kH3rMaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBJu4gAKCRDBN2bmhouD
 13TCD/41fyH8gAx1KVj0viheQr1usUPC87I+NHSWfCJ8257gBSdZvPnbA3zXsXwLuXZi1oQAnZf
 48ipce35IpiPx47WOcQGoRl812+Mo3UdVlCYY33ReNJ/YET2h+ehGO9CWaclMPfZK9qiy3gKG7U
 SN8mvx8Jy1REbc2CgEnM/f/PHgNhldoknyb5N9qg3hzj/KFlzmfeImpbgQNpmbQcn2gv1j0aDsD
 Vv8c74PzcfA5L8kIxdLk3xugtWaUJl0UJj4g3XwWM3wGRyd/cPN4HGWZDv89OeB4mHRXkWPX8JM
 omRBjc7IYisoF6YH5FbrQoVJulnko6ftUNKVNCZ7k+pfRJxX88Husc7NuTDrbaJ+XrSZ0fD2ajG
 WDLsoYpIXulApA/yZPJiFNdZXhKowX3/chG0l2byCG4RWlGqgV5ic9qwr7LRAP0G708WVXSJhck
 bI5CqHjRFCmnnZaszvy/z1RaDtU5pLxEe5rB/piqhcdw+MbZjF4gEsD0dz0ROdWwSTe5zkmnPTe
 ishFxmEIZjEkvxZQqDH7d9NSbZwVcfglI1GOzJJ3tvsBneEpCpdx2KP/YTizXIS4V9NFJK7UDXv
 lcftdJJrJ8323KIqtvcctnGaeOko2FGLqGsOR/MUWA9gKKOLw6f5WnItToF6IEj+HkOONixhE2X
 Y8uPKdvIF8ROpMg==
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

