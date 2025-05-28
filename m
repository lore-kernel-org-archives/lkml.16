Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD4F1E8332
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748460258; cv=none; b=i22V5Ujyz0MaW1GRX6gtTgHLskiW2ZkHnELkRLPV5Jo/cDRU0I2gOqh1Xh4fhoUparXbv+2iJAqS5Se4Z7kfQ6wtq/16ZmewVYXxXIG/9OAeFj36dK3TAaNjbT3Qjk+FA8gPCvoYWjxtTHuzT4ACZDrHD+5bodO+gG0K52BM+wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748460258; c=relaxed/simple;
	bh=HGwRJgKqdLb5DEAp4lRsKdZmgQ6lIQ1b7tTWsWR7vrk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CK9eu4EH6O9zVlwVXOyVP014Wq4V3WgqIauoSt0Qct8goQ/eHx0uogcfHpcvOy1f9PcXM7xDchEY37WpVwJ00cxpFl953d77/0p/rlUil/Cm+oFxcuz1iIZrc2NujT9CDtTowH2k7yaDgQc327+JctSKKl/Eawc+opRX1z2Qlkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-2da80e525e3so208847fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748460255; x=1749065055;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7SBR/tTOEDsXHmga/+xUZPS+/ZfS7zuFk7zr0XZn6BI=;
        b=FLVl+EtzXhxm7FKYhyxUyByot9oMKUTImr4Oo0IM46Bf7eIcxp8vZJ2xZCFUYLEJXu
         BcL9lM3mJiT0nKyL8pZC7nhYmxGPBDeph0KBrh6AWLA5hY1MdZCsNbi+3Nr62KDI6SxA
         XU762OMM8bQ/KJ+VYWjJyy1fvYoTNnbnxm9SvTnLCPKOSM2wDKFOt5UUAPSSXKdJCXmt
         YMHJGESLOkUrDM1WOBFBeWS6/wv7RarMhjFF2oYibimgbSJ3OuwPM5qaIlsHM8XKpeCB
         wqJ68uXpD31MZZodtTtNsT12UznITfU+lbZQJtkCc6Slrlhkr2wrYHoURWxvGr8htqIp
         SJpw==
X-Gm-Message-State: AOJu0YwQwcF9OTeDUmTBLyIK/A02Ff36dNehXVwnDXU+771ghvhRQ9tJ
	2qqDSyPxk7wn+P0X0CKOJdifOTo8/vCrtkDdBSVWVNYJW452p2lc9tR7ng6Cg9vsOO/a39+48cK
	Guv2ZkLnck0VCjpCNlidhYaIa3CoseVYzkg4FHGusah3APKhSFmqNCLUwjnA=
X-Google-Smtp-Source: AGHT+IEYltUmKTpC/O1xianUc4byK2XFNkBRStYfa5Btyne9hfDU3P1YQjyyd+ALQ1TAhB2VRO0cyVfpFS4tuZRm1R6ScnLnMW8B
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4192:b0:864:a228:92b4 with SMTP id
 ca18e2360f4ac-86cbb80ad39mr1755717339f.7.1748460245042; Wed, 28 May 2025
 12:24:05 -0700 (PDT)
Date: Wed, 28 May 2025 12:24:05 -0700
In-Reply-To: <CABBYNZKyKk8=E7sU-O=ysxYvbF2inEuwV1sA20vuuM-yq360aQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683762d5.a70a0220.1765ec.0175.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in
 mgmt_remove_adv_monitor_complete (3)
From: syzbot <syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, luiz.dentz@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com
Tested-by: syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com

Tested on:

commit:         b08494a8 Merge tag 'drm-next-2025-05-28' of https://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1207f170580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=67c5e0d63b5e6251
dashboard link: https://syzkaller.appspot.com/bug?extid=feb0dc579bbe30a13190
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15ec6bf4580000

Note: testing is done by a robot and is best-effort only.
