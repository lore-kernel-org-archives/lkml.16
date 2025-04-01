Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E996817C211
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480135; cv=none; b=lAN4NwS4heEKxgOVH8TNt4MzHr9nVvUZM9HSSiMOCteKls6Xuq3HSzP6f2Ji8JHlH2OejXL0JlEtlAeUgwpC5YjidDNyoeWw2lBX+wYNDSfs2vroLYICGIprJ6NcWHmsnQi7MFMWr2Akq6IGCLFgyy3zegyne/jX6390KBL8pjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480135; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=E4f8BJe1HQY0u9LNXREKHDrl4Oh4tkUZuGWZ8/TBj3pKpNx3xnwxvatVxtmU4PmaP62xiR3pna8i4MEsv17HjyV0Zynz3yud7TVl6B2crhOmV1AKUHevYtPt302w4qNkYmCmEsr3+T74z6EwbJAXAxgVIg2ZahCaocB3BblH9pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d4423d0c49so47030095ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743480133; x=1744084933;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=FBkrZBC7SxokCIlSmiIvrflhFYhQInnhaIeJ0H2nQ0r6dOZTPsYF1cTEo70uNmLtGo
         taIj/PcwsMZGT+B7mJvWBC/EEteuiQV0q9296QckRgdqUYWv5t3hk6vAgC463fqkoG19
         oZ6wDYkN6wxlW9fw9z60xQk62uoSiRStPYa8V0UjyTEEmJJQuzH6cVTHo16gOHlNbL5h
         wTSZ6JSW58WRdPm94dVV+12MdlrKdoONFeqhpKoT5XCMfelvKQCGdz6dhWI8z1V5Nhxm
         /A70mkiOtEk2Um1nAkL+Zn51PtgTemTWnYQ4Q9N16cOvtL74G5KVPsjSzuQlf59Zu1sX
         ndIA==
X-Gm-Message-State: AOJu0YyDPbIvYOfVpLovYK+TjH6IsnATneeexp9Nu+Lkfd7pmlWXKCne
	dkR5ZJoYzTs5OgyA006yTjKwYgCWHnJUBrWBuvtKnUo0svYZN/6vzjsOq6kbb3iJ84IyvXYhTQx
	xO2z2yDf0BDa4m3IqAv8OJ0bfwwFjxujDoWa0TqFF1GA7l/Du9MyAMRk=
X-Google-Smtp-Source: AGHT+IHurOa1H3grgjxUfTVQnHqvIKB9gBjbGp59SKrvOMyBrAfK1mk+Fq6sj+RQDv9YSSxlHGWfLUJIGZwpaZXY9FYDXndM61zu
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3a05:b0:3d3:d965:62c4 with SMTP id
 e9e14a558f8ab-3d5e090e8b1mr109409995ab.10.1743480133304; Mon, 31 Mar 2025
 21:02:13 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:02:13 -0700
In-Reply-To: <674c1f93.050a0220.48a03.0009.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb6545.050a0220.3a8a08.0004.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+5d8a06a9e86672d9f71f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
