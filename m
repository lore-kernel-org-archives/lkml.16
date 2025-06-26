Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF59282EB
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750908904; cv=none; b=sm88u/X7zcM3/RjLnXJPzMuFlNy4LWCe9cQgDtjw2WCLxgeTuuSkCt5qgXIEnBaclu6oi8Bijo0nuKafBKZ4A8FTxQbc/y/KExXOo1PFjyCQj5Zs7c9CDPcen25RKYa1hm2HPgmuwijOmmYewbIG7qdnRKwSPEaevBnl/RJpZpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750908904; c=relaxed/simple;
	bh=iiEuxtPMysmS4QlK83yylTwNj8qbTIREBQF1Vb2nwdI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=F4xOPBTzrRjVojXAwVeFr0hgb49o4ZQlQGTlzT4H9G3N89W+s2KFcrIs8gH5ZK15wWn8tt8DaoQNqElWB7pOI2SHxM2wT3hhVWhnkewA/8UU8G4enOpBeQuK4wZnjkBZtjoCgR4PlUXX5I2kcX/YptepyGnWzEfkaECxtmgWBnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddd97c04f4so6827465ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750908902; x=1751513702;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FDY8PR8gWnHBIr4iJHH5a2bxsHeqpKj4ORkUhs0LETk=;
        b=J8Wdp59nLB7liUVZNBdK9fiIg8vQkalXEpv0311Lrg9WbNLs7dSonkgCnpAGnh5NYz
         mndXDTrTLm50kkTVXudPRALSr0LMIA5OLD+DxRCqJSV+T0yotCSiPONCyZ/+qJ2NL3dY
         WY/2AtxKHU4g4s4eS3vWk1Afwr0EVZ7L2SnHefVTlxwK02s18xSOeWlhWszHatP+ugj3
         N9Gr7YWm+hsnYcRlLEixO63U8HDh3rakGvRPUcB7SxAT8VeoxQUSrGd0pd4jlFWB4F+X
         OdYpRuow/K1IF26eKmnxV4RcC8UbaLKYrEFEOpiJpo2fMN+gKoyR3Hn+IGJZR3feB0WV
         jqNA==
X-Gm-Message-State: AOJu0Yz9RliW0fqDL8rE5EYCWidaJv25KgPsSlTM4keZUn4v52pGVM9q
	7FUvtNqgN9SijbYscDOP3046OFAk43aOvTCScLH2bmt+i7XoUPBU/7obW0VBXJzN7/O5E91kfje
	c6enKeNtK8jpWf52jmqtLEVBfgkKp9H7Uk+OLGRVciEkvbmi0sHhGyfGYBLY=
X-Google-Smtp-Source: AGHT+IFXLiD+6dCBzPCRiDYprDpw4+FwK/nvOXorEhpv9XEUDtwFfLhmfXsfJjm2oAs6EUmevv3ARQecTu7GNPPPKPi6MAeJqXMh
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a04:b0:3de:281b:d0e4 with SMTP id
 e9e14a558f8ab-3df3dfd182bmr27264565ab.2.1750908902735; Wed, 25 Jun 2025
 20:35:02 -0700 (PDT)
Date: Wed, 25 Jun 2025 20:35:02 -0700
In-Reply-To: <20250626021712.2842722-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685cbfe6.050a0220.2303ee.0118.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl
 (3)
From: syzbot <syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com
Tested-by: syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com

Tested on:

commit:         c4dce0c0 Merge tag 'spi-fix-v6.16-rc3' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=155df70c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=595d344ff0b23ac5
dashboard link: https://syzkaller.appspot.com/bug?extid=9b9124ae9b12d5af5d95
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=178acf0c580000

Note: testing is done by a robot and is best-effort only.
