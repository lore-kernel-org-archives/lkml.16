Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D6626FA7D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744973404; cv=none; b=C3qXX02zBSLh6eLFR+fkwSeCc6mOBj3vOcoDu0w2Sy3gmnLPtmbZazWKvT4Vin2R8vZabTwOmr9xReysltKUWy3Dl0IEcXlHFoZ5+A6qNkJeHi2TBCuhxYoFs+ezRv3x6gLVzJNoyPNz8p8s7L/eBhdgjoBm9w1qfR3k6gL/z/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744973404; c=relaxed/simple;
	bh=6IvHvO34svGf8pJpp1sKWE4gOCANDwDyt+nvbA08RYI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IyOlVJG41fH/6IKWHXttZOw/ds8Ixq+eMfzXUcjxCMVWBGl9wflHsgcdByUzyJZdeKjNsb7l28SgKzFoiPZLL3vFvWRGgL/g+uTVdJQGr86IlAIma2AD+6H84jY4gITapaP8O/7XBha6tyRhDG4YZRvXCITKAStfyxTRprighmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d81bc8ebc8so15320725ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 03:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744973402; x=1745578202;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CxbDJ7ueduouDWsaF8IaPTOCcmRp5qlfOMhOQfL6pDI=;
        b=kZeIftEFqgHuAyB6mZsY2lq3JN+b5mdBKf16lEEL9NhCe84gvy7N5tgesTIVx3M4qL
         fJm6wVyI4toamrIul7I7Wr1kGne/qfecMla7IK8W4GiAIn0gGNxvK1qcxJ4GKauX5ZkV
         q03SYBZlTrSuo8twsbOcOroKDczsal03OeNoYw/ziZyWjfo+vGHp08tKJWzO7eM0GaNX
         Cr8wNinXlipmdcos0HVzdwIATfnmHVFJTXCzaNC5wt2xfnYFLi498SXokA25059e7zzw
         07VVa83zW/WFRLUVv5Z7RnKBinkB2UkiF5HO0mFiO03bptGBUk1QRWM/hA3/647xhCnI
         +UCA==
X-Forwarded-Encrypted: i=1; AJvYcCXzOp2yVfbHIQapQXRDYSCh/nxY/YzjwaSNNwss2vBaSjQVRl3H+Z0lthfqwYc3DS91y1Xng96KLtB808Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhCECDYh3RIz6cnqb0LtXlmq99ESmRqysksJU7XuGTXVjjLVqq
	Nx2IRQKf4Yq48yCY7Evce1T1yT16+YTq2HiqTuno7uh/OiNdiTMPbpLZg63/R5BfSw07a17HvZJ
	H4oFMAyOE41XwdGtlGJm9Xsgp5bWdu0/qNveIF5rwiZKVO4oYlfuiGF0=
X-Google-Smtp-Source: AGHT+IHxTtB3kuGO2TLldJDypIVRj5uWK6H+6lxmN4Kbou0amMtzP99dPIyzkW9pTjSEH4qMAJg91nOJK5ZXy7VJNlZ0rJJIVbqA
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:216e:b0:3d4:36da:19a9 with SMTP id
 e9e14a558f8ab-3d88ee75e56mr21212675ab.15.1744973402618; Fri, 18 Apr 2025
 03:50:02 -0700 (PDT)
Date: Fri, 18 Apr 2025 03:50:02 -0700
In-Reply-To: <20250418100943.108533-1-contact@arnaud-lcm.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68022e5a.050a0220.5cdb3.0018.GAE@google.com>
Subject: Re: [syzbot] [hfs?] KMSAN: uninit-value in hfs_brec_keylen
From: syzbot <syzbot+5405d1265a66aa313343@syzkaller.appspotmail.com>
To: contact@arnaud-lcm.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+5405d1265a66aa313343@syzkaller.appspotmail.com
Tested-by: syzbot+5405d1265a66aa313343@syzkaller.appspotmail.com

Tested on:

commit:         fc96b232 Merge tag 'pci-v6.15-fixes-2' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=132614cc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a27b81e0cf56c60b
dashboard link: https://syzkaller.appspot.com/bug?extid=5405d1265a66aa313343
compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=112aa204580000

Note: testing is done by a robot and is best-effort only.
