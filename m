Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD1C221FD2
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 11:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749037926; cv=none; b=fGxhqrChpVFQhC3u7YE19mREYYZXoXgU7Tg2OiT2guP6bqUuyyk0jcoz8qu9jsYqSXzqqusGvFBF8UUxmlUB4a2s9ekt3K8j7J1C9aoMvrMV9/I8oMCg9m7lbf11BPp0U/ajF7zJDB/u/1bKAjL0+VQ5Wr879dzX9nhD1ZsgbeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749037926; c=relaxed/simple;
	bh=ucaxpTfhki9xe5KaqJ1uJvOYxJGMYvSNnfGlyjDEFeI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZmJwiaiNaWlyNYoFKcg3LypxNEaqfkPA/6refkbT5/tTVfNvkCxmBEBA/OyaMwqf5VDadHFHwlwUPX0d6tl1yin7RwklCN22bQwi4W/EbHY0x4RCRY25oh8b4sAp8+DGEezESamRh4CJ8iSKjiJmIcG15a0BbWH5JJvW8twUX/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddc1af1e5bso8246245ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 04:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749037923; x=1749642723;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYNeylFd+Wd9wnCJ8dYejfviKEpOERMeuHn0zm+K+kg=;
        b=GjxYC9bpJKTaUCWxDuBuO/UIAOZRqjvSwEU5DQ6S0dz/RS4xTA/fcphP6RZ8AZ1L6r
         J0XoMmvwT873qVbNqvvZ4GQL+YQLjwUar7FV1KX0DwLELasKO2e+QuVqthzafwyQd7cQ
         lEGTcA/xB2XPTWHv/dW3wth6tYnJilu099TciIQC0qd7S7wqm1ZwnsN/1FHItxqX2jLX
         adnTgHEXeVBuBgGIsxiSGUi4YOE9bYOZCCihXbCLnWkyXO4H5k5sv60IMmXidp5DAbAC
         uriUyemUwv4m3HnI8LHZV8iY7BWIeTruKICCTEb9PQonoerUeUYMZWkcx3aqiUZcyIG2
         Eejw==
X-Forwarded-Encrypted: i=1; AJvYcCWWj06GK0cblG0dkNJJZUvfGgk9pREY8Tpf+Pkb0MYcpqdf5lUtkeLmQJy2COmSOJDaaSWX1Y8Ze9vYh1I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/+fDz9beXZ/1NTYAcvLbolQ77+ELq0NDlXuM/oRbqCy59qaMA
	7m20q5kWM82iA627qI6QS2cUPTz6tI1ItQpDmxeqZS9vHPWlPw/OF/hi2xIk/e9fxcJLgpq82j/
	z30jC2qbl9eevQ64EX19U/1K2nnaYxGuYhCalEedXVLgXmhwmTY/IzAf//Og=
X-Google-Smtp-Source: AGHT+IHaPThA9cKn4GyiJP/w3G4JQGITHzNmy5URcA8wMh53KvQ/Goo8sDp7ZHuT9i3BSO/KaMyV2LsGE5mvmAN9Kgtoj6WZwXxF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3086:b0:3da:71ea:91c2 with SMTP id
 e9e14a558f8ab-3ddbfcbc6admr24944905ab.22.1749037923627; Wed, 04 Jun 2025
 04:52:03 -0700 (PDT)
Date: Wed, 04 Jun 2025 04:52:03 -0700
In-Reply-To: <43284d2b-be67-41ca-877f-0fc580c20754@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68403363.a00a0220.d8eae.0089.GAE@google.com>
Subject: Re: [syzbot] [jfs?] kernel BUG in jfs_truncate_nolock
From: syzbot <syzbot+630f6d40b3ccabc8e96e@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+630f6d40b3ccabc8e96e@syzkaller.appspotmail.com
Tested-by: syzbot+630f6d40b3ccabc8e96e@syzkaller.appspotmail.com

Tested on:

commit:         5abc7438 Merge tag 'nfs-for-6.16-1' of git://git.linux..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16927c82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=82e79780b034d72f
dashboard link: https://syzkaller.appspot.com/bug?extid=630f6d40b3ccabc8e96e
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10cc780c580000

Note: testing is done by a robot and is best-effort only.
