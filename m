Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA07E284B40
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744286286; cv=none; b=SKkxAGlFtwzOxsc13SAoHKDRGpt6h/kZv438YQqDHS49BN/d5YzfTsj5sHpSkk1ofClPgGfPpDmw7UPI5oCSq65wusHAjgv2uBTXG+wJG7gViN9PXESxDPsLW5uM0/4GpkptQXPGSzT1b2it8GCF0JpgHhW5jSjVguhXHw5Xp8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744286286; c=relaxed/simple;
	bh=DpRip3gvlpgG8hN176PDmj8168+JN45TJIGo/SFJxJg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TA+UUzr/HVZHuznwQudaf0lF42oh9SpdE+k6Q2GBQKV136+0rEoI0Jqt/qai1A3k/V6I61IT2ZfG4b4N4Teb/jzEyGFGE2nMBhpPndi5idvBjYZtkkMd/HLUiMETdFF8yPqUGbwPKOxxaohwg33kUUxPFAOffrv/FU/ybgxvC7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d43b460962so15785425ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744286283; x=1744891083;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZniSmQ07FkLprDS7ZC6+TvSFkkLzvgBlGo7Lo/djZk=;
        b=o8AJnGYhD3MQY5EB1VcsfJyXOD4FAaHPW+yccFPWn9b4IQiTD7xmV2c3/sivAxyy5w
         Ef8pn1VET4HiUhTSyFIXk0U59sqx0UC6T5wkcJ8pjDqiIhN4OX8C9VxxIfmlx2ioPfBO
         xs1LAXOLWXYxRSl/28oTPxP+x+VyIDtB+t2rb5XGARNfVV3hvIFcw3e6/zwOSyGxJIlZ
         zaxQKAJc66pw7tIFPHi0JV1eMkG66RVqMSPNOjTqFhmhYpLmQKWn2oC8XoADRixW+Ldg
         /rWGq24P5ApaKpnaE5xiJRDy1TlH8ntM+zXOQCdYzrLxRatznBhwUw9eaXRce+MsCEH7
         r1+w==
X-Forwarded-Encrypted: i=1; AJvYcCXXgXt2oFLulBAQfzyh+5f2FYOBA7cJng7Twr1+8AU/197gWZNq6KsuNX1nL3fCVt4CHQvZZXmcfmfUxFY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxos8qpCSLnjCr8GOd9kBH3ICnGZNOAZE5mr8PLnzh05DsU1QhU
	1lVrr9UpRp+8s8MGoXXlqBQwt+9vJ6F5TIfdfuAqoaFwEQla8X6put8tkaoIIljQ4LOxvW2YHDj
	Sbsa8qLdUJPEaiPB4c2WRxPtUmM7F/R4+L4BFbz3aVe3qX4Uo7a2EbLk=
X-Google-Smtp-Source: AGHT+IG7HOf+HV/mfpYn5jG2v6bwLiZaOT2MqLvvouVvC0hm46XF+RlOx2dgPrZkhoPeFhJKTSesAwiOWsrkktjg+H26FyHn248C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a4c:b0:3d5:8923:faa5 with SMTP id
 e9e14a558f8ab-3d7e46fc93amr23744675ab.10.1744286283722; Thu, 10 Apr 2025
 04:58:03 -0700 (PDT)
Date: Thu, 10 Apr 2025 04:58:03 -0700
In-Reply-To: <20250410111546.3939-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f7b24b.050a0220.258fea.0037.GAE@google.com>
Subject: Re: [syzbot] [acpi?] KASAN: slab-use-after-free Read in software_node_notify_remove
From: syzbot <syzbot+2ff22910687ee0dfd48e@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         3b07108a Merge tag 'linux_kselftest-fixes-6.15-rc2' of..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12786c04580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eecd7902e39d7933
dashboard link: https://syzkaller.appspot.com/bug?extid=2ff22910687ee0dfd48e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12a337e4580000

