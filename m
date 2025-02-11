Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A391F190E
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279645; cv=none; b=Supe4uBj5ir+89CzIVmO9qnZoDXCA7ffwC+MANgnE6A9smygargDYXkxU5F1chRR4W2ZdNyzNoevoKV9EemU3md8UHoAg4SkRPZFRPizJkdfjsFnemSoWOzYS8Am6HThc+CfuUippIjUYL4SPR/F1hqXbZU90EXaEvpFaX7YRkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279645; c=relaxed/simple;
	bh=LtwiloNqKOXKVH0ZbSrfNjPBDMiwCRWWOUBiukedYcc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=M4+jSjzA7jhRlFIZwlBTxfP4r1UgoyGnpT39bkVV+em3bX+19ihicQJLdeK395fKtvI92rYrfT9knVIgr+4j7dX7D78g2hnt2aOkSj0KTUQUIwUZWju+bYlD9PNPakaKqBgrdTKiYBYjIYPnRbzbIrA24gk3o+8r2wfizqO8bWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ce843b51c3so116696765ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 05:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739279643; x=1739884443;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O+/hjFbIbDZDUYX/OfL0lWGNCNhr1qzEp6Ype0nGE1g=;
        b=nXKykiQYtCGnylGCKORNrMHPMy9vrOPP42GskyehywKoi0MhvWueKsbZZAXU1hRTjt
         kJXhs3NcA9R1s5MERVfen0RLN/inDdz53x5GjiKHHXtV/neLtiSv4JBxlZJiaQs02Lr1
         /TSkU/UrwrOL/1og+GzwZ5DK4jc9Yx4ZfVWDb6j8W7jZcWT+cswJmLDz6w1xEcJu3TNm
         Rjr76yvcKltdrY4ZXebGeAlqa1vMhEaYMibBnPGI1F6DdonLZoiAqdlqzAyPwRTAB01u
         VpiGelY73TQqaMEHuhQEhRv3PY05o0GjCZldMcXOzTOgWqBNPFTNfk91sfFfMYbzszQq
         /6wQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4Ac4iUlAtQ4v5VjAscA5fWeYhGw8fBMTeZN++Kx/iCFZvxjKW+9slncdjBm3vxrM6nunphLNIRakuxTs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6pGUeAkNf3oorhsmcW2M1x9P3a4r090pMeNg1wrjgl0dFSOvT
	+iSY+4wwcehCg3V5FAkMt/cKKbR0BXhwk1gtyVwZBYuaiaSxpXrxogOnCcE3ShAckDGFsKf1f2A
	nDX4M2YPVvkrEzxytoUTJMiT8dESCtkWajxAZQ1a+cgCBwRAH1PVUuVw=
X-Google-Smtp-Source: AGHT+IGAe6MaJHPV8anOOeIw8oHt1JE2+5WbmLcaINK+9XLwc/8FkldtSJMIPqZUy9e98TQbFhKfNf73jVTvbWU+s8JcxSpUuL0E
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c263:0:b0:3cf:f88b:b51a with SMTP id
 e9e14a558f8ab-3d13dcfce6cmr137737045ab.2.1739279643323; Tue, 11 Feb 2025
 05:14:03 -0800 (PST)
Date: Tue, 11 Feb 2025 05:14:03 -0800
In-Reply-To: <675cd64e.050a0220.37aaf.00bb.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ab4d1b.050a0220.3d72c.0062.GAE@google.com>
Subject: Re: [syzbot] [f2fs?] kernel BUG in new_curseg (2)
From: syzbot <syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com>
To: chao@kernel.org, hanqi@vivo.com, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 84b5bb8bf0f6a78c232a20c2eecdbb8112ac2703
Author: Qi Han <hanqi@vivo.com>
Date:   Fri Oct 25 09:18:23 2024 +0000

    f2fs: modify f2fs_is_checkpoint_ready logic to allow more data to be written with the CP disable

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11d1f1b0580000
start commit:   a64dcfb451e2 Linux 6.14-rc2
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13d1f1b0580000
console output: https://syzkaller.appspot.com/x/log.txt?x=15d1f1b0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4b1ef007dfb9422f
dashboard link: https://syzkaller.appspot.com/bug?extid=15669ec8c35ddf6c3d43
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=166931b0580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12be72a4580000

Reported-by: syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com
Fixes: 84b5bb8bf0f6 ("f2fs: modify f2fs_is_checkpoint_ready logic to allow more data to be written with the CP disable")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
