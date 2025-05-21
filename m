Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AC61494C2
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819842; cv=none; b=U9a0rJrAdxzNLaRhBTv8WJmX1K0teW8bvU86PEZxXU6wdekj0cOCnjXvxjTqUPTx4YEtj4RxZycIshaEaiTfg7bmpdM2eXXSX1VdMZLpSi9GZkOBN8sa++vIVSRkt9o5+PxDeJfmaddGb/AJy/wOH4zLu0UBqpRcLOekVf5jybI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819842; c=relaxed/simple;
	bh=R17NssXV/QU3clKpUta5dw8h6ucij/YPwFGrlZXm6N4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yb8SPPNc06ea7yTK0ktsrcvmwviD4lPVJMzBULIMiVrTEKKMLREkwrjGml9wR0a+empfcaZkN/TVD9W4NulfLQkfmf4SDJwWRK5q6efCF9INLjuX29/du5Fz9PNlnZgTGLr+PlCMw1WVcHS159cjMBNiR5y3woa4ekWmnz7z5ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+CU70rl; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+CU70rl"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7399838db7fso6180211b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 02:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747819840; x=1748424640; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JVjUabk5NQmhfEI5CaBTj3E009mNGNPOZl2dDH0wA5k=;
        b=e+CU70rldwZvLhXC7Kzi958N78K6y8PU+bhew2S1TRWxPSNwCZABMpJUctHOWP8fa3
         2oIDU7jNmrs3T8+9rHUoVPASHrYUiSvawgAyFI2OBarXVJ4byqOf2dJ3Dcxzy+YFgW+W
         aWdQ4hiWM2jywyF3g5N9TiibSX0cFuElDR7OJisSFfDETJ1GvCFa/a9Vo7/jwlrXIqxx
         nWa9rPmtH0EQvqpuUY+pHQlYXwW9q6KIvf+OQizEOw1a3svNCQTmOnl+6jAJkjZp2s6+
         vsVidX+8Q7M0cDV9GliRm+srsB0g8/TxwoOYbeak4PkKL/h0WT3TBesk5y2/XldiZPja
         ttjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747819840; x=1748424640;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVjUabk5NQmhfEI5CaBTj3E009mNGNPOZl2dDH0wA5k=;
        b=v8lzJACnt+Xad55iFqvukJclRnMm5mjFibHImdNbVL7UEzSVxm0q6U2R6YzFaDOaH+
         h+UDEler1KlA8jpxEvaJc5czSMkUuy1m7sOAFLcwHvn8EO075BRTh4fpeFWNxQAWfyt8
         hS8g5yiX8jx3iQ0rAl+eOM8lPkxYHgjeWTLCs+cECjYrpkJAaMwU/1HQoO3sQvTBlcDU
         XjvO/XH+YqoeBqFheXtDjMlDyXiLwSYmOlSeQV5hEadW4ItwGmZJN8Ej1aHsg0OQ6AVS
         u7N59VRiz7ZVtLFuProRq5x71ESKP/kvUQi42mppitq97XSD8SHc95YX/+a8T5EMoSC3
         pMoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/gUy6SHAiAl128xfQtgbxN61isLJvfkX52QOatjqH9bVfU80YoVn1JcDYkBcO6jM1WIfljrwY8wDu4R0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkY/szYb3AzSUn9Ewe6lXENSqFsxBPjPk/GCqSN95hPrxyb6oM
	K63Z1D3q/l3KFEXVyZT5Hhpp9TIEd9xoqdZjy9xC9Qvb49wgqrToYXmQ2vSAOQ==
X-Gm-Gg: ASbGncuNz2cuXnFUjEX3AimnEep0GaEzxcFITa/Y1mocrbQqoP3pedhC/86xwZcSZFf
	3NJWJZSETATZsD3WcTls1SBdgv0c5JZceDviq4d8RHiUANOcHZpwszFpkBbvLp+AqWv5H7iiH2I
	vEBA1PAucwAp/iOLap/iRSkqkDTZzoQsJq8jOjCyLWl+LQxfTDqjBfBeeXDMZTAjjmhvBCn9LRq
	o/tyEhTm2KNS09InRVv9hprKVapfX6SAnvNFnfXkcUnI3sQYOTwbstc8m40ToReDnWlEJwyx53U
	dP7hjhIMQM47fOHUvPYvOs9Km2S0JhU13pvQmQYeWbjbvwl5vqsEFIbJmKMUlAhlYBDydA==
X-Google-Smtp-Source: AGHT+IHUyx+vlWYq4hohag+qL5ddwEkbL8Ga94LR9t3ebzdNx3dQ1c7jzeXIFn1QLgkVEwlx47k1mw==
X-Received: by 2002:a05:6a00:ac1:b0:736:3ea8:4813 with SMTP id d2e1a72fcca58-742a99fab76mr25752923b3a.2.1747819839565;
        Wed, 21 May 2025 02:30:39 -0700 (PDT)
Received: from brak3r-Ubuntu ([2401:4900:91d2:7413:9e7e:c313:d5f8:b22b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9877030sm9516405b3a.148.2025.05.21.02.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 02:30:39 -0700 (PDT)
Date: Wed, 21 May 2025 15:00:35 +0530
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
To: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V1] staging : greybus : Documentation : firmware : Replace
 deprecated strncpy() with strscpy()
Message-ID: <aC2dO1QKTVMOJQ8K@brak3r-Ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

----------------------------------------------------------
This is the new Patch for the earlier Patch hence made V1. 

[Note: there will be no significant changes.]
----------------------------------------------------------

Changes: 

To ensuring that the firmware tag is properly null-terminated. When copying firmware tag strings to prevent buffer overflows and ensure data integrity.


Changes has been made in 3 positions:
1: update firmware tag
2: backend update firmware tag
3: backend update firmware tag with unipro

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/firmware.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 765d69faa..f37904b91 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -63,7 +63,7 @@ static int update_intf_firmware(int fd)
 	intf_load.major = 0;
 	intf_load.minor = 0;
 
-	strncpy((char *)&intf_load.firmware_tag, firmware_tag,
+	strscpy((char *)&intf_load.firmware_tag, firmware_tag,
 		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 	ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
@@ -101,7 +101,7 @@ static int update_backend_firmware(int fd)
 	/* Get Backend Firmware Version */
 	printf("Getting Backend Firmware Version\n");
 
-	strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
+	strscpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
 		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_version:
@@ -129,7 +129,7 @@ static int update_backend_firmware(int fd)
 	/* Try Backend Firmware Update over Unipro */
 	printf("Updating Backend Firmware\n");
 
-	strncpy((char *)&backend_update.firmware_tag, firmware_tag,
+	strscpy((char *)&backend_update.firmware_tag, firmware_tag,
 		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_update:
-- 
2.43.0

