Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA3320C487
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 16:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743784865; cv=none; b=btzAV5O3uVX4UI89Xtv3Co+H90vdy0K1ID5jpE4ZBN2GPO15CLXTbw8PUOe260OEmlfr0jKj5l20fsV7ed9Vgrz+8IO1ocGFtETs36btJYgcDHF/y484tXneD1Ab89duKLNVjBt/JfQMOcJj4AuOEPOwPotgIBy9YSkwSPTsTqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743784865; c=relaxed/simple;
	bh=VxOnCF+HvtBQ1CZSxMxHGlCSfaf9QunSsEFcUcUV5nQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=nryacoRVFMxbK4NQJuXgUSHOrUmQ0Y4IWK1Yzdy74gEPwW41GSqI5Vjvp9tD5VSKFbaGCqyglXifVTi1QSzSUcago/vu/g/rjRuSptoJIxuo/h3dyyXoMYNv5EJsR+sAWZLMPWVGeTBmxAOV/RyyncfHKEwX9AX08XgvzAkrmAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85dd46b20bfso233873139f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 09:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743784862; x=1744389662;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=do8v4tJlaxjSQbHtK73xnzF5iTyzFImZXeIUVjiHgzM=;
        b=RIqc9sgVZCxvXV40unjAlFHCTXHnbswpQ2fcpCAAKes3jZAa8KU37io7cAN6ebC3Yw
         VoylFe1NKEmhFARYE5SOhVIk9D42o6FyGGGdhVJeCovNne0rNEXJOuK/3j6ASZ1J1nkQ
         WfGghDKg6NxTzAOpJnSmrkmhHu/vyhquPZVj+OfX7XTd4GvINXadR9NhiFxiHlWFVaVT
         fLeR7pYdmLQh7Kd124WM6yE3tQlnH/BqFvCjqG130cZeqqGF15CZf9PMyNT5GTEOXKtt
         dFUIn+P2WKYLXQv26sn+xlvFI5Rw+zcQ3BNrq0p7P3Y5eUR/sEKJHMR/VQXHxhnJ2S9M
         b1EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbHSSzzgoeW4uZ0/yEsleNfO0CXjWoF5hjM5mB35TFnGODWPnj4RWjnBmWy3kpMcgWqmyFB6a3+VQYNFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhLmxSI+vHbUkGAoWJFX/R2blkxOf2Ci9wsjrN8z2N10EQd2G2
	igkrcjaPL8Gec6rehUn7x7i7clISpFEo6k/rEzjTj9A/rpFqIgsa/gGEB9no2k2ExPZsXu0v6wj
	0DiIM+xADPPOKR1IP+2/strIzGiJiNg2GbyhatEd4sQn09VE06l3WVNc=
X-Google-Smtp-Source: AGHT+IE1oPxntuLvDh8XS6TdZRzprpiGADEz1QwT8rwhimBxdxZ0/kfSsWkevNYlD8H4jzF6o+RKeyN3EdBo/jXfnHU3vQmRIEFx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1808:b0:3d4:337f:121c with SMTP id
 e9e14a558f8ab-3d6e3f0533fmr39029825ab.10.1743784862688; Fri, 04 Apr 2025
 09:41:02 -0700 (PDT)
Date: Fri, 04 Apr 2025 09:41:02 -0700
In-Reply-To: <67eef48d.050a0220.9040b.0262.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f00b9e.050a0220.2dd465.0219.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] general protection fault in bch2_snapshot_tree_oldest_subvol
From: syzbot <syzbot+baee8591f336cab0958b@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 45f0e6c838e5d9af3f013adb4ba9aad3bcbcbe3b
Author: Kent Overstreet <kent.overstreet@linux.dev>
Date:   Fri Feb 7 06:33:01 2025 +0000

    bcachefs: bch2_indirect_extent_missing_error() prints path, not just inode number

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10dea7cf980000
start commit:   a2cc6ff5ec8f Merge tag 'firewire-updates-6.15' of git://gi..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=12dea7cf980000
console output: https://syzkaller.appspot.com/x/log.txt?x=14dea7cf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=941480366fefa055
dashboard link: https://syzkaller.appspot.com/bug?extid=baee8591f336cab0958b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17062fb0580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=131a0fb0580000

Reported-by: syzbot+baee8591f336cab0958b@syzkaller.appspotmail.com
Fixes: 45f0e6c838e5 ("bcachefs: bch2_indirect_extent_missing_error() prints path, not just inode number")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
