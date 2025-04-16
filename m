Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6D81F3BB4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744804744; cv=none; b=bPTK1sOmK8E1ujcqXWNecLI7XmvKrhp3VEymjB3aeiUDPBuvXH7Y9LGS0QM5F6cupCZ1EMB8q78QdbgV68z1MiWpyUr8bm//ZtWBSZgg95HD8f+Ev5TxDyjIXtJl8B49xHL25avKt/F3zrW4TtDz+pB+9GzUfadrbci1+jXrJUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744804744; c=relaxed/simple;
	bh=7XDaLoq3659yz5WlMtNSwq/9FMDXu4Ya8eRfH6DDNso=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=h+aCHZBTuWQREqnKB0qMXNS8AlMyZGYIfhoHD2CyxBvkjNTXfhce1dw73YIuIw4Rgy09WniM9bqKLSHHh9IdHuZJxoeY3pUcPXFcRiL9yj8k2K+dlpswhYyXlKijGyP7PM3Bj+hcq7ZVcAy4n5VaDx0qD3FliaUBowNcwLEwPvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85e4f920dacso605848839f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744804742; x=1745409542;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hC1ORCdInRALRcey3WdLjKSlXXi6CnAh7ADTG+W6CIA=;
        b=eQgKNBEGTSbFy3yGoh0CVmQ3nS2ai8dOEWzAO8YtNkMjHdLIrxATLyELAVPx4MR5GQ
         pGzOPBiMW5BGj4NJV0uAT7/8Yt1RI/qeeO6YRK8fhztGaReKY/uYj+ThS4BPq2PWIodY
         gmA6l21yX3Nxrjt2yYLCwQ4FHF/mQN4nwhh14RB48on5GLF5SWtQlgS7i5dp3fcJNwhp
         XabCxfACMAn4l0xmBrzokBU8cWD0UcfyMSjGrrjUWZnO4SCyzu3TNrUNaLwUMv1Bayi0
         ya8YO15hlS4wpbCBQJGz4llHdJCyPTJ/5fJIGHGOdaFqHWnvWZW+Z6D+4qH01CJGxjbQ
         yb+Q==
X-Gm-Message-State: AOJu0YznG+KB5IlT9X1r7TYsejRqYFp/hi2EujUjwn7h0MxJJJjH3Dwu
	y93lP6eGUsVaZbIfPpx0E9I9yrKHhwmu8LuTJ81gXgNqS++4Ckcb/VJqnArwUQ3yhnwnb5eVoD+
	S+pja6gN/uNZSQaLmqO1xV1ZsNOHWR7JmIT2Rp0OJz3qXhMkbjWUZ6Po=
X-Google-Smtp-Source: AGHT+IGhEq8I5dh3yDQ17ht2ueFiHecyR0VOgyYsekGkKdDu42+b2TX4W+nRRMuegFVDvd7uFERTVQoCk6LgGOyRIax1tz/qZxGD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3c86:b0:3d3:fa0a:7242 with SMTP id
 e9e14a558f8ab-3d815b10d23mr14184475ab.9.1744804742259; Wed, 16 Apr 2025
 04:59:02 -0700 (PDT)
Date: Wed, 16 Apr 2025 04:59:02 -0700
In-Reply-To: <20250416114352.120139-1-n.zhandarovich@fintech.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ff9b86.050a0220.5cdb3.0004.GAE@google.com>
Subject: Re: [syzbot] [usb?] BUG: corrupted list in usb_hcd_link_urb_to_ep (4)
From: syzbot <syzbot+a2e67807a84a561c08fb@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, n.zhandarovich@fintech.ru, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         1a1d569a Merge tag 'edac_urgent_for_v6.15_rc3' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=120fafe4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=371da5cada627d74
dashboard link: https://syzkaller.appspot.com/bug?extid=a2e67807a84a561c08fb
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
