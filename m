Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29851A23A5
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750366861; cv=none; b=EMIjMVD3ZXAUpzxGuFFG6Mn13UocBS5WzjrjPVLqYNm1MQXq36LC2e5j5pvYGu6giqLnjR1L6C4cew3ka510RGa74TUW45LpONWc3c4XuxYPVo+WvW+mQm/UvjU4fY00J9IEiu1uCzPgRIhBHN/D/rJdX51cuH52/S6wI8hoTqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750366861; c=relaxed/simple;
	bh=bGxwRsy5v7P/zmboBRYDy57katExvCZKTduH5FICWQc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=e29Pv5isb2bYufZOH2GOedtVSKgRXPUOU6ESrtkq1tZrQSmLjVVuWQ1vXqYieIp6bESflZbpnWxTxjxr3d9SvmNv8kQEzS6cg/lh4U7ELgVGXgZZ8YvnKbsHwuQfFUw4Tu3OaoVgwN2hC7ncneohWOE2K5CVxTeYPJiQYlhI8YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddc65f95b8so22871725ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750366859; x=1750971659;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bf1F7Iqd6vpQLgOp+vEI9i4QKhYDjwNhs0vlkjS40nc=;
        b=xTabHvJFxm8nuE4s3XC/nmkcB5BzA2pT9wJzkSFZSWbfb2SLZQdBc5kTPNFmlVnkQa
         PX3EJ+XNMHx2ZRHZyqQfFvj0TEsvzbUxztjgkHV/+g21x1GWnAEtvwkF4LyX5sl4tvxB
         cWZ4ktWrRsMBGnRFaGulIRk1IbDI5CuifYL0K/2JKLVuewE69NMEqSMv5srquQyg72Om
         2jhBtaKIE4qM36/yNbUbFzQpcqqeuMIDKltlC3j6XCnSuyNGxL1JIkaxy18N3FPo057r
         8P9solfcwubpYCwYnOUpspo/xNIlx9qTFSgfQh0+pN2iR8/uA2KVIsdUgmICVIav7b+c
         wsng==
X-Gm-Message-State: AOJu0YwIxa4rf5LffNf31YGeGj02UVXMDCRwee2KtPFwS8U1XIHcJaaR
	7ZQynCbvNyeryf5xvtdz/d+im+xIJF/IxLX+tA7ehBU2lXjdEb4ZdA8m8ccXbI+ox4yx8SOBzMQ
	7Y827ubxFa8ChdbI28vMywk5vyLak02hs/1e7v/5HgxU2dUAQPWqR4+I2BLk=
X-Google-Smtp-Source: AGHT+IHnlttRscQFM/ID7Z2NxQNVWwxUlifr6yDyVmdV4NUqgPk/G6eryZ6MWPhiU9HQUrBYtfo58U6kFOIWS9HVITAyNnNTZSni
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cdaa:0:b0:3dd:f813:64c5 with SMTP id
 e9e14a558f8ab-3de38cc8a63mr4149535ab.22.1750366859186; Thu, 19 Jun 2025
 14:00:59 -0700 (PDT)
Date: Thu, 19 Jun 2025 14:00:59 -0700
In-Reply-To: <68488453.a70a0220.27c366.0068.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68547a8b.a00a0220.137b3.001c.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+7c8101d4d0ba2eb511d7@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix: bcachefs: Don't trust sb->nr_devices in members_to_text()
