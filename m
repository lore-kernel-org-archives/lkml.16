Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC7417C2
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 04:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743308466; cv=none; b=MD229Dz9+Dat5lmtWxuo1yLPtiSmviBLgw3+hPB3r5Aj/DhcFJLHPeeAlv3BCSH0HuqEwI6gzebNsCgzkKL3WIcRWKYIR36XkTKbODyGxqmIALyEN42QYMxrlWuNWuh/B/PCcIkdLXY02rN81yntvz5eYo9Zvs9nFRYweiqzKpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743308466; c=relaxed/simple;
	bh=Va0cpLcerPZsRgU8eOFMGG5R4e8H/gsGMlUuvT+TKCk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HQs2aa8u8umQ92uj2foMd4xHvSta0paxcS4yi7FZA+jNMBrs1I9Xg2COVfmqOe1vJ3axRayF74jic9rkDDY4I90jJae/b1LbH15h7mCI2FAXPzr7m+AtzYb3OjtFhP4/9lQezyY3CzFjsdM8VxuuGVj+WZWvnTJABXE5FFE3Ahw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85b5875e250so341101539f.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 21:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743308463; x=1743913263;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FrPLAvWurM1m404lkV1Nx0VSnH0EWTo0mVdCFonk5d8=;
        b=URyXxR5BIDi/kSrLPsHGKtMryGNCeu71gqQlC1/oP1sbWTHDLdHXbqDzk0I1vVqF1J
         npwZZhZTWOC+QgKpaDWQ2ZcLiJGkn4sgX3uaFB7cr6dewNOGYfzHSLeNLgPJ67TM7E9f
         nfVF9LpQI93Wzh2CgYNLtPEFmGiIq7dol4/A4VEx4hKue+F6QWw+80XV1QyL3MqIICCb
         12NIYbCnuSgPbStLuWdmS/EDicBp4XPBMdOGEtA7Yt54r6LF7cIauh2NIjkmMD9Hdx/Y
         ygu5hP2zgvkbwIcKr/K0jrU7SZqvKQw0KhIBqEW7CzoiZZzDz9FlqK5pUF9C2vBghGJw
         CNYg==
X-Forwarded-Encrypted: i=1; AJvYcCXyfxbjzMNZiiq5Quk4GomZW8lwymPrLC7FujnXloSG9yyC6J5c6QzqvHrbNOHU8wdbxWZGbUE6io6bLC8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz52rmSQV85fFDGjdjoYUXELXm8d/jJWWqXMf7mYqvxs/1kENMF
	bDQoZc6yzRqf5u/vEgNAXrJSLaSZSqV8fv/J0rC7Dy7fqGSIdpDTRpmY2nJqVytO6UOEFaJ6EJp
	ni9vrQ2bV17YyoEodX5BaGsOwO33Ye9I8/B34nY9Vy/XynHc+FcQjm/E=
X-Google-Smtp-Source: AGHT+IHO0XAtEuve8CPke3g2wjh/RWVL8Whz3fZjiLUSLskm2tYCSbguLb/skcNFSET8o8Jq4ajK+zijpMGObmIWpfi42yJRXX/W
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2207:b0:3d3:fbae:3978 with SMTP id
 e9e14a558f8ab-3d5e0912f9bmr42627905ab.9.1743308463635; Sat, 29 Mar 2025
 21:21:03 -0700 (PDT)
Date: Sat, 29 Mar 2025 21:21:03 -0700
In-Reply-To: <Z-jCVfGaNHmLVN2i@bombadil.infradead.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e8c6af.050a0220.1547ec.0089.GAE@google.com>
Subject: Re: [syzbot] [mm?] [fs?] BUG: sleeping function called from invalid
 context in folio_mc_copy
From: syzbot <syzbot+f3c6fda1297c748a7076@syzkaller.appspotmail.com>
To: da.gomez@samsung.com, dave@stgolabs.net, linux-kernel@vger.kernel.org, 
	mcgrof@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         462c2cb1 mm/migrate: avoid atomic context on buffer_mi..
git tree:       https://github.com/linux-kdevops/linux.git 20250529-ext4-migration-fix
console output: https://syzkaller.appspot.com/x/log.txt?x=141e0404580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1b79fdf1dd3782cc
dashboard link: https://syzkaller.appspot.com/bug?extid=f3c6fda1297c748a7076
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
