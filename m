Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEE834545
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 09:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751706726; cv=none; b=CF1ngug2xpRSRsj7MJ3jLiTRz4x8/TKiB17j0DeHVdsnUuSa8x6Ms+Yg8OQWFjJDpLuP4aUuqQHJAZDII6DFukDvJpVaRvd4d+toyXwD1+ZG3XlqmdEy3LQET1DHfCYpicswkxTwH5/yjTfKNjATwPPsqYdDD3x8pXpp2rADMS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751706726; c=relaxed/simple;
	bh=d7tTI8SrOzrPmrbU8oWhFM/zv7LfR45PYm/ddOwEIlY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=I/gb/77r7hosENqKFAt1Dj5nbNxWcJrkt9pJevl9C/yYM2VxKKSVsl3cohk5eAiZ/E6cOKt3TWoMz2tD8WF+EiPD63/6lNc/FyyyiXaJhLV5LoL2up72hz7jb/MRvPW5qE6PlcIqYKHDEavTZgKgstW+IRFIuXrTiBI07pqmh+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3df309d9842so48712975ab.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 02:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751706724; x=1752311524;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=idIs68cVSQEgBKmoJbs5H57yir873Bl1M/Je9euF8mY=;
        b=TdrpbU1zgptpEjpgkuRLnAEbAqnOhgFgWaFHxBfceps/908zTxn4cs57iJg8/2To0J
         aD824CI3LpgcgkRwVk8qjhpjxNcwxBC1YppV/JRjEkAdFAoQfNoHxWNFCADn5z/Az2Ku
         nNGqqG7rxX4aUwO/8lhEzDQoE/B3Bi561Dks3oB3+1uqPYFG+C1K+YNDJsQJ2OIV0vbk
         /ujlkhxmn3hN5hvMgoYN13mbW7+hROP5g5CRkp4aOFk7Vx64eZPY2rxVfERNBv4BhGmV
         tlOIujjwhjjRaSRVdSbj7/C9FnhLhnPGSawZqeqleVBUJKpH9IO6h8cV5FY7brLQfYG9
         +DwA==
X-Forwarded-Encrypted: i=1; AJvYcCWeaUHoDVBVDr9wDIWT1kIQ+2c9V4ae4FRfG9049436t4VDyMfRbWK/FQiiyjEf0auJPMxOjuFNNLEi2Ug=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZYKbKm13E8rn7pHwa4kZhV+KWxFCaMa+N8uoUD8griSX29LpO
	9FoNIldlfz4pERuO2gwF1LznqafIKW7KhHspGLXr4WZpMhGMYCx0KdBdkzq/QzB671ZgO1Ot8Xh
	uSRUbR65aq6wKlVuMxRMTLOMyGwhWTnzOy/S9CwG+TPCdlKjhseZAtaYmp0I=
X-Google-Smtp-Source: AGHT+IHsAr+zZTKfpxGxSdNp8dZicrF3LMxqZE3Zj6wFJPi/LfBQGVAfc1kZn4GWdD7ryWkOWhMCb7JFJgwcfjNjE0zIZQXj4TU9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3702:b0:3dc:8b2c:4bc7 with SMTP id
 e9e14a558f8ab-3e13545dc1emr49839165ab.1.1751706723918; Sat, 05 Jul 2025
 02:12:03 -0700 (PDT)
Date: Sat, 05 Jul 2025 02:12:03 -0700
In-Reply-To: <20250705084214.2579-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6868ec63.a00a0220.c7b3.0031.GAE@google.com>
Subject: Re: [syzbot] [net?] general protection fault in qdisc_tree_reduce_backlog
From: syzbot <syzbot+1261670bbdefc5485a06@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com, xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+1261670bbdefc5485a06@syzkaller.appspotmail.com
Tested-by: syzbot+1261670bbdefc5485a06@syzkaller.appspotmail.com

Tested on:

commit:         b9fd9888 bnxt_en: eliminate the compile warning in bnx..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=10742c8c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a6dba31fc9bb876c
dashboard link: https://syzkaller.appspot.com/bug?extid=1261670bbdefc5485a06
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=156f4f70580000

Note: testing is done by a robot and is best-effort only.
