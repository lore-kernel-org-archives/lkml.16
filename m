Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38C31FBCB1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744361692; cv=none; b=qP+DERl2s89bzIAQpb5p/4hYaYdN8HPv+sVuo+5RNcbw/SLzzUK37QWwVYqFtaRQTYQ/dC1xausm9xC8RGrFzAWFb4grxzbUnsPvKV06s2iyXMEAqX27pHlwLPpd7YHWHCo0ueRYv/FRP6y9h9c29p6BkRelckCBP/wK6MGmxdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744361692; c=relaxed/simple;
	bh=KyprIQ1opyL0FHE3sPCvabhtO9sp9Wx9Bf3O/mgmCHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UnNsl+JmygiId3+2zTOMScd6138jaZ3QJExeYare6aMjEoWWjUaK0oYqpUYoN3YjF/GYDQEgfe+SIq/MFBm/GloQUG61uylST+aeCsdAvButpEK/Igy4DLxDBybKu2oQNr0KajQJEhTa9ISVsSPUzTRndOq0CXZviOXig+AvtXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQAaC1bg; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQAaC1bg"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39bf44be22fso986872f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744361689; x=1744966489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vz/eRrE6itGPGVxaacR7mXYGhUWJFoHHWj/Si1MrSR8=;
        b=JQAaC1bgiQhjxH/27ytI7k42AIig1mptviwi2C8Nw8b4rGsIDJavdjn1oW995J1PfX
         8qYTp4R2vihWZmhE99LQSJfNPoo2pVH6ePyDMGa/FLbYEWOXCgfgoNgy9hKHwO1pRg16
         o7t3sX3d2s0T/XLfuqkr1K8XCFe1GNXthTzouXtTKys2CBDozjc1ts1Jr/yJSLGEbGv4
         3oOYlb8Jn46pTbdn2FBJKn8kFFKx3OxyxpybPwxTVlj3J+BxdMCq6yREv9PXIE9D2Ugy
         2lkGeP0yB/HW5Fl9fVe2j2124R4CDzj6qFHE1H9CcnnRYPhH/CjS/XP3C77ZWNnWOVzT
         4QsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744361689; x=1744966489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vz/eRrE6itGPGVxaacR7mXYGhUWJFoHHWj/Si1MrSR8=;
        b=nww6gzQuvatIHaLZJhBcwGnBo5onva+nZOrueWp1SIv/OKk8+hgpRznn5pryMW+V/A
         T1jv7Ciq6CN8XwLzNMxVKGTP9faRlZ++JoRhiIL0/Zb5rIOtAxlaN/aTAWfkyngndthY
         H0ehM6t5BJAKIQxtDwWU+nG0TMERe1i3omU9iG8DomTNRCm5zCWsawKRl6N5GXEggNDr
         vvBtV0tQw3zmoHuDnxUtG63LdQoydb1s8JD0u05WjWA8G95KNRPVuQffFWCLk2fuJ+Nn
         T3maU6rBpVfGwVFPOtQJLDTbpWskSD9mApK7Vvq2Uy+0kHUeL27fylGIpKiZMbr2OvdV
         Lwaw==
X-Forwarded-Encrypted: i=1; AJvYcCVCo55Cl9bIyJKUN1BiGkYW+TLJV2TwGW5cenvk+GSS/S57BVH6h+g1bAUsfKp8zqeJ5y06KSsviqm6cgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YysY+lfWCSneaHJKhv+KJ2TOXDGTbo/pmkR177D4i/cWRTT5sxC
	qFGitBc3Ft76aRUH1u0JCepzEKVXayJpayeHQ4m35z62kGlg4NWt
X-Gm-Gg: ASbGncvyTM3YRrQveroUwAZN3wUwJwH/3Z6xdab91ta2cACE63j0USoX89x62E690W3
	170rzcCjEbX/RDdnlnQVj3XPfyHU2i+IBvIYU/DMsWR9oNedcM/I5kTjCujDPmJLGo/ElYFDiJN
	w/7KyOSAOD14JBrfjx5jrAHy7K1CeIynO6pDXVm3S7l4ssmuZsP74PQtdvdH7YctDyNHlUGvCkr
	O3qqO8PYH1Hog8iqqeFhXvcbS/8xi1/RoZmtzDcBBbok+P7J+rKpkabwpwVyRaE/SNiB8cLnO1W
	vk7CP6SG2zEG9duq6MQvuhZ5PfDZSxgYFQlMgQ==
X-Google-Smtp-Source: AGHT+IGQ1mfH6C1lv6nPAfeEQxxFNgqLIGSJ8pGCODJSkV+yOQ2XrVh0Z4UA497MoeC2lYlZFxEDvA==
X-Received: by 2002:a05:6000:4024:b0:399:71d4:b8 with SMTP id ffacd0b85a97d-39ea51f56a4mr1364349f8f.23.1744361688920;
        Fri, 11 Apr 2025 01:54:48 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205ecb8dsm80867345e9.7.2025.04.11.01.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 01:54:47 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Use boolean false instead of integer 0
Date: Fri, 11 Apr 2025 11:54:25 +0300
Message-ID: <20250411085425.44177-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the struct definition, adaptivity_flag is defined as type 'bool'.
This change replaces the integer literal 0 with the boolean
constant false to match the declared type. It ensures semantic
correctness, and aligns with kernel coding conventions
that prefer true/false over 1/0 for bool types.

found by coccinelle

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_DIG.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index 97a51546463a..1e2946a23beb 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -56,7 +56,7 @@ void odm_NHMBBInit(void *pDM_VOID)
 {
 	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
 
-	pDM_Odm->adaptivity_flag = 0;
+	pDM_Odm->adaptivity_flag = false;
 	pDM_Odm->tolerance_cnt = 3;
 	pDM_Odm->NHMLastTxOkcnt = 0;
 	pDM_Odm->NHMLastRxOkcnt = 0;
-- 
2.43.0

