Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453591E9905
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738571764; cv=none; b=fMbBfo3GckQNMc3gsUvLd3LEIDqBCnXrJgRoZisDZZZMt5aSFOmcAzBExrlYNdBBSCVjaEBur4jvklvf52LArs6dDSDhSdevx8C9QyA7cv6RTKbw0k2y3+Rc/PXn8yV+cfhCEb38sx4fzKygANBi76F/1j5wI/NeKhEMqhaVH08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738571764; c=relaxed/simple;
	bh=nLMQUiJrSymcoOK6tOhS/3Kpg+i2oTL/2JaG2kvtitA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=aKh8C5qkFNQ2GF3H32nLb9c1oZd+yQwu91SWFPgnfAu5mcpIJnnanp67+RRK6plwgU+b6L5GH/qStgnnSBWKq08ql/C68Pq4HacK1QvVa9wUcoXskL94Bqwxa7UCVAAXa172CQ41EhDTsFrtXqZtFCIoewAozXngINHZsr0hs1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a7e0d5899bso78552645ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 00:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738571762; x=1739176562;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VqGhZb9IpC/7mhlJOWcHHHeqT/g/+3pVvwtNgr1D9Lg=;
        b=j9V+XKnNh5BxLWRPZYKXCAQPpZk84RRsPzCkHayZuaoz8EglfnED6+DwKsD97rlnkq
         m6afyyHu5z+PMXb8WG43nm9pO1+hoT0hbQ4S//i2XU3M+Uvk6IHKc9Sz7fYrw82MaJTn
         JXPg2t9dEu4B8vd91cMcGlromcoO29FFKizCCCXnWayf0Nz74ZjjuN+KhnxCUJkMRtUL
         XgtViYLmZGm7pPFnYqTdpRjXHPWh7OM7my3DNSmYns7losoi8kCyhhsIWgkvVhB5clxN
         S5JcZ+/r4aHuc4T8f5aC8HkhjUsh/wD5hz66Ie2v1iNpBNTI9iuaEryiVYEVB6AQehZJ
         qibQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ+EGOVEgK/TusQQBKvX4MXvvxl0TjYdVd2oW8kww63kBm/S73VDq2p1IFOBgj6TBbDtPoC1W7AJtJN+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSBTqSnJrZG9O1iF0vtGE5he4/1AcRd1L2uu24R0O24qYCOs/y
	7RVZcK/jMoGUtntkPBj99qLEtBsJzkeKMPn7u5e30E4/yXo6+iZiAx96RdozEmRrmmF7ef39kO9
	QCDJYuFoGVTzSwV9D3sJGegIVXoffrqaNIXzJIVL0YMf3mrNROOPvJhg=
X-Google-Smtp-Source: AGHT+IHVErUDQLWNOHaR37ANcNaoG/nlsP5RgLvFdM1LGhzcflOEYIdHUQHEcK99wqFvTNv3b9z7bPqxsb+/N3EpKVcoBFy4h1Df
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:490c:b0:3d0:28fe:2008 with SMTP id
 e9e14a558f8ab-3d028fe23b3mr43149425ab.19.1738571762665; Mon, 03 Feb 2025
 00:36:02 -0800 (PST)
Date: Mon, 03 Feb 2025 00:36:02 -0800
In-Reply-To: <20250203080720.GA18459@lst.de>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a07ff2.050a0220.163cdc.003e.GAE@google.com>
Subject: Re: [syzbot] [xfs?] possible deadlock in xfs_buf_find_insert
From: syzbot <syzbot+acb56162aef712929d3f@syzkaller.appspotmail.com>
To: cem@kernel.org, chandan.babu@oracle.com, djwong@kernel.org, hch@lst.de, 
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+acb56162aef712929d3f@syzkaller.appspotmail.com
Tested-by: syzbot+acb56162aef712929d3f@syzkaller.appspotmail.com

Tested on:

commit:         2014c95a Linux 6.14-rc1
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=10fa43df980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=793f583a4388e6da
dashboard link: https://syzkaller.appspot.com/bug?extid=acb56162aef712929d3f
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12b3b5f8580000

Note: testing is done by a robot and is best-effort only.
