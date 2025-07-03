Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D482E337E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751538824; cv=none; b=bP2rBv9+jnM628i+ErZ7ARuBE8AOTOAgR7MX157xTyTcCs8ZDm2JkE669lgddK1OEpRqH79awnWPbukP22qqZhU6Eq9Rfibe0sWEm7tadg+WmrbLQPwLiBYoL4+ASl02TMmQTHEbcSEwBvlLt6Mdsm1CclRDU7b7RE38b3mw2kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751538824; c=relaxed/simple;
	bh=bol4/+leOyQLM/ui3EAgtQLfJLl/Pyhdj16a5UyViro=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fmwut9cUnlMurkY5FTzz59VF9q91epHy3PlfQnhCQVYgxoVJIL/HA1sVLvHiTusi49vgHVV4aVG9Zvw1meXGAMD7ffqXGi2YchOOByS11ekmBELU+s14pt3yq/QHZ9W+NuRiazTZE8VcHtBcLpARRLLo4gAnH9mpQl9GbFxiNII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKQqQY0K; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKQqQY0K"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-234b440afa7so80259845ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 03:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751538822; x=1752143622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KffizcJPG7tJJfsYFupmvFQGdXYLLGhJOn4ViNdKrBE=;
        b=bKQqQY0KjwUEP9vgvbRcuSq9iEPllRYssbFBcUG2WL2zQbNepcZxDQ+pMd+/usV4Fu
         EvaxJ/qL023WEdONLx9jDDXqMMv9SFk+OUPrrX1QnuFpm3dL9qOjW418rsmPPSz14o+3
         oQQUQWx+VPNCJ743GnOO5FruEFtIYwat02autIeMurnZTuBlB+PbzcPwnvcDsXIMlWPd
         3vipi3zrep4naOOEryyR8FfCxQa+N+vD/wcFBflrIQ/EDkme8ZfOUC4ZtOVY58wCErEE
         NeieFwy7MLoU+E8fWYNzKSUmCVpe++hMWStDLgL7kz8DCf8NKzmuWol/wd1F/segjTiH
         tuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751538822; x=1752143622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KffizcJPG7tJJfsYFupmvFQGdXYLLGhJOn4ViNdKrBE=;
        b=vYpkwQ19Cn5WMsifCXG0VnkmmRBKO5ll1fzjXZOpCfYeenBr2bklG6E0FAtzRiyoXV
         0wrQ4qtDby8b+I4yQnvreVMU3M4WNQZN9NhwQ/8dIXoBE39uAJ+yd9aaOIGShE+RGU2c
         42N7o/w+Q8BYNgtE0E8MB5KAx/3pBaQdILzdX8QFU1lzC7uzexiyLBSLfLOeQG52nKzW
         6b8qpbg++bAbMVIinzy1XPNg4c4Gi9Nyg5IuJvTmNAfTGjsCKtzp4HdUE8oNZERA7bjR
         zh7triK1Lk7vJWGi/9d0XVOgm972iKmODibKM+ZIMm0Rrj80BuFvrZk4eumgaoQ7l7Ww
         TTnA==
X-Gm-Message-State: AOJu0Yy5t7xKFicD7Cx0haNgcZSZ4fX1RE5WQNJvqbFohqrG2VyTMwHD
	erzBwYQu1CbkxCVSm480dUKzPpGJyV+nwx+HFHCuOhL0jI8dplgYw7wPGr1Wag==
X-Gm-Gg: ASbGncs2qMq+kf+HJx0T8f8+HAoig4OTxfYPLgJWEIALSfkhEIkC0cM/fCPkvziJjKl
	YjRiQwA2GR+Rj3Ck76niKG4j7VDgAykQvfeaA1XsXlVNTKUvdy4DhH8yejGBrX8mQ2P342+mPzz
	V7+K0OggV2O5WVyERPTYAi2I7mTmEhrRRGKmKpRWuZGsnkka6MkSAi5X9i2dsywTbkNMFq1sna7
	1yjIfPGXRVMQowELczbL98DKdbOhfK27Bj7slNyYoRYKSdiExz6Ab2l6jzm5iukgUUoJFrrh7Rp
	WdHNvKXOecP0UBWKsmdcmewKiwfFCvgeyelg6xYs2UCE0XA8qeyPevYQahRKuOFG
X-Google-Smtp-Source: AGHT+IF3CVTuCfYYzYkb21SrAxcXCGNaK5hQ49zjS2fvIvg5Fea5WmCj3enJzLOLGO3GuEwVAZ0mHA==
X-Received: by 2002:a17:902:d542:b0:224:910:23f0 with SMTP id d9443c01a7336-23c6e5d95a2mr87251545ad.49.1751538821692;
        Thu, 03 Jul 2025 03:33:41 -0700 (PDT)
Received: from pop-os.. ([2401:4900:1c94:b791:580e:e15d:ed41:7316])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3acbf5sm149264425ad.144.2025.07.03.03.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:33:41 -0700 (PDT)
From: herculoxz <abhinav.ogl@gmail.com>
To: morbidrsa@gmail.com
Cc: linux-kernel@vger.kernel.org,
	herculoxz <abhinav.ogl@gmail.com>
Subject: mcb:[PATCH] use sysfs_emit_at() instead of scnprintf() in show functions
Date: Thu,  3 Jul 2025 16:02:42 +0530
Message-Id: <20250703103241.10199-1-abhinav.ogl@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


This change improves clarity and ensures proper bounds checking in
line with the preferred sysfs_emit() API usage for sysfs 'show'
functions. The PAGE_SIZE check is now handled internally by the helper.

No functional change intended.

Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>
---
 drivers/mcb/mcb-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mcb/mcb-core.c b/drivers/mcb/mcb-core.c
index 9b8c40a6459a..c1367223e71a 100644
--- a/drivers/mcb/mcb-core.c
+++ b/drivers/mcb/mcb-core.c
@@ -107,7 +107,7 @@ static ssize_t revision_show(struct device *dev, struct device_attribute *attr,
 {
 	struct mcb_bus *bus = to_mcb_bus(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", bus->revision);
+	return sysfs_emit(buf, "%d\n", bus->revision);
 }
 static DEVICE_ATTR_RO(revision);
 
@@ -116,7 +116,7 @@ static ssize_t model_show(struct device *dev, struct device_attribute *attr,
 {
 	struct mcb_bus *bus = to_mcb_bus(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%c\n", bus->model);
+	return sysfs_emit(buf, "%c\n", bus->model);
 }
 static DEVICE_ATTR_RO(model);
 
@@ -125,7 +125,7 @@ static ssize_t minor_show(struct device *dev, struct device_attribute *attr,
 {
 	struct mcb_bus *bus = to_mcb_bus(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", bus->minor);
+	return sysfs_emit(buf, "%d\n", bus->minor);
 }
 static DEVICE_ATTR_RO(minor);
 
@@ -134,7 +134,7 @@ static ssize_t name_show(struct device *dev, struct device_attribute *attr,
 {
 	struct mcb_bus *bus = to_mcb_bus(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%s\n", bus->name);
+	return sysfs_emit(buf, "%s\n", bus->name);
 }
 static DEVICE_ATTR_RO(name);
 
-- 
2.34.1

