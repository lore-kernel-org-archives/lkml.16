Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC9429550F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 20:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751402045; cv=none; b=R4GtetSif1EhArMzcJ6LUJjmlx6xViKMhKb0WpgEM3YHPo9lVvyni2HSkNRuIo+//7JBgcDVgq3h/AVL0QFQag56g3V4YU35gXmuDu6hgYsIx9y6eQU4EYnGvZ1NIbs1nlfyg1hXZJ8jOtoowLi8awgpbS2IwznDnJW/DuSO/go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751402045; c=relaxed/simple;
	bh=MAul/3RVS2yUgg0AOCRFms4q7VmZh1VNNpFuVZMfV9c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Br3LfRKjk6LW/VazN/hHHP+fIm6udQnHKyCFavYwE3koCZCvaTZFN6xIOu2yzC+jpIScWDWr6e9AO1+bqDlxuvoJ2qZOYIaIaWZgHxAxIw1UaJpOOAGfhbXCeC2BwQ9gqMnQho5/J5bxQhA83pZ0HC7HP4lUO7Qby5ETiLe0r2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3de0dc57859so44988055ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 13:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751402042; x=1752006842;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ukn8Pm62dNob2zcuI43FOAo3SUxOVTN/sSt30MSOTQ=;
        b=PrGe88Uu4pt3qEEv2iEzi/5hWwgNVEoM3PnSIyex7CDjrB+owMrHSb7vU6FBW+tdvc
         9PCY/Ha4GVvIRUhywFM7tRYECqX9dfB+F2ZcO+fYqMoj3ivQlCd2SG7ThnCXRyIEk5E+
         B6GbpRScUXUidagzeJe615oYtOk/t3gF/Y/xJaB30oityrkydzGhmzzCH7OWm0GhYLRa
         XjGkqjDhqnVLJrpfR0vSjifCzi+2z/E0VXjUJ/Quhu9ybAboHrwLUQ3kDzbbdZcdGsdh
         Mqtb3XnvXS2NsDC6r/8d0ZjkuUt4/3ANUrIVwEMDANGj8vtDVynZJcPxVuwGzfkSRFni
         +gGA==
X-Gm-Message-State: AOJu0YxcA8SEJPZ5QDv6bg28HHMieoI/jLAkhUE6vRaIZ3S0WbIyyYHO
	7syUXfywCZhlEwjvq/B0Y9ElpuBgWI4N0q6Uq4Ov/Fosf87qWYzpM47oT/bK44h/Pqe0eKiU79R
	fPPa0gQrK/mm9YFDj97iq7kjU2+A57Zr6oJqj4PJ0yHnieOEZEpCV2SrJLNA=
X-Google-Smtp-Source: AGHT+IE8B95bOQmtqMg9EFUtnFipOe2WRFCsEOYpXVvIYnhE6d2LeAMJcZWASP3e1aqm9gsmoJ4qVZ+8TQ3NNqzOB3IwW1zCKPd+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c08:b0:3e0:546c:bdc3 with SMTP id
 e9e14a558f8ab-3e054ac7ddcmr3663335ab.11.1751402042584; Tue, 01 Jul 2025
 13:34:02 -0700 (PDT)
Date: Tue, 01 Jul 2025 13:34:02 -0700
In-Reply-To: <CAF3JpA56EJV76dTfBxYoacgBUXOptfmN4FhQcsMq_m8LDrnv5Q@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6864463a.a70a0220.3b7e22.1f8d.GAE@google.com>
Subject: Re: [syzbot] [wireless?] WARNING in _ieee80211_sta_cur_vht_bw
From: syzbot <syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, moonhee.lee.ca@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com
Tested-by: syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com

Tested on:

commit:         3f804361 Add linux-next specific files for 20250701
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=11df648c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=46111759e155f4cc
dashboard link: https://syzkaller.appspot.com/bug?extid=ededba317ddeca8b3f08
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14fb3982580000

Note: testing is done by a robot and is best-effort only.
