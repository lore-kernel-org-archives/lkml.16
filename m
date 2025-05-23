Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2AD20102D
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748016087; cv=none; b=hVNVpv7vj6/TMQTj1yedgYKxdZfCJaIlKu4Ok/YqqN0kkg5TsCOvAtVHBHuKHdyay6SQV8D0VIUyRJBOwLnfKxLAbWOUvQ34PsseYyN7c//9jMszTxYmaOmADLY2yg9soWmJlxTZPIp5GsL8R8sg55+rHzmL/6KekwPegbFv96I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748016087; c=relaxed/simple;
	bh=dqiZEMAaMAT+i+xQPPAltTkTCc/jQDjYHiWPdk7ovcM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r5/xrR/VTMIqS6spuBG8pfY/JkLX3ORB+Xz2yVjQXv+GJH/uCN84+yd6a2I37O82AQGWYGRAnmixpe2m1JeD3dePgnIKXh6u/TBhqXyp+Bb+Gl3Bo3m5355KgeqhG7+91uQaLOnqdxV3nhgdPMKPAI2q02gHpivVaoHHIh3/Lcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bBi2hYdS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bBi2hYdS"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso92364215e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748016084; x=1748620884; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15n3jb6X6nc1Ptss7d0u5htP58z40RIPOIkeUdClyjQ=;
        b=bBi2hYdSaDB5q8+PD/DVueyD6u2Gt2C17hrXWWnurkaAzEL8JCBKUeZ0e1U2B+EmZ6
         F2BbADLxsvsv9U5gCIxvPm42rapK2RM/l6lSUHCk+Mb5dtOmWnOE3diNOMFbGv7z2zvH
         GcdcJ93l+QZfHTDVE3YG+s0PagS8os0Td3y7stPAB8tx8ntohA6c1tNl8ha92kValNsS
         IYAoCphr/IlYSMLPReF5/LndzLnCV5Um/5+dvzVYNtUM+WdfvIHvI3lCz2NMF2ANo7C6
         iCWYs5608QTdl679F5n/ib73AD46ZOy3cIyG6r83dvOpxjbdClpvNZLYzspelH/Mmves
         Zu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016084; x=1748620884;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15n3jb6X6nc1Ptss7d0u5htP58z40RIPOIkeUdClyjQ=;
        b=SPsk7+mOZUDGfw2xC3IirQgQJj5Kl5H9VYBQZr6t4TwXv5czMvUWIvjdWBpfmuAPA2
         q/Q9+w6VNCzIf5Euy4zZOcIU86Vevj1L+rFS1YnaDolKaU4q0Q3wsKOg3SSsxvuvzj1a
         h0uha1CrRBZW99YCMlfwTc9PjtikKG+Bi4Jsw1emLz//ah1aFuqxzatUNJoVfuNvyBd2
         R0CQmZF+2iMgESosgtUsxEwE3oIocj1leaIX+9ZW5bUrhQOk9teHARwR/xOLnm3KnLjX
         tx98I+styhEWiKeURs2Ymsh9uQF0I/+XKu2J0YRo91agPae90PmG4K0eDlHSiBmCGslX
         ZHzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1y3BQcPLqf9uIPI8klJBop/tUT+IY/bjmOum3gJCdwfao3sropDaeLwJg7oRvg5m/hgQV1/EWMDuJudg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB+W05+BcXWCj8I+TI6vjr/5cbqZZ3rcZ22HjfOWzEHTGISD/W
	ewVc2X7MTCPhiljf51cEJQt7wrGfyCbWDl9WHcamj37AlzOE9HNNW9A8vpIRGe2cXY4=
X-Gm-Gg: ASbGncsfS8YFIkzjTOwJuFYsxXuzgPf8e0eb98XNyuqPwjKUud6akyQLHmZM7O6YSH/
	G3PAbwHJhO7Okc2dYKlyglS2c5sc6DMHvD2yJKO4rPj+zb+XHz7ssyYPFck6zhAF/ZrN7kiZmTl
	i1lkZaPIvO+s+4SfFgGw/Wkeduo5F0q45ZrwEM58sxRd8TU5AvijKTQi/VAi1hVMJOleqKYm035
	YX1AkfcqkgvZUDK27fL2gDMiDhT9tgIBExMYi2Z+u1bv6eA2Laelq3EE+Cgc6K1TQWh5TjtFI6J
	Qmst4iHQ6BlIPn6+7/EDH+lhcBoJJSrZRJN+NDGnjWgSVGPJBpM6+i9b
X-Google-Smtp-Source: AGHT+IF/THP6E9ZS/GCIatMYe54LeoFTYKNGEZBFtW+dbZFIBIbOWxAiwtQRKvPBgXMHhn/LPjXNiQ==
X-Received: by 2002:a05:600c:1e1c:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-442feffb6damr331857925e9.15.1748016083583;
        Fri, 23 May 2025 09:01:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a364d2636bsm24546310f8f.99.2025.05.23.09.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:01:23 -0700 (PDT)
Date: Fri, 23 May 2025 19:01:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] coresight: fix indenting in
 cscfg_remove_owned_csdev_configs()
Message-ID: <aDCbz3J5wibnW60S@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Use a tab to indent this line.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hwtracing/coresight/coresight-syscfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 83dad24e0116..6836b05986e8 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -395,7 +395,7 @@ static void cscfg_remove_owned_csdev_configs(struct coresight_device *csdev, voi
 	if (list_empty(&csdev->config_csdev_list))
 		return;
 
-  guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);
+	guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);
 
 	list_for_each_entry_safe(config_csdev, tmp, &csdev->config_csdev_list, node) {
 		if (config_csdev->config_desc->load_owner == load_owner)
-- 
2.47.2

