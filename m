Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2807A17597
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 02:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750387666; cv=none; b=KURCwTUh/wC7qqEtsai99nU+KA2iSZhWxJlNUYi+mOxuBY9YQsfPAd00zRHDVLSKttsCimaCjAEcmLofKsgxjlCVS21abNtYC4szLm8HXA/Cld3o3y11kjswbA0HlDPHYDxahN5HM4sOW+vlqq89uFRVRlTv15YaGc2duv5bpZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750387666; c=relaxed/simple;
	bh=9krkxQMYDu3MWi01N7J6BlgzuRsjElpV4VRMK1ZnsVs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=inRtF1h+HpAMqZdfKRBolayvHAS6iyf1ONubOreoJytfTtx6DSpjVhl9kkpBFycAV67+YNo8+SXfb42gIXqCRriLE+IubQPBdxgS8hyxUQuT/ksuyktpO3s4EmTLnmoi4LccsR5PDsNuVy4Nnl5VGga0mO381Ijz8mzwJohOLTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IoVqO37w; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IoVqO37w"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-748764d8540so1289619b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 19:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750387664; x=1750992464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4mJJTvXvtWN+ybMkRH/wKJbjOL7koZZuVsnuFialitc=;
        b=IoVqO37wvRK8A06B/Ed/vUVOcMvOJ8LfsmDVEMHhtKyv9UgFahNRVEwZ/x+YLel1K0
         AFb50VljFpD4EUS/QsJmfHVUqqWJZ3mNfl4QsU50AVh5YV4i+a3Fsqdv6dgIRcm/xHGB
         rqHUKinWEdmFU2iPPgaJ0YfL6MaMUOfCr6jEZtBGoNnAen9I3vaaa9v+7pIM4+RnD06B
         /a8wnW6+I5GWoAsHE5ypanhI6ZM004J9UZ4lCfaD23Vphn9svrz0h1TqbgsLrsG+a82E
         yTrwk9wJeYyb0TYrw6+cxRpt+MQjIv+qG73NpxkPewgLrRMVuq9OujJ8ME6RjK/nvt6M
         ThoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750387664; x=1750992464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mJJTvXvtWN+ybMkRH/wKJbjOL7koZZuVsnuFialitc=;
        b=qEfNY8FGNVFUSQpKH00ZQj9H5LpH6uWJ1Ur7dKHUIeXvtZqpYQO4eupPycJVhdTDzr
         7cgIEcqcHMVFrJd+Y0OQqArtIbtkJYanogtnLFVlm0gMv96ieuRn+VHcjO9ZPqFC14fY
         svwkg/AGyNocF+UExQqRF//Z8fNtkQYH4XSr5ULFGiL7shRDcydB2nSfBoux1ivdyuNZ
         fGusSzVfud2Q5WwTcutQhZA8lxUG1D+wFzBS5arbDlyFhnBMC9+3xZwqIowXJjFEqn5S
         Ct1txFbbe3J5asNeDTdBi5X8a+/m4EGgXy26jEWEAHMyo+RY4/vFH8z3g4ohUTsnHZqr
         CKqw==
X-Forwarded-Encrypted: i=1; AJvYcCXqgOBf19+U678Ci/of3sySDUWHmBtuC8cv2gKA6rIs8ZUq+E8qFesriFOefs7VNnICYgqSQ1ln5Vx33UU=@vger.kernel.org
X-Gm-Message-State: AOJu0YynOLRLnz6KDI/Zd2If1QKq+Dtz5XqacfNPS12MQlJJdFtcCr9R
	79fCqQaQwCb4d5Gyn1wY5KdkB7y7EfXKpctaXptu2L+54Zn7tGuG/1P4
X-Gm-Gg: ASbGncvcRIyhAK4YF+ZMVx/tezJvCyYoc/qeWbWTKn+kj7uqNBaHDCyoAtmdGj7jmdn
	bd5S/pAA9CXNyhGucsc813tRaWCcsKuyu5a+zr8eVNQQ4hPLn/ggh3swZ7cIo0SFSdMCSuLr4WY
	omtEaSu2BvfCypWAt6UywEziE7oMUcQshIR0wKqTZOlCmmz6FDdSvV3M1oGgie774+4eFOS4H7Z
	yKaQsF00Lkuzt++IJaHu5oWZL5+9GCh5fH1zNf8OYTw9CRxyFoi/qSZxSYi9qwZm5Nt/mEFNc1N
	WHASBQDr3y0FcL0bq+KKcC/6T5BTZXO10DADUFVYjacYCHQK44j1sW+/RC9cNDlm4L4khSvCKji
	FNKkAMyEZ3dEphofSpxhMDJV3GQeT+cIBQA==
X-Google-Smtp-Source: AGHT+IEF1HVwk7rZIuKPFFF0u/ApToJ60nR1yo7ZaE0JKrdUL4IvNm5599ieCkZAjKRNZhvRMgO1Jw==
X-Received: by 2002:a05:6a00:2386:b0:748:e150:ac77 with SMTP id d2e1a72fcca58-7490d6c3b5fmr1387481b3a.22.1750387664321;
        Thu, 19 Jun 2025 19:47:44 -0700 (PDT)
Received: from ankitchauhan-Legion-5-15ITH6.. ([2405:201:4042:d128:87bc:2aec:e545:acb3])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7490a621ceasm899148b3a.97.2025.06.19.19.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 19:47:43 -0700 (PDT)
From: Ankit Chauhan <ankitchauhan2065@gmail.com>
To: fbarrat@linux.ibm.com,
	ajd@linux.ibm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ankit Chauhan <ankitchauhan2065@gmail.com>
Subject: [PATCH] misc: ocxl: Replace scnprintf() with sysfs_emit() in sysfs show functions
Date: Fri, 20 Jun 2025 08:17:05 +0530
Message-Id: <20250620024705.11321-1-ankitchauhan2065@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace scnprintf() with sysfs_emit() in sysfs show functions.
These helpers are preferred in sysfs callbacks because they automatically
handle buffer size and improve safety and readability.

Signed-off-by: Ankit Chauhan <ankitchauhan2065@gmail.com>
---
 drivers/misc/ocxl/sysfs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/ocxl/sysfs.c b/drivers/misc/ocxl/sysfs.c
index e849641687a0..f194c159a778 100644
--- a/drivers/misc/ocxl/sysfs.c
+++ b/drivers/misc/ocxl/sysfs.c
@@ -16,7 +16,7 @@ static ssize_t global_mmio_size_show(struct device *device,
 {
 	struct ocxl_afu *afu = to_afu(device);
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 			afu->config.global_mmio_size);
 }
 
@@ -26,7 +26,7 @@ static ssize_t pp_mmio_size_show(struct device *device,
 {
 	struct ocxl_afu *afu = to_afu(device);
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 			afu->config.pp_mmio_stride);
 }
 
@@ -36,7 +36,7 @@ static ssize_t afu_version_show(struct device *device,
 {
 	struct ocxl_afu *afu = to_afu(device);
 
-	return scnprintf(buf, PAGE_SIZE, "%hhu:%hhu\n",
+	return sysfs_emit(buf, "%hhu:%hhu\n",
 			afu->config.version_major,
 			afu->config.version_minor);
 }
@@ -47,7 +47,7 @@ static ssize_t contexts_show(struct device *device,
 {
 	struct ocxl_afu *afu = to_afu(device);
 
-	return scnprintf(buf, PAGE_SIZE, "%d/%d\n",
+	return sysfs_emit(buf, "%d/%d\n",
 			afu->pasid_count, afu->pasid_max);
 }
 
@@ -61,9 +61,9 @@ static ssize_t reload_on_reset_show(struct device *device,
 	int val;
 
 	if (ocxl_config_get_reset_reload(pci_dev, &val))
-		return scnprintf(buf, PAGE_SIZE, "unavailable\n");
+		return sysfs_emit(buf, "unavailable\n");
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t reload_on_reset_store(struct device *device,
-- 
2.34.1

