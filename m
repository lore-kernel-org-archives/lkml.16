Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAAA7E0E8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751645526; cv=none; b=ePDurBezFGlsAxftM+euIg/+xCNCQm9/anWlaH5YiiETB5CCRynh7TAUSCSbK4wnXIrVzSnzVxCNahMMJb9hg38S1z6Sj4LP11KOJIWWN/WClxJ++Ym2QQ8Xy8++RA2mQ7YX+9l+S6pcSwZIosfU3KI27Dumd0cHmrpH4Baa9bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751645526; c=relaxed/simple;
	bh=gn02xCQXl4IG78/9l2sZC7m+p33l4yl3v+5AK76yikA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tvUzKfN69fzotkyX5iDv7LVWMs9dYq96GGNETN0HCD/Ce/DnU8cXJimq2hD1ybBVD8UE4NfWbcUzTFqc7+SISknrH36Xdpxub0LM6jY+9aR6Davyydxp7CuUuez9q6jNhxwiEWyiN6Y05J4sQ3idQzVHKdUTS67syctjmQvnzOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3e059add15eso12870225ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 09:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645524; x=1752250324;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WDyDKeyXTO5SE0KVUU7cIDMX3Wi27uf2RCLljSeQ2bM=;
        b=ZMvIuZXuatGrTqkmali6lXAVVoB8CCNrLa8E4IUmbHm+VVDceTDCDeslUtQXc91ffK
         EjJVCnbI7X3oe07I6wXVDfJjjOHPuQsceG++RoFZ6idF7WdXEHa2IuAyHhTX/StO9JE2
         aRsbZYH9lRfN8dOzKBwqk0YMEaJDsOsRmSAxbFUCeftQ83JsZ5zEEnzK/EZ8pKqUxk51
         jLaBlz56yWcyFYaapSMC5Tt/ppC1dexsE9CvHjVEsRbdN07rWHf4hWl3ljHo99U5MVIw
         BX5Msp2srznFHX+J/zcpFWdLJm+mA1GrDUtffOq7nsRKdE5HHWeupTX3YctMoW9z7rIz
         Yo0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVsbu3uX6c+tfgeLHBc2VWDrosa9u1Iwd8/l35hNnXDuQrM1C0CsWyfPjCUpBr11RjxVI8JvFLajgE41M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHqU1Mpq9j1CQvqAFIj9vKsOjeLu84LbB4sVARduHl19s7btEu
	+P0pC2A0iuK8nP0Lcr7GHoBsx00/i1zDxj+5TNuTq+3JpN1Lr6Dh2Dkk5F3VtARyhv9dJxf8cX6
	BdZkupire5VvR4K5hj4z1X9n3dxSxo1aTrRmiwgv+EJTtL14EkMzXJ/yeu2w=
X-Google-Smtp-Source: AGHT+IE/8wGbf0OJYdx/c8NkEHe/l5t2FR3f3Bv1pat+2xxg8RikNmGu6Xdmftx9KMCSx4nLHxJb9e/LnEt6+TrEQsYH4BvmU9rV
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2386:b0:3df:3ad6:bfb2 with SMTP id
 e9e14a558f8ab-3e1355b1479mr29894345ab.17.1751645523910; Fri, 04 Jul 2025
 09:12:03 -0700 (PDT)
Date: Fri, 04 Jul 2025 09:12:03 -0700
In-Reply-To: <20250704140331.2436-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6867fd53.a70a0220.29cf51.0022.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] [usb?] KASAN: slab-use-after-free Read in btusb_disconnect
From: syzbot <syzbot+2fc81b50a4f8263a159b@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+2fc81b50a4f8263a159b@syzkaller.appspotmail.com
Tested-by: syzbot+2fc81b50a4f8263a159b@syzkaller.appspotmail.com

Tested on:

commit:         cf16f408 usb: core: config: Prevent OOB read in SS end..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=10f67ebc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145112f03d31dd31
dashboard link: https://syzkaller.appspot.com/bug?extid=2fc81b50a4f8263a159b
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=118a4582580000

Note: testing is done by a robot and is best-effort only.
