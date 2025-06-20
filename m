Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FB72DFF17
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443110; cv=none; b=sGxmjJVhpJPRRD78O2TiUWKLY7DpWirjwrrtLbVJUymvT2MRpwsNdAKEOGBfRxpIb9gcfoAB2pfGaXRx0ekRD9rWUQcVVc3ZhG63QmJeeV3d5xw4u4+3U9YG7ryw8ddl3o6oSnAWyq+6OESz1XrpaYEk0vfRhk9EH4q4JiFoD1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443110; c=relaxed/simple;
	bh=S5W+2wzhOf70gLHouOcf3i1hTYAKPJZKpUoJye4dZ1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PN8gKKteZ4jnyHdKPXZmj92agUX227TAVu8VX/ITnvH0ooEdnDPO6ODyAeovInBYaZke2U21rphksbY1gLSPuXXnlxBjA0dECPx9tiFcQhLczx8oSnW0H2YTR8c57Lttlhiu4tnxEEsQ9Zw/cHgrjAGWn+gTMqUsknFo9an6hfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfAaz1+j; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfAaz1+j"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2352400344aso22824255ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750443108; x=1751047908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pvtTJ1kHeCmxTLbmdO2cHISakb3o5Bb3qadp7bFl/tA=;
        b=GfAaz1+j+Idu1qfAVaWdZJ9lTcHoKqdxX8OIektYk4J3e/OFcFPuLSB/O2/JmzyFDP
         PNuZdPcDusB0BFiRg8amLE27gnU2Gc4FXCCh0rHxgUV1ShXI6+a24viLYlsqEtx0AnWa
         WRcEZ0ABaSydvCR3SgxBqvajB107VZBufYRUq3NdHVd0PG1loxLDjszrx8CWsGjyWGmi
         4p9ZCgKWFdbX58LwmU1ZoebBNa1WKnIEeSpdkO1whXf39h/FqySNLUzqk07HASqbowBZ
         eA7zRprzw9VmNWxGUx09rjCNbR/iBY1VrzG3S/7jbrhcYv13wmp1k3N/eBz5X3AQ9K8l
         5a6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443108; x=1751047908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pvtTJ1kHeCmxTLbmdO2cHISakb3o5Bb3qadp7bFl/tA=;
        b=me3i3PzdKNgh5qZKVaGpwLpVOul81Xgd8yR52pk7cVciqhHZt3PqTA8ZDeFugZA2sQ
         AFfOXrFHPGFNbBj47h6zqw/B0FVCAk82MgbPydEtNLyAW7XOJ8Uigz33EMB71uAeh7IN
         ZI+k2F+cRCZ0AFFFfWBhYn3L+sKAOjOYZ5J/Z0z6nmdwEkjyCldl2585WIUxYpu3ptzg
         dJMgj2VRHmjiJ+YdUlWSBooZ/ykUyi3ZiJpDeLsbpFTJF72CXdctURSKKKOUszlkIeZA
         jHxAYTKBDiOqEs33xoPdw4Z92QCojCPSKgEvqlMr5Vr7+gJhjKZq6bli3PlQKOdGszA0
         GUoA==
X-Forwarded-Encrypted: i=1; AJvYcCW+hCmDOsghKUUVRWzasKdEWWLetO5CQR1j64dZ4dt2s0DGMgNi9yOkVgmaadgDjkRM7BN2xsWu+krHkFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOPZ6HWClcbI81aamQYyszt8OsMQXE7pfoRnn2Lpwm14mJfumB
	QquA2b5dbt5fZXA/mager3Z1cro+gQUTdSwNmNLE24y5pmZiVHTUMJ/j2uID0g1p
X-Gm-Gg: ASbGncurDANFWFq1bnmMkBIDkByt+6vkF4zuDBABtTeBlkSe8e7XdAX+at+ixADzexu
	iCGG2aBWR+nrsmY9lUP16y8UTSRVKQB/jbh6UIv0sj0eG8n5jsLAieHzfk4a+Ubw8KJ8gwPSmLM
	z8ngzHqCX94FSsriQSLm8cpo3jwjsTryHnh2TnpcnPblZSt+coO/dTl4CBLwn2sZG3a+jG0/UUm
	OfuijYo+3hQdQawfWR0ZcPNqqiNvgFe5GYrmomumognnHOPxAtrMJXaQgHn3pBZAjijXsqN6GrI
	24pcjPVRdSX3VdbLwRbBtHB29YDD41v7PXY6AS/ucu1ttcwwnq9jtxnA33uSxm8=
X-Google-Smtp-Source: AGHT+IEkKualNq3kDWX54ZvRRoM63Hsk4wstuNdFVMQrD/3uSyOxwAAD1THoibWhcQxW2+2hUuNthg==
X-Received: by 2002:a17:902:d2c6:b0:235:f45f:ed53 with SMTP id d9443c01a7336-237d99b8f35mr62267535ad.33.1750443108280;
        Fri, 20 Jun 2025 11:11:48 -0700 (PDT)
Received: from p920.. ([2001:569:799a:1600:9fdb:eae:b35c:757c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83d0bedsm23005985ad.67.2025.06.20.11.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 11:11:47 -0700 (PDT)
From: Moon Hee Lee <moonhee.lee.ca@gmail.com>
To: alexander.usyskin@intel.com
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Moon Hee Lee <moonhee.lee.ca@gmail.com>
Subject: [PATCH] mei: bus: replace sprintf/scnprintf with sysfs_emit in show functions
Date: Fri, 20 Jun 2025 11:11:44 -0700
Message-ID: <20250620181144.10750-1-moonhee.lee.ca@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update all device attribute show callbacks in the MEI bus driver to use
sysfs_emit(), as recommended by Documentation/filesystems/sysfs.rst.

This improves consistency and aligns with current sysfs guidelines,
even though the existing use of sprintf/scnprintf is functionally safe.

Signed-off-by: Moon Hee Lee <moonhee.lee.ca@gmail.com>
---
 drivers/misc/mei/bus.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
index 67176caf5416..bc124a15006e 100644
--- a/drivers/misc/mei/bus.c
+++ b/drivers/misc/mei/bus.c
@@ -1156,7 +1156,7 @@ static ssize_t name_show(struct device *dev, struct device_attribute *a,
 {
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%s", cldev->name);
+	return sysfs_emit(buf, "%s", cldev->name);
 }
 static DEVICE_ATTR_RO(name);
 
@@ -1166,7 +1166,7 @@ static ssize_t uuid_show(struct device *dev, struct device_attribute *a,
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	const uuid_le *uuid = mei_me_cl_uuid(cldev->me_cl);
 
-	return sprintf(buf, "%pUl", uuid);
+	return sysfs_emit(buf, "%pUl", uuid);
 }
 static DEVICE_ATTR_RO(uuid);
 
@@ -1176,7 +1176,7 @@ static ssize_t version_show(struct device *dev, struct device_attribute *a,
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	u8 version = mei_me_cl_ver(cldev->me_cl);
 
-	return sprintf(buf, "%02X", version);
+	return sysfs_emit(buf, "%02X", version);
 }
 static DEVICE_ATTR_RO(version);
 
@@ -1187,8 +1187,7 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *a,
 	const uuid_le *uuid = mei_me_cl_uuid(cldev->me_cl);
 	u8 version = mei_me_cl_ver(cldev->me_cl);
 
-	return scnprintf(buf, PAGE_SIZE, "mei:%s:%pUl:%02X:",
-			 cldev->name, uuid, version);
+	return sysfs_emit(buf, "mei:%s:%pUl:%02X:", cldev->name, uuid, version);
 }
 static DEVICE_ATTR_RO(modalias);
 
@@ -1198,7 +1197,7 @@ static ssize_t max_conn_show(struct device *dev, struct device_attribute *a,
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	u8 maxconn = mei_me_cl_max_conn(cldev->me_cl);
 
-	return sprintf(buf, "%d", maxconn);
+	return sysfs_emit(buf, "%d", maxconn);
 }
 static DEVICE_ATTR_RO(max_conn);
 
@@ -1208,7 +1207,7 @@ static ssize_t fixed_show(struct device *dev, struct device_attribute *a,
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	u8 fixed = mei_me_cl_fixed(cldev->me_cl);
 
-	return sprintf(buf, "%d", fixed);
+	return sysfs_emit(buf, "%d", fixed);
 }
 static DEVICE_ATTR_RO(fixed);
 
@@ -1218,7 +1217,7 @@ static ssize_t vtag_show(struct device *dev, struct device_attribute *a,
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	bool vt = mei_me_cl_vt(cldev->me_cl);
 
-	return sprintf(buf, "%d", vt);
+	return sysfs_emit(buf, "%d", vt);
 }
 static DEVICE_ATTR_RO(vtag);
 
@@ -1228,7 +1227,7 @@ static ssize_t max_len_show(struct device *dev, struct device_attribute *a,
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	u32 maxlen = mei_me_cl_max_len(cldev->me_cl);
 
-	return sprintf(buf, "%u", maxlen);
+	return sysfs_emit(buf, "%u", maxlen);
 }
 static DEVICE_ATTR_RO(max_len);
 
-- 
2.43.0

