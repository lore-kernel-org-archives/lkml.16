Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A30B2B9A9
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 06:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749019625; cv=none; b=osfDl+Nsg0A7yktmXUg4bYoe/z26oBdZl4yEKYebDLFGTClJ57wNH6Sk7wJMhEX5+OvY07+sFnb19jNI0uTu7BVtbSbdzqsxRWOPeMNwPD2gIm08L7MbUrfu/s5Bh+1Jy/zbA+JzIfEKBRtHHPOs7qqcTW0GO2K0hPtcCsfEgc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749019625; c=relaxed/simple;
	bh=eDXdk+GkyMxGhiDh/2RyCdw+SdD+p1FjgmgPrmlrSiQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kbDGIcm0EAXu492GUhDrRjEdC2zT7Z4mvpa9mr6FjXaMQaSzW/gPmRZUAYIj3z/IK9dPpTXM3TR88WDXs920oE8UjSOh+j8Qk2YCY/p4ZFUeOFxV5QFcMXhzYYHv1vBhYKziwfI9OzBjrNvk9vpUmjfw08ucAyvU4wumEw9DSDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3dd7e0c7195so63667725ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 23:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749019623; x=1749624423;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3NrKKTZ0Zs2zDwDxnycgMiwtoHzwdTv/6ei+AkKJlc=;
        b=dKkLgJnfgVC0gi36lTywDGSRbwJrpsRrZCc8ronoks8NYzn0e8bjFVTe/DQ36598xF
         OKtV/kbFtAmGE0BImxozTnrVcxOiHsrhF9OEMA4e1WuTkShL1PQUaGQy+LpHjl+6ZusJ
         LKBy3ZZ/rjKt6bnWZS7Xfcy1IL0sNiexJzwTTO2GoNysEnSQwbWHlC0IcauTvUdZnQL+
         eJkdjOJuT86oZSAg6nOUQtRdNqIsLz2i0FppvVI/Ss/aqQeiXNqVfCCyFHt6aTjWNQRh
         v8fCT+s5gSr8OY2kgC2QGlFTS6x13nkT0F6H+FLzquhgApSYKN7VQz6Q7k8BxVD9zQIX
         8lLA==
X-Forwarded-Encrypted: i=1; AJvYcCWHph3fkgMf0El7GhDclVAj2vIUPujg/aidgOwF3CtuVbaD4ApoYy33W7pHhunWS1F6iZiS7MRsvMkAVz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXSAA3mKy/5+vyvbwu9fwfef5e37l86YI6s0LrQnO+yJ5OyDtn
	33AZTnpfhxDtCPL2ZjKHRO8R8+04EOd70388X23l8kb8aQkDnCcuZ77YM0ZAoUWBmUVluDpCYMM
	RFPF4YujBKn//ynnqf6G0gBr7e8UUUXmNRLUgEUcxs2YMgvV3w0qgANfWevE=
X-Google-Smtp-Source: AGHT+IHfB12PChVwVdRSgVENmMnygOcWXaMpEE0qQTWQbF6p3crjXgOMQmeevgdvR6px1T2ccKGOm0RO2hqH2EXDMiYTMfVWW3OR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2169:b0:3dd:a13c:b663 with SMTP id
 e9e14a558f8ab-3ddbee3d73dmr15524255ab.14.1749019623244; Tue, 03 Jun 2025
 23:47:03 -0700 (PDT)
Date: Tue, 03 Jun 2025 23:47:03 -0700
In-Reply-To: <tencent_F2697FA3B36447577E176326C65365E37905@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683febe7.a00a0220.d8eae.007b.GAE@google.com>
Subject: Re: [syzbot] [jfs?] kernel BUG in jfs_truncate_nolock
From: syzbot <syzbot+630f6d40b3ccabc8e96e@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+630f6d40b3ccabc8e96e@syzkaller.appspotmail.com
Tested-by: syzbot+630f6d40b3ccabc8e96e@syzkaller.appspotmail.com

Tested on:

commit:         5abc7438 Merge tag 'nfs-for-6.16-1' of git://git.linux..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1673bc82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=82e79780b034d72f
dashboard link: https://syzkaller.appspot.com/bug?extid=630f6d40b3ccabc8e96e
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15f3140c580000

Note: testing is done by a robot and is best-effort only.
