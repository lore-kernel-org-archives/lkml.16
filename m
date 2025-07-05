Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E074148830
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 13:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751720763; cv=none; b=uYG7o0aT9MPtkZ14ZXGnl9FxtuDHSqA2r3zQaJ2703oKA6H6uaXAGHOOfkXAfFFYTssIYz/gp85YSaz5X130gk/QqrRIHBaD8bfnKsYgcGNVaUzFr7h5/zPHFVhKKS7gXHq4zSrtCc2BY/1EEhqFy7yeKJA9k0HEWiEyNZD/Vxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751720763; c=relaxed/simple;
	bh=F/zi+qoNp1igtiWRl9dzbK79TTCBnOEjTF+WECB9y60=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mQG5Kfb1LsM1mZH5YQ49aQ1s6KYYZRB/kzfiwXn2Uolv0BP57jv7FKQZfH6ioldOM20tP+or0oponx+yRdxNX234NJlS/QRsbGCUZ8ZeVsszv3+sntCzNzSrzDzbO77CR3TVlprYVCLAbzXZecCooyQ8LANvZJ2JqmH8tfqQQpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3e055be2288so14767205ab.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 06:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751720761; x=1752325561;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8kjxOvYKT8DN5sLSem5sYs9qnqzz3mqUfdY4PF7XdyU=;
        b=Ne95WSLXSfWoFpDGQq9tGQCbn+uLovspk4/BC/8iJwbZBFu/Ssss0koQrmmoT50g/9
         XZjEozAR1Z8/iSMDIMMD+r8jn77px0xuDVJK3kk1edoCBFxFm5h/XUCvnJ7lgVuyTyWI
         4GgSBx0b3NT+/tK2QZh+zHIMnjxKB7xCx1bcjmMMU2baT0GydG8REqxK19+2bKWf4kX9
         Tuj0ag/aIX6tJOodlmvHzaGW3TW6eYqX/MqL/bhXpYGvGpECf3JnFNdhchM8MmQpEeRa
         vR0/PmdktNeHwtMz1DHuZUUu7gPgM/LB2Et6dqkDjVDCoYDjIlzv7FQNYPiEB/6sIGId
         Fygw==
X-Forwarded-Encrypted: i=1; AJvYcCWkSjo8QlG/ne3iRg3FCifqnZC5P0szXn23cXlfxgFoT7TwaBqudISIORc1QIdq0XqD67EdTHymsHo7h0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuUypmNvMGhOZSqL3fvh+jOyQgVISTXSTwH+Us6CnA4nLFglnd
	vK+cG2ckNIXMo6rBmjuA9RluNhz9AUqs2nWybashm3dsZbNfFlYrhcBfFpJ7/Ruc5n1MxfRVbO8
	T6lzppT+166cuTFOkTstfImCV77Q44K9NSbBcgLMlfPKPHaffrKjV5UjwJs8=
X-Google-Smtp-Source: AGHT+IH/X5+qJ8O9dbUdWKi4epIO6O5E9jxkZwRqcUxBTE8GTUrIeQ32xDDNx5m9TPkPhrSfJ4W5C1PVpmeWD8/2idG8t4yOpH2b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:17cb:b0:3dc:7f3b:acb1 with SMTP id
 e9e14a558f8ab-3e136fbc32amr44158195ab.13.1751720761578; Sat, 05 Jul 2025
 06:06:01 -0700 (PDT)
Date: Sat, 05 Jul 2025 06:06:01 -0700
In-Reply-To: <20250705124712.2637-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68692339.a00a0220.c7b3.0038.GAE@google.com>
Subject: Re: [syzbot] [kernel?] UBSAN: shift-out-of-bounds in pcl726_attach
From: syzbot <syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com
Tested-by: syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com

Tested on:

commit:         a79a588f Merge tag 'pm-6.16-rc5' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11ba1c8c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5ba6cef8f153bfeb
dashboard link: https://syzkaller.appspot.com/bug?extid=5cd373521edd68bebcb3
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=136c2582580000

Note: testing is done by a robot and is best-effort only.
