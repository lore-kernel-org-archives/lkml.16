Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6522561A8
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750750709; cv=none; b=A9M//MKls0Dn7vOHEXmhJAvJvn1kURZ9Vvjc3ZeTNaaQGOIx5YM9Cid/1SsuhozTlMmhRIpS5Ai6FX+uhPg7ILIdtdZmJV/gZnd3ab+RvpVS5kf5HZDgc6lI9RFa76J/LkqcXU3SYg9iBskIlggcPmHOEBqjMeg/irCh4GXYh+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750750709; c=relaxed/simple;
	bh=WNgRBwFnYEXllrfGwlxUxY5w5SnMXa5axrAOkYr3weU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=HeeaWHXVHMCvM0VQxWIRF0t694K8qCmGsJmegAIyUT/q8dlsPxN/zYnZPYKZfGlMr81hmmV9xI7tsgm114vdPFfc7YM+QmLeG5GxrxC8uQquFSutRK3rP7y/kZdx/hU/urYoUnP61l1uB2KOzw72PKnniFhf9kXO7bX5JT6FtQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddd90ca184so841255ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750750707; x=1751355507;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pg2E10vssuCM+XsU6kDfEQQQvzjyCN2+uDtQavvqSw8=;
        b=l2PKMpol7yJNMhi9/xzcWkdsZj+9uaHcs0+lIWUd1GHjKDAd/Cm+Lf9NuWAk/UVRuH
         v22ZmwDxIo+g7PJwmH/T1PRNWNQkiiRfeyarVXtoAFJlzPcOvohj2vHf9lGPcVhdBlSH
         loLr0FjvfPlKTpNQX9muPclYAXGjG19B6r+LWzJXKvJ91H/oztmCL3iRTkl35IKkWfHw
         9lF+hROXv7CsXtbJbe/vHumla/flHDWRBvM4lwSGc2OyDMn6bXSjpjIjs2sXwG9KnydE
         9ry9U0LLA/1zqmfqYUo7nfLViZmjV5SvTQ1k6zZ4tfLkCh/JK3TW7k1mHlXxfQkNFXeQ
         BwWA==
X-Forwarded-Encrypted: i=1; AJvYcCUR+bc3NmV5ksnR8x1x3DaEMpWNSHdVrSIMf6bcuiWFJtAhOfCS0H7KG4pMaEJO4VN7FGl6QGEzS2JZQhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDYBXS9ELcFvaHz1TlBTfLIft0Gt3MRx+6Th0AsMy+etF2YicR
	5rydG3gA/QXwjQjgAmG9GD3ODJ07ZUCDKMi6KiZ++19zilb2hO6a64xBza9zGwZOizlGWsonu6M
	H2GGDT+IGFnrV+a2ABZ9zQ0kH5oPACAbg1b0bSwpjNnsJfHmb1H1B/h8h0n8=
X-Google-Smtp-Source: AGHT+IGmXj1lteBVLizIUDVdDyviXUzthLi4evb2aGIxC4PQ6/+po4X29wL4ufQMIsMqILj6huXDzh9wYX6W4RHDWeLY0HijUubY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:32c1:b0:3dc:8b29:30bc with SMTP id
 e9e14a558f8ab-3de38cc3076mr176561655ab.21.1750750707384; Tue, 24 Jun 2025
 00:38:27 -0700 (PDT)
Date: Tue, 24 Jun 2025 00:38:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685a55f3.050a0220.2303ee.0005.GAE@google.com>
Subject: [syzbot] Monthly dri report (Jun 2025)
From: syzbot <syzbot+listf9c7b18c782cecccf5a6@syzkaller.appspotmail.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello dri maintainers/developers,

This is a 31-day syzbot report for the dri subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/dri

During the period, 4 new issues were detected and 0 were fixed.
In total, 22 issues are still open and 32 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 6097    Yes   WARNING in __alloc_frozen_pages_noprof
                  https://syzkaller.appspot.com/bug?extid=03fb58296859d8dbab4d
<2> 1518    Yes   WARNING in drm_syncobj_array_find
                  https://syzkaller.appspot.com/bug?extid=95416f957d84e858b377
<3> 446     Yes   WARNING in vkms_get_vblank_timestamp (2)
                  https://syzkaller.appspot.com/bug?extid=93bd128a383695391534
<4> 81      Yes   WARNING in drm_wait_one_vblank (2)
                  https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
<5> 72      Yes   WARNING in drm_mode_create_lease_ioctl
                  https://syzkaller.appspot.com/bug?extid=6754751ad05524dae739
<6> 36      Yes   KASAN: slab-use-after-free Read in drm_atomic_helper_wait_for_vblanks (2)
                  https://syzkaller.appspot.com/bug?extid=0f999d26a4fd79c3a23b
<7> 21      Yes   WARNING in drm_gem_prime_fd_to_handle
                  https://syzkaller.appspot.com/bug?extid=268d319a7bfd92f4ae01
<8> 12      Yes   WARNING in drm_prime_destroy_file_private (2)
                  https://syzkaller.appspot.com/bug?extid=59dcc2e7283a6f5f5ba1
<9> 4       Yes   WARNING in drm_gem_object_handle_put_unlocked
                  https://syzkaller.appspot.com/bug?extid=ef3256a360c02207a4cb

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
