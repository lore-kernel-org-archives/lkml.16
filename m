Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4E0150980
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610706; cv=none; b=avFFwHoavvlebQF52ntw0pp0Fh2cHXkENRGCzfQsgiz17bNFngHOJxPK8Rla0/bjXsQnIXvldoJQ87wS25XkaXginFWXpa6O4W+f9PJsp64WsEr2cMkZe6EHPhJR72CgsPsbUF0tgvB1+/xdqXeAmGrLNvBqH1iOQ+uoWO+uK0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610706; c=relaxed/simple;
	bh=nH8Wz0h1IYXVBNjfVUZX39iep3FLojNXQ38mfec6ptE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=V1rUmlFR8kVEIKF3MnBhtXdgxtO7mlnv3dyFJURMdRXJoiA6GM7lNShq9JLzvhbD5AEuhVt9/tR9zrX+88SzVdLB94GreBX7G6AlKUdcBBLbYTlG2FIoNfF3YBcK9yVALFRJC9ScXuK3InwiRtRl4CTMq7TSZ540baCq3+zJ7tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ce8dadfb67so25196135ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 11:25:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738610703; x=1739215503;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lhI5OIpMPH2QnJaYcIqJZFy+BM0BfyBikG6nAIf8x/g=;
        b=LR/AVTK1LVP4L1k+72JQBmb0AtOMx3ASIEeS1T/6vqo4T8VOpCmB7n3OD96J/34DTC
         hiHL8oESNdEUKq4BwJVvsVnhOTZKantuLGz3TlmQjPsiFBFVJSAzp2RaC7VygRkjXdeU
         1fKTeDHUj+uOjOCx9eGwJfFL2igcrxxo7VUQWluNUnaLHaZioCz5Z6ErU7i9GFZUUiwB
         QH4i5Q4XmGH6DGV1rUs5jSk6LAHA/Ng5NSy8V8qOKDF2KfagOpTl0YmBTLGXQtapd9FO
         xAlKpGvYMP1VJCMM+p1TH1x/aywFmqpJQCk/Uu+lIcknuBlygZ1PhuPXBl58EN1JNnFB
         r4FA==
X-Forwarded-Encrypted: i=1; AJvYcCWqlxfMDZpgMLLfGiWoPz5nP8BEqOF8dddTFkWYu2P4lB3sayeYEuInJVC+DTnqMmkxxdqzk5L31jp0dj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoSS1tH/JolwfgQxQsuI+FMxb14XwCon9M+Hj3DY4ypsS1kl8v
	uvy2zGFfGP9evNJq8qf+IClKoba96FY9veJ3oVmJQEZaEoIgzauOmBSa0xq1VA5aL7kLaT0Wcbj
	uLpDkPP7+8gx1+C+zIOA78VHwvkcOYHO+q20Eo2Z9+9EttQUZkLgR2CY=
X-Google-Smtp-Source: AGHT+IHwY2iLqAbIe5jLZh1gn1a2tBOXNrpNK+9CnnJ9ALI7AoOC+WThdnVTKSoTTxLcTCp4ffNsncLkC8XMRSlNtlSZ9C1ZpolU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c08:b0:3cf:cac9:b02d with SMTP id
 e9e14a558f8ab-3cffe3e5db3mr188410605ab.8.1738610703570; Mon, 03 Feb 2025
 11:25:03 -0800 (PST)
Date: Mon, 03 Feb 2025 11:25:03 -0800
In-Reply-To: <IA0PR11MB71859E012D110DCD92D7B179F8F52@IA0PR11MB7185.namprd11.prod.outlook.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a1180f.050a0220.163cdc.004f.GAE@google.com>
Subject: Re: [syzbot] [mm?] kernel BUG in alloc_hugetlb_folio_reserve
From: syzbot <syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, david@redhat.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, muchun.song@linux.dev, steven.sistare@oracle.com, 
	syzkaller-bugs@googlegroups.com, vivek.kasireddy@intel.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com
Tested-by: syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com

Tested on:

commit:         d1302efc selftests/udmabuf: add a test to pin first be..
git tree:       https://gitlab.freedesktop.org/Vivek/drm-tip.git syzbot_fix_htlb_reserve_v2_rebase
console output: https://syzkaller.appspot.com/x/log.txt?x=114b75f8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3ed8e2f9a4233102
dashboard link: https://syzkaller.appspot.com/bug?extid=a504cb5bae4fe117ba94
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
