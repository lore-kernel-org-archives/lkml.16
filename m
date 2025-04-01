Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602E32E3398
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 03:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743479846; cv=none; b=O+cwwaTOxNSJENF/TveTYtPH2lr8MWjk2j490R8VnxB3r7RjXai8M63rX359+zSGmKZxQ5I3U+mt9UJVt+vzwyDWzTMDZKego0Of03h2eIdaWVy1I5Nyah6VrfLLH0PRiVvFl4Y2aDEBu1PyOUicJagNQtSeOHwuZDdFMghHTQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743479846; c=relaxed/simple;
	bh=GYTNTPRHb0szdZm3V362NRjorFZ0i7ZAzwEIS9c33Uo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=L7o3GO+gXXv8auld4Z/3E8Zkjon++Nf178+u5tmKBtGpgJiGt8Mki658jbq6vCSBf1qj5UXQqdkJnCJ0o/61AyhXWrNwmOGnu9TDp357WwNu8nPFFI8wT4vvWgaL3t+7cqTpCCFRRGmreCsqkAEV5s3ztPhU/UXZIkuNKLHZYRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d43d1df18bso53957295ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743479844; x=1744084644;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eF1f2+DDUUOyeGQXtTzyNXKFtLFFswYwr0GYYA/wrBw=;
        b=j/vLvqFB2Wb7sNuj8Lpquf5pef9Ou+/FBX74AOSu3MaMLh/J76xT6mlP1dNKLH61Yr
         M++DiBG7YeSv4ibuGF1a09LTriyoRX/putgN7hhadv1vB2v9S1+z4O32b1Q43nabf9P0
         wAoD/52wMA4XnbMcWqILFQFeDCaupqA/DYNO7LonEBw2ALiPEo8p7TABQfJU7bZhr9hM
         0QPGBr8wqrOSpP+0ddm3f9HrIuZFhxlxrsk7Tj05j/PCkRDBAX6NJHRv6Dp/KgjsYTtw
         /mgzXPzZzavEW2pr2B1OpWYX2x63V7zLTvdmgmlo+9x4cO2NBT3DkghCJtH9QDhVYNd5
         9UPw==
X-Gm-Message-State: AOJu0Yyd0d7tdncsA8kjhgeJ4izXCii9+nbYzrSG5s5z7LReS4Y5Ofvh
	NpJnpxsO+hBix+5hLlRD8jqyFG2oR+H6vSDsX48lWDAQ9rmnVqJc8n+3b9qCBH/SqN5NWaYW4lH
	v9ZgRU3guf63PYfZpf8I4OPsnxYYlKle6FHixWu0V/a49VP1Q0B29sZc=
X-Google-Smtp-Source: AGHT+IEuHBtSSM/MkRCs+nNRQe8562DJEZmXwcgCzuev7cmNHiJxZhPfvHfhoU8x5HECobjtSmKNwEuGet+EwAVQa3aJzunpXqBZ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18ca:b0:3cf:bc71:94f5 with SMTP id
 e9e14a558f8ab-3d5e09fdf61mr96406705ab.22.1743479844495; Mon, 31 Mar 2025
 20:57:24 -0700 (PDT)
Date: Mon, 31 Mar 2025 20:57:24 -0700
In-Reply-To: <6799f224.050a0220.ac840.02cb.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb6424.050a0220.14623d.0002.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+de02219c78c082fe2f21@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix  bcachefs: Fix a KMSAN splat in btree_update_nodes_written()
