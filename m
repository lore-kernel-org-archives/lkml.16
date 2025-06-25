Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7509229C323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 22:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750889754; cv=none; b=nHRR2s1cej86aVgmnfe16O26mcy7HpViEzMqbvRuBRaeNxqwOXcIjXA0ofc+J1aBXGYl9H/f0fDEVWuBtoaV9udbz1Yi540au2LN9b4ZibV+W2a80CPF3uuTOj8XObRFf80z1RRgarudX51DJNWSdWnM4HkZYsqhIqUlcDmFozg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750889754; c=relaxed/simple;
	bh=ylUWsqBdv7tvsvdpMfdW9ujSAH2BGmfxAz/cPhecY5Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wxo9OXlurWxE6nJGJCAPBe5x0CI7gMrXiYjidMJz4R3C+dBK1oHlSIxMjpo4f08ZrPP4S9zj7ZY7/RnLJyk11nd+1Jb9QEg8SomnOjwx9AG74TVLX8wGb6D1s4kCbxfdal898BhYg1XZ2iMKVvl+2ZZ2+qu6532N47VUvzEDm+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoJD50ed; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoJD50ed"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-236470b2dceso5083005ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750889751; x=1751494551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i1/PgKpNQEL4CZ/x5npolCmb2YPYwo+H2VVcT6JHico=;
        b=RoJD50edfT3eMAQwSA7TcU64911r/AUAquVs8QzEuwJOFuZi1CizQ5PkzabplJcZwT
         xd+KIRPU/2SsSQ9mhm9vu209hbayh4Ew0NIR72f3aOibBgT4/IkjQTKULIiWAJ7y8LPD
         qj9HC16qxuyjZpAr+cZJjzIjErYzCZ9jiV9cF08dqNyZ9LwZI2Ca0OlYv7rG/WjrH4Eh
         P3WIfOzsq72xIsU4CVfAXz96OYLf40w73untwPcITwBqUpPApHuKpzKtz9r98AF/l2Mf
         gbb3MxM7WcMMP6pUzv7uqazAilHSfKnhsJzXmN1UuAQ/8dHmkPaVjp03L1OIZfudzdWH
         jmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750889751; x=1751494551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1/PgKpNQEL4CZ/x5npolCmb2YPYwo+H2VVcT6JHico=;
        b=aMzjLQcEkj+uPTmXytAtEDuTvDSj617bXFdX3LWbClOh4LGDEfIWzNnfLb7dJs07BF
         ffdACnrzH7mv2vM18GJzF96u+Q+/Evr9wuTVpL1n0jz9PlWf1ygE8djS2a8t+6phY+mz
         MLYHps2hr4XLibxnQ8mx313knsXFsyrW9k3yvIg/f6i5oNTrEPkM9nHVm8RWHWnOCrMk
         HtTNDGbrxvJnXbltCwTmMZKfanduDgR52oJgUs8Z1S+LMv6o8PqHJWf908y0ITS1sil+
         XpYd+M1RQ+miOSOEDZs/j2nKzjU1BYiY/R/tliK2oQG30BA6Q1he/xwREHYHWZSE23rU
         uXig==
X-Forwarded-Encrypted: i=1; AJvYcCUvio2FFwq5vqpigosRhQn2brscaoN0Mr/1XL/1ZjhWFhToCoeS5MSo3WCON2l8p822oorxRAZX6dYVREQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJD9BwL5wwEYkA4hY6PAWBz5gLUwNHUmX6QNIYQbkLJBcfPPiZ
	SSVh7DxRH7KJrvUifTyxTh2eAa4AbQZ7LeKbVSAX7A1o5N/6FmMuGIB0
X-Gm-Gg: ASbGnctdkMSIZr56WCmV2+qWSTSHpWnrUkBfiVIP6IX0Sb1BcSJjnUaIFnFtvMk1AyT
	PNEnedDav9d156+4AvVPKFNnWD1QFCVaDvevxU1S4Y8od7jHfFgsPGcqO2UZME0zuQNgDb7z8Ew
	QN4cfGtNlIcnWW9xc44R707pN94PS0oGB41PIxAfD6PVxqwDBs+fG6ONZT4ANGhLFN5e5ygvVyl
	n9q79jTdzeN4rNCAwOL/Z1AsymVWnKbj88BvMjQ0lFCdbLBa/OtnKYLAcnT7FL+oumOV3Cnboof
	cwx3KSTEkX3JaGHzVGaQEMqcwI3gksq2EHSek1qYW2g2roqptuTvqOqX7HDJ1i/40+OjbD8YjtS
	Fgow=
X-Google-Smtp-Source: AGHT+IF447eXoeCPMZ9fSborn0oc0o77ApQohY3vn62RRe/f5MId9QjXnzTMTAtUShcwzCs4rGS+mw==
X-Received: by 2002:a17:902:f684:b0:235:60e:3704 with SMTP id d9443c01a7336-23823fc3f99mr87140675ad.12.1750889751418;
        Wed, 25 Jun 2025 15:15:51 -0700 (PDT)
Received: from itsmeut.. ([103.215.237.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237f7579cddsm84397535ad.202.2025.06.25.15.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 15:15:50 -0700 (PDT)
From: Utkarsh Singh <utkarsh.singh.em@gmail.com>
To: agruenba@redhat.com
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Utkarsh Singh <utkarsh.singh.em@gmail.com>
Subject: [PATCH] gfs2/sysfs: Replace sprintf/snprintf with sysfs_emit()
Date: Thu, 26 Jun 2025 03:41:38 +0530
Message-Id: <20250625221137.108313-1-utkarsh.singh.em@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/filesystems/sysfs.rst mentions that show() should only
use sysfs_emit() or sysfs_emit_at() when formatting values returned
to user space. This patch updates the GFS2 sysfs interface accordingly.

It replaces uses of sprintf() and snprintf() in all *_show() functions
with sysfs_emit() to align with current kernel sysfs API best practices.
It also updates the GFS2_SHOW_UINT macro to use sysfs_emit() instead
of snprintf().

Signed-off-by: Utkarsh Singh <utkarsh.singh.em@gmail.com>
---
 fs/gfs2/sys.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
index c3c8842920d2..77bd35b2f594 100644
--- a/fs/gfs2/sys.c
+++ b/fs/gfs2/sys.c
@@ -59,7 +59,7 @@ static struct kset *gfs2_kset;
 
 static ssize_t id_show(struct gfs2_sbd *sdp, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%u:%u\n",
+	return sysfs_emit(buf, "%u:%u\n",
 			MAJOR(sdp->sd_vfs->s_dev), MINOR(sdp->sd_vfs->s_dev));
 }
 
@@ -68,7 +68,7 @@ static ssize_t status_show(struct gfs2_sbd *sdp, char *buf)
 	unsigned long f = sdp->sd_flags;
 	ssize_t s;
 
-	s = snprintf(buf, PAGE_SIZE,
+	s = sysfs_emit(buf,
 		     "Journal Checked:          %d\n"
 		     "Journal Live:             %d\n"
 		     "Journal ID:               %d\n"
@@ -140,7 +140,7 @@ static ssize_t status_show(struct gfs2_sbd *sdp, char *buf)
 
 static ssize_t fsname_show(struct gfs2_sbd *sdp, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%s\n", sdp->sd_fsname);
+	return sysfs_emit(buf, "%s\n", sdp->sd_fsname);
 }
 
 static ssize_t uuid_show(struct gfs2_sbd *sdp, char *buf)
@@ -150,7 +150,7 @@ static ssize_t uuid_show(struct gfs2_sbd *sdp, char *buf)
 	buf[0] = '\0';
 	if (uuid_is_null(&s->s_uuid))
 		return 0;
-	return snprintf(buf, PAGE_SIZE, "%pUB\n", &s->s_uuid);
+	return sysfs_emit(buf, "%pUB\n", &s->s_uuid);
 }
 
 static ssize_t freeze_show(struct gfs2_sbd *sdp, char *buf)
@@ -158,7 +158,7 @@ static ssize_t freeze_show(struct gfs2_sbd *sdp, char *buf)
 	struct super_block *sb = sdp->sd_vfs;
 	int frozen = (sb->s_writers.frozen == SB_UNFROZEN) ? 0 : 1;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", frozen);
+	return sysfs_emit(buf, "%d\n", frozen);
 }
 
 static ssize_t freeze_store(struct gfs2_sbd *sdp, const char *buf, size_t len)
@@ -194,7 +194,7 @@ static ssize_t freeze_store(struct gfs2_sbd *sdp, const char *buf, size_t len)
 static ssize_t withdraw_show(struct gfs2_sbd *sdp, char *buf)
 {
 	unsigned int b = gfs2_withdrawing_or_withdrawn(sdp);
-	return snprintf(buf, PAGE_SIZE, "%u\n", b);
+	return sysfs_emit(buf, "%u\n", b);
 }
 
 static ssize_t withdraw_store(struct gfs2_sbd *sdp, const char *buf, size_t len)
@@ -397,7 +397,7 @@ static struct kobj_type gfs2_ktype = {
 static ssize_t proto_name_show(struct gfs2_sbd *sdp, char *buf)
 {
 	const struct lm_lockops *ops = sdp->sd_lockstruct.ls_ops;
-	return sprintf(buf, "%s\n", ops->lm_proto_name);
+	return sysfs_emit(buf, "%s\n", ops->lm_proto_name);
 }
 
 static ssize_t block_show(struct gfs2_sbd *sdp, char *buf)
@@ -408,7 +408,7 @@ static ssize_t block_show(struct gfs2_sbd *sdp, char *buf)
 
 	if (test_bit(DFL_BLOCK_LOCKS, &ls->ls_recover_flags))
 		val = 1;
-	ret = sprintf(buf, "%d\n", val);
+	ret = sysfs_emit(buf, "%d\n", val);
 	return ret;
 }
 
@@ -437,7 +437,7 @@ static ssize_t wdack_show(struct gfs2_sbd *sdp, char *buf)
 {
 	int val = completion_done(&sdp->sd_wdack) ? 1 : 0;
 
-	return sprintf(buf, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t wdack_store(struct gfs2_sbd *sdp, const char *buf, size_t len)
@@ -459,7 +459,7 @@ static ssize_t wdack_store(struct gfs2_sbd *sdp, const char *buf, size_t len)
 static ssize_t lkfirst_show(struct gfs2_sbd *sdp, char *buf)
 {
 	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
-	return sprintf(buf, "%d\n", ls->ls_first);
+	return sysfs_emit(buf, "%d\n", ls->ls_first);
 }
 
 static ssize_t lkfirst_store(struct gfs2_sbd *sdp, const char *buf, size_t len)
@@ -492,7 +492,7 @@ static ssize_t lkfirst_store(struct gfs2_sbd *sdp, const char *buf, size_t len)
 static ssize_t first_done_show(struct gfs2_sbd *sdp, char *buf)
 {
 	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
-	return sprintf(buf, "%d\n", !!test_bit(DFL_FIRST_MOUNT_DONE, &ls->ls_recover_flags));
+	return sysfs_emit(buf, "%d\n", !!test_bit(DFL_FIRST_MOUNT_DONE, &ls->ls_recover_flags));
 }
 
 int gfs2_recover_set(struct gfs2_sbd *sdp, unsigned jid)
@@ -550,18 +550,18 @@ static ssize_t recover_store(struct gfs2_sbd *sdp, const char *buf, size_t len)
 static ssize_t recover_done_show(struct gfs2_sbd *sdp, char *buf)
 {
 	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
-	return sprintf(buf, "%d\n", ls->ls_recover_jid_done);
+	return sysfs_emit(buf, "%d\n", ls->ls_recover_jid_done);
 }
 
 static ssize_t recover_status_show(struct gfs2_sbd *sdp, char *buf)
 {
 	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
-	return sprintf(buf, "%d\n", ls->ls_recover_jid_status);
+	return sysfs_emit(buf, "%d\n", ls->ls_recover_jid_status);
 }
 
 static ssize_t jid_show(struct gfs2_sbd *sdp, char *buf)
 {
-	return sprintf(buf, "%d\n", sdp->sd_lockstruct.ls_jid);
+	return sysfs_emit(buf, "%d\n", sdp->sd_lockstruct.ls_jid);
 }
 
 static ssize_t jid_store(struct gfs2_sbd *sdp, const char *buf, size_t len)
@@ -626,7 +626,7 @@ static struct attribute *lock_module_attrs[] = {
 
 static ssize_t quota_scale_show(struct gfs2_sbd *sdp, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%u %u\n",
+	return sysfs_emit(buf, "%u %u\n",
 			sdp->sd_tune.gt_quota_scale_num,
 			sdp->sd_tune.gt_quota_scale_den);
 }
@@ -679,7 +679,7 @@ static struct gfs2_attr tune_attr_##name = __ATTR(name, 0644, show, store)
 #define TUNE_ATTR_2(name, store)                                              \
 static ssize_t name##_show(struct gfs2_sbd *sdp, char *buf)                   \
 {                                                                             \
-	return snprintf(buf, PAGE_SIZE, "%u\n", sdp->sd_tune.gt_##name);      \
+	return sysfs_emit(buf, "%u\n", sdp->sd_tune.gt_##name);      \
 }                                                                             \
 TUNE_ATTR_3(name, name##_show, store)
 
-- 
2.34.1

