Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6FA1A073F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 14:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751724365; cv=none; b=YqDrYBThp60Ry7M9sQQv6zKOz7pUYxKRM23byv2fE3BCqwYiMjGrf0+WzDrRi0+KJWEWHZai6kfExtQBtzQye3ocLOLt8ek0KwVPQ6CHMbTfbz0i/igDOjHokf9r+Sff0NbEg4a5E5PzVkcWVKzPh3dShJNAzaMnH5kIFAA4UfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751724365; c=relaxed/simple;
	bh=McAOQmaOx3KLaCOP+5pUxmo3RnSoXPzCu6KgwfX4i0E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PXqYH4i0vzHxkBiAH/RKv18PPrb/NISVJB45Wk/WBLF0WO5ULPKmXFZNswPl0RdmSNAydmSyyQIsO8AKpR1ZIjQzn7jTSlHhBuJ/OQ4R74GDAya7y4oJIvlYN6kpWN/ndia/8MuO3JzTXLb+hWoW/Q6IpwEziaPHf235A2w5VoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3df2e9e6146so10315605ab.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 07:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751724363; x=1752329163;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gA9UEwHCd55E2ERewQYFhOsWFH3d5OMzGcNiCXdAw/0=;
        b=aZBagjQ2OheCQrhXnId7f65lK69iJe8kLCwYsGKHa4dd0RzLgAoela5c5gp2u1/y8/
         xUmJSil5vtHBhUWy7WurjJEvMZav9v3/AWy3pcg+2u9XmdceFvl0XXnKyUPsPYf2P0Nx
         DZXe620RqA8O9hN7Fi07l1cOl8pkd31kHrmgXBo/HpsccTSXHuGiIoXkKm7ozP6+qv16
         A554mMU/jSye361K3JrTA7CE1P+kBXGNiF+OnRbHeBHyx/mSlFjaMEyH8fXZC2/9nGMG
         7CZSvVWJ6tMSKqvdyXV31yAvOuu0NQ9IMnKzS5TyaGLDuGCZxirGQWe8T2ucsS5ovoS7
         BbJw==
X-Forwarded-Encrypted: i=1; AJvYcCWkcbCzgeSmDQrIIE/NHuq3CFFbV+jq9xWihLj/p4bvn2M+d4NEf3bs3eP+P3Y5HXkBHWGUZCvH7O35Ucw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMf6GARxnTFe9PZCfBAWvrJnNcRCb2QLqpxuD18v+NeTI7dPGd
	SnOCgKgSE/RELdWTWKDNr5VfNrtMINvkDYKZb2biW39nvyqJxbAzHnDCNRx1dI4mlU3z/ym5Ue3
	ICzqIRoHdX7puIzfbkXUBGtlzWcXeggUzYjbHPafgIQ4cV9pi082Cc4w028c=
X-Google-Smtp-Source: AGHT+IGaJZ5BX8eIt7Izl0mRuSZASFdfTaK2C6gsBvkSRSIX5AllotnIiWWf7KlNU2+kO9PRBAUhERoHIpuN43XE1OtF3A43C/sc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:19c9:b0:3df:3c57:c941 with SMTP id
 e9e14a558f8ab-3e1354b1f1fmr54852505ab.8.1751724363241; Sat, 05 Jul 2025
 07:06:03 -0700 (PDT)
Date: Sat, 05 Jul 2025 07:06:03 -0700
In-Reply-To: <20250705123842.2616-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6869314b.a00a0220.c7b3.003b.GAE@google.com>
Subject: Re: [syzbot] [kernel?] general protection fault in pcl818_ai_cancel
From: syzbot <syzbot+fce5d9d5bd067d6fbe9b@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+fce5d9d5bd067d6fbe9b@syzkaller.appspotmail.com
Tested-by: syzbot+fce5d9d5bd067d6fbe9b@syzkaller.appspotmail.com

Tested on:

commit:         26ffb3d6 Add linux-next specific files for 20250704
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1169cf70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c567bd5a036e49d
dashboard link: https://syzkaller.appspot.com/bug?extid=fce5d9d5bd067d6fbe9b
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=164a1c8c580000

Note: testing is done by a robot and is best-effort only.
