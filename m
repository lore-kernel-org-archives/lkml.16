Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3767E1F8923
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 15:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738508885; cv=none; b=cSc4xTF1eCgHI7j51+5oepW+17dHIvBMHdnns940DEuTO+ESCcr+Gj+rwemjpLzu1EZY5zVGHVDCVtuXzWxq5J3NAhdMpAZLMmxEAcJubHg3CKNq7S0cDJglE2Epwyadh00LbI/Bkv3dMgBnymm9HZMbqTOrvieitttah6oqczQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738508885; c=relaxed/simple;
	bh=X7yd2+qFNeEAS8UzBFjEEjjbiRWfQSFMD+J2voO/PLA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=e3c59XWoVYXrFhuQ29S1muRRwM9rNBlpbmksxuaLYGx8EkJFQRmA7Xs8goH8zzYmcUyXaFHfjV34xgVUUtKn47NLI5mCxVT9PtvKKOscADu4P8msqWhLmIn3C2beB8/LHMqPB+w72vBN/Ge8gDXwy4dS5ywJvKmX5BxziRNLP64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3cf6ceaccdbso26988255ab.1
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 07:08:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738508883; x=1739113683;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=as8jRmBqhydUDXs/90pySCuCHeb3fP0O7KZ+qpwNogc=;
        b=wFdO5L08LK/WQlo/Ul5PsiprkeVzB2pSzHWDHWhgGL/+wxR8OysbpZg8AxiTT2Up7b
         1LPLGWWWyGgf9hqwQcQxJm55/5W+U0iRe/Q6z+TOFZsvINkCi0qKzpecAOGK1DVlG4M9
         QKEpamoO50/mpyprl3cWcHygM7B5g9pKcXcIGOb1dSIirYqpnpbvxlpdNslIK1i7+y44
         WYlbKKy2/4D93eAbHsNohm6Y5/HGcHHUibu3WG6p8fxKpZbBLYZAH9NIpo+2+vprtVG3
         F5QlbpI8u0YJcmkeo7ZbfsBVdZ5cYNRxrrZaL0tte9AFzUrNm1JXAP+YdVbV/guN5/kn
         EqrA==
X-Forwarded-Encrypted: i=1; AJvYcCUOT3wKJ111j0LbNJRSzTOv3DQIbhTn94600YBhqhbmk9OK0YxuMebRBaSKxGoNTzn6YBLzX0/NcTk+7X0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbNDXE3vYr3XxOJ6p7npKt22nbNHTmSByQAxzhH5IE0XmPOCHC
	rg/xp75IUQTQd7t0O5lTapB3vvWwOmhEI15bjGqsQXMPhhklpcH+9jkEwM652ExzINeKYwWHfF+
	hfZOLnULLbeO5NMUxcu2omLKDoulK3I+aVZafhtoaLIH+F2ha9jlhclg=
X-Google-Smtp-Source: AGHT+IEyT6hh3PLCefTt8R5zupg7eSLCcrw1zcw0pQj/rzpMk5ZriYXQfwbK7UrNl+4HV97Y5tsvO9wCAJT+mxxtrZoX+v24BD8O
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca4f:0:b0:3d0:24c0:bd4d with SMTP id
 e9e14a558f8ab-3d024c0bfafmr51172895ab.18.1738508883278; Sun, 02 Feb 2025
 07:08:03 -0800 (PST)
Date: Sun, 02 Feb 2025 07:08:03 -0800
In-Reply-To: <6798b182.050a0220.ac840.0248.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679f8a53.050a0220.d7c5a.0070.GAE@google.com>
Subject: Re: [syzbot] [xfs?] possible deadlock in xfs_buf_find_insert
From: syzbot <syzbot+acb56162aef712929d3f@syzkaller.appspotmail.com>
To: cem@kernel.org, chandan.babu@oracle.com, djwong@kernel.org, hch@lst.de, 
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit ee10f6fcdb961e810d7b16be1285319c15c78ef6
Author: Christoph Hellwig <hch@lst.de>
Date:   Thu Jan 16 06:01:42 2025 +0000

    xfs: fix buffer lookup vs release race

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1193ad18580000
start commit:   69b8923f5003 Merge tag 'for-linus-6.14-ofs4' of git://git...
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1393ad18580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1593ad18580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=57ab43c279fa614d
dashboard link: https://syzkaller.appspot.com/bug?extid=acb56162aef712929d3f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=174cd5f8580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=162e2d18580000

Reported-by: syzbot+acb56162aef712929d3f@syzkaller.appspotmail.com
Fixes: ee10f6fcdb96 ("xfs: fix buffer lookup vs release race")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
