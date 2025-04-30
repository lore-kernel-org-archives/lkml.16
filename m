Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CD52E401
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746051364; cv=none; b=jS/2oCtFzaGS9lcb/9UtGAgqBO0C0yFAHvmwMUfgx3i/6t5az3NvoHXcxEM+G33V7XgkquXerdZTbffz4wnhBcq1aamyJdzCyuY58tTc2YTHYstyIoB83C7C0HiCdBU+BQ+fwr7PoXtKpSsgKUaRIAPfKF9jLS0r1B+NirIPgBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746051364; c=relaxed/simple;
	bh=LA1hmvWoh1w/pViOhG4nskQrM3XFyEiqbyfZYBwzBME=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=m++feynQNKgR0cC+wjYiZM2px8w6VQ5eVXQxmBZZLo4+cfbg2fD72bjxxoLscAJgeyVRpYq+tPinGzkBzlh4jJY/AZw5Dq3QveeCZ/VW1QHYHxBkFboErwx9jcaHNP4K0+ohO9rVjcG4QUcTWHzI72GFRlZgPT2no+FRkqBYycQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85e7f5129d5so40096139f.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746051362; x=1746656162;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vb/fhlw7vaMZDp7UCH0BR+ACh6mnDax2s8vDaxFfkmM=;
        b=gBTdo7TGUIbfcRDsNg4ScQqCCZvnVXH00vOLyFBHH0m1CNZNKS4snyN23ms1suY8wt
         sr8w0xez4m6NGj4iGD7o4Cesi7Vx4def7EpmkbQUJbkWcTaYVKxXh3Cmr08Bcgm8my2f
         pL8IaDgEMtBuJS1vX/XXmY1dRNbg5zYTUGZ6SOco1BQRgcYnusdGnAwjyqJSGbTaNlAt
         od1/6MjiwMXTaTlACY5oNQYWPQNpgDRIilpaA1RN1P9Y+riNxzwSZnBOoAzMR0q98TbT
         amveW9hw52R+FYBeYSF/AtxIX7QYJaTusDwfG6Bs93taPcvmTuLNzukH1X2Vnl+jqERi
         OoUw==
X-Forwarded-Encrypted: i=1; AJvYcCW7gHZCGESbOt8LTWQlro/+ASg1sUFM1yE6LB48Gl5HcTCZetxjYuTHC0kVUiMnD6f74O+cPUzDJ54OPdo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI395s7Hk62yO43k/xZjdW6dJxCRQAJina0ln/VcDDdUaYBOpE
	BFL0eFP9Pprsd8ZCSLJ82M/Gfo4mXEcZ0mB+cyIDATgWC0nTSQU7cNIzaMYmjoKdvUflYzLwzEz
	bViDKC+sdL9tFHn8gTlBi0TFsNHkuqYV1At0TYCWIGhs7oX4xu9E+JrA=
X-Google-Smtp-Source: AGHT+IFyTag1lbXyKijTHvQDaIe0k8hV9woQatpuChcXj3BjRYaHrEhRmB+2QpTrpUTLmAWSAPVSndPhfu8AYcLzVa5kVz6OqQ3Z
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3808:b0:864:a1fe:1e41 with SMTP id
 ca18e2360f4ac-864a22cd3ffmr144525439f.13.1746051362570; Wed, 30 Apr 2025
 15:16:02 -0700 (PDT)
Date: Wed, 30 Apr 2025 15:16:02 -0700
In-Reply-To: <20250501.013737.1960337608602672035.konishi.ryusuke@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6812a122.050a0220.14dd7d.0003.GAE@google.com>
Subject: Re: [syzbot] [nilfs?] possible deadlock in __nilfs_error (3)
From: syzbot <syzbot+00f7f5b884b117ee6773@syzkaller.appspotmail.com>
To: konishi.ryusuke@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+00f7f5b884b117ee6773@syzkaller.appspotmail.com
Tested-by: syzbot+00f7f5b884b117ee6773@syzkaller.appspotmail.com

Tested on:

commit:         7a13c14e Merge tag 'for-6.15-rc4-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=169daf74580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a42a9d552788177b
dashboard link: https://syzkaller.appspot.com/bug?extid=00f7f5b884b117ee6773
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10e731b3980000

Note: testing is done by a robot and is best-effort only.
