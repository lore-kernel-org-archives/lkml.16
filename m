Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C005215747C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 16:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745769724; cv=none; b=L+J8Xe1jpylRVRDI3QHP7GMpix8do8j3KETVbuH0lVxzSDy6GGNURBGrGrJJyUqv1ZagFyWtVqeuaM/wa49ErKW5ZUR1bfqdz2KIUrnvXOHwzzMfkfIPPtzx5I9hmCl1kbx+t4OQ+d3p91r02wqPVmJCQ67hiz2SR8GqgIKbFKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745769724; c=relaxed/simple;
	bh=zWJHLcyM8x1YUoVhgvXJX9FzSc0Hb5EbkmVIlT3+cKY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=LNiwn2HIPCmv/xyN490Ofb6gJJRM2Ae8/mhU+NRGTSMEHK9d/Eu7N8GDHGtdiY8G+cVhGlDilG5K7EQVqBUJCrBZ/pzYKNe0o2bh264QHznIKuqjJCJ7XH6MFQvarhWMdL/KEuFtBw/hPdDpZVFQ7OcTIULHpRsUl71sr180Q9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d81a0224e7so73106255ab.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 09:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745769722; x=1746374522;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zwCwjWE0EmAtHK5Cur/AnjR0SplzhCa9uWGGAeJSoQg=;
        b=jorvRD09qM0kz0LANJfW1sH8wVi1B6xAo3+OOVwEDKQ0Px7JlYzx3gwJANFrGBaCVm
         vYfmhB0vfyqKxPDRbWUdtluRWHogNv6d3hG4113ONMPQfKSoLNP2ZiwK3pQk4ENW4o/u
         NLOqPTHljItCXShfdElaivxk+qBHKOJJLT540gWbrXJKNOgGJhxbV4ypXLge9CGLiXRV
         jVc64RZhB31TB/rdRIQZcvR5Oh3V4ljOfxoAhHVdSPbIhH5EaSVz5+cHc3favfE9KTiN
         ZNoi3r2mtyNJdMG6j+FZaD1ygWImN+3rrgpzlrY/VRMeVibEd1xcAQlsqJWiADbfUudr
         P8Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXNsLGfM8U/t0Fi8PIMS5tX876tO8fDjmLkixRGILzGL1qpunEhKsp2PZZ3/O7IvxZVU+xjL21bnobbSsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEWxkIrFVZHoS0Hg3ewI02OeaT+QevahhzZY3N8bRHhYtLwt9O
	XE7qC0L9YeTOygyNwzQLhRLndajK4kTuTzigSXzNIIvRbLaIsYdwZKi6PxcwFlJ+u+zJWq+BjQM
	lc6gPgj+hudfqKm5IjElwFMsq+I3a57vpdirkfVDaW4rx1o+akJLcfA0=
X-Google-Smtp-Source: AGHT+IEEPyFYZaZ9rkLBAQsTHiSBW30cSBWCCoLlH0Tbtlqx9VzYD1lhw5PjFMepkvIug7f9DaDfI9qsqSv83g4g6+Ef6bV5JJh0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12c3:b0:3d4:2409:ce6 with SMTP id
 e9e14a558f8ab-3d942d1dd78mr61800295ab.5.1745769721930; Sun, 27 Apr 2025
 09:02:01 -0700 (PDT)
Date: Sun, 27 Apr 2025 09:02:01 -0700
In-Reply-To: <20250427155717.69658-1-contact@arnaud-lcm.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680e54f9.050a0220.2b69d1.00dc.GAE@google.com>
Subject: Re: [syzbot] [block?] BUG: unable to handle kernel NULL pointer
 dereference in guard_bio_eod
From: syzbot <syzbot+3291296495fc970e4b1c@syzkaller.appspotmail.com>
To: axboe@kernel.dk, contact@arnaud-lcm.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

block/bio.c:695:17: error: expected ')' before 'return'
block/bio.c:715:1: error: expected expression before '}' token


Tested on:

commit:         5bc10186 Merge tag 'pci-v6.15-fixes-3' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b7c08f42e927242f
dashboard link: https://syzkaller.appspot.com/bug?extid=3291296495fc970e4b1c
compiler:       aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11578374580000

