Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA1D126C17
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 03:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743479895; cv=none; b=GSaNH8sfUKFBrVn4HkPEKQf5djwIHwPcI3qIzqsyOFmYc0s4bYjt7PYn8qIIkM0fqCDjnNAOaG0pL61Be4mHh2Xe7XS/k5owvJzfwflRpIr6sBQnZP+Ztk2aK13YxR8MzQoNg4z47hqkoNZ9q3lxoIRs2rNYh0SJv9CroArMN9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743479895; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hbNg1u6cmjVwePdMZUNRvQTDS6/BQ2PXQ+viOgugHgdqV/0Y5NI5usd7vTV8v/XdKCrE46k/cs9pqLtNzGo1pZquvZktXrp6KRBP3OGCl7Pb6QFNLJezj5KyNYFbDla953D9Ykvpxbm90Wqgx6FVOHiY+jJ0KFiMwOch8AJwtOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ce843b51c3so120167165ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:58:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743479893; x=1744084693;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=nLz7T+MfLWbfcI1QBEOpFGEo3MHO8QCfQMlYYqhICQi2abN7c36d9TAhcl3nJpfSt+
         FbXITZjGJbf5qr2t4FhRzHe7ZJbHLQxBZchJVodVcn8HlkfsGxElKzERm3s07HuExkMH
         I733bf22cYt8b8fSFCe05UP1hTb+wxLyuQbIyn+kC3oT6MK/1QuySy6zFnVoUZheUBSr
         4DOLlRUZRiagvGym85x1Gf2pOkGpv/P5PGGssibxhNQW/DMsPpi21o4Lomxywfp4Wljo
         L8RcYjusymklXLqPOnrIlbX4synsPjHQPflt5+TWJc5Y+db2FnnfSpz5mSRyMGPzhWYV
         MT7Q==
X-Gm-Message-State: AOJu0YxAJjzSc/9kAGXdQExHOUc4rXhfIswc+VZzfS9w9jDpFiO1uLXL
	rcZcx0CF3OV2TIMo2scbzzWsY3AbHw8fYABLvN2Z03ntqRKatAVkRPf53+Ga+JEZlFZM/2aXEKF
	zyS/1kpJpDQIo9ARgLQHXSRuGCtoqkluHdDVg/ViKUlxjYMXUugTPeEA=
X-Google-Smtp-Source: AGHT+IF4LVJ5AG06WYeyt2wiLnGAM3qI7zFee+PEdt2oQg38Vfjn6hvidYlFBgLf7JKFC+6P1yjbzL+aJdtYfkCC6JvVJpbnJ/DZ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:194e:b0:3cf:fe21:af8 with SMTP id
 e9e14a558f8ab-3d5e08ed0afmr124797845ab.4.1743479893612; Mon, 31 Mar 2025
 20:58:13 -0700 (PDT)
Date: Mon, 31 Mar 2025 20:58:13 -0700
In-Reply-To: <677743ce.050a0220.178762.0036.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb6455.050a0220.3a8a08.0003.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+3304ecaea706d3a6524c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
