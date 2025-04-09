Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5B3254862
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744182692; cv=none; b=QII5UR8WYPKs/cnoKsS6Bc7vjK7TADglRJELbI35C03WGl5bDN4ALHhv505FokyDGmAXf9wBYpIZP951wJwZbg5c4qTk4mZrHhUa1dP/k82yb6wC56yc2y4xoUeNBWKsJVrKpjkoe8D8pOI6dhEGCBFgKSIEIQiHZIz6Z8J/tQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744182692; c=relaxed/simple;
	bh=cF+GdEvDlvR+eW3APXrac70u2/BsJEQ0xy1cLwTP1Vw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=GU+rUMEgeqCo4eZNS0CvzPdMTWsxkfrvuAqfI3hqhb2GwMy7Q+On+uzQ8ws+Otu0NDuW2hhHpDr0I8OXTHypqcV0xkbmp3yAFXw4WVrtGP7NHPE5VUdRWgffN04doBtilvFcI/ZjhGaLPgxlVN8sG/HHOjUqLFYb5Kmpd3XTaNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85b5875e250so718099739f.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 00:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744182690; x=1744787490;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Tv15xLHz25nQS5v1zxfS61nspX79os8te6jVU76pyw=;
        b=NNGKtWa/QZUp/FKHAukw1iUdwv6JeIiQ0Jvy14wITwycJ+Sn7LBWZCuMGGK4t+jQUv
         71DMlqDnObxcgedFsIq9ISoaMMzixE5L/hUo3H03mqSpG55rbLJ6emIHdwfDHyNyIVRn
         1drADK5yQUAkKYrvpLqD8sYFN9yY/DpuBaUV6+5EfM2+nztZ9zdWu31sQu0Dg1Q7aH8F
         mS0WVVTKdXiD0PC+XvFGvDsGtKtSJyKYGAIx+nJiUdor/8dnGgILKZgVLj2ZPKrEKigz
         M/ozSgM8I+GKS868EklJpxahvKrom4wUPqOzXsCjms2T1MUQzr6Qf74L4TRiQUChZG+K
         0oFw==
X-Gm-Message-State: AOJu0YyHQkyGYs4gyuaHQ/NrCLSjYgLCABpQgTkf49cTvH+CrCm26cxW
	rzQIDAWoY9Ay4FCgeaZ6eIJdYrLg/pMWkkaf1nzu4ZTSlYsQOXQoQqfU3F0UvmpnESMO/jEpv88
	/l5mAWm3/qWYfBhZnexxSxW2EvVJpdXSwDN/8YDPHaUcDw0b+PGR+hu0=
X-Google-Smtp-Source: AGHT+IHmXVwqL/pqEnn67T+QPxOK+1jA2rVILDgEpbxTfhiAnq+J8M0EkvZG/u/D1lTKMTTWHqVkz7Rw9j496haRgDGYBVxFZpes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1607:b0:3d6:d01e:7314 with SMTP id
 e9e14a558f8ab-3d77c2adf5amr14375755ab.16.1744182689853; Wed, 09 Apr 2025
 00:11:29 -0700 (PDT)
Date: Wed, 09 Apr 2025 00:11:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f61da1.050a0220.258fea.0018.GAE@google.com>
Subject: [syzbot] Monthly net report (Apr 2025)
From: syzbot <syzbot+list74a39cccbcbfcf70c2a9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello net maintainers/developers,

This is a 31-day syzbot report for the net subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/net

During the period, 10 new issues were detected and 3 were fixed.
In total, 133 issues are still open and 1592 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  315729  Yes   possible deadlock in team_del_slave (3)
                   https://syzkaller.appspot.com/bug?extid=705c61d60b091ef42c04
<2>  26386   Yes   possible deadlock in smc_switch_to_fallback (2)
                   https://syzkaller.appspot.com/bug?extid=bef85a6996d1737c1a2f
<3>  12279   Yes   possible deadlock in do_ip_setsockopt (4)
                   https://syzkaller.appspot.com/bug?extid=e4c27043b9315839452d
<4>  7795    Yes   WARNING: suspicious RCU usage in dev_deactivate_queue
                   https://syzkaller.appspot.com/bug?extid=ca9ad1d31885c81155b6
<5>  6881    Yes   KMSAN: uninit-value in eth_type_trans (2)
                   https://syzkaller.appspot.com/bug?extid=0901d0cc75c3d716a3a3
<6>  6366    Yes   KASAN: slab-use-after-free Read in __ethtool_get_link_ksettings
                   https://syzkaller.appspot.com/bug?extid=5fe14f2ff4ccbace9a26
<7>  6309    Yes   WARNING in inet_sock_destruct (4)
                   https://syzkaller.appspot.com/bug?extid=de6565462ab540f50e47
<8>  3673    Yes   possible deadlock in do_ipv6_setsockopt (4)
                   https://syzkaller.appspot.com/bug?extid=3433b5cb8b2b70933f8d
<9>  3315    Yes   possible deadlock in sockopt_lock_sock
                   https://syzkaller.appspot.com/bug?extid=819a360379cf16b5f0d3
<10> 3195    Yes   INFO: task hung in linkwatch_event (4)
                   https://syzkaller.appspot.com/bug?extid=2ba2d70f288cf61174e4

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
