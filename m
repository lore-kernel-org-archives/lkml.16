Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAE322DA02
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748949085; cv=none; b=iqVIcj3IGLScDm+5p7rxVK52kM/xs+GrtHbuo2sIGDWwl9iDxsSs5snm/VDvBKa8AMotAUYpbTwSDteDOx/utzhqJBmLel6aks3WaMmRPMVfscuiSsnUjB1Mkk8b1mNcnJ+MiODpMP6pZwQLhmys1hn4Z5f5RVIfQd7G7OufTvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748949085; c=relaxed/simple;
	bh=39mXXvyyfIMkXS9zXUd6AfYEqN7yOJb7H4QluG04Es8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=LMZ/W9ioiYArIP7pFnkV+q8POcu3BlvTgSsjSOmcdYhKJ5rJJv4wnF2bG0rFaPBCwAB35DjEw/5WhRSefYccjHZBUQODWEotkaKV1b6SKxdDWSF3ov1ct/rnhBOtasMc8FF0lHvuodl08V94J6zWlY0qgV2MeUeWGrNIf9fdiIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddafe52d04so41563385ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 04:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748949083; x=1749553883;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tpl8XxbiMV1cRiVkI/cGvUd7CgFxBQkoXApbA76gKdc=;
        b=ayfFTq58s6ZOBXa1vJRbmwn1oqsUCKtd3DyhnHskcNrI83NY5ajOMAJBFQ8ZtPVGRI
         YtdcFZMEnx08BSILfq3/H35UiosKkBPdniIMwdQXPASIQaxF34Z7NxzuaN4Jit7f6UqE
         JUZU8z++nExDxGxmldXOxN+9b9OLg1BnJImPHK+yk8eHJeNvRqhVqrcaiJCgm4ihO6cy
         VkpCUILDCS1Z+S1peimcVOdMgcsIw/MEoq5KMJh6nemTD0STkIXZiNaviaT7oanTdfeh
         zhvi9HJ3QTcIjIus8BB9PJB7b+MR9Q1Ow5m/1kVGEXtYpOzDEbsbWPDCflo53ofE21kW
         fumQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVqYpeVCv+o4nCZ3ZFkAVowsGsvP4ym5RkQ1b9STrQnCWYq5OocUQN+cGNQDDmI5AUcjZCUkES7ivI3bI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF8KtghmaoYvk4L7vU0o5gt9w6pqlzCbQLy5mo9z+WxJmTPehh
	LdN2plsnj0CH2MCcZqwtBSbv4bDFW9B/dD5RYCpo0L/dxTnoT3Zgq+tcWxeNQWNGwXOlvn4wQnd
	A+i8OrxQ+rgmpx6LwIV61dqes4uZ3tQ2bTFvSz3L6IQ5AJ2mEhpMjVKUCugY=
X-Google-Smtp-Source: AGHT+IHHXp+bRWodpMAlloxTc6DFDLShox9JCRW71P7EMP6IAmp/Bl/hvklldZ2HMNI74y370h5TRku0JNjrBTnyj2ApY5MTx1LQ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:174c:b0:3dc:7660:9ed9 with SMTP id
 e9e14a558f8ab-3dd9c7135ebmr160327415ab.0.1748949082930; Tue, 03 Jun 2025
 04:11:22 -0700 (PDT)
Date: Tue, 03 Jun 2025 04:11:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683ed85a.050a0220.55ceb.000e.GAE@google.com>
Subject: [syzbot] Monthly ocfs2 report (May 2025)
From: syzbot <syzbot+listcfb743ead64ed2872d1a@syzkaller.appspotmail.com>
To: jlbec@evilplan.org, joseph.qi@linux.alibaba.com, 
	linux-kernel@vger.kernel.org, mark@fasheh.com, ocfs2-devel@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ocfs2 maintainers/developers,

This is a 31-day syzbot report for the ocfs2 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ocfs2

During the period, 2 new issues were detected and 0 were fixed.
In total, 69 issues are still open and 16 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  195056  Yes   possible deadlock in ocfs2_try_remove_refcount_tree
                   https://syzkaller.appspot.com/bug?extid=1fed2de07d8e11a3ec1b
<2>  58588   Yes   possible deadlock in dqget
                   https://syzkaller.appspot.com/bug?extid=6e493c165d26d6fcbf72
<3>  42999   Yes   possible deadlock in ocfs2_acquire_dquot
                   https://syzkaller.appspot.com/bug?extid=51244a05705883616c95
<4>  19736   Yes   possible deadlock in ocfs2_reserve_suballoc_bits
                   https://syzkaller.appspot.com/bug?extid=5d516fba7bc3c966c9a9
<5>  13063   Yes   possible deadlock in ocfs2_reserve_local_alloc_bits
                   https://syzkaller.appspot.com/bug?extid=843fa26882088a9ee7e3
<6>  12679   Yes   possible deadlock in ocfs2_init_acl
                   https://syzkaller.appspot.com/bug?extid=4007ab5229e732466d9f
<7>  7371    Yes   possible deadlock in ocfs2_setattr
                   https://syzkaller.appspot.com/bug?extid=d78497256d53041ee229
<8>  2696    No    possible deadlock in ocfs2_xattr_set
                   https://syzkaller.appspot.com/bug?extid=ba9a789bd1f4d21fcefe
<9>  2409    No    possible deadlock in ocfs2_lock_global_qf
                   https://syzkaller.appspot.com/bug?extid=b53d753ae8fb473e2397
<10> 1359    Yes   possible deadlock in __ocfs2_flush_truncate_log
                   https://syzkaller.appspot.com/bug?extid=6bf948e47f9bac7aacfa

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
