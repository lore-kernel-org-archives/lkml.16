Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF39376
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 05:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743744485; cv=none; b=sGpdQBVBB+f7sb2IX82sZPckkWV3ps3z19h5sR1bC1GykYVAPpVc/TfYwOlVdwSHNqKfVJGvRrE27EuQbnS6AUmhJXLrGapIF1sa6yGK7mQgt6p8z7jFIk0rsmHE/Phq8XSLatPWCb0CXefzxyZkn6M/rXigDiukMepUI3JvsrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743744485; c=relaxed/simple;
	bh=ZSrAJnXELvizS+zkdrMA9ZCJvgmLOWv9EV7ntwljEi4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sUQqrhSRqavQk6VUqXpqcO5BKyYaQylwBDvSQGbbUGwbYHqjhEo/gAzNQ/OTTTwheE+1JI0dZ7V7AQBMvy0bZiYk1JpdiZdFoPCxelRUoHB69G9Yln01oRUA0jTS/2RGrUEbHMiJrdS/VNAmxXnFAkp2tMcrcJVL4fI2QIKBAi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d43541a706so18747175ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 22:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743744482; x=1744349282;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1zMGCewqhmB2S6fbGZ8MeM53MmWKNIbog+Kh6suJRiE=;
        b=rg6b0D5QgmG7yjkBYfg50VK8HREtH71jOb+Qev876Yagwhlp21xsEvB3qdheUZPY5b
         I7vdDO8GeCnuJ1GSrGRtwxXGNNtC+fWeKeEG0+/wy5osMrdvFLPZM6tuXYMZ4XOP3UHb
         CF1XmKx67bDBSzZjjY65rJdVCEJTVYUyWcWTvuohrZ2nnDHWSTlTfMJL/r6RDWSlbxcA
         QGXnsYvGcCMRsITGFVpsnAUycmLSa72TrcQZo9BRzeZfhFUHjanYXoc2Yywqz928TfEh
         LNbOZEWWSYc/5MBp4zXnnfdT+bCLf5ttCn7gdP7fKE8QLCP4wnp9zbp0qYovHzs2zScB
         NHBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV57eeOevSSembGzWQJu017mWOkHPTFNcH7FfoHYTb7UJtLtibuJRJSm2aUi3MRbBJ7KSIlRpIMWGrVMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJV/v8/0TwPFZN9/zya28h3GDOuHglwKMJ6cBmpl2ClFAJqoJn
	8AZwv8CWiK33f42s1Hc32I6+7C9P5BX5CYYv5Db42YybcqQ4iWnirIaOx+bWIvdDwuy/bo2viUZ
	KgBYZK7T6UCzPvKXZ1TBYGWceuzz66TAg+5T+HchoVwaQOLwyo8/5tbY=
X-Google-Smtp-Source: AGHT+IHNPIecIsRBeY/e28Dd8iA/9r1ASbB9Pvb/iCs+9U7OC+d1BcGYcVVmtsl2gRAA8XgufoOtFSkC6l09qpclk8AHn5CFPVlN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18cc:b0:3d5:7f32:8d24 with SMTP id
 e9e14a558f8ab-3d6e576be71mr15971315ab.15.1743744482651; Thu, 03 Apr 2025
 22:28:02 -0700 (PDT)
Date: Thu, 03 Apr 2025 22:28:02 -0700
In-Reply-To: <tencent_10224B011B9C25D1BA48BB9033BC9EF71B08@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ef6de2.050a0220.9040b.032e.GAE@google.com>
Subject: Re: [syzbot] [isofs?] KASAN: slab-out-of-bounds Read in isofs_fh_to_parent
From: syzbot <syzbot+4d7cd7dd0ce1aa8d5c65@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+4d7cd7dd0ce1aa8d5c65@syzkaller.appspotmail.com
Tested-by: syzbot+4d7cd7dd0ce1aa8d5c65@syzkaller.appspotmail.com

Tested on:

commit:         d6b13dbd Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=11d92a74580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=114db1c77c985e53
dashboard link: https://syzkaller.appspot.com/bug?extid=4d7cd7dd0ce1aa8d5c65
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1479023f980000

Note: testing is done by a robot and is best-effort only.
