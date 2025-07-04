Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AA7270ECD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751612886; cv=none; b=XA77iHwUwR3XGObMKLzLha+aprAld9lZj7ZsLEFk+jdViN0M2XzE+vEq9/y2BZ7UgYsKZF/I8en1PRrBk3lLPuYfPA+0o41sv+t26ndGtrR3c69D/NuxfwLO+FkQkapo3aUkIdPPF42Ay87yx4lj9LY7BFMjIx43YLCqSqxy0QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751612886; c=relaxed/simple;
	bh=uDGlimWCtCa80oGCygtVo6BsaDVU0Q5tZ8O7LKg6p2k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=DLkp4Hm8rDzb+Xvf/6kLtXCF6nrQBFPsuPVXfEWSHcikdVbbbqIssaRDlnk4QwFQxvhiSTYyMUPvWQNJvs4iP0Y3IeEfFY8emQLPS4I3Il4GZZsQSFcuqjONu7kkAW8hnuNqyXv7gRYooAN8qu9E027MXu0nbLSn62WTxzTnLaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3e055be2288so6109245ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 00:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612884; x=1752217684;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HzWOafE5MF9vsfPuTO/NDlxmvaSpk/1NDrSQLOZNCD4=;
        b=CxEzYAyH0MCFxc1dYadGpB1HB2iwzq8Gur5ZbPgBB49u4CpLoiEmwEDcciDXbVUN0+
         QVw8dsJ2OP+cU4Ko+CzOkoJZibPEcpnlnF+Wkjiv2rydS7t2ca2emCaZMGg7HVof5Ae7
         /pN1RT2o/ohRw61GIBoiH3sNzrkyJ+Uf6gEHzCfldLw8dfqR5+ZWgEgv87keCyZkM0Kn
         7gxt5ZNq1ZBOXf+dwEvTmdzzmH4GUd8cGayvKhRxpx9h9FKhUya6M1XfP74+1a3MaSiL
         1fd+/uvhrJBXGaHACbwY/4xaX4z9LKpQaPlGkH+3HEhKHcBApSpBt3KGP1HGWdJ36Ym3
         PImg==
X-Gm-Message-State: AOJu0YykPjslbcMPxO82l3CdraceV0LVIHVorApNhbEutv15oiMdKare
	+8on9Uhr00kh/li9B9lyujjdVfKZcLy15u4RNE5UsaCtz+KDuNMsdhWHlnwqjM9bzJhrewitxB2
	N6C899cZJmdmAO7kTaHFCTPD+XFlC5NQptYCEuTgQLgOMoESE0o7QSpm7g14=
X-Google-Smtp-Source: AGHT+IGkOBMdlQDPDpAIml6qexLih4/K5RfamCoXZB2n1Ep4n0AWsMOIasWsuUtg/ih13SxgK7B631EVfJYMBHWd5uHO8HiXi6Zo
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:248a:b0:3e0:6066:4db3 with SMTP id
 e9e14a558f8ab-3e136ea4a99mr8266085ab.4.1751612884099; Fri, 04 Jul 2025
 00:08:04 -0700 (PDT)
Date: Fri, 04 Jul 2025 00:08:04 -0700
In-Reply-To: <20250704063242.3943487-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68677dd4.a00a0220.c7b3.0017.GAE@google.com>
Subject: Re: [syzbot] [net?] general protection fault in drr_qlen_notify
From: syzbot <syzbot+15b96fc3aac35468fe77@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+15b96fc3aac35468fe77@syzkaller.appspotmail.com
Tested-by: syzbot+15b96fc3aac35468fe77@syzkaller.appspotmail.com

Tested on:

commit:         4c06e63b Merge tag 'for-6.16-rc4-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=114eac8c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8b0724e6945b4773
dashboard link: https://syzkaller.appspot.com/bug?extid=15b96fc3aac35468fe77
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12dd8582580000

Note: testing is done by a robot and is best-effort only.
