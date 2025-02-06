Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A609E146A6F
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 04:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738815245; cv=none; b=EKB+IDiZ0hMz8Vzrp/ZujAbrT0Cbk5M6oYeZzcH+o5R912zH+95Ziq9F93WomoOZUsGPUtdKtkJifxR2DO47rE6QYEqTiRek9bXxd9y4hzlzCnNkcGLtWH32ciBuZbqh3ZHpASFgCm4eBMP3WTojKFk+q2uC94WTOAnS5AwD+ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738815245; c=relaxed/simple;
	bh=F+4xQ5qTrvJuJo35mJWNh/cQ6qhChTu2/BP37p56TjI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Ywyvb1xHxr+oggmE87xA69fhTDK/3e4w3lnjrBlqLwGdyqa5EO+QQmORl55p8XkBXEN52kzr8PiO0BaozOb6Nlcr9lYTQt4/Xdb+4IUF+bItN+bIjuhVbFWkQikPGx/wAKoioG+JxKWkQA2+b1gBIC3AsSoN6B8e8k8wi8lFmrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d04db7732cso11909365ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 20:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738815243; x=1739420043;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NLObZFqUmhvJjEHToh0EYrUYWxwKIPdnzPfXdGavApE=;
        b=k8qILgZYUScX7Yrx+gRnu365YXOJPkM7lM5tXnIQf+4hIZuJ/FqjBgujya+waA99Mk
         knY0+r60UMDZbbBxl7Lfk25s/H7D9EPZkFH1Yp0KtN5NG3TifHw5A5GidcsR/0H8QOav
         7DNmWY35jWdBsRH8uX/XCoo4dIUyAxJ1sLVr5KyOMECQzRypMb+yGxd20Z410ZD2s/1h
         n3gwTCpHVaWjOdLE2R7EFRmB5jxO2gGpYUuPFHZQ3td987se50T5BpbGrT9kXmI56FWI
         QakWf///+a3Dny9WbajHFq/AZUmwmlA4EeajJHjTy2TNvxJZd88z9syMpTba6QxhRZJ8
         NNYA==
X-Forwarded-Encrypted: i=1; AJvYcCWeMttaKh+t9QxZeZ1yL6akW/J4wiV4kTNH3idLjJkQ0H3iodY0I+Fua7GuYLDiF/jOhDJe3rxbD6aILqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOZpvMrTd6UAfBq6JRz/NapLvdbSr7q2Bh9NMqyrxqvtwv3gOf
	eioXdlHG4KiyhK7ZGOOKf+Ra0VzK2vgtz/l4g3wIk9+CNOzgEIX7V7IRRfTaz5lsn9IVAXsQ6z8
	fL54js61I+CzjxwFi03g1rWlJIlWK4AUWqTn/a5sKcP4YCgH7PKIitdg=
X-Google-Smtp-Source: AGHT+IET5jTrlrcy/GSnxoV6CEdBQL6o+QlP8M4tm6nnRLqTI5o2Xo7DwE7+9qoRBnkWaZWtJ7aQLWrb+tm5376rwqMe6bikIVmg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d1a:b0:3cf:fb97:c313 with SMTP id
 e9e14a558f8ab-3d04f8f6ee9mr57356905ab.18.1738815242810; Wed, 05 Feb 2025
 20:14:02 -0800 (PST)
Date: Wed, 05 Feb 2025 20:14:02 -0800
In-Reply-To: <tencent_447A36884A8A75C577A166683D2336A09609@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a4370a.050a0220.19061f.05f4.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in usbhid_raw_request
From: syzbot <syzbot+90ac8355c8ac84b1b464@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+90ac8355c8ac84b1b464@syzkaller.appspotmail.com
Tested-by: syzbot+90ac8355c8ac84b1b464@syzkaller.appspotmail.com

Tested on:

commit:         9682c35f usb: typec: thunderbolt: Remove IS_ERR check ..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=15ca81b0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ed7570f7f6046a71
dashboard link: https://syzkaller.appspot.com/bug?extid=90ac8355c8ac84b1b464
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11b481b0580000

Note: testing is done by a robot and is best-effort only.
