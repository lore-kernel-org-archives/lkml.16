Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F05C263898
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744396286; cv=none; b=RfomDKp+yEd/h9bDxeU+KWvKz70ozvAxAQFmE2Hs4h7H2rxGu/EEVnqPrc8VyIuGtIE4Y5tclpnI7VS7W2TpCVnDe6gXd0zGVRE4TqDhBomntn/o7DPbj/rKMcw5/+p22piGhLVQtKnkPNRoHm8GhqckCHTedVhheE1ecVPxElI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744396286; c=relaxed/simple;
	bh=vYIH9CVcwhoi0vLUkNUg59Jsq+NQkoxMiA5AdiUfit4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LzuKi2FyIBkHWNPhP0CXxgCaaTqQYqaB9qT8pBu56ZabZ97U0tis3pqYjHzv87Bqe49G1RHBLlkdO0yz0FymkPiR+hwlRWVdHjimmHUKfY+BRjGGmuMC4s9nMHzqsNPpsijULHfyZFRD0WqpkwoleGXqP1H9PO01fPPLVA2dSS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGy7z8sR; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGy7z8sR"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22403cbb47fso26058135ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744396284; x=1745001084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ql6xemgsTeTnj5OBzjSrp7KTsy6FsJl8WG9i01Bevqo=;
        b=EGy7z8sRuMw/w2dz4jWzQTQUy8A5vClKWysehLzMD3dX+mPVT/Bcj8OldqocXYgEBV
         +aBgyWhHgsNzEJExvhPGEVEaKmTHqvbl6v3d63N3u+gVJ8rgWWknu89OL+Tg+/kzFKo6
         ZLA+zqjxf0xEMd6XcP+98DIH+9Q5zdf5VoOBpZuBUsVandSQjMSy9iCxJBNn5WL7QTsu
         R9Ukns0bteKLseGPWsWh2fwVH3M3RdeRCA02kmk/m/Fg85MJZCBOFBAYyxVF/MGqp9B2
         JfGaEsPrFQsqSFdF3pmMq0tgcO0ACwsuEIMcqRU3gWjlgj3ewxKbJ7hwZ5yO4Q02MKQ+
         srvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744396284; x=1745001084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ql6xemgsTeTnj5OBzjSrp7KTsy6FsJl8WG9i01Bevqo=;
        b=mNkbB5SxWcuziHG7VbP72XbYs5QUH45XmCy/08WM8X7ets/rR7KAp0hJ3KYIv53FGu
         ndzAizRaECe5SH2Mwnlr3loLyS5gORJ1bc2j+8Q06g6zhW4l6oIOiQRJLIb8M1XPfVIv
         sd0rMuJzgA1dfmPQMTepkOfhvnxZWI/VQ1LP14K82Ta5UlSq1AzjQJWNuNw2ygYMjLgj
         Y7lwPyiSmR5CPEPs2GD9yD4DN9MlUQ0vJma5gWFk0G9j0bkeekqCGN6z1qtDA+NdSfvQ
         swMCZ+lt/35PW0Ija4b0ghYcyyrWy9eMlUsufv41KUKKnigeBrcWYKJOPLv0OXTtjqFP
         0Dtg==
X-Forwarded-Encrypted: i=1; AJvYcCUDHqa0iD54GLqpi4ckscVDm3BRCIPXgaxOiTwnRsdf9zzM4CwMK4QAJHZzRB5TWb9RUk3VyZCUbLjSxo0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEic+ZVk8BJNHztmQHDGzRZe7/bNQr3gqQs0ErOiyTNjDwg554
	bK1DXC/Iv70M8ZpfdsjvILaOmSxWS1UWX+1m64i5o4smnwFmIuzE
X-Gm-Gg: ASbGncuaFUfs8UGft/m5sFsLeaF2XGCxCcAIcr32OxhykLMJ0fnekj1GvyxKe12TxqH
	vLvDf0waktsv4uXURm0ykGUtJREVCSi2DbdHfKAbe/uMKb0+erkXuYixypTQ1a9Hk15q2Re4ou4
	1C/hZrrer3Ct2xBcCnDENsBIG+muJjU4x0MXENiu2Aq5EkywfFlxDetDRWM3BntJubgV7yq9l3w
	vYjwZPz/ToXZ9yszM0ytd6G1QS9ZBrBi3+O9vc93iMY666sIv7hWJVG/iRBLtacVTwXQzzjGRNc
	t8dgG4I7QCpLXgoDru643P1csjeXCjirf/ME2lIumAfmGFUcbbM=
X-Google-Smtp-Source: AGHT+IEEo9h/z0kik2OsRdO8MlrRqDu0viVFKS7VlyPrm4TiRdh0ZrD6kKmbu129uRROwwkNBMLY1w==
X-Received: by 2002:a17:903:3c44:b0:224:162:a3e0 with SMTP id d9443c01a7336-22bea50dfb1mr52127375ad.49.1744396283596;
        Fri, 11 Apr 2025 11:31:23 -0700 (PDT)
Received: from VM-16-38-fedora.. ([43.135.149.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cdcsm53279515ad.118.2025.04.11.11.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 11:31:23 -0700 (PDT)
From: alexjlzheng@gmail.com
X-Google-Original-From: alexjlzheng@tencent.com
To: gregkh@linuxfoundation.org,
	tj@kernel.org
Cc: alexjlzheng@tencent.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH kernfs 1/3] kernfs: switch global kernfs_idr_lock to per-fs lock
Date: Sat, 12 Apr 2025 02:31:07 +0800
Message-ID: <20250411183109.6334-2-alexjlzheng@tencent.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411183109.6334-1-alexjlzheng@tencent.com>
References: <20250411183109.6334-1-alexjlzheng@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinliang Zheng <alexjlzheng@tencent.com>

The kernfs implementation has big lock granularity(kernfs_idr_lock) so
every kernfs-based(e.g., sysfs, cgroup) fs are able to compete the lock.

This patch switches the global kernfs_idr_lock to per-fs lock, which
put the spinlock into kernfs_root.

Signed-off-by: Jinliang Zheng <alexjlzheng@tencent.com>
---
 fs/kernfs/dir.c             | 14 +++++++-------
 fs/kernfs/kernfs-internal.h |  1 +
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index fc70d72c3fe8..355d943ffe27 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -27,7 +27,6 @@ DEFINE_RWLOCK(kernfs_rename_lock);	/* kn->parent and ->name */
  */
 static DEFINE_SPINLOCK(kernfs_pr_cont_lock);
 static char kernfs_pr_cont_buf[PATH_MAX];	/* protected by pr_cont_lock */
-static DEFINE_SPINLOCK(kernfs_idr_lock);	/* root->ino_idr */
 
 #define rb_to_kn(X) rb_entry((X), struct kernfs_node, rb)
 
@@ -584,9 +583,9 @@ void kernfs_put(struct kernfs_node *kn)
 	if (kernfs_type(kn) == KERNFS_LINK)
 		kernfs_put(kn->symlink.target_kn);
 
-	spin_lock(&kernfs_idr_lock);
+	spin_lock(&root->kernfs_idr_lock);
 	idr_remove(&root->ino_idr, (u32)kernfs_ino(kn));
-	spin_unlock(&kernfs_idr_lock);
+	spin_unlock(&root->kernfs_idr_lock);
 
 	call_rcu(&kn->rcu, kernfs_free_rcu);
 
@@ -639,13 +638,13 @@ static struct kernfs_node *__kernfs_new_node(struct kernfs_root *root,
 		goto err_out1;
 
 	idr_preload(GFP_KERNEL);
-	spin_lock(&kernfs_idr_lock);
+	spin_lock(&root->kernfs_idr_lock);
 	ret = idr_alloc_cyclic(&root->ino_idr, kn, 1, 0, GFP_ATOMIC);
 	if (ret >= 0 && ret < root->last_id_lowbits)
 		root->id_highbits++;
 	id_highbits = root->id_highbits;
 	root->last_id_lowbits = ret;
-	spin_unlock(&kernfs_idr_lock);
+	spin_unlock(&root->kernfs_idr_lock);
 	idr_preload_end();
 	if (ret < 0)
 		goto err_out2;
@@ -681,9 +680,9 @@ static struct kernfs_node *__kernfs_new_node(struct kernfs_root *root,
 	return kn;
 
  err_out3:
-	spin_lock(&kernfs_idr_lock);
+	spin_lock(&root->kernfs_idr_lock);
 	idr_remove(&root->ino_idr, (u32)kernfs_ino(kn));
-	spin_unlock(&kernfs_idr_lock);
+	spin_unlock(&root->kernfs_idr_lock);
  err_out2:
 	kmem_cache_free(kernfs_node_cache, kn);
  err_out1:
@@ -989,6 +988,7 @@ struct kernfs_root *kernfs_create_root(struct kernfs_syscall_ops *scops,
 		return ERR_PTR(-ENOMEM);
 
 	idr_init(&root->ino_idr);
+	spin_lock_init(&root->kernfs_idr_lock);
 	init_rwsem(&root->kernfs_rwsem);
 	init_rwsem(&root->kernfs_iattr_rwsem);
 	init_rwsem(&root->kernfs_supers_rwsem);
diff --git a/fs/kernfs/kernfs-internal.h b/fs/kernfs/kernfs-internal.h
index 40a2a9cd819d..24e9514565ac 100644
--- a/fs/kernfs/kernfs-internal.h
+++ b/fs/kernfs/kernfs-internal.h
@@ -40,6 +40,7 @@ struct kernfs_root {
 
 	/* private fields, do not use outside kernfs proper */
 	struct idr		ino_idr;
+	spinlock_t		kernfs_idr_lock;	/* root->ino_idr */
 	u32			last_id_lowbits;
 	u32			id_highbits;
 	struct kernfs_syscall_ops *syscall_ops;
-- 
2.48.1

