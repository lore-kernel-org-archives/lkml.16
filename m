Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8701219DFB4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 22:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743807244; cv=none; b=h2/s6ubVjLZQmbi199a5Vq+GVIzD7gI9x+zy5lWVM/ew9XI/Pg2xQFbLD6EepHb/YTBq/Dfk8FCddD7lkGtMw5P7teKjGQuVw+vPsFRYtN5F92N8K9neXB+MNM+iiQc7uqYz+KqO1TibhdR7pDsT/6pcm+LNVEdPEL+dtADQpFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743807244; c=relaxed/simple;
	bh=CCboKF0E0pOUDrcALP+xPG44ezRrXKgwlgnWWox3uZE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=m4Wrq/5Nzjqu91sroR/SS07kWary1PZHEu8TAcejHq9n/nkpwzF3Bo0+9igh6zdvzWtxe3TNtS717ThdXVgejgarsc4zYySjWLS6Dmpirm2qzqpsqpVqDKWFBotnooGMTWKU+uzO4IWeTy79u/T5lkIiJcO/MebFeHBan75rb3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d5a9e7dd5aso29471655ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 15:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743807241; x=1744412041;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BEWRvuZ+p60fVNjWGYQzVIHkSUDv98jwFOKe49syq3k=;
        b=kfELhECu/MUcebKiRVpb7NIPcW/KPRF/sGx12oYxJ8UFcdmBI2YexLCnB/zqtbHzM8
         JYsphabagmeLef1HfkxPfAmK8+UcFeNgJ2odiLlbMoPPpKTXFdAmW90E11YcfwxC+QOe
         azewY8O+1sKMTOUTTOMNiYw+fppNa+mnfZQH2RaA2p4Gv5ju8l2lYh51YMLOHqWEu14p
         cDszx9p8oWyIRb4Ur+AnfNrOWQWKb5Mpm0GdpIuTaSf8JtpCtlyrGgWSBJBzZ2DxcrnS
         T14h/K5uQ0c5ITM28K3XPWXsT5PjAjD2k577db/oMsygv9gi2bt5z7AZzySfOG9Hxz2t
         3SGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX7zr0MyiSh6F7WS7g4Sg7hlZrAC57R7GKYiLt5KTBSf+BGVgIIL/lxgIdkmv9+YspFdOQMXyR5dCBCvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPfNg4CZBL3XYbYbDtX1uRD0iobT7UVVQjCy9NTltuggCxGDXl
	lXeDdATiHSUiZaX/NWrKfKWZqd6uAqQ9FPuGggH0v7+VfxycY0i/JWEBrm/xJPwRdwoGIiakqmz
	0y3g8mBJevNHJVw3ilIThCQ7zvcfXj+u4ESZJ03Iq6VO4rymYklbXjp8=
X-Google-Smtp-Source: AGHT+IFamuhyyN733T8LzkJlkNQKtpHf+l7lPROYrZ0KNuXw9tziMkAnJXM1Gpc5xEhMYY6926lIrdIRyJt20mn2V2ws3WsU60Yr
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2198:b0:3d3:dcc4:a58e with SMTP id
 e9e14a558f8ab-3d6e531f3e2mr54965625ab.8.1743807241675; Fri, 04 Apr 2025
 15:54:01 -0700 (PDT)
Date: Fri, 04 Apr 2025 15:54:01 -0700
In-Reply-To: <7472b072-9c08-4e5a-8f16-8a56647ebc9a@kernel.dk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f06309.050a0220.0a13.0226.GAE@google.com>
Subject: Re: [syzbot] [io-uring?] INFO: task hung in io_wq_put_and_exit (4)
From: syzbot <syzbot+58928048fd1416f1457c@syzkaller.appspotmail.com>
To: asml.silence@gmail.com, axboe@kernel.dk, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         d1005530 io_uring/kbuf: conditional schedule on buffer..
git tree:       git://git.kernel.dk/linux.git io_uring-6.15
console output: https://syzkaller.appspot.com/x/log.txt?x=14566fb0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dcca8bc6e23acb2
dashboard link: https://syzkaller.appspot.com/bug?extid=58928048fd1416f1457c
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
