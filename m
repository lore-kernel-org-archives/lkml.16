Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247932CCDB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 02:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751510961; cv=none; b=T8Bs7bxzFHPSBsov2kZENjjhABbvz9Y9270YQqj5OsJPeMe8Or6zEZUibLQX3GnwRFLYak52NrtfCPE8QUAIKi9PtUgzc83cQs3ba5Ir9R+9gFFVke5/+r9tMVUjvdXDsZaXvmxYLHMMDeOADyJIDHdf18fTMNDWmif6ohZD56w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751510961; c=relaxed/simple;
	bh=W5FlRR6YTa/EABCsINE9s0W3nGkGvhfbMKuuIVO6mow=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=b0KyTKKdFeQbAbDMK7CXZbBhAbd1Slqj+FKEcy0sG+RR0gsBQX/EJNv9FteuV6kSsDXP6N5dYURnKflCbBZR0Vsw4Z70sWrWngquwAEFtsU4KIXcWrS4GXLAWjetr5w5s4Y33vQX+SKo+2LmOS8HX1BjTORfT1ZBJD368A5yXqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86d126eabcbso1136301639f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 19:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751510956; x=1752115756;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hIdJJk7L+w9yM/Guqvh5a2pi/aal7NLpmCkShl053yQ=;
        b=c6X8CnRqL4NYNlJ7Csd97y3Lkl/1twusfGXgQLyB7dECQD1HCb9GTcsxfCAvfmy8iD
         h+RZpG8xJuzuDmAgJZGRdRBQnxO9gVGxhui8m2hhs0b+0+76U/Ib/9g6EhR25tam9Rma
         F7RcllhzWvOIXBH8kT101CpKH/jKZGAOkbdf0KKGONHpV0WldhQudypeH1FCdd6fEzcw
         xgiBW6RxxARQIaRILwwKGPyDu5BGbQlC4sfB0CmcrzTAMZMowqEtJdqGQPUNthyN7XT7
         hzVWf7YGHBMDGOI7lUK8rvTxm3uv7D4vK/B6Zks+kZGGSAD40wV5b0p9V5dmBaKMZ02a
         vzrQ==
X-Gm-Message-State: AOJu0Ywt7q33fygfkbuM+oF87TNjSFVYuGug4ARZypV5hJccIKRkBkIM
	cTT7sZHI6ecQgcJ3mu9fZRFDFnIC1CtnqNdA2FEsOjjacCFtmmxK07rmZNI6rNF4Qxjxl2Tp0Xb
	I2aRI1Yw55+OqNN1mOgGJTCZPGGv5SsY9COM8NzwhYP+eBChOtrSISUSOxo4=
X-Google-Smtp-Source: AGHT+IEYcQuTpDRI9v7a2EuU4sKwlMWCPHKAnLV2Y9JS/6nfSEVBg8iRej/DypPe1MNrXR59MMdAjNdmZ59Af42HrDiF6E7b4kKt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2d93:b0:86d:5f:aef4 with SMTP id
 ca18e2360f4ac-876d32b9611mr198326439f.0.1751510956376; Wed, 02 Jul 2025
 19:49:16 -0700 (PDT)
Date: Wed, 02 Jul 2025 19:49:16 -0700
In-Reply-To: <686574b1.a70a0220.2b31f5.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6865efac.a70a0220.2b31f5.000c.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [fs?] possible deadlock in __simple_recursive_removal
From: syzbot <syzbot+6d7771315ecb9233f395@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [fs?] possible deadlock in __simple_recursive_removal
Author: lizhi.xu@windriver.com

#syz test

diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
index 760437a91648..537390c984ee 100644
--- a/fs/binfmt_misc.c
+++ b/fs/binfmt_misc.c
@@ -734,7 +734,7 @@ static ssize_t bm_entry_write(struct file *file, const char __user *buffer,
 	case 3:
 		/* Delete this handler. */
 		inode = d_inode(inode->i_sb->s_root);
-		inode_lock(inode);
+		inode_lock_nested(inode, I_MUTEX_PARENT);
 
 		/*
 		 * In order to add new element or remove elements from the list
diff --git a/fs/libfs.c b/fs/libfs.c
index 3bc6c3750b47..0e3e33c4f159 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -611,7 +611,7 @@ static void __simple_recursive_removal(struct dentry *dentry,
 		struct dentry *victim = NULL, *child;
 		struct inode *inode = this->d_inode;
 
-		inode_lock(inode);
+		inode_lock_nested(inode, I_MUTEX_CHILD);
 		if (d_is_dir(this))
 			inode->i_flags |= S_DEAD;
 		while ((child = find_next_child(this, victim)) == NULL) {
@@ -624,7 +624,7 @@ static void __simple_recursive_removal(struct dentry *dentry,
 			this = this->d_parent;
 			inode = this->d_inode;
 			if (!locked || victim != dentry)
-				inode_lock(inode);
+				inode_lock_nested(inode, I_MUTEX_CHILD);
 			if (simple_positive(victim)) {
 				d_invalidate(victim);	// avoid lost mounts
 				if (callback)
