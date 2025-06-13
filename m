Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D17C242D67
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 02:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749782406; cv=none; b=KKGuzpnq+5mRdLWYzFI6+CARQbOItOtASTOSD6RErE9hvPDjxboRxOu8V+Sxq4z1OBHcmwjxYbqQpwove/Hsv15Lz2CjlDBonTlk/G/rwutl20vUSShp74i89FQXVpiTr3bFef8x1W2IKGzabT+Gr1R16LUXPW/HtPZAuaH0Amg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749782406; c=relaxed/simple;
	bh=E97w1N1Bih5T6H7uKEn970LihNn6kp5QuVS56TtF2cw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=XuxeY+GXa8qD9xMxT06yu+n+W2yJ8reuPauh/BYydANHL15dSHwI7Rr1zF35UZFtuBWL1lPQM/7MNjUPmzUXbE5PU+Smx3xwa3Y2MQGZZhEn6Pl+bwMSbKMJ7NELqPlB88fO6/nZmmkXF4BXdOyMT+nNTwLUULB3FDfrx+zCnbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddc65f95b8so34371995ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 19:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749782403; x=1750387203;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oEQThB/QZWYATXEHZtIzkAUfqU170wP7qCTpelfegTg=;
        b=OHJUDld6IwanM5QV4A/MRicHf95kSOXmRL6Z0RGTErF1nbROnqFimtR1MCBccIsfmC
         m20FjegDPPngDuvMWL+J+DeNtYt8Ip9vSF5yJo9VaRJ3Np76nZ6nlX//c9I32pITxrWp
         8z7rMHrCyUbtCELCpwpORYdHxR9gHG18N2VLvKG+3MAOFXa7qmUg36VfjAMwdDF9m9Nz
         VZqPRB/JvAG7w87eEiLiyTo27FV6b4c1IlkzSN7eETnOnkJzSoBZ9LyLUerxJrLKJIc2
         QUQNMdYURjv8WXMHVMhjlxcazSyK3/h6zG8KIIfntMT/efvhiBekxFXWQMFT8hg236aL
         0lmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt5YT1j4qx/1gFxoiozEfvb8qWxw21UQG0I/SXhoiaTiVuvZF7yZc1ecrvSR1Iwzi1EUFTZTV2I/ANbHw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/IA9GNybKu/8D4FuZnGACtLWMfWf2dahcevPvZ2ABKeQt8IcF
	miVwwrN67B1me0DbxxxiJyXulkJKOMya4wSbKwOCmpXLbUTLL7rAsGRiIr9Xa4TmubYhdnhJuP4
	4cCCAOsP8yFmMmoLqYuyoljHiEdUyjxvfhcxNTqLc00SUadGJ6PfbAn25/5I=
X-Google-Smtp-Source: AGHT+IGGk2ews5bjEXEz9NVZoL8Fs9M4uT9iy4AWHWcnfKyIC4/gMozcjos4QyhO8bjyDSz8dc4tQ6gCWLOW6CvFJ8llBR+AiyF4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b2b:b0:3dd:b808:be68 with SMTP id
 e9e14a558f8ab-3de00b9f6b0mr13853405ab.16.1749782403616; Thu, 12 Jun 2025
 19:40:03 -0700 (PDT)
Date: Thu, 12 Jun 2025 19:40:03 -0700
In-Reply-To: <20250612234950.40595-1-kuni1840@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684b8f83.a00a0220.279073.0008.GAE@google.com>
Subject: Re: [syzbot] [atm?] KMSAN: uninit-value in atmtcp_c_send
From: syzbot <syzbot+1d3c235276f62963e93a@syzkaller.appspotmail.com>
To: 3chas3@gmail.com, kuni1840@gmail.com, kuniyu@google.com, 
	linux-atm-general@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

drivers/atm/atmtcp.c:293:24: error: use of undeclared identifier 'atmtcp_hdr'; did you mean 'atm_tcp_ops'?


Tested on:

commit:         27605c8c Merge tag 'net-6.16-rc2' of git://git.kernel...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=42d51b7b9f9e61d
dashboard link: https://syzkaller.appspot.com/bug?extid=1d3c235276f62963e93a
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1183ed70580000

