Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3C9242D80
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751537528; cv=none; b=kX/fFjxNonfqxycQNvUHpFYDpDCrS9fBUdCx0OOOc6mFSUYhPij6/wLKA3OGvQJ68NN826uv+4aQAwOSaQo38s5v1lKW1fe1hMY9jvyl/DGY9pgGUXGUuUKSMqK6U68lHF1lZjmWPlO0+TQVLHgZ47Jc8pByM7yCnctPbkrIfwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751537528; c=relaxed/simple;
	bh=TRykhcrytfQs4tBoRBIT9yvUDB7lvy9O0xUaYt2bbSA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gWCzp0QZitiknnDLgz/jW+iuoyjFHV0mI1/YvmAqqb2C5Zj4uYgkvtcElSuqIIjagpWX/XXYofwQUYGibZg8geCCtz0moYQqcbyc4mMURoJB89YF0vphZsgSeCqeqMbmglzQIjC4FewsQMw3zxnI0ns4rrJ9Dw5vwfrhFnatLto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-876afa8b530so361870039f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 03:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751537525; x=1752142325;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LDFG39rsMz1j6nspstcY2u0qwe4+yvanMQTxV+/bDuQ=;
        b=Lw6VT8uhTDSEfDWE3+JOGgmknH6yCDUqzdpxzYeH8mqA8ZH0v51SbRCu+RNOeeDUlP
         ZcAbxd1LlvT5cPZcPZbYIK1IhmvAC1n4JHzflMsCssLLENpfz0e8gFTNqrGsVi4XOYIr
         KC8IhWqg7XYkKfrfRwzU91Vby82cQ05ySe0nfuP7K47mkvdz0WaB/vIY3Xywk1PnfGI/
         wMRDGm2IEq8hOuH3tGPQ77hqvXaDSMvhf7vzMkVZmXNMrfVpJ/5ggRrpGSppuWjjDDip
         Ancs0ptVlnyJaBo8RiA7hG8W5mejKiZG1np26W8G89gj6R76cBrYN3VR6IRuz2WGQ0ZP
         MtEg==
X-Gm-Message-State: AOJu0YyngcoJil6eGiEWlWWVOL0WDpxE0QWlcbniJ59XHdG5W2+jYEiE
	/kJy9vkxWg9CN29Pq5XIKpwqVzLFmWLHfVG36BZ+gJ1j01mM80iwWx+z9QWvn7v9ecpnvk1JaVy
	3Lk6e/3y5ypnByOTW2ZtXmvdj1agHlP+C/H9e0pUCW3XoVqOpMDCPruBHNpM=
X-Google-Smtp-Source: AGHT+IFOI19ORhXaaI7zt5IyM13/PpHRq/Kk2RcmsQAhlYKG593ZCULzGH1jpU2tzfpTftuv8jhosMOXBgLp7DfgtgKlTrEWeC+T
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a5d:904f:0:b0:875:b625:5ee9 with SMTP id
 ca18e2360f4ac-876d214e306mr311506639f.13.1751537525736; Thu, 03 Jul 2025
 03:12:05 -0700 (PDT)
Date: Thu, 03 Jul 2025 03:12:05 -0700
In-Reply-To: <20250703080919.1229530-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68665775.a00a0220.c7b3.0000.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl
 (3)
From: syzbot <syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com
Tested-by: syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com

Tested on:

commit:         b4911fb0 Merge tag 'mmc-v6.16-rc1' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13987770580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a5ea1eb5c71e117a
dashboard link: https://syzkaller.appspot.com/bug?extid=9b9124ae9b12d5af5d95
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1627f982580000

Note: testing is done by a robot and is best-effort only.
