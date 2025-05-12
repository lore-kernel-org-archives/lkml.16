Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C296E2951D3
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747056881; cv=none; b=G5z09GMssDnrFbAMDAICuQ5rOQsqRk7YS8XgV0kf5clk3NzvjCsthMJXtFw91zXoVy3OAE95BjLr0435wKV66qIz0IMEIWWxc7+kiA8q6eRHE116jY45+KEdNljUoBwSOuAu2aBOYVFfqDi2Yh7w4W23ddgTeUpE2NuzhrHkg4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747056881; c=relaxed/simple;
	bh=R5GMYtFj0h4A7mc3vAohAShmVyD3Xpx77U7uj36wtYU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=aPgJc0bDsDrbsNddZ/Rlz8Vv6zrqZopnawKmWbz3CMqWzuM3EuEFUi0idYLQtcKWZnfJg65nGBED0a5HqV5WuCCRM3gA0aMxOTzemQTS/94RdD/41ZOm2LJhA/mM8x2IUs6b3b+fNoXqFFeHc5wAoRBdkyh69x20FgcNO+hL89g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476870bad3bso73635251cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747056878; x=1747661678;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wpzm94ef45sTLmkJ+/qIsa0Ro4johfQXs/vt1jnkyuE=;
        b=ZZgPmw+Ph+6BnQZvE6KZM2K7Z6Zd9KBiyDzHjF/FNA4NcMoSopAQ6humJxkXX/Zyqq
         It/MESQTCpiloeHJWE6BpAgPDeLyoQtG5M9tubYURh/Q+6ctJ4NR9s+6xlOQZjZKytuP
         /7SPQZ1UWygaFUxguBuDrJaMY7Pg7Qc6R+9hoA9/6DknXD5QnZynelND2pfcsRM+yu9r
         P7S+IF3PxWnjfJwq59/Y74F9fnF7ywyEpRN4coU0eYOehT66DiIkIHcMsE8TcOQ+txue
         JOcy0hhrUoXhMO4UgPlFl9YiQvGdu5X6ht4uiaFATdwGnzfAp+0XcoSlQFEgsRe5Kn06
         T7RA==
X-Forwarded-Encrypted: i=1; AJvYcCVq88YVLJcUxnHe66FWXZsyIU9b+8LglcXA6SeVgivV57CGzrEpxtbuk9Q6emfqoH40fmsUf0e8Uh5Oayw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBJhTYaGPvqrKiTFSRdSSzbuTGga4t1Py6r3lme6+KuAcIzZ2V
	Sm3B3PXRZsVYkUNHXNiSpOiIuXLmhrYJ5YuMgg2xjx9MfGrEc/YIppfMe2MtZmRxV7BaGOMwrx8
	L6rrDt2+vgxECjgWTLj8i709QxEpjpZfctfb+0ABNEr53v4FBJCSB/Gs=
X-Google-Smtp-Source: AGHT+IFXdt4ENEPXB7sK2eyZrcIwteG/hOKBe3Z9UfACWApKzBiXqyWOkChvtmQx9kcBvhPizqRB+9JrJs9FVGH6Q6FAaK0s8nAg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1945:b0:3d4:70ab:f96f with SMTP id
 e9e14a558f8ab-3da7e1e73f3mr147928045ab.8.1747056867646; Mon, 12 May 2025
 06:34:27 -0700 (PDT)
Date: Mon, 12 May 2025 06:34:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6821f8e3.050a0220.f2294.0060.GAE@google.com>
Subject: [syzbot] Monthly gfs2 report (May 2025)
From: syzbot <syzbot+list6c60f00c820c2d824539@syzkaller.appspotmail.com>
To: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello gfs2 maintainers/developers,

This is a 31-day syzbot report for the gfs2 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/gfs2

During the period, 1 new issues were detected and 0 were fixed.
In total, 13 issues are still open and 34 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1992    Yes   kernel BUG in gfs2_withdraw
                  https://syzkaller.appspot.com/bug?extid=ed42f17ebcb58526788c
<2> 1376    Yes   kernel BUG in gfs2_glock_nq (2)
                  https://syzkaller.appspot.com/bug?extid=70f4e455dee59ab40c80
<3> 30      Yes   WARNING in gfs2_ri_update (2)
                  https://syzkaller.appspot.com/bug?extid=7567dc5c8aa8f68bde74
<4> 29      Yes   INFO: task hung in gfs2_glock_nq
                  https://syzkaller.appspot.com/bug?extid=dbb72d38131e90dc1f66
<5> 18      Yes   WARNING in gfs2_check_blk_type (2)
                  https://syzkaller.appspot.com/bug?extid=26e96d7e92eed8a21405
<6> 10      Yes   kernel BUG in gfs2_assert_warn_i
                  https://syzkaller.appspot.com/bug?extid=ffe01cefd437cbde362b
<7> 5       Yes   KMSAN: uninit-value in gfs2_quota_init (2)
                  https://syzkaller.appspot.com/bug?extid=9fb37b567267511a9e11
<8> 3       Yes   stack segment fault in gfs2_glock_dq
                  https://syzkaller.appspot.com/bug?extid=e0dbe53de58ffe4a5f31

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
