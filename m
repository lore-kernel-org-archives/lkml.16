Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9FB27BF81
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325692; cv=none; b=nTXY2GInj8gXxabpmMkTgMdoDI1BZ0iWh18MZv5xNv43ybGIArmbBaKebdH0iQfhSqB4H1WMpS1yhauyMASZc85dgGm1TUhO1sJEO8R3uhxJcU2EtTOiHMV4JIEIWazWvpwIGup5bgeUUUWoyzVrzuHv5hlzOVLBKAnXPCTZ2a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325692; c=relaxed/simple;
	bh=s0Lly+5EiFjtFbtqJC2EYdIUp3/HF2UfL6FHemjnw4M=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=KZTL/nmrFY1VXkhlYivqJyz4FKyqsGYxnVJUXh2GQ/XdYLLpBDFga9dwQpnC3hlFfl+JDkZfoIv3yYT0IwqM0Mv3PE6DYubbKmoKUOLqcCoFqEFRw9aDBuCxI6kwdLb+bxwBSKQk9BfZRWy+kqWlb8yqlpeER6209VY5RVArrqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d81b9bb1b3so47848295ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 05:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745325689; x=1745930489;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XabI1/RqwgBmusfjMpa9WeWdHvqbiQieUH0AtSV1/ck=;
        b=f6sF+Fwb24BoWPmzowXAagwbZoOUqBcwmdHL+QeU8sB6HCNMBFzvI5dlFNX0uizOUo
         F05IAB0IPwTL8df51c8N7lk/U8JaqPt+LA19pKkzUiekjaEzF6XBi3vpPCEpLT7X6ce0
         /Hrr50DoJ/8n1utxcyrwfQn9VJCcUPZrHb2Cwj3rjfngSWzkwtCXSQwDLyncFuVidCXM
         JNnC140R1xgG++A9pgNrFL5cAlsRwMRhviCjDwE7xZ9uGG8E3LkWbywIhMUb59lhA/py
         5L+gBlSZ0fUtteikze59Vtds0N9ovzDphBGG16L7gnasql07mOBwKODOjW2hdQRfT2wy
         5WAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYae9QfQaEG8va5Azugf73EEUzv+wttaitcJtYACEDpOu/WN6Vyn8mQ5GsnclNYOiXb6nM4fQfxWbyrCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP7xVcEWeKF2xWzrUDeAmdQ6G7LgWD4Ho/BpEj3hcrc9bgytuo
	58+W2a+DTizMxpUS6+7yPRQb8n//fYKLgPXsCq9g+s3TcQrHvawz2N7Exy6sBC3MZU6QttQAJhb
	86EWNSX8tbpmkBHgxOKP3feYOBa1/O+t085wBC2U+Hgx/ecRfimi+MeE=
X-Google-Smtp-Source: AGHT+IHsJFmvhTE+LiZnbVa2m7xTT+ulUSnaA4+MC58bJXSsdd5Bs6X9iVu6jteEb71dc9qKl0tjv/rZShIRDajGk1e7O+3MrZwY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b49:b0:3d0:4b3d:75ba with SMTP id
 e9e14a558f8ab-3d88ed7c338mr138875475ab.4.1745325689577; Tue, 22 Apr 2025
 05:41:29 -0700 (PDT)
Date: Tue, 22 Apr 2025 05:41:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68078e79.050a0220.8500a.0016.GAE@google.com>
Subject: [syzbot] Monthly dri report (Apr 2025)
From: syzbot <syzbot+listf1760c45c1a8a15cf5e1@syzkaller.appspotmail.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello dri maintainers/developers,

This is a 31-day syzbot report for the dri subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/dri

During the period, 1 new issues were detected and 0 were fixed.
In total, 18 issues are still open and 32 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  3442    Yes   WARNING in __alloc_frozen_pages_noprof
                   https://syzkaller.appspot.com/bug?extid=03fb58296859d8dbab4d
<2>  403     Yes   WARNING in vkms_get_vblank_timestamp (2)
                   https://syzkaller.appspot.com/bug?extid=93bd128a383695391534
<3>  76      Yes   WARNING in drm_wait_one_vblank (2)
                   https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
<4>  75      No    INFO: task hung in drm_atomic_get_plane_state
                   https://syzkaller.appspot.com/bug?extid=eee643fdccb7c015b3a6
<5>  72      Yes   WARNING in drm_mode_create_lease_ioctl
                   https://syzkaller.appspot.com/bug?extid=6754751ad05524dae739
<6>  35      Yes   KASAN: slab-use-after-free Read in drm_atomic_helper_wait_for_vblanks (2)
                   https://syzkaller.appspot.com/bug?extid=0f999d26a4fd79c3a23b
<7>  21      Yes   WARNING in drm_gem_prime_fd_to_handle
                   https://syzkaller.appspot.com/bug?extid=268d319a7bfd92f4ae01
<8>  4       Yes   WARNING in drm_prime_destroy_file_private (2)
                   https://syzkaller.appspot.com/bug?extid=59dcc2e7283a6f5f5ba1
<9>  3       Yes   WARNING in drm_prime_fd_to_handle_ioctl
                   https://syzkaller.appspot.com/bug?extid=0da81ccba2345eeb7f48
<10> 1       No    WARNING in virtio_gpu_queue_fenced_ctrl_buffer
                   https://syzkaller.appspot.com/bug?extid=5afbc12ca70811c2bffb

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
