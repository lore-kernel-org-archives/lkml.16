Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102624B1E7F
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 20:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747685827; cv=none; b=utBBMWXbUneA1hKgVb1NPASoBWcoXlbXJGu99umHx/CJl9zsBAqHLtnSK1mOPg63TMImq2slnXZq/9/mKkd+PpZorBNU+vovqLYAmYEV+5jFqIhpGzw2kLQSMJyqJCkdhgJMqSC84bClgvq6ZhJdLdWZ5kmnlVzegwSBlGNNyMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747685827; c=relaxed/simple;
	bh=xrw70i5fGyzmm87UZUlXDAnxfk9d6jVo6E58JqJ2el4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=natbV3loBcFgHkZ4q2dwUeJmM7WeEQF6eKx9MEpNOjmeIjMlubFQSfizbT5QzGX3qe7qi+hkI91OqwrcXfA9ioFUxCW06ReRTlhcQNtGIF/8xLUGyfpQg1xriPea+inLn16FpOHvqV2oVxwZNJQ/cUChIK6XhjuG0i+shw1Bknk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85b5875e250so568943439f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747685825; x=1748290625;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s4tfqTxT785BfGpKZj6+63bjCejJEvkf+nbKidQmpuc=;
        b=ldKvvFsg0h8HSy2QPrjJrMWu8OLthWlVde6V96F8qQgRhZgZYRKiP7Q3fXz4nG1ibk
         vBhvGFlLd04EZlKIEdAj7JHLbh0/RcyqDsk9SfLjUIo3m5D8wzGWS21MTewnlXUYOmst
         qEI4cWATxn2RwfQYHD5alwWTnvmFsscxCNZCJrnPIkPfzqemXI5j8PO9JKkWkWPdQBNQ
         Hu71pZ8bJc0Vokw1p/eZ48D15/AIOOCeNMqN0y3CAYSgflKLnm5M0hNdFJoH7ZfTfmMU
         TAMmq5v9YsOZoDyDzRqow0YtkRUIGAxPM5zR1RyBtyXCxL7liX1647Rqxq3p8dO5ajp8
         HVeA==
X-Gm-Message-State: AOJu0Yz/gpuNU1GTq9hjVxYEe31/i0uI+5QibQK57JOTUnm9AfG+9A9P
	CSKZ5YEDpJNpiIxpbYJycZJ7sAxDvwywAJ3/an0ppY5CRkXGLtbw+0CdAVWPZ3A9ErhZ5s1RbgB
	y/lCpAh8vGpAP26xxdJk+o6s01Bu2j/ry204tm+VjQgKIQM150Atep3D1pTE=
X-Google-Smtp-Source: AGHT+IG6pCqqp6LzKSt0VOT6WGBBiptRIOf8OsxuuP30FH8ugbJps/ipNOdJ6cE/AJYczY1I4LyCCvlEIpMyfds2IIwzNfREY3Qk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3e98:b0:86a:256e:12d6 with SMTP id
 ca18e2360f4ac-86a256e1640mr1559697239f.2.1747685825136; Mon, 19 May 2025
 13:17:05 -0700 (PDT)
Date: Mon, 19 May 2025 13:17:05 -0700
In-Reply-To: <20250519155603.2364004-1-n.zhandarovich@fintech.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682b91c1.a00a0220.7a43a.007b.GAE@google.com>
Subject: Re: [syzbot] [usb?] WARNING in gl861_ctrl_msg/usb_submit_urb
From: syzbot <syzbot+721071c10f3c7e4e5dcb@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, n.zhandarovich@fintech.ru, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+721071c10f3c7e4e5dcb@syzkaller.appspotmail.com
Tested-by: syzbot+721071c10f3c7e4e5dcb@syzkaller.appspotmail.com

Tested on:

commit:         a5806cd5 Linux 6.15-rc7
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1208d2d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2985a126e936c276
dashboard link: https://syzkaller.appspot.com/bug?extid=721071c10f3c7e4e5dcb
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10bf21f4580000

Note: testing is done by a robot and is best-effort only.
