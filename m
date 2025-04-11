Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A2E221FDA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 17:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391169; cv=none; b=CUx8JnyRz6TPMmQB/jAtI4CFDFKi2YoMSgh1fyiDjYXC4fNANXEpI4D5ZKR4ia3+5TqprTCV+q/OSmqvi+2CIOZF1JlfjcaC5cQzc0MKoekOhxTZEzrehXZorLoK0n5DtDUPAf51aahFwexuJmRgabd7UhVE8q7OG1c9g7i0abs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391169; c=relaxed/simple;
	bh=fINXpZWLyb0M8y4RLoMLlTf+NC6oxDWOp6G4HE2YyC0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=aWMgugtdTBzW/UT0NUcVRGl8EmX6YTaY00o/KB19Lcny7ZfC6EhcBoNAFaO4txrCPf5WaCjTDpYIxAhhtMCyBdVCobEhLftJrg2cPnLK2IBkljfmxKLOrKd3n+xHP5JG0Kg2kjnhEOq9sL+MxBD98FYtygHg3IrSYLBF2WsJ9Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d5d6c997d2so21828475ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744391167; x=1744995967;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tDkd2xkO9DmzeJHD8IW67m+nmrFduYYu+jMcteSAmww=;
        b=ksuLamoZUjQNUyLE5catWG3Qlq+r6U2jkJ66FgmH99mVxxlyZPEJ0FLslvs9Xs2PSh
         SIeiFhhMz6mhJ6TxPiZAMd/OgGE0zJ5wZMJ3p2Gff4FiHXqfGYlG3O9d8yKGHP8n3f0Q
         pJPQtdM5SVtHEfEgISbkC3H5L3BbzcnTWqi18va9iZqdz/fN92ePcp9OaEgXEzYEUydf
         yaSCPd0KkFTlkoFTYjjB1uikjl0gfdPBUDQEJKKdUF0u4A9GT90XnWIf1WwqFq4ru7yu
         pxJvc7HZtRf6aIN5yImPTWLeQrFXmdxJ8wQwYhg38xI5ey1A8nw8UU0kdmHS64hTZMjG
         5kvA==
X-Gm-Message-State: AOJu0Yx6Fsf0NbBI79XYrqufMOUdSllmTNSNEHKJhePqfNVBfhn3UQw5
	4c9JG/vIwa2csmLiPZLEPj3u68I7rxDr3+Y7Q2p/JYw8KTkAbYwRCDaLrvqqYFL2yJ0Dm9r+bsR
	0wLwQnpxDszaNjkhDzkJqFB7Xe2ZhPVDw8nWYJID9xIXb6Rhwx++TCT8=
X-Google-Smtp-Source: AGHT+IFubsGiI8M39KW4/CkseSwaMxCXNG8WWIJfHm2tL7xuBMjlTv+eKtJiYeyXulv2fmEl/h6SgfRGUA4gVJgy46tT4GFetJe+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3b07:b0:3d1:a34b:4d01 with SMTP id
 e9e14a558f8ab-3d7ec202344mr40883735ab.8.1744391167328; Fri, 11 Apr 2025
 10:06:07 -0700 (PDT)
Date: Fri, 11 Apr 2025 10:06:07 -0700
In-Reply-To: <000000000000c80abd0616517df9@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f94bff.050a0220.378c5e.0001.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [bpf?] possible deadlock in queue_stack_map_push_elem
From: syzbot <syzbot+252bc5c744d0bba917e1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [bpf?] possible deadlock in queue_stack_map_push_elem
Author: memxor@gmail.com

#syz test: https://github.com/kkdwivedi/linux.git res-lock-next

On Thu, 10 Apr 2025 at 15:08, syzbot
<syzbot+252bc5c744d0bba917e1@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> unregister_netdevice: waiting for DEV to become free
>
> unregister_netdevice: waiting for batadv0 to become free. Usage count = 3
>
>
> Tested on:
>
> commit:         e403941b bpf: Convert ringbuf.c to rqspinlock
> git tree:       https://github.com/kkdwivedi/linux.git res-lock-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=1511f74c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ea2b297a0891c87e
> dashboard link: https://syzkaller.appspot.com/bug?extid=252bc5c744d0bba917e1
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
>
> Note: no patches were applied.
