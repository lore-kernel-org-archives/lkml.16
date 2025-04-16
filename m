Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B009A18870C;
	Wed, 16 Apr 2025 16:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744822237; cv=none; b=TtuhnJcCegnSflNpfd+Qxu63N1faYX9xOLVeT1GYlFBorEm17xxd+4Px9qcl3YooMvRAK0HMDUNgS1rbmSnBzzODgNTLAEr/JYYLhthmmsbBEgfhIuyBKPZPfA3Nzg8UiJuxV75NdD2LiGsMeg44Utpo1+jMDf/JWJyQ2kNuYhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744822237; c=relaxed/simple;
	bh=drLBaRFnFtcJhEny1EwRWnZIgPcfpUuBFPn/1ApNR1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WGAoH1dz8vaHGMzmkxpElK3p+LmKmgWk4FLv0UUWkvRvY8QMeFl4+NSb+phH5GFkelX7IJpraJ+bS9wGULn5gMCiBMx9llUwHeVXGwi1AnCsz8TcVk25T+jMw5vqtdoouHs0fR/3zapZaqN+3MDXGkIAw3O9BDtpZda+0upF1xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JisnQYZg; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JisnQYZg"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af19b9f4c8cso4840716a12.2;
        Wed, 16 Apr 2025 09:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744822235; x=1745427035; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dUAg0J+l++2Y5zlL+T7iinGyhfwVzZV6/36A6xZzl+g=;
        b=JisnQYZgh4H00ld4Vl4HkPZVgr7BvFI4jkknyGio9EvbMYMq9eCd2KYXhM8Yhpa4WH
         mTbnWwz03JwKMfGLVMdjisdq19bDi1rMHJXRPK1Pr2vsDtGLJFe7+F5hSSpMqJcpdvzK
         23b5D8Mq0lIUsqvXvIq/JBiVu61W4a7vxQTUGw+NvnIhhDYkLuyoQY/J59/yEnZj41F2
         ie0+lq46bx7PYynU9iCJeZkNbeKX+iMgtc4Y6Q5SoJPimUOCjLrZvKQnVamNypiL6GyJ
         fs/hcgeDJeczQp/d1KZRpBHyVhwbMarDR3YtzJj+fL7Anh3UBJX15sTRC3k0TtJGUMFC
         j1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744822235; x=1745427035;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUAg0J+l++2Y5zlL+T7iinGyhfwVzZV6/36A6xZzl+g=;
        b=Z2zP5DUWjj7iQWZNxRT3UJggX5xDyQpIUrvYpUnB5z/eU4RZeK+KROYnpJq+BGOUio
         D0PtYHulM9ZwjRduvbs4e63GW2hmnWBYRjNTtgf3/wADoQpXlkNJchLIY6pwWXoEQRaR
         tddgYWwsoc35ZWmqsuU6ZF5GlAewnYLWZttAI+2iMD4hxldG5WLOjQUkbLsNYbXYfUjz
         t5fBquIf9QDPpC8UPkxD2X0eEZ5rUv233VjwYdhbs0PiOLI21bQ10gU9wT2ol1T++iQy
         lQk70Iq7Hiu7MbDZdT2fXN9hWDnhdzoWA2GIsCfIt78+BM6U4Gv7tLLQfgAOB84tWJKp
         jBdg==
X-Forwarded-Encrypted: i=1; AJvYcCUbIjk4DqfKmKNeTFA5MnoeJoF2KcEJxjewXhL2uKBDn/6bbdNMTE24Er4ip347+kGLeqd8S2S3wVUMScc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx5c4oxwEbWR0BZ4njyLAWXc4E9MoEBGR+R+n8aTIa6p628gti
	DH7d3P8yOk6BSbM74TMBWhh0Qw0zCl5g6FiePKD45EuTI+zIHKS9
X-Gm-Gg: ASbGncvntanJ/0Q1+2XpOZZ9+/GxndJq2PO1f5a2jpCuUTJ/n54yHHrP0Zya3DDDVb0
	AxT/RvV+UCUgb8NQ7QyoYbFGvIQtWYcTR6oGIjgAoYqDdiJ2I0vf7/2MyKRkZdh+UD/cGDXx+bO
	1grxgkc+aHLdRCS3KsnoQ9Ej20RPPkma3ccJm+XWnnsZlTjLdvEmNyJqNGFoLJ+ttwYDkasaQ0n
	Nbr8qBSg9P8ZyZ5vpXD1iGpMAx1fj73LhOe/jfAUsOlOepfya6COI9EhU+3mIhu5Egg9VhsTGbr
	oI8+oOd2DP0g9GCr/2yUxShCWrqBa8SnEExeQHp+
X-Google-Smtp-Source: AGHT+IElw45iHj9nPhEEs3jbU49ufzc0abu2uuzdfe/aqY/D3rP2f9Fxo7i6iTeXTnB5vsO/FcR9ZA==
X-Received: by 2002:a17:90b:5824:b0:2ef:31a9:95c6 with SMTP id 98e67ed59e1d1-30863f1a0b8mr4481406a91.14.1744822234822;
        Wed, 16 Apr 2025 09:50:34 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcc178sm16562975ad.204.2025.04.16.09.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 09:50:34 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Wed, 16 Apr 2025 13:50:23 -0300
Subject: [PATCH] platform/x86: alienware-wmi-wmax: Fix uninitialized
 variable due to bad error handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-smatch-fix-v1-1-35491b462d8f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAM7f/2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0Mz3eLcxJLkDN20zArdFENDS8NUI1NDkzRTJaCGgqJUoDDYsOjY2lo
 AV9QCDlwAAAA=
X-Change-ID: 20250416-smatch-fix-d1191e2514f5
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>, Mario Limonciello <mario.limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2

wmax_thermal_information() may also return -ENOMSG, which would leave
`id` uninitialized in thermal_profile_probe.

Reorder and modify logic to catch all errors.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/Z_-KVqNbD9ygvE2X@stanley.mountain
Fixes: 27e9e6339896 ("platform/x86: alienware-wmi: Refactor thermal control methods")
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
Hi all,

@Ilpo: This will definitely conflict with the for-next branch when
merging.

Also, the fixes tag references a commit from before the split (same
series though), but ofc this fix is meant to be applied on top of it
(fixes branch). Is this ok or would it be better to change the fixes
tag to the "split" commit?
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index 3d3014b5adf046c94c1ebf39a0e28a92622b40d6..b8e71f06fdde347573bff5c27a9ba53a0efcacae 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -607,12 +607,10 @@ static int thermal_profile_probe(void *drvdata, unsigned long *choices)
 	for (u32 i = 0; i < sys_desc[3]; i++) {
 		ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_LIST_IDS,
 					       i + first_mode, &out_data);
-
-		if (ret == -EIO)
-			return ret;
-
 		if (ret == -EBADRQC)
 			break;
+		if (ret)
+			return ret;
 
 		if (!is_wmax_thermal_code(out_data))
 			continue;

---
base-commit: fcf27a6a926fd9eeba39e9c3fde43c9298fe284e
change-id: 20250416-smatch-fix-d1191e2514f5

Best regards,
-- 
 ~ Kurt

