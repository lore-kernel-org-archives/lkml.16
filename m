Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C5F28C5CF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290405; cv=none; b=AfArlkbsgQf8cDGBhNtHS8z+zyCQ+F9MqInjT5Y7j8xBLRdRfYVHHApkxdmxr3Jyak4e+YkaLPiS9wHnmD08KTmpCwoszOxkCrHzt48TH/w3yUs091QC7wE0p94O1Ji7/BaZen+c46y1ymrF07mEHt2n2xBN0ylVW2AiNj+jE/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290405; c=relaxed/simple;
	bh=pjuWFOSZ1RZNImwMtIT7uEizjyExORnbaw11+N/b+MM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=puVbhJSzFOXgIbECtlVSDTu+YuzXQV8lLKAekCtUPvA+TdZiiY8hBvQkkuQ/AlR4IqqLKL856+Jc8BHWoTs+kPU/NtO61S9ibkIiKh8G3a34gP3Iha02SXEgy+TuRr1wMrEhG2KUB7xk7bFZfTMotA5h4rTkwHwiWi/w3Q1LglA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FK1aqMED; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FK1aqMED"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso6121605e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744290401; x=1744895201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZ/a/9wOj4qqyc7f8nH0QgnVcQfOjbEe/xaqcp+eVQ4=;
        b=FK1aqMEDFvKvfAFWlZ6l7y7nfrtWzubuR/1SxUhbCPYRbFfC6AnHw1fQHCXar0+oJE
         XxWNgG1lCiejr1yH9Awi56h6KJ3ihMRCpGp00LEG2UmyL41sZPHgN50SU4RHWqUYA4W4
         5tMb9waMrSL12UW7kK2Vx/hicBeTnxWtEV2nLunXY5BuFkiSzhKGrtzQF1Z2lLEKv2uj
         MGnR1zYFasVDG0Elgg/4I/F2xTlMCNwka9rG2/A7JvO9jWUAEz6wJBdiue95KtYWe1GK
         JmNkKUdpjBgXuOETTu4bdICudeVtHNk2FqlrapmdE1JZWzCVQCF4tjP/c8lNA46P2om3
         ARjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290401; x=1744895201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZ/a/9wOj4qqyc7f8nH0QgnVcQfOjbEe/xaqcp+eVQ4=;
        b=Al6gymcGkEGgdIuiOXi3sqC9cOGtOZhcDJkdTGmnPdCBX2WRLCbHNAL+Lc6ybPBqPy
         y8DeAAoHqpbgva2wtfC7cMCG99R1I7frMq4byboZjoFswjOTJDOsjF3J2Z0m1Bd+VR2Z
         MkNYl9Z0o9wIv9nSioGYqXq1OsZ6fijpqxjGlRLyHqCET7nP34JsJ1+lyB/WmIxDpr8n
         GqWx19M9eRlrKKIaSo7Lpuo39M8x0Ddgv0sgbYD/FnqnhU6MHgVyoUfTtzcFs2vRRrSY
         i1bPdIy7jBokBlUiDdQ/kcv5iHsBz5m+Xr0lsg4aAKoh9h7V2ZQIgrxnafJggty9BScr
         T6zg==
X-Forwarded-Encrypted: i=1; AJvYcCWVcou8CEe6X+B1h0yJUtZHKiGwA7/mHDkp6KIaQhb82m0yX74nzQhTt2ynJDXkdm8sqWwuOcbc50aGGAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4sSyip7ezt/LyGuT2x+6J51Kc5Fm3OI7gx+BZ0sTLKoezdxQk
	Qx7u68Thztaj9B8Hh/5vTkT+99m2g68kZd12VjCNQyZLnuAcP3yS
X-Gm-Gg: ASbGnctyON+s4xKL1r5oAcrZSngE/QzvWtgK8Mx0ty5cm5toJt7r7HL62U3Igsb2RaQ
	uL6pvxJjo/KthxDs6/N40ZwcUus94WIxfXNBuP+W+5io7s7qY/BcBaVH3YlO3p4dSUvabUduFtw
	YLoSEoc/b6dB/2YiT+greF3KJPAlYI0UvFGMHgQ/F7N9c5RmRtkAKzv+T5zA8cJXx37al3QmNXV
	gPwS672ZmQ5AqgxOW9/HLkp3J1wO8lQuBUqS/V07mHZ1UUwhHTiUIyreQDoiCk3g7cdlbc/9fkO
	MRGbHTf0Yydv2uTJR3fez9cEDaBSEXrsWB7r5A==
X-Google-Smtp-Source: AGHT+IGu0ruWSrChmP0OLx9UlZ42DjEUbur/E5YrIC2D/Fe0LeiIQ9zEr/EDZo2o7CHK6DxF2ClBUA==
X-Received: by 2002:a05:600c:384f:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-43f2d7af3a5mr27512295e9.1.1744290401177;
        Thu, 10 Apr 2025 06:06:41 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc6dsm55013045e9.28.2025.04.10.06.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:06:40 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] staging: rtl8723bs: Initialize variables at declaration in hal_com.c
Date: Thu, 10 Apr 2025 16:06:08 +0300
Message-ID: <4e40575a308a7fc4ee0d25923097fc915a2ee849.1744285781.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744285781.git.karanja99erick@gmail.com>
References: <cover.1744285781.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the code more concise and readable by integrating the initialization
directly into the variable declaration in cases where the initialization
is simple and doesn't depend on other variables or complex expressions.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 1213a91cffff..7f4dbd5c5d33 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -745,12 +745,10 @@ u8 GetHalDefVar(
 	switch (variable) {
 	case HAL_DEF_UNDERCORATEDSMOOTHEDPWDB:
 		{
-			struct mlme_priv *pmlmepriv;
-			struct sta_priv *pstapriv;
+			struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
+			struct sta_priv *pstapriv = &adapter->stapriv;
 			struct sta_info *psta;
 
-			pmlmepriv = &adapter->mlmepriv;
-			pstapriv = &adapter->stapriv;
 			psta = rtw_get_stainfo(pstapriv, pmlmepriv->cur_network.network.mac_address);
 			if (psta)
 				*((int *)value) = psta->rssi_stat.UndecoratedSmoothedPWDB;
-- 
2.43.0

