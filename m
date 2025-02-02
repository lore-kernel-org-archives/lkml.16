Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE771DDBB
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 01:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738459925; cv=none; b=kktOXXPFT4HwY5PgHVbngicV5H+bik+tS2Avke3AWoYFhkDdN4jvzx/RGlJSFgd1acu+vciUpkLumK+Xc9u0ic301sM+bYIPjCeAq6JMtlEurJl7JSiodVRhdcjTzemK6la3v5VFcJrENbe8yhd4IpoJBh27kzux+1p8u4OX0KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738459925; c=relaxed/simple;
	bh=NakbOTgOTgWHHrNNgaALupm+OruX/ZDyvIKpahNN/YI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=XS5Pv7Vg6yATxe+/yBZcgHMBlxG+PuJ7oKKdtjZZI5fnnVohcGxFi5LyjAwqCy0ewkcgGn7RgiK33Uour/lSGW5rOZmdow3MAiCci9+FYbu+CpGkEahqMJ5uibUqGypZBy0vDmuZkfHrRSwMfHmeDRGMF16/jWdm6gfsOAmTqDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d00fe9f7b3so45884955ab.3
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 17:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738459923; x=1739064723;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kMUtJpnvYlXH3TXLSK83jm0ahrCHVYBp9xrr1/SbXhQ=;
        b=pAFxI/rTHD4Ycoakg2N+gU3DamvQ7suh+lDeLJDieE3i9zcA1IAJydhUdpAdP980kg
         eHOWkeH1vN+p/XsMqT8IoHH+sZAzqb1g/B7wGgBeYcvLah8B9kQN4DaUSIN4jz6DB/WD
         2Lcq6lNhHuTiKXGNeFva5Rnk0jQb+QyL9JAzMyFthBEuNJoPerc4UAqxZc/upi2OXWQ8
         r+S21K57KrJk8+RGuuvf19xWb4S7DL51O6RJ/EhHVtoe2tB4zmVTKmyvFaF8nf0P5Mcu
         47FzY642DhZUFpVACEM46u4CEJ8OWZcteOAiLzLgW4dl2uL5HixTWJbAXmJcHTuhq5Sr
         sDtA==
X-Forwarded-Encrypted: i=1; AJvYcCWxY+RYvqKVY2x+QkreR2AepQJTuxXS2L+7WjDNii8JFnazitm03TXudJzO5an/EtJO5ttRz/jDMUBFA/w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc/cFoK7hhcukqqPs72/19EdUZoun0hbjG2ZERbD+4sMl/2bfx
	A0eyZk7EX2Py7sQK4i8lGToxUwO9B+y8FOmZFGByLbULCHL6Y09p4rEqjh99d9gasBhMV+AjvNZ
	eiEYS0dPJ2bv5r51UUcD07RsP2L2JAGQonb9RBSQE5gErRJPzSeBaIRM=
X-Google-Smtp-Source: AGHT+IHEyOYLATydpKx1Lo6KwOa0ZP7SJ/Oulbdrlz4Ty5p3Lnx6qlZ9nJeTZNjkIO/A7ci14v5taBcX4eLuTTEJ+BZUCiHFAJ6i
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4510:b0:3d0:237e:c29c with SMTP id
 e9e14a558f8ab-3d0237ec3c2mr30666515ab.12.1738459923013; Sat, 01 Feb 2025
 17:32:03 -0800 (PST)
Date: Sat, 01 Feb 2025 17:32:02 -0800
In-Reply-To: <tencent_AC7F66D9D37DE360897DA3A2445937625705@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679ecb12.050a0220.d7c5a.0066.GAE@google.com>
Subject: Re: [syzbot] [mtd?] WARNING in release_mtd_partition
From: syzbot <syzbot+074732af3fc6c528f8a0@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+074732af3fc6c528f8a0@syzkaller.appspotmail.com
Tested-by: syzbot+074732af3fc6c528f8a0@syzkaller.appspotmail.com

Tested on:

commit:         a86bf228 Merge tag 'pull-misc' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14bfcb24580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=714e7008e8c086ea
dashboard link: https://syzkaller.appspot.com/bug?extid=074732af3fc6c528f8a0
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=115cd5f8580000

Note: testing is done by a robot and is best-effort only.
