Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88DA1EB185
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739255704; cv=none; b=LgcXzylfPCbyc2CRzQpAIoKOskMZBCryjy3tSopvAeUnx+b5+9sBsVO0/HjGHQLZub2S/ydsN6lqlf+aPkE+DuBmWk+XgDbhKD+0W05XAtCML8McSU2nzByLoD+GzUU3CYyeJuLkQB9FTnMWXgawVjzXbM6aR37BTmwj5Iiv4a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739255704; c=relaxed/simple;
	bh=inMD7jCbIyhd+jhk09YmzHU9oHOoac4JxzNx0NqkTPw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=M5bWffho39NluxBqQ82d8hZv2vL1K9oK/shJL/tobHPwpLwm/Expgpi3WYV5V+bw3HVz2obeO/xQcvaIagSnqrbn7zHGIeqFa/eLpqgibQOK+jljQ71gVj4bGdZ3x6sRF4ogBmBfPwZZ1dKYzGu5CvEaG11zGOSaziTes8WAWOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3cfb20d74b5so42889975ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:35:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739255702; x=1739860502;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dnf+unHgvHTOrmxMwDXxzV/B0XTEiQ7sh1xCaruwTsc=;
        b=MU/lFzv/5Whtw4MFGHI8SscZSsL6BO5P2sgbIByFFzq1VQlqhzJ3LQYBPthRAED+Ih
         dLFdnC5zetCQyaNSM9YNe6WQEKk6R0xREvkugqQo9QhAKl+nB9jPWdd7FSQu8kp7Ysq+
         BtkUJMfa9GBRk0tCLMjC6PMp6L7hjA2IGq7ruOasMtxDvrJ1SmIAqlUjd7LRpDLFGuEU
         kuzVZrdlm7LzKnWDkxSxoqJY2jgxIm4qanDHB7Z9xDNvnPdqzfwxU+NwjJZGA3rUyc6O
         /1dKj58GRG5WsZP5/22VGkZcaVQd4oTC/Qmz23e574zNyXIKwKg0dq+Guj4WQpCN0MwG
         4P/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVU2qjDAFw3Um47n+Mywjy4VTuZR5ssrDxuIfGBYZn6p2Tfg9h9mQUds/FK8hDOzySWduquDOsl4GtkvS4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwotEE3YaHnqoMNgDwKROPL8T0UL2q4kCknMEFXH1BSTeIUamY6
	D36k9nL+6QadNZY/Ii+r/AayO2q9P7UHD7owJGlclH8fuBeHfnW3DVHIr10YqwcaN8niXTxwip4
	17II8naR75hj7AB3pLUuKSWDCHAcwC+hvB5RgV6up3p8w/RRx9zaiNpY=
X-Google-Smtp-Source: AGHT+IGhMpMslXeGt3lLc1bKjPLawiRW7Nr5XJfSjPoi5bXWQhfcePiwGkI8j4D9+XAfR17GTUtGVMBsAPUuBwhwa8MQ/zJKNdWo
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1909:b0:3d0:1abc:fe03 with SMTP id
 e9e14a558f8ab-3d13df2351bmr155028975ab.15.1739255701871; Mon, 10 Feb 2025
 22:35:01 -0800 (PST)
Date: Mon, 10 Feb 2025 22:35:01 -0800
In-Reply-To: <c6764fc9-9ced-4a55-a91d-ae29e3db2433@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67aaef95.050a0220.110943.003b.GAE@google.com>
Subject: Re: [syzbot] [f2fs?] kernel BUG in new_curseg (2)
From: syzbot <syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com
Tested-by: syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com

Tested on:

commit:         b278ebc2 f2fs: fix to avoid panic once fallocation fai..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
console output: https://syzkaller.appspot.com/x/log.txt?x=1191c3f8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=147b7d49d83b8036
dashboard link: https://syzkaller.appspot.com/bug?extid=15669ec8c35ddf6c3d43
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
