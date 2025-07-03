Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944D42D77F7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534667; cv=none; b=WXwEA1HstJe8uujsHKtDWR8g3w0ztd/wkSheQ76PQwKa38n48m6IV0EzRLYoPh9JRwD1lFTotTngN+Mfao6fdVqjuDNuc+n7Lv+4hJfqM/T0VLV3NaqNCoOFYRD7yuKoBBPGol+72HOwGpE5iUltIVYa9O/XzlWa/m8cMzerBWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534667; c=relaxed/simple;
	bh=4Cn4REXStSrCc6rXuE1vLDUq0c6vg6KStbQwfbvxvRQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kXCLiz3Ciz4eyHd3THSkF17GjXcScDWYfQsBql76+yVS20+XsC8v5F3f4k72NHqWABZpQYUPQxRaD06pc9OepmEx9GPbElffKgbNFyEzXCtibST0djZHoX+MQoOD9Xs0Az96MGSG5mmQUHCEDVxztCfKS6QRU7cbbg1KAvMTGLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-875b6256041so785296539f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751534665; x=1752139465;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgcLvE1WUtGoOwj7ZwR07PfY4zTdSzD7QiAijsGNT9g=;
        b=XXWJ9iLpM1fb1rrb8BpMbPuXIQOXCsZ68aj5PCTPkpFdNatHHs7IH3lAAh7u+c54Oi
         lwLDFg1KXfvoVoArVUfMQ1rBDVJHnPnEb4MT29/QFUP0R3nMhJUZb1w9Ffs2oFUhZ0vm
         sNwjplh+scTMsemDovnl6k3gCfbkbF++I9wAUjGaLf90jJghBR3IYsKYJ6v8ohdngusE
         fYUnct+8+/oyZU+Ridskxu6goGAW9CXiNbUMA12G2sUkaeje0amDYeo9vK/H9YfWIsct
         s62J3wnbrloO0d2QMoXPw3BoGchZ9/Zf0c0h0tStwLOQDW2nBebAMwYKyxMdwpREBQc5
         ffbA==
X-Gm-Message-State: AOJu0YwGkZ9b6z6wUuZ9S0BcE27+pn/4ppofzwQDv5bBF77ltm2i+58a
	GPUHHiyrkxwdKWCy0YlfNtwQVfYSQ6zP0gvOtw8RrJ4DCcihXs4QfKAf8X9krOfKrTUTEvgXKr1
	kmx44OPrxU+wDsg1hH5XR0a2kD8JrWZH7xxJAmar/ZZuw3q5O0sgrBYAj06c=
X-Google-Smtp-Source: AGHT+IHdn9P4lCCuzz932qLrzGFsaFbczPFKBsZmpGWCRvkEdmIPQjYawzekVEfPI8vFjR9SCUQPJmjatZ+qfsA4r0HwXQ9l9smx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a5e:8d09:0:b0:876:19b9:1aaa with SMTP id
 ca18e2360f4ac-876d20de36amr305697639f.9.1751534664886; Thu, 03 Jul 2025
 02:24:24 -0700 (PDT)
Date: Thu, 03 Jul 2025 02:24:24 -0700
In-Reply-To: <686574b1.a70a0220.2b31f5.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68664c48.a70a0220.5d25f.0865.GAE@google.com>
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
index 760437a91648..64dc551681b9 100644
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
@@ -803,7 +803,7 @@ static ssize_t bm_register_write(struct file *file, const char __user *buffer,
 		e->interp_file = f;
 	}
 
-	inode_lock(d_inode(root));
+	inode_lock_nested(d_inode(root), I_MUTEX_PARENT);
 	dentry = lookup_noperm(&QSTR(e->name), root);
 	err = PTR_ERR(dentry);
 	if (IS_ERR(dentry))
