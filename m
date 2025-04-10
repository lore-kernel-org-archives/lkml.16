Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632B128C5CB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290401; cv=none; b=E8GHslHek+z98B7wlWqo1WK9znb2n5B3OP65lt/2P+NSMa2Croxa7MnJsonQfEsFMI2sHeM9a+L2uWpSQFqC4H78alPI9ABd1l4Neko0XxGmyBecIXqnEaMzeAqtvw+OAPB+f9V73BVZ8Se7oUkIQA1mVX9NWgWlUV+Lcyhcs50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290401; c=relaxed/simple;
	bh=RLvJY6k0Ft/kKNsXLWv6b9OSzSANCOtlQC0MOioBDnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ux7HCZFdYoEyMi0hCGEEaSM2vPk0lh3dZWp+gbZBU6YCkZ+HpMGc4IfJnnLubZ1Kh0MWoU90Hblr2UK3b9kLPcoYGLfkcRGxme8VZjusbU8VZb7hiFNYXtYlkUvKB+bHkFuMShEfRepdU+w2NwuTMb+loTwDGA4wIqoArwbKWGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRhZVwV8; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRhZVwV8"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c1efc457bso440008f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744290398; x=1744895198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PezLJb+uiQj2Xf3u6GMrlRt9kEp7QeWIW2xH7iXqTd4=;
        b=aRhZVwV8YnF3hq3sDS4ipInDN8/wU7PL1D4Krv/Yst07/6s6EXmd/E34JSpHkh+9WH
         sKckArojyZJpy0nNPy/K3ltdJpycsUmZhc42xrnWSYkLYsklwLNq1OtzeLC5Y1LXTzlE
         xY6u/bG5zAGNmrOypUkAzqtfw7AjUGaZgR2yvwnMSkyTdwi+aK/EVT8KT8U8EvggBdaG
         vUj2MDHQUjlIPs9YPIbrzW6ZkQb/1wBL+uOSvUpkk3jwy0yuTA5tWdBOezQSH8vyiBnl
         2O8Gvw7FBArv6+IK+bKJicAkKVe6susx+ZaxeYCR0gc5tsAvS90Uk2MbCk8g+n2XYAwL
         On/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290398; x=1744895198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PezLJb+uiQj2Xf3u6GMrlRt9kEp7QeWIW2xH7iXqTd4=;
        b=V7f4u/B4opuA+sCj3EetWxzs00trPZ/ZJ2XLcjf/QyWyMkEi5tphwpVdQm3mvMoSsw
         eEs3J4jkdmAhXIkeKDIEw+ONI3of93a/ViQxjYmwYG/sLncHdIfKL6Mwc8s/zasf5sCX
         K1KkUGffUq9SWFhz4LfRqYAbpAwv4+SDbgTTLGtm0cV3FzaFF/UD5385gXdR1JH+4sww
         RQ4f3wBGiO9+6VzsmRGQPu7Rn1019pd02WGxQUBYe88gVYu6A+CdU/3qvWbrnSi1tItT
         5CUWgZiXbnhIniOAk94q2iYw8VDKV0Df5069h7YZ4Epu5oX6YW0Iip61pANNRkWTFVsO
         VIYg==
X-Forwarded-Encrypted: i=1; AJvYcCUFkTNzAMd72t+CLPNNknSrhPL6A3pzqIj3V7GpRglPdkJfogZ3/2Gky63B21tAgFpe93WpYmORQw5DrvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzILIe71lLWAjDLwRUoemYJppts5R7PFcLgXvHJ1YvJ0LdBi6xq
	tox2rhJoJC2KVlGgh5WxXlVTCJBgKpe2cDpJASLnUI5SjMVqhDC5
X-Gm-Gg: ASbGncsFydyx65rTV2bzs+stODRcsCkjLf09RgXtc02i5r00E3PMDldBw90SlvhyMZ1
	rjUU2YaSzabt4BRjx+qG3BRHqis50JYfWKda7bt+empJT+qk5ttnJzuJR1W18rK7eiP8q+mQNgf
	Y5R7JdUnPB6uoSO1YRTnocCY7yra5alcBmjSNMZXuZl18V0oiof0/nNv/fgrSJpk536Xsag65NW
	Pr5+WM5IpTYECfGzw3rxLhXncv2ArY52SNujpfOKbTOq9FmFM9wAv77uwvnovgQEKjlTrf0kc02
	uoy2gGvDAz0fcI+nsTNzXSoBQwUUIrDiDPwxGA==
X-Google-Smtp-Source: AGHT+IEFxQsQgNXoIR59o+LR0OueEaW4XDtVPn2M5POGD1JPeTBqWJbinPc88qOx1zjcpAFrQNdTuA==
X-Received: by 2002:a05:6000:240d:b0:38f:3224:65ff with SMTP id ffacd0b85a97d-39d8f46566cmr2497110f8f.5.1744290397361;
        Thu, 10 Apr 2025 06:06:37 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc6dsm55013045e9.28.2025.04.10.06.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:06:36 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] staging: rtl8723bs: Initialize variables at declaration in odm_HWConfig.c
Date: Thu, 10 Apr 2025 16:06:07 +0300
Message-ID: <f8fd7b9ec1a1fc1a65be5e7735b37c42032e9715.1744285781.git.karanja99erick@gmail.com>
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
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 994b8c578e7a..85cda5c3a5b5 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -52,9 +52,8 @@ static u8 odm_evm_db_to_percentage(s8 value)
 	/*  */
 	/*  -33dB~0dB to 0%~99% */
 	/*  */
-	s8 ret_val;
+	s8 ret_val = value;
 
-	ret_val = value;
 	ret_val /= 2;
 
 	if (ret_val >= 0)
-- 
2.43.0

