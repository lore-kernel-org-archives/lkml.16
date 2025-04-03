Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ADF248195
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743686865; cv=none; b=jeH/Jy5Ku1dGnHCRsQPmssKvjH56TvpFTtOgIF5WyBrigRV+iMzAhb3kXizo/GmHLQURUBrwCqmo3lDGlTiFgBhHzCFbkgZizItIuRulboXHuNvReKPpaKayAXNXBPlSAiM6Ds4459yZn5esCJzDnBh3/HEyt7e2EM7pQpiZef0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743686865; c=relaxed/simple;
	bh=3lqEc9rPy9OYJRQBlojfZPpuIi3iFAtcMjxPrU7z7DA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qves2atO4ggH40g3YouKyCbx+TJILTfflDHQ8l+aeDBPS4vbVA9Ye5IAFtqxk3YQKZEe/+s0z31vuHmSsKcs63dk6GNSpBMVGiLljHeRLrw1hxj4gkprmkUNAydRCS1pRIcQQjNJI7Pwz392YX2JHr6cA55z+ek2LvuBOqqNHa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9vsAYxT; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9vsAYxT"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3913958ebf2so638781f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 06:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743686862; x=1744291662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dp5nBsd/DFr5VpeaYg8UHTlBPWUcWv/79+vKJ0EyykY=;
        b=A9vsAYxTxDKykIFOTyV+Xh8SnFiLQY7gXqsuIDhzTNQgNFP5YzzUYMH7OjqK0ddHAF
         qLEVCRMgPWAzZekhNXJD/ED16zEMaLOFfjwcc7I3Spd/rWdc9WJlZWw2f9aSasfo1Op6
         94yvubYsNBUY9O7T/0RzmCAJNyGUcGbWt5errC/exlw/9HFpvUbrqiQUv+Abt4z5X9dX
         rUaWTEEGSRw4hcfWo2FtMKlw8AiwiZHZXb4Co6GD+h67lGeQbePDxeyBLHkxWakJe1ea
         mjLDm11RblKTC8ZNa/6VsbBFQ5JTfIjv747/dtNIyOAuxT2e0/6vNs+6GvH/pQaeiuvT
         YJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743686862; x=1744291662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dp5nBsd/DFr5VpeaYg8UHTlBPWUcWv/79+vKJ0EyykY=;
        b=Mo8o2+XYrJxkmcI4PKGmP7CR+XvVNu3mRv0EIvYiCx0pER1Vonxr+MW7FqcN4NHD+k
         45i3XNPxVIPWDku7NvpRD/4P8IcjRTK1nwP8fEYxWW0M5+VzQvjX974lS9Zetr8ZwPvL
         8b1glt8VS6TreoEp0NtVPLcIQE/G4K40f5t/LCkEWk/rjqtaRoxTQvlQAzF3i2vNjz9H
         h2VlP1LzaVD4g2u6uThaIPA9HdRbAnepI7xmGDwAjlgXlL72fjWcfo9768PwwoDzq7xE
         joiPfJRvxCTqQRKE/O173lFvxgCDkp6KYIYz/OKS3M7xoLaJkKaTqNufgLATqnAwbm12
         DDnw==
X-Forwarded-Encrypted: i=1; AJvYcCVmu/zeevshrMPPLDpJok6cG0qGJ2+1gphGos8Zx+3OWehkl21haS+8AxgZlrBCuhrg0FzywvJJepLvo/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YytM5QQVWleZXHjwkJklA7WBNSF2pxXbrrlOqI9PqRt34SE08yd
	+Wv1wbKrNSLtQk1y46/C+ywiGZOT00ZSv/BKNTRuF2ryQ35JtV+q
X-Gm-Gg: ASbGncv1nYhEHE8B/O2rAcN7QRRZw86w8M0rIeblqLtMgk1tuEETzP3vAkyxNnb9sBu
	6R5VHRprVtQxHakg1e2DwR9bKxuNGSNPhv14/SjeOjhxTQ7r064rvU9NniLjOuSV+dfDsr8myU9
	5Mp1B2whVwjVrCU9yWDI5LSmTslYLhBMoH8oeDq6jmIzlhbh5EruqQW/cb6QnJyDnDt7nU3N1GS
	2/Li5bzPB1wjXyUH8NHg5IzB31X6xrPS3yOzXeWc9VRSyG8OMKfmb0x46PqlHX5XyYfAiJh3Mb8
	lj+SH5x9zh2NnyNjHRV9PXPVI5b2dtgpMiS4ddlxbZooJ2IIqG3vnw==
X-Google-Smtp-Source: AGHT+IF8hv/rELd9ZpO2/F3vybwO6WLkSrCgrysuGBoCihWf+/H7dhnQV7G5SP6T1xyX8KA9DX7Wcg==
X-Received: by 2002:a05:6000:1acc:b0:39a:ca59:a626 with SMTP id ffacd0b85a97d-39c297687e3mr5947919f8f.28.1743686861580;
        Thu, 03 Apr 2025 06:27:41 -0700 (PDT)
Received: from HP-650 ([197.210.35.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec36691b3sm18621535e9.34.2025.04.03.06.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 06:27:41 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v2 2/3] staging: media: Remove duplicated NULL tests on a value in av7110
Date: Thu,  3 Apr 2025 14:26:42 +0100
Message-Id: <76351e135cf7ec4d609e60461bae4ba6d3c3a445.1743685415.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743685415.git.abrahamadekunle50@gmail.com>
References: <cover.1743685415.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a value has been tested for NULL in an expression, a
second NULL test on the same value in another expression
is unnecessary when the value has not been assigned NULL.

Remove unnecessary duplicate NULL tests on the same value that
has previously been NULL tested.

Found by Coccinelle

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/media/av7110/sp8870.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
index 0c813860f5b2..65842dd559e3 100644
--- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -508,12 +508,10 @@ static int sp8870_set_frontend(struct dvb_frontend *fe)
 	}
 
 	if (debug) {
-		if (valid) {
-			if (trials > 1) {
-				pr_info("%s(): firmware lockup!!!\n", __func__);
-				pr_info("%s(): recovered after %i trial(s))\n",  __func__, trials - 1);
-				lockups++;
-			}
+		if (trials > 1) {
+			pr_info("%s(): firmware lockup!!!\n", __func__);
+			pr_info("%s(): recovered after %i trial(s))\n",  __func__, trials - 1);
+			lockups++;
 		}
 		switches++;
 		pr_info("%s(): switches = %i lockups = %i\n", __func__, switches, lockups);
-- 
2.34.1

