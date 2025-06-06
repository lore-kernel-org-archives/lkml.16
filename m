Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325AF2F2E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749216726; cv=none; b=qYCkty4bDt2KtU/jXN/r3iGSeDXgCOKxw+HE2E6TWC4anlptr0wKsdKgthVVaBFHLeInk2vM2GJI3LmXzbvfXLqk6K6+sQinunWgbf/DfMw2dotxMYiSag67zSD/hq2lhM4RwLivGfcQlEBB2ckIY2+WYD33HetWMFyGf9+XQ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749216726; c=relaxed/simple;
	bh=pPxE0Rh7zt+WiUbcZhat5ZtYXJLy2EXUnzZmlBB8KYU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dkOjvfhNkLEEe4cI9gC6Fu7G3vC9dR2SjfmrhwsB7/PcpkT0qNizi0ZFMkyxcj+TNzEPAhuM5qXt2NLZBKblHypSBrIBhoduf4WYLtX0xAnC1N9UOJyEJ/6qDHkmpqwtmTlPhG/q8cpnPSkx8ZcBSRJIZxmKP8EwfyIP8I8xUXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86d0daf3b2cso397260639f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 06:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749216724; x=1749821524;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vy8jpwWKC1tsSeCMfFT/aQMZK2RywTQmkrz8RbjKPtc=;
        b=n+Xju6QwFosk1oAufRZHZAKpjlXSAhJHOyluAwjyk5moxF7p4tNqwA6o3mp9D+BEbB
         +nPwkVpUofG7pdUjruKuAaEH0F1LyyS5byzQvI0L4IQ2u83Qtk1M8wnR3j3wChIFjsmj
         GFWqJmxxDdy5tK2xs019LFLAM4rp864mKb7QMRc8f3jCkRkWjNCAjm965O19IMJcucPc
         s0mWOpMaMzF2J7JXxk27ibJYzMa3HNft8hEBhx1FlABJ2b8KcX2/sWuJ3+EVYLS1v3+4
         c7baqF71rQzt8UIDSfyjvFYyf+pg8TN0Hk7yGM77SnmzwlxgTyp62JlSax++5f+HjBcC
         6GYg==
X-Forwarded-Encrypted: i=1; AJvYcCUWLhIItQRCZwEht8hiygJgykJ06P+vAhTx0ivneLufBpe+VZNlwUl4MYi3k55taM1HK1pdliB9uiHnNRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWob2FQdQWShfhrOQR+TB37QpD/W9MrC0g2v6X2XT9LZv9Cs7V
	V7ulRIlAFXNHuFuV5L5YLMVhfurJW9MK8X21RU1gVnferRPiFYZrws95o10H3y7t/RVWXr7RqhA
	daiagJPrYuVMwycrfq95wrdTnVSaALY4nwoOHYim/w4Jee/B1joc6o2uQz/8=
X-Google-Smtp-Source: AGHT+IEqgzucn1d1hDX/lALBgFl0/Xk4uBHJDAvKDiE85gN+7nyegaotk81wpONgVQv4t79aG8wdbQhtNZoCrYH/XDuihhcHF0Bp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3713:b0:3d9:2aa3:fe2e with SMTP id
 e9e14a558f8ab-3ddce436717mr38359915ab.10.1749216724302; Fri, 06 Jun 2025
 06:32:04 -0700 (PDT)
Date: Fri, 06 Jun 2025 06:32:04 -0700
In-Reply-To: <20250606125623.1827-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6842edd4.a00a0220.29ac89.0041.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in vma_modify
From: syzbot <syzbot+d16409ea9ecc16ed261a@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in vma_modify

    7fcac9c9e000-7ffd51cbbfff: 0000000000000000
    7ffd51cbc000-7ffd51cdcfff: ffff88807946b8c0
    7ffd51cdd000-ffffffffffffffff: 0000000000000000
------------[ cut here ]------------
WARNING: CPU: 0 PID: 6557 at mm/vma.c:808 vma_merge_existing_range mm/vma.c:808 [inline]
WARNING: CPU: 0 PID: 6557 at mm/vma.c:808 vma_modify+0x15ff/0x1a30 mm/vma.c:1604
Modules linked in:
CPU: 0 UID: 0 PID: 6557 Comm: syz.0.16 Not tainted 6.15.0-syzkaller-12426-ge271ed52b344-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:vma_merge_existing_range mm/vma.c:808 [inline]
RIP: 0010:vma_modify+0x15ff/0x1a30 mm/vma.c:1604
Code: 0b 90 e9 a5 ec ff ff e8 3f 60 ab ff 90 0f 0b 90 e9 e5 eb ff ff e8 31 60 ab ff 4c 89 f7 48 c7 c6 a0 91 96 8b e8 b2 06 f3 ff 90 <0f> 0b 90 e9 46 ec ff ff e8 14 60 ab ff e9 57 ed ff ff e8 0a 60 ab
RSP: 0018:ffffc90003befb28 EFLAGS: 00010286
RAX: ffffffff8b5e58cd RBX: ffff88807e5c0280 RCX: ffff88802e4e3c00
RDX: 0000000000000000 RSI: ffffffffffffffff RDI: ffffffffffffffff
RBP: 0000200000000000 R08: ffffc90003bef6a7 R09: 1ffff9200077ded4
R10: dffffc0000000000 R11: fffff5200077ded5 R12: 1ffff9200077df8c
R13: 0000200000000000 R14: ffffc90003befc40 R15: ffffc90003befc60
FS:  00007fcac9c746c0(0000) GS:ffff888125c55000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000558b9147a950 CR3: 000000005bd9d000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 vma_modify_flags+0x1e8/0x230 mm/vma.c:1645
 mlock_fixup+0x22a/0x360 mm/mlock.c:483
 apply_mlockall_flags+0x2f0/0x3c0 mm/mlock.c:736
 __ia32_sys_munlockall+0x10a/0x220 mm/mlock.c:782
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcac8d8e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fcac9c74038 EFLAGS: 00000246 ORIG_RAX: 0000000000000098
RAX: ffffffffffffffda RBX: 00007fcac8fb6080 RCX: 00007fcac8d8e969
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 00007fcac9c74090 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 0000000000000001 R14: 00007fcac8fb6080 R15: 00007ffd51cdb4b8
 </TASK>


Tested on:

commit:         e271ed52 Merge tag 'pm-6.16-rc1-3' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13bcb282580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=73696606574e3967
dashboard link: https://syzkaller.appspot.com/bug?extid=d16409ea9ecc16ed261a
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=152371d4580000

