Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FF642056
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 14:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745765464; cv=none; b=hd8xD4Bh17TRP7OA6Ct/aketMYqUcDxH6bQoD7cQyw8fddiY1COMuLMcNoHkVvdfQrU0Pcdf53eXdXMgLZpzROmGjmZe1gfpjHRDaHrFbQS2djhYzoYzUg+4ZXzHU98q0A7feNfraT3KOpX1bctAs+eAkChzNDew6lGSRzaaO0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745765464; c=relaxed/simple;
	bh=JTC1ZTM27YJPJjsW5CY8+JXzB37BPZjRX/s4HydbeF8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gvcWqXpejggU2q9hMSNEYVhQOdOBCqq6S7eRV+LQ5np6KfbeAVVgZYYr8vrvntI/BBe6XINK7xrgp3T4VddqbqfQDu7dDfuo3+pxyVA8cjHS8RsttxM6m1dti9qn039lpp//LQ92JkS7f39h70ay5ugNAkuN+l+3f9nveezs6BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85be9e7bf32so727299239f.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 07:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745765462; x=1746370262;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bl2iY4rRdldgveGAajnRt4QLAQDUhtfabCPqKYtzafY=;
        b=DQAtbrTe5NKrrkRPAJkpTHXK/thY5v7i8w4U4NZtaDsLye0pBXD5G8qhSUB/6eLVT5
         vtIHgv6+vnY9Y849rkQ/5WoP9LoYlOd8H3mJhERoUWAfIUC50f8Xz5v0kOeDfktoCfr8
         IQmHUhQamRCcgQVtWmpL+6fUNa0QQIQ82aZYtGTpXNLupnkMmHhqQDD5C8wIxESuwsIt
         5t6DuuadGdMIfy63HNyGz5kZh+FNfU3l8fH4mdywsUEGPZfm8W69UU0jT9z5LhEaOcjn
         Mhlu0Ks8hM/qZ9TT9dCsUXE64PuoXmYV81C2+uFqXHXlMK4nwDv2xVjkf+PLB9f4L0OV
         m+FA==
X-Forwarded-Encrypted: i=1; AJvYcCV9wBDoHgPPiq/PGc8ReJQPiX3MK71JLqaYmdIKW9pQXcLquvf5EJMGII9pAJUNPt1r3J2Wz5j7fsMujdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyx+zbtDMd9vthOCwGhgNDziVm1IV4ioRd6A71lQB3Ig3nc2tu
	kyYUkPBV+rXAvUd1L6/KZvnwpw6b8gAxsV94D3Dn3Fl7gXybbzjRCgF0260ePRjeivRaXEGcAz2
	m6dMl3pSwv2SATb9/ZLHpt4BYcWIU7HPiBcahuBbNgmt87XPLtlwjrw4=
X-Google-Smtp-Source: AGHT+IHnWulWDcmRIhqOSpX52aohj5vWsDsaiaZdO3a/aKT88I3SzVYQYaGzJil1Ssz2j1slMiriQQkAdxK2SAJXliXfm5VinJF/
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:15cf:b0:864:5a0c:84db with SMTP id
 ca18e2360f4ac-8645d24b339mr986715239f.13.1745765461861; Sun, 27 Apr 2025
 07:51:01 -0700 (PDT)
Date: Sun, 27 Apr 2025 07:51:01 -0700
In-Reply-To: <20250427142723.72473-1-duttaditya18@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680e4455.050a0220.3b8549.0082.GAE@google.com>
Subject: Re: [v6.1] UBSAN: array-index-out-of-bounds in xtSearch (2)
From: syzbot <syzbot+7cb897779f3c479d0615@syzkaller.appspotmail.com>
To: duttaditya18@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-lts-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+7cb897779f3c479d0615@syzkaller.appspotmail.com
Tested-by: syzbot+7cb897779f3c479d0615@syzkaller.appspotmail.com

Tested on:

commit:         535ec20c Linux 6.1.135
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git linux-6.1.y
console output: https://syzkaller.appspot.com/x/log.txt?x=157c30d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=74f095942d812894
dashboard link: https://syzkaller.appspot.com/bug?extid=7cb897779f3c479d0615
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14ac30d4580000

Note: testing is done by a robot and is best-effort only.
