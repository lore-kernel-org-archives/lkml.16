Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B982BD58E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 20:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751574005; cv=none; b=FQpyJgAwvZHWO2G94WeuMfvFrtPyylYIqSYSEA16XIPTwTwD2gQnVkjC3Enq7Fwchh9tFvym66S4OYcKtpA1XIeom8waP491JiYdXoJG0DIXrMDGwFGBQlxyPV9If5gY6WBM8mm+nJn9NQ6qzfI1ixmyub8McysJRuWNUT0HvNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751574005; c=relaxed/simple;
	bh=ktUtWHn6ctGIrk0DA195Z10iPpgYiR4PsnMaxDvortA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RSQ1//sPJ5cauM9dEYvd6NtAplVA4hNrGZ7Xu/l6ca/Y7C+nqQlvdJsGwbIaxF1/nkTVrWK8nLlvUaqnVQ2WFw1BwQYnEQP1lTkiyQiLau1DXDBpbuHEO0MHNRigwpNxOh3F6j0jiGj8iDc8DoNDCWxmRdALUGgEdJQccIE8MOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3df2d0b7c7eso3348865ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 13:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751574003; x=1752178803;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IMerz2n+tFN8TsF5zv7+dKlx5F1JGkpVWG+36MCX5+8=;
        b=IJSsjqfESEW+I5ACDLHpKL585MxUsGakZ5Oc2rDrAGImD5jyh76ZQrJXfarfVwYvms
         NFsfFwzp7d2XiAdp50hx5TaSBkE0EdOtmjnWhDLv02k4u4ouLTXPY6E+16VuOQ74YgD+
         8QLcHkdY7ZHFCZfVb4nyV3300OpylI6v1j2WqK6lg9YyQp6xCQ+AbXb4sQDG0RN9uO7a
         0ZeD03IDOnc4XFPeAEyawOzVTtcOM59S/2qwfBrRZp5gQrhVuFGaZ7P+eclvBDFKgPfY
         AU+zTN843vzATTx1ekaTGf6Load3d10Wna7JLhIXcz3inK5z1XtHvogljW66gOHorSgx
         DCqw==
X-Forwarded-Encrypted: i=1; AJvYcCX8e62QUZ8zMgJtqJ2J5Sy6iOIRQm69UlSYSUnFzfZfgvnhP3iz3lt/VBt0ck8p1xsFJ2nc41i78itDImA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzezm+hgsMUnLjF9p9FZQPhKk6dI0UpMaOQun9aF5CUVmh9nE3A
	9NGGmD/yCYjxxmqHWEgshl7dMbCdRZf8HOoRvrVYuPc/YrrvI+ws0Imo17KCbS1popeArendKrJ
	hZ2SvL7zIuGy2wzvLTylqZrllgJlUVia88p37sAZ4I2ldB/nw5oJ7TxizjWI=
X-Google-Smtp-Source: AGHT+IHSYeMvwEbudyKZxAAc16iQbkAMBdLxZVFQBfHXNJuS6bF4GAOQva2GfzxgT2xZB1qthR7gV5Llchlthg6MYhNLNnCBGksU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3008:b0:3df:4ad5:3a71 with SMTP id
 e9e14a558f8ab-3e0549c5d57mr92223615ab.11.1751574003214; Thu, 03 Jul 2025
 13:20:03 -0700 (PDT)
Date: Thu, 03 Jul 2025 13:20:03 -0700
In-Reply-To: <f368bd06-73b4-47bb-acf1-b8eba2cfe669@kernel.dk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6866e5f3.050a0220.37fcff.0006.GAE@google.com>
Subject: Re: [syzbot] [io-uring?] INFO: task hung in vfs_coredump
From: syzbot <syzbot+c29db0c6705a06cb65f2@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, axboe@kernel.dk, frederic@kernel.org, 
	io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c29db0c6705a06cb65f2@syzkaller.appspotmail.com
Tested-by: syzbot+c29db0c6705a06cb65f2@syzkaller.appspotmail.com

Tested on:

commit:         8d6c5833 Add linux-next specific files for 20250703
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=11670582580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d7dc16394230c170
dashboard link: https://syzkaller.appspot.com/bug?extid=c29db0c6705a06cb65f2
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16837770580000

Note: testing is done by a robot and is best-effort only.
