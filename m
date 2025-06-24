Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28F72C325E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773148; cv=none; b=O106HquFk9zDD6Y+8aNVu1l1VWknmYXdkh67YW0/HtUkJPMN5O35vpTxXAh0BSq85fOX469L8LoMuZ1iD1upuy59TCP9SmRz8Vmdniqnnkofsng9Um/GeP2V7XZU5HX3ziImTVecVEavr3I1eY5wZAbf6j2R9mszr1KUMtGR7mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773148; c=relaxed/simple;
	bh=/ALEGiV3XIYP3QAfWxDFxBrqleQv0n4si9jhZFHSDz0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=MobsB77bNboyANqkflJGKdBM0pMUnl78BYGraKHInHfiW617HGTjuSQo41O2uYl7FhnrpQ9TbQFO6PmW+sjnQ/WUxuvFjdyWbTNwj2bPVajruN48YV1g4f+JBeba2NtUll1DmaxjuXgR8vtE/F40OpWIjdp36ZkLls1Y1ThVvyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddba1b53e8so5490045ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773146; x=1751377946;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xWusZ06Q3dT2LxHdhDSz5CMM4uIUIORh9JokdAFGmXk=;
        b=WfyKxn1gMQBym9DFeQRH3Ps6LjNZsHVD/ph7pX93jGnTL0KFz7k45qGrWXsov0rxF3
         mLKtcTZCn4t/KY0sxxL6bwLt21XJZI1fNpNFhPVOBZG9n3Z774fdkt99WSwCuugHaQef
         ASG/q8AyVWIjHiTa4TYBzQIOyr8R18b/XnkEQQ1hNmJZNQqlmy6iy52DBrLpwplF6WQb
         UYHIw+zWTyIav7KVAkHiH8ySqtyH7SOTHolmdQlCmEis5CpHRPGhjddurPBTSexKuj9K
         WhvPeO9gdNR8Mnpp7YSVyOMIZMkrW2BgC6+gqT0EAN5gVUYByW9fF4SL6eBfvxy/QrMU
         IKZg==
X-Gm-Message-State: AOJu0YwdFsYZU4NZX/n3bpzHg/efOQU8CCFc0hNU6+kdGN5y8tUlnyum
	gkGMW3j3cYqfflYXXv/AACuJzRdq/mX+0Oajo08r4uENwoQf+12gW2QgwsxgkIdW59pwgU0m4d+
	F8Fn07vx260mfWylYXeS9SL6GBpd2ChkOk/1Oqv17mhlj8/mpVClQIA/wgMA=
X-Google-Smtp-Source: AGHT+IGYW7QjMHo3rR5c+vRzWStklN5ICnGhg281Zi6QSQNNhmEYfmmkeuiyfZ5HKRzACdzaP+DRIsBBxXOJjVsNsbdOJ2YKILjU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2217:b0:3dc:7a9a:4529 with SMTP id
 e9e14a558f8ab-3de38cb10cdmr193051655ab.16.1750773145851; Tue, 24 Jun 2025
 06:52:25 -0700 (PDT)
Date: Tue, 24 Jun 2025 06:52:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685aad99.a00a0220.2e5631.007b.GAE@google.com>
Subject: [syzbot] Monthly media report (Jun 2025)
From: syzbot <syzbot+list23d244345d51338bae23@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 1 new issues were detected and 0 were fixed.
In total, 21 issues are still open and 96 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  1701    Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<2>  421     Yes   WARNING in smsusb_init_device/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=85e3ddbf0ddbfbc85f1e
<3>  313     No    KASAN: slab-use-after-free Read in em28xx_release_resources
                   https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
<4>  149     Yes   WARNING in smsusb_start_streaming/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=12002a39b8c60510f8fb
<5>  146     Yes   KASAN: slab-use-after-free Read in dvb_device_open
                   https://syzkaller.appspot.com/bug?extid=1eb177ecc3943b883f0a
<6>  34      Yes   general protection fault in dvb_usbv2_generic_write
                   https://syzkaller.appspot.com/bug?extid=f9f5333782a854509322
<7>  22      No    KASAN: slab-use-after-free Write in as102_release (2)
                   https://syzkaller.appspot.com/bug?extid=47321e8fd5a4c84088db
<8>  9       Yes   KASAN: use-after-free Read in em28xx_close_extension (2)
                   https://syzkaller.appspot.com/bug?extid=a11c46f37ee083a73deb
<9>  3       Yes   KASAN: slab-use-after-free Read in load_firmware_cb (2)
                   https://syzkaller.appspot.com/bug?extid=db4326df1b9af04f68fc
<10> 2       No    WARNING in az6007_i2c_xfer
                   https://syzkaller.appspot.com/bug?extid=a43c95e5c2c9ed88e966

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
