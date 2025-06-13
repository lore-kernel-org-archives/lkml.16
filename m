Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29972F432A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 03:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749786485; cv=none; b=NzqqaNQwJ4RKum+es2QttXNNlFzDdVUmH6ieQmUgeYgYWfZBiqfZoQZmgi2Iq1+R5ZoK922VBnt2NJu0HiDaYrYld0+lSjcpTCo2/BIQBsxQ3EI6e0NhBVuS/uJYCpKMcBsBODU3RKdK1nSnYzarZjUcMjKILQZhN81Ymh0x1PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749786485; c=relaxed/simple;
	bh=N1gUe52OrqxqAbjdyE4E7HFj3Ap44rjytkPGKEt6g/o=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=nSE6VzhgMJrdx7F55Vb9OH3yDXMS7+y+C+T8z3svdpghNpEgKIzGaelVj3JdJOGZOISXsbV+k5bJFINe6NhOg/0N+jG2Q7X0gAZj1oEOMXvUWvRItMoR7IWPBPkF0H8zNGC6n4FC7SCHQfJ7+yWXqh6ja0nM+J4Ne1/93JnIIPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddce213201so17811725ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749786483; x=1750391283;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bb7E79GyQMeti4MBfKw+o8g0qjQkyE9gUdl7QQL2wGE=;
        b=sizlrhmvviEtPXxMuzp3JybKvNafkxR6YEiSthq4y5TbqcUpKUeiFJhM9clt8lBDCB
         qZAPYbEp5xEkP5PWjL713iylytxQ2Kgp1q9duIZ141Gvg2p7Xa3b7FitRjnEgqejl63m
         xV+kl1gRW5lFBPM8DLsR4qdr/78VB8LZ9T7e+cH8tsuJj6K4I4oR/BcJEI4vtItypOZr
         xokjDrWT8m4bjcBbMUBCrjXtjEw3RGHY6o8GDTDhrP0+S8l2C2KhNG2ZaCW0MEOHQ5hn
         FZV14cjjzeyhJL6OyzDNlZYjKbMAqNBsbLnN2HlkdRRJZcZEtquIlC8Y4hkAi+xKkmlU
         oHzg==
X-Forwarded-Encrypted: i=1; AJvYcCVN8PX79A9QCP5DfFrNtbkdrHm1Qtwj0IaP6WcT+2gMYTUzP8AwEqIS2MrP6CzeFt5/3g8rBr5spyPNRpE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhvj5Kv25JvKHkkabKReGuVymprjRtYppMBCGuuFq2yy6wA69p
	bJCaWcbMFpiZuUJJzLP8oI7u5mBAB4QmDObefayMlWXfMrStY4G0PyKXfimJ7G3wLk2UQwH1ezl
	zbYqe82eF8QM6Y/3Jc/kgE8uA5j5K89s7YTCBH+R7VVbe8mUAJ9Ydb4eJsKw=
X-Google-Smtp-Source: AGHT+IFAaUNUVUwpx+yr5Lts6w/i1C8c2OGsKXM9GI/kfVSZFF098ps8LaS6jDuxbGX9VLeErfyxSkh9NsnudZ8UYmYQ26Pn8IXN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:d4d1:0:b0:3dd:bb43:1fc0 with SMTP id
 e9e14a558f8ab-3de01700c5fmr7352865ab.11.1749786482836; Thu, 12 Jun 2025
 20:48:02 -0700 (PDT)
Date: Thu, 12 Jun 2025 20:48:02 -0700
In-Reply-To: <20250613030043.226990-1-kuni1840@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684b9f72.050a0220.be214.0299.GAE@google.com>
Subject: Re: [syzbot] [atm?] KMSAN: uninit-value in atmtcp_c_send
From: syzbot <syzbot+1d3c235276f62963e93a@syzkaller.appspotmail.com>
To: 3chas3@gmail.com, kuni1840@gmail.com, kuniyu@google.com, 
	linux-atm-general@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+1d3c235276f62963e93a@syzkaller.appspotmail.com
Tested-by: syzbot+1d3c235276f62963e93a@syzkaller.appspotmail.com

Tested on:

commit:         27605c8c Merge tag 'net-6.16-rc2' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16d17682580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=42d51b7b9f9e61d
dashboard link: https://syzkaller.appspot.com/bug?extid=1d3c235276f62963e93a
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=129e7682580000

Note: testing is done by a robot and is best-effort only.
