Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD9C4AEE0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480443; cv=none; b=A9iqINKxIgpsjMwDtmUs+JpESBUJ/kp2h79RTKlV2zxIO3Mam7P8tPsMxIB3Rs/tx8D5pU3eimthiNXZQjMgLkdQo9FfffhnprskXiDVlbxAJXRf9NsR9iXHvkOyw2/UGiGhOFLuYjzY2Jvjy1S2IB6slDm0fn5X5b4mJL7fjCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480443; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=J0FN+5ududplzsCJs8j4h5tfvYvfBiGUsD1L4mWM8uomQf5W5D1NcqLmb/6ClLQCeacsEMA24rkWB9589LDdeQj4px9GGBhpxaeyVAWF7EySplxDhHQqk1umdNf00+vEEyMt0+mAY7rtgrrwniPfkZdaqMgJfDlPrdqM9JXmnWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ce843b51c3so120352065ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743480441; x=1744085241;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=tCQOC9zC/9xM9rwPe1X3EU99nai/8k43T03RfIbDBtkkSpqTWouQwk1zeHQECQQZOh
         tsx+Q90Awc2ZkL3hyOu+zV5QBkDPbsm9r3QZmrDvixQSYZVE7zAK3uP2aNJ7U9+bMvvx
         zE/DEB/9MmREtpjbsazTikvoruZv+hGyih5Br5XCt27biTd4cHivZAm7vYGsk3WusQna
         0dTtnqG47d1Y/JCVKWbSgyCZCCEW5q8ZL7j0VfeE+lwiu0Zq3VY1v0bicNoRfMlRMwE+
         VN7TR0MCPTYGmzRovTNTehM/w/vbncID2t+3sk5kHabDTwF91PbffRdSKMhyDjh6ovQY
         LKAg==
X-Gm-Message-State: AOJu0YwXFvAHuB5V93IO44fApnQJolXX7ZHeA07+yuFmO6V37MJQbrob
	7Kgxhgyn0+6aoO4qs2HjFdVeWgkJ0/NokLnZG9WlePJco5DyyeGWUUwWYRZLR661lD8TOHkLbSw
	2VP7nqJ8ak9yhoUmQBxJlfiHYimfr7Ita2KIrGqr6R5eS2/8M4vAF9Eo=
X-Google-Smtp-Source: AGHT+IHL27OCIjHyz1crbGkQqzcM2aZo8c/H9CJyPjG4cS44eNsoj3gZj8yK9IuWnp1mZLPXA0h3Rk7BHIWvMaLACiU9nB71gw6q
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3c85:b0:3d3:de8a:630e with SMTP id
 e9e14a558f8ab-3d5e09f7a73mr103980485ab.16.1743480441535; Mon, 31 Mar 2025
 21:07:21 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:07:21 -0700
In-Reply-To: <6739af3b.050a0220.87769.0008.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb6679.050a0220.3a8a08.000a.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+62f5ae3a10a9e97accd4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
