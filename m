Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685812581
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 02:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751510875; cv=none; b=MgvKbYXvH6FsIp7GqrJW7xkexuxcOoCTFtT67WJCqTTWm9l4t6NrR8q8sbjn0qkEtTn5Bq18345vYhqYCnv/pnQz1p7B8hYpuqm6mh7yIDeAv2OF2okV/euXZKN8ms/AaFcHxuev++oF/X4wcoQl4Fq6+7FLbxPQ5ThvAQk9i2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751510875; c=relaxed/simple;
	bh=YL31hi9vXQ75Z7wN5o6mCJt+zMIu9DAJ+6fxvY6pfMA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TVTKXz1mkYYattgsYzHuVdupBuQSVXb/HeFMXAlJfl0SNXas81KXLbjVM89DqmI0qXdIUeaW8CeVsiLD4owuIvI2YSfvtGyzi9SNw6ADXSo9n5rd1Xl/pn8XzMKp+OMgBW1Bbyrwy+ncxfcYefedktIvXZEBNoeLMTaMFC+Mg+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-876b1339851so199881839f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 19:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751510873; x=1752115673;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RIh4SgW+9m2GwHTgrKtr/VKBG5y+eoIxyVQ0mZ5SFU4=;
        b=jr0ZRUZMtpWSfe5/DuOjvkN42X8wFtz/3mYbkgiVy1CeyARHoW6yo8GLV+OeH28oOc
         /NNQmlKV4Cv1Ja4Y7Wx8DHvEnrnpzdtq2H6Jjnl1aFGdCFdyFIGElhr3UCDEHNsN3VCL
         FVWkK9tP26Rzi1Qj+6NipBUXGX88IyVVIns2nPnL3efQ5TigCGv7ps5fFwwO4KbzkfGc
         +xLjIik4kdCY1DQYQTarU0honlCoPBjq+kQGGME0M/hDQz000DXjGlM4O4JrqRz1VT0g
         OgmcdiDsiugholnYqzEf/tx4UnzTnOX3AjW8EBPpNZJ0paJMwS0Ke/MZiJIA8V7RRP2J
         ACvQ==
X-Gm-Message-State: AOJu0Yy5qJnU5M8D+RTjzNnkDVpg0pDR+0wsR16BEcV0qd8Kcn3Shg63
	j7BxkB3TKc6cNxUvPibp1MduOcOuHeh+0Vmi+dp5DzoE9wdFX65eGmW7A4OBCyvmstgviDtMDrp
	NweRF8iOjtiUdUoBRiK3yax4kqeD3lwKEjGvS1D65Uyq9T5gBO8/CxEJKOo8=
X-Google-Smtp-Source: AGHT+IHjmp13P5RGYqK9USVTT53yfZcU3xXEDu7QZSPA4GrnE6DnO53YKYwf9Doc5PFkla51IJfL1QIGDNaRFg8+UOvjRogPWb+r
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2c92:b0:864:68b0:60b3 with SMTP id
 ca18e2360f4ac-876d20c3ceamr277690739f.12.1751510873588; Wed, 02 Jul 2025
 19:47:53 -0700 (PDT)
Date: Wed, 02 Jul 2025 19:47:53 -0700
In-Reply-To: <68656f4c.a70a0220.2b31f5.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6865ef59.a70a0220.2b31f5.000b.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [nfs?] [net?] possible deadlock in rpc_close_pipes
From: syzbot <syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [nfs?] [net?] possible deadlock in rpc_close_pipes
Author: lizhi.xu@windriver.com

#syz test

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
