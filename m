Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956351C32EA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744034824; cv=none; b=cd/2iG+VLf6SqMYlSnWY2wgDjb/zcmJKBJCYCX48vJcE4yG4dtj5Ng7mQW4Up3qv2LgVehGxgUAnyItE7DXVEdFE6m+IG1o1y3xXPOx/WS1Capsq7MSdVZNQ1NCG6Q86UvmbQgx2kVwnDcIViI3eqPW4x6fbdNnTDyvruE4uw0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744034824; c=relaxed/simple;
	bh=ncxjzCSmxOakrfI+ux5lY32lyCKIK2l6GJc70zdDPOM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=FcztqZDdQXshj3zHjnasyo+3ogH7DPCQs5C99IyqInxja0d4Uhk3QpPt+LNSaaE3xDSyQpbRvkKM7UtAo/5rHNw/fq/dVqAetF/VT/cfgbA1rWm+BpbIqBaR9kgMGgHHNusfXuifWrphbQmQDNSapIPxVxwNWcgrpOD53ldlJxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85b4dc23f03so1025597039f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 07:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744034821; x=1744639621;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwXWzXPAt90Ym5+D6NPAF0rUeU+1DPFdOJn+FQQCuts=;
        b=Fgka/3/LptBZIUPsRUhWqDY6CdoSCRnFnvgUdNKA4DLfa/D7+Q4GXnLZbJqwqWSBzZ
         Tp83Y5nEm/DI2n02ax1HuQouKj787RBn0z4zAGXv0Mx5Nt0lAaLs2xcp2hvOikfDEf9D
         0UhDgO32G0PSVOn3uspn6sokaAtEsrAnqUEcfqcKmdq80Z1442KjGXA3YzNVpA18fDkO
         WgkFL7x+h9rMuqlURfDnJ2DAAJFsutf50FNp68fkgwEvJ5PJ3YGFSl13Ui/ONZqfY2jZ
         bO0G4mWm9Fdmh0XaDFWwPpTgi0hu4aEgYgYYbhpEMHS4kRiiXWSOoCLYoVyL81jpm5Gs
         CN1w==
X-Forwarded-Encrypted: i=1; AJvYcCUabnZ1TH+ddXUJ7tcxnFzThqkeMP1uxasdhpexfPLOXxzfMo4RUNWPgPmf2TD6NyPBV3a+lhwvpszWMTw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCa+DvlpuNtobX4uvfU1QHQ0vVGlf8orqar19Y8EsL0bhB48u4
	ZAKanfc4WL7lnaeYrJF/EFaPP1x6hxygIMEfng5hhpztUnh6fbBsow9rNupLcMB+NWvYfWCo9a6
	M22WarvELz/LGgpax6i04hlhwLd+fE50kRjsq0G/j2fBvnS5N14C4lvY=
X-Google-Smtp-Source: AGHT+IGk0qg4Non5+RqSgTngMpr84QybCMyGxRObEpMS/OBnGd9K0v8L1YYw6HKMv3i9T2PNneYp7wP0WdoYv8xmIodS/MaJDTO2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cda7:0:b0:3d5:d71f:75b3 with SMTP id
 e9e14a558f8ab-3d6ec57f9damr97693795ab.15.1744034821687; Mon, 07 Apr 2025
 07:07:01 -0700 (PDT)
Date: Mon, 07 Apr 2025 07:07:01 -0700
In-Reply-To: <CAJfpegvsi9SaeVdykBFhhwoOrsNQzy3C8HcJjn16uHdkzZ-EVQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f3dc05.050a0220.107db6.059d.GAE@google.com>
Subject: Re: [syzbot] [ext4?] [overlayfs?] WARNING in file_seek_cur_needs_f_lock
From: syzbot <syzbot+4036165fc595a74b09b2@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, amir73il@gmail.com, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	miklos@szeredi.hu, syzkaller-bugs@googlegroups.com, tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         0af2f6be Linux 6.15-rc1
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git v6.15-rc1
console output: https://syzkaller.appspot.com/x/log.txt?x=123c0070580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bae073f4634b7fd
dashboard link: https://syzkaller.appspot.com/bug?extid=4036165fc595a74b09b2
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=151deb4c580000

