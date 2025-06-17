Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EAF3208
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750146485; cv=none; b=R2s94oPPZ3nmvqyv1dg4t33GPFYjpAvT6rn4M7lY+NmTPPkQ9w+lYHpgSMGA6IXH3xQfAU8XiQSujPjgA4APcmgB3FTGkLbWtXG2WtVe2lCkrUktVTs24HzTsiHraSwcxt4M298x5UX48PlCwKDpiv6LRve0SsfidJwUNydLm0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750146485; c=relaxed/simple;
	bh=QKO/tIX+1cYn0J3JhO31rRHq4VKD6na2NyU9a0KcSzg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=oMvaUcurRvuNAnNoobFyXqPKZZg9n8iSRhp3HLYqniqxtL2iENpnRJqcnSNdOqji0BYeUJYTcP67fnnohNyMLwjPiqWkwj/WloCMlTaXGug1OImYD8fqZ6vyHahIPkvHa34jUjAgHT/wYUy3m4qerdyDBYojvHG1TGECPmUr5uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddb9c3b6edso70686075ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750146483; x=1750751283;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47WIVCmHYM+a8dy22Mzgd9zGctxbkrk1SB3qvu6lP7k=;
        b=GfVVTch97KAE1l7xEhekDTVl4E7vGWlNvNKymUsaVwuzFbPGbKux7MRM8kw189rWsp
         AZQao0icRWei3LQGGimODHRCGSKcmru11E/8HNuzVEC8Zfqp2UBBBPmtXIXlUrgNqyen
         7a0BKeBqSE0SUoG5v8okmb2YLDieAaoSia0DZ2hg/mryXRWojApFBS/yMvydJm66EYIG
         xNKjgWXQOYuXaiSnCoZDfjFQWTNt5wOELZMFW3BZvOgMvcql0EGr6alumTX1yxODtTRL
         oOHWCESXKUln/uASADwQMus3gQPFdjBV0/7KS3H/SDzAQXx0UHWtoDQCVvMte6ZPQcXu
         HwvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXckni1lujxAj76A/y/vV0g9uCt6lSde1NUSj4kvwnjMA7nwqKGuMvS/qk2AtINlpJEiy9p2WZdyWaI8os=@vger.kernel.org
X-Gm-Message-State: AOJu0YykfQ+r/OUdb4dWYFtdi9HYR8mK0Hv+S67/RwvRVj/xGm9c6CDW
	+R8taNAkIVdNs62rKDZkrtyw/oELBWhVZ7rugC3bBLtero8oiQiU6Fu+ly5fU/eEjoU5ewGWN1v
	b8yj4Ue9uPyk8dFfzS6c2e3BGHDHIT+BKskDsZtxyFDPQcsLqA4mZxwXlg+I=
X-Google-Smtp-Source: AGHT+IFoFTcDF1oN/dxZY8k7P8ixuR48FWPVVt88Hos5jxFcAWgkn7BLm/SxU1Y1qVdwjbsyTwzjLcytS1h6M1Zuil90qQDAKIa1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cd89:0:b0:3dc:8a53:c9c4 with SMTP id
 e9e14a558f8ab-3de07cb6621mr131645365ab.6.1750146483071; Tue, 17 Jun 2025
 00:48:03 -0700 (PDT)
Date: Tue, 17 Jun 2025 00:48:03 -0700
In-Reply-To: <tencent_6BBB12330F9EEB1B9A4B791B262506BA6708@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68511db3.050a0220.2608ac.000f.GAE@google.com>
Subject: Re: [syzbot] [jfs?] WARNING: fs/jfs/jfs_dmap.c:LINE at dbAdjTree,
 CPU: jfsCommit/NUM
From: syzbot <syzbot+077d9ebda84f426a6a1e@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+077d9ebda84f426a6a1e@syzkaller.appspotmail.com
Tested-by: syzbot+077d9ebda84f426a6a1e@syzkaller.appspotmail.com

Tested on:

commit:         4325743c Add linux-next specific files for 20250617
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=14794370580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=70c73b370b132354
dashboard link: https://syzkaller.appspot.com/bug?extid=077d9ebda84f426a6a1e
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10a09e82580000

Note: testing is done by a robot and is best-effort only.
