Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B353C2DECD7
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749817548; cv=none; b=CglfqS62ZUijkxCsT4bAz1PPDMWMhlpAlXYOxDRWerSdckd52P7aEckBvQaVpsTgXA9/ItTyFL1HrJXOS3/Kbar7UOx3cUMJIdb7IKTOeMxBfzBF1h7fGNXYOwwUOBgIwaTDCasyJg0sEERIruQQ6y0RX6a/H8MYopODvS+55c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749817548; c=relaxed/simple;
	bh=dNnO+eIDfc+6PtW9CaxmXPfcjU09p2HgCXhMYmX6GQQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=jteFQn5eLPDEnrtcPfabEZcpA0uJXsgunSHxJWKnMjj6dv6wwI23iPNBX6Nr3TYUyW+/vfSaQLrz7qYzz+jU5/R1IPtqD5Cqe4oPpE55PMx6hp492sRBlBxDhiCZQ0gtVVXFvhwLb3tH+ft9OC5BNp3qtMS3IkoEV4lIcvj2+N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddc1af1e5bso49782355ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749817546; x=1750422346;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LvDSGFbw1hWnK1aUUy6iH/sypksi8xkOQ0v79+tzujE=;
        b=dHieObRFQziiYRXbIGzw7CrbnD/EX9fNzsOgTCDOQfpMP12wFmSkbBy88NNinemCxg
         eHSmJ399FIGtOsjHw/nu3s8oFXj0Diy1ikx5T05HXQA1TGZQwyUda/sUGSy4p4Kf4+48
         SUpfbiQ4VvVIunlcwVNs96XiSlUhfXRTEhQiArHnD3v4u6qt7dP0gA1bLhRsm0rR4y0m
         i3D25pYTNqZg1DtV5hSaW/rI7gI+ofPThjyNh8xJO0oRPMjiw7En08BgwN9GJipEQ/Xd
         aB12V1PplWeDXCIjjJPHznSGswSu5jygqiAzM2oA+0rAUBQ5cRVqdckLNI/tpzyCK/MD
         NbVw==
X-Gm-Message-State: AOJu0YzL7jO5QGC4T3Cvei1Ekp3fGZz4JR3N5sf3UW3ToDpA+ArjhB0U
	aBpwSP5VzNH2+2ITkAb0sk2cXGv+zQhXVJvqAbSadrbMCSM4fjH+XfiXj//j+UCihiHAuJwyTv6
	MkAwr/zoVsAYcXf0jkg5cKb7957cj5cUXWRoQONCCbdvp97g2a+/g9Alkq2E=
X-Google-Smtp-Source: AGHT+IFmgD4Jt61qeahAbS/7tcKCstXoHZG12eYoPtYndkqdEvFTO3MlD9iGgvYR+dILwlEQvksvOb1aa8MKFk6TSGUL0u+SBLN4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:380c:b0:3dc:7f17:72cd with SMTP id
 e9e14a558f8ab-3de00bc79ccmr29029745ab.19.1749817534554; Fri, 13 Jun 2025
 05:25:34 -0700 (PDT)
Date: Fri, 13 Jun 2025 05:25:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684c18be.a00a0220.279073.000e.GAE@google.com>
Subject: [syzbot] Monthly mm report (Jun 2025)
From: syzbot <syzbot+list63b7b5628c37496c0217@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello mm maintainers/developers,

This is a 31-day syzbot report for the mm subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/mm

During the period, 5 new issues were detected and 1 were fixed.
In total, 127 issues are still open and 295 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  7405    Yes   WARNING in ext4_dirty_folio
                   https://syzkaller.appspot.com/bug?extid=ecab51a4a5b9f26eeaa1
<2>  3682    Yes   INFO: rcu detected stall in worker_thread (9)
                   https://syzkaller.appspot.com/bug?extid=225bfad78b079744fd5e
<3>  3640    Yes   INFO: task hung in page_cache_ra_unbounded (2)
                   https://syzkaller.appspot.com/bug?extid=265e1cae90f8fa08f14d
<4>  2823    Yes   possible deadlock in filemap_fault
                   https://syzkaller.appspot.com/bug?extid=7736960b837908f3a81d
<5>  2396    Yes   WARNING in vms_complete_munmap_vmas
                   https://syzkaller.appspot.com/bug?extid=38c3a8b50658644abaca
<6>  2362    Yes   BUG: Bad rss-counter state (5)
                   https://syzkaller.appspot.com/bug?extid=f2bbbb592debc978d46d
<7>  2276    Yes   possible deadlock in gup_fast_fallback
                   https://syzkaller.appspot.com/bug?extid=63ba90b81c16b86379bd
<8>  1795    Yes   WARNING in kunmap_local_indexed
                   https://syzkaller.appspot.com/bug?extid=691cb37358791bebebe6
<9>  565     No    KCSAN: data-race in __filemap_remove_folio / folio_mapping (2)
                   https://syzkaller.appspot.com/bug?extid=606f94dfeaaa45124c90
<10> 559     Yes   INFO: task hung in _vm_unmap_aliases (3)
                   https://syzkaller.appspot.com/bug?extid=fe8f8efd070d727de971

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
