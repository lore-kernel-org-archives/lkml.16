Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F751DE3DB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744182691; cv=none; b=SFETqClvt+RE1mNXEDmMKsdKNja8DFZUrvvTy7xmd5ikaijGw+tYkcb9pRgGm5Sep5yRReB721E7eaLgtiNj9OdehMH44UJBZpZO2a51aJlJuHQFebZoOTM7XT9mswMJmInW33VE57W0ErmH6qe4fORAuNFAU8BapjXTh7CQsE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744182691; c=relaxed/simple;
	bh=8yo7qFNpGm3Iqpd2QETPNKVSb2u6qGnqeJKeQ5Rn31s=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=U1hG5+e/I7qepvR5+YTSO94sFw5k4WMQ5jDO86N2toY1aXzb4gDpgXWZf9iP07r92WhXNIZy+kuunRt0M+/BWStLGTxYz8/0m0zsmEFTkcJJnISGUP6oJMJvjEdHzEXPag6gyTWHcb/Qp2pMb3iPBBuCJG3wOVP4TfOdfXhhgFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85d9a52717aso982787039f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 00:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744182689; x=1744787489;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d50mdL1lyjkcjQSMJH4NMkC+s1DdDYxYW9Phgs2QdiI=;
        b=PTg0pHHAGg5Q9k0OePW3Pm7pzhx1dZ3h0sitkZDdJVyvrX5jmpPKW/mQzZnaXAvhoX
         DEE0rW+K3urmCCgz5bRNa+w0eVuZc0Gv0wJ/U0eZdTrSyn/I9Ac3kC3eXnqyz60ShKhs
         DEzOrIiRH/vhTC9ePgbxZ3oooeZ7xzCguR8WFhQqD8F3WW1C1HRw2uS/7VGp3U36zYpN
         mFFLxKxXwjP7zqaoU56kshV7AAr2WeqSl8c2HVBw6SAZH8F/ErCuf5u+EpX5Pm3p8x/5
         3+YfMhtUWr7OtgxaSJiMu6mMlMGP3js/oqAewYr/p7sCBNnR3jGFf5Akn+rkyMbgO8a1
         0hCg==
X-Forwarded-Encrypted: i=1; AJvYcCXnK0S9xx6t94kxNTNZBcMM6BMMsniirjDqYmQj7vz1Kq7+CwwL9E8TN3eL7do5C+8XTLGrsrEgjxxXsBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJCtgfJxQPCTOz/jSnQGBcfZc/4enDmpvB4GAMtEKDlnHOSIMg
	7qWNUqceIqsSbp0m4U4DXIuzCY7FZiqq5cqtNXZ/qyUrS12zJgPW6xm2xa1qo+gk+9X4y8cL6K2
	Dwu44ZeicpQoLsSoVEcqtZCECaF4KEPlea6JDXqsK1IPrbHGELwSPkfo=
X-Google-Smtp-Source: AGHT+IGBawI2go2EuwHH7xkv31iYK/opqy2ZuAvFrsqEVpjodbKGgPhNHS8OhMVgPNqvoon6TV/A1fw4fM9vdTCbLz+ZnVoF3Dl+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aa9:b0:3d3:d965:62c4 with SMTP id
 e9e14a558f8ab-3d776c9d282mr15578015ab.10.1744182689147; Wed, 09 Apr 2025
 00:11:29 -0700 (PDT)
Date: Wed, 09 Apr 2025 00:11:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f61da1.050a0220.258fea.0015.GAE@google.com>
Subject: [syzbot] Monthly gfs2 report (Apr 2025)
From: syzbot <syzbot+listbb51bff7ac2e12debb8d@syzkaller.appspotmail.com>
To: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello gfs2 maintainers/developers,

This is a 31-day syzbot report for the gfs2 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/gfs2

During the period, 0 new issues were detected and 0 were fixed.
In total, 15 issues are still open and 34 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 736500  Yes   WARNING in __folio_mark_dirty (2)
                  https://syzkaller.appspot.com/bug?extid=e14d6cd6ec241f507ba7
<2> 1714    Yes   kernel BUG in gfs2_withdraw
                  https://syzkaller.appspot.com/bug?extid=ed42f17ebcb58526788c
<3> 1365    Yes   kernel BUG in gfs2_glock_nq (2)
                  https://syzkaller.appspot.com/bug?extid=70f4e455dee59ab40c80
<4> 30      Yes   WARNING in gfs2_ri_update (2)
                  https://syzkaller.appspot.com/bug?extid=7567dc5c8aa8f68bde74
<5> 18      Yes   WARNING in gfs2_check_blk_type (2)
                  https://syzkaller.appspot.com/bug?extid=26e96d7e92eed8a21405
<6> 13      Yes   KASAN: slab-use-after-free Read in gfs2_invalidate_folio
                  https://syzkaller.appspot.com/bug?extid=3a36aeabd31497d63f6e
<7> 10      Yes   kernel BUG in gfs2_assert_warn_i
                  https://syzkaller.appspot.com/bug?extid=ffe01cefd437cbde362b

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
