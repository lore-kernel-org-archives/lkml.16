Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8CB235064
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749570904; cv=none; b=eObk4OX6a66Wmxz+kMNB325OjevwC6soYTZQMAoMyJQR34QzW57k/n/swox0rrNY4pAr0Mmi9MXOS4k34s6jvPEu2OLf5rHUB6njVNP9qNzhcbqYHWwan1k/XqZE4K9dzGNCPVEgFK8TbXebStFNvdfe+IbDZu2s7zzkdCDSWbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749570904; c=relaxed/simple;
	bh=qVUgvaDABYTLhysb2HJC6EI7EQSyYK60JpL1EulHbXo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cFubRe2iybnZN42PG2LUzGU/swUrT84ASmdvXvY0IlYUA4LnbokEKVVMPJQqJxtYmuPH2oNuUbC6qry2PD3y8jPJkaduI0x1h4dhleU+YsmQJZZR+wVEtVAN8QkMY6W1zIgA6byRs1c4Bg7L+cPoIyucM040qGW4Jl5CICAzzFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86cc7cdb86fso577187639f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749570902; x=1750175702;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPIX45qDSlnSIqjBASyIDaHrvOhW5uvRabCHb5zFq6c=;
        b=Ltmgs+V1WAHv4XGXw+UYOwmv5gFz9RvkvNj5IiPv6xRkHSpAdC857YLHgp7y2R/2EW
         ck/r0nI5X4s/IY/t5QOFsdy2wnCVY8eKnUIw0IUm9SvemdzS7Rd5iw/x72+fcgPxW0Qq
         UWUeZ23Rh+FQ9/il9n2M6WGYqe3/Lo0cEsiXVW2ntoOowhIfW23KTQE+EZLGtlT4oy2h
         K3CSB3hyKf77kGpGZlW1Ym10+Pzjz9lXY04DI9y2kIXBsvA4To8uMPvKWZeYZbOr3yMj
         Cs+1lmUlQT9Hn6dy0DnKXVKuyYMyhcSSGtyQ387oqhW95tkmY1t9t8yNy9d/GMX5PM36
         rFFA==
X-Forwarded-Encrypted: i=1; AJvYcCVG7gq2iJEN8I4rYP0qL0YKthFax6/OryxAiPac6LfKcIY3Lz8qAJdtNZ9D+SN6ALdT0LT1xPtTTV2XYXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7dpZfCATIhVpJAB2UGFf82/PTiQ5ETmlcw2sDK85zYG1Lmork
	a+rERP9JdV47zHTgsF19GN7Vu3wJSirXKTLP1E/8K3z2S3BhrOR0OrvFxNuatNhXxpW2vrUM2g2
	7FXi883fmd9kxS+TFvWETFHiVwq/qNYTc8gcqlV56R9IIeX+0awB8igMoAd4=
X-Google-Smtp-Source: AGHT+IGDgrIOf+LFYIq9m0F8/QnEqHjLpLsfdIElUrFFwRRUgHv0QMpuIF1VTq3CybbEL6lRpfZzp85U1aPqF41eHH40g7yquNd2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:380b:b0:3dd:8663:d19e with SMTP id
 e9e14a558f8ab-3ddce45408dmr168504165ab.10.1749570902448; Tue, 10 Jun 2025
 08:55:02 -0700 (PDT)
Date: Tue, 10 Jun 2025 08:55:02 -0700
In-Reply-To: <20250610152748.1089-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68485556.050a0220.daf97.0b06.GAE@google.com>
Subject: Re: [syzbot] [net?] KASAN: use-after-free Read in __linkwatch_run_queue
From: syzbot <syzbot+1ec2f6a450f0b54af8c8@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+1ec2f6a450f0b54af8c8@syzkaller.appspotmail.com
Tested-by: syzbot+1ec2f6a450f0b54af8c8@syzkaller.appspotmail.com

Tested on:

commit:         f09079bd Merge tag 'powerpc-6.16-2' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=109baa82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2f8ce980f626e3f9
dashboard link: https://syzkaller.appspot.com/bug?extid=1ec2f6a450f0b54af8c8
compiler:       aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1620260c580000

Note: testing is done by a robot and is best-effort only.
