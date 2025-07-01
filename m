Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED75C270ECF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370548; cv=none; b=s27GsXh9NmHt7O+FJusE1ZPgUvG0hQGJ++8osap7IcsZ5B9Ea7RmLzHTjcnV4LO/bwqMFpYigwGLRFqdpYTnRGT+129UxTCNgIiOSSN4XVKe6fPImCgIOfS9p1gLM8iE+4UztEDgVrm459GQpvFAcKoSEbFq/boJ/KXscxWAyMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370548; c=relaxed/simple;
	bh=xiIu9Q+JBQzhP4JV6yKGx2gC9CfiR3waDVSEfFo8xq4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ArsK6Qu7JACJ4tebN+0Y6lD3JCZ7W6x05rN1WV9YJWG7lH+f9wkZPNvuC+aC6s+tOqXAr7W4H/YZ6Xzyxq1XPzu7bsyvnQCVxZjWlpP/WyUlMipLLz4CyCYStFwEP/t+EKnz/UhHvASAcT8doDM7F+xx5CP8Qdp+tmHn1M6Y0RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-876a65a7157so205225139f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370545; x=1751975345;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQ0Xe1Uj5+T9e8E3H7IPeQ26NrnIPkbEwt6ppjAKp4Q=;
        b=JrTX7pDjR2CeYMtEZRpY+s/LW4jjlRW059EWv6KIOb1fhtl/AXL16/qBMUAzyczdz2
         t1ZXUNLQaFhzlB+EBbGcE11s7asBVJYOaNkhc8G4bnnvTeQ2qPLOUO/zSCfMIRHzPffY
         /ONc6E4AvEYaDWy20sdpyRgfP3r+3PfFIujlhkY7aiWGcPaMX5tTXJZ5p/FYg8P1wsx+
         Vi7F8lC5FfyS4ki8LlMXwlN70gt8o05tF48OoNrDd3iHgHYZMk6S9OFJHP7ki257Q2iG
         wu7YGsMpXECpIeXqwI1VObufolUeVu26iDz68r2GO+ERrA4EFUIuV1rSKTwNR5ojnkyM
         S/tw==
X-Forwarded-Encrypted: i=1; AJvYcCUe1VBElxnC0no0CwKDX7ZranW8mzl2MHlNAx2Y+mLLae6CQ7W8SzMtgMVVXyVAAH9icu6sSnNI3f8eJgw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/DEaWySAa5/SCa0gV869h54BNODatHRdRz1fec0BjtSbqteG4
	eovy4y4pXVberhr0YIZX3EoKjEqmJSEnIBQjqq0+VZLDRaswU8ql03NvOVVmhA865cxBSMiV9ps
	O1+NrmDDaRX1OW1G1viPSumstu7Giex/EObqUlfmE8/7VbTfp/m9mDcQte4A=
X-Google-Smtp-Source: AGHT+IF79EafPidSDP0318VB/7YRn/CSPQgRFERBA5FUlb7uKudth/VXbf1J3eVwpxkLZITrznP7bmcHlN/iS3ZpYyhE1CZLvydt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:7501:b0:876:bac1:f01e with SMTP id
 ca18e2360f4ac-876bac1f2ebmr260342439f.5.1751370545082; Tue, 01 Jul 2025
 04:49:05 -0700 (PDT)
Date: Tue, 01 Jul 2025 04:49:05 -0700
In-Reply-To: <dea4c772-21d6-4e1e-9d16-d3d17e6aed1d@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6863cb31.a70a0220.3b7e22.19f8.GAE@google.com>
Subject: Re: [syzbot] [ext4?] KASAN: slab-use-after-free Read in __ext4_check_dir_entry
From: syzbot <syzbot+5322c5c260eb44d209ed@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+5322c5c260eb44d209ed@syzkaller.appspotmail.com
Tested-by: syzbot+5322c5c260eb44d209ed@syzkaller.appspotmail.com

Tested on:

commit:         66701750 Merge tag 'io_uring-6.16-20250630' of git://g..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1476d88c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e29b8115bf337f53
dashboard link: https://syzkaller.appspot.com/bug?extid=5322c5c260eb44d209ed
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1783788c580000

Note: testing is done by a robot and is best-effort only.
