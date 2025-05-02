Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5375223DFB
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 06:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746166857; cv=none; b=DtaDVH7TO+EXkFmngUeraYY4DcpHhGIKEbdLAolvd00tr34lvHdQsWPfVlUS2MjNvgCIn07paUsHmq2ogbD7a0ux+XcVgPDKN542v7kPgs62ZzJnQOAhrefPbgJ65nh3FW//ZMRM2Dcybm8hkbOkKTEdcTLXP4sA1PAf9vZxJUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746166857; c=relaxed/simple;
	bh=Oq6tGFhrRxkmZMhP4r8iY75g4HVuYxbGocN5n42gjTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U4KzFewIyWs487lvmo1qsJvA3KnizeavYdIVRuCpIXYoFGkX/Vc38Maa0cju4LoDI0/LZqNcC4ACRE+tLpJBfsp+Zx4H8DS9cQa5cMlegaeOMkZan6okAGaBlt+T75UP0dpc6XwTJR/nsK0Uehmwbex2bkm0qP0mGiifgScj86k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xxirL7nc; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xxirL7nc"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43eeb4e09b5so2400645e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 23:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746166854; x=1746771654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ucXzGbbSSpBHzZPrBdGJRZzvgP5bTwCRraWT2PcjgY=;
        b=xxirL7nclOtHTmfL/6bk3CTDPTXwMnFQ/KL+cb8wOJUgIyn6CjVsWlK/uohrC8AYgh
         chOO7VYrzSkx2aPh4CeulIox9gUX1/cKhpQ4NLmV4dCA3WNze1NIz7KtlIgRuGuFiVR3
         3Ssgvk8rezcsHjIBaxp5oaCsL/69zSJlsdLq+zDgopBDTFV2rI5A9N/7dkGvBxOHKCRs
         U6S6RT6kkeQqDU23hm6QGFIjuyA1ZY7ofCqUT3ncj2BcvT+zlXsTyk57bdyU36C3g5WT
         qUbYHCDJHgdHnvLCSsG9jqSy95uZMRh8zC8nQopByhGEHNDfuCacEJYWKwWtPipp7jKR
         Qwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746166854; x=1746771654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ucXzGbbSSpBHzZPrBdGJRZzvgP5bTwCRraWT2PcjgY=;
        b=fXw/GDGNZnnKmI+6TgxhlcGReY8KLyvddC679ZkR5OFPsIObUE5Obtt947ztHrfwFq
         Kgc0586p6/aZ+XsmpXESKrGstJfgi6+KIeV/F6TmRoK71sjNOIrk88u4vcNztmutGOi+
         +sciPPVjyJw0k8okU4i3LdQZ+YxLPduZ9J8Iu37UrN/YjDCONEjBI2Yd9jUVChAcugR6
         92M8m2NAAiK5G71CNXbzw1fI55DumWLC3KVh77lfD9k3cUaRR65CDaAj/2JD7WWQZims
         9ekOWZId/7ER9pocXGp4Y/BhOGSwqI04UTyye2a4TrzqtM53+5L6Ifw+GK1JCzbN8PCK
         a6Kg==
X-Gm-Message-State: AOJu0Yww+13qi4GR/Bt320JUBLpTnya1XXESfgOEXn3ZJ2ah+VukNNZK
	Tp/wjWgRclb0W9AJt/Xl8NIo/bNeXYlFvWgbC9ctEoCBW31U8t4O4DgqY3LDzX4=
X-Gm-Gg: ASbGncvjop0dXDj8rbF89CR5SWTt76RuQWRcNW69fhbgH1E+uiK4S37ebggRkk+IObk
	U2P2PWGTJgHYs8o0zAb7NxXCuzasGrIPoIxQLO5P+Psbzp1utCGIKJu5O5ad3JD/fkM6D4AAuNF
	azLAc/N066DQHElCu+MsFV8MGsN6afDk2R7MMh8CU1dzuGB+PjTGkxqMZ9nrFLSk4LPWxaa4Mc2
	xMSfFOXGj2okm1vxCBJROyTnbSe9pre6BwkdO3RhAUvB2qDmM+4LONW0Q5m6XHfWnHf3hlZHh94
	3AMmPJaCyMlf7eNLSMbC65T/PuVPBi6TjNGiO6GZXVXE5z4bVZpEPR91+ow=
X-Google-Smtp-Source: AGHT+IGLz6ekawhHw9N1B1GWaclOkg857FVulUieEikK2OtvPtQqSHJ5W9o6cJakXXwMyQpg26Zc9Q==
X-Received: by 2002:adf:f78d:0:b0:38d:b090:a0c4 with SMTP id ffacd0b85a97d-3a099ae9b5amr244096f8f.10.1746166854024;
        Thu, 01 May 2025 23:20:54 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17748sm1159725f8f.100.2025.05.01.23.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 23:20:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 02 May 2025 08:20:37 +0200
Subject: [PATCH v3 5/5] cdx: controller: Drop unneeded driver.pm NULL
 assignment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-cdx-clean-v3-5-6aaa5b369fc5@linaro.org>
References: <20250502-cdx-clean-v3-0-6aaa5b369fc5@linaro.org>
In-Reply-To: <20250502-cdx-clean-v3-0-6aaa5b369fc5@linaro.org>
To: Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=819;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Oq6tGFhrRxkmZMhP4r8iY75g4HVuYxbGocN5n42gjTE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoFGQ9dmNTK5ge5kEzV6gqzUhYasezLNcIvoFwG
 zUjg1j+owmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBRkPQAKCRDBN2bmhouD
 16mqD/9nq2dsdoQwbdXqsyh1r7eBeffe8FW7qffJv/+gT6mh9q2lSGvcZfMC1Hy4Q3Cbe+qeOdw
 XJfN4gv69JWaM3VYQBLoltzkK5ULaiNQ+i0kZbcj63bAzwe8fHTUcf3/hTynFBBmwj4Sho/d5m3
 2FtKimfYePKGOtxZmUny/y0dPUpS1aIIjksb8TAlBiP34aE9f6lz70cWheoLcQe3S+LNuX72BRb
 BPh08RrIrmBRKwyeZsGR6+wZqRL5xIoTB0WWHJpFyl//9+YdI58zB+ZgRGqvv/uamd4n8xBmb+0
 6uF31uaug3wY4taeQrOVdfQJs4NWRL2D9B9dFvmdFpLTVWJTi5wvEINg3Guz2mEGTAfdFX828Lz
 3GSKlsIVNnobgO2JrtKKGDUQYSQktaCYIDy92FbRaD8Lc5tPUsrWX8tX9ngnxvJDIL40EdSOQNx
 Q32wStUmhnJJSJuxXpdb6x+T3yBSsU6SdG8ibYNcX+pEPr9GKa5331G6yv4p3KzphxtZNW4VN+t
 fMj9/7EvpMf2iXjNlrhh9YMUA/XR2G8jJqTqFf0LtyUOrcdqwIERKQh7M/g53t0Uu2OAIFN80vo
 CY0jF+uh4VsuLxzIJ4V9E2eOtC9dzf8SvP7zv+8ie+6pMmCtT4ZxNYmVeauIzbD9WQroGB6ommN
 hXj7TECyytbGLjg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Struct driver in platform_driver is zero-ed so there is no need to
assign its 'pm' member to NULL.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/cdx/controller/cdx_controller.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cdx/controller/cdx_controller.c b/drivers/cdx/controller/cdx_controller.c
index bfb5ac2d861f2708214ae28922a7c0cfdcdf5cc6..fca83141e3e66e68e6916077833db2b7d816395f 100644
--- a/drivers/cdx/controller/cdx_controller.c
+++ b/drivers/cdx/controller/cdx_controller.c
@@ -243,7 +243,6 @@ MODULE_DEVICE_TABLE(of, cdx_match_table);
 static struct platform_driver cdx_pdriver = {
 	.driver = {
 		   .name = "cdx-controller",
-		   .pm = NULL,
 		   .of_match_table = cdx_match_table,
 		   },
 	.probe = xlnx_cdx_probe,

-- 
2.45.2

