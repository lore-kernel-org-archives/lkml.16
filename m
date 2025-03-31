Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6195F27726
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743410287; cv=none; b=PMYxULL8Q6OgqbZMLDDP5GGQvWNv+WMNAd5x+8zzGaQuZh4BCyjSDS78DzKYL85XQL1B0Iufz0J27EBVGHVbeTMQoaRN+U82VJ1xNd7aOnqTxuWdfv069iztC8T6PEbqzrbmA3xvJgbAv5bQY3RsH+Zn+bW+M5950ARAnZ1s2M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743410287; c=relaxed/simple;
	bh=AHpW6yU0VAXcUXJQH2up/YnOzXAT1bNJLZWd5fr4qfE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WJdp8q4muWxAVCU6T7lFyunhHB1e5bhreQNXzYPKpH3ZztBJabzuD5usn3qg6VtoT3/5/04SWtRF7yY8rgYLq3FBjdGhwt08Rw86mOJPcntHs8vd72ihkEQRI1kYd6afaT4VWwj8xo9O7xTksYcolCtRSobcfwkG2lnMVpb0vso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d5da4fd944so48688185ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 01:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743410285; x=1744015085;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N0XhSko76xS6dQwKlFvNn8gcZwIvFYVJaJFOWmgG6Uk=;
        b=DfblI9fQnT/BuBirRswLiGvUp4LO57hIakBGOjYJKlkOdoVm+6Rx7AwUmWIvo8SGLR
         9r8DGMlsT4cruS8LHj/Zz1FJHS6lgR1knXlTYo1ZEdDbUd6d3A1TCPNu/hoZRxxI4Jce
         w6aDPBXyHp8W72TyACTEhXjiJNtpkcAA+ps/rp0THyA9MKGWIMYQbp3NYBXzuZCjceVG
         r84rtxUHFHoVSQRiDnserOcGvFzTvjuqWUfNHbBvYLXIxZOP7HqpXGCDX4/XAi8qkPDJ
         I7gP8R+e93pfaOahG5o9jAGBUjHzskH/f/9535pWkBvKxZPzMhcEijgG0eT04P0J4eVy
         NrIw==
X-Forwarded-Encrypted: i=1; AJvYcCVWOQMqYGgovqOMSjXA2flQDvsoZgihGJQHa5D8xZO5ae+DCimZPo7OsQmpOzn3ec3XRIcS2qg4PT+kZ7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjUyu1VzQFoqE47UWpvfUgiTFRBV1yAV2LmLoJmmGQFy2G8RhP
	Po/tnnDV14yQNt0nMuwUCFPlzG30O6ySZnYbx+KJwI7uZOYMjokPc1s2oF5h9kUAzLVYGPyKQop
	+2n9uxZk0+mPv2y7rMswcTtfIE6KKWVJRVB4MhPVzsyUCMr/F0y1wBaY=
X-Google-Smtp-Source: AGHT+IFRG3llkE9n2azczEn0soV4LS4Any9aCQkZdRff7a4WzuZUPNjvO7/Xv7ywy67eNnJsy44xehqHoy4lXBXylBjy49Kb3uLa
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3386:b0:3d3:dd60:bc37 with SMTP id
 e9e14a558f8ab-3d5e0a045cemr92625735ab.22.1743410285527; Mon, 31 Mar 2025
 01:38:05 -0700 (PDT)
Date: Mon, 31 Mar 2025 01:38:05 -0700
In-Reply-To: <164841.1743408370@warthog.procyon.org.uk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ea546d.050a0220.1547ec.0124.GAE@google.com>
Subject: Re: [syzbot] [afs?] [ntfs3?] BUG: sleeping function called from
 invalid context in ovl_cache_entry_new
From: syzbot <syzbot+54e6c2176ba76c56217e@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, dhowells@redhat.com, 
	linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
	marc.dionne@auristor.com, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         4e82c870 Merge tag 'rust-6.15' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1045c404580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=56c806e1bbb36dee
dashboard link: https://syzkaller.appspot.com/bug?extid=54e6c2176ba76c56217e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1569c404580000

