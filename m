Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89035287504
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750091345; cv=none; b=hkVc1qVG9pZjh7J+zCjdktHAlur+P9ElEmNGP5HXKl43+LPERhfLpKrDaMYA8xt/3FPud/2oEfV9zuI6py5TIGnRbedp4ReA7MXRZxm2dTCDSS7VEQDcLluTEmVdzNoKwYARUh8ehweZ1TJQ0jKZKf/V22iYSf0YY8kC5qf8VXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750091345; c=relaxed/simple;
	bh=qC2JJc8oLz/wuRI5z95eL9hZEUfbnG5ebD4ygNvdWPY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=UpE2UZLajp3XnVtjtpoTmLGX3AMQwh4QUmbBaUOvOQOtGL+j72herQxCLOSzhgQdl0UNA1ypkvWWzV62bMCKiO7gWtGRk+dxjT2My3/SaMAciIfM25ys6XB6BOEbDlzdyU5Mk9hisg0oC0PKDadg1rLodXwaNwR+pbZ6ZN1V1ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-87313ccba79so796556039f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750091342; x=1750696142;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IIYKLO3NzupddnawzZGOgSru0CSjOdttxGvsiXMCd3E=;
        b=EupY9cJX//eikTuiQyxII0gySGYQUn5fAHvP53OHpsZE1e/UVM27iEDPwBbZcz0JAR
         UDWpaSF+rbUmx94Ml2JLRZfUfctJxDJ8xnTRZYU0a43lvyYSrLQwNd/JYBXXlC60Pnlj
         Ri3zjHDIDcNkXKzeG35h8Unl9nAdp0YbgRtnFrVgEGzUtthuT1oRRy2fBhhPwSpkBq3w
         Y/Q9z6r7kG/KIuMvACeZi4VVb4/Fcxs8GthMiJmVL+uhazGkOstaz9GWNFlJzgBOwFAG
         IpFVuniyEWCQF65exarnAQJOb2CSD1Hnjt3demAIaC+Zwi+AzbLMBleOpXE2ll4iHQYO
         oOxA==
X-Forwarded-Encrypted: i=1; AJvYcCVatZeb6ac29sP5dZPVZH7As+V0TPNl8NgpHcecPo+DW1nFPzUEZKnIxR5d0p9LW7tsZacLFGSGd3I0F9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaKDfv75IKhu2QL2QpXtWOZodmHaK33g67TjAuB0gmNhYMGWeF
	cFvEPTqZi2fCJD7HRL9PNMR3wcu+uRTM8xzPui0FAW3Y20q/hr5cfV+kp31AqR7GTyppndE+jpB
	pNX/T+hDodddrCAdMmRyHLhPU3vx3iImKrhjLMqG8ItBaYuB0IovtVEAaiIs=
X-Google-Smtp-Source: AGHT+IGDbuNdkdtLz+5wHUqK0NbbRNRWbePSGHgIWgJqBZI96024WMMpFXI6xEPhCKq02qj+Fl3YU6lT4MuDTUjhotDx472LaRLt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:154c:b0:3d4:244b:db1d with SMTP id
 e9e14a558f8ab-3de07c69dcamr104633975ab.6.1750091342663; Mon, 16 Jun 2025
 09:29:02 -0700 (PDT)
Date: Mon, 16 Jun 2025 09:29:02 -0700
In-Reply-To: <2000ca95-5d23-4146-879c-0b6de0da2837@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6850464e.a70a0220.395abc.01e6.GAE@google.com>
Subject: Re: [syzbot] [usb?] WARNING: refcount bug in hdm_disconnect
From: syzbot <syzbot+d175ca7205b4f18390b1@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+d175ca7205b4f18390b1@syzkaller.appspotmail.com
Tested-by: syzbot+d175ca7205b4f18390b1@syzkaller.appspotmail.com

Tested on:

commit:         e04c78d8 Linux 6.16-rc2
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12d1e90c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d0bf3fa2eaaa1809
dashboard link: https://syzkaller.appspot.com/bug?extid=d175ca7205b4f18390b1
compiler:       arm-linux-gnueabi-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14edee82580000

Note: testing is done by a robot and is best-effort only.
