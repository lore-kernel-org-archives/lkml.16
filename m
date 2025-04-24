Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83142701AA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499368; cv=none; b=GwT/j/l4J/VSGsHa5OCCbxKrrDDrP0x5qCCUog9s8poukxWQVvBu/vaUQS5HQqdlbFj6Y+FXlfjDOQp0J69Lijw0IiMugLlis7OWlhewNKCo86Wryin8EDdY+AVXcip4Tw1sI3JzfT6oDxAY9u9qZNvLUx7Cxw9Mf8y3/V6RzS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499368; c=relaxed/simple;
	bh=wytmH7a5yV+mTmP/mf2zLdZqlGHahZ/qQLdzJIcj0B4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o44YpDq0IEVYZv6HyiSXJlTa55Dv7OX576iF8aADINhINz5QC4aOBeSUBqlRq2V+RCzs1k5erQZDZTmLItp/fNrnhbDXJFWXSQ46HaeyCOBLWpos2Vq+49IFdK01YZCzT4SE7NIp9UvHveTIntsjgI7s0MQ4yP5lUJELOlz0c8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QaWCtypJ; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QaWCtypJ"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-af590aea813so2085254a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745499366; x=1746104166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSWRON5bs+6mlhVmC4A6isWLNPJweUWm5K3Tnj4Gihg=;
        b=QaWCtypJNt40OogFeX7bt5jB4BnkdpS7ylHUH/e0bxt7WLzFBeFBDvefYasKFJCLEq
         h6MhqtHe/WplgYuSt1xBDhe3K4j03Z44F2P/jLT3uj+pw47ACcZgpc5WvekYrbnnsat8
         aNWyPkes7aYAxVmqCfrrjHpRcY2Ax10sJ2Ixjc09E1FQwYTEWaLx3keLd4lq7G/7gir+
         AFawJjCFdeMWXWfsg61VLxCtPldMQ7b4uT7CrumVxxsvbWCnx/ufcqg5ggYgze6+F+hK
         jxhJqIiscL5djMOudvJqUKWEH5CfYqzIFAaZPmjWCTLW+qBbvd9bsUG3mRtjF97sjslJ
         xRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499366; x=1746104166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSWRON5bs+6mlhVmC4A6isWLNPJweUWm5K3Tnj4Gihg=;
        b=YqpyoDnQ9WpoTrLalKvQOpzhwrrrg7m04V9BngOQhnWB79vSS0GX6mecQ6vHu5v1YH
         HVMcxdf6Z5pfxgRmo7t3SozCmC7NM5vlIdyDArEV5mVGizDvGuiVMvimN4hXBW80rZWb
         I65e6W/syY+vX6KhgefArP3GheGjj8B3Ih2N1Gkrm8zZiGLLCIjyBFNpgl8TcYsXnNMn
         j6rBLo92eAI1Ea6qG2uglpTJscss8630A5DaUrhhpRDrAsfoSf+2HYppnc8kYvmQ9Jol
         aANalVA2BWs7mT7SOvJQBCWBFJAmIn7eVwmuHlYHAzIjh6DKcs4NHYDaKolzF1Y3EaFR
         RyQA==
X-Forwarded-Encrypted: i=1; AJvYcCXgILhts0F8PoHeFUonGwCXOkd02AnkDoCE5uI2cZWvlhjOxr1ZzpI8STqtpgNxmPSFB4Qrj0BzuuOr5Eo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZd4WNG8hr6U09DNKo8NIb89AVKrlHyCZTucwdYgjnQvU3qiG8
	ofM5u+h86MflH1CGVM5xTr13s61vBew1/Oxob18COg1bx+uYPPgAY6CxLaXIqU6x/8McWTAiJQI
	rRBRcd+B35Z34r/ZbpWtzmBSNLPhR9g4ekx8o
X-Gm-Gg: ASbGnctMYIcX1QW4p3OAnKe8yfxMHdCAdM8m1aV4mBVQNrQsrnrUwGYleKcf7TZwUnT
	TNNYZRcHmcDQcNj8zC06ZMZTi4buSmRYnTy2/QPejmDNkZfbxzKCZ/LrC0rJhujr5Zrwc9tHQFx
	Ps0VsxxdUMZvFhZff2SXbDeLDHPkTG2ZzadRBPkIWKobUS8pmGbeGk
X-Google-Smtp-Source: AGHT+IHbBDJRszZSled4CmWTPaftUgkcEDj8QcHI1jzPj+1jSYfi6PL9BwWaDk5Y1ey2LeNyPUAjVgmzfuh3lQXFxjg=
X-Received: by 2002:a17:90a:8a87:b0:309:f46e:a67c with SMTP id
 98e67ed59e1d1-309f46ea6a6mr170830a91.11.1745499365881; Thu, 24 Apr 2025
 05:56:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <680a33d5.050a0220.10d98e.0006.GAE@google.com>
In-Reply-To: <680a33d5.050a0220.10d98e.0006.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Thu, 24 Apr 2025 14:55:54 +0200
X-Gm-Features: ATxdqUGpo0kP3QfW2IPGszt9sTV6h7B_wArhkeQAE2UapEW8Hp8tyjMIS3Ixh-8
Message-ID: <CANp29Y4Zve8dohEhZ=12-w2SPOmOKbtt6U4MTvaK37CRrTQtMw@mail.gmail.com>
Subject: Re: [syzbot] [kernel?] net test error: UBSAN: negation-overflow in corrupted
To: syzbot <syzbot+76fd07ed2518fb9303f9@syzkaller.appspotmail.com>, 
	Kees Cook <keescook@google.com>
Cc: akpm@linux-foundation.org, davem@davemloft.net, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ Kees Cook

Hi Kees,

This boot time error appears on v6.15-rc* when the kernel is built
with clang-20. It's apparently related to

commit ed2b548f1017586c44f50654ef9febb42d491f31
Author: Kees Cook <kees@kernel.org>
Date:   Thu Mar 6 20:19:09 2025 -0800
    ubsan/overflow: Rework integer overflow sanitizer option to turn
on everything

Could you please have a look whether it's a legit issue?

On Thu, Apr 24, 2025 at 2:51=E2=80=AFPM syzbot
<syzbot+76fd07ed2518fb9303f9@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    cc0dec3f659d Merge branch 'net-stmmac-fix-timestamp-snaps=
h..
> git tree:       net
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D131c21b398000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dac0f76cd0f8e0=
93a
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D76fd07ed2518fb9=
303f9
> compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd=
6-1~exp1~20250402004600.97), Debian LLD 20.1.2
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/1d6f321414b4/dis=
k-cc0dec3f.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/072c28c931b0/vmlinu=
x-cc0dec3f.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/bcb44ff40c55/b=
zImage-cc0dec3f.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+76fd07ed2518fb9303f9@syzkaller.appspotmail.com
>
> virtio-scsi blksize=3D512 sectors=3D4194304 =3D 2048 MiB
> drive 0x000f27f0: PCHS=3D0/0/0 translation=3Dlba LCHS=3D520/128/63 s=3D41=
94304
> Sending Seabios boot VM event.
> Booting from Hard Disk 0...
> [    0serialport: Connected to syzkaller.us-central1-c.ci-upstream-net-th=
is-kasan-gce-test-1 port 1 (session ID: e72bd3249fa5f4b40b974e21e6d99e16e83=
84254f2e85c0fe39918dcc479fa4d, active connections: 1).
> .000000][    T0] UBSAN: negation-overflow in lib/sort.c:199:36
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/680a33d5.050a0220.10d98e.0006.GAE%40google.com.
