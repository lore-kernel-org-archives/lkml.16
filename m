Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E89927CCC8
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750070091; cv=none; b=O6ovnSaE4EXoDco3oZa4vNK0yUrD7jHtXvqY2pB8dFEi67C1SkkURafepnEIR4U1NcOlIFsyKd5aKF+DlFfHyPRWXaPVAfVpImWcUalrBo4eS4oGfGtUdDRt97iNLzzPl7/GBEZf4UCCoucVvEbCe3wZZHmyFGDH+/FI3cKB/dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750070091; c=relaxed/simple;
	bh=QJj6d/XvkwafLouwkZN2Bs7P9fFv23Sw+aXRuAkxI6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PbgXwrNHB8HVB3/KOLCzPxkjt2qJUIVpKIMDNEVBgur1LaVGbnZQgfkBx/qNabfkgwoCBF7kJNSLfA6a08SW7/Tr5m82dXabmldJDevYNtIouvubmEP+acmjNIwkG0xTUHFnT6J09UIh4r34w1jjIst0gM2wOUpM35DrZEYvuus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJSLgnp7; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJSLgnp7"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b271f3ae786so3100853a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 03:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750070090; x=1750674890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AgVtK53u/8CO0Tn5cqq/MjJJhd4l/AhPN3dvjhANa6o=;
        b=iJSLgnp7twf3EmgHVFIJprE8tNReXJwdbJQZLpMtYs56fZAiipE5Icf3NeI8uRjAUM
         1QxWIroQ22uCOe+JjQO5JIOaogZ+oMBIf7B0REc06sqdopWPwUFqQ1HrID3CLOrcy5tJ
         y3QVUuMcykWbIVimordZuz379Fpiub3jqgf7Xh2pCbvz6GFOEEbbI0lfwNQtappE4Lu8
         J5V47AMMqpKS/04jbMic1Nvpihw+HUz/eWt9GyEb8EtYU9LXKtb3XK6uJIzBikdT0aMC
         WoiRfLEX/MdqSuPn0vkpp+rNYj6J9fw7s+EXePpR0Ml9Fdcgxt7+VEXi3XVKTjFFmnDv
         CIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750070090; x=1750674890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AgVtK53u/8CO0Tn5cqq/MjJJhd4l/AhPN3dvjhANa6o=;
        b=e0jr107TaMKDjXKIMe8QKzV+xVOg9GvEJ4bGJiLigawbkbuLM3ayjdp1GDdFFCgxNZ
         jEEsz0EAkVljPgdpR8YJIZeQXP3nnnBbrbTW7cR/59F0jc88VB3+3XrOi9yEcYGpcQxe
         KF3h9BSi2XpNNU1BbZCox6p2Sq0yvzrRrjHA1PC5acrmuFcK2zJ6p/ihP8MQ7gyXJWNB
         bHabju8qG9UT8H2d7d9IW7PTePXYpsjyVmE+0Nhqt14sE+M7W+O59HOZYPAIpFy1dNOF
         dPz76rO6tP57+uQ21E8zPyQJvLxkEnu1kBwntWk4Y6xtxmmPpnp3WXFggO12wrk68Jy4
         X0HA==
X-Forwarded-Encrypted: i=1; AJvYcCWSx3HiDkyzgdQzKCGBSEaO0L37Kbd/LXWJBMoI8MNnnR/rcVoxrOgrXpelQus/RhrsxrSlNvI9P9n3jpg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx5qxcYnjWE1F+Z9ibxGQ0aATOe1MzByKaZhneuqg3xvpqg8bf
	YbzQd10KSEeyHJ5EEHSlpOH9dURGaEPJ3o9VIdAoOX27fTYInNweFtM385ZVcSiP
X-Gm-Gg: ASbGnctOravBNQnUJFm/iqpzwAmgy1lLFjdAOBoRfZz/4OfEAYaORO0YA+27oG++9Tt
	CJnmLMyA2YRsUQzA03eSztqLJ2H6+dufzJCNj0xYJvVoRcQFOQy+q2NXQPgRQYj1UuIIRYKcna+
	/iQyKwnMhcpdCNwS/OQ/PRu1CrUExF7BUtjhOOUEVYjR/bxxg73WHdNXVLxBmFe20+32K4tEBZH
	Ed1JPRDVD4ZinPcWlsAFb1M/REsTmgLzfUBArgpC43Dx2f8XERlt2A25UJ8LaBxknkqPMn0WyGp
	6H8JLGjGqDQ2BQFz+E8eH4F5zi8VcQpAQUjx6iTpToAii9Ncm4DVWUnL916dSTRP7jNFF0Lcdd7
	+NGsNy2U=
X-Google-Smtp-Source: AGHT+IG6h26aE1WGfwOudTzmIlkH9EQXeChWHEfk86k4KgPgaSC22agFnSLV5tt1WNAmJ6x9w5NMnA==
X-Received: by 2002:a17:90b:4d8c:b0:313:1c7b:fc62 with SMTP id 98e67ed59e1d1-313f1d589b3mr11053333a91.22.1750070089588;
        Mon, 16 Jun 2025 03:34:49 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c68:884c:5800:7324:c411:408d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365decaf4csm57628215ad.218.2025.06.16.03.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 03:34:49 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: aahringo@redhat.com,
	teigland@redhat.com
Cc: skhan@linuxfoundation.org,
	gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] fs/dlm: use scnprintf() in lockspace show funcs
Date: Mon, 16 Jun 2025 16:04:41 +0530
Message-ID: <20250616103441.370330-1-pranav.tyagi03@gmail.com>
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
show() method. Instead use scnprintf() which returns the number of
bytes actually written.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 fs/dlm/config.c    | 2 +-
 fs/dlm/lockspace.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index a23fd524a6ee..10486a46a540 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -185,7 +185,7 @@ static ssize_t cluster_##name##_store(struct config_item *item, \
 }                                                                             \
 static ssize_t cluster_##name##_show(struct config_item *item, char *buf)     \
 {                                                                             \
-	return snprintf(buf, PAGE_SIZE, "%u\n", dlm_config.ci_##name);        \
+	return scnprintf(buf, PAGE_SIZE, "%u\n", dlm_config.ci_##name);       \
 }                                                                             \
 CONFIGFS_ATTR(cluster_, name);
 
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 1929327ffbe1..2e83e381e54c 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -69,7 +69,7 @@ static ssize_t dlm_event_store(struct dlm_ls *ls, const char *buf, size_t len)
 
 static ssize_t dlm_id_show(struct dlm_ls *ls, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%u\n", ls->ls_global_id);
+	return scnprintf(buf, PAGE_SIZE, "%u\n", ls->ls_global_id);
 }
 
 static ssize_t dlm_id_store(struct dlm_ls *ls, const char *buf, size_t len)
@@ -83,7 +83,7 @@ static ssize_t dlm_id_store(struct dlm_ls *ls, const char *buf, size_t len)
 
 static ssize_t dlm_nodir_show(struct dlm_ls *ls, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%u\n", dlm_no_directory(ls));
+	return scnprintf(buf, PAGE_SIZE, "%u\n", dlm_no_directory(ls));
 }
 
 static ssize_t dlm_nodir_store(struct dlm_ls *ls, const char *buf, size_t len)
@@ -101,12 +101,12 @@ static ssize_t dlm_nodir_store(struct dlm_ls *ls, const char *buf, size_t len)
 static ssize_t dlm_recover_status_show(struct dlm_ls *ls, char *buf)
 {
 	uint32_t status = dlm_recover_status(ls);
-	return snprintf(buf, PAGE_SIZE, "%x\n", status);
+	return scnprintf(buf, PAGE_SIZE, "%x\n", status);
 }
 
 static ssize_t dlm_recover_nodeid_show(struct dlm_ls *ls, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%d\n", ls->ls_recover_nodeid);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", ls->ls_recover_nodeid);
 }
 
 struct dlm_attr {
-- 
2.49.0

