Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C3DB660
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 01:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748743145; cv=none; b=tIKN8Jb5KfsvQHlxBQHl76XR9V4VoT3VN5KWyP7huoPbq8fB+txvQwUXgigg/qnKD8cxKOBcbxUZqeDoRcJsCAskyj08hwMmQyCOMrZZQ5iBHSmffbbmS0pRDdBzeSmxbQ+PxR/sundKC7rDVfUOaFPp0k3xgHMcXRwjNhuBmmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748743145; c=relaxed/simple;
	bh=CeTIAj7rI6qrHu/JUqpk4IW3PAdqEM8RI8D6G5KKg+A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=M+YFnqf57lYTuuzAhmqTVw5KdzMstmkWhKIjoDfLGSiSZbeAE8TcPBS8hlXqdjRXWw3uHDbYbrD2PUHWFqS6aziUEq6NOyHduGMc0sGqrLDDNIzDZSy2OqM16o3oe8bSHFbsJOmPF1peVDdY5x5goyuwQuWiyhcGfeAAUdHzg5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86a50b5f5bdso278894239f.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 18:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748743143; x=1749347943;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JOGhBITvA5pccYmWI1dGXjUPEDa5IWssIBcxXs72iP4=;
        b=CvW1fwIZxGRFO3s5tIxMDwmkKKL5lm8VPHrnJlaRBy9d+/nowSdAZmenwhh3BIk2CY
         tBhFKAkffxqeqw8KkWircinOyYDpXmTFLdns/Bepkq0bvxFSpMVIe4UqBplmWkEscqFE
         nVNFDMV5DHtzvxoL+J+8FHe7M8dsFlS850ANh+u35tE3UTAkFCEv1vOXMK+L1PLQFjcR
         niZr9KebVHq3wLHboWhFRamVrmBmTZ7dwnfZH5syvQfFn9GFJGyOCTjHjza1DbiNtMnl
         3SCxVB5db38ysjpCBj2mRdPldWHQOW7MbopozZ6KMgKJh93yTyngsuwn2AP+6O96ma+m
         uUCA==
X-Forwarded-Encrypted: i=1; AJvYcCWAL6vofL3vRSSdDvTSYt6WbDca7VTnCeFqp9OsU9xeyrlZBm8e0vSNC8zMWpctwub6gzASgo15z7TIyC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YykC8DSq+TiqrUsOxI0n3a8Q4BTer0mPnZheaZRYYj3dpCHTAUs
	7Oa9Hsxgf/hg3cUxs31ObZXqpH9f9xfSXB/uniE9I3amj193Hj1hkXTeICXYk8fW93xK/xR4ujg
	dEJnXuiRm3RxqCFskLbkFOkbcufNilR3E1Btnc5T7ojpaLLOI7ulhoyqRLZQ=
X-Google-Smtp-Source: AGHT+IHTacTyUr4vAdu/BA01Itt5TIfikohf4QX/TCk6yqoAzOYN/rGhct3RYY/cSPUyoWHWI24V8VhULdD9Xm8XRH7Xcb2HMK+u
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:15d6:b0:864:9cc7:b847 with SMTP id
 ca18e2360f4ac-86d05177de2mr944511039f.14.1748743143471; Sat, 31 May 2025
 18:59:03 -0700 (PDT)
Date: Sat, 31 May 2025 18:59:03 -0700
In-Reply-To: <20250601012256.2510-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683bb3e7.a00a0220.d8eae.0023.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] possible deadlock in start_poll_synchronize_rcu_expedited
From: syzbot <syzbot+cbc79a37b5fa23efd23b@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+cbc79a37b5fa23efd23b@syzkaller.appspotmail.com
Tested-by: syzbot+cbc79a37b5fa23efd23b@syzkaller.appspotmail.com

Tested on:

commit:         4cb6c8af selftests/filesystems: Fix build of anon_inod..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12e7bed4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e413b6de2bc0230
dashboard link: https://syzkaller.appspot.com/bug?extid=cbc79a37b5fa23efd23b
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13c5200c580000

Note: testing is done by a robot and is best-effort only.
