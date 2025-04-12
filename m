Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEC81C2335
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744452932; cv=none; b=bqbe0sXuPYe4Yke62pL2HCsLDDW78An1Oz5jWdWTmElJOWsGZd/x0mnlytQKAZoM2x7A3k/CwkY/xwRetI/uX2MpA9hBcaNzPE6zqgEeCsVXNykOz3Gd0zkYEp9PtTuN/sq4Qhtpo5OlakwlslPY/SUAVbm/3X+sCJVgnCS5eCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744452932; c=relaxed/simple;
	bh=NUlI7rfhNeG2einDOAQS0ehoOuYxAEcjEeCR3Ojkd94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s651BAu8t7ptiZyqzDuCO1lQaAcHA1V2LpfXKuCbQXVngYt28dLAb1JD/+pXtl35Yjj7v+gPFOfXsVkJLBb7NRsqJfIMtwpzoV6yGrbwnnOlNTOQvvSifDiL1iZcA0Kw6kp0EKFEb34dlLWk+26gjFRvVNhKIOz4qfZcVqc9PTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y04HooKI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y04HooKI"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso29843285e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 03:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744452929; x=1745057729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A1XAxbjahpYsXzMprDjhEjSwEqux/6xYa2KC6cfUrJg=;
        b=y04HooKIxLBF4qSp1eOrBPMgQLKnEApUdH1DCxcI0cKFlIwlCeFEzXsaifPo+jNNPr
         1XLs86FFKBrhUmYoTmVlNOQvfn1VMMiUMquN6JrMAY9/Q2oiQJoVzS9ZP9aJnzTPBY77
         oDqet4XLJ+A0QHO+AUE6qjkawtZ5phZWeTh3/XvdiJQCmggTjLgTtR0/kaJwgTqL0gDG
         BBfGoTxTYbL66bIKr5IekJIYHgwAZ71xmpxsdkhFZbYbpATLci/sfjwn33/BJghOnsLa
         rieTb/87dl/+cbayUQvkIrXNuYvukUdaU3S1JiRHIdn5XSd7I7fPEar/ajoA7pByKRxu
         wsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744452929; x=1745057729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1XAxbjahpYsXzMprDjhEjSwEqux/6xYa2KC6cfUrJg=;
        b=hbUCN7ZoReXfjywK5OS90mcmjH//sAptcw46x7qM4xTmiSdsKIFM9kydb7sZnOs9KK
         pdK4BJ1LO4VcpN+/jTieDyjQFmWICsJZPEFYff3L2d6fpNOqSsEFMAQWOmFXaCumG8LO
         TAMy0+5QPdKsJhTcA7HEelu1vtZ3tN5DDykmXT96KmWsGDgHY2dA7YctmL/u/M5VEYtF
         4A1JevXyKlmgBksJ9/SwO8rIVLkTW4ixsBoQM2EG5zTPCY/MkKzzc9psuS/1QoG4HG16
         sDGmjJnHN6JI3NZPXIqbe5EjvJ+cPFWGT1E+rbbXcHmqhOzJ5ReEfSms+sIUxqNngzGb
         6TBA==
X-Forwarded-Encrypted: i=1; AJvYcCWz3Q30vxKzEwrkCfQgokTY/YK4P0q1BA1IpqSjjXFkm96iY+m6X40VZ3OuG7oJjN65yFXYRiHItzYeNFY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq744TFj05t9plbj7/Pig9OlodNFn+qm3ZbXuB/fz2mbHZUr6u
	glZhj5V6UZ16jR7Vh98NHJbMEilZ2RhAlgI/72xdvpmZ9o04voJp20f53Gjb9bxIXt0rBHTsQSF
	V
X-Gm-Gg: ASbGnctvlE0y4PsiW3nwgpLq3RBSaQ8+hqZ9xCEYxyxIiQu3M6FSJimYhqkP7/HObVF
	8u0m6Na/86aBEvgqzeULuiuEyi/fk+N1M55Oq5WME+7Yfiji7rOmLdbBy8YoqlRTPcwZg2P3C3u
	Urgxc2ZnbdwFuwB/m912FCmNIZk/oHSVF0JISiGSCbHa/Y2goqeczhJGX9Il0Qr5LXt3BJIxl27
	gRpWW3XbfihoYXMA90tyRl+F098Dxh0ctMN3qJstkwClME7eHxxOGpXCf1rOFBmWHwCpB75cRhr
	Eb6W46Z9uwSHZJYsJQAHFaNiS+zrhe7yZhqg4kNN6rSPJw==
X-Google-Smtp-Source: AGHT+IHapgll/M9Y0x8YVjZfFG1kOPzA7Nw03Ls1YypBE3zK8Ial/wNTlxmGL7I6XZD3PCqHZHDMOQ==
X-Received: by 2002:a05:6000:1848:b0:39a:c8a8:4fdc with SMTP id ffacd0b85a97d-39ea520372fmr5301002f8f.16.1744452928700;
        Sat, 12 Apr 2025 03:15:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f207cb88asm112582865e9.37.2025.04.12.03.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 03:15:28 -0700 (PDT)
Date: Sat, 12 Apr 2025 13:15:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Koichiro Den <koichiro.den@canonical.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] gpio: aggregator: Fix error code in
 gpio_aggregator_activate()
Message-ID: <79b804a0769a434698616bebedacc0e5d5605fdc.1744452787.git.dan.carpenter@linaro.org>
References: <cover.1744452787.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1744452787.git.dan.carpenter@linaro.org>

Propagate the error code if gpio_aggregator_make_device_sw_node() fails.
Don't return success.

Fixes: 86f162e73d2d ("gpio: aggregator: introduce basic configfs interface")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/gpio-aggregator.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 62bb50af7cda..071d76dbfcec 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -626,8 +626,10 @@ static int gpio_aggregator_activate(struct gpio_aggregator *aggr)
 		return -ENOMEM;
 
 	swnode = gpio_aggregator_make_device_sw_node(aggr);
-	if (IS_ERR(swnode))
+	if (IS_ERR(swnode)) {
+		ret = PTR_ERR(swnode);
 		goto err_remove_lookups;
+	}
 
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
 	pdevinfo.name = DRV_NAME;
-- 
2.47.2

