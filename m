Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215BD20A5D6
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731326; cv=none; b=upMiAby2pjtQCVULmFTBZrz3FeB9TtD88oVPPVDdIlY21P8uCN4cy8oexXC0bY6GxZ09s7HPKgY9/QnLP7nftxtraJaNGtgDw2MVGZ0N52kUCrdgqeUtQn2tapDLPvEruUvgz7Hlu4VCUgU6WBVksjWkTqgiFhWx+rxbGeIpsSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731326; c=relaxed/simple;
	bh=dMygeV5uoVdCI7txzJ9X0V/8gCPQmtr4XJBXZjoRBX4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qjFhL356hO9nwn/KEbi+Rw669Bf4DuTQBNXj1lU5TPb9K1XyKRk0BngCDikNHi8C1ZLQpXNdFLnQ2Df0EIwqMV6EGjuY7twckFmVSgt5nsc7xR/UhNvsFvZ8+Jab8Smn7eCHdUINDSuvYn+Lc8+pTWQkLr/HXECSEnMDRe+ckp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3df2d0b7c50so20159395ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731324; x=1752336124;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zZ39e8xu9v6JpQ+2Z+vLYy6QZmlP+uXlVIaEn31Hh7g=;
        b=wlH7wbQwhzBIgeCIkGRIqS091kNun6M1myuxAMPFlcXeDcgcCR1y8mfxiUP3CBlLFe
         WufVhSm2hmHSB3Gi7TPjCNl5jtvPq3WAeuSFocHGUM32ZeRchvjqVDhhRvvwzGVeRSXD
         Az9v/0Z6GwFw8LvINAyQJH5z5tY0c/m2Le8yfWFVhJ5bAvp541EsDkQv+JM6NNDTyWO9
         LMQd29AZbmGiNZ4ODlglJVb5U6SjnBt6lwbpP1byfIZx++QEgq+VW38srWhasPCgVLtj
         CeUzJi9DwJ4WAGRBdzGhsy/DkHvlEbmzAofV4GPx0kBdv9tKdwqXzNTsAR086XliPitn
         1xcA==
X-Forwarded-Encrypted: i=1; AJvYcCUtsMM1eXUIyvFtV/OvHHp9ucXIW5BfWFGYFqiB6NmIkf2pw+qRFiLmuf9R/J+3PGktZ9vCgNKHLAyJ2HY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcbIvTxDN37oKr7HbyOZRmAwvE+0ny4xYas1eq2GINOd9nYQ2r
	NyDkeCz4kCQhDb8yOp5WHMNxOlLK4r+rMwxxsvrh2qgyzBacsWS9gekw/zNO/nPLeJ0Pt/zqCiM
	ZSwuUvkMPwyOZz+6hGtjdW57mskC6afWau4T5geUwzWU22Y0qGRz4Z+bZlSg=
X-Google-Smtp-Source: AGHT+IFi8tBZCujWe9RK7k1QOcV+G5qEXxaVcUaY+MeQA3ot4H19x1QqbDxj186yZdLFiJOHIA0EirwQgzraSfb+lrOOnbAkPyxi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12ec:b0:3dd:f948:8539 with SMTP id
 e9e14a558f8ab-3e136ea4c01mr55847905ab.2.1751731324130; Sat, 05 Jul 2025
 09:02:04 -0700 (PDT)
Date: Sat, 05 Jul 2025 09:02:04 -0700
In-Reply-To: <68649190.a70a0220.3b7e22.20e8.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68694c7c.a00a0220.c7b3.0042.GAE@google.com>
Subject: Re: [syzbot] [bpf?] WARNING in reg_bounds_sanity_check
From: syzbot <syzbot+c711ce17dd78e5d4fdcf@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, eddyz87@gmail.com, haoluo@google.com, 
	john.fastabend@gmail.com, jolsa@kernel.org, kpsingh@kernel.org, 
	linux-kernel@vger.kernel.org, martin.lau@linux.dev, netdev@vger.kernel.org, 
	paul.chaignon@gmail.com, sdf@fomichev.me, song@kernel.org, 
	syzkaller-bugs@googlegroups.com, yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 0df1a55afa832f463f9ad68ddc5de92230f1bc8a
Author: Paul Chaignon <paul.chaignon@gmail.com>
Date:   Tue Jul 1 18:36:15 2025 +0000

    bpf: Warn on internal verifier errors

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1693cf70580000
start commit:   cce3fee729ee selftests/bpf: Enable dynptr/test_probe_read_..
git tree:       bpf-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1593cf70580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1193cf70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=79da270cec5ffd65
dashboard link: https://syzkaller.appspot.com/bug?extid=c711ce17dd78e5d4fdcf
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1594e48c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1159388c580000

Reported-by: syzbot+c711ce17dd78e5d4fdcf@syzkaller.appspotmail.com
Fixes: 0df1a55afa83 ("bpf: Warn on internal verifier errors")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
