Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B00D26B2D8;
	Mon, 19 May 2025 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747644124; cv=none; b=FTkcT+dPsCXUmxchSZCs7phxv4I1Ddi7n375jHGY3Yuav0aOXWf3B4y0vqOW9MoCQtx2bJefzQRdR7IyNhmBbeCo3NR/Ohv+4uE/cgXQ0Af9bFeauvIWiv3yG14jL8CeLdN85Mz0LPWJmhEZuIv/6XQiXgXlOZmOIlmS5OSdAZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747644124; c=relaxed/simple;
	bh=M6YH7hLJw/FAhL1abjDJ4cyTRkLOUbxnR154Ohgc8dY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ze6J3DFoVJ22QRvz3wm+tTgVe7AYgtn3ih4bVTuAvibzqZLzObfFDl70cmU/C/SDkCbNSHbtJev3hXwbmUf9ToBHqV1dj1UxB3YLjqLQ4ZLGBKR1j/60PHvlwH7X8OREsEunrpoL5NPaKxw8Ty/5WsijDtBx5/zpg92wDR7GHDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRvkv4ke; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRvkv4ke"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-30ea7f783a0so2238503a91.1;
        Mon, 19 May 2025 01:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747644122; x=1748248922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzWt6m0lDRu2ZdNfH+iSSvH3DFXB/9zKcDZo79oc998=;
        b=mRvkv4ke7n7/lmoA4eI2Sj8uSMoJdE0wB8zzzYr8CnkmpnzV5oA6iasWR0Y18h8cTs
         CbDHafolUNPQQSJwxKYXyYbQMZvRxXr/eT1ByApe3e+YFZDXxDAe++nKNTEhOlH456Tw
         qO5c1eN8BzIuxOYI4leYN7/lKayfDtSpEEnd7hcNZRNdCBdr0BOoFvEkMpo753Y4mEUK
         u0G9rYTXIFNIgZFNAfeO3sFHwEhzHA8SvU0a2OzMF1JNILmVhSI9uQy4jDpxX+6n6jkx
         nyetwZe+EqtJKuXDjlOAb/vJJzvm/xOCsnGVgTed7EGiNoAEXv5iF6wsFtsHdEelg4cP
         G8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747644122; x=1748248922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzWt6m0lDRu2ZdNfH+iSSvH3DFXB/9zKcDZo79oc998=;
        b=C2SMgmqH0nj8IcKA/Y5F2Td1IdIqcgb+EbE00auK1/g5hfenHY5kimpJyc5DjsOL/T
         n3HAasAGZUTUhL5lsrU9s7uPOHzd5PHT0Tx0eB5LNs9Pz+byMO3zF2I0aFfdVMty3uyT
         TKHamwExpcX6E/8fS5kVqXSQkftxNYCb12b1gCW3ibePhBG9/Nw+uKI+LAXA/nBd6zNg
         BktNcCSNZF7jAXAfKQYmnGuk7nJHFUozMhjbCPm1P93ybMqJaRSOzDfThGpMEUZ/HMzz
         Fei50a5z+9pnxNKqP/+Ew7X+E3vOnZMIKlusBVOfhdVqxrscE+QKsdU0oSECSiRaz7dK
         wjYA==
X-Forwarded-Encrypted: i=1; AJvYcCVxCMMmXtTNtF2cOdGhNfVCrlx5laoWitG8EDuNDm0/Hnt/QDP9USz7iLdgrir/Niky/+UIsXDyLoEeww==@vger.kernel.org, AJvYcCWrPUv+uq1rEnAeXkK20OO9bs0zrsZXW6G4itdRMPIUPVAlgA8juTkfGLquHGk54R1otq5WQHjZNMgyV0EI@vger.kernel.org
X-Gm-Message-State: AOJu0YyG5y02fnn0BlJXOIpKdzVswxW2TtbBT/dtCvClWDVxtb4HLYNZ
	B6PecFBj0oFNQM7siVi8yj24xbXcM+09OEdM0UKJ3VkZGi1/gNFWebJX
X-Gm-Gg: ASbGnct22VvrJZihhzZgwxNTjajDMm9Fu2OBflwrzHbmUOsWwYNJG/3k1AokSmHB/aF
	i60VkBEyDM+hUvZyTgM9mSAOutn+RNkXk2V3olEdmquiMZ+OIV9fu+yq8ufsXSzvYygN+3okQ+L
	kYFk2XpL4muWT0NYFWcWPFqs65gQ9ejiSZfY7quJNin7dzaxGB/8QCyeKWBMkH1vmMdopwQNan7
	4T5sLztCdq8ugbJbSMx9D4YB3lxMWAtiubI+EiWdDN2fHQeDBcHQrcZps5gvn/ECglRP6wTRJV/
	IFiEnAcCB4ju7Bq3VvbFWtaSHxO2K4sSJxlmR25RVYKXenaOwB5pevEQ/1/eB0s3uFykBZEHTsj
	GvNOxXJm5DSkEUCFLo+miheKiD5F/pq022s4=
X-Google-Smtp-Source: AGHT+IHp2B3z4W2bMyd5TBuk4PgK8+n1UaYCOLFHzmeY+snMZLImvlBRPKDCnxDxS2d4pCyCurKslw==
X-Received: by 2002:a17:90b:3905:b0:2fe:b8ba:62de with SMTP id 98e67ed59e1d1-30e7d5a96d7mr18939544a91.25.1747644122485;
        Mon, 19 May 2025 01:42:02 -0700 (PDT)
Received: from ubuntu20.wiwynn.corp (39-14-65-183.adsl.fetnet.net. [39.14.65.183])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401768sm9870275a91.3.2025.05.19.01.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:42:02 -0700 (PDT)
From: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
To: patrick@stwcx.xyz,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] hwmon: (isl28022) Fix current reading calculation
Date: Mon, 19 May 2025 16:40:51 +0800
Message-Id: <20250519084055.3787-2-yikai.tsai.wiwynn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250519084055.3787-1-yikai.tsai.wiwynn@gmail.com>
References: <20250519084055.3787-1-yikai.tsai.wiwynn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the ISL28022 datasheet, bit15 of the current register is
representing -32768. Fix the calculation to properly handle this bit,
ensuring correct measurements for negative values.

Signed-off-by: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
---
 drivers/hwmon/isl28022.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/isl28022.c b/drivers/hwmon/isl28022.c
index 1fb9864635db..1b4fb0824d6c 100644
--- a/drivers/hwmon/isl28022.c
+++ b/drivers/hwmon/isl28022.c
@@ -154,6 +154,7 @@ static int isl28022_read_current(struct device *dev, u32 attr, long *val)
 	struct isl28022_data *data = dev_get_drvdata(dev);
 	unsigned int regval;
 	int err;
+	u16 sign_bit;
 
 	switch (attr) {
 	case hwmon_curr_input:
@@ -161,8 +162,9 @@ static int isl28022_read_current(struct device *dev, u32 attr, long *val)
 				  ISL28022_REG_CURRENT, &regval);
 		if (err < 0)
 			return err;
-		*val = ((long)regval * 1250L * (long)data->gain) /
-			(long)data->shunt;
+		sign_bit = (regval >> 15) & 0x01;
+		*val = (((long)(((u16)regval) & 0x7FFF) - (sign_bit * 32768)) *
+			1250L * (long)data->gain) / (long)data->shunt;
 		break;
 	default:
 		return -EOPNOTSUPP;
-- 
2.25.1

