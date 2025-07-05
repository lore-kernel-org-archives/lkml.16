Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812082CA9
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 00:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751674563; cv=none; b=l4uY2qnwbqF1tYLAbG2gfxIQtnnFzOXtGMZxNz/Bwhf6FRl4KBALnOD3cAfu70vAwodbI4xDKT2Eb0/uyyk/fZOH7Uok418ajPkAsVhWy//8cMp5F04Cm0qFxAQZyZxaXlHXTd0b7FzkBGNjAGc5eT5RWywr9RN7x29Xq05VNrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751674563; c=relaxed/simple;
	bh=F3KaumSasn7+CjHYayjp6vHfKbHLkRDszR1ohRthHk0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MGjdbnZyafkokj66mJKxsC+geYmp1g/PElP1/ukfTqaPQ7E/BirAA/9Q6Ph+P8amS1c8Gcz6OxPCN6W4Z8SNtDnBS3Bakg8tbQo17JRCI1sGZbMZEwP1wiZ3fDGSnNbuH1e9RtfBnU+ab2FKBuYSyu5KhmF5jeZGAzm6AYVasUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3df309d9842so41391725ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 17:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751674561; x=1752279361;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XTMsI+NoOd1Ape+R+/adD5i33Nia/G/qdLejQ12EAxo=;
        b=HU9cFL0UDuoVss1U7XSqNJdWZaxFuEMIxylMSZXdlozVpML2Rlp7PC+5qmSUZezs9v
         Y/NiMBgJWE58L4frQ8CcqHisDri6XMVPEPL1w3rzFChvY88Ep5Tv5jh+F233XjKFUbhz
         xerNAFdOVFoICqcH5hO6htk4fP/bBObgkWQ7H/IUvif0E0xRPXjbCNrGQ8nTm7wdmU66
         1avyBUrtlJRVi4MHCCON3uMQVbreRI06S8qzAud5fxmv42fhU9zxopZ7Lo/XirGREZdp
         EPRwWymXa4f3Pkh7VeL7Ryvbuo/5NKjuepH2Am6SmMKiKzn+huAuljwDaYMpVhgwEFBa
         AKlg==
X-Forwarded-Encrypted: i=1; AJvYcCUq7ZYQyp8a1sfv8lsqA2FaPHU8wEYnyAaQj5D5a5vYo0uqmDRox1YgOJ0rWL+3pTQ0C9mK/u7JzSCdx8g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1yeYD60UkxFvXyL/SfHqRvJg+oUFwRTLVKsU5z1bUINpl/yXJ
	cnXw76NrtdGoqO8B5rVIRc8E/Qp+MkIuO5bsrpccvua1gDf0vKnuTnlGOHYspk9RLHugst94vjS
	6TRvuteAmupFsXmBcOj7JrD1eBfDD15Ws0iDmcbXTMRAi844r63Gg1SelC9M=
X-Google-Smtp-Source: AGHT+IHa188D+PnS50d9iO3tT8t2l1Q25Aj4qCkzQZdDLx7UWMcFwKDUWPtQz4r7782gyspiDwruacbgKmWKge+y91sTykctAcTv
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:97:b0:3df:460a:ec3c with SMTP id
 e9e14a558f8ab-3e1355e9c4cmr48381745ab.22.1751674561707; Fri, 04 Jul 2025
 17:16:01 -0700 (PDT)
Date: Fri, 04 Jul 2025 17:16:01 -0700
In-Reply-To: <20250704234551.2525-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68686ec1.a70a0220.29cf51.002a.GAE@google.com>
Subject: Re: [syzbot] [kernel?] UBSAN: shift-out-of-bounds in pcl812_attach
From: syzbot <syzbot+32de323b0addb9e114ff@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+32de323b0addb9e114ff@syzkaller.appspotmail.com
Tested-by: syzbot+32de323b0addb9e114ff@syzkaller.appspotmail.com

Tested on:

commit:         c435a4f4 Merge tag 'riscv-for-linus-6.16-rc5' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=178b73d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b29b1a0d7330d4a8
dashboard link: https://syzkaller.appspot.com/bug?extid=32de323b0addb9e114ff
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=111f548c580000

Note: testing is done by a robot and is best-effort only.
