Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B594AEE0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480200; cv=none; b=iMytdflPWTMomQS86KNlXXmW7F5KDJo+ue4QTth3ThY2nhyw+qOCEguj8gKUaZiBpxsNj082Vz1Ph5XWrizxb2Hx8fUbfXhrc2PQymIaOneBGzvrlUBP6KXLHoO0nYflNIDYrH0y597ok0Cukd/1VeYsNZvzOr0nm63RJSomkdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480200; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=fH5Lmhv0nF3Iy17dcx9HnU3vbVt2UHq2qg/UX15Pi+wTuD7JX3886EnK40yRJN2AdGCOjF6CejZhJ7OgyYMVeNsUIph0RNRxEMzsbXzYVoqlmdWtH6zhj6ayXB+WLk9QmvFEssJiKPQPhvtTdZVxldcgQuDWhMLwEWGV+kZUIz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3cf64584097so65133395ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743480198; x=1744084998;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=Hik26nnSSrNUH8UXhJKa8eldmX16EGGFCxzlsN6mD2mzUl/UVFuLv5dDo2glFXcIpY
         rASqubiE8JWYLX/acj+/yJKhkBGKFCQBWtmL4Y6nRrVk5WRAYYzWQF7E2PVULiLLhFSd
         vgeJtOfwZ+XzoFHqVn3Cqq6zikTrNe8pOJrtd3fiWtGZJLbVPwxIKvsd/dY59VGxmy2X
         lBwB2GyhI75RbBjy0+v/mpgpoGswsDDky7IQben8VHg6K8vRWBR4xhks/dH/3zbF1ay1
         pOKF9WDc2HqG1XrpZWvJyekcLnYk0e3n3kkNtij9zXLVEU3sht7gPBPj+G+hThGw1bPA
         e9YQ==
X-Gm-Message-State: AOJu0YwHs7VFfDRAHQ+ckBX5KEZraszy2VYUr8+Uscqty3M6Dr2Nw7mG
	WkezuOGsjgPSzu3w/9psy/AgytzRXjUsnI1WIfuhK/51tuy7TV37zHxn6Fu+3sNJQDkZAzlPVwv
	a63+aWLouehzlyxbI5/4gxtYx2GZ07mLK10uhNXdQJGmDwRZVGAt8fks=
X-Google-Smtp-Source: AGHT+IGYXJYZXgf1oJY7GVCxiw/CrC6NzZgPBvOrxh0j6FklI9PV0A9QBvMEdF1kq4Mn50Xt2rDyQwU4TV/WvZC4PESc/BEjzkHb
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:c:b0:3d4:3ab3:daf0 with SMTP id
 e9e14a558f8ab-3d5e090cd94mr118916735ab.7.1743480198080; Mon, 31 Mar 2025
 21:03:18 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:03:18 -0700
In-Reply-To: <675c8759.050a0220.2875e5.004a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb6586.050a0220.297a31.0001.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+ac254bd3bcde20072a0a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
