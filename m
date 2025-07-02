Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FCB2673B0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751457208; cv=none; b=CRcIaB0XfhAlQsfYcwb2VASxHehtKsYUtWgi//l9CBMz1HxMgGhah4YNENRjtTuhTfFNmS5P6cmUSuOwZU0SXT19sBO+5E0+m8qmlg4eX+m0DLJVDwPMRGUTTYlIEEnUrsSZn7IA9jetQB0/tdWvc9otcNiy+KEUqIXIt4Nmdmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751457208; c=relaxed/simple;
	bh=naK8tfrx78nSaWldqy9EQEOR5KX753eTWBA09RDWDvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l0yCKnyVzW0xOqEP2+km0GxHrojG/tAfyWIxt1kRhHLUh7KDlFb5DtEEOWCacc/qN57ZGPp6DqIAEiSCSLP4xJDkZ9+dVsLcU3g4p3FWb9tbjGB/a4xNbBUqBYeJabpLpqV9fJ5BuaEapI6EO32gy2Q4Ih5jt317diQvUfpi+hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpvqkgQH; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpvqkgQH"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7490702fc7cso4823849b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 04:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751457206; x=1752062006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUfO2oo0Z9XyCb4GeHR70Q/rZmttNocm9srrrIHuSlI=;
        b=SpvqkgQHwvd0awnIf/gzHD9vuoaRhoFT10vZFp/56JHrol0nty544sMo9fwnBSfhys
         dzOzA7dMlGZu7lBHhvAWs1unZlgdvNXSXmkcDTXazf8L0er2SiHjhFDDcReZCKsbGmuX
         59gxEd14JmMoRBgUJeKlZTuLvpELZdCso3BSjAhlKUN7d7tQBukaluyXc9IVzyP37N1b
         89XnMsbXQzJkQUw4rTgJN1SlFsnX2230vxuLVBJz4B3QhzFHZ362pAwsa517sE2SzdOl
         2bfVOtMdThUGf1vZI8+xPb0gAxk7Zjhbcp57JjrtyQ2N7o0A86i3/l17NchnimlgjAva
         OOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751457206; x=1752062006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUfO2oo0Z9XyCb4GeHR70Q/rZmttNocm9srrrIHuSlI=;
        b=RvR9DlkcRr/MhzI/Y8XS+Glxsi9C8FHQWJoluBG7R1mf3ok0gSEr6eCAasPSuKcg9t
         LXKt32tzlhTZa513s2SVaOCLTa+IbmeaB8khr6T/Pz1td9FK0EfrQDic4imDMxzOIvnm
         4Vbp/hD547tiADGxLu1Ip50bVVf5KJdxOGxo2meCLE04cjmA9pMByvpqs/KeITqGFQkP
         WTmqLKoTJBl8X+eYgLVNeWYuuoAVbp0SAKtEheQsgpypgQ1vYisxM/1w5c2fyWZuh+KY
         koB0J8POIcvJUHZ5fivqO1xzKzEhCsOCcmFDeowdT03vHp5hHdk8CX09j9Jn1hoK2agz
         bxKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGeF96v7W591iAsNynbl4xFEehklwncCwMWrQ4rmLAhTalUA/yZka81zpCI6Leq6iwEP8JoyHn8NHUXEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRrTJaJ6nEvZeOZcfJVdCrRT3+o6KAXpNve4xC7AUUXWUOe1ZX
	8QZsX9wg3wPHvJNm/tuxCm65qSHv1vnY84Be8JMza+chE32/uc8MLOgC
X-Gm-Gg: ASbGnctOB7kbVNJ8xeV1qmkgixeUWAXPxAT3IcWR1N4Ta0l1pVoF9cQM7tBGMX8EgiC
	tk5nP8sByrLcfD4mwCSUHI44dusLBXx0AMqhoJYOea0GwuNQdvJ7SlF/Efw5CArOuwmi11H2Xdd
	xUrYNB8Ofu/OZ4tLO6hkjY/lyDO37lEAGRRlxPnaQHKrvfydJVqVWGde2wWWJistpYg1BdIQije
	emPtGEL6BnH+kI28qzo1mznCz7yT0Po0gebxl1P4hX5fLddgicvChtcS6z6G8n0lIk35SNVYSvG
	17t2xiGU6XNfxSEN22gO9uFuQ2apYqzE6xeVtgopN8oerKGnovyT43AelJ8lhkO7gSR6Lp5uhfT
	L
X-Google-Smtp-Source: AGHT+IE6PMWCDk0z4y198hGuLgo73AAg07JUIaYu7xIUgQ/m7u46Y+hmpzlyfeuW9K+ogZqcvyxVWQ==
X-Received: by 2002:a05:6a20:7f94:b0:220:92f:4d97 with SMTP id adf61e73a8af0-222d7db2c54mr4882532637.4.1751457205943;
        Wed, 02 Jul 2025 04:53:25 -0700 (PDT)
Received: from localhost.localdomain ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31c39fbsm12871036a12.42.2025.07.02.04.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 04:53:25 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: syzbot+6246a83e7bd9f8a3e239@syzkaller.appspotmail.com
Cc: syzkaller-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Re: [syzbot] [fs?] BUG: sleeping function called from invalid context in procfs_procmap_ioctl
Date: Wed,  2 Jul 2025 20:53:21 +0900
Message-ID: <20250702115321.230757-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <686502ff.a70a0220.3b7e22.22bb.GAE@google.com>
References: <686502ff.a70a0220.3b7e22.22bb.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master

---
 fs/proc/task_mmu.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index f3659046efb7..42b0224c6ac9 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -595,6 +595,7 @@ static int do_procmap_query(struct proc_maps_private *priv, void __user *uarg)
 	char build_id_buf[BUILD_ID_SIZE_MAX], *name_buf = NULL;
 	__u64 usize;
 	int err;
+	size_t name_buf_sz;
 
 	if (copy_from_user(&usize, (void __user *)uarg, sizeof(usize)))
 		return -EFAULT;
@@ -621,12 +622,18 @@ static int do_procmap_query(struct proc_maps_private *priv, void __user *uarg)
 	if (!mm || !mmget_not_zero(mm))
 		return -ESRCH;
 
-	err = query_vma_setup(priv);
-	if (err) {
+	name_buf_sz = min_t(size_t, PATH_MAX, karg.vma_name_size);
+
+	name_buf = kmalloc(name_buf_sz, GFP_KERNEL);
+	if (!name_buf) {
 		mmput(mm);
-		return err;
+		return -ENOMEM;
 	}
 
+	err = query_vma_setup(priv);
+	if (err)
+		goto fail_vma_setup;
+
 	vma = query_matching_vma(priv, karg.query_addr, karg.query_flags);
 	if (IS_ERR(vma)) {
 		err = PTR_ERR(vma);
@@ -679,20 +686,12 @@ static int do_procmap_query(struct proc_maps_private *priv, void __user *uarg)
 	}
 
 	if (karg.vma_name_size) {
-		size_t name_buf_sz = min_t(size_t, PATH_MAX, karg.vma_name_size);
 		const struct path *path;
 		const char *name_fmt;
 		size_t name_sz = 0;
 
 		get_vma_name(vma, &path, &name, &name_fmt);
 
-		if (path || name_fmt || name) {
-			name_buf = kmalloc(name_buf_sz, GFP_KERNEL);
-			if (!name_buf) {
-				err = -ENOMEM;
-				goto out;
-			}
-		}
 		if (path) {
 			name = d_path(path, name_buf, name_buf_sz);
 			if (IS_ERR(name)) {
@@ -733,6 +732,7 @@ static int do_procmap_query(struct proc_maps_private *priv, void __user *uarg)
 
 out:
 	query_vma_teardown(priv);
+fail_vma_setup:
 	mmput(mm);
 	kfree(name_buf);
 	return err;
--
