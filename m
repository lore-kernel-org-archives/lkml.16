Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E007E2036F3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316696; cv=none; b=QWYLDpTKMwEtObu4Jlrv4E+XVJEcqBQobEPMVoIBZbp5IaY7QFB6+Z92ZGLo45/2nBcEdZm5A4hyRuc3GTTqh+nml96RSVFOhZcVXaZ5RILmyH5m9YIXtO6yuVjmDkGKME00MB3w1EEQad7WdrSGhBRPxlU6NwUdlQjkHzQsKOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316696; c=relaxed/simple;
	bh=KTWw2A2W5r7XIE7yNUuzgC4l1Uy5bt01OYJWw/4U4SA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=MvW8LnAcToI3Aj8bvUWNGQ+xtTJ9FzNRKEG9DQfecaFHMLvj3MRrm0Di6mfrbd4fi9dF0mqDNZgkZ2CZMQ4d47B/E6HGLqRoAPB+Wpu6RrxzOKyIRSZSGeeiAHHxjzMDWhVgoNdHP8Tvx1gpJRfUslcR6lKJZLXzAHftDLENCyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d81bc9b763so77218925ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745316694; x=1745921494;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qXwWJHvyf5rrUrVosJUo/obcxzIJOyen+c/SsGAvCfM=;
        b=bWw6xaRHRuUx8m8SN9+3hKevVKJbwSh8xBVDTvMe53W2We54qaeR4A5D+CmSkZ4889
         wwsRVlvsC8X9Q07lAM3d4fIryniqlDMq3dZ9O4gB5kNjkh+mTF6kE42gkdFa/EVsacMe
         Nj/aQgg1r3v11Oao5PC+myg/riTlYmMMqs1x+dErYkrAsrIBLWvJIcngW+M55UtFwv26
         mW78ED3GwEPSmUtJDMVUI6YbUEvIx4AK5U30mpHCTJKYsTa/W86FWeqXUVahGpPdQyGm
         R8/BHkt2upl/EReMuZ2B8K5/C6BoQS0STPMFPZRncFOzA/oXBxW7ZqAcLpsVUVOMOnCN
         vapQ==
X-Forwarded-Encrypted: i=1; AJvYcCVagE5EdlwvDUiI7FfhuPW8+evG+5G0HqvLg0LhAtJGCRhJmBOA39mnFhSwmvGK2xneIDWQi5yFgQPm4SA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJsfq+fW3pTHzf4Zg2zp+6JA6+3gXqwx+n3vVmcH9EOn4pRqVJ
	ciEGn5EEHxrqGjaUVqHHn31sMvt6inMRt1Nl70Hda4P1zl5F90jZ6LYqCn5w5frYlW2ycJ/xicl
	WL/2DWVze+4d+jopHuJhUlF4oKC6wy2CmhZNRivM9djmYoNS0ofa4Jn8=
X-Google-Smtp-Source: AGHT+IFdNZfRtpoJ6sqN95w/HZYWx5B3VCO9ZfcceQXYX5W2MnWsdfZ0gje5KvSlJjSLuGujxY1Yw9adOWR2Q8JgcRGr/RfCqvvf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2785:b0:3d8:1e96:1f0 with SMTP id
 e9e14a558f8ab-3d88ee6540amr156709575ab.20.1745316693994; Tue, 22 Apr 2025
 03:11:33 -0700 (PDT)
Date: Tue, 22 Apr 2025 03:11:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68076b55.050a0220.8500a.0004.GAE@google.com>
Subject: [syzbot] Monthly bluetooth report (Apr 2025)
From: syzbot <syzbot+list87f1666b0fff7a351cea@syzkaller.appspotmail.com>
To: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	luiz.dentz@gmail.com, marcel@holtmann.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello bluetooth maintainers/developers,

This is a 31-day syzbot report for the bluetooth subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/bluetooth

During the period, 1 new issues were detected and 0 were fixed.
In total, 53 issues are still open and 82 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  35675   Yes   KASAN: slab-use-after-free Read in l2cap_unregister_user
                   https://syzkaller.appspot.com/bug?extid=14b6d57fb728e27ce23c
<2>  6521    Yes   WARNING in call_timer_fn
                   https://syzkaller.appspot.com/bug?extid=6fb78d577e89e69602f9
<3>  1876    Yes   general protection fault in lock_sock_nested
                   https://syzkaller.appspot.com/bug?extid=d3ccfb78a0dc16ffebe3
<4>  382     Yes   WARNING in hci_conn_timeout (2)
                   https://syzkaller.appspot.com/bug?extid=fc4b5b2477d4ca272907
<5>  359     Yes   KASAN: vmalloc-out-of-bounds Read in hci_devcd_dump
                   https://syzkaller.appspot.com/bug?extid=ac3c79181f6aecc5120c
<6>  334     Yes   KASAN: slab-use-after-free Read in force_devcd_write
                   https://syzkaller.appspot.com/bug?extid=bc71245e56f06e3127b7
<7>  228     Yes   WARNING: ODEBUG bug in hci_release_dev (2)
                   https://syzkaller.appspot.com/bug?extid=b170dbf55520ebf5969a
<8>  224     Yes   general protection fault in h5_recv
                   https://syzkaller.appspot.com/bug?extid=b5691bb559396b262064
<9>  199     No    WARNING in l2cap_chan_del
                   https://syzkaller.appspot.com/bug?extid=3272785b7a1fc9b510f6
<10> 166     Yes   general protection fault in bcsp_recv
                   https://syzkaller.appspot.com/bug?extid=4ed6852d4da4606c93da

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
