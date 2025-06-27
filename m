Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0349E2F1FDF
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751031784; cv=none; b=D7kzpHPDCpn4EyVosPGs8gXNHs923LkHnpeTKUD4sFvtAegORCJM9YKtqpx8qJBlxrAIprJUrjB5sFDOotR4A9z4VfXF6TS/1A/E1pEx2sasK3mCwB7/qEcCGeRIafNVc0LLfBm7YscMFdPqcT+RbIQgouNS+1CqrH0E6G3mcpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751031784; c=relaxed/simple;
	bh=Fs5lzt5cJsSsWvQOaAiHoIZQVL4DvXM39NlB5+MOb/U=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=UBW3ysqkMd0Q+rGSfbBBhHgDVIUv6uZVxfTXrLRhB/iN+eyAYpVrgtjEw8W4YoMCNQ7bm9Q3l0MQ0qwxT2vIBaWhWJU4Y5SZhyweglUKaKDhgKjZh2lsEczlCLGktfHeRg0RpMTCP4THxqDgysiwsIBtiTufX4jHYhLHUs9wqHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddd5cd020dso37760325ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751031782; x=1751636582;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5zJ7bO0fv9qH/RU76MZInwOjd16BKe4Iqr3ENxxsoFQ=;
        b=TFzT/QYK/YlKxm3/0bKUMxskzlB/TsGwpu0x/YPBDin8IvcLAGx07bE01bZVyEPg9U
         tn/30iD+kzUpTqqX4+dXPgL+lDDHdeZ7jZqKGh3MPSzC5TZRlEWVbTTGzEdKluaYEIEC
         I/ygRIU/7sbVE0edyV0TVOiZi4XW2u9VPupzOk/SLaYkiCR52rftNnE3iOsIw3VwS9W+
         8SrfDzb5PdDOtmJGyw+FHZ+RQvyJuwd6OyU30ZuK4pJ96X0Xn08r/jGT8gcXUm5Bg/8o
         /m9g6yhQHqn6yOWWmil2279/Xd2JSI/URsbAyGDufLmTelzQRRaTkhpqSEGYm8BHegpC
         LXIg==
X-Gm-Message-State: AOJu0YxGL+H4kJ009ugFQsYBMYMvdgm7yUsPwn9gc4+RX5D4RL0o6Bis
	XAbP7rmoiXX+pPWmot6KwfnAWW0RSkYJTS33OU/TumDTyPJ9Qu1yHzLfrNmVl5IlArqEyKtgiK5
	fslq9QoScl1ONm4Wcr8VFKELMJdTfCsJrdOVswzDaqmurkzU86QMpg6VPTJQ=
X-Google-Smtp-Source: AGHT+IHWqSKFDx+l5sP+iCM0PHsTTOorKPyMNVk86siLXNiTJ7fPcYzWvEFgcgIF0AmGIoOKRYYdWDzDIVJN8rHtFZbNn0UkvOor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:380e:b0:3dd:edef:894c with SMTP id
 e9e14a558f8ab-3df4abb6432mr34181665ab.14.1751031782100; Fri, 27 Jun 2025
 06:43:02 -0700 (PDT)
Date: Fri, 27 Jun 2025 06:43:02 -0700
In-Reply-To: <d1312fe5-a38b-4522-8330-998410da7980@I-love.SAKURA.ne.jp>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685e9fe6.a00a0220.129264.0006.GAE@google.com>
Subject: Re: [syzbot] [net?] possible deadlock in team_device_event (3)
From: syzbot <syzbot+b668da2bc4cb9670bf58@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b668da2bc4cb9670bf58@syzkaller.appspotmail.com
Tested-by: syzbot+b668da2bc4cb9670bf58@syzkaller.appspotmail.com

Tested on:

commit:         2aeda959 Add linux-next specific files for 20250627
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=114daf0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4db16d7e2cf94450
dashboard link: https://syzkaller.appspot.com/bug?extid=b668da2bc4cb9670bf58
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
