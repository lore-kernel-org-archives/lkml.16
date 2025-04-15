Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8113E28BA98
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744720250; cv=none; b=OtnrlmHyanf6yWlTgSBpBahj+uRFpkjx9+/r0UrTTg3cvZwL+yLDPCZ8SEy/AboeuMROtBRQfHU3ekCi+W80IxD3+YYqkROaxKiyW+YF5+MQKEoX/u07RmHHHLLFXjaFMhiqjmvgtU61KEe/XdZdzYVlDf1nnChjf5anEK/K+OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744720250; c=relaxed/simple;
	bh=6uf+lSiZ+Yfto8XskdaEJ9jaP8gpkSvOPEHPOkat6R8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qKUyA4QOv21CVXC81qnrUnDJaSb8BAefZyDBs0IX/GW4/dNrfFvCmX7NMYhcfEuiRtWYlfdgQb9boPSNNE5FgNm/hjE8cQRalrIt+/e6kp3HFN439gOal5ylgxoHSi16hzkwCl7vom+5+TVuJD4XQMqcQZYOmwqfkQ9QnerkmAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d43b460970so108005395ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 05:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744720247; x=1745325047;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U0rZkudasYd0OBH7sfqwqKD0duAxCP8Fc+OdYw6V3AI=;
        b=VM3NBRcQpl6bNqGj9geO9zi61F0xQHt6/+mfN4uvuNwdoT2oIjbv+PMBkY1VB+LYvM
         zceDP1B8ps8xDbcDat7Z93lPPAyNQvtPPopTjzQAgGszeoXRqXtqCxA7ioZlOA7JA67W
         ekw/DcP2Ce/hCP+LDIlW9GtQJonXTk2CUQUyZreQWv87L+s0mX05H/M1z2xg94UykMsj
         pZibr+H1HFsvVVTh9Eo9KZcD/UgTkxB3AbsMhHqNA0gIrfJnd4GWdLxYPA9dDg52nizF
         6cxReKnk2nyOa4OGmmRHRSOFDgfRdMhB/cPSjyNh3tbtnjaNrVg+5r+meImUYOtiLbGd
         F82w==
X-Gm-Message-State: AOJu0YwXvkJzYKcjfggaVVwmulGa1dg0vDzRWj+z6BNmzxLUeDg9vDs1
	9Y4LZHdy4FQVEI3TQl0STEuOPtqR5CucwORKJJzdi+TQnEzxkl4X74GWZuBxZ51EGPFvcodJ8Ox
	qZZy/LSg5EkUSX2LwIUXw52xnhilLh0S9tf1CWux+qb2BtihhOMj32qo=
X-Google-Smtp-Source: AGHT+IGY5aqMMgszef+CMbIdKKBIfCnuYyCwxf/TarFDq+U7NDN/9XGwFVAAxnVzTB1JYskW/nDRdkWIcdaJBWw4PWkrWBKBvCsV
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:194f:b0:3d4:6f37:3748 with SMTP id
 e9e14a558f8ab-3d7ec26b65amr147558795ab.16.1744720247613; Tue, 15 Apr 2025
 05:30:47 -0700 (PDT)
Date: Tue, 15 Apr 2025 05:30:47 -0700
In-Reply-To: <679fb3a5.050a0220.163cdc.0030.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fe5177.050a0220.186b78.0000.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [bcachefs] general protection fault in
 bioset_exit (2)
From: syzbot <syzbot+76f13f2acac84df26aae@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [bcachefs] general protection fault in bioset_exit (2)
Author: kent.overstreet@linux.dev

On Tue, Apr 15, 2025 at 03:07:02AM -0700, syzbot wrote:
> syzbot suspects this issue was fixed by commit:
> 
> commit 3a04334d6282d08fbdd6201e374db17d31927ba3
> Author: Alan Huang <mmpgouride@gmail.com>
> Date:   Fri Mar 7 16:58:27 2025 +0000
> 
>     bcachefs: Fix b->written overflow
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11c360cc580000
> start commit:   76544811c850 Merge tag 'drm-fixes-2025-02-28' of https://g..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=8de9cc84d5960254
> dashboard link: https://syzkaller.appspot.com/bug?extid=76f13f2acac84df26aae
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=159248b7980000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13152a97980000
> 
> If the result looks correct, please mark the issue as fixed by replying with:
> 
#syz fix: bcachefs: Fix b->written overflow
