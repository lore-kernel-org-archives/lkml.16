Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF321E0DF5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233591; cv=none; b=K8OEOjMdR1TxcMgD1fxIpuzrYZUlBRkrf0CkCOl4pZlDRhdEpjnGhYDcbT9S0V/KADqvAYJgjx889PqcXerg8y74nyr3q/wr23yhpVrCJg07wExAo9E4UGmPTNsKQkGu3u017tllVE2FTSmZYu9bMlaXh+COiS16+XQpR7N6PPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233591; c=relaxed/simple;
	bh=9jgIc8odPmLwleRRLhSYJbBvDm/yujcv95xLW+4xoPo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U9piYPYkSq17hLjlIselJIrrn3mjaC3k4YZVgjWQyHi8Ho0YHTWQg8aKGl+M5cGCRllSQ3zVNCWFxUGrRorLi8ORrBLQYNsfoKRh3u04kibHFGMe2za0kxNZReviHiqVQSP3ro7CoUIt3BFjj4482p/Wn9MyNyFCnhah/LqB4SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsffU4IS; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsffU4IS"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so1117275b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 14:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744233589; x=1744838389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ki9mtn0tVPTscazqm7mAr0e9kxsmptzCyYhKL9xUgro=;
        b=IsffU4ISP8zg+rbMQbhsHRHCsaG5e5UEJ/iJOK5sUF2LqiVbzaIuzgvFqVDkKbsWkv
         8R9OWzn51SfF6x/gSJttjUEx8V60oRuDdXihTVNmz7bMU9FNLqNqVRbCZAOGijw6cWaT
         ywUx32hJoCo2LLFZ19xJ96i10obgqzKzVI/3ZdULi2lGFyZVmJqQgTqe44O5e2hZJJwQ
         f/v0uPo7gcS/ZVitsGiWP0zolqpiGyasGNRNtxt/mDVDmsIym1ge7EXiTF3waCGZL/a8
         bHseQY+I6VJV4W4rKwWkwiVkekZUphZ11NJ4riTpi8bE+BnMgweeqbyd7KfCCquOykA/
         8Fww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233589; x=1744838389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ki9mtn0tVPTscazqm7mAr0e9kxsmptzCyYhKL9xUgro=;
        b=EbAmYjVWkAZSBV4QwI9T2HXlwHYK5Wc9BmCLDGpzfKCj/DKjHiqPqBdmmE2j4ELrZU
         tk3JDkkfEB6UKD2j1TdzTBkNncJCWg4C+aYk1wD4vc3g5Ps4j85hfq4JEf3sqzT69IRD
         o7YRaA2l/KWs79LppCNsj4c4bmHTpQc8jyJdtGaHgsaFYD3NVU5UJ6Ysm1vFcnYnAAAV
         YHY6rhQiOSeFXSUFCiUaPuUDBDJM9eNCoHXelkDY5StwkUXZX1Pr+xBirsQMCS8TCjda
         5E3xfYWyoBVbTdO+MeGJC0yHR7ZbXqEg2ZkWK6VjEJfLcZ+c1oss6k6GjWyFW8cp7TEj
         9VqQ==
X-Gm-Message-State: AOJu0Yz2zhrVYkIdEtKNzBqdQdW174D3KhZhJzuelozvd+Z1BZAdJPlh
	do01xdm3OU2C+0zvOd49rvQ6fm0MPOD3gxp+VWxwDKmoiJekJ47933YWW0x+
X-Gm-Gg: ASbGncus0VNrdnwPznC4egtkpON4+80+pOpRgA7da095cvLgnU2o3ylA0qHHLQ7T0yD
	t6WgY5wSjWUFebDm1s2ULAddOto231RBF5qZ3EGBmTAAkNoRddW7Lvja0nC3dM0Dufkf0YRvLFq
	VqL5rcQzUhvzzIiMy4mXoPnPIqtMKPShCNH0hl4fWbWaUL6mauMYrMyS1JfqB5as4M+5i5KARn7
	xrjCs4XauIz774EFsV3U3ZtoFCyADj4g+naaSb6jGfey0Ga803bCq4cC8YZJhrVcbS4yylWZJCs
	dgXbwFzsL69ge7sU5/zsYL4Dj0Mw5ADlyh0UUm7xcHjldqgXNpReyjB7BU5fhYX5kHBciViI9Q=
	=
X-Google-Smtp-Source: AGHT+IHDzgkBQtIx5ux3286qyuvLaw5sTWxiECcsQ8FsHZi79X9fSIeNJan8YvBotEHKfHRkGW4ZTA==
X-Received: by 2002:a05:6a20:c320:b0:1ee:a410:4aa5 with SMTP id adf61e73a8af0-2016a64f2c7mr326009637.17.1744233589310;
        Wed, 09 Apr 2025 14:19:49 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.. ([2409:4080:204:a537:9312:7e1:b2cb:ef99])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a2d3ab88sm1697136a12.61.2025.04.09.14.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:19:48 -0700 (PDT)
From: Purva Yeshi <purvayeshi550@gmail.com>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Purva Yeshi <purvayeshi550@gmail.com>
Subject: [PATCH] char: mwave: smapi: Make usSmapiOK signed to fix warning
Date: Thu, 10 Apr 2025 02:49:29 +0530
Message-Id: <20250409211929.213360-1-purvayeshi550@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix Smatch-detected warning:
drivers/char/mwave/smapi.c:69 smapi_request() warn:
assigning (-5) to unsigned variable 'usSmapiOK'

Assigning a negative value (-EIO, which is -5) to an unsigned short
(usSmapiOK) causes a Smatch warning because negative values cannot
be correctly represented in an unsigned type, leading to unexpected
behavior.

Change the type of usSmapiOK from unsigned short to short to allow
storing negative values like -EIO without causing a type mismatch or
logic error.

Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
---
 drivers/char/mwave/smapi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/mwave/smapi.c b/drivers/char/mwave/smapi.c
index f8d79d393b69..37da1339357e 100644
--- a/drivers/char/mwave/smapi.c
+++ b/drivers/char/mwave/smapi.c
@@ -66,7 +66,7 @@ static int smapi_request(unsigned short inBX, unsigned short inCX,
 	unsigned short myoutDX = 5, *pmyoutDX = &myoutDX;
 	unsigned short myoutDI = 6, *pmyoutDI = &myoutDI;
 	unsigned short myoutSI = 7, *pmyoutSI = &myoutSI;
-	unsigned short usSmapiOK = -EIO, *pusSmapiOK = &usSmapiOK;
+	short usSmapiOK = -EIO, *pusSmapiOK = &usSmapiOK;
 	unsigned int inBXCX = (inBX << 16) | inCX;
 	unsigned int inDISI = (inDI << 16) | inSI;
 	int retval = 0;
-- 
2.34.1

