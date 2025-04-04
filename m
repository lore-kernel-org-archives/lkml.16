Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B6714F9F9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 05:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743745206; cv=none; b=QNXCYU7jrssAefAy5Ri4S/pvT/cHUa2y3FwXuewzyScgn1usC/2IzXFMMAdyLAqu7Y/r4PcHXklzzizlnCvJ2t0o48HxnCM0qe2hQQD4fKmGxLQpE/8DI91quC2GqWbc30mtuapbSCPUfmx8MQH+MPhDRlv37SsojW8aTMDDpn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743745206; c=relaxed/simple;
	bh=Qs4lbr2wpnzcI+vTr+5tHYq6r7DHOgWjgDGNVXHoQIs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=b9gsNH3Lk1zHdi0LPNE188MYcwkBKJ0bO5qr+MfZEY+qzscbfKL7i8smldDrDseIIeg9mVYBAFtl1YUaIu3Yj4l9Kc4e5rfhZFM0Da67dpBOA+LObYg9qr+ewWNBS4Lu6SkIaVAEsC8kQZUx3SYCSI+dtFvuEn/pUhycR/GJ7m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85dcaf42b61so355842939f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 22:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743745204; x=1744350004;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGhT7AaSPgccn2zLfjyYOTq87iga1ojaBkigz9uF0LA=;
        b=f1a37qp8g87CZ3iB8yBIgTbE+dGjUjlwsx+m7h4pYi/hM+mJ7LOEy9pnzAPtnpLiJR
         0d4Hwc037+rfw6Bil+19rfvv9aeENlzn5JC+OcIg0Ql9gn6aU/7gRDsyKPz/9ejvTESD
         HXNGByRN7F8EwFWrsaaWJE8XxEXbOSc2Rw3GLxvVqZ1T6I0xhGRRBETVO908YVRgN3R8
         mkaAjCzfz+IkoaPmSbLHkZITyEUKJRoUag5WirI5tJmoleXkbqdX1abvF0iHZQfMjFzr
         n1gEc9nT/4d4Q1CO21zJk8sKDf5bHyl4iSJE56e5yJS2aMRckM1+HTVBrCLS4ANTfeUE
         aATg==
X-Forwarded-Encrypted: i=1; AJvYcCVz40kX/C351OcFr6zHm3Ew+e+ZAevqGq8AHKaaeeoRXm1PFTWuFiVSEE2AdWVkQOfXg1f+aiFihXZAIZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMnmnVoQ1Y9nvDLbyl70gXMUU64geoRpgPxXAhiJTjC1U0v3mE
	QemKvphq3ySz25eh2twnBTjVhf/bsdC7Tp1aAWrZ6DBdmbsPr8dSngx275RDViAKcsRPB3Tkvq6
	Up8M4MEzWjh8U6ZtYHZCXUQX2C2+3AE6XdoQ+/2B04JDt7HmcfpM/yw4=
X-Google-Smtp-Source: AGHT+IENX+bd7r8Gf3qQ/2sxsfjDW287OcSjpn0XZLXLkig0YUTGRNLpH78D30vJ8cb/z8prN6AkhY3z39BjBlBgi7SqjE2f1FuJ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1685:b0:3d6:d145:2ffb with SMTP id
 e9e14a558f8ab-3d6e3f89f24mr22540705ab.21.1743745204230; Thu, 03 Apr 2025
 22:40:04 -0700 (PDT)
Date: Thu, 03 Apr 2025 22:40:04 -0700
In-Reply-To: <67ea99e0.050a0220.3c3d88.0042.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ef70b4.050a0220.9040b.0334.GAE@google.com>
Subject: Re: [syzbot] [block?] possible deadlock in blk_mq_freeze_queue_nomemsave
From: syzbot <syzbot+9dd7dbb1a4b915dee638@syzkaller.appspotmail.com>
To: axboe@kernel.dk, hch@lst.de, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ming.lei@redhat.com, nilay@linux.ibm.com, 
	syzkaller-bugs@googlegroups.com, thomas.hellstrom@linux.intel.com, 
	yanjun.zhu@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

syzbot has bisected this issue to:

commit ffa1e7ada456087c2402b37cd6b2863ced29aff0
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Date:   Tue Mar 18 09:55:48 2025 +0000

    block: Make request_queue lockdep splats show up earlier

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D172e2fb05800=
00
start commit:   92b71befc349 Merge tag 'objtool-urgent-2025-04-01' of git:.=
.
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D14ae2fb05800=
00
console output: https://syzkaller.appspot.com/x/log.txt?x=3D10ae2fb0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D47cc4b0c0327825=
0
dashboard link: https://syzkaller.appspot.com/bug?extid=3D9dd7dbb1a4b915dee=
638
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1680d99858000=
0
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1180d998580000

Reported-by: syzbot+9dd7dbb1a4b915dee638@syzkaller.appspotmail.com
Fixes: ffa1e7ada456 ("block: Make request_queue lockdep splats show up earl=
ier")

For information about bisection process see: https://goo.gl/tpsmEJ#bisectio=
n
