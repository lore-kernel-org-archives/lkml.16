Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175551C84D9
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750663887; cv=none; b=bkhYFUAaLfow6ey74MomNJ3uIrZTJZKIxp7wPHn31bkV55UbzjxQ8Gz1tRzJC1az7jK3sjDOw7CQU1ufEOQw4brEgBlKFJSPZa9h+0UxhR0HO4cV8S+pJC/l4j7FvBohafEBkYn11oleO0PzbQM3D1c9WbZWJcjX9R/ZVTKEMUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750663887; c=relaxed/simple;
	bh=imGZmfIS92AT8M2UOSabAeKhGS38Zmqtfb/vw4laE4A=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=fuNJDGyFFy3FeRnXIgRwZ/TasB96fOVZ4Oj17Wd5/2hgMWVpCHqmUxy9CHz4W4MSklo4xaBDEiuMo9UTFxytYIgOLG0+tlvy1fnRtyF/5ypGZ07/L9oEFGrp+q/a90Me2hjhmotQO4RRmvIEloGAPquEa/n+ZeBQRdNO99vvQig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86a5def8869so742873239f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750663885; x=1751268685;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0LBTl20fx9cwH1yCh37c+MtQuYCafOELjlm2HlQGtHc=;
        b=dkFd33hoCWlfQDIVa6bK72WqowM8PQMNDWno7wRNnqIuA1JBxdbsCo/lEJ6poKPCEi
         78NV0YAJZFPHMG/0CPFOldHseshMgsCyErU2CajY3mNfjSwxGZw5uLPXHmv4cKEU8sJp
         R/DWk/S4hBoiYWndegBGWwp7ydYFK/hMPDAixuMEvnHJKfjukhzR1yj1r0Vi/K6kNu+Q
         YYB2FLYmGOmfIKqMTlmxUwIoJPhMcc/MpUHHEuSinz985Z1TZb/KNL8s3S1PuVHh7bKj
         DzmiamG83TKshUaD6jl5/qfIakv9RdRi8/lM4o/F32YjmgLlvHaCT/N3+v/Vj0x5ldqR
         jwWw==
X-Forwarded-Encrypted: i=1; AJvYcCVcWvxoxLmY+3my6c3dV991SFYyRNiYojCwCmdNCi3j8KgmF+U6RTr6zwbKsbMy2S3wvB1dM45Y7uZZNN8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/RTNWSJ/DO+8he4lr9OkApduHTsM0gnD6XV6bgTSPAHZHfHf2
	Cz/3DkxWs6s6a3fRyD7jtwGUIYh19Zn2pryuE+90ICnnaR3B2VH6SxLv5Aub5XnYdsW/BcoEYwT
	3+S5BAhVdxqcEfExi9C/2EjZtesDx0VLaQ6i0acTzoW8DqTtVn3p1+DC4VGQ=
X-Google-Smtp-Source: AGHT+IGriwPmUf/QWYfE7lUZ7AQ9LCcX7KKVG+vi5BTy9rGDsCk7pJ/gNU8WhbgWiGyQF7+1ySHJbZOdx8h+Lca0DdXQ/rnvLr/b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3415:b0:875:b8b7:7864 with SMTP id
 ca18e2360f4ac-8762cf399bfmr1328878839f.6.1750663885314; Mon, 23 Jun 2025
 00:31:25 -0700 (PDT)
Date: Mon, 23 Jun 2025 00:31:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685902cd.a00a0220.2e5631.000e.GAE@google.com>
Subject: [syzbot] Monthly bluetooth report (Jun 2025)
From: syzbot <syzbot+liste6ea989cc3a25b8a140d@syzkaller.appspotmail.com>
To: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	luiz.dentz@gmail.com, marcel@holtmann.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello bluetooth maintainers/developers,

This is a 31-day syzbot report for the bluetooth subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/bluetooth

During the period, 0 new issues were detected and 1 were fixed.
In total, 43 issues are still open and 87 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  40131   Yes   KASAN: slab-use-after-free Read in l2cap_unregister_user
                   https://syzkaller.appspot.com/bug?extid=14b6d57fb728e27ce23c
<2>  6964    Yes   WARNING in call_timer_fn
                   https://syzkaller.appspot.com/bug?extid=6fb78d577e89e69602f9
<3>  2709    Yes   general protection fault in lock_sock_nested
                   https://syzkaller.appspot.com/bug?extid=d3ccfb78a0dc16ffebe3
<4>  675     Yes   general protection fault in h5_recv
                   https://syzkaller.appspot.com/bug?extid=b5691bb559396b262064
<5>  507     Yes   WARNING in hci_conn_timeout (2)
                   https://syzkaller.appspot.com/bug?extid=fc4b5b2477d4ca272907
<6>  404     Yes   general protection fault in bcsp_recv
                   https://syzkaller.appspot.com/bug?extid=4ed6852d4da4606c93da
<7>  351     Yes   KASAN: slab-use-after-free Read in force_devcd_write
                   https://syzkaller.appspot.com/bug?extid=bc71245e56f06e3127b7
<8>  258     No    WARNING in l2cap_chan_del
                   https://syzkaller.appspot.com/bug?extid=3272785b7a1fc9b510f6
<9>  256     Yes   WARNING: ODEBUG bug in hci_release_dev (2)
                   https://syzkaller.appspot.com/bug?extid=b170dbf55520ebf5969a
<10> 170     Yes   possible deadlock in l2cap_conn_del
                   https://syzkaller.appspot.com/bug?extid=b71bb48c13bf3fed3692

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
