Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4E4175D39
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 07:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744442287; cv=none; b=I0C2Ak/6nKO15NPeYAj1jca58I28T8HP49No8vYul+FNs9Lo2esM5x1CUgy1gOksFoY0AjUHwMebpnMjCXLXJIe28GoNlDNrWzjr9ZNoCH6Q2D4vtc2NrMEQHdmYZsjAGneNWPtydVbinkIkBC56ZEaWsJFYKM6/X7qWVCLuHP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744442287; c=relaxed/simple;
	bh=fh6d+QbbMlA8C6aEiXUD6erPFdsAcrS94snfGQ+OiJs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=shjRXRM9j+YI1V2nk70Xi9d+NvxpDiXkyvXghcvvfvGxDCHE3CbkVVQ0k8qOrayiaxxAjE97PJp08T5nvmZ3u7pkN8YowbyVBdY+l9dcp3N20QR90k5dIhZkI/VbxWgaZybfRnKssuVD/IxT69q+xd9KqU8UW7BYtqtRsHFC5lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d43541a706so25505555ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 00:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744442285; x=1745047085;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJTs2Evevi85CfsGwYqFkVtn6aF1t27vAQasOUwnApI=;
        b=UBKnuwpS9Z4ZwA7Vde23ikReA1b2ubMcud/f/AnDWzyzrZEtjHTYdGLd5U/tkUzMUS
         kvW9F8Mp8Utch0FN7CxWgDPQflte08gqGwL81tcy4Dk2Wi5rMFFJI7iVIuGVi5iU7iJv
         ZfMxeCQQ11Cw3XzRssyVOVfrIdGUR68lB//jXVAVtsixbs0PpwnCO63v3DWTOTc0R62f
         AMS3j9H9JU7EAgW1ZduY/xlZabJCZ3IFKXnI4J4f3biEUf2dCakDGbXHZExuys1iww9Z
         UIrBM4zW9CJLNbu9F0X+TZVTjnfhIjme8co/tZnbsMzbPJ9PDeiPdkaHxQVsT0qectIW
         YLyg==
X-Forwarded-Encrypted: i=1; AJvYcCXmCMgUYEk0aKQBhH0Heho+vA5zGO7oj9LUvgPoB8Bh62Z5+ub4BjKId3FjwyKqcR/koyw9ASptWG9qf8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzJ6F1X4WiyPCG582AFuqex4QJKoAeZ6nqN8TGXtT7OEfkve2B
	U807aI9fSakJtgvrhwla1wXXX0qgBR7uaI2Od/bm8KlnGF0ap2nv2iV404moPHQplshK+rnNuKb
	BbAade1DciQe8IVtJB9VMSMlkA5Cu86WsieZg9UfsvjYtDWBszmmqGUM=
X-Google-Smtp-Source: AGHT+IGwcBUw4yOCvXnylSAKDctqIEhA20+2bUYCAgQcHwriGE4YMthIF81B25/L5DDW5mtRw8cXLzu/B8+kj6JIeF/yYbxeKsSl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3c05:b0:3d5:81aa:4d0a with SMTP id
 e9e14a558f8ab-3d7ec2020e0mr51049645ab.6.1744442285083; Sat, 12 Apr 2025
 00:18:05 -0700 (PDT)
Date: Sat, 12 Apr 2025 00:18:05 -0700
In-Reply-To: <B9F695AD-3447-4F18-AAB9-85E118ED2BE3@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fa13ad.050a0220.379d84.0008.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] kernel BUG in bch2_fs_initialize
From: syzbot <syzbot+d10151bf01574a09a915@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mmpgouride@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         01c6df60 Add linux-next specific files for 20250411
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=16c2f7e4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=db03cefa26ecf825
dashboard link: https://syzkaller.appspot.com/bug?extid=d10151bf01574a09a915
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13ad00cc580000

