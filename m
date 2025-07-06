Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BABD29A5
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 02:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751767803; cv=none; b=Pu/6Tg1LvvoHG9xRTZMvL29mU5duH7t0LROZDf147NuikELEHLCTZrn6loWM9Cj4zdF74SL5aXme8Xwtu4CwZohU7tp0QIcPAcqkIZ+yrKFXqTmQQLzWLIiDhBjSTRwxSaBCdTMlsPOmQa3Jbb0jocGn7zF3ItoKQDlRnSMhMdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751767803; c=relaxed/simple;
	bh=NcJwW+b8eqc/0WUbgKUzPSP473u3fHJ4oOuQR5vx/Tc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jhJQWpy4mKQorEIN+MhRC5LPHU8C/X7SaW7FfHIsMzBacoKYdHqUxrUbFWy7H/KT/V95oqjZmFSglWoOXDpqXxsMxdDp4HbKriCvhH4fya09b1OTJtWnNA73VYTO+h9mwbMM7ZKSRS/RmMKx8JdqaLUm+fW97fJNNk1vFhNoWzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddcfea00afso32154895ab.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 19:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751767801; x=1752372601;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aBNYQY04UHiFpoMj/+nY2xXpvMTRuMED18RX9TytqFk=;
        b=udEpuGabm1rdRnqApbi/wsn4HS2v5nPcJco3HUYzjYfq+3GH+BQVAoPdl3d05+nbuG
         wCz1FKtycHRSGOeeAvDp/5ggfObi2Ag1DMKLwm+J4arNglJqIYaT4VcuKvkJOcpcgWWy
         eHsj9J+j6LRPcKj7q4tsQlM+shcM+MzlUFMA4fJ/epr+bbzhehIdTlGyKrL6gz1xctS0
         TSDF7Y9TU/lM+fOs4M/g27Fh7b+Qp4V4+BWDEJcdnCo739JvlQJqiDFssRnjU8LXPUyk
         one8+Qsj5sphFhsg64b6ukeYYG4/drpzIs1CN3QwdrB4QqHGBYbzfcvnaAanB/kYZl5V
         zD5A==
X-Forwarded-Encrypted: i=1; AJvYcCVdxUpSwthY+EDtkt3JCvUZBdwXGqTbnAvEbiOltBllNtpSTdFZrHc39LigPdfJG4UJp+cW0uPA0guSbn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGFAmUvcLaeE+Xw84wqEaUP9G2YtqCS0wWwTHLGguD1ePiMie8
	mLr8msuZWZPRg9NmOH3MXxvHdpI9rA/iX0BQm3fDCv6XoWBYtbpjBkFukR1LvGmOVvYYINT6Bnb
	Gtu0Pc9VCFB/VZh7rNkwLupjrNggvYnOTw76y6WDfVlsZNY1LM/6BY4RxAYg=
X-Google-Smtp-Source: AGHT+IFVnuIgznWqXlgEhxS38XEiGmBvAH2PQBz3JtKxjZMrY8MWW85ez+5Eou81d6Xxjvg0LynXGEcrOx12UQf2ANDO2n5axw6A
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:378b:b0:3df:399d:39c9 with SMTP id
 e9e14a558f8ab-3e136ee4883mr74301285ab.2.1751767801434; Sat, 05 Jul 2025
 19:10:01 -0700 (PDT)
Date: Sat, 05 Jul 2025 19:10:01 -0700
In-Reply-To: <tencent_9DD23CBB367696BA36224B34755576736609@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6869daf9.a00a0220.c7b3.0054.GAE@google.com>
Subject: Re: [syzbot] [kernel?] UBSAN: shift-out-of-bounds in pcl726_attach
From: syzbot <syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com
Tested-by: syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com

Tested on:

commit:         1f988d07 Merge tag 'hid-for-linus-2025070502' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=150f2f70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5ba6cef8f153bfeb
dashboard link: https://syzkaller.appspot.com/bug?extid=5cd373521edd68bebcb3
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14a4dc8c580000

Note: testing is done by a robot and is best-effort only.
