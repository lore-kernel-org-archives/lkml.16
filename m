Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965612D2382
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773281; cv=none; b=LgmeYIATunnuo/23N613z+AsdSKx5ehUuEV13MLmICqUd0kjZs8g2mQApTYFaHpps9CH7ovY78QJBxGiCUVvtiyPDY+OWNL911hFS9A6EPZjobSvdh1oPPrYHIfS67dxhJbN/UIUr7jJfU08PCottDZVHPIZGBlCdtMAKghHwIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773281; c=relaxed/simple;
	bh=3Ikgk0RNP5wa3So5Pmyi/a9XYoPgLZ2K6YsEYknW44Q=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=PNZIC9yomrityWRTR3G7CXBDxbm11LIH+qhkPrth2XyMIYEpo1XYtvBBEtoTh3gkd9eYm/SbMJMKVD/oThDURfe3eyE2nBscCUWcUchyx3IKuA6T0uXZC8lCVrls3Z5gTF8ap5u4JaE9Q4urBiJXwa+WRYWdRWnkVM0gIpqxM8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddc0a6d4bdso63844245ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773275; x=1751378075;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZBXips4retRQqXhq1myZCY5WlzB3Lt/qf8dWq6m6RAY=;
        b=pwknkt84yyYF3MSjep8DKruQo26pJf/e/PUawNj7f0JdtNLxqNr4vHjDjuVicBvUqt
         Nr9m0Yolc41tCoenAb1lzToxxiDz1wiLm8NoiKYeQ5+ZLknj7tAIr3qEHeOmPx5k+B8B
         oeUbtmbxLy8MfaEQ/TwHefw2vwsnr3NdFQGLfw3hjwN6Uh9zjG833PfEOW8xQPSNwoeS
         /VhioXEkRDhg9CMPwnxwkASsByWJIyHmR23NzTxnqDtoX8nftvEeOzm+vIUrTnmYBicG
         YmhTCEvtd+CEZ+BdjXkICsRYJj5f13vgICUAIFqtToUR5VRB5KTMCXR3VhozOqZYQmet
         qaOw==
X-Forwarded-Encrypted: i=1; AJvYcCVMs7QOCd782RWAHJXUwPfttDGVJTHfUQrFzgZcP+iVJM0OJen5Ct99TpjcBbWDyPyAACDavi9Q9IJu7EI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqqhsGo3BamoFSrDXW5ps/LpWoP54om+QzMxMFuPd0wmsAkgd7
	FYe8TJT5iXX4HVoH6xeAVDPG3eiAUAIrg3OAW3nVjIZfQVBmY+SA/kMgsyLtZ4C1vGshg/Nlem+
	iy8kVQo3CgRaHLfNxnAYIwNdBQTDMFtcdCs2fhuJ5BOXCPz3cbc0MnJmhRzs=
X-Google-Smtp-Source: AGHT+IEVg2HvxdBGC3Z/CBq8bM8i5YneZA1frF9U7XjXN6p8SYXDUtPCPRRVRtHnZ/73111tUo16X4wxoV8SUQBmEz72MtlJRJC5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:230a:b0:3db:7c22:303c with SMTP id
 e9e14a558f8ab-3de38c34e96mr189511225ab.8.1750773275504; Tue, 24 Jun 2025
 06:54:35 -0700 (PDT)
Date: Tue, 24 Jun 2025 06:54:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685aae1b.a00a0220.34b642.0032.GAE@google.com>
Subject: [syzbot] Monthly udf report (Jun 2025)
From: syzbot <syzbot+liste67dd1bee815523507c3@syzkaller.appspotmail.com>
To: jack@suse.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello udf maintainers/developers,

This is a 31-day syzbot report for the udf subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/udf

During the period, 1 new issues were detected and 0 were fixed.
In total, 7 issues are still open and 36 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 11896   Yes   WARNING in udf_truncate_extents
                  https://syzkaller.appspot.com/bug?extid=43fc5ba6dcb33e3261ca
<2> 1142    Yes   WARNING in __udf_add_aext (3)
                  https://syzkaller.appspot.com/bug?extid=799a0e744ac47f928024
<3> 443     Yes   possible deadlock in udf_free_blocks
                  https://syzkaller.appspot.com/bug?extid=d472c32c5dd4cd2fb5c5
<4> 71      Yes   WARNING in udf_setsize (2)
                  https://syzkaller.appspot.com/bug?extid=db6df8c0f578bc11e50e
<5> 23      Yes   KASAN: use-after-free Read in udf_update_tag
                  https://syzkaller.appspot.com/bug?extid=8743fca924afed42f93e
<6> 3       Yes   WARNING in udf_expand_dir_adinicb (2)
                  https://syzkaller.appspot.com/bug?extid=545e45805722d117958f
<7> 1       Yes   WARNING in udf_fiiter_add_entry
                  https://syzkaller.appspot.com/bug?extid=969e250fc7983fc7417c

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
