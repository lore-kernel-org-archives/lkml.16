Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28234218AC3
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 06:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746685770; cv=none; b=PAAK/zet7WkLNOQAlQbxWCuTteqRVqxcEVkozFPIfY8FRz45FgBF5AnsIA7IaJQ3Z2sWrQrJ/7CalbC09eurl3zZuODbhyE6vBIjpAZLizbxqq+XMkGKUQu24BY0uuAVgLOLWg88RpK5RRictIJI8m+yLAtE2egQQJ0lAzpK2hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746685770; c=relaxed/simple;
	bh=nvAOftu8RZvdo9jR+7uDcoM7mg78LNDiZJ9RZTqBFTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SMaqtkzWC2iFnDzpJeHcdFTJIAcQ+KKjhfEM0Z/BOieaGL3LAdlFwH99+qhNIU0ZGgBzDaqKTrgfTuSRixmnzIVPw98ohd7Tcke3oXPPwiHYrL01uIwoUR9Nqr5wP8OQrmoeRtpNgO29mBXEK3Jy9sqR5lr2qg0mJmhMP8kxipQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ASRF76rU; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ASRF76rU"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so380019f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 23:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746685766; x=1747290566; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2/4bzmi3WeEDbTzTrWnva98EY9qxtiVDbKUh9os0Wng=;
        b=ASRF76rU+oOGWhmnMMxRGZPnXK3rtLnBpRXUFejEdLp/KYAJz7st/87ui6hKnwKPGM
         36BW+WiFnPeDBVY2OqpmuvgKQqXQhCV/7zEFMsADo2SWml1qUuQQrkZCse7aM6dHEgT6
         Os90z5dDV/Clw+nbCQ+MQXP0FUACBP30g3XpaPqfwV713B7mjxY5LvDP181TOVlGtYKH
         +8SFcxinreTVILfiLJ+46xvvKZJ7I8Ex2/wcgNY297BjX7DSl9k8KGvzL/EwLJyDFEck
         Sa6OuiWz+4QbQqCd/3jguzgK3ile1yzNkYT9RB0Tf9tOBKFxl53vAZONNZGcQWAmJv+B
         neLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746685766; x=1747290566;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/4bzmi3WeEDbTzTrWnva98EY9qxtiVDbKUh9os0Wng=;
        b=bbdjUFT7jEprQmxBUcjzfOQO72gYuj550R2mmhudg5J3jaeZR9wbdPaLJy5YZBC77J
         FV/Sw/03zgPZPOmB5Opgc0tyIEyBoJGdZaa78JVkVWiRWadnaYYcaDp+UKpHiJ3fkCWF
         x4/zZHQ8sO/eRUBcXFfd5nCixZxi6CCOZxbOoIumAjW+6XeBxlw3YS+6cYnmdcLgSzJy
         aELgr4ltk14jbYwinIC6vuaG8siAy4F1vOhQkyLvisF/Gxa95NR6rFuAYc3mNBllwxgB
         m7oTjhp+gVobZICxiU4Kw0raJu0B5KXcQ0KO1/kVzZrD7ezK+uOnrEFUukl/Bs16zHel
         pMVA==
X-Forwarded-Encrypted: i=1; AJvYcCUMt2sjDQHH7Agfx5lW8/U/60ksPKE5BV/HqLAANU2WLZ4gCqIKJ0hM2zI+SstOxn/gekMC5obbqneEzQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YypjjqrAf46m3cJx57nf3AmCCVK4xvdGGVIPH5P5PQfbJRx2SBW
	INKojlcZB5hISCaOrKB+fXxKC5eH9GVT+ij95WZf2RCQ9qpopf8cC58iRzwGaP8=
X-Gm-Gg: ASbGnctJIcZRWZQvydoMnfGq3txiUDkO/YdKjNbfCbuMWzIUI8QsmXRegHISdFvmWkB
	CJqKLqdi9DNGUEXqi3uiadNGMBERn16AEkujGfG7DVZBj3arxKGZmyuktZfHcU6vWFJtvheA5bY
	ksFMx8VBsp1oRNa5DHIlKgvF5N04oqf34YMHT8exUXE/ahF1pHF8fNMhpvMi3coBn083P2l1Q+8
	E8N45o9jFKPjTstNLXy2khaulq7KajuOLJGaz2/M0Y/7WU9G3Tp3pC9DuT0YalchwaEJxPmvorr
	dK4tGbXKc/bm8arc1+w38nsNhPjAyjIy2pbHaVYzgsCA+w==
X-Google-Smtp-Source: AGHT+IED9IVqI1ICbHb0y7mZgDW+1JcDLNkQqI9Ufmww05m3kDmPH3IE5qhfjUZINH4pYQlMToViTA==
X-Received: by 2002:a05:6000:430d:b0:3a0:b8b0:4418 with SMTP id ffacd0b85a97d-3a0b8b045f4mr2297566f8f.50.1746685766494;
        Wed, 07 May 2025 23:29:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0b81a1b9asm2527467f8f.0.2025.05.07.23.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 23:29:26 -0700 (PDT)
Date: Thu, 8 May 2025 09:29:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Niklas Cassel <niklas.cassel@linaro.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] pmdomain: core: Fix error checking in
 genpd_dev_pm_attach_by_id()
Message-ID: <aBxPQ8AI8N5v-7rL@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The error checking for of_count_phandle_with_args() does not handle
negative error codes correctly.  The problem is that "index" is a u32 so
in the condition "if (index >= num_domains)" negative error codes stored
in "num_domains" are type promoted to very high positive values and
"index" is always going to be valid.

Test for negative error codes first and then test if "index" is valid.

Fixes: 3ccf3f0cd197 ("PM / Domains: Enable genpd_dev_pm_attach_by_id|name() for single PM domain")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pmdomain/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index cd4429653093..ff5c7f2b69ce 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3176,7 +3176,7 @@ struct device *genpd_dev_pm_attach_by_id(struct device *dev,
 	/* Verify that the index is within a valid range. */
 	num_domains = of_count_phandle_with_args(dev->of_node, "power-domains",
 						 "#power-domain-cells");
-	if (index >= num_domains)
+	if (num_domains < 0 || index >= num_domains)
 		return NULL;
 
 	/* Allocate and register device on the genpd bus. */
-- 
2.47.2

