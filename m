Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF51295D8F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750071069; cv=none; b=OPJOIcMKMzb+J6VRqRWvD9djkwDAlGbomBM6bJBfQPK7nVlCzigazwzfe9b3QyQlSZXljKh3FKD3kqpJ3JTSWswZ4Mc8/Ma5yudUeLmUMPWqo8ZHRWm/KTjda/MBgJGi3e4IT9kUMmhMYuZ25a0szFhz1EyqieYUzRD0U9ZKakU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750071069; c=relaxed/simple;
	bh=mW/gM49W+/lH6XeJ73Jgnv8wvFZuY8rej9CVO1OjhSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pfo53Y2/2lbR4Ma2lTjwT8s1okYVgw9kZtxARQO+hE40Qw5e8OVuAC0gRwipUmLCPDHbS6dKm/B8vleYFs5PIA8AuNQR308NSOXBDyO+sKo8xELt98AiJhczTBtdY4XDeXKNRhnvjdHX69RsgDzlqIhpNInvAeKxuA6wY99yoog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxCUK9Hj; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxCUK9Hj"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b2f603b0f0dso4092942a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 03:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750071067; x=1750675867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XiZT8fyfWnDQ5DnwRzZVizGiA0t8KqH/r5W4lxBjzhw=;
        b=hxCUK9HjNTGIe1iXFVu4ZTqqmnoP4CSYQ7Dc/89xCnoOU5E5ghwQTxlv5YFS/Rm5o1
         P2sZdy70Co0j/OVoQXOANI0cb4vuzrCEtQzR9Y61teplsLVB4sBwE48kiSjq2dCWpn7Y
         ADsq8qvnFJV5v5LJ3+n9UltQF/mT9aalVhEjmAyKcmcck5SQIN4KWHegMuzlhIscnr+C
         Pd6S4friuJpOAxeVeuVgoCPr1sAnVjhZ4Z4RYNZP3C7M7WMqlZUCWIC5LPrbDamvI4yM
         bps86IM0eqvWEQdwJUMesDUIXEu2ICN+Fvdohz+EWlFBNbdYt5pQ5e2yEdc7iCXYjJLl
         Hb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750071067; x=1750675867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XiZT8fyfWnDQ5DnwRzZVizGiA0t8KqH/r5W4lxBjzhw=;
        b=Z+AZe4T+skKwQ90cjnBZGaSaDDeUoIBK11r/kpf6nKo5bHdwyW1P+Ii2d3driXUEaI
         5SMEV/2yhSp5iWzFx4/WC38ZHpVOBznIAwSy7Fj/ayuBm/tUJWs9DwpC2oS6mFqyHwpE
         noi60pCEqgdfvb2qk8QFjj0y7sqSsNEYNy1pF92Duqrb2Od/zEWx8Nk/rPfjDYbubdL6
         2O9UWTrPGRq3sFIt6CLSQXJS5SKUuICAwo2a/dBGoe2rIll4nh8jkLA3YvLSUZnBDHad
         /Sx3PUZKzmIC2FxAx168QXMCP2D6yTcN3Zz+7RM9bvpzTp/hf+bQ2GL7a9R52feziaoX
         v2pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH9m8mON9B70Qso/n83KOx8JMHQ1n3UXVLFsFNUdZG1cdIkmbp5wuwbu+BamLBqy9EEAELC551Fc0ogvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDBRLs76+mRgeMgt7eoBwUMwKIKmI+Ft4d0OjvPLrSZW/GcqUI
	irhu1qsjrXAnbcSVi1w3jstdkVk1fDrFjlNpyyYV+Dh50YVok7osdIy/
X-Gm-Gg: ASbGncuBSfJwxGy+6FfZXcATbCdn583NiRUF131/Clka+9VaMYc0gTo1yg9g5zlygDo
	Mb4NcO9ClCvgL5qT9uio/QjDBPbn3xIUMfyQgemUmsVcdvc+4HSOPdIg4VFVRdBO9/AQfcJpE2g
	VdWlPDHxX0u2FZyDxbFlp4A+peZS7lCaY/0hqZG+bX1EzpR6soQQiChMqGG/c+26KiairXcsXFs
	m2YLrNkTfhZvdysRmgUBJa/yVMU38ffq21r7ztS5DCdR9ak/v73brGkJQROZaZievA3UXFwnoif
	ZRD6MzZ3EL4t9H4sXSrKv3I98f9RkgDkSDGMStXtdnADIc6f+Y58G0P2T5fRIh+xqMgbJci0AT9
	uZMS2q87F3RpYkDTopA==
X-Google-Smtp-Source: AGHT+IE4omYKJqyL/KYZqyQgCYrH8mhzUBKZKG0S+o6pOvpI7nPqf26GDX0iloH0LttyYw/5k0ECNQ==
X-Received: by 2002:a05:6a21:150b:b0:215:ead1:b867 with SMTP id adf61e73a8af0-21fbd56945amr14844625637.14.1750071066946;
        Mon, 16 Jun 2025 03:51:06 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c68:884c:5800:7324:c411:408d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe15bb83asm5508221a12.0.2025.06.16.03.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 03:51:06 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com
Cc: skhan@linuxfoundation.org,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] fs/ocfs2: use scnprintf() in show functions
Date: Mon, 16 Jun 2025 16:20:28 +0530
Message-ID: <20250616105028.371633-1-pranav.tyagi03@gmail.com>
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
space. For sysfs attributes, snprintf() should not be used for the
show() method. Instead use scnprintf() which returns the number of bytes
actually written.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 fs/ocfs2/cluster/masklog.c |  2 +-
 fs/ocfs2/cluster/sys.c     |  2 +-
 fs/ocfs2/stackglue.c       | 14 +++++++-------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/ocfs2/cluster/masklog.c b/fs/ocfs2/cluster/masklog.c
index 563881ddbf00..0bc21dc71d29 100644
--- a/fs/ocfs2/cluster/masklog.c
+++ b/fs/ocfs2/cluster/masklog.c
@@ -28,7 +28,7 @@ static ssize_t mlog_mask_show(u64 mask, char *buf)
 	else
 		state = "off";
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", state);
+	return scnprintf(buf, PAGE_SIZE, "%s\n", state);
 }
 
 static ssize_t mlog_mask_store(u64 mask, const char *buf, size_t count)
diff --git a/fs/ocfs2/cluster/sys.c b/fs/ocfs2/cluster/sys.c
index 022f716c74ff..23febbe3dc5d 100644
--- a/fs/ocfs2/cluster/sys.c
+++ b/fs/ocfs2/cluster/sys.c
@@ -21,7 +21,7 @@
 static ssize_t version_show(struct kobject *kobj, struct kobj_attribute *attr,
 			    char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%u\n", O2NM_API_VERSION);
+	return scnprintf(buf, PAGE_SIZE, "%u\n", O2NM_API_VERSION);
 }
 static struct kobj_attribute attr_version =
 	__ATTR(interface_revision, S_IRUGO, version_show, NULL);
diff --git a/fs/ocfs2/stackglue.c b/fs/ocfs2/stackglue.c
index a28c127b9934..9af03869a04b 100644
--- a/fs/ocfs2/stackglue.c
+++ b/fs/ocfs2/stackglue.c
@@ -477,9 +477,9 @@ static ssize_t ocfs2_max_locking_protocol_show(struct kobject *kobj,
 
 	spin_lock(&ocfs2_stack_lock);
 	if (locking_max_version.pv_major)
-		ret = snprintf(buf, PAGE_SIZE, "%u.%u\n",
-			       locking_max_version.pv_major,
-			       locking_max_version.pv_minor);
+		ret = scnprintf(buf, PAGE_SIZE, "%u.%u\n",
+				locking_max_version.pv_major,
+				locking_max_version.pv_minor);
 	spin_unlock(&ocfs2_stack_lock);
 
 	return ret;
@@ -525,8 +525,8 @@ static ssize_t ocfs2_active_cluster_plugin_show(struct kobject *kobj,
 
 	spin_lock(&ocfs2_stack_lock);
 	if (active_stack) {
-		ret = snprintf(buf, PAGE_SIZE, "%s\n",
-			       active_stack->sp_name);
+		ret = scnprintf(buf, PAGE_SIZE, "%s\n",
+				active_stack->sp_name);
 		if (ret >= PAGE_SIZE)
 			ret = -E2BIG;
 	}
@@ -545,7 +545,7 @@ static ssize_t ocfs2_cluster_stack_show(struct kobject *kobj,
 {
 	ssize_t ret;
 	spin_lock(&ocfs2_stack_lock);
-	ret = snprintf(buf, PAGE_SIZE, "%s\n", cluster_stack_name);
+	ret = scnprintf(buf, PAGE_SIZE, "%s\n", cluster_stack_name);
 	spin_unlock(&ocfs2_stack_lock);
 
 	return ret;
@@ -595,7 +595,7 @@ static ssize_t ocfs2_dlm_recover_show(struct kobject *kobj,
 					struct kobj_attribute *attr,
 					char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "1\n");
+	return scnprintf(buf, PAGE_SIZE, "1\n");
 }
 
 static struct kobj_attribute ocfs2_attr_dlm_recover_support =
-- 
2.49.0

