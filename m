Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9349D282EE
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750941007; cv=none; b=dmvP2fD3YA7g20gWKXQcvCHSuFZcQ2whxsJEiAjG7RiVpL9jyQeUqHANBhhX10rSpjJ490XdbxEhJZonIPTh6nPyx2IAAz27JsLEVwArMdecB16rS1bEQQKcG5+NJjyqi48cfq6JvzDhFQavQbPwfqZk2bRWaKdI3wDmkhg2nec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750941007; c=relaxed/simple;
	bh=CXStEVJvcv+k2Q2vxM4gbvEwCMVyfWubEkIRfPVOaNY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=AmFmFUTOe2KhTzjLP3UK7UC3JcfYM3zyDVvYakWEegeog823oBhZxCqD1+DbddOQT/kI1KYuM/RXYa0PxLOkV1+/iC8c2Up/NTAi5mqGFqy0iQQTdXfR6OyEcAMl6Avg/eRAdx5Imu6s5KJLUDjSjsVYzRbriianCGPZQzd6TZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3de3b5b7703so5851885ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 05:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750941005; x=1751545805;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+1o3hxzaUWzzHbBMm9wAarkIlEGX97bbmCARttE5VPQ=;
        b=cXMmDRbTddiQVZpPl/9Yk05xAVkVsZR4aAmAxUXQ6EqwHq2EW+0iIpLFSsKXmUw2G2
         Ckple2aNaTpDiRg82FdsUGZjvdkp0vS2YdfHlG4iHsowgMfREE2o674nHWTZrTVbD1Qa
         rggDNl1FimJpmZcEwJPtjQ9bR2r6gfNeexQxaKHfgLVrTSBw6mwIPW/BDCdHNQ4RxBx7
         aZso/xih/CkAsf8x2xzarmuMnOMIfU3kcLgz4Q1TS6AQFmHDrRbet2dzBdMt91Z3j9Wb
         inhn9Ugsa3vjsQ5lYYjBaoEygbVl8huOujCRS3Xa98hnTyDzBGlQCnrwqxSii+pNPsLT
         m27A==
X-Forwarded-Encrypted: i=1; AJvYcCX2X7duZbNi1BkYrWnwwION9Ozx49wIHHuvTEFwwBHCJH62S5RP+M/PzgG3mbNkZ/ulK0L6L2GNokxoGiY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Y3lm1eqiG0pvfFbjv0z94Bqo6hbQW6HoZVLHiDaaqVPRBz72
	CNZ/1OajmlHljN/7+rkp9wdtYl+h2Ky4xBKh7B0G8GZnIJbEIMlV4YZXty1A7Pw1st7dTUn6CVP
	y7JVYglO8Hz79GPinrGj1V1QoIeZgelJelfouVd8+d6eaTYsq3Xn3KpAlMQQ=
X-Google-Smtp-Source: AGHT+IFmpFVzPKBoE8YpXAKWX9bRYgOts+wBkYkpz0Rmx1o0jFY1lr//x9Pitxn4d9qLuNlh9BrgPCyx/LGoedvKFAfm45VU3+2p
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c241:0:b0:3de:265a:12b with SMTP id
 e9e14a558f8ab-3df32996d19mr16301395ab.13.1750941004729; Thu, 26 Jun 2025
 05:30:04 -0700 (PDT)
Date: Thu, 26 Jun 2025 05:30:04 -0700
In-Reply-To: <ac0d17a3-34c6-41a4-9bb8-ad9f3900c809@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685d3d4c.050a0220.2303ee.01ca.GAE@google.com>
Subject: Re: [syzbot] [btrfs?] possible deadlock in btrfs_read_chunk_tree
From: syzbot <syzbot+fa90fcaa28f5cd4b1fc1@syzkaller.appspotmail.com>
To: clm@fb.com, dsterba@suse.com, josef@toxicpanda.com, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quwenruo.btrfs@gmx.com, syzkaller-bugs@googlegroups.com, wqu@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+fa90fcaa28f5cd4b1fc1@syzkaller.appspotmail.com
Tested-by: syzbot+fa90fcaa28f5cd4b1fc1@syzkaller.appspotmail.com

Tested on:

commit:         743c198d btrfs: implement remove_bdev super operation ..
git tree:       https://github.com/adam900710/linux.git shutdown
console output: https://syzkaller.appspot.com/x/log.txt?x=13a5b182580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=79da270cec5ffd65
dashboard link: https://syzkaller.appspot.com/bug?extid=fa90fcaa28f5cd4b1fc1
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
