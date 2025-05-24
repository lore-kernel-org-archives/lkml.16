Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26851991CB
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 10:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748081076; cv=none; b=GNbcPZsRfvqIv6xCvmMzMpWu5gVO2qRjGWkst5A84bHT1zOWKuq+1HZ0m9mDXo3ocU6ednyOGGUUs5T3XNaUqjUT0+QQLSZQX9BYe3oyeByHMwwZhK2wqzedCc0WlGyX0vVHNLzZNoeej3OtcfZwvAF6n19Ny/YW6TeBo/iVsFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748081076; c=relaxed/simple;
	bh=b1Uq1m/6fvr+jmGl93XzGvlmwruTnkA8n8VcvNy+mDo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=LVwk4dvEe6Ni0qToAlyi321G+ljo6YA1JOGVK+Z9lGLGJRqCj24ogI54oTasBK/xEw+k47EF8on27iW6AffLozH5GAu3egFuOZndY4h9YnBCAzwclMffxcJn9u5y7FE41vYTyIuzNGbQProVZkyK474Uoyx4jhrnTuin5D4dbnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-861d6e340e2so59439539f.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 03:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748081074; x=1748685874;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gaS3ynhDOu3Jf/8g2JUKVyz6qWFIrfoIhxFFX/+x46c=;
        b=uQfno6jjyegs/Z3FnnAZVe1a3+8Huk6ZM9wldwfHHozs8WcLR7iJlRnuu3YKSJDtCO
         RFY0MU9Zhzj6RW6Q5uk/t1wVoDUV9IQYmS/Mwq95imhtngqH+WIecHbHbfjP4blGXzeB
         VDcy2/UQkn2bZoGRllLJnp8m6Q1yKntNnEFchVdoX5Ncw/vfRK0ZAInsXZ0G54YXxwpH
         g1i5SJ1zhTcP3CrpeEzCklenq9qdKJvVZf6fv8PIhc6TqG1DNeDfMdxqP2d7UMhAlSN9
         EXmd9IcDMQbIcFPGcMDv3lScyYzG23Mjpcc+TFuULOJGG8wF78HhFG4IDdJcyXzmWzNz
         5yAw==
X-Forwarded-Encrypted: i=1; AJvYcCU/+kM+qxEoJ7EoJ9KS3x66uR5NYCoOJ+/8AcgTtkmkwJgpnieFaDRf4KePOaIIlOrAlQHXQpl5O7kRoRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQMIt2pir7q8nQPmnCuG1Hhw41z7m1TjAoJ58nIjSRAozYlD1B
	VTpZJbLEsQxr/vASBpLTWrh3ohamjN7E+W3/nyz0+HwWvVFyjhBxNTFBlUzb8lKEfS6T9kY54jb
	jOr7ENz40poo4W0PLtM7AxzOYcRLuD4dd5rjOp7pjFuOFvkxdRWMf9F6y0E4=
X-Google-Smtp-Source: AGHT+IH7RuOUEBJR2A0sEwtFKn5Dzt1rLOhsdXhUdRO2GGdIpwBX65i8bNWFlLio15FPIdFeIQmBA+8r7pDP0i906VblBPbTZhkk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3a09:b0:85a:eecd:37b with SMTP id
 ca18e2360f4ac-86cbb88d2a5mr227413239f.11.1748081074020; Sat, 24 May 2025
 03:04:34 -0700 (PDT)
Date: Sat, 24 May 2025 03:04:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683199b2.a70a0220.29d4a0.07f4.GAE@google.com>
Subject: [syzbot] Monthly ntfs3 report (May 2025)
From: syzbot <syzbot+list55b581808b23b36a03dc@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 2 new issues were detected and 0 were fixed.
In total, 41 issues are still open and 64 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  19612   Yes   kernel BUG in dnotify_free_mark
                   https://syzkaller.appspot.com/bug?extid=06cc05ddc896f12b7ec5
<2>  13795   Yes   KMSAN: uninit-value in longest_match_std (2)
                   https://syzkaller.appspot.com/bug?extid=08d8956768c96a2c52cf
<3>  5580    Yes   possible deadlock in run_unpack_ex
                   https://syzkaller.appspot.com/bug?extid=731b27ee9413ba859499
<4>  4703    Yes   KASAN: out-of-bounds Write in end_buffer_read_sync
                   https://syzkaller.appspot.com/bug?extid=3f7f291a3d327486073c
<5>  4153    Yes   possible deadlock in ntfs_fiemap
                   https://syzkaller.appspot.com/bug?extid=96cee7d33ca3f87eee86
<6>  2971    Yes   possible deadlock in ntfs_file_mmap
                   https://syzkaller.appspot.com/bug?extid=c1751b6739d83d70bb75
<7>  2537    Yes   possible deadlock in mark_as_free_ex (2)
                   https://syzkaller.appspot.com/bug?extid=8df514c431bd240c5644
<8>  2155    Yes   possible deadlock in ntfs_look_for_free_space
                   https://syzkaller.appspot.com/bug?extid=d27edf9f96ae85939222
<9>  2151    Yes   possible deadlock in attr_data_get_block (2)
                   https://syzkaller.appspot.com/bug?extid=262a71e9d2faf8747085
<10> 438     Yes   possible deadlock in ntfs_fallocate
                   https://syzkaller.appspot.com/bug?extid=adacb2b0c896bc427962

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
