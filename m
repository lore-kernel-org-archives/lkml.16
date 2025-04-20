Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730CC134CB
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 09:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745141163; cv=none; b=TnbDBAGsz5CLGb+N4Y9poUXq/ce1wWWBT5yCVLx+LeJx4sEIdqhi8osUyIOI+XECMuZCZA16ht40ZoXjHkFfPBVgWijEvVKTRxKesRRF5yDUEoI/zjDFw3wAuwyifT5bQJ09qnwWRe+1MN9uYJjl7EhHcmW/sjfhDNnN6GcWDLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745141163; c=relaxed/simple;
	bh=91xE1T4KQA2R6IRfEtxFeEwwSl81k/b+WVgKezfI/+k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=OGeT/2HXYgA9es1bVMjVmetKsfdEiFtKOpJ+G3eRCrADTcGWlsjYiUk+zTgW8g5uFkm8P/Ly0H+bpb/4N0x6Z06ZIIY6nzBus4oQqVob1fIC3wsrg7KB27S6Z2zIt0qB9JgampuH0lBXcAGdyFLywRg5t1zx8e8J5bVoLMG8Y4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d8a9b1c84eso28090825ab.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 02:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745141161; x=1745745961;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vOTpvBRthwCMYlon+8k+BUWL519y5LcM7wnJNgYXhk8=;
        b=Zk4O7UYamQc8tBUB2Rr56xjbO6in4PUs8hdgpMPfLdbSRaKnLUyVF3Ds8YoiE4f/2+
         wNrbchZD8LGiUx/V7DpzJS6ua+9uJAgSB/+1ASjE8k+cPx0duzQcwq4gCNa6DdhvH1xK
         Rt2magjcnilo3SdCMNkmQ1oZCcT0o2Q2QSD1f/rLdCu3yF02DH/JoaKhROZ4552z1SM9
         SyzMIqUKW2rZf1whxjmvWKUluCDOjk0Icmrzqrfm6Htw4iUoUcacE1Rs6Qg7RPgdXORa
         k2Qy5fNNRMMhACb4yDLfQQ1knlHX7EyYNsJd/AsSuOAuv9znrPXT1P6/EC1r5u1qavHF
         wxhA==
X-Forwarded-Encrypted: i=1; AJvYcCVUYw/B71ffjQ01rw/fOj/X0ronGrAJFqBKrnZgvkXN64BdWF73uiTS2qQvUwxlNk7q87Aukgov/qH7yTg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Fz8EKvREp+Zogf23oyiGTq8YgrqAmPG8RsPxXhYtRuwpx/tv
	gj2TZe1SquNd5rb8IwJm3ysAdjI8wCpR+273OhRKPEIdYRRTrUhOk8HL/olSK0A93qUNwtlYqfv
	eTxVvpFDrnljFpJuAUamX5IkQ8Mvcu3j/bW6zHfgj+sgsvDkoHEW6yu8=
X-Google-Smtp-Source: AGHT+IH91ya9bXF1KsNCS0Kh6HXX9xRcXPqSVA+VRFE6aJ4mYKduu4SaydJNxIFXbSciPrTgiWxissYlLeT8BQu0wADfPyIhB8B/
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c01:b0:3d5:7f32:8d24 with SMTP id
 e9e14a558f8ab-3d88ee265ccmr72110365ab.15.1745141161572; Sun, 20 Apr 2025
 02:26:01 -0700 (PDT)
Date: Sun, 20 Apr 2025 02:26:01 -0700
In-Reply-To: <tencent_6C9F99274FCE8DB625B10D81124BDD86DD07@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6804bda9.050a0220.4e547.0000.GAE@google.com>
Subject: Re: [syzbot] [ext4?] [net?] general protection fault in __dev_set_rx_mode
From: syzbot <syzbot+b0e409c0b9976e4b3923@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b0e409c0b9976e4b3923@syzkaller.appspotmail.com
Tested-by: syzbot+b0e409c0b9976e4b3923@syzkaller.appspotmail.com

Tested on:

commit:         6fea5fab Merge tag 'mm-hotfixes-stable-2025-04-19-21-2..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14876ccc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1ed77f07a029d2d7
dashboard link: https://syzkaller.appspot.com/bug?extid=b0e409c0b9976e4b3923
compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
