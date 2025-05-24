Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD0D15E5DC
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 10:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748081076; cv=none; b=fq1umIifBqzM9bWqiXzsUqZogYlSdARYeiskK/JoZVt2Llt6UNxhjewLBUtci/a2TR/3ZjbSvp5ciD6QscwDXaKHQews5JBe+4Gss8Jz3emf3xNU03oFvB8WYTPW5W2NOXhKAkJlZzw4NaMmMPfDcDGpN68vam+baNgBVeKTM4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748081076; c=relaxed/simple;
	bh=YE0dJS9svB9M9fzhw751Oe1ex9zoXYrkjUG0HzTjxy4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=BBWKEyzk1zPg3T+gqYvNpeM0TnoXIiP7F+H//YWe7rja9xRKlZsHh2HTi95RpsZ9tEbCDx+wD8P91SqKWySg4FyHrdBHe5P0u6Lja5cTqtjvoAt1i6aMvhuMtoZHHrgln3ktssnjM3mr37YeO/ji4oEwPG3UD/L09eFizczqdXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85b4ee2e69bso81903139f.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 03:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748081074; x=1748685874;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HAc0mmE9bReS8z2dxQkGtRCS8/DZ/DDGPklgKqkl3Sg=;
        b=KwFXOlx+L4uoxy2pb8cUa8KlyZkrvxEFN6SR1bphbOsPOas73ykPmkaOyKMszAg88K
         KDutNl9FJIAwZU6BhPxBNPFOPd3JGwhcHrRnla1cD84fMJ2+Bz0v+3lgZyFHAEo/ChNx
         Z6wZe/ECyqxrpNvnX/JkdL5TLuvbV5us/TZ6JzVw1MSXYjbRfvnX7joE0C5IOxkODflL
         AhwSTic8AWuxBrQKJf3YdOc77DjKvDhQY06jj+beJdJ5onzJeMGqqSyziFY/laU0d9rx
         0vcqzY4cAld30cA3k0kQz2otGx5Uv/FpjtolklPmL3Mj6J4ER4q3fDDiVVb6yhRg6ATi
         hJ5g==
X-Forwarded-Encrypted: i=1; AJvYcCUDiZTw/Z19cGPgnJOvGXCsREw+FGULVvnKqqg9+/4+Zu9+Y3bMiJ3JXsTX7HSQ2rierMWrizjxgKI8RuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0parhfmhuhuCH1LAVVCFTxyvFDf7mmO1wWKB+f8j/iCuqEbb4
	3yNFeCxF6RBOjHnzKSxB+9YezTs5hwBoT1xLU1uaxJJGVWY/vjK/9OHgl14o1bDO3s00HrDfsnf
	fx31LW4CMHNmxGOOTo6GhkWaqOqvH0OwQBItmrZiSxw8Gv3dUF3jnp4Y4sUc=
X-Google-Smtp-Source: AGHT+IGFrmrwXFnoxyWjlbSkg7VFBCvaU/Z80b5YHRvWkDjIevG6U1SAS7dH3++yT66xlRm1xhiAqAKwjEHtIosMpkWWA+h2OoSg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:721b:b0:864:740a:e81f with SMTP id
 ca18e2360f4ac-86cbb89ca1amr266965539f.11.1748081073775; Sat, 24 May 2025
 03:04:33 -0700 (PDT)
Date: Sat, 24 May 2025 03:04:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683199b1.a70a0220.29d4a0.07f3.GAE@google.com>
Subject: [syzbot] Monthly bcachefs report (May 2025)
From: syzbot <syzbot+list157635e1f38de63ed752@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello bcachefs maintainers/developers,

This is a 31-day syzbot report for the bcachefs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/bcachefs

During the period, 7 new issues were detected and 1 were fixed.
In total, 116 issues are still open and 179 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  30696   Yes   INFO: task hung in bch2_copygc_stop
                   https://syzkaller.appspot.com/bug?extid=c6fd966ebbdea1e8ff08
<2>  7781    Yes   INFO: task hung in __closure_sync
                   https://syzkaller.appspot.com/bug?extid=7bf808f7fe4a6549f36e
<3>  3839    Yes   WARNING in bch2_trans_srcu_unlock
                   https://syzkaller.appspot.com/bug?extid=1e515cab343dbe5aa38a
<4>  1342    Yes   INFO: task hung in __bch2_fs_stop
                   https://syzkaller.appspot.com/bug?extid=6d3e28b33490b3085412
<5>  1397    Yes   kernel BUG in bch2_btree_path_peek_slot
                   https://syzkaller.appspot.com/bug?extid=3ebaf90b49bd97e920ee
<6>  1218    Yes   INFO: task hung in bch2_journal_reclaim_thread (2)
                   https://syzkaller.appspot.com/bug?extid=820dc3b465c69f766a57
<7>  745     Yes   kernel BUG in bch2_quota_check_limit
                   https://syzkaller.appspot.com/bug?extid=8364d1e040a88ed5657d
<8>  646     Yes   INFO: task hung in btree_write_buffer_flush_seq
                   https://syzkaller.appspot.com/bug?extid=cf3d1015b55ff73dcdc8
<9>  422     Yes   WARNING in bch2_trans_put
                   https://syzkaller.appspot.com/bug?extid=291aef749c5cbb9ca2fd
<10> 326     Yes   WARNING in __bch2_truncate_folio
                   https://syzkaller.appspot.com/bug?extid=3d11e35eeafe176a6c5b

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
