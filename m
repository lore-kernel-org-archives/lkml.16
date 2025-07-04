Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF942D8788
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751632707; cv=none; b=pjsxc4JEXto246aForxmTZMp70fxueQNufHMNwqCTIxcYitjMMc1xDYOP8a/a/t9pKkpM5UeidsmPluJ5XkTZRdcNkHFYfaDbogvIBXsTZLPTR/xlX5zy29byPmN4+12HaqLIQfjwyF2xQpDzOTioyRyEiku8YYiP6EPwe58DTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751632707; c=relaxed/simple;
	bh=6+6EkI/JGBIZUO61CrURGw6GZ/6fWgN0VwyEURRIf0g=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=DeGR9CUtgbsLQqR4powkIV+m8DRFw+qaYBD/PvB1RMbZTlPKEAbQj5voK3PciAA3UHP4ZNYKhyVPhivRu/MS50Bc1e6XntaKmHjDS8f+WK2xKZbv5jx11FdW/TzQVhEaWICPUzViMbn6P68XyUCViE8pl9Ape8002nV9HA7HCbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86cc7cdb86fso75743239f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 05:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751632705; x=1752237505;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E/KobVGwWj+yczhWyCQpLBwTo6ncGhSmFGCWV6CIOFs=;
        b=QkDdcGaXvvat5dAEvR6hTtsO9pwqBOHiLJYm0136SApaD3fvibR9H/GxJ9gvNVkDlo
         chd20Cl9+XnKlr/5d5BV+tV8p93WGyZ2XqRrU35ikxL85VRwSkfmMVAovdxfJMDtbn7j
         DXZeVInVCGTq1JIlt9qGU76FtsyHukKuxhL51Awmj1+jfGxGIa1uxnoW/zLeNbhsrkd5
         vH+N9Uiy5A/YOszfXWdnUV1vtZGM++T7rx3TGqYD5PaHuCeN1eBXRduG8VPkaN4NqPgh
         NP1KVKkPkEMSYEvkX4I79PGWJATMRxnZ6GTBpYAp4RAfUuixSrwRH6M6ycC2ly7W4Tay
         QkAg==
X-Gm-Message-State: AOJu0YxXXfBDxPERlTRqWD4Ag4GeJ1u9/4uIaTh4Wf0wOOb2JH+x/aKD
	S55NgKUsiW9B2SiO7R9mr02Mki08CerX5Z6Fomtu1w/JkmRuLgXsw9t25P4eoplFyNcMAX6X6Kb
	nGya6yLmUoLWvBxI34lbgJa2SouT6IuH2gT9ofz0Suc052mXMvs/4nm2yFag=
X-Google-Smtp-Source: AGHT+IHzxUq7frs9QYdd32isezGYus9fInAceYhr1eZ0hV+0oBhibkmx8qJmCDhr3bZ+mhwBZuuapmxFzLFc+oIhsG5DAuaRutf3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a28:b0:3e0:51b3:6f3f with SMTP id
 e9e14a558f8ab-3e1371fb2f0mr16977865ab.21.1751632704915; Fri, 04 Jul 2025
 05:38:24 -0700 (PDT)
Date: Fri, 04 Jul 2025 05:38:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6867cb40.a70a0220.29cf51.001b.GAE@google.com>
Subject: [syzbot] Monthly nfs report (Jul 2025)
From: syzbot <syzbot+listdc1ca7bb566f225a8ae2@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello nfs maintainers/developers,

This is a 31-day syzbot report for the nfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/nfs

During the period, 0 new issues were detected and 1 were fixed.
In total, 9 issues are still open and 17 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 20778   Yes   INFO: task hung in nfsd_nl_listener_set_doit
                  https://syzkaller.appspot.com/bug?extid=d1e76d963f757db40f91
<2> 2447    No    INFO: task hung in nfsd_umount
                  https://syzkaller.appspot.com/bug?extid=b568ba42c85a332a88ee
<3> 939     No    INFO: task hung in nfsd_nl_version_get_doit
                  https://syzkaller.appspot.com/bug?extid=41bc60511c2884783c27
<4> 827     No    INFO: task hung in nfsd_nl_threads_get_doit
                  https://syzkaller.appspot.com/bug?extid=c0831b61d6ade1e2d098
<5> 817     No    INFO: task hung in nfsd_nl_rpc_status_get_dumpit
                  https://syzkaller.appspot.com/bug?extid=68f089d6e18e8b1d41eb
<6> 804     No    INFO: task hung in nfsd_nl_listener_get_doit
                  https://syzkaller.appspot.com/bug?extid=4207adf14e7c0981d28d
<7> 324     Yes   INFO: task hung in nfsd_nl_threads_set_doit
                  https://syzkaller.appspot.com/bug?extid=e7baeb70aa00c22ed45e

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
