Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C616528C5BB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290408; cv=none; b=Cz5sOxqLRL9EkHyo3GFVH1qK3MUsM/oeGX6S4Le2mijmUz0XGwaK8jUHX2Q8jj+oi2Hx9k3z5mXjUWsWeWNsqJiw+9uZsp5IgAZYX6P7XZcu/V4ED7cY09TrqGEqdmj3gxJHgwzbWvOXSXLzAa7Tb6bygUP/IdkEot/WDrhSlGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290408; c=relaxed/simple;
	bh=kHgNB5nPT3+1wDW0Eoz6Kq84hg9zCpDrlYGgyCDJ3KU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RpMlKj24OYfHbqShugrtXEWaU+tZFDdiKxMk3EG2PXyucrHKHU0Om5LpIjPCTmTxrINVJm5UJiZAykvIlkJTV+pG/fw2Wl6bxYw6PwGuGz9YrlE5id9bNUDRJiATysb0u0laqdhi1kMfqPU7btcThUHLgTNb/OOYteDB0et7O2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdtU8Ej/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdtU8Ej/"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43690d4605dso6475665e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744290405; x=1744895205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuhP725w1oGaI5ekaGtjNwebtNvqySCoCtAnGKOGveQ=;
        b=VdtU8Ej/HYBIyRCNJtgWB8crT0gjPhSG6QfXjha/Ie+KodLRtyvMZwh3sRGCduMpIX
         8cClzXqU33HOovr6EDLqLqTpwJ/eMZSE+5en6bKVZp4lo6Q21AiwrC3vGuF1qtcpwYzv
         UKbjMhZ8i3OB/xqjobJwTaIY+bNlNNZ+O8ZBgkI8uuuzGHRAsMGtGKGRdlvps8O0LV6+
         7qWbzuRRzPJuIIDkHOa2/dowjcvkabAOAYRddwifp8ZRg3L+5WKU87aEX5N1KCD3ufPY
         4KKwLsHQUh69Ky6J7VIVSoP3ZWgU6y+faHrHPI+wZWySBGB7vOwK/uJwpdNyT9ITsD8E
         d73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290405; x=1744895205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuhP725w1oGaI5ekaGtjNwebtNvqySCoCtAnGKOGveQ=;
        b=XWC9Zz6Cnaojp1U+Z5/Wz8+u/Ur93YXtkbe6Las0Lv6QSneroFSP6LR7vo/cegFNB2
         qoBF66kGiE5FaPD15qWXF/E+eJGuNl5uQvellIR3QQprXomzy4Sme374B+JyZ5GSNjol
         lZ0FaK9Y6zJULdvsd//G0lTMPtWrNf8SL9tvRZ1Bp0NaMJJFxq2xSha6D1Or95PoP/Kq
         ZEuH/mWLPySiOL4wx33BPPzcSyLyBBtvDkpxVa51tGBQaJbiCEv9G1PbZxyVePRxAyDN
         LsO+P4bDgaIaUrWf1yN8yeNSc9p+xCdupIIa0oxAgmIvwtC8RJMs4tNxPvEf83Zpp/GG
         uAEA==
X-Forwarded-Encrypted: i=1; AJvYcCXh+oqYep1VsMY7zJtMhE2JcSkSe1yzlpsKVWL30qHZgkguz0/2XtTD7ugw9z0Hae8y/a+TbDsNDMPlSIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGh/Zm3ekhA6siTOzGRtrPw0qq1f4M1YRUxHk5WPxRT5kYEKAc
	8C3Kw6fetFsO5xPdkrrOw9PmBCKKPgL/ldChuOfCcClyGmhHP9LU
X-Gm-Gg: ASbGnctut/z1z8mTBkXZuU1YRXXFRSBUNzkWXf4l3Hb/nT6rWajg+J7ZqVPTMVMOUFs
	Igg634FqqecfjHqTSo3Etc5jkiom/+w1vekQiT1/c4mpHtw1quf3mkDOw3DI1MlzflRKCm+kONQ
	f4+KGaQ7pkiXapji3eWBtSZWNSpu40/Hc/AJ2NZyODy3dBgkspEPCR3cz0yik4gPSiLye86RCQ/
	gMxq2HuDkpyXVYVPdPROBhG+Gi2QuvkLlXkfJhYOrhPX+0mT6bC90RsOtL6BoBzmOWk5wekX+gQ
	tII9YxHqbe4nY139e5h/MF7W55JFWZ87Ub+PPg==
X-Google-Smtp-Source: AGHT+IFV+X8eGPGvO60BeRP9k7sTmXuetERMG8d4vBQlZCejW0/yD/+PGC6Wz392dpKJgECF49JzLg==
X-Received: by 2002:a05:600c:674a:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-43f2d97bc34mr26058215e9.22.1744290405003;
        Thu, 10 Apr 2025 06:06:45 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc6dsm55013045e9.28.2025.04.10.06.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:06:44 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] staging: rtl8723bs: Initialize variables at declaration in sdio_halinit.c
Date: Thu, 10 Apr 2025 16:06:09 +0300
Message-ID: <82af6a6042e359c4ab9c2fdbb68cc238f43be857.1744285781.git.karanja99erick@gmail.com>
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
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index af9a2b068796..cfc4cace6bb9 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -453,11 +453,8 @@ static void _InitRetryFunction(struct adapter *padapter)
 
 static void HalRxAggr8723BSdio(struct adapter *padapter)
 {
-	u8 valueDMATimeout;
-	u8 valueDMAPageCount;
-
-	valueDMATimeout = 0x06;
-	valueDMAPageCount = 0x06;
+	u8 valueDMATimeout = 0x06;
+	u8 valueDMAPageCount = 0x06;
 
 	rtw_write8(padapter, REG_RXDMA_AGG_PG_TH + 1, valueDMATimeout);
 	rtw_write8(padapter, REG_RXDMA_AGG_PG_TH, valueDMAPageCount);
@@ -498,11 +495,9 @@ static void _initSdioAggregationSetting(struct adapter *padapter)
 
 static void _InitOperationMode(struct adapter *padapter)
 {
-	struct mlme_ext_priv *pmlmeext;
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	u8 regBwOpMode = 0;
 
-	pmlmeext = &padapter->mlmeextpriv;
-
 	/* 1 This part need to modified according to the rate set we filtered!! */
 	/*  */
 	/*  Set RRSR, RATR, and REG_BWOPMODE registers */
-- 
2.43.0

