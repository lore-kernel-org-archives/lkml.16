Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366D31E22E9
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 19:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739129223; cv=none; b=gbKrCtt5un9qDIY7NU/dAyWge9T45sBRIixdIzxCVqWw4xVsN6LZmxgLSlJTf+GLXZdl0s03xyPOWK/nd32khVhUEmj1/OLxgNRyZbf4uLuJtiutasnFfWMjSJ733XrMgd+wn9N0JK5bTxdcnpgb6XhXgAyIJlRsk3uhspPMHQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739129223; c=relaxed/simple;
	bh=Vyd0UobHk6QyUMIqma6yCedoS8r/66Qmz3flmHKGW98=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BHIxjUNbN4ZI/qiM43/IkeocONuELn8dE6MG2FuDleFwaes/jzkZSAxonTnUuURqt+4uqVFpyyAddkQzj1ZXArTu+VxrJ3r/vpwoO+GkK9oeSBr53daGZfqLWf+0bXQEiqyxRHOnSvf5zX6wdP/+t8kXDhX3Ch3+1F+btMueWjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d143f1353bso16292305ab.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 11:27:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739129221; x=1739734021;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lm3T2WLDaPlgZdqyMgzRB/LNX82XeoMBy/H3NA3BdvA=;
        b=qWQ7qcS0lmebG/ifX51ZGq1St0yCpVlKTbQn3hrIXe34xSWqQbGqy15NmceyNqInvU
         pEd4nrv2jr3l8Qc9IkgAnJMIcekcpFGY4393zPdRcx/98tFrdanEU0Jsbk2Mwwk2auzA
         lc0KpcVCOn/WhzVKiXYEOixDwjQo1zk4+ZCXpnfbW6MWvgdva6lhqYbm00RlQFAYDkyn
         jEa9nDWzn74JSy8gvI8E1/73anAyhjQRfnAoPhc/j87jRbGA0/qrbpjzpF9CQnVfQ5Wy
         Q8ria4DreFwtZ5jXQjQtucKhI4/ryKop2Wv0kaWgNt/r1ADtQDBY1HrusrUyaNpn/m0Y
         1pPg==
X-Forwarded-Encrypted: i=1; AJvYcCXiRxn/tQpaAA/dKGzigM81f7XSBtAFc3k2o3yTbbsEueCmFHoS9R5KxhZyGAiXJzlQtivnyds+EkiRKMk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz35F+Kb3HqGcjD/FxysKSi8A3K5zfL1QZ/hllJMy2Cwg3vl3vk
	GaIqq1BcR0YwHCa+PKkaBjaawMpkuB6baJE8QYZpA8LDmHKU0klgz/UazbAlEiRHcDiGXqfA1GN
	QpLJUsEUfN6OCsfpNXzN9j1si9QCtb7sXObU3NIYjACiCg031EAd1irk=
X-Google-Smtp-Source: AGHT+IGkxGZKejY1F3ygYzzaUi1hUqpXmA/5+5Xn8TKUNvFSY0sOPF6pRt3WrIZfaS1l833h6uU3OAju00rg4KLYoZHT8rVj7Ppf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b4d:b0:3cf:ae67:4115 with SMTP id
 e9e14a558f8ab-3d13dd2547dmr43310225ab.8.1739129221395; Sun, 09 Feb 2025
 11:27:01 -0800 (PST)
Date: Sun, 09 Feb 2025 11:27:01 -0800
In-Reply-To: <66f01abe.050a0220.3195df.009d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a90185.050a0220.3d72c.0040.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] WARNING in bch2_fs_release
From: syzbot <syzbot+08d08d52c3a09bfc70f7@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 8b22abb4c84058e9533d71a4814e54316ba2621f
Author: Kent Overstreet <kent.overstreet@linux.dev>
Date:   Sat Oct 12 02:53:09 2024 +0000

    bcachefs: -o norecovery now bails out of recovery earlier

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=121ddb18580000
start commit:   8f6629c004b1 kbuild: Move -Wenum-enum-conversion to W=2
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=111ddb18580000
console output: https://syzkaller.appspot.com/x/log.txt?x=161ddb18580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=147b7d49d83b8036
dashboard link: https://syzkaller.appspot.com/bug?extid=08d08d52c3a09bfc70f7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1312cbdf980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=129411b0580000

Reported-by: syzbot+08d08d52c3a09bfc70f7@syzkaller.appspotmail.com
Fixes: 8b22abb4c840 ("bcachefs: -o norecovery now bails out of recovery earlier")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
