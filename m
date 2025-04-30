Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5FE1E4110
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746000351; cv=none; b=B+Z0hjOyjuZD3hdkB1IoMlMzMTSVIEmcFZeSmDwBvhiJ6UlakCyAeMyZfkEd1dCIa00AKtgvQTz+h0IweqVEydUXmjFa541WEUN+GDFB/EUK7Uy18zaQU2/dWs1s+//Kdba126J3ITJ9xi3y61j3OJiFU6v/3wJekybEgm4CVkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746000351; c=relaxed/simple;
	bh=ZqvHfDFGxrFXdLJ27WXdmU7pM11pkbcxNPujmSlum4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PkPNxz5+2MCP53d87TTbzWXpwGlAWlA0rKtofWMlMFkdz33KXmKUgmc5w6vClZ06zketdrBh9nSPDpAqJIsIVmMLa4GXqdx/w9CiUmsL8F+gzBMmFgyXF+bdygQzs+rIWvAiShiq9Jb35m9NFX14vCbu3l+V7FN4tJtUqAn9aLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y+iB64BH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y+iB64BH"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso47505955e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746000347; x=1746605147; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fqWvU5S5lLe8ZShiLr0+11SRPt/eXf13R7SasBVI7Sk=;
        b=Y+iB64BHp3do9RGctvWSKL5JTVoEk07Gt4MxTNGwIXgfHUmid3wH2LfD1oltt/Q+X7
         TdXsZOCmFYTWOd9xqsxvoti0DJUdvm1oMStYb9LecSkQbgiQl6AuvtdKqaKaCzK4gwFj
         knzsuP8bhNvrpq4gmIUYvLq7jtH6XA3bkR8hxDBLPts9V2ffXbaJMcDEr2Jxfa7wuJVD
         biMrKtHlGjMF/SPI4wArVeak52apkJ5iSOTOFu9Q7SXa6HAFDUH4hIj+I9c+O1Q2S2wL
         uRMcLidSAIxeEUfhD4JHP1slnWrNFrILL5J24VFzS5noV8loAw4jTJdppR2R5OEOM2d6
         927g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000347; x=1746605147;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fqWvU5S5lLe8ZShiLr0+11SRPt/eXf13R7SasBVI7Sk=;
        b=oHALdrUHX2RFMOifBVHzyXPZ/a0KFnraI/uj5ORjtgdGEMUryN1S521+zH2kRpdZQm
         6lh2HkocXgQdUZpiUkMqsVSyyw0d5xxWq7jSvJQ3MtTd1UbAfn/FjCEf45fm8STOv1aF
         f7Qd11m+1QfNCxVLcNh1c7W1iTenZ23aCEMgdRNbBAlBBxLYLjGTaQlhgYetUNYEM0es
         lMOM3EEgS/m0fAZG2+EFA9hdfgS4H/VXFxuLkN0KSysYVuO55gS3s+RP1I5NtSOPgql2
         mbqhzTHwRQt6UGo8MJaDWp1Go2+J+yxQ/77HtEZO27du4ayLmUPBEPLJUpNUTsFtGl73
         7X+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUteERVEp0rCoYQ6GuJ3YCZTWifeHb+yRblotHDvVmvYvAH5R0D5dMyzJOXTJS23HbAneN1O8MUrJTW3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBnOTHmEGqRVdngu8Q5R09wIDbs6JsWNJIiz0e/fjbY6yh3rDq
	uwoYYvphUG8OURUNb7+HHRtf/g+Cxo9rFzUIZ9zbTKndV+f8gg8qM3b8az1rbvYuXYynWYAkmN8
	v
X-Gm-Gg: ASbGncuS43ouazt463NfnM4Wo4ZdMQiUtTJ5uJxKZPaBLaCFnUv1Hsh0LcNoYGhAyi/
	1NAqCiNges7bOx3E6eq9zxC4/PCRxSXjN2s3//q8DBKeU3zxP6OVByn8aFeA3NZDNSMCW6dGaMI
	v6qXTA0HnYGdWHjQekfbAOYg8G2zEAnLgS4mW8bfUtYP+AgLr5T4gTPuHCJ7ApYpArshcIookVO
	AtFG0GYVe37spQeXTtTSXv8Q8fdAUPHlCyOTexFGAROdWa1WYA2aGaGN9VFxyrKGtlktVyz4OfJ
	m1D7wY9KD+WXZs6IwBIJ0wi10v7ySa2UEXte04qPQdVUvA==
X-Google-Smtp-Source: AGHT+IEDP4j6PWm+SFGfBw5+tbnB8EDT0CQ/gUZjNaKthvdfQEhiUCvSW6a6RsNFm+kY0bY0w89Lqw==
X-Received: by 2002:a05:600c:5246:b0:43d:49eb:963f with SMTP id 5b1f17b1804b1-441b1f5bdb0mr13183955e9.24.1746000347523;
        Wed, 30 Apr 2025 01:05:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2bb3f34sm14911025e9.19.2025.04.30.01.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:05:47 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:05:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] of: unittest: Unlock on error in unittest_data_add()
Message-ID: <aBHZ1DvXiBcZkWmk@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The of_overlay_mutex_unlock() was accidentally deleted if "of_root" is
NULL.  Change this to a goto unlock.

Fixes: d1eabd218ede ("of: unittest: treat missing of_root as error instead of fixing up")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/of/unittest.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 64d301893af7..eeb370e0f507 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -2029,15 +2029,16 @@ static int __init unittest_data_add(void)
 	rc = of_resolve_phandles(unittest_data_node);
 	if (rc) {
 		pr_err("%s: Failed to resolve phandles (rc=%i)\n", __func__, rc);
-		of_overlay_mutex_unlock();
-		return -EINVAL;
+		rc = -EINVAL;
+		goto unlock;
 	}
 
 	/* attach the sub-tree to live tree */
 	if (!of_root) {
 		pr_warn("%s: no live tree to attach sub-tree\n", __func__);
 		kfree(unittest_data);
-		return -ENODEV;
+		rc = -ENODEV;
+		goto unlock;
 	}
 
 	EXPECT_BEGIN(KERN_INFO,
@@ -2056,9 +2057,10 @@ static int __init unittest_data_add(void)
 	EXPECT_END(KERN_INFO,
 		   "Duplicate name in testcase-data, renamed to \"duplicate-name#1\"");
 
+unlock:
 	of_overlay_mutex_unlock();
 
-	return 0;
+	return rc;
 }
 
 #ifdef CONFIG_OF_OVERLAY
-- 
2.47.2

