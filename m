Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8280029E06B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745920011; cv=none; b=JjqmBUYJy2+2R+NiN/M/wRyVZRr4C0pdNye3X5jKMrythBmLrgHJlfF0To5LszE0OB0GSGDwf5xqJl9wyUyfaH8+F/THrut4i6NFo0jK5k7LkiJRbYTv5CkgonVhO/n48GPahQO87M1Va34s7jhcfmqNGsLpf5Ov5f1X1vHe57E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745920011; c=relaxed/simple;
	bh=AeKWSJmiN8iAK+uVu2ieF+hO9jl5x9VDzPNaYAevQao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rHVEOhOKmzhZFV1YIswmYpiBi3RQBtTbUawevJsMO/frsNHDODRdyklvFHxJhgJha6f6i1S3j4ko3QCv1c2i3jMscblMkXP1EDMQMeGpBAJuNjfu53Ydj0ReY26CO8aN28hSdXwP9fzvzInPRze0YnFNBqwBUNo3V4aAA08gX4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=eYAveLgE; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="eYAveLgE"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so53462845e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1745920008; x=1746524808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWtEW0Fw6mMrZWVIgF9jffmLWBhDa/XPlG8gKYF8LLg=;
        b=eYAveLgEtJPIFF28dtcXtf1nSdm8+ebWDuGnc0Na1M5IVH+shsCia8yRTYahrqcKaK
         tNkkhloEAbiV+lfYFr69WwQNq+uX/HBww8/t8l2InAPB8tzalczgYljlXNWBmq/XEIyW
         FHmpXNyEkWDT+xgtzFgMCXGsTSO8+6saS1ZlBGNBq6c6dr53J/lpl/zwn5gFrdy6SsrQ
         u2eZHxOoOV4fE2r0od9niCDD6E30KDcxc2L02cI4faaKbkjkuL3bOuvItMhBxOT1JOmr
         zGxR2IISXzvX60rdbYDGHyQRdPQisVOM93iMVDbbd+97AOqHkxg/IP1hy07MiVP8tB5q
         5x8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745920008; x=1746524808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWtEW0Fw6mMrZWVIgF9jffmLWBhDa/XPlG8gKYF8LLg=;
        b=tMknyh7wfyMdjBOJHeiSFCCGS9Hz75nyuv7BA/qXS67i9wO4OcQMs3ng9rxmm7pAbu
         VU6Zv8FpfRuT0NcLCmQGxPINWRZhRefDZ1DIR4xy1+bfc5pEKHY0uX5UX90IJpzG9zoC
         zRWK42vznySZ/qzXXEQFhOqtWxuVGtCPy5Ax/8voq9K4stCk7PCttVBAoJozLotu/iUV
         2dhd1c3gTRHVQkWlsZXEC+b23QkQckOLVCJZ+eo+NYhEMgHFKQbAvTFF2JS2yCzQ94Xq
         +iXPmkq9aw8fLkxHx99HTGWqe7DKujYetUOIR3bfSrEkaziAy0hzrNvyE0w0H6CB7Lcv
         RQ2g==
X-Forwarded-Encrypted: i=1; AJvYcCWuzoXxr5MxSbfX6Q0iTDkAHJHr75IfxHmnP1cOkkqQfLm9/TYKtTvwpyNSr8QhcgQFliYvSrT/3Tsy2fc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjbpjM6p8Ok9ik2hu2uKPvygo+1yrxgONA6t/ySBZHfBe/EaeM
	M6heLxPLzHyxC89bvWStd3kM7KvnUiyXVKe6ukahPqvDXdJlYFyGPI6/rh6hGpM=
X-Gm-Gg: ASbGncvxh5kuV0q0FB3+bV6QxR1HuwLN5vx3BHsv07tUcLqXcgDki87GvX4ed/Bm2Sn
	MSsp5FAf7+FSPL4my9xHXn+nb0Jx+OSRI0nQi5dmfoqrgAWhWjU0ZN3LH30sJPKZ4YndnZXHvnZ
	1ZgfBegZ2ql3AcixOWRA5TBl0SBKQ1DF/o/7SCXaODZZGD35x0TWi0Sj744QARomExZYZjB4IOc
	Zv016klKMLA1AlT5UluAc6BXGy5taOWmnagag4ZkwWanBbidzGyhwBRwGuIktu0AuQLhzBPxPNI
	PoCNVUb9jQJkl6AC2nCynf0HB457avW6rF4OwzETV05SwzyBkyCIBZjIhj4xKzKX8gn2YwyfIzV
	Epix5jkoBNFImIjkEvQopNqmI3LzsQgVnXX7kyABc
X-Google-Smtp-Source: AGHT+IFPQLVLxetlM4rzijSZkUU29HGx2KZApNaKDjXu/t7Gi8I8MVg4pmVAhpsVpd8uGH3w5LKWiw==
X-Received: by 2002:a05:600c:1c0a:b0:43d:49eb:9675 with SMTP id 5b1f17b1804b1-441ad4e7dbemr11535915e9.22.1745920007763;
        Tue, 29 Apr 2025 02:46:47 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a0692a22sm169766855e9.2.2025.04.29.02.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:46:47 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 2/2] fs: make several inode lock operations killable
Date: Tue, 29 Apr 2025 11:46:44 +0200
Message-ID: <20250429094644.3501450-2-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250429094644.3501450-1-max.kellermann@ionos.com>
References: <20250429094644.3501450-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allows killing processes that are waiting for the inode lock.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/open.c       | 14 +++++++++++---
 fs/read_write.c |  4 +++-
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/fs/open.c b/fs/open.c
index a9063cca9911..7828234a7caa 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -60,7 +60,10 @@ int do_truncate(struct mnt_idmap *idmap, struct dentry *dentry,
 	if (ret)
 		newattrs.ia_valid |= ret | ATTR_FORCE;
 
-	inode_lock(dentry->d_inode);
+	ret = inode_lock_killable(dentry->d_inode);
+	if (ret)
+		return ret;
+
 	/* Note any delegations or leases have already been broken: */
 	ret = notify_change(idmap, dentry, &newattrs, NULL);
 	inode_unlock(dentry->d_inode);
@@ -635,7 +638,9 @@ int chmod_common(const struct path *path, umode_t mode)
 	if (error)
 		return error;
 retry_deleg:
-	inode_lock(inode);
+	error = inode_lock_killable(inode);
+	if (error)
+		goto out_mnt_unlock;
 	error = security_path_chmod(path, mode);
 	if (error)
 		goto out_unlock;
@@ -650,6 +655,7 @@ int chmod_common(const struct path *path, umode_t mode)
 		if (!error)
 			goto retry_deleg;
 	}
+out_mnt_unlock:
 	mnt_drop_write(path->mnt);
 	return error;
 }
@@ -769,7 +775,9 @@ int chown_common(const struct path *path, uid_t user, gid_t group)
 		return -EINVAL;
 	if ((group != (gid_t)-1) && !setattr_vfsgid(&newattrs, gid))
 		return -EINVAL;
-	inode_lock(inode);
+	error = inode_lock_killable(inode);
+	if (error)
+		return error;
 	if (!S_ISDIR(inode->i_mode))
 		newattrs.ia_valid |= ATTR_KILL_SUID | ATTR_KILL_PRIV |
 				     setattr_should_drop_sgid(idmap, inode);
diff --git a/fs/read_write.c b/fs/read_write.c
index bb0ed26a0b3a..0ef70e128c4a 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -332,7 +332,9 @@ loff_t default_llseek(struct file *file, loff_t offset, int whence)
 	struct inode *inode = file_inode(file);
 	loff_t retval;
 
-	inode_lock(inode);
+	retval = inode_lock_killable(inode);
+	if (retval)
+		return retval;
 	switch (whence) {
 		case SEEK_END:
 			offset += i_size_read(inode);
-- 
2.47.2

