Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9421B1885A1
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738949467; cv=none; b=B2l/cTV0gwgObmMPHuDf1nxY55CxYxFq9h/5BCAgukuzLuKN1sod+AjBgFm5Yp+J64HqvtGu8WtKnUgLyEe+gCjn6w2zFpmE3Utky4t4vphmS6VdKZDLi+EnT9nxAESwdTdSo1/chVZhBIpLEs+pkd5ITUSoMQm7d394gQh0IL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738949467; c=relaxed/simple;
	bh=F4/n/5a2SPTW2mOWF+s4crKdI8pSu7RmbO0NknBPeps=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=O3fe+UYuXGiRCrmjAX3vWPh7huCSNZ1bVqRUigKeMD51YdmRIPVQvacb7lsC53Pc2/RmvYoKCv3HrCpG4f75Ozw782EIdtuCaMd5pDiLHj/XC+WKO9+OkjvHk5USmMDfHcGFPoFwMOun5Lbn9C1oboecBI0tq2dT4ZWsCgt8/Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d14950ac9fso7003695ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:31:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738949464; x=1739554264;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IIidVZnoPyHE8hGybcLCMrD/Gm+9vdgvF7KS4YMnVXs=;
        b=WGRXUfOtSkToBBFZ9087pm5iEkXmcJDklvgkEBjZkLJuijfb4oYVcuKkiAZMiCfqeB
         mwCfBR3mrpOjKFzjpT1ODIqnC8gkwmtabF6SeJveMLMwEP1rXCGQGgpK/YBUaQnjzkWt
         yIGGTZ/Ic5LAzPuVDTl8i+3C12m+ishswefDc3xGnjaDDfVdOKQAmxN6W+E2XXieSx1f
         jk8f0GG8D6ecvwYFQieSQ1/l6t85tfLaP51e4FPaf5wa5X2AvlkWjCAmcfFAORxYN+Be
         ZywZEiaE2tPwUYuEi5q/AqUvZKaYZDyAVCdAe+buHL8bYy90AIF6d5YIr2zK1PzmQLrL
         3AAA==
X-Gm-Message-State: AOJu0YyOlg1IlKO+37fJCMaP8h4/BG8vzLmXWV7kS5+lznIiMmn1VD/R
	raYc2Dto4Ugm5yu2GCDj3AOMGSXXYaATuP+AZkdJmbTYr/Rf0f7FhmZ2nB82Boxk63Rj6Xi9CJr
	2vt5r4+Y6WVCJSL047MZlKdCVjzDxnAwQM0z1wlsg7UpyJw99ylBEGIM=
X-Google-Smtp-Source: AGHT+IEyb6DmPpLZYdpVtXz4teIgrIRUvkRYTy8L1gdi11g+k5H7DI8JuAmvAlE5EGJ2++j6telw/uAVFzYMPx/tc+4QXywtnu6Z
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2163:b0:3cf:cb65:8c74 with SMTP id
 e9e14a558f8ab-3d13dd252c3mr38436795ab.7.1738949464548; Fri, 07 Feb 2025
 09:31:04 -0800 (PST)
Date: Fri, 07 Feb 2025 09:31:03 -0800
In-Reply-To: <CABBYNZ+usqU-KkdF=47qLh4u19zu_ao9U3tVXwAJyUZ5OkgmYw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a64357.050a0220.f64af.0002.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] BUG: corrupted list in hci_chan_del (2)
From: syzbot <syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, luiz.dentz@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com
Tested-by: syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com

Tested on:

commit:         ed58d103 Add linux-next specific files for 20250207
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=12dca1b0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=244a34ec1429746
dashboard link: https://syzkaller.appspot.com/bug?extid=10bd8fe6741eedd2be2e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13538b18580000

Note: testing is done by a robot and is best-effort only.
