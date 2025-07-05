Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAC72AD00
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 15:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751728368; cv=none; b=PqyNP/f2+DBKm2HxEIHEIRDuukTlL+vyF80r8fC1pPg0YvZGwQLZ41jBht9U33339hiC2dsiV+bASymAC13JynxCAab3bemiN3KJ7hvp6lgJHRLfq8mC4UKG3aiIfT6SKhYe6M9IP/6CubcVZEOHIFW2aPSY5LXyodrTypKQNsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751728368; c=relaxed/simple;
	bh=NyHmvzYnFYyU4cUR6nR5su9u+rl8YbxFNBwcAzIqszs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Nouj3vBzYE0pEXAzF/BWin1B+r6IQMUmw87DNAWG7TE/fvihHIgQhAtM8TwfESJUWjuWBjuiiwrsnnMLmx0rb5h6KLxKZSv7Ke7nkdhtyN0YFPQmHtnIJLa8dGQbCmMtIxIno8o1Juq3A7LGgAfHnbjBQW1I/o6dGnmLrkfMCdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3df2cc5104bso37817715ab.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 08:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751728365; x=1752333165;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VNMfKba/qZsNd0ZiLu02MxcXWLcUrJCx3h47TOcv0p4=;
        b=efQGbbgFIb3asQoYjjCBfZMXU8B8C6ucXEbrFFoaKgC/y9frCuw9uVNlXx1OTDEg32
         eJOtVitnfJJ3HD2DZVSbrqiyhorfOT9D0eRGbhwN5Jr1np+OptUxHxl3dvuJ4Epwvm9Z
         RpfrAMApybGVP4Kxmzho41773jP4K1Zi0odfALOLWywHhEBaG9nAm9psIrnq+Xq/TZxR
         NAaQwEC0PpHTl97ds1M3USymPepXdB+eGeSRVYsnJfTRdC73bCTdnBh5wMZtus7y66dj
         uZqCZHgf8JkovRcoVzN0mgqsSyaHRCvgnJr5Mx2a8PBBnhzafiC+KBxPAvPO3ydwnmgw
         KVXA==
X-Gm-Message-State: AOJu0YzziORjFWPgqAPj5r4+V3c0QY/xQ08bBNlbh2/wHc7B0uWRWCl0
	2+ys0805KpfmNXSm3lIao/iqh2vhVG6w/Odft4iu+rQr+ZjWOdAscXYdH/kRQ3SU8pSJYmGPP5I
	mgB3+jvnjmgAiYkD7XA0P2/1ZG1YqlmKcVC5/SVLAVwjdHaeSiZwqqfkm0eI=
X-Google-Smtp-Source: AGHT+IGTLQR8+UCBXrGsyvj7dJ3hSmvZWgf+8PsZ6oWBlga43svujd8FEylHQZgmSt8CQqfMK8ilo4nOwxnYV7dqQInmY+YgO18+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12c3:b0:3d6:cbad:235c with SMTP id
 e9e14a558f8ab-3e13548bc4dmr53425845ab.6.1751728365661; Sat, 05 Jul 2025
 08:12:45 -0700 (PDT)
Date: Sat, 05 Jul 2025 08:12:45 -0700
In-Reply-To: <68692d2c.a00a0220.c7b3.0039.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686940ed.a00a0220.c7b3.003f.GAE@google.com>
Subject: Re: [syzbot] [block?] WARNING in bioset_exit (2)
From: syzbot <syzbot+1bfac8c74f4f587bf9c7@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [block?] WARNING in bioset_exit (2)
Author: axboe@kernel.dk

#syz set subsystems: bcachefs

-- 
Jens Axboe
