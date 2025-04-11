Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0623218AA3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 17:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391157; cv=none; b=f3J6a9Q0QtIaUb0RlC6tQJuCc7NxHdtFLBzkU4ZNLvINvtjM6lTaU1KeTg+jOLAzNcrRPef1zwNFocYyvV6YECtrFlQIfDxHRDJz4KQkNl02dGyHmpwtaJe2I/aqKSEQi9K7A3khe6MEa52+EMDDCs+7k5U73QE4kqqE4W+9QlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391157; c=relaxed/simple;
	bh=u3y4G26E+Uojz4XDOISghiFa+oI2cwEsCr3xDxBKBtk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=r2ibArtm9qU/ETVdwqjvW+CvTJRRIMJvdae7m+Q7aNqcQUleZ15fUtK8lje0vkir87ISoFDbdQ5tNEQN8GMqvm1YmeF9N1ykjYTpQaKL0yjzG4H1TvnpJdm/V0XH8kFzqGxqT9E9A6fpVzATYcWkErcO5Bw8+bUq2NbJDzjlYUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d443811f04so21813615ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744391154; x=1744995954;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uck+fCiN90YiBBAUZ6LdgLSFOcl5PxWNU1pc3Pcoo2A=;
        b=oaoBmzzcsNfUyZ3jppIa29nbtQdLfhaLJIEPCYQhGBoOkjjRQ4JGidKvY4TYv8Yn/g
         AnFY/G1FkG5woTi4+ZDtbthg0m3XEUTHMBY0wCV5DalniC4Rjsmp9HzJpPspaTbGNQ2m
         OO6XSJkV6XXaspyK5rJgN7T4aEKmNs1stzMmq0XL6RqQEwgmGjEns35zL7pJyn3XKtco
         /X3NaueUVMJeayHIKeOB0v4IYhXyu7YHPAzt7pwdPtjYX2Esw7xNdfGm38R4Sw5XVUQx
         hebpxicKXKj9ZBHhJ3BPPtlzAwVrWIOX2UjIFEcOezpEprlUh5/gHFZ5qBZ9HqFdugam
         9Ukg==
X-Gm-Message-State: AOJu0YzdFr+dvUWYhC2uYkHRP4XKQQEC/FYj+3d8W/Gn8IwhTRbTUhvG
	0cad4msLFBsH275uZyoG+ay2sVdrLDNuK6D9MtJh8NhxHgaK/Y2fK8roeQJumKSXLyJqy+LjVp8
	4U7Hf3Jm2B/FtJsBCWXO6eWLsblf5O/7uBXPpMCU3AhFE36pQMfJAZw8=
X-Google-Smtp-Source: AGHT+IG1PTISSGrxj6Nso2569QsqxqXStiwdpxzgJQ4M79OA1Aa16rZYCptgiTF23r9hQSYscX/LGiZe9Nxt5IdBDFsbm4y8ejtq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1806:b0:3d6:cbed:32fa with SMTP id
 e9e14a558f8ab-3d7ec1dc6b3mr32479255ab.5.1744391154700; Fri, 11 Apr 2025
 10:05:54 -0700 (PDT)
Date: Fri, 11 Apr 2025 10:05:54 -0700
In-Reply-To: <0000000000004c3fc90615f37756@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f94bf2.050a0220.2c5fcf.0002.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [bpf?] possible deadlock in __queue_map_get
From: syzbot <syzbot+8bdfc2c53fb2b63e1871@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [bpf?] possible deadlock in __queue_map_get
Author: memxor@gmail.com

#syz test: https://github.com/kkdwivedi/linux.git res-lock-next

On Thu, 10 Apr 2025 at 15:22, syzbot
<syzbot+8bdfc2c53fb2b63e1871@syzkaller.appspotmail.com> wrote:
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
> console output: https://syzkaller.appspot.com/x/log.txt?x=1524f23f980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ea2b297a0891c87e
> dashboard link: https://syzkaller.appspot.com/bug?extid=8bdfc2c53fb2b63e1871
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
>
> Note: no patches were applied.
