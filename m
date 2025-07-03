Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ED32D46D8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751541304; cv=none; b=Ba5m/7iRknWw3UkbNS26C/a7mPCRVg3DjBqd9qZQN0XnLcQAa24sDg3xB1zPA00gkA/x13fi2Nbp0PU4i0MkMRR/GElPn7KiSZEcmp0xWY00XplcsbivdUD4ClEBKby4aZHOrWvR2rJW4kuFHoLbJB/b6d+5PAPOURDanM03NEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751541304; c=relaxed/simple;
	bh=vRKnpRsIAB/r5T21LdDUfHOj3DxRxNOgP8vUopZZG7k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mwEctowrs2+du4BMy+RioWDqGflPWGvtmRi8d+lHys8NYc1tHQ4XGYtjfo5+cFCDf4pzcZyFA0TUDjTs5xRT9mlwCBv97J9XoHmrdeQH+HUxsHYDC9/XwdzgXMQb3OE/t3801AuiKnkClpCOgp3Tq9gHVvwsYvt8QOkukb7B80U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-87595d00ca0so772055939f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 04:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751541302; x=1752146102;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9g70o2n1QMsYn3CqMuAU6rh5DAU1xCKZ1yg1UGSr3So=;
        b=Uh4V6TdGGyxcku66auVKoPtv36IeRUa6tPRklC9yr7TBupv6qMwIHU5T75kkViGQUV
         Nr9VvLudn2NPqX/julEWfjrNX0Bzo3dXPVUl+TjtC4QC8ZRR0sNNX2ukJASmsTKmehgI
         2BdWxpRO77HcQZT7/H6u9Jd3wj9mTVXwWjxwwcl+t3QY1JZEEYkL7dD/52Eht8LwF32f
         iNWZT9oeE9GZcdZdeMxe+1KcT+uQsc4gYtLuV3Tb5y1usHhv9Q2CIAbbrLDJanqVQIs1
         DIKxCARgn7tm/4tTPtfoGkXBW6ylAhBSYxRSOo32D6Cyx6wcb+ZpO6+ZC3KBK2IDdToT
         Rm2Q==
X-Gm-Message-State: AOJu0Yx43geyTHhstUZvmH7BFRhr+Wj0m1HMU0KCQLq3zpMI8Ggdss0q
	gx0a3FDrPt4p7HSdNX+5CMXfncvqBv2EpydPj8docjVzSYEYDveyRSWOJRnPELVf/u/CP0fQh/N
	2I7/xcH07GF9Rnom32vp/P2yplI1HbS+kfrRRUANHHPaIjAXs5S5QnshrnnU=
X-Google-Smtp-Source: AGHT+IGNOhJo8lYJ7FEPCwGTBKdWvfZHe6F6tRQu7utLHVCahHQmnGyUvQznUTPXaOhgOvXM8itJ42kTcnnJHQTIS28PCVG/5Gmh
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2502:b0:3dc:7f3b:aca9 with SMTP id
 e9e14a558f8ab-3e0549ae11bmr72159315ab.14.1751541302290; Thu, 03 Jul 2025
 04:15:02 -0700 (PDT)
Date: Thu, 03 Jul 2025 04:15:02 -0700
In-Reply-To: <20250703092424.1896345-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68666636.050a0220.37fcff.0002.GAE@google.com>
Subject: Re: [syzbot] [fs?] possible deadlock in __simple_recursive_removal
From: syzbot <syzbot+6d7771315ecb9233f395@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file fs/binfmt_misc.c
Hunk #1 FAILED at 734.
1 out of 2 hunks FAILED



Tested on:

commit:         8d6c5833 Add linux-next specific files for 20250703
git tree:       linux-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=70c16e4e191115d4
dashboard link: https://syzkaller.appspot.com/bug?extid=6d7771315ecb9233f395
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12fff982580000

