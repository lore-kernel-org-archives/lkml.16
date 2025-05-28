Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DE228E5E5
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748454300; cv=none; b=qL5RP6sF6tayZU8pK6TdcGphjz03My1VJxS0qRASSBRJqQDYwybGpK55RcAl0l+ba55CtHCr4kU8txO3osBg3437tKlYoysKxtQ5zkiXUrL74bRml08DC24Q67QxsfASg+k1KGdqlCDPxNk8DWJxyjHMGxbAYqNBMuWMp/Op9Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748454300; c=relaxed/simple;
	bh=CfKoB+H1EPnWjDF21p5ashefuOfjHibZfRb+hSdfnhk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xc6HuSEFBoYvjIr/WxGnaRgeKlDBqO/Rkr5jcCIAZjttwheAqLjUN/bx2ObvIWALTZpRr/FiN3PVBmqZgW9UO+ty2gCxNY1LRGImz5WBjIS5+h7jhBidw0WYURPH54aEauoo1tChT5yokah45tPfG8buCnSMYpbvwgifR+gwgyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dtokazaki.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H7mSapTS; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dtokazaki.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H7mSapTS"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-73e0094706bso6217292b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748454298; x=1749059098; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ONaoEX46NTS+RJXuxksvrbx3Hu5+s3ifCRgxz67kE6k=;
        b=H7mSapTSnL0gofCvh06sMK8fTl/ukay9zUKfNc+ews9WKHQcuw+auv18e2p9ddKJ1T
         EVoxaZHfuMPErih1oHVXx+GojpEHqVDVLdOYqYiu+4EEX+pEvITLFWboVdqAfkIgP5um
         OWMzGZ9Vi6N4xSM/vxmpSBYQO9VNTmGydzHpA4kFLutI73PJIwrKSyVeGAl7Ke68P/SG
         u9Dfo4hKLblhF/ywEJW8zl0j1LrfyhtVhNDONevEWS+o5SIo+R8G/3hKW4rU7HX1YMyL
         YxZzk+OYsCVkxdoxG5g1fcx4uPbvq+JxFRucdEeRZ18XRFK0eWD2LyP+AdM4tmui4DTw
         BMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748454298; x=1749059098;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ONaoEX46NTS+RJXuxksvrbx3Hu5+s3ifCRgxz67kE6k=;
        b=NeStl2x9pY/rjbi9gHy3y2BahQS3GvkTW3fdFTeALWpT3aItOZRBekNryXEesGo4p8
         3xnKfcJyBjkAIPPxY0uc4mL1jSq67AGZByWRngZADzNaqqWzOREpWZnpouIhBLTGCO2r
         vVkdwsFyfwDUgaljYi2CJNMXIgOxd0ibUg97qFkwoKxlJM2AVcRKVHmXb8rVcvjcEwpg
         OWTUcfxzW/tWlYYKWCw9qNTYD3/b3nwJvmYCcgkzyYX/fMgtcZ3H3yZfk6QdNY5P2u18
         fhwAgo1kGDprSLJYUh4nPPvBCUoV5U2f8DMj4nfAf9CNqQHcwnm6ABBW/pkR2hJ7fYZy
         MKRw==
X-Forwarded-Encrypted: i=1; AJvYcCV+QgIgdaSCz6fDjdTjIIInmw3t+Cpzw9icQkUzYJY8hkOPAxI1j8p2ZdtmY+TU/30ME+SJ4j/LVlkDbtE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzU8gLq4wplb2x4/N5GWAxZuIpwcAReW+Vq7ylvDrx33WkG84W
	3NCtSzH9ndBbIPrVOXnX3153FkiLRpi20XsaSDqF64TAEDcjVG6AP2CKFTghHdiEhKRobJEP5ua
	Cm87gr0MqT6F4+FMauA==
X-Google-Smtp-Source: AGHT+IHXsZLAjf8hgLHjXcnk9jfwgypv4Nnb0xnVKOifJ7lyjzN89gVF77wc7+Nu77gZXC6nZNZIOjxOBW5HLrQ=
X-Received: from pfkq9.prod.google.com ([2002:a05:6a00:849:b0:746:24d7:a6aa])
 (user=dtokazaki job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:130a:b0:732:a24:7354 with SMTP id d2e1a72fcca58-745fde79710mr25993509b3a.4.1748454298130;
 Wed, 28 May 2025 10:44:58 -0700 (PDT)
Date: Wed, 28 May 2025 17:44:25 +0000
In-Reply-To: <20250528174426.3318110-1-dtokazaki@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250528174426.3318110-1-dtokazaki@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250528174426.3318110-3-dtokazaki@google.com>
Subject: [PATCH v1 2/2] regulator: userspace-consumer add shared supply functionality
From: Daniel Okazaki <dtokazaki@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Zev Weiss <zev@bewilderbeest.net>
Cc: Daniel Okazaki <dtokazaki@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add is_shared flag to indictae that regulator control is not
exclusive to this module.

Signed-off-by: Daniel Okazaki <dtokazaki@google.com>
---
 drivers/regulator/userspace-consumer.c | 39 ++++++++++++++++----------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/regulator/userspace-consumer.c b/drivers/regulator/userspace-consumer.c
index 72bb5ffb49a8..4ab316d528fb 100644
--- a/drivers/regulator/userspace-consumer.c
+++ b/drivers/regulator/userspace-consumer.c
@@ -26,6 +26,7 @@ struct userspace_consumer_data {
 	struct mutex lock;
 	bool enabled;
 	bool no_autoswitch;
+	bool is_shared;
 
 	int num_supplies;
 	struct regulator_bulk_data *supplies;
@@ -156,8 +157,14 @@ static int regulator_userspace_consumer_probe(struct platform_device *pdev)
 
 	mutex_init(&drvdata->lock);
 
-	ret = devm_regulator_bulk_get_exclusive(&pdev->dev, drvdata->num_supplies,
-						drvdata->supplies);
+	drvdata->is_shared = of_property_read_bool(pdev->dev.of_node, "is_shared");
+	if (drvdata->is_shared) {
+		ret = devm_regulator_bulk_get(&pdev->dev, drvdata->num_supplies,
+					      drvdata->supplies);
+	} else {
+		ret = devm_regulator_bulk_get_exclusive(&pdev->dev, drvdata->num_supplies,
+							drvdata->supplies);
+	}
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to get supplies\n");
 
@@ -167,22 +174,24 @@ static int regulator_userspace_consumer_probe(struct platform_device *pdev)
 	if (ret != 0)
 		return ret;
 
-	if (pdata->init_on && !pdata->no_autoswitch) {
-		ret = regulator_bulk_enable(drvdata->num_supplies,
-					    drvdata->supplies);
-		if (ret) {
-			dev_err(&pdev->dev,
-				"Failed to set initial state: %d\n", ret);
-			goto err_enable;
+	if (!drvdata->is_shared) {
+		if (pdata->init_on && !pdata->no_autoswitch) {
+			ret = regulator_bulk_enable(drvdata->num_supplies,
+						    drvdata->supplies);
+			if (ret) {
+				dev_err(&pdev->dev,
+					"Failed to set initial state: %d\n", ret);
+				goto err_enable;
+			}
 		}
-	}
 
-	ret = regulator_is_enabled(pdata->supplies[0].consumer);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to get regulator status\n");
-		goto err_enable;
+		ret = regulator_is_enabled(pdata->supplies[0].consumer);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "Failed to get regulator status\n");
+			goto err_enable;
+		}
+		drvdata->enabled = !!ret;
 	}
-	drvdata->enabled = !!ret;
 
 	return 0;
 
-- 
2.49.0.1204.g71687c7c1d-goog

