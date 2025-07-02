Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3401C27702E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462104; cv=none; b=cKdE383EKRr0eS8Mk42LNw7GRJQEFKqzlJSr8XOxIcTzG94uDQS6+X3KGeGQnKH1XgnkMlfNhxTE1xBDJofRo9fMdtjsGOJTsCrEvDjHL9DovOQKb/BllPFIHo3aU/dbYS4Rh2zT7ufqKUxuxf8S+T2lIJLqEKxUIQ8we16CB68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462104; c=relaxed/simple;
	bh=cO/u941cFTD834/pPNlhaitVojacxqoG/WhtU8VLVSo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Ue4bZsMZlBsy63r8BH2mWNkQTm18IDgEyPArF9l3FcqyJsofEgF5CyWlXUCgVh+rDStM4WWyMOqI7QzA/Pjma1dYc7DGLj6yCxW/XSGUjf0xToZoQuzU6LIXcv9C6xVoiBfaVScSghYherk4a8MJ2fdsIH6gAqgKDhd3j4IU7To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86a5def8869so690932539f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 06:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462102; x=1752066902;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U7EcMtxyZNzWcr9NUXqe3dkFzNP2Zlj6V0/LIGgpZpw=;
        b=Tnq0lVpffwPKcTcDdqoEJhRLdc5c6ZDiwmPmaSjdupvYnDjqKUhb5TJ/IuoDIN27Kt
         pJmNG+1RcZwS3nIt9sjjXCauMeSPcvQtICkdnfue6dMyFwa/ELcWw8wP6tzgJMagkJTj
         kD3NBD4Fx6vsArE6FErZEvUTnWnsPCGZVS3q44yvENPk8nOK02J6wbKPy2H45v+bOD6+
         w3Qq/SX+HlDy0mKftzgYsWTEbI+z8FaSU+AsPAd2YENoharZbhEitEIF67UXTRsITthF
         ak+rcvPE7V8yfZtSX74j+28M0soLtWkmDo7ED/sOKLm6Gha/rmUBg8YGeLWs6gT6uqhv
         oh7g==
X-Forwarded-Encrypted: i=1; AJvYcCWiJNAgRTIcnz8qV9HufMLtoch6QLViYVAJHSQ1UQ/TDmyglGoHRtIPkMXR/2zOLcRFcXjCqGivEIIDLRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW0+dsVKkXRSpqdPxqq/lFLZkf2/G30s1PDqkBOObgBZY3V7AB
	87xs2l3ErlM9KVT59IFPBIT5tGuzfk0jUcY1yVKUCNs46K5xyWe94CCTUUkdLtA2SH9w10iItgM
	jMDeWR5DEu+JOz0/N1624CcxCHfGJoW2Es/n0ldo+58M1hjgOrGgUjnNpTyk=
X-Google-Smtp-Source: AGHT+IENjIsrSASw7lufMZqC9xSU9MBket5M5RqyY7p/3uwESqMK/fl1X+l4Ysax/F7imCfl3dEppwwhfCBdKv58RGesKV7/CD7K
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:691b:b0:864:a228:92b4 with SMTP id
 ca18e2360f4ac-876c6a31998mr325065239f.7.1751462102245; Wed, 02 Jul 2025
 06:15:02 -0700 (PDT)
Date: Wed, 02 Jul 2025 06:15:02 -0700
In-Reply-To: <20250702115321.230757-1-aha310510@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686530d6.a70a0220.3b7e22.243d.GAE@google.com>
Subject: Re: [syzbot] [fs?] BUG: sleeping function called from invalid context
 in procfs_procmap_ioctl
From: syzbot <syzbot+6246a83e7bd9f8a3e239@syzkaller.appspotmail.com>
To: aha310510@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+6246a83e7bd9f8a3e239@syzkaller.appspotmail.com
Tested-by: syzbot+6246a83e7bd9f8a3e239@syzkaller.appspotmail.com

Tested on:

commit:         50c8770a Add linux-next specific files for 20250702
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=103753d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=76d012e863976d4c
dashboard link: https://syzkaller.appspot.com/bug?extid=6246a83e7bd9f8a3e239
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14bed770580000

Note: testing is done by a robot and is best-effort only.
