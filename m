Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F532594
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744190302; cv=none; b=TnrDLiyEni1LQj3mgIAGdYZFoROTRwrK21469JEJoWbv/cj9ctejQn5wbczzOmfNlndQJ0/73oM2Axv3P46RN/BBiUn4kNa+BbVZnGBM47e7ofVelObZZLTbxv5P5mrAAEhV0N5nAEAo1EB6yM0F1MTRP9CzyfjqutCiBwsjYG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744190302; c=relaxed/simple;
	bh=5nV6AaMR5RiEk2x2tAdJqgZhq7kkosJGZFIQ1iElUBk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FZk4EoZ/r5FnMSxamDE+zuL3QB+N6TEydfcQElsHbPSxSm8Nz2wwTkiBtd7R7C4/MfMhc+Blor0+Os+Gb1xJ7EjWYyy+CQV/0ij+3EmKGCqroPi3CEoFmpijbMIKjjoNGqZRldgzHfCcl/kqFB4pGvlEcixPMCRB2mlApPRVku4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wf58xGtL; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wf58xGtL"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so3975448f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 02:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744190298; x=1744795098; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CjbFshPOLZ36u3rr8owbx1Ylrac5EPr6guv06MB6egA=;
        b=wf58xGtLznY+D2RpaH6NOgepQWhWUsQytUlbLI6dPNOiz0kDWeDYr8JAXDPepIPdCE
         IUjS1le0BG6lTdCsNKwfKQxXLwomk+khUm2WFvELl6pS7sEQqQryqBoLWHzS1Wf6sXQL
         kQxQ72ONGbF2vV6sLNv+Ipb47LcY9wgcC4rWK1Q/Zlqvyrhe9gPZATSpr+YR/OLARM6g
         hdqGwEzyncLkjxTWWBd9U/gP3LmKLYNgkhGdHBspkN+V95hDPW3K+2JBIC3qDo6nNDNY
         Lt3WMF0YwaUapqQrM/2qICijmzZFxbEsAJM/A9A2s1mxMQzLxAAY+DQHfRObvBFG07qg
         kgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744190298; x=1744795098;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CjbFshPOLZ36u3rr8owbx1Ylrac5EPr6guv06MB6egA=;
        b=ponGIlV4XhO1vmm8gkIxA7uTJyo4vXL6SVCuFDui3D1tgpt8PsfjazM7QBoEakCCqj
         EJCw5EysUtkmpfBdDr1e9cF6sVGQr61s4C8hSDHcPXd90Z0SUFEs1Tho0vQ2/4bYCKgx
         qPlWbvH3a74gVTREtCt8zaxMM5Vv+W0OWBjkl4AanTYn0uJo3GS/N8K+PbG9hwlrqNIf
         MsBBT6f+h0TvDR3LdnRPODAFHJRX6beEBLCF1zTFaMgAk29KYqoKL1Q26czEgQxzO2IG
         WODAAW30qRrZjHe80vUNciAv8YLLaF5mpn/igepNbYAqOjjPw7dzInrUDYUcNYScEOIA
         /h3w==
X-Forwarded-Encrypted: i=1; AJvYcCVBI4iSzHjTFDMWQH8+q/l90u4B2QBAIbtVyTYOie1wpDeCSaN8SVW1MqwNswRhM8QxC6PK47EeRaOsmJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZxnDsbYc+U2stBksRSdKO8VNUgaykPWd/qFOr1PPp6p+eNQB3
	FXAWKObjIQlTYfQGdNJJPXECnEb92wCeGSUatkzp8/uezaHsVuzCr5WTq1S0lqM=
X-Gm-Gg: ASbGncu8cny5XpIzZ/k6TOdhe7jVNWpqLGIZdVs4qC64L0gwUWqrisGaG+AQoq6j3HN
	rbPsSYleqvDdj7MRjFFyVl2ituIdgRUR9Y/C0U2UWYdE8Y6BhqHc8BSHWkjeo10Dy3W1jddDx+Z
	YDNabJS4G+yrkXXQ6kJ+AgJBXZLCB21lDDkaFfkL/6tlWiY7Ywm0wd+DQM59SZg/m3TU4dxHSjV
	MLZmezrMbZ3T+2XipIK68pbl/RPCDsE+gQl1PcUOTDpMDW9svVT9BbuuLSlUX38hLp9MMYqGhlh
	yRFXTaWmH8YMvz9Zp2YO23lAjxqND8Zg6O52DfvlFeXey8w75J5Q0eKikQg8tRV6MC8T4JYNiPl
	j0GfnV3tDqmz/e1iGhc+91I20G2UB
X-Google-Smtp-Source: AGHT+IHi23vmDgLwMyyQpTHJTKR3Z/3V+/no4ujLL3UXjNQtJYrM6pTheiHFqvmDzcGBZi4KvMNiRA==
X-Received: by 2002:a05:6000:2ab:b0:39c:13fa:7b9 with SMTP id ffacd0b85a97d-39d87a64601mr2058783f8f.0.1744190298493;
        Wed, 09 Apr 2025 02:18:18 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8938b7afsm1069482f8f.58.2025.04.09.02.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 02:18:17 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH v2 0/2] iio: dac: adi-axi-dac: fix for wrong bus read
Date: Wed, 09 Apr 2025 11:16:53 +0200
Message-Id: <20250409-ad3552r-fix-bus-read-v2-0-34d3b21e8ca0@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAU79mcC/4WNQQ6CMBBFr0Jm7ZgyWCSuvIdh0dJBJlEgUyUS0
 rtbuYDL93/++xtEVuEIl2ID5UWiTGMGOhTQDW68M0rIDGTImpNp0IXKWlLs5YP+HVHZBSwtUU3
 U+0Ae8nRWzv2uvbWZB4mvSdf9ZSl/6R/hUqLB6uxCqGvH3jRX79aHeOVjNz2hTSl9ATUzdSS7A
 AAA
X-Change-ID: 20250408-ad3552r-fix-bus-read-1522622fbd2b
To: Nuno Sa <nuno.sa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=5nV6AaMR5RiEk2x2tAdJqgZhq7kkosJGZFIQ1iElUBk=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/Zs3rumrZ9T3G1veYjs26qes822pX5bzrd2ce2/Hb/
 dezLxlG5R2lLAxiXAyyYoosdYkRJqG3Q6WUFzDOhpnDygQyhIGLUwAm8qqB4X+yjO7yputSTdmm
 Cc8vfxXxUUj71vXqXtr6DZf3WCxeV7CE4Z/C3D7F5FXHnJKd9wf3Ltg916RHnKfxadj0Pj8lo60
 CBowA
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

This patchset is intended to fix a random wrong chip ID read, or a
scratchpad test mismatch, tests done in the ad3552r-hs driver probe. The 
bus "read" operation must always check for busy flag before reading.

First patch reorganizes a bit the busy-wait polling code, second patch
fixes the wrong bus read occurence. 

NOTE: due to ongoing changes in adi-axi-dac.c, this patch is intended to be
applied after the linked "ramp generator" patch.

Link: https://lore.kernel.org/linux-iio/20250408-wip-bl-ad3552r-fixes-v4-0-b33c0264bd78@baylibre.com
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- invert patch order, fix first.
- Link to v1: https://lore.kernel.org/r/20250408-ad3552r-fix-bus-read-v1-0-37add66aeb08@baylibre.com

---
Angelo Dureghello (2):
      iio: dac: adi-axi-dac: fix bus read
      iio: dac: adi-axi-dac: use unique bus free check

 drivers/iio/dac/adi-axi-dac.c | 40 +++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)
---
base-commit: 6fb85f14853ddde06d57030c753168402bf69cd9
change-id: 20250408-ad3552r-fix-bus-read-1522622fbd2b

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

