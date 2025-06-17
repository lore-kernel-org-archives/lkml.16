Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD96238C04
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750156265; cv=none; b=fc2merppImKFDjrlEkhrikLJm4GhwHa6j+pXIj4BmlIYrsFPw5pOhZZu+n+EJEvwxUw9aiCENZQblUOQE7F5mVVeBZj9Ik9pow5jt1xTuEm8EwG+WqvQ0p05O+tyRoIayr61x75BOtqFAQ2u7YNoc4p/Gi/izh49QC0/cG3EITE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750156265; c=relaxed/simple;
	bh=g3j+S1VBapVxiPUL7o+H6JKhvNpAWui6EQJTF9Q7XlE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uz4ayTNIWZTovfNg5w6Yp99csVgjbYSYgvXfP3yT3B86tD9hVt6Ace52cWVWdOc8XUfap+gBiAN33q5XY9UXqRb0PbxKFO2nNu9/f7h2y/fShbjfubzlF0TbBHVegLCfhOgkkhLOR97GXT22DPXtNqiJROczfydprpF5r4dZaxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddba1b53e8so61321655ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 03:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750156263; x=1750761063;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gHy2hEYdU/qTD2iAln9JcyILMuFwNh/oT4oFGiagJAo=;
        b=fzXO0VS93SMvMufXKSChgab/K188263NOU0WaRuHiunIIvNF+u/KUwDvB/78e+P5uI
         HgeT+XvyAzyeM4NaRTgrKBEwolYNltckB+6/NqSZrjXMY8Mbr84RMyS9dvY+fE5XZB6q
         K17i3p8KlBHfi7uBGHuJhqSBtAIq7g/oNBwuRa8H7nrWINw2rX3CTKwUlD7iMTVHTWzB
         c2Nc5y7Dk2iJGZ9ONC8XGnPuYmGFsnV5XluzXIvQqRQ3TBPiVVUyuyW/TM4y8Pe1T7Bg
         YCqOJDGtfFHB/+013FCgvHWhPwbqTF7NhX9SYlwCc8v6r4iAikaqWz1/nr+ignGRfVK2
         w/QA==
X-Forwarded-Encrypted: i=1; AJvYcCU/c43UL+dvvbx1oHrRKzZA9nt0cf2+nKWQNPU6JZ4I6svw7WiNCB3LVr9+KsQG6Dd1kINkfG9qDme477w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRj3IF6PIuAQ6cG/jx1/4MfURWmXHaGwn2OSdQMMCdI5gZNXLp
	uKQhG73LTp9yqoZeLeLsCFYbO96K0W8C7l+u+fb68Vmqk4Bw2K+/tbu5y4hflkI4rPKSgVuZz27
	j4zhd4E5XdkFoX2YEpay9dXaGI6pmEsiDrK01TKrizu4TQktdQ63CxOtPdc0=
X-Google-Smtp-Source: AGHT+IFFFHE1MTvfh1Yrerz66o84Y4qKxQucMuai+gGwCPL9oG8Kd++CWN94kcGGwuF4moyMQL2PvQ4VChViyjUn80VnzA+cD4TZ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:19cb:b0:3dd:f338:6361 with SMTP id
 e9e14a558f8ab-3de07c5cba7mr142824055ab.6.1750156263075; Tue, 17 Jun 2025
 03:31:03 -0700 (PDT)
Date: Tue, 17 Jun 2025 03:31:03 -0700
In-Reply-To: <20250617114529.031a677a348e.I58bf1eb4ac16a82c546725ff010f3f0d2b0cca49@changeid>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685143e7.a70a0220.395abc.0215.GAE@google.com>
Subject: Re: [syzbot] [usb?] [wireless?] WARNING in ath6kl_bmi_get_target_info (2)
From: syzbot <syzbot+92c6dd14aaa230be6855@syzkaller.appspotmail.com>
To: johannes.berg@intel.com, johannes@sipsolutions.net, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+92c6dd14aaa230be6855@syzkaller.appspotmail.com
Tested-by: syzbot+92c6dd14aaa230be6855@syzkaller.appspotmail.com

Tested on:

commit:         9afe6529 Merge tag 'x86_urgent_for_6.16-rc3' of git://..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1008c50c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a1383d853600dcee
dashboard link: https://syzkaller.appspot.com/bug?extid=92c6dd14aaa230be6855
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17334370580000

Note: testing is done by a robot and is best-effort only.
