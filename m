Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C665620B80D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750071399; cv=none; b=UN6qRY2uYAC0tftvSNXTEImKYjcvqSN0yGP8jpge7Gg1+9v4dhfc5/b/ZF+5qrZtqJP9Y4osUSwykWxFa2QcSje4KMRRotwUksihNBazzyu0pslrLxlp3sVqnWjztq41izenMq4RuDjb0mKXQYvEgHbTsDnawSfZ2CuIWe7dOz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750071399; c=relaxed/simple;
	bh=CkOxFf7EE54QiWk3H3djGE1kHgl8sxStzqzBqhoUAzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QSYcG5RhKuhYv7nZcntULPDrw0CtmwPeOYRTgWZ/VuEmdzHri0HNPzU9Bja4bxM09RMblfTPNm+uA7VIwaDSZxm03vJqgOOI8hrGYge/dPCcrCxbnwYoFwuK/uz3sTFctpvqTwCxi01Ii5LuXHZ+VlkM8tK3P34X/YqaskBpgyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wa/3r67e; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wa/3r67e"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-235ef62066eso64507735ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 03:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750071397; x=1750676197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BdDBWycVFIVV412Xw0TdxhPfgA72SVqwCO00BmRsjEc=;
        b=Wa/3r67eAb/TEy3tbu3GEtPAd9ywP/Nyv7tqvpQY37812UIoLbL1bCu4h6EN0O7d4l
         3xDwBF8ZH1FnX+LK4BCeg/7sdX1EHtdG1X4V13UynGpKwIM7xgrCW/fH6U53XqEXQoJZ
         V+4Sd93vp7VRnj3WvjHkE3TsXbe32gD0Ze7o7MS6LUF9XY9QyIsLFGlTCHcQF/IiZIOt
         r1JJRNNGR3rGIEgteGip54/NbaRX5pIyR4ceRvOskk0WjDM2AvqcbViEksl8bAaIvkYk
         GWLZTbHckks8l4DJPasepAOl4dqWYNMErcW67YwHCAVq3W6vNka3JlwjGOUZ10D1GDAG
         W4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750071397; x=1750676197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdDBWycVFIVV412Xw0TdxhPfgA72SVqwCO00BmRsjEc=;
        b=JX+MfcWd3FeigPOXdByp88q+tyMY9NmmiB3AhssnAZr9/Ug6yR3n9pnhiFdQ8ISDKG
         huAWneRD+E4xpcQ1p9wDH90Ox98CZcj2gQvbmgC9vFOZ2pollO9MBH+abpVU5a4Spf7K
         hVTdmt0FH3SeSyGB2TuGiMWUFXkQrPTyhyRhYAqr5O40TM2pDqhnJDzd5k0KXOeA0Ven
         mY7qTYKjQF/RpemzI/Gy1dHtJs/YMomrFtO4LoLoZJ2YIdvoh7WXQhDPOG53no3hklKP
         CrvopLkTATE83chQMf1zY+n3WDiJmMbGpeh2FAsgv4dnH4V9l3JC2BlF7YbNX3iiC5fa
         JHvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVONK8QKZgyYPJGbx24YgAlu1IxnvimgtM8Tan566fFpatlNLh4k46qU5nxScfWUXEDAzWph+vqBAsibwg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmXZijbFNiHRmK/gYDwM3Q5EB/8eP/qWaCnjHrKciLz1jBM4Yt
	rYPXY5bgvEd+t0VzKYtcaMHHqFIXyrgU9ZIFFOHenAzvsRbjUNqdWQ8j
X-Gm-Gg: ASbGncvQRG6Wd3fe/UcNo5N828QrBJyE7C7n4qNfgBzP/awZUDIR3+tw2WJcSMZC7lf
	tkOowA7RgR7BUVkDx8U2byjXgmYpIY9fhFzNkWqDDRK8aLUxqyfXveLEq2HbCG6R7PBU9tpqik+
	vKz/Lu/a0ONo/nU723fD7CslyDB1iGxgjNAruj6gweaKun929dnPiQSHkwTHpp9tISCUK/C1TRt
	5p0QwKgbp9JBDHqym7DLJF0hcgOaCl4lXiOTAyix1Jm56PLvxkffJ0SO7BmDBf9wKOC6hvZA39P
	1Lxdyv+7wfQfdg/crnKhZG8adrKUtXCmBBileDnQbNPq/gEq3vdIgr+2Ml6aAG3Broc4DzUOfgw
	A/5J7nbQXPPLO1VKYtA==
X-Google-Smtp-Source: AGHT+IHbTcVdwxhdfcP798T6pP1VsYxzzYGaXdvIwkCmRvnp/SY1JJEv6fQ/wVRyxzqBhML+XIv4lg==
X-Received: by 2002:a17:902:ce81:b0:234:f1ac:c036 with SMTP id d9443c01a7336-2366b40b7c2mr115347415ad.50.1750071396733;
        Mon, 16 Jun 2025 03:56:36 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c68:884c:5800:7324:c411:408d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deaaa15sm58456615ad.173.2025.06.16.03.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 03:56:36 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: agruenba@redhat.com
Cc: skhan@linuxfoundation.org,
	gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] fs/gfs2: use scnprintf() in show functions
Date: Mon, 16 Jun 2025 16:26:26 +0530
Message-ID: <20250616105626.372040-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace all snprintf() instances with scnprintf(). snprintf() returns
the number of bytes that would have been written had there been enough
space. For sysfs attributes, snprintf() should not be used with the
show() method. Instead use scnprintf() which returns the number of bytes
actually written.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 fs/gfs2/sys.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
index c3c8842920d2..25c1d71359ed 100644
--- a/fs/gfs2/sys.c
+++ b/fs/gfs2/sys.c
@@ -59,7 +59,7 @@ static struct kset *gfs2_kset;
 
 static ssize_t id_show(struct gfs2_sbd *sdp, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%u:%u\n",
+	return scnprintf(buf, PAGE_SIZE, "%u:%u\n",
 			MAJOR(sdp->sd_vfs->s_dev), MINOR(sdp->sd_vfs->s_dev));
 }
 
@@ -68,7 +68,7 @@ static ssize_t status_show(struct gfs2_sbd *sdp, char *buf)
 	unsigned long f = sdp->sd_flags;
 	ssize_t s;
 
-	s = snprintf(buf, PAGE_SIZE,
+	s = scnprintf(buf, PAGE_SIZE,
 		     "Journal Checked:          %d\n"
 		     "Journal Live:             %d\n"
 		     "Journal ID:               %d\n"
@@ -140,7 +140,7 @@ static ssize_t status_show(struct gfs2_sbd *sdp, char *buf)
 
 static ssize_t fsname_show(struct gfs2_sbd *sdp, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%s\n", sdp->sd_fsname);
+	return scnprintf(buf, PAGE_SIZE, "%s\n", sdp->sd_fsname);
 }
 
 static ssize_t uuid_show(struct gfs2_sbd *sdp, char *buf)
@@ -150,7 +150,7 @@ static ssize_t uuid_show(struct gfs2_sbd *sdp, char *buf)
 	buf[0] = '\0';
 	if (uuid_is_null(&s->s_uuid))
 		return 0;
-	return snprintf(buf, PAGE_SIZE, "%pUB\n", &s->s_uuid);
+	return scnprintf(buf, PAGE_SIZE, "%pUB\n", &s->s_uuid);
 }
 
 static ssize_t freeze_show(struct gfs2_sbd *sdp, char *buf)
@@ -158,7 +158,7 @@ static ssize_t freeze_show(struct gfs2_sbd *sdp, char *buf)
 	struct super_block *sb = sdp->sd_vfs;
 	int frozen = (sb->s_writers.frozen == SB_UNFROZEN) ? 0 : 1;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", frozen);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", frozen);
 }
 
 static ssize_t freeze_store(struct gfs2_sbd *sdp, const char *buf, size_t len)
@@ -194,7 +194,7 @@ static ssize_t freeze_store(struct gfs2_sbd *sdp, const char *buf, size_t len)
 static ssize_t withdraw_show(struct gfs2_sbd *sdp, char *buf)
 {
 	unsigned int b = gfs2_withdrawing_or_withdrawn(sdp);
-	return snprintf(buf, PAGE_SIZE, "%u\n", b);
+	return scnprintf(buf, PAGE_SIZE, "%u\n", b);
 }
 
 static ssize_t withdraw_store(struct gfs2_sbd *sdp, const char *buf, size_t len)
@@ -626,7 +626,7 @@ static struct attribute *lock_module_attrs[] = {
 
 static ssize_t quota_scale_show(struct gfs2_sbd *sdp, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%u %u\n",
+	return scnprintf(buf, PAGE_SIZE, "%u %u\n",
 			sdp->sd_tune.gt_quota_scale_num,
 			sdp->sd_tune.gt_quota_scale_den);
 }
@@ -679,7 +679,7 @@ static struct gfs2_attr tune_attr_##name = __ATTR(name, 0644, show, store)
 #define TUNE_ATTR_2(name, store)                                              \
 static ssize_t name##_show(struct gfs2_sbd *sdp, char *buf)                   \
 {                                                                             \
-	return snprintf(buf, PAGE_SIZE, "%u\n", sdp->sd_tune.gt_##name);      \
+	return scnprintf(buf, PAGE_SIZE, "%u\n", sdp->sd_tune.gt_##name);     \
 }                                                                             \
 TUNE_ATTR_3(name, name##_show, store)
 
-- 
2.49.0

