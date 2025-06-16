Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18704A31
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082528; cv=none; b=Wt/AR+3Z2U4pUneRnbIblZGoCJlR84UZTP+T7r8Z+Ss9NXYDT7+WZw89qel2qkF5zJh9vtV12N5iFREdJEfmHjRkadTbB6GD3EIdLJroKdZHBwTJHKZTx9yeSU0ziq+AVGLL9dcQ69UCeqEnhD8ZaECrB12ARR54lpF4YBwyo9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082528; c=relaxed/simple;
	bh=9Frd9UQMYa2OG19Y+kMjlScCyG9EWPILgIPZGhBUXm4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=r226/kZGY9y1BEXseL5Bih1mACidnr6pK7VXXYW/849wDgdk/m2x1I3+uL0ZhP/hy3ALmYA5hS5q9X+Hj4NQ/n8/211X7xkTB6/FNE21eDRRtnn8Wsm4iwYYt9iUR6Q2masFM95Gcq6pKqNvN53M6f0N2jecDJwGo60NZheuzQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86d01ff56ebso810874539f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082524; x=1750687324;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5qndo+tNttlxMX4JwaGZKdYBVzqCp+i70QHeH3a/wrs=;
        b=vc3R+DQNtJl6BFG0oOetPIR1fXm1uJ69uKt1B6hAZEoikCaFr9X4zAWDtLZsZDgGRv
         voAPWuAxIIIEDApJRM++aHDA3PN17qBYNJhAUE3R4TSb461fDPtUfBharJWKs0ahgjky
         snfmfIvRj1++Erj4XZJpIX/I/1FPrktlZYY/kDirJ8IarTE3gfybMu3WdsYWrzhi/RDw
         9Hh6Frh7ve3Jie8bSeG6ziVbkwMff4XekDcRua04jZPdk7HbEYO7nXh02gbpNrq6bgta
         u0rsZ5e7d8j3AA6U1hdNwNVinZohXf8tGQDBdZGdi3qTBz6/E2h134fKW0BrzM1TWHpf
         Zw4g==
X-Forwarded-Encrypted: i=1; AJvYcCXt6o6mN5pFrU/fEtQAvR6x5v44vYVP5xp1mf+du3IhR4oEdBVo8d/zp5ZGCrc5xkS0WZfn/9TvDITHad8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKxFx/Uz/80KrYTMqK+l7ymUuKnJ+0bi1KG/U4rEByUc6WwZ4t
	4xQhjfmn8K0h1G7hXlBzW3vb4f7vtjpe2Fty1I5kEiP3oMWYJU3xe3Woq1rvSLz9u/bahF8fdRY
	wGdA1piWtYu9RMUSgfvox+cJzkUzxJuLCN3mhjvWAvYVr2FXynweDqDgRKSY=
X-Google-Smtp-Source: AGHT+IE+i/5C9z8oae7v58+hVVY/xTx/4TA4WLh3i3xXc+QBTZMa3Pw0c2LNbdaPYnmXt29bZrLwzmrEHJ/UtW6rrU5izXgtUlEh
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:180a:b0:3dd:cacb:b88d with SMTP id
 e9e14a558f8ab-3de07cd3553mr103624495ab.14.1750082523961; Mon, 16 Jun 2025
 07:02:03 -0700 (PDT)
Date: Mon, 16 Jun 2025 07:02:03 -0700
In-Reply-To: <20250616154041.f0a3109dfa90.I47444d63c72a0bd58d2e2b67bb99e1fea37eec6f@changeid>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685023db.050a0220.4562c.0005.GAE@google.com>
Subject: Re: [syzbot] [wireless?] WARNING in sta_info_insert_rcu (4)
From: syzbot <syzbot+8b512026a7ec10dcbdd9@syzkaller.appspotmail.com>
To: johannes.berg@intel.com, johannes@sipsolutions.net, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

net/mac80211/rx.c:4436:8: error: call to undeclared function 'ether_addr_valid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]


Tested on:

commit:         e04c78d8 Linux 6.16-rc2
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=c3f0e807ec5d1268
dashboard link: https://syzkaller.appspot.com/bug?extid=8b512026a7ec10dcbdd9
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14150370580000

