Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBE72A1CF
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 02:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738551428; cv=none; b=W01egLJ4OI3lSPv8oKkhKCGQWEF400/ms9N3m7XiKymBQp1jnOySYc8smgGGc4Spf35Mvarnc9Do6wBQBrFqs4L2LsKwUP7gUKviJXE+MJLnWSg/fY1+ngbcBZqy5T2OzMcwgvRaD+HMBrhYebSikCUrtMX+2qdYkBnryLXlia8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738551428; c=relaxed/simple;
	bh=ZLNwVgeuni7ucBtEaTnfPrtPpDxK5z9dk0rIQgCmhLo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CDu9yQBgw8fQ3CgzNqh5U2YLc38RCsGUv5CkDMZy2X/N3ha4YeJ3aicI/5ohRDqnNtsmXhV+5yJI2nJXqS5bWwiW+65y0c1csIiDAC9W+1iW1s7CAtdFMA/x3A6t/GrbMv6WFw6Q0NMbNfM3qQBS/8poMkuNpTrjw4zMG4rdzlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-844cffcb685so250360939f.0
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 18:57:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738551425; x=1739156225;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=taZkzbPcWommzNW0oQ6L5QeIntuRolLm305FE5I+P5Q=;
        b=qEx8AHB1UqqZdYnOwZw4E/0AcBzaIiSCFe61NTWDTsXCIV07YEbwIE7BFwxj0GEkNm
         vlnHaReWdp9rJXoc9mltq6ar4+ioTwmhIG9vjxxWFFCJSqLhNpuYWRtnX1ITY0EYmEKU
         L7bfnaKf7+PT+ekje197YMJybH1etKbNsTPCqpNTpn/uq8YFoSA5Phvf+N+IAXGtZNBE
         M4tNVijlnrn7ZuZPv028CvCPUsS9GRvI4XkTX+alHRs7/txmHu7+f1XZTNqsaB8zYJAP
         kTYcMHFM8o9mBi1PDvp0bxhuTUJM/+edZ3RK31FK5WF+F3GLZet4AQ0SQLvxNyLqk9MR
         +u/A==
X-Forwarded-Encrypted: i=1; AJvYcCUA28p8pK80zO+3pV135H1h8WNBogEEl4ym71pFqNZEck0P49AEpZQ0/VMqdQbF3P5ag/0UuxsDJL5og3g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx1X6TkC5WHjyHcWxbuGrFlCIA7ELQ8sP0twOptl7BTDBq8ZqT
	dFsKHeAOqL2OMD3VRv/3f6zdDTHhgwHAu1tZ/X/TSayskCJnuiXhmQnmz5O9OzY6ywatwLThB8d
	V+kfC5OTz6eJ0rqGfOzrP9Y2Jm7JbJ4MtAmbMzHiQiGl6RbS5ybXP1Oo=
X-Google-Smtp-Source: AGHT+IGHxNcHZlHyxm+GVpx01+9vjCErIwlNHMUhvKIqcpPfMkyEYzuYnO2SNMvgbzsF719qd273hYjw5CLU7nq9sDezSwo38/Wl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:184a:b0:3ce:900d:6b12 with SMTP id
 e9e14a558f8ab-3cffe3cf57cmr148299685ab.13.1738551425567; Sun, 02 Feb 2025
 18:57:05 -0800 (PST)
Date: Sun, 02 Feb 2025 18:57:05 -0800
In-Reply-To: <tencent_2D66063C753604966437E44B8A7423769B09@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a03081.050a0220.163cdc.0036.GAE@google.com>
Subject: Re: [syzbot] [fs?] KMSAN: uninit-value in full_proxy_unlocked_ioctl
From: syzbot <syzbot+8928e473a91452caca2f@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+8928e473a91452caca2f@syzkaller.appspotmail.com
Tested-by: syzbot+8928e473a91452caca2f@syzkaller.appspotmail.com

Tested on:

commit:         2014c95a Linux 6.14-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16fd2eb0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aa4f01a8a3baec54
dashboard link: https://syzkaller.appspot.com/bug?extid=8928e473a91452caca2f
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1710ed18580000

Note: testing is done by a robot and is best-effort only.
