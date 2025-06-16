Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9341D2BEFE1
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750097105; cv=none; b=GNPBGrvGYp6SjUyRu6gUYTcmX/K/08HXxNzpXkau8w39zcsl+FJFDGvEb1QHwLlx6Gt7llXdYKvhpHwfUvIH5rKp6SSgTUcwj1Wji27YtqUvmtxnjYOXek8B7Q9Z1ii//HWznI1n6LZAc6GbuycIYrABL+ILKMMrVt7DPd2yfM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750097105; c=relaxed/simple;
	bh=K4yAEgfjz+4y8iXPqLqso5hHX9M6Q3j9AINd7PVnYbE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=DyZ5pZ8f0fxXeC4/C+wo0QHCcXbzhO4z7kJAX3ByTHh6j5GEMLVKU9rkdFPC1ZkP7ujWRLBr4wbptV2v1U2cgXU+wYrSErl8nBAsp2L3b1cMVutdCEQTta1DFF5cTM30GVE7s8iqpN95/bomF9ZFxuvtSc22maKDieMWGAs5N0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddd02c8bffso84940905ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750097103; x=1750701903;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J2UNO5kX9eBi09YW0GY4ZkgDZeH8x1lSBVPRp04XeXU=;
        b=TKGvJjg3hTAqUDl391CYJruLF87VDaHSUH8e/6D5xcNdvRz1pXSV943AsVmn8OJzig
         Z6Wul8aqI7iJIRMGpQjf3/ht+hVMoasF3LHu7C1UUCHBnC7pfk9ey40PLcP20MvnIAP7
         DJpCUa/LUgeSST33Y99LIyDYIRrvJySG4MeFdNp3ipMA4/WtYOmPK0IGZf0+2s0d2HX9
         c9Q5CfhmBb5GAMsJo1aQC9Q9dsoQuUB7ly6ijFPH2QjlXVp3bCOdEr9VwjKibRFOwwrN
         a6G9of6qTLadbNzjUYeqQhJ7/8WPsPndHXZKv3P69CkJuMcSTIphhxM0DuOBNUgVuKl3
         UdcA==
X-Forwarded-Encrypted: i=1; AJvYcCVPEsNW4zoAXkS4fcomtD/XvlVaZCQbjqYz/e5IlT4WauObuxQBsKOH0ublxrGtjQ+7N29k9KHrgJSEuJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKaGgWQsSpVtWcYmHudwXAdJOcqz5+E70vRvqKIbomP4kU/Svv
	STi5q8aVeAzNklpXA5jvPCvWWt8AhVtWOGj3qdvvvBEKaFudBMk3ruKrCM0z5UsavfPD612KF+2
	BvLsConV+8PZgcKvCKAgXklDz350m7rZYHla+nThl2irZ86ExLRgliYrF+go=
X-Google-Smtp-Source: AGHT+IHX+ks/u0h6l/ee5F67vT2hbF9l509xdSWo+0B0ti0xcSs1RNn65FgJH01wL56lMKbEaGImbounXhduxpqS6HPcl9iuHFLp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:330e:b0:3dd:cdf2:fea4 with SMTP id
 e9e14a558f8ab-3de07cc010amr109561055ab.14.1750097102792; Mon, 16 Jun 2025
 11:05:02 -0700 (PDT)
Date: Mon, 16 Jun 2025 11:05:02 -0700
In-Reply-To: <2dbe5bd9-6429-4968-9290-a08c5c3d40c8@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68505cce.050a0220.2608ac.0007.GAE@google.com>
Subject: Re: [syzbot] [wireless?] general protection fault in carl9170_usb_rx_complete
From: syzbot <syzbot+0d8afba53e8fb2633217@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+0d8afba53e8fb2633217@syzkaller.appspotmail.com
Tested-by: syzbot+0d8afba53e8fb2633217@syzkaller.appspotmail.com

Tested on:

commit:         44a5ab7a Merge tag 'powerpc-6.16-3' of git://git.kerne..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=17af490c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e18c08ad583646d2
dashboard link: https://syzkaller.appspot.com/bug?extid=0d8afba53e8fb2633217
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12988370580000

Note: testing is done by a robot and is best-effort only.
