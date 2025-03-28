Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBEE1E04AD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 18:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743187445; cv=none; b=uWg+5R10z1WKAmeD+e3YrqC/8vyhXGAKZGygwK5znRocQ55s0i/8IRCAH8603G6pO3vD5VGA7dQbncYKxKpVfmugUfiJVv5eH7H2HFXQ+0JemSldqC3itgLNDYJGZw81usi7JevN0ikLvWqvQiF0OMmRFs8eHTDQw3KfXDx+n7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743187445; c=relaxed/simple;
	bh=SPecG2wm/IQkCzIGqgAZ0mzsyrh+xZVxCElSIKvubL4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EwMhFZI7i4H04NJ2w14shJHs8qB+WDu33vUTK5T3O55IijGNhm/tF+lX7hDLFZxlTk7i5yzcr3tz5nUClfuxMWM9SK2H0sVFutfGzZ1LuTaucvTTb3DTa9KC6p8zoeOkdX5C6giu/9HtOMjosi6r5Tu9wPFcIy+WiDKo7nKxLPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ce3bbb2b9dso29295145ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743187443; x=1743792243;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g90s5dJ2ezUv0GG4ZLhmkiZnYoiDPKfC/SO52fRsdOI=;
        b=VazGue0aqOqCp8uGrjszfiRi18W4TUSOLiFxFodC/YvNNgLxibFpF90Qvmol7qjS/t
         e41qiL23BTVytsMob9me0BKkLMBIVkjYmBkhTtxgWIpKWJ67gA10r1BLMfVluvVxlieq
         wYVo7cHXVcmxbwSpZCIgOT+FH1j4c+duAr+OS4CF8kxQJpGvDGzAOphAXcR63aO/Vf1Q
         BlBPhkAN7zV0f/2DsIGlJP7HBVHLJJDsaSx4+zhrnNsCImyC4BRE+Quw6wZo0sAmuIO1
         lnotnw5co8+O70I6YcBLRLlP/IX4x8fXXrd+punfWKlSfv+grtfgeyrzTH1x94vRnUWA
         4JQA==
X-Forwarded-Encrypted: i=1; AJvYcCXR0H4U2fNJzXqwbcdkaP8go0GuIkmVqNiujYOdhRY1NHozIGdCQ+nqVrSd7aIky4b+7Fl2x/gF2wrzKdk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Cn1eS/E9xT1QGDkd1m1gshgxyF64fCmVLSjKBdPR7rwMB2yh
	XMwfCun8+bneJXdaFO+iA20tVRSZx1KgRIsua6NARgObFXpaEcjwRCLASUwKtDBJ6hpOGvthw35
	qvzNc4mpdAD2pO0sqZV0VkzJcomXmCQt6KfPgqgAObEENLzoWi+J7oUk=
X-Google-Smtp-Source: AGHT+IFoCoAM7/Lk0qcdsfAroXF0YLd4ElkidSn67MaROgoMFIwZfHRztGnsixG0Ujvg5uJ9HvohZsxiNtg+jm1cnjPcDCASg0Tz
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:164b:b0:3d4:3a45:d889 with SMTP id
 e9e14a558f8ab-3d5e09cdb6amr5254815ab.14.1743187442778; Fri, 28 Mar 2025
 11:44:02 -0700 (PDT)
Date: Fri, 28 Mar 2025 11:44:02 -0700
In-Reply-To: <86991.1743185694@warthog.procyon.org.uk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e6edf2.050a0220.2f20fe.0002.GAE@google.com>
Subject: Re: [syzbot] [netfs?] INFO: task hung in netfs_unbuffered_write_iter
From: syzbot <syzbot+62262fdc0e01d99573fc@syzkaller.appspotmail.com>
To: brauner@kernel.org, dhowells@redhat.com, jack@suse.cz, jlayton@kernel.org, 
	kprateek.nayak@amd.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mjguzik@gmail.com, netfs@lists.linux.dev, 
	oleg@redhat.com, swapnil.sapkal@amd.com, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         c7fffb8c netfs: Fix wait/wake to be consistent about t..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=15722a4c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=95c3bbe7ce8436a7
dashboard link: https://syzkaller.appspot.com/bug?extid=62262fdc0e01d99573fc
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
