Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A299C25A322
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745228650; cv=none; b=qq1hnwx8cO0iYpkHyJZHY46XYyzhLNFWZoCb0zCV+RAsbhFfVewBiRvCoJragygdKX5IbnLSZ6yfZJO0oNfy+A4FGfthItILFjZ/AYQt/RKyoDyNNmzWbIaKAuUvITUq/uvBM9ISTEkAoGFK7p62GzdOq52I3F15giNJqGHQUCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745228650; c=relaxed/simple;
	bh=glrL9frKUynd0eooWslKXIli7Wwl1Of8mWNqeP69AkU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j+tiiqLDTIijO6UM2to2ymvRGWdJ/qunaJgB8sLi4Eu7qA8HMXwdwRZplz43CcVQ6SjESJYfttTOYiES1c8doblSLIA7uboNzAz5TSPxmthKoBphlBJyehihksUe7oJ9yyJvUP4YPNRWqcwyKZnRDeDGZvG1jslfqb4/zhQO/fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=BKVBjIQi; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="BKVBjIQi"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-224100e9a5cso43910285ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 02:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745228648; x=1745833448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Cqj4QIom4PNiBzVEbYX0WUBXZ7DUraiDzK4MrzGYzY=;
        b=BKVBjIQiismrP4d2X2knFvFA7hR9TLKSswE4YKaV8x3OUYCKNg/M4cXzFmAatrHKzZ
         d12z90rCPVpLmA3KWN/j/s4a/MoWuCQWw4wulweJX9TDH0T8PVpRptbvyn3pUED/PXnJ
         1uEGkGUbyCv497+45A3L/It70ZpyYAymLvNojtg7h61xwuV3ACJBV04RRLSRyoefSJ/B
         OiWUHVPQn+Gq+cNeWze3UARklgsxjF5zc2XR6w91kCZZ+hMFcs1gjwnDrqwTHIIhK0Ue
         Oez15cqJTdjBU/mC21vRolYdVLVb/xsQWO/qpk993vGx+5XXjzj76+g5sjWAAvKPatzm
         93UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745228648; x=1745833448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Cqj4QIom4PNiBzVEbYX0WUBXZ7DUraiDzK4MrzGYzY=;
        b=fFYON9PEp6jRiCA3dhdGu4ooGnja5gt6Hl936vmI/uucA+TDC2Reio3x5Lftd5kkop
         EmupAiKNp7KqR04ml1oE7yu8FZNkMqELMC6uDiHlng80RRi3Hq+dclsZFzHbtATJ+u3x
         8KyT+OCCkhXUVlzbNIGjCvOVG80SpDQ8IqYY2wPNRgw6SBkwftV1u/dsxkgORyPQpUvX
         YxUwbR1vcxWvThVcgy4wXjohbuL4ugwLs849+TTtJv7AVvIipI8pWrYe2HOne6438r7Z
         M1K7lDeQi4vDNKqTyScygGL7yIgRu3jBWlWElqH0BqR1hFW7y6C+avvLzSmeoOyeulX0
         fviA==
X-Forwarded-Encrypted: i=1; AJvYcCV7UUj+HsTFRCciGObisry5MArJt76x93fiq2P9XvplMpwadmwzuVTlI5lPXQ82eFZYm4lXpdQfminxm+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHxh7+/kg+uNAl27vWWyNdvOOudgpg+r/6degMdoQhvr458t2/
	elhSUfJBDMCtuQbaDzsL7VDfMc021CDN8G5VZXhfKJyyMCcDwgu/E3Rx8lZsMww=
X-Gm-Gg: ASbGnctWdKrXz6kI9pCkiXUC+Xaq12+Sx4tOcdTMCTxlEuEOBnUciGhqeitZCxhVA7Y
	G7I/ExpdxPnXV/0BfjXw87OsiLfZheCCxVGcGbMl3AcdVv3k740tqoWueuN1vOtiYpmwtv4umpi
	mOy0ubLbCtYgJ12Jxgs8e5BhoRh8zSn6+HM+IxRQZo72HTduLWC47pLdGEDsh42LAiu6ymyCgC3
	YO9Y+qgR2aW9XmFfIFrdtrPIIl1K+eq66aRFPeCcr/bgaTTFlqqmtGknZNKFBoPAY7tIovMx+Nc
	AtRU4uWpBLCSZw9FANL8EBxAUOcZ80dmwqjY4mRgbA7qoN85cfEIcRthPtUpC8Y3h6puwsCW2hY
	9kg==
X-Google-Smtp-Source: AGHT+IH9vCtDb7HvKpxpcy9CbAe2VrwR7fXTtTGN3OzMwQYcW6ogAY3TNTBrPavfoyTFcga48z7v2A==
X-Received: by 2002:a17:902:e88f:b0:220:e9f5:4b7c with SMTP id d9443c01a7336-22c53581248mr166754085ad.17.1745228647812;
        Mon, 21 Apr 2025 02:44:07 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaacf32sm6371965b3a.142.2025.04.21.02.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 02:44:07 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Nylon Chen <nylon.chen@sifive.com>,
	Zong Li <zong.li@sifive.com>
Subject: [PATCH v11 3/5] pwm: sifive: Fix the error in the idempotent test within the pwm_apply_state_debug function
Date: Mon, 21 Apr 2025 17:55:19 +0800
Message-Id: <20250421095521.1500427-4-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421095521.1500427-1-nylon.chen@sifive.com>
References: <20250421095521.1500427-1-nylon.chen@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Round the result to the nearest whole number. This ensures that real_period
is always a reasonable integer that is not lower than the actual value.

e.g.
$ echo 110 > /sys/devices/platform/led-controller-1/leds/d12/brightness
$ .apply is not idempotent (ena=1 pol=0 1739692/4032985) -> (ena=1 pol=0
1739630/4032985)

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index bb9146267bc5..6259f8500f71 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -101,7 +101,7 @@ static void pwm_sifive_update_clock(struct pwm_sifive_ddata *ddata,
 
 	/* As scale <= 15 the shift operation cannot overflow. */
 	num = (unsigned long long)NSEC_PER_SEC << (PWM_SIFIVE_CMPWIDTH + scale);
-	ddata->real_period = div64_ul(num, rate);
+	ddata->real_period = DIV_ROUND_UP_ULL(num, rate);
 	dev_dbg(ddata->parent,
 		"New real_period = %u ns\n", ddata->real_period);
 }
-- 
2.34.1

