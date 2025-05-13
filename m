Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408852BE7DD
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747152904; cv=none; b=p+RTe9TRjH0eVdq0ktOlwu/gMzUJonAfBM51a0lJzUVgz6iWXzMf8hF1WktLjIfD0VIaMJGMw2L+gbySLF3wrYzJcnb7sO2aPgVOYHM05a9MTOqNo9ByFDbEG2pOm2/wEaHbhyEAVXDSCKGvnQ9EsbaIxaKdBeimyHCy9bzBQCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747152904; c=relaxed/simple;
	bh=HKpPJXxjYuQqKPv3yWs9KuFjDcumekh/Ju6urfgl5vg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pzVGLsdi0z6sByhboxlgeTfq6KwwSR4yLYblyemsckmjxztGlNwZXUV0RMhYKrvP/O4l9/tGzgFTR0BGC3cmV0XLTMCxkOOBokeolYjuYlYiT8vfS42vt3eGNg0LsJW0+4A+8N8E3/boqte9jbnw8gzweHw4fYZb5IfPLysZxd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86465e3f1c6so663592539f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747152902; x=1747757702;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cTe00c1hyRHsKpLSvC9ga8m24ZFPh8xvwPrz92lnjcY=;
        b=FHYA1iyoVun+lISkXI2E/oEdyCAoq3Fl6QbkGYQjQhfDlbwIm9z48ffIYzbfyc/jnM
         FWSMLJs09Jzw2W+fd8kt0aqR6+DvAiFGdA4glvQQ8ChUdhJZeayg+hB07WwpG9PL0gGd
         jxcVFKWav3Jcr06n8FYVzktTC7NAILyHQx/WOrSCtg9yICJDcAqr4/5zWYx7s3hsdpAh
         Q/9TYbtuflukK3w52VWFPtVvrPOf47mUcvBe1PlZcJI60klphvt8dJ1Xs0cc0dHcn+Eo
         Je5rtBFSzSbWNKBXvnife4XFxAQGSpgijPI6pb6vvQN2y+o2XIAeEcGzPqoOPhg7WVD+
         FZMw==
X-Forwarded-Encrypted: i=1; AJvYcCUYYC1I2bE+TqtRBNG39kJQp+EnPrNsvSrrW35O16Uveb7s7rnKiDeqnD2UwjRbpjGxdQa3ggpUD1irEIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdDrghlvQyzyw0IKBPagAQNlGNxfI52xa4fcZVGDifwXart7S7
	9By5tCVnsljJ0Fx4Dt8Ckwq45qz/fjs5zJPWVriyuqjIwshhP0KyPEw8rVtRAT9JmB4wiRR973M
	oRX/Ze4O/MV30ViiQIJijFJWD+wxciul435GIjM0/JAckWy1XBYafLbI=
X-Google-Smtp-Source: AGHT+IE8LfMTg5FIn95j+7dtuIhT1njfrdxjsVnXFKXXpQV2HKiggVRMkKoIk355xKYHhv44FNsUa85Z7jfQ5UtInEyhsmWALdeR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3e94:b0:867:8bb:4d8 with SMTP id
 ca18e2360f4ac-86a0819f174mr21692439f.0.1747152902292; Tue, 13 May 2025
 09:15:02 -0700 (PDT)
Date: Tue, 13 May 2025 09:15:02 -0700
In-Reply-To: <tencent_7CCE5C7B1E6DB02E756D609404E99EEEE20A@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68237006.050a0220.f2294.09fe.GAE@google.com>
Subject: Re: [syzbot] [fs?] INFO: task hung in vfs_rename (2)
From: syzbot <syzbot+321477fad98ea6dd35b7@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+321477fad98ea6dd35b7@syzkaller.appspotmail.com
Tested-by: syzbot+321477fad98ea6dd35b7@syzkaller.appspotmail.com

Tested on:

commit:         e9565e23 Merge tag 'sched_ext-for-6.15-rc6-fixes' of g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1668ecd4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6d3b7b9473eaace7
dashboard link: https://syzkaller.appspot.com/bug?extid=321477fad98ea6dd35b7
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17544af4580000

Note: testing is done by a robot and is best-effort only.
