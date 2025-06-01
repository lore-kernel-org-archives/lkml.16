Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895625258
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 04:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748753167; cv=none; b=hntcP0GrleN0q+amvdncsyDBJ2HgURf4KXYiedVqpB4W0t3buhtfs/JFlicO8jQ8YYi0AU+yHWtO5hXXofz8lH617UhJFi00UYZ26NiO07725D2YjFn/rnmGe9padF4hRucw6Fj8P75MVGm0wk67ghzkDhj47gfK2I/Vbwo48k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748753167; c=relaxed/simple;
	bh=tcrsH/5INVMCUtGkehmnGTmcB0uKPXG+xB+pU2NcRjk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=aaUEZaSXng4vi+lRNB3mWIR4qCWsQ7Cj0A/w3Soiyb8YTKa5IsLoV/34xt2KAZw/rpfqGZ3WDwEtX9mFMZJxpnONt2T3YTkFYkGn6IEpQYcmSvcEQ0W7ZOf5mKRBP06ytxckLko4xvIgcyejrIDukz5mfV0v88ihShuHb6u6Ev4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3dd77da18d5so84059075ab.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 21:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748753164; x=1749357964;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U3jwHgbscReIx/tRChMR9jsXVC2qSpxsiOu4PgFZyYQ=;
        b=fmfAa3hSOiHweLi+zG37la5+B8/44Z3JJguvGndsdPxqbYOku2m5fGKNPKp3ha1q06
         uwRTCK8AeGqk0l4f1KVjFwyxaWlrIcZhgHwb1arEYRtcReCb6b0GC6jMhnAGbRgwq1Mi
         0h67GJl0jV6cEp0c6UJJi4LXnJ+XQWRtwVq1N0LLhxM3+z2eNvVZ8EgXUlFFuZUlEdg/
         mSgcj9+kConDnnujR0REUTsF+7FGN1kq18a73KuO1xx5qtx3l1o8tkk3w5occIGIYSVi
         LJKmig8JPMqvJgNNBEBo8lSCJMYHRj0kOZFSLgsEg7ZxvUPkjcyT16ufcc/fim763IKz
         2EPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5ViI6lgMR4DWPSwVNAD9mqF1WxIZ9WKCku1xhblywU6dJs6LOmouqkOw8w9/5xNx7YE4RNb9NbolH8yQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGCxwtAJ1D7IK4qfZbuD7/0djLu98tf7vUIxKhAVZ3ajtFRsL3
	WIaBYsH4Kxq5q5/n2IkVgsY3tytrJRqQd/Fq3b3QGjWoTFJ94SrLPhXzs/cDx04LtOprkRP9j8B
	DH+bZ/EQ3Ft3T5CrzrqvuHBHNgexETKQX5/Or8ZuIH2//7nNjrQ7RvoXNLQQ=
X-Google-Smtp-Source: AGHT+IECn+bjZODcDbH0IlH0BNHSvzloTr5zg7OpdZtzYQj3J24hnJqPq9TkrdQBtKAWOVFjpEk7fhnwUxUkiIaulASrnyIBq4Vm
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c29:b0:3da:7cb7:79c with SMTP id
 e9e14a558f8ab-3dda3363d70mr29195285ab.13.1748753164716; Sat, 31 May 2025
 21:46:04 -0700 (PDT)
Date: Sat, 31 May 2025 21:46:04 -0700
In-Reply-To: <20250601035127.2557-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683bdb0c.a70a0220.1a6ae.0010.GAE@google.com>
Subject: Re: [syzbot] [usb?] [input?] WARNING in cm109_input_open/usb_submit_urb
 (3)
From: syzbot <syzbot+ac0f9c4cc1e034160492@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+ac0f9c4cc1e034160492@syzkaller.appspotmail.com
Tested-by: syzbot+ac0f9c4cc1e034160492@syzkaller.appspotmail.com

Tested on:

commit:         7d4e49a7 Merge tag 'mm-nonmm-stable-2025-05-31-15-28' ..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=178f200c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=588fcb3f0978344d
dashboard link: https://syzkaller.appspot.com/bug?extid=ac0f9c4cc1e034160492
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11d30c82580000

Note: testing is done by a robot and is best-effort only.
