Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B14423ED68
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743663983; cv=none; b=Hk9aUK9FXI6izpXdmF4bv74Vj+nbp5YIiwM5tneASUJzOyuVPr/y/4Ip4rTKGSKc+eJSZas0Ifb/6hjSEiNAYlkPDZSSqgoBK5f2Ds5jzUpRGGuhF9txt+0QJF/r5bTDwNbBqTbjc8a4LPI5iJ0FW1yd+u8X/QDDwhJVzQhI9nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743663983; c=relaxed/simple;
	bh=msW4OHTqeQD5/fI6ollGmj6Zfe1iTA9RBCs+z2/02qQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=AjeK/usverPLMNeQdPSwz1LsUb4LSjZ3j4zzfxntRWNwFikg+tyh9puKZHFuQJsfp+jv0NXguw2L8nB01D7tDbwqCN+AwmObnhWwCZ15OxPUXWq3FjyEjEXesqFuNoke21AImartZKaulddAzURqgPpVIgJJXsV/d6X3Z2XTfn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-849d26dd331so184495239f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743663981; x=1744268781;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7dubI7A+8/AJKZ0segSg1WSFAtvONQ9Ynr61IT2Yuew=;
        b=qYea3HB6nD03LzzSUOFjMiiaacRKvR8sNvkSn8YulTBtdRI13LmMQ1ZB5c8euSe2eB
         yU+81OUngSjLjuq34ZFwqQfv0tUU/OkQSy15odjY3q8fkTYZwP3OXKJlHwhWl/SGxu1E
         WeUd9FwWBZ7uAixTX5bhIl9+/WOaZR6yomZ6OHBfyg+urUfzZiTamUkgWUETBXmUrB9D
         aUATz5mtAti/PDlnl1Mwdqsq9h94FDITjuZnRIm/2gHvvmc931MepZNSNrhItadsrSWn
         O3e9CfQQUaIRzWG1MDyHQ2v7WL3Sz4Ul5ikrsG7xQMTSL6pH5laHXdbKLS9CoQyEp0X1
         9VxQ==
X-Gm-Message-State: AOJu0YzT/tKPGwSn2v5Qzb6ARTDB32tCHj4M1nU1CXhU1Ko4klysZjvC
	V0Q94zXa6BXyc/A0KP4g6bxMP7pGeOUlZc06qcH5n2JejHWuVo4sUUSS/3p8gTESIXaPvoGGcgI
	8PeA4AlCRq3PFeNtaL148QebDQvHNc4nBkxhDr2e23z/PAnfPIyi9flc=
X-Google-Smtp-Source: AGHT+IGCkEE4ER7Pe49pqx25rRb5anZsM1vJ2b3g7aVmetiRzKNlw0V9jaes2+k3d+BZAiHc3czOgy6irU/HdVYtcaCxZpYCL2z0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:98c:b0:3d0:26a5:b2c with SMTP id
 e9e14a558f8ab-3d6dcb9deb9mr18124105ab.8.1743663981582; Thu, 03 Apr 2025
 00:06:21 -0700 (PDT)
Date: Thu, 03 Apr 2025 00:06:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ee336d.050a0220.9040b.0150.GAE@google.com>
Subject: [syzbot] Monthly rdma report (Apr 2025)
From: syzbot <syzbot+list35c2a04b7be876f280f0@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello rdma maintainers/developers,

This is a 31-day syzbot report for the rdma subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/rdma

During the period, 0 new issues were detected and 1 were fixed.
In total, 18 issues are still open and 63 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 25924   Yes   possible deadlock in smc_switch_to_fallback (2)
                  https://syzkaller.appspot.com/bug?extid=bef85a6996d1737c1a2f
<2> 356     No    INFO: task hung in rdma_dev_change_netns
                  https://syzkaller.appspot.com/bug?extid=73c5eab674c7e1e7012e
<3> 259     Yes   general protection fault in smc_diag_dump_proto
                  https://syzkaller.appspot.com/bug?extid=f69bfae0a4eb29976e44
<4> 199     Yes   WARNING in rxe_pool_cleanup
                  https://syzkaller.appspot.com/bug?extid=221e213bf17f17e0d6cd
<5> 91      Yes   possible deadlock in sock_set_reuseaddr
                  https://syzkaller.appspot.com/bug?extid=af5682e4f50cd6bce838
<6> 70      No    INFO: task hung in add_one_compat_dev (3)
                  https://syzkaller.appspot.com/bug?extid=6dee15fdb0606ef7b6ba
<7> 13      Yes   KASAN: null-ptr-deref Read in smc_tcp_syn_recv_sock
                  https://syzkaller.appspot.com/bug?extid=827ae2bfb3a3529333e9
<8> 13      No    possible deadlock in smc_shutdown (2)
                  https://syzkaller.appspot.com/bug?extid=3667d719a932ebc28119

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
