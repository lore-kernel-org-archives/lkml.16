Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF2C21638D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398411; cv=none; b=JkOBBd39HEY5ROuwMFPDOPMcaDcVnzH3RC1lW6zMEPSupuXPFJgWaiIHQ9bmQkA+y8GXj13FWgE37/4TGNqvHGjix1xW4FLi0b+FJIaVya0DK94G30MiXK6GpUL4iGHwp6p9QcercTn1czFR4arl24hvbkniaEPK74rn+Ed49Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398411; c=relaxed/simple;
	bh=glrL9frKUynd0eooWslKXIli7Wwl1Of8mWNqeP69AkU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GKAkmUKsxma2YJhr16rsu+2FxOLNfbu76EgwvBm9aAxAEltmP0hAHXsasc32o85I/5CqzT5xyKd26aV221l/1QXgfaNdy+FtpAE4x+gRDzCyr9A5iwBNsgAMV6dSILKan3YnA7dvYWY0/GyumcoDQun1ucziwieentpLsfYhLAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Je3+X2RF; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Je3+X2RF"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2241053582dso85701775ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745398409; x=1746003209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Cqj4QIom4PNiBzVEbYX0WUBXZ7DUraiDzK4MrzGYzY=;
        b=Je3+X2RFbmoetOeWaMTvz91B0bPTc1ji5n+8tY4MLRPm4zjuyj3+SUpMGZMszWvGrm
         BhaW6Npt3zDL0FoQkUqh3edl5tQ1CMuLx6YE9MrTyjFIfLC0teAd57ozhSPvKQKdjzlb
         lePqj8nbtySvaok/kAaE/jwKjmjP1+X975uR5So71dwRi/w8OGof6zrkcwG+9n8RFnWz
         4gtMSRCXG1Hg5LvU6AWo1EF6x43YxFhggtPHGnz9NCdHY3ag9kDI0av5S17vBfcVSitf
         j2vigeY14qTkdw9eydn2u/74VdQRdj6UAogRg2N6TTtkKb71nnbSi4Kj07VCi1OlkY7L
         AzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398409; x=1746003209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Cqj4QIom4PNiBzVEbYX0WUBXZ7DUraiDzK4MrzGYzY=;
        b=QGKlsXsqOmM88BT0Co1fpka9fH1NqFhmLaSq4oqslmraZSh0lNKs65/zAhIm2b9+2j
         YAm385EdO9CkcBmr41jRITpS2H8RmdueL1ZRp0uBvQs3E4fsplgvTgbJXwY3xLnWNNIb
         lxrgGxdAMN0QNx2z50NcOappsWgFyIimS3RTN5Inr0CzL9VfriVgiuDb4s4MhVLsvguY
         ztX+z6usgFeONb0DOercWZlTFrJSP4ZZPtTU0nUPkTH4JE3g2KEqq4GrJBPYrkY5UBCZ
         Dd7eM8IJ/NwdspT3ijpsjfnBulrripahrPE74g1pieEGiJTsZq8uNkIDdQ00sDOyK86U
         H9hg==
X-Forwarded-Encrypted: i=1; AJvYcCXT2K9ILd23VsGzw9DWEVs0eMjE6zGMARHCDfMBdPmnDnMu5IQ91SIfXztoJeuyXHzm3CdjYzVFMh3nijI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIo+DVfi5jgjeg82ZkRzOgpnUWZda7ZDbpR2+xsGcbBsoKjzQL
	wyPBYmxYzustirx41xgeWvcL/hG/bsVbCzejVMyrxB8y7E2ZSPuU9z+N/S6RFks=
X-Gm-Gg: ASbGncsC7QLTKKrWgLm9zG5xk8JMtER7e2DQemU1TIYFVTUkXv7XkIfS84FZTyCMJFD
	GT1J6updrhjj6Zwhue3EYGWIhv/34frqwCp0D3gLxfFqIgIwTCXG12ZsVhi10q/FgpwrnUi4xdN
	NabIKIAjN99c4qwIOpyERnOFpxgpdJtOPOapENcYYlIwCns664yR5vpv6w/Y/3DocH5zihG99vK
	3v++KI/5ehmPBcJxzoVIHn6FG3ZUedU4zbdvzWtthFLG2aR8unex/P1lHz/MYmAHM1IMNEV6fwO
	IbM1hsnY76IvXdw9i/fBoL40m2OQWEsZuXkQm8AZKWqQJVjx4/sXn3EVMX8z8MzaBaScVPpBAPO
	GKtRtnwpSKcBX
X-Google-Smtp-Source: AGHT+IEAalrda38aOkj4B5+H1noGQ2OTP7JrL0DoyWnhW03mGn+cIvqfLp/tgOSUaOiNbvMPyvUE2Q==
X-Received: by 2002:a17:90b:380f:b0:2ee:9d49:3ae6 with SMTP id 98e67ed59e1d1-3087bb5336cmr28685643a91.10.1745398408957;
        Wed, 23 Apr 2025 01:53:28 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa5f880sm1047611a91.38.2025.04.23.01.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:53:28 -0700 (PDT)
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
Subject: [PATCH v13 3/5] pwm: sifive: Fix the error in the idempotent test within the pwm_apply_state_debug function
Date: Wed, 23 Apr 2025 17:04:44 +0800
Message-Id: <20250423090446.294846-4-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423090446.294846-1-nylon.chen@sifive.com>
References: <20250423090446.294846-1-nylon.chen@sifive.com>
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

