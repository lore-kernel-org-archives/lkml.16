Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70613152E02
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 03:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749268325; cv=none; b=lZZ2RMd70ouJ1rPaHdHY67Ukv6sBiPjYTcxAvdOY+BE+2Hxa6Q3mvSajl7kJGO2gedGidqi5ZmLiuKHziowp9Bb+Ikrm4sLWwkNlyKkndEDmsnzLMPBVgTgXsYCDZrEQHS/jWK7tBpOJiZ9k0Lh5VP5YjDcoFmu2HJE/EaaI46c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749268325; c=relaxed/simple;
	bh=WRah77ZLgeS/96pVkvN6irobXv+qKQxsgNEvYYhz3CI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=oKdX5BO0OmSnwoAGJcAZ5jfFWSfKq0RrLoHXRK/upsFJwTmoR4IeeRXUP8v9guceV02dbCR6PDEfqCA/VXoanoILHOOjr1RMo8LF8GYVpRp4dCOc1H44v5c5WZ4R/mywUSTXhvapo0Ue8+2/OTvQhD1ay/Fo1jniCjGwwjEVc1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-8649be94fa1so471495839f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 20:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749268322; x=1749873122;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PEGMyfAzl73UPk7tgxinWtRILAVdefnBxTs4QvhYa7Q=;
        b=iQ9FK5/9Hb0A5cXYhXZj3yIOkNZw0ItemNqGBwsQgmIiBQ3ColMQd9U0lGapRsMQmN
         zxcpQfshv8qbWqZ9OY8yFyLtyzEJoPnlBcteGKkZIK8hIO1I7l7yzcqSkGJxG76/F2+F
         ab7pmrMflkX2HAjHSNcUfF2FTC7xpO0SKtgHyZdyYrXGn+WWl1bsXi+mOSCxXwQ1IQbw
         SCZPxfDToMRsNkQaiuOV+wpuCcgnjzCAaIs1W9PPSUv7lKytm7ptZN2IVN1/8PRiKbGw
         +ZLsvBRREmXxZG4FWE0HzZVFjYBGLZ3Qf0sdwfJ6tejhuKfI41jsK6gGXqx1BsrEhUZt
         CDyA==
X-Forwarded-Encrypted: i=1; AJvYcCUBSpxJm3SklpePE256KIaMUWmv6K0X9uCfWnSLgamuPh6At1ppp3rtP6oND2Yu5Uiof5721DIpY0aJZkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEYEC0AIQHztiYq+FoaztoREDnDlxmp/YhK3CBk0TXgFyMG5T7
	0Pyu5EpOlqafSiO/uuzsZN/SO4MkBuMzr9fl2Lv/EMkVqDISIHliJzqvDmx12zmpIL/f7ZKqmp1
	gtmQAmaw6YaNKHIg5bT57jdI8aaBUOxAoCEz4VcT9yYlZjdDIYD7NATR3GFU=
X-Google-Smtp-Source: AGHT+IEb+ryU7tl6KiHh368diO5/MvuIcxEYe7/z7YPJbRlCkYTB4kID6m+d14U06fuYDsciCzyRdKGQ+kP4vSEra3PDJh4fJdkq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4015:b0:86a:25d5:2dbe with SMTP id
 ca18e2360f4ac-8733662d75fmr874551139f.4.1749268322539; Fri, 06 Jun 2025
 20:52:02 -0700 (PDT)
Date: Fri, 06 Jun 2025 20:52:02 -0700
In-Reply-To: <20250607000005.847-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6843b762.050a0220.d8705.000a.GAE@google.com>
Subject: Re: [syzbot] [wireless?] general protection fault in carl9170_usb_rx_complete
From: syzbot <syzbot+0d8afba53e8fb2633217@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+0d8afba53e8fb2633217@syzkaller.appspotmail.com
Tested-by: syzbot+0d8afba53e8fb2633217@syzkaller.appspotmail.com

Tested on:

commit:         119b1e61 Merge tag 'riscv-for-linus-6.16-mw1' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11795570580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b9d80036998d0f57
dashboard link: https://syzkaller.appspot.com/bug?extid=0d8afba53e8fb2633217
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16587c0c580000

Note: testing is done by a robot and is best-effort only.
