Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E69118787F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 04:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743136986; cv=none; b=sLZifcHruNj4a40fb8kOMgurRUgeFkJIUigL1JdqAWpYYnac6hdgVvA3LcCMbF8O5DV26dYF3V0rYsGFXP17s/VEWPA2npXMM3HnzuvfQKto7t3HtfU2s1KPP81MFaXR6dqc51oXJDVYPx/aHvUzKdmm9ruMoF2uKZUpVFxAjg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743136986; c=relaxed/simple;
	bh=js7lVUj/SeoCBiYflPxyZS1OX5HQtjm0DSuCarpQVOk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=FOpGK+27XCgVtSFvNm3ORw9TDKIr91hgs07tuYcLxhZSXCdl9kpfW57tnylrBnMAaoJoRu90RgbAICmgAsj1IHwVl9v2fLboHWsnVoPnpfgyU1GVfXX+yTMKQjuzEOc6S2sev0aB72T0PichaZbcHOBsLJGUN5Ly7ncndo6FaBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85b418faf73so386963739f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743136984; x=1743741784;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5uDB2tY1hUjqwKYCX0GkGa9GQ8Dhnk/SPYhijdcB1Zw=;
        b=LnQYiVhl+jj41hYj507+1Gp7QFlaH8Mxq7Vi0zb9JTyBcV//daebjUM3HO1dSYiEnI
         fIAatv/fpPGUeCV0LKeXgzoMnicSDWXTlQtmsVlOgcdYXNf+LJnLEVsg09AYL6TbGYl6
         p9VdbNONgoT3ET92K+FiOMuviN45vUuTA48E3P1laPDhDFT44RTMuYf6oNV9fKo5K25J
         +IpdrNFeYzx1GEwVEJREjcNqYNcdaKpwi9j+m3FDaDVmDUTCK3kkDAsNVH1Ulu2UycC+
         oIryQUdqFJ1eMy0VE6lmbdXl6Uss0anfxQyXpDri5q2mdfEn0ff7IlKRyICqiBsGwgfL
         qABQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQFKfLGdj5QejBvTOjrl6ADi1ZHJ7ynF92m0eOeOaSUwr0j4PpadVx+X9RWpmAiLNeptq7Q0b9pZMPFGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZJFX8mr46u36WsUdYwKZGY72YBdnL/7PjUf4/SvX7GzoKCy3Q
	chVRhTmVaq3cVPkZ+amXwv2TAvGUH5DPx3euzIvpzP0S9AXa9fGOvccodmkE7mCxgrEOeYf96N3
	PRjzK3DXhG6zAoDnBOUYtzxbw//FbXAJTJM2bYvypxihLejwcgKsezkU=
X-Google-Smtp-Source: AGHT+IGWgZFryTvbQEfzj3JsavMzFoFExpg1aIjajV07MaP4R+0EXVOn6LPyfYjxRCyNxZA4kryrJUyJ/SpS825l7GjAM0x5LOEH
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:174e:b0:3d3:f040:5878 with SMTP id
 e9e14a558f8ab-3d5cce2c7c9mr76000105ab.21.1743136984504; Thu, 27 Mar 2025
 21:43:04 -0700 (PDT)
Date: Thu, 27 Mar 2025 21:43:04 -0700
In-Reply-To: <49c26b3c-cab9-4ee6-919d-c734f4de6028@amd.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e628d8.050a0220.2f068f.0057.GAE@google.com>
Subject: Re: [syzbot] [netfs?] INFO: task hung in netfs_unbuffered_write_iter
From: syzbot <syzbot+62262fdc0e01d99573fc@syzkaller.appspotmail.com>
To: asmadeus@codewreck.org, brauner@kernel.org, dhowells@redhat.com, 
	ericvh@kernel.org, jack@suse.cz, jlayton@kernel.org, kprateek.nayak@amd.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux_oss@crudebyte.com, lucho@ionkov.net, mjguzik@gmail.com, 
	netfs@lists.linux.dev, oleg@redhat.com, swapnil.sapkal@amd.com, 
	syzkaller-bugs@googlegroups.com, v9fs@lists.linux.dev, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+62262fdc0e01d99573fc@syzkaller.appspotmail.com
Tested-by: syzbot+62262fdc0e01d99573fc@syzkaller.appspotmail.com

Tested on:

commit:         aaec5a95 pipe_read: don't wake up the writer if the pi..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1285fa4c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8d5a2956e94d7972
dashboard link: https://syzkaller.appspot.com/bug?extid=62262fdc0e01d99573fc
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=121eede4580000

Note: testing is done by a robot and is best-effort only.
