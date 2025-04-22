Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE131D5ADE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 19:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745351044; cv=none; b=f64tFb8xLOo/XEQ+XVYAOelNqPeOiflQxLu3QeENyDQG4c789QJXetyoe1zGEpVFvutq0MJhR+QJ/V0RY78k4WkqN5uoo3ODycMjLtRAYTa+b7EkMTs6lcGygvaMoc1T9LmsuchAtCtDfOkrQbjivpJjPoXgY/NBphq3u0PoyHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745351044; c=relaxed/simple;
	bh=1BpUEevskoFOQgXbPE8wJ0xniOiB24wVnwYVCmrMLtQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=bVnNg/mZU104T18lWeYm0lSmu+CGVxm+DkyHh+m4Mwt0Yr1xrhJVvZv/hS68oGHO6r697r1RYhdGSSFNStUzeUpZJSVBpb4/hOGFEdBfh1ItLrfGuXfNfAHlO6qHU02SLj00SqdHQz/ygEHW/N7PopugTk6UcYw3f9YtoLGCnKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d90ba11afcso36044945ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745351041; x=1745955841;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D/RpZt3mi4VBpG+u2EgnLUJuk4rrOTkgTPqF0Wn2uco=;
        b=mmLwW7HDNYH9AMa2/yfvc0rb+mhlbU8Fv5nzGB8t2LPeiOhNJIWeevCZN1S9bwP6IM
         EPnXWv5FMdaqgUhlxPsBUgSQB7JliuOJbaUxA/09JXy27W8yFGfxnRb3bPGu05vmE6r1
         hkYpSSDyG0EBelnrijdoewY9Ti15ESrO4bGqMy+XJq5zlnM6Opz90RWYOVoVKFcjFB3F
         VJ671HZ6FNKpIq3/NjbRABbWJPfgiz+FrJ540sybfYingBJzuJRw7YTVOpYTpWnRzBGw
         ClCSIxBHekX2rHlWToJfIbiVUNIdN4SN4BRXl+r29pQvgMeEt21iJuRUuzkL2CqfrPIn
         oojg==
X-Gm-Message-State: AOJu0YzMHUHwb6Q3TY+wlVY80/UvRTFI+H4QJ0D9LZEvCYJgvmzVpOsg
	2TueJBTYhXwENGO/BDwZM+0AdtgTUQ6/v5s2iBzEsR4g4I4Y/U+lm43D9A2EesWu+ZdRFZcbX0t
	UT3stteN78hls9eMHx6YN98p4GpCKTx6W/1Jkvqrayo5vviBLBwlP14k=
X-Google-Smtp-Source: AGHT+IGrMM+P0Qyew0VU0eSjRuMk/vo45iWSrpQxEg/EdZvbViyaFFagtpqQ+CMw0m/pMdlIQEDV+RXR/MCfrMmK7pXcoQ05132i
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2187:b0:3d8:2178:5c50 with SMTP id
 e9e14a558f8ab-3d88ee25f04mr151837225ab.14.1745351041638; Tue, 22 Apr 2025
 12:44:01 -0700 (PDT)
Date: Tue, 22 Apr 2025 12:44:01 -0700
In-Reply-To: <20250422192233.624776-1-richard120310@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6807f181.050a0220.36a438.0002.GAE@google.com>
Subject: Re: [syzbot] [jfs?] [bcachefs?] KASAN: null-ptr-deref Read in
 drop_buffers (3)
From: syzbot <syzbot+de1498ff3a934ac5e8b4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, richard120310@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+de1498ff3a934ac5e8b4@syzkaller.appspotmail.com
Tested-by: syzbot+de1498ff3a934ac5e8b4@syzkaller.appspotmail.com

Tested on:

commit:         cb82ca15 Merge tag 'usb-6.14-rc7' of git://git.kernel...
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=123d5ccc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=522f1f3e5f61442b
dashboard link: https://syzkaller.appspot.com/bug?extid=de1498ff3a934ac5e8b4
compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15571a6f980000

Note: testing is done by a robot and is best-effort only.
