Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAD123A98E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598265; cv=none; b=s+RaM8GCPF2qM4cVdkCB7moRk3L0+aVZ7GIBeHJTxQg173eicgUFOzIxqZeUO7oTeYXfsbkRkTc2GPHE7U3Q5Nfkm/QlKA7yG6bNBCOcgPHU1v8A5JNOeMK2p+xEtMXs1vDNzSIgZnx7j1Kiulv8qSYLN8KdCkxi9zpfnEnJhA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598265; c=relaxed/simple;
	bh=afCa8AdNkS9HiwaxrZoMSOxGsPXW7Sb7OD6fZe4nTNg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=YdXdYdCcySRc/KRD25hyZSF0xEhFkeJAZnKOnu1Yy68gF8/zLJMypEOzmU26CcWgIhsFgo10eFi4kP2II/SbIGcRivmhLZOqs64mHZpzNDlpSZFupdydk5QktVS+ajK1fkiK83Jb6g2Lpg15bBdiZxPXdyMxGC4FQvWrjO5XqRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d43621bb7eso8618805ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598262; x=1744203062;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YjuIfv/GmXrH5PxPkm5IBAUkqJzS4jv6c08tPKdZ60Q=;
        b=nUE6ruU2luneN0IRGNVuowxUDB6ig/DtDl6OdCd2Z8LQf7OtLVMBcZm7PlPtHnDLfL
         xrkSZ6CV0J7cwMew52SswjRe/mGRU8xMzEzFZq8LUw4c92u4Mf1U2NmjZczOHk1Xqfsd
         q3wAI9i4AcRShPJFuBIfD9+64KqdpZWGkDX9WToZFi2EiISo2g464Tomgi3SdNdNfduD
         5lkanY1piG1XK0SFpViv9dAtoildC9j0OMXTGnhmq/mjai7fxnpb7cOA8YQBXWjOiW7A
         RE3UpOZi9457TRMDTpPOwKV30+caxWq38HzsDzqKrEZyIyaGAfmepX+2jMa0wXmyvb+0
         4dzA==
X-Forwarded-Encrypted: i=1; AJvYcCVHcCeyM7OnC/6xu7q4VslqzxX5BM2vrgm3Nr0mm+aNN900iwfHDXHsKAgJaX1wDyDzBjHqYlIxaWQM9h8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSQYOc+k2D4mVBJReBWvqGWjIct3j26I5jvwG+nPyiaomSfqc4
	3bnOmUOCh6OB87oW31F/0UhA4/s6Mf8l6+DLQGjGlEp9C27wa9KynK+oVAEqfnkrfQKdW0bK7mH
	uqgjzKZAXJbwcH/y29S7Phbf2/n7iSxNRdrkvfNIF5vH+r/0TlgUlQlY=
X-Google-Smtp-Source: AGHT+IH2Un+PPHn9xdFSEXRF38mKOLNo6GP/crRn8T8qZYBNsW/vbmq+E7TMe52rfUTaVB0f9YUhtEScwjpyKeZCvO6ASYyrSOnz
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fc4:b0:3d4:2acc:81fa with SMTP id
 e9e14a558f8ab-3d6d6c9ac56mr20999355ab.2.1743598262683; Wed, 02 Apr 2025
 05:51:02 -0700 (PDT)
Date: Wed, 02 Apr 2025 05:51:02 -0700
In-Reply-To: <56fcb1ba-b9c1-4ec5-b1c5-dc90e3d81552@lucifer.local>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ed32b6.050a0220.297a31.001a.GAE@google.com>
Subject: Re: [syzbot] [mm?] general protection fault in sys_mremap
From: syzbot <syzbot+e3385f43b2897a19be24@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, jannh@google.com, liam.howlett@oracle.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         e20706d5 mseal sysmap: add arch-support txt
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/ mm-stable
console output: https://syzkaller.appspot.com/x/log.txt?x=13bf9998580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccf540055069887f
dashboard link: https://syzkaller.appspot.com/bug?extid=e3385f43b2897a19be24
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
