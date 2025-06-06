Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282BD204F8C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 09:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749201964; cv=none; b=ap75S+fiHCiNDPoVx4hS+/XmR/CZFbfOZPAHCvQRRXLU5jwPY2dORcYv0uAKGIg3/U+C9BDh9apfWfO14LB55sne1jJea0x629rJLQROpVjy2zNG2zH1oPntFLiCVXkomVdkrvjdC0D/LEw24D6Utj6UIbIi4idTY+eKvnpUjlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749201964; c=relaxed/simple;
	bh=nfpHKU+Q8jnJYk2RkacQOUfQ8pePzqfvjsJuYOHX3aQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CWq6/8KtWRztMY4SSYblqFPxpLHY/4s/8wzs59ZGK0tEFPIBRCxb0nwXzsd66Nfpq6c9IVo5O4BpJcRnMJKPhwtJgcXcnTy9lJV/htDjgCwQwyWalxWpKXKb2ebHOd8niE/OzTF4shGw12ZFnJw79Wy+a9t3G5xV0Nwme+x+EA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86d0daf3b2cso364910139f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 02:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749201962; x=1749806762;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6vH4LJ7CoOPe7hLVuOQPzYeCnRHZ+xCiGvJ/vje2Kg=;
        b=uq5jbTYF6etFvlduFM2qz9mwEaZqc1X5B56A0tJoUaLRcTut6OHqYbRIsc2qJhHC3n
         PVYKyrGPEp+PhZ8/iGbk5oAtQGv8E+k5JzE2hAE5xTvI/XmFoYKJsTu5hIo1vH+JKr+a
         AcH9UTeB01OMAC/yEHoe10d3+jRq4Ziv9X6qV52q7a0KT5cO9UH1W3quUgVz4vqWGI5m
         L+YoUmhzwqnCjOxmcBKhCIyMFRgQtjzoqL7K+KyzJZbz3ZRbivLjRrAbXOd5HvHALxnW
         BVdHjrdWGpT3sX7wCTkLGwmEaNpCO6qhN+UB6a6RqaH7jDGiQghm99APDaXMPKWtCzKd
         oPaw==
X-Forwarded-Encrypted: i=1; AJvYcCVYB740WuKN5qpDF04RtAPjOG01Gt8ZdVo1jpoc5oIhJzgx8WJcIRY1qq+S3dZdhuHBfaa6E5VJuhPdErw=@vger.kernel.org
X-Gm-Message-State: AOJu0YySV9aE9mCtbAj1+ZEacQdvx1vAwNZbZO0q1ubqCyn3D/gRMOfw
	hfiAQqXhBI4XuxGD11BvBA1mLakAIxkH+ZLKCIj1UHyqwQzKDaM33U6ZpOr2TbzPlHuWeOWRAHc
	mTzXzfje9wprGGnrMoWmZshinR14u94fJynwmtEHAA+s7X1wxEGfgN3SYc2w=
X-Google-Smtp-Source: AGHT+IEWe0yLlTA3Hzim5hPB+52bF6CgQ2wC7f11qDm5jloaEgKy+TdK7PwoQOrWacMITaPAMpnkZusOaBtQ6LOLSKHF8CmeQxI4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:219e:b0:3dc:8667:3426 with SMTP id
 e9e14a558f8ab-3ddce46e8d1mr25653565ab.17.1749201962142; Fri, 06 Jun 2025
 02:26:02 -0700 (PDT)
Date: Fri, 06 Jun 2025 02:26:02 -0700
In-Reply-To: <fccdb703-d3b4-48db-b001-3630e20cdf3e@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6842b42a.050a0220.389efd.0002.GAE@google.com>
Subject: Re: [syzbot] [trace?] BUG: corrupted list in ring_buffer_subbuf_order_set
From: syzbot <syzbot+05d673e83ec640f0ced9@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+05d673e83ec640f0ced9@syzkaller.appspotmail.com
Tested-by: syzbot+05d673e83ec640f0ced9@syzkaller.appspotmail.com

Tested on:

commit:         e271ed52 Merge tag 'pm-6.16-rc1-3' of git://git.kernel..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16d93c0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6ede24871858ac52
dashboard link: https://syzkaller.appspot.com/bug?extid=05d673e83ec640f0ced9
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17893c0c580000

Note: testing is done by a robot and is best-effort only.
