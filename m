Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0009621CC4E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743435531; cv=none; b=Yh1mAc/iokd8YFf5leWYKAf+Gyj89KML7mONiOw6KGZdJ4XTSWWv3OrgYXPzB253dLjjAWiQPdyiGYrb7jkRo5n3kyUQk/IVk/bG3ovuuMZoDJ41VCMG2/mMlZrumSwZAAkfN/EdjuI1CYyzP0tRdnFxblRuoBe1S8JdGgpaguo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743435531; c=relaxed/simple;
	bh=8Z/Q1Yqqxhozl8RrcKexRki6sw2jFiBNt//dnoasYvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fcKA1iQjuL4eVECPhRZ3tkQLN8wFIUFm401w5k3/1ILORvDxgPjwjS4wGpl6OevBfeztcauPkeyyGbEmLe8eqtK1tmx7urij7bSsxNJb4rtb8wNnVKOzF6jUPAhdZ4KZ5A/ys62G/FhYWp7Vvf9HjZeX4k4QGI0BOBkz6M1kct4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcpNEA+0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcpNEA+0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso20822285e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743435528; x=1744040328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gIv3lfUsZudSX+4KjXfNYnF9gzZiOWchSCAyXPUHRA=;
        b=IcpNEA+0yYIFv1ul2Bism8dnWcV2lXS8Rl1MCzK/mOhzQB/sn+iR2EhxA63dH1e9yQ
         Soip5zw9ugNPYURKBiv/Ve9mcfCQ70IsJEiVIaicAD4IoGBY0BYC8twMDrXoApWyp9wF
         muerxqn5u7EZhstChwDyv6B67/cJ7WvTxBSaGxMH4O61UHVh1ui2H2ANZKz0UMQhAsDq
         UadQiGlTe0wj0KkvS+4k6SMAJuHNUDAakDZ401ptorLz8wVVaKU5BSSHweX5fE64gQ3S
         QkaHzOI3c7Vya5KxDMCzcsm8E/cr1qxQzo6MJiNEPHRnGOdmaOArv9XjAm1csrhtJ1YB
         vS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743435528; x=1744040328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gIv3lfUsZudSX+4KjXfNYnF9gzZiOWchSCAyXPUHRA=;
        b=Tkuw8zPTr84CHuHADPbgYtm8QX1sZEzdbo4M9zE6la5Q4WiDALanty13Ou8k+STlYJ
         41wo1Sy/RwqkbY4desc5zJrvYTV+qK3KGUVYQYBd4rRFOS2Dymvup0iYP1jQEJN1H8Q8
         x2+Ux1uZ0b5fUJpYxABX/bweRKAezy3Oj+NrveY8q1durk41syoubH7C8M8QXJ7J0Zl3
         5OU6biC4MEZENA7WEbdMdhqkDz9xuqU0WhJohBG4yJ20VgjZJpJgYuNu7acOBSub9cwo
         OC0zLTv8tg4iqbhl4qaM/nJjcbPnhzXrjLF6jiApRQEw/1a0A9wFH3nrd2mB9aub6iSO
         T1vA==
X-Forwarded-Encrypted: i=1; AJvYcCVLB/omgMnoXAEAAL8lnTzD/bhnD8qYaTA5jI9sFXWI9s4lZhkIKsD88Pg5dOdsAPFs8gFEatJGuNLHxYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIwwTBuHyV0fwogLDEVDztAaKb28y1QUTI1+VxNIC7qm0QqjUX
	fON2SIvDbksMb38bzvs7G4NhrqzbERgV01NVX671PUc2ckmWoCdI
X-Gm-Gg: ASbGncuhC224aM8gqzsLuFuLOGQoj7zQAHaIfRu1++laqTjWVAo1mU3PC3QWRei+kNl
	FJnEX9kpL5218FvsuGcmVvygpIFcs2DqCCoeYhutiO0wVA+RNrN4mFgNINPvuhl9aS9cjCyNcvz
	JrnshWkKGIPSFFzXrWAK/iBzOIkgMJDH6qePxsqWtoXhvc2kSzX8oRvtcFmDYdjWNsmJSUlnai9
	vTOss8AwRcDryiqBFCYFJj+9dNDc7PZqpGnYaOIQw2ZyjZVWrQNgzmX09sdCIQaIcLsa0H9qw11
	8l3toqa1gVDPXWD6al76lzD/mewgJNbhbykklwE=
X-Google-Smtp-Source: AGHT+IFdato1T3vrZMd1epyk3zNNbsohtGqaDLeyTFEjiVWS1VpusMu2h3hzcFrdgYDV0ky7Ie0dww==
X-Received: by 2002:a7b:c85a:0:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-43dfa59cd30mr61311035e9.33.1743435528129;
        Mon, 31 Mar 2025 08:38:48 -0700 (PDT)
Received: from pc.. ([41.206.42.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6588d0sm11419167f8f.7.2025.03.31.08.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 08:38:47 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH 3/5] staging: rtl8723bs: add spaces between ternary and binary operators
Date: Mon, 31 Mar 2025 18:37:56 +0300
Message-ID: <84e4e73f3224ee37d5d203c9b7adbcb43f4fc144.1743434232.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743434232.git.karanja99erick@gmail.com>
References: <cover.1743434232.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spacing around binary arithmetic (`+`) and shift (`>>`) operators
to improve readability and adhere to the Linux kernel coding style.

Reported by checkpatch:

	CHECK: spaces needed around 'operator'

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
index 928c58be6c9b..3b43f8cfd6f4 100644
--- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
+++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
@@ -155,9 +155,9 @@ void ODM_CfoTracking(void *pDM_VOID)
 		/* 4 1.6 Big jump */
 		if (pCfoTrack->bAdjust) {
 			if (CFO_ave > CFO_TH_XTAL_LOW)
-				Adjust_Xtal = Adjust_Xtal+((CFO_ave-CFO_TH_XTAL_LOW)>>2);
+				Adjust_Xtal = Adjust_Xtal + ((CFO_ave-CFO_TH_XTAL_LOW) >> 2);
 			else if (CFO_ave < (-CFO_TH_XTAL_LOW))
-				Adjust_Xtal = Adjust_Xtal+((CFO_TH_XTAL_LOW-CFO_ave)>>2);
+				Adjust_Xtal = Adjust_Xtal + ((CFO_TH_XTAL_LOW-CFO_ave) >> 2);
 		}
 
 		/* 4 1.7 Adjust Crystal Cap. */
-- 
2.43.0

