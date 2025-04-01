Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B64A33F6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 03:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743479991; cv=none; b=TnVk7pLcmFPEcnmyIQCWy1XJbN2MBDwDpSf3LYq5WxDMiuTPrppcr+UQkkwuG/CanuAUjT0s8570Q+aqqHLrhdujsWzo3wFfPb6Zp0R9/3kDwdx5qrIDJ04iWCtbPuEtXhoTZjqFsXUhGIm8ke33PQ0gKXq9u9B2rc0Q7vEzukA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743479991; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=F/U0/dtLtc7DofC8jPtGXj4isKtaqyuEx23QdYv42vCKKFXNmSHe5EvUFOrLjgHubW4/EA+lplXg6mFlMF3VZYEZVP5MNNGhm4bmTo3bhlhyTQbBblq/n7AWWsJ+ZHVWctQbR3asLGlfFXPxwcLdLwY3w4oEdVmuRbKSu7Qz20Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d43d1df18bso53974135ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743479989; x=1744084789;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=r0KAAKLpbyvWmSgM1J46HEmOT/0k61nQVQMk3mdhtmOgCxpYojGbyj7SpXntbA08ic
         G8LYhC2Ma7gg9SUSFrlHUCpwI7zb/bA1nFNCsNBMyevOrQJTG2FCW/G5eMk427ibS2Ay
         YbS2sY7YBnzbhqP0O/pq+pyjUWYRGMR6yWK211NtA2hvd1FZBt4kBtv0YGlst/FEePWp
         ImjdoM09AuS2RYcEemz0Zd25IPkZaa/fvmI74fN2zOCrtri5p2rzErX8OX4X9/Y2Dtz4
         J80DPJTBElB28F8O6Vsumt4ubQR802r8p97cFtDafFhE0IpwE0EnUDKoQ7YMKLGprbDB
         xY8w==
X-Gm-Message-State: AOJu0YxKAJzCCwlJ6hwnHHLtpcvfYAsUqG7l9UvB9yjDMxtkxjVpvjap
	YlmXcUwIVJADxeDuPne9OEqr+lvob/rk4lRv4OFK6Xm9JrE1vZXpumK0sLWVhCEGM4x/0I4TuHA
	0LpOUhIrQ76SkE5VUP6M62dJOK7x5SJOGBBEBXBp6v8EC/9Kc++qTYcc=
X-Google-Smtp-Source: AGHT+IG3rd/ZC8o1U6JUz73lr/TL2/QCQTW4ceuN5jamt4kEQdq6jICzU1gaDWLAofaHcWMGAyen9x6vR7wObwBWMsKpjpueFOTv
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:156c:b0:3d3:dcc4:a58e with SMTP id
 e9e14a558f8ab-3d5e09119d6mr115992355ab.8.1743479988745; Mon, 31 Mar 2025
 20:59:48 -0700 (PDT)
Date: Mon, 31 Mar 2025 20:59:48 -0700
In-Reply-To: <674c2f0c.050a0220.ad585.0034.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb64b4.050a0220.14623d.0005.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+2b2046c73fcb7e6a0e4e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
