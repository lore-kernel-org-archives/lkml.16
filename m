Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4132A1E5B62
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 21:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748984586; cv=none; b=nnVqLBtsFCwXMrcjVv6la+6Fc25h5w/V+heqZwylVuIAU49RkquRKKckO2UjqXmRjsifw9fJOv6QDnlTtGzjx0nsPsIoM+qAUC2c0rIaMSuoD3FD6kMKLd+PP+NBhJCu6JHEZF6iDLzSXWn44pojOVd179M6P834HzxoXS18OUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748984586; c=relaxed/simple;
	bh=bUPNmtZoBKnE6teOw03VN+8XIDM92lremblWAC6LxJ4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JWTHh6NkCkXpm/21fYmhEmWutjG4JfHAcnXYkcYgBQ3mXoFsLCCKCJG9NfuvZQQ2U1ML790jYrsd1V4zwcUdDJ5DokpwHJr+BbrKxuVPX4Vh2ChsN9sVTZTnhdf0aiQJJEGKUKEvsrr9LoQ1tX5jrWYGi6HrngcCyHzikwQoZvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86cf0364dd2so762130539f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 14:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748984584; x=1749589384;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A67MC57fO8OankkZbiKl1/WCz9unLDqxO/JlH0P1Mic=;
        b=WYIVSJAjfrySI8BT9lNEgkg6zkAArptTL3pglfJASaNJqosX6+ALvNod3IgUfGkahj
         zFdF5n9i/9R5Wz4xl34cJclXGOv0J/fdDgjhW6zXYN/Js2MbbZd5xELxb8PvdmqXj1K5
         GOT7ld01RyPWt+ENFsykFuSj2mjwDbDCWixcYqBFmAbZvqGuQDhDHh7ssS6driCHUOhx
         r99d7kXmcWE99ybyKawOJjk1MArX975MCl65Cf2ObMWinZ5rMHBbfYhaDJQ4wgrYlTbj
         DnSmWbaG+Fc67eEjI/BBLeRes+u+bFeHakzHK7H27/cicwJVbkI1sRecUyu2HMS1IY0u
         9qhw==
X-Gm-Message-State: AOJu0YxFTydglFQ0gkBLLyHdYz3LfoTG0X8t7AX35zxojVhZIuyERqDn
	LNTQpvUtpGqcy4EBEN1y5QmNRUX0aXuqlhcVqLiMY+Qhls7DO369MBTSeIZB9RRbi8HaPGrloE7
	0qJh/4i0rYK1EKaL+Li37Qm6mL1XaU5Lj5uI0bwQ4Bydtl82s6OV/ps54IdI=
X-Google-Smtp-Source: AGHT+IEnlgRYOG92f6vna+OjMmWrnUe7UHcNrQWXtdK8AUBcg8xurRp+Ii+Zq5iWC+JnWLME3sqyHBP4fuaj5JxeVYpwSIVeFeXg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3e9a:b0:86c:fe66:4d6a with SMTP id
 ca18e2360f4ac-8731c600836mr54925439f.13.1748984584383; Tue, 03 Jun 2025
 14:03:04 -0700 (PDT)
Date: Tue, 03 Jun 2025 14:03:04 -0700
In-Reply-To: <CABBYNZJdkA4izCTV1WxhcuhzcDtXiEbq-H_5_zLJFuPcfB0O=w@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683f6308.a00a0220.d8eae.0075.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in
 mgmt_remove_adv_monitor_complete (3)
From: syzbot <syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, luiz.dentz@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com
Tested-by: syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com

Tested on:

commit:         a9dfb7db Merge tag 'backlight-next-6.16' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=160c4570580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6a3965f6896e6e14
dashboard link: https://syzkaller.appspot.com/bug?extid=feb0dc579bbe30a13190
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15933c82580000

Note: testing is done by a robot and is best-effort only.
