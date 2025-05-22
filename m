Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B21D19D8AC
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937525; cv=none; b=YuLOpk7y+hJhE5UkuldVjFIa5xHy/x6jTjdHTNo9lQ8r9lo1D0phRfLZN5QRSb1NSTinkpDTpj01PTXYi2o3bETZDXxDaLv+un7nLPwCc1nzfHDfrCte1cBhgdBKe+fecGifUgE6/ZC10PIx04F1OwczqZYcbjTdwDSmnlGbMB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937525; c=relaxed/simple;
	bh=a4wfgVw3EhrnVuyco2U93m5MkjRHOw3frhVw9xf7GAI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=atYKPAieFKunAC40rqYEqNGRwl2kojkrjDVL1ClMwn1fnWcqG/X4qSb4RMiIEL2zh7LrhwYkmgBqDvpzt698mzXSYsBoI1JwcPCUGdf5YP387dygR6ZkSqI/tpC9yQWkuJXTxjRCAZSroVLBSWu+AN8X2UobF/NAgZ+7pYtjgGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3dc8689c611so19965065ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747937523; x=1748542323;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oWhRm5bonyM7CpJqLvjuAboHTJKWukGX9S4B4nOZ2uE=;
        b=KHiZd91vuNqqmjVUMiEEgaMjaFWGfMmHYlTmJU2qngh+9g/tbQd/aXzeuWHxduJI+i
         7Kk8tq1oonxBwsEVSUVkOdmGYV0/9L6L5P5e9/clkzX/tYbjQUzQ4a4l7IdkxAgbwdxU
         q+5QC/5CaqyCJ2+9GpJq8Lx19zJEC6AkJtbN6Bw4PwO+d92jKXuRdDP4sth7vfolYwBT
         RgnB6JD0ZtUXnKR8w3JE0OiI2vr6gc/l+m/toklZC5g4MdTQ/Vd1o9zH2o59ZtKGCBTU
         b/8aRQ1U2OrlPRxL4MhTlISvy6S14ElSPn22bDjy0xDbpoXvXX5g1zOSVZH6MoDc3p7U
         5QjA==
X-Forwarded-Encrypted: i=1; AJvYcCVvvu8ypYXx8P7dyNWLcoGXn79IM8sEg61cyafNJRBWkp1/BrxZopH6bwuJkkrJBZAz7aNebO3VNSdhwno=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBcgqRJmBjHaJLZwhr6K/ap6eXsSmUFMgOx3M8uXWGjJCZh4ze
	aJPC0+pIY6CnMUJNcXh6/vxmblFDX/agFf1FIuSBGQe9QdW/tKIhJtS05nS77jbuETwZNRzHG0i
	hmB//x8ji285V3Tl5jAkSAiTKv84woWWDYsBHkfLD+m8js6p4YLJ5FTI3CdE=
X-Google-Smtp-Source: AGHT+IHCXJXlEuVKgQSbuOKqznSTpss3Ow1EAW8MWupIDKO1hSSYi/zRZz0uxOrOHaJbkgIIvwgTCCrKPqrgNyqD8YzWGx7SqskI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fc2:b0:3da:7176:81bf with SMTP id
 e9e14a558f8ab-3dc9340976bmr946965ab.21.1747937523301; Thu, 22 May 2025
 11:12:03 -0700 (PDT)
Date: Thu, 22 May 2025 11:12:03 -0700
In-Reply-To: <e084b56f-c833-4989-81bd-2537f7dfa794@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682f68f3.a70a0220.29d4a0.07e5.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-out-of-bounds Read in hci_cmd_sync_alloc
From: syzbot <syzbot+5fe2d5bfbfbec0b675a0@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+5fe2d5bfbfbec0b675a0@syzkaller.appspotmail.com
Tested-by: syzbot+5fe2d5bfbfbec0b675a0@syzkaller.appspotmail.com

Tested on:

commit:         5cdb2c77 Merge tag 'net-6.15-rc8' of git://git.kernel...
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=11c0f9f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=89a6bdf3bbc4e852
dashboard link: https://syzkaller.appspot.com/bug?extid=5fe2d5bfbfbec0b675a0
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17bf79f4580000

Note: testing is done by a robot and is best-effort only.
