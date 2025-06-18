Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBF51A5B86
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 03:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750217405; cv=none; b=POu4BkHkU+D1QAK6WUmPknaRy4iUpvkLsT9Ewm1dtlEd1wdM8Ze4TXANyhMKrFFc0oe1tTaU42KjjQJaP31zu2nY82+FX+xshTypy+/CIb5ltD2DcjWwt6HBGyxDuNtKneGiAXOgzyGgZdFJG4PKJP7NPYsn5vSdhWnRyt8TBKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750217405; c=relaxed/simple;
	bh=MIrx38yhflhRPxfPU4CG9u4ujs/+oCrE7hzyBZCfS8E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MfOOJVtdQlPBqYVb7x8r5yXMDXYzZyc/QUsxasCOhA3C1pKmEyLNbeuZ1rMGGabmo1GEO2pLJx/smIcoVYKX0TZ7MMWYOTlZL/mGb+AQ3smefhOw5GsTcuB+EyG6DS5oJGK9R/UWLtmT1OXLDAyRv5/vSsc7fJ0UnFeTBX5JrJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddc147611fso135448715ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750217402; x=1750822202;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lCm2kR01kn2GozQMW1I9fi8WsZ8z6plEJFJrlTMSkto=;
        b=d8iZNFeVz3o42ZS00YiA5yROL8le/0IQSVytSmVE6OxZTRVk7hFX+q55NAAvxCTOlZ
         iGKqUc74LbSE11nuuDKv1Xk3AlccSNEvgMJwTpKepG4RNMUSiPdZ7YGJhC8nhAQREWJP
         Vt9V/V9tMthRLcxccgVRccUGH/1AcVchCb6YHzgVF9+FgBwY960t1+gcdElbyTF+Mc6O
         gIdFjU55vj/tvM2TPMo6ZOu00l2Zq9x6Jyh/5Yt+d0pMORWHs+8+cAbFSdwp5eOKP6Rj
         gHAbP3Ce+Qa+xzcsLAIe8Wuh18SniSjWY2eTe1tI8hpn5wUpS4LfCGXbR+YQP3E41M4/
         jH6g==
X-Forwarded-Encrypted: i=1; AJvYcCUy7qamSneMwx/jr3AvzdMnkv0pEzLze3nd8Xmel7TJolJxhyJUqsQmmc10XeCbOcdIgxTtpKYq7G4GQIc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1y2O2sgdAAgd2k3a5Aa3dQHYaN/hEbOtnWUMZp5p4W7S2Ss2E
	7l9V0vPm+yifne1g7J8ns9eT/SAu/3SudpvuP/6lbny1TN53qSukZ3IRrtt9GnRBUPrsR2glk80
	kr3WyOXsDPJu6WIt4GHFizkZNyvdyO5+Rai0AWwFisT8AeA5pAXbfIXObHQI=
X-Google-Smtp-Source: AGHT+IGFK240/5rx5XwS4Jpc1NMssdUHgjZsJ8OmH+KOtZ2O6EVYeN8LysAJ84qb4AbH0/hSNmGp/quVXx2chLPGzNZE1jRtYeFe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:398a:b0:3dc:87c7:a5b9 with SMTP id
 e9e14a558f8ab-3de07cd16ffmr189515305ab.10.1750217402656; Tue, 17 Jun 2025
 20:30:02 -0700 (PDT)
Date: Tue, 17 Jun 2025 20:30:02 -0700
In-Reply-To: <tencent_9967BB8933B49E4B1B104B091B6325E5BA08@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685232ba.a70a0220.395abc.022d.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] general protection fault in pick_link (2)
From: syzbot <syzbot+1aa90f0eb1fc3e77d969@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+1aa90f0eb1fc3e77d969@syzkaller.appspotmail.com
Tested-by: syzbot+1aa90f0eb1fc3e77d969@syzkaller.appspotmail.com

Tested on:

commit:         52da431b Merge tag 'libnvdimm-fixes-6.16-rc3' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=143ef90c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6a237c32900fc479
dashboard link: https://syzkaller.appspot.com/bug?extid=1aa90f0eb1fc3e77d969
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=104ef90c580000

Note: testing is done by a robot and is best-effort only.
