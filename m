Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C422652A2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751455475; cv=none; b=SfI4T2nFZt4VbqtUC1yLKhTycmiK8ppPwhAZIaEJsYKCgLeVvewZXGSJZDZfvEBKP2Ux47YVzHiaItVsfDwGW9VE8+9zvWgHxrGN9aFEv8x3IYnI200Wfgs/07fHhXDUAoGJPgGdq5vS9SGlevlPJUuTC1z2uqRzcP7dXxcu30I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751455475; c=relaxed/simple;
	bh=Nm9JEi02mOhkO99Hwhjgqq4AZxQJ1PIAeD3J9vYhVjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zevf1GSk5dw3u5UwBSvyuJI3Oq4CIinDMk3EVaghlq5F6RohQgFZ2Uhvr71DKs2qx/Wo3U59Qmz1roHEXM78P1A1VJZr9tdf3DeEffApYbOQKeYra+9GbGF8WSLkwcRKElpr0stLuSu647lB+PxXeCtNuq/ssjk6cy0HKCc2XsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbSOtugf; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbSOtugf"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-23694cec0feso66415185ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 04:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751455473; x=1752060273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QT74Ec7a8nd4xdpnZmasEGd6IOnXvJwHPfcFBt6+RzQ=;
        b=HbSOtugf8w8M8G3ed2YnAUh2f+nJGWZFx+DfXPWbdWluA2GLn/PK5LBSN736/DtLJY
         mCe6unLRiHOBjaHnz2BrIWk6Tl3mq7njl01wsAvohbQ3pOz9Nf7NJywP8aRHBbXFWrZG
         Q1YkcWdQxgMX8Mi/jSI0awJISK0Ju8B/Q8NW7J+T9WpDKGk6lcuTObLQc+hMjGEshARi
         mTNyiN3FvLZfjvkPjvmXzAilVRFiIJLeCR1Bmu20K8zFplJ6qrBd/EOmPexmKPuIgf9f
         +ZFPmmcoxpZ6ZUnvRAetNDbR0KLuXT6JZiZaDVF24wnU5AC4D+fZB7OzyOU+g37wlfqj
         o9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751455473; x=1752060273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QT74Ec7a8nd4xdpnZmasEGd6IOnXvJwHPfcFBt6+RzQ=;
        b=diU181IR2Fq58QAB2fpvtYiESh2KBOZl0TdyvCpoR3I00y0trlb7353otp11lOXMCm
         qmkNZ9+G+GCzOluRHE6kkeOzStUNovdnrgo/FS3FUvMfqHAQeKz6b5NoUZUO4s+Vh/BC
         /4dFwXNWTfjb4dk9rFGhAxidgk1LHbamx3R60BE90FBTAE6zfNfbUSugI6nsNJSp15CD
         WI4SXsQgapFpfZEMUjWFRUvinsjR7ZCVuPHQ/Gj6JsUOxRYDFAh0rSp2rHrXmkQ2a23j
         JbPIplzhl4azOkZGfnLrMWsJx+lKfH9m7ElA/JdEr6HmNZ4mTA9uQutBSYuK5N1ZQsTE
         fkqA==
X-Forwarded-Encrypted: i=1; AJvYcCU3y5GfxncdbMrRdYfPvkogUX21KuK+DO+gX+zjymrNC+XvvUSwnGonjFCQPpIb54W5HK3dcNWLKn0GSXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnFn+Iuemg1WR/KB0gvbuNCCOUd4Wly1TJHB6U3kiCICvmsL/D
	dBlOGqAjJ0Y31zs0JJWggvfNClN/WQAR0sEBKtssvu7sBHbWPNay+PSmsQ1nHB0Z
X-Gm-Gg: ASbGncvxZOtOUUHz2to9LvDgFANB9qFgTuOglW6lXDmuTONpqsZsONqUtXsskHtOiHn
	2HROBcoRGabaaDC5O0nZI+iusqndGPUC8IOcLYdAh58XENcjoA2HDUDozBWQG8R9zMnpBTTAIsI
	ho1RmXroPqh2iki34rRlexlj32kje7F2opyd2wRmgT+QQXoc/sOEfJuqq+ViiCiQGhGhyeDzSL6
	eyZKdgg+fkUg5aLIwEQNBPPMwzuetI4qoG2ZNqtHZmupamF4pGvYo9XWvx98LBAkngzkIqCna0a
	UPTG25ykRAaXrMoOifS9O7ivpFg3XUXTsEkXGOy+kxAXTenGESYRNUcwhS5XMIUkzwU0m+dgMZr
	F
X-Google-Smtp-Source: AGHT+IGOxQwv2XYdKWwXJ9rKF1AZfWFvmIuG2FF/OFMpj8NZpx870e7TuFrFhVl3o3tqhFnpfl/M1Q==
X-Received: by 2002:a17:903:32c6:b0:234:ba37:87a5 with SMTP id d9443c01a7336-23c6e58eceemr39918285ad.25.1751455472720;
        Wed, 02 Jul 2025 04:24:32 -0700 (PDT)
Received: from localhost.localdomain ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c8205sm126897905ad.230.2025.07.02.04.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 04:24:32 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: syzbot+6246a83e7bd9f8a3e239@syzkaller.appspotmail.com
Cc: syzkaller-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Re: [syzbot] [fs?] BUG: sleeping function called from invalid context in procfs_procmap_ioctl
Date: Wed,  2 Jul 2025 20:24:27 +0900
Message-ID: <20250702112427.169000-1-aha310510@gmail.com>
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
 fs/proc/task_mmu.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index f3659046efb7..7130f567b34d 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -595,6 +595,7 @@ static int do_procmap_query(struct proc_maps_private *priv, void __user *uarg)
 	char build_id_buf[BUILD_ID_SIZE_MAX], *name_buf = NULL;
 	__u64 usize;
 	int err;
+	size_t name_buf_sz;
 
 	if (copy_from_user(&usize, (void __user *)uarg, sizeof(usize)))
 		return -EFAULT;
@@ -621,10 +622,18 @@ static int do_procmap_query(struct proc_maps_private *priv, void __user *uarg)
 	if (!mm || !mmget_not_zero(mm))
 		return -ESRCH;
 
+	name_buf_sz = min_t(size_t, PATH_MAX, karg.vma_name_size);
+
+	name_buf = kmalloc(name_buf_sz, GFP_KERNEL);
+	if (!name_buf) {
+		mmput(mm);
+		return = -ENOMEM;
+	}
+
 	err = query_vma_setup(priv);
 	if (err) {
-		mmput(mm);
-		return err;
+		ret = err;
+		goto fail_vma_setup;
 	}
 
 	vma = query_matching_vma(priv, karg.query_addr, karg.query_flags);
@@ -679,20 +688,12 @@ static int do_procmap_query(struct proc_maps_private *priv, void __user *uarg)
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
@@ -733,6 +734,7 @@ static int do_procmap_query(struct proc_maps_private *priv, void __user *uarg)
 
 out:
 	query_vma_teardown(priv);
+fail_vma_setup:
 	mmput(mm);
 	kfree(name_buf);
 	return err;
--
