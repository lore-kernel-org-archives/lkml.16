Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9508FEEDE
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 00:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750899185; cv=none; b=s/V3dpG9QqXwHq9sHhiO3rH/S4XTy1uK2qwiHYXosTfnHmdsV6zhMTzNkIigRWhxn9SlLD3coIIIPpR3NgcFv7qZ0MbPSfhOlkDN6lD6r1IFV6C3FLLZHUAtI5c/9i1dzU5gyZcr76OM09vT/0A76SAreA5m40u9C3qOjeTC5og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750899185; c=relaxed/simple;
	bh=Qg3fY6CxGKKOab0IvW2+zm3jSFlm0GbzMp9DMBL7aV4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=YruZk2n/TuDfn9eon8AFxC27dXl21CyFirXBjGBemAPL2f/LO7HTCpycDkKpbHxFxLUys8oiVTl7mxG44uvTyX6L40LtY1cQ1izactD6m8R0MjFeYcPTskr17SumogI27BxH31pWHNGalwkDqtNNvFOj0+WK84rvOEzTYncwIAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddd5cd020dso7951915ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750899182; x=1751503982;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zxHfmSdzLN544l/dsOQjyaf/3DdjAD63ga+X+h4SxPc=;
        b=Zct73mdWLzIM+wFLejy7lXJk5ToxgaPiQKhA8KTcS5QYxp+nma/hLmj0b4o/KTedPg
         dHlOwRnZL74myUGwHZiZrW2jNHU+JMEw0/4FdyVNuyhDuWA9bUjSpoP74iZi3wymbrCo
         BgI90r9CjcMYtO3U3GdXFrLFIFUb74K8jKI8PSsgj13OxKi9Cwth4J0hKrp3kQ6o7hxQ
         MbofHy4o0Y9z2mMzVO+WgBGHivOV+Y0IWxyTNAf3oPgj6272xm6375erubSF1NXyopve
         UiKCoWgUa1OEHpGSW+sjGQFGkKUc8tuesT+vYXQv9U9YitT5r2aSL/UvDJU6Lkt9ie3T
         iu9g==
X-Forwarded-Encrypted: i=1; AJvYcCUMmmOWaUXB+GFKG3vB5UsvQBVldkS+mv7f4FGqibdo/V/VAeQtFwPVu8/Lbg6tSWPplQahzPFHNTnIl3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZkX0Qf4y7v+GaVytQcJQZNk9P8e3YRSdC3Ldb8//szFG79ioQ
	RHb0Iy6dwJExL4KvXi63+FxsCB4baH5m7Qq8KHOVYtdBLEdAbaGl9cw0DQ7UrSoe0FpDoKvUS+y
	3BuTsOKunJb/2JrkprI6ADHNUbX2xjz9EWzLkZH3qMZPsNNSwn51PnUWYlnI=
X-Google-Smtp-Source: AGHT+IHQlTIBFRwhb0bGHkVoC+YVTyKbqOctaH9/5gkj6IwLfAtk4rH9GWSCYpmm2HArN9M2qbQtvqBQUw583TFDgfaLG3MyOsEC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3a01:b0:3dd:c1ed:d901 with SMTP id
 e9e14a558f8ab-3df329511afmr76352535ab.21.1750899182762; Wed, 25 Jun 2025
 17:53:02 -0700 (PDT)
Date: Wed, 25 Jun 2025 17:53:02 -0700
In-Reply-To: <20250626003001.1826-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685c99ee.050a0220.2303ee.00c5.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] BUG: corrupted list in _hci_cmd_sync_cancel_entry
From: syzbot <syzbot+01fdb2cc3f0b4ddcfcf1@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+01fdb2cc3f0b4ddcfcf1@syzkaller.appspotmail.com
Tested-by: syzbot+01fdb2cc3f0b4ddcfcf1@syzkaller.appspotmail.com

Tested on:

commit:         c4dce0c0 Merge tag 'spi-fix-v6.16-rc3' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=165ef70c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=641bc01f4fbdccd4
dashboard link: https://syzkaller.appspot.com/bug?extid=01fdb2cc3f0b4ddcfcf1
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=175a3f0c580000

Note: testing is done by a robot and is best-effort only.
