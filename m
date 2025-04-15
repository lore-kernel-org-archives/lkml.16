Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888B01E502
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744720278; cv=none; b=AG1p6DZHw+KwRdhKp7gb0f8YmqyEoqqtnzlbkPGixZTQN8aCvTIweoMszTbX9nFpmXyMieH/ofchaBgnB59+g4Bhvyeoozk1oNEVIk7wkuQelGx/7MWbnOcr7kLf+JJtDMWCPMGtXzucq0ShV+FtPye+JOwSfUuHW8Os1VKVM24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744720278; c=relaxed/simple;
	bh=ifkq3IFKI+30qUjmUbiVsTQNNhFdD7SNZ3D1YHHaKqI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=iHYE/z9GZr+TB3lH+SZoTeSo6clkGTcAkdwrrfIdR+iEJ8Th6qmMdg0CFkL8c9+jVgDzTdDEV2jLC7sAftuZoqlCTIMIkVTu92jnnNyULsP7zcAy1C6wffRo2m+7yDn/5GyoDfZpnaT4m7igLw2Dya74mqlBjrnnslhW9hB8/3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85dcaf42b61so1175496339f.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 05:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744720275; x=1745325075;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WF7/XGVW4fHNYhHKbvnD4qTXFrjTjvW795/lGmkO1lo=;
        b=HrFkF/EM8Ag8enjiTVTyzQK4Ci2r2Cgzop3IqH0Lgkn36iwDJCqdLt2B87pI7tsULY
         wfQy8W+tGyoOFxwfCzAbhqYrRfl0k+1NpEvQJA37MLZYDcAYlYjHa3OYtay0TIL9yVFL
         qjOSpDYWeD6ub10zoAf06krFEQYfMe6QVlXYRBCXZ44hPvqn/JiZL0yOE1agNYDBvCXV
         0sOamFxQASeL7i9ACac2a2gExULPR1XdYG9wOm4NMvFhCKtLlFnhg2T6keYK0S96v3HW
         hYggo/CLl83UcUGsfyyy66yATDFlTRIbCaCreBKgNRQuLhtJkPfrGfmcWtmSv8VGLWfq
         2SXA==
X-Gm-Message-State: AOJu0YygwbiO1lD877tWbCxMHlJRqTb9U+bmP4gOM8vfP2BuvMDbsbfF
	gSx4Fb7dNi05gUPhfUHmBJguOrKv7BO46aSMixrtKoSd1DBRuDilvfOz3T8UoOjbNd9NhAq3U4M
	0Z+VFrziOmZQRHuy1aUvP2P+fiB50dKstokItn/b1yqxgqAIymZkt5AM=
X-Google-Smtp-Source: AGHT+IHlDKFHVprsNBZ2vmT/ublOTcj73sYtCmFH+gaor+jhJSQhjhkG0LbIMNlcM4I1pMWomKmS5FRAALr3M5xo6FB0EhVcUOcL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1888:b0:3d4:244b:db20 with SMTP id
 e9e14a558f8ab-3d7ec265c11mr150025525ab.16.1744720275565; Tue, 15 Apr 2025
 05:31:15 -0700 (PDT)
Date: Tue, 15 Apr 2025 05:31:15 -0700
In-Reply-To: <67b1f949.050a0220.173698.000c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fe5193.050a0220.186b78.0001.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [bcachefs?] possible deadlock in
 get_partial_node (2)
From: syzbot <syzbot+725322cc4ff5c53abfac@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [bcachefs?] possible deadlock in get_partial_node (2)
Author: kent.overstreet@linux.dev

On Mon, Apr 14, 2025 at 12:22:01PM -0700, syzbot wrote:
> syzbot suspects this issue was fixed by commit:
> 
> commit 3a04334d6282d08fbdd6201e374db17d31927ba3
> Author: Alan Huang <mmpgouride@gmail.com>
> Date:   Fri Mar 7 16:58:27 2025 +0000
> 
>     bcachefs: Fix b->written overflow
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17e4ea3f980000
> start commit:   b7c90e3e717a Merge tag 'x86-urgent-2025-03-08' of git://gi..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=523d3ff8e053340a
> dashboard link: https://syzkaller.appspot.com/bug?extid=725322cc4ff5c53abfac
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=137c1fa0580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12e0fa54580000
> 
> If the result looks correct, please mark the issue as fixed by replying with:
> 
#syz fix: bcachefs: Fix b->written overflow
