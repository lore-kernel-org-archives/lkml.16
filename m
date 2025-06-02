Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BA81A08B1
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 13:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869333; cv=none; b=IQrZKoqLp4c18rP91uwPCk9saH5M++2at4EuOB0y0fvYk5kP3utp2rsFvxqn9o129CI82R0xO/bRaRJ9n06VRQdb//Q9nzoCYPJ9tbzpxChjk/Hkp9IhQJrxc8noNzP4MUZTWOoLWyniTeMnqXbARn7ducet1E+JhvS4dqnsLYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869333; c=relaxed/simple;
	bh=TtkT46dVySzqpj34qqQIaU3JLj45FXDa0CAJbYjQ1zc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=B0RCsEwqYAlj8H6xZlZ9Up/RS6dCQZQwNZV4ObC1nxNUaCR098dPupdV6Vg00kXZ2b5l5v8wfI3C8Q5sTDLndykswG8HbxG91Hf8ZQ4W+HIcrpYYclF94a9sE6YsHJuz601kCUvg/Ar2u1U7Uz1mZwClJiLsx/GRw6vMQi21Vxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3dc8b60169eso45963545ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 06:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869331; x=1749474131;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w7fxteB/f5sDtYeR1EMo4Ak0z4+Q25y3p1Fc+NOwwIY=;
        b=o5vls2+daa4qUc87UihzYj8CDnnXke6VkgghTGYlWWbzMvhSeIv4XM9KVBvpVRTZoZ
         KyYrYUQj3BUpMeJ2dPodjt+b4/HXhDR1311Pn1bSO6g/Y1uqjNH76HhSu5MdZoY3uf2r
         +7db+yMibIRviT5XybbG77303lEHBgBlJ83WCLYoMsmICzr1o7j1gYclYlrWUVw6jmON
         HT3r8UHcOhqSAhgPRtxNM7RyJBh3SNVmtJaRfJh452/YqyB0ZvxW788MrfDG0pKq/ms0
         TC4bgFsP9qE7Dhoj4XTS9ZzAHKNNz8JJQLw7jAfPLoXYZ8yuFpxosjWILnmxy/knk/bc
         UCvw==
X-Forwarded-Encrypted: i=1; AJvYcCXwLDjY/NzzEEbDvOB1kU3hcfUWX0oWz24yYNQRtOnBIldXSOl7KG1WyAAqDwtkBiBqgdxZJUO06kgkCss=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpKCpEygWEGQ0XUg/obY6otdyoudJI5nGhgfjtyVgHD47z1IF+
	vwbT9JcDBsmIB9DxNSjWw65Mg2p7CjncITSXv/rhrYQWVdfI15GNim5ITcTIPSIJv/NsQ/AQxAO
	g1VgdcP4dZODCMPPgJOZrfCDcp66/dUcW9TcUPp/m3JDnSAr5O5sO/R5sg/c=
X-Google-Smtp-Source: AGHT+IFWtTdvixuVzBD0tn2upCe8Es69ApyF4PTbdgFaEHRZJy+E6cBgwD65KLDcZ2xxw/V33d/AHZi98X2kLR8f3KcI+qbaKPu3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:5e0e:b0:3dd:b540:b795 with SMTP id
 e9e14a558f8ab-3ddb540b9d8mr3170435ab.3.1748869322784; Mon, 02 Jun 2025
 06:02:02 -0700 (PDT)
Date: Mon, 02 Jun 2025 06:02:02 -0700
In-Reply-To: <683447f8.a70a0220.29d4a0.0803.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683da0ca.a00a0220.d8eae.0051.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] possible deadlock in start_poll_synchronize_rcu_expedited
From: syzbot <syzbot+cbc79a37b5fa23efd23b@syzkaller.appspotmail.com>
To: agordeev@linux.ibm.com, boqun.feng@gmail.com, guoweikang.kernel@gmail.com, 
	hdanton@sina.com, kent.overstreet@linux.dev, kpsingh@kernel.org, 
	linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	paulmck@kernel.org, pmladek@suse.com, rppt@kernel.org, rrangel@chromium.org, 
	syzkaller-bugs@googlegroups.com, urezki@gmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 82067c916994dd1bfec65496144dc16e17899e36
Author: Kent Overstreet <kent.overstreet@linux.dev>
Date:   Fri May 9 03:21:28 2025 +0000

    bcachefs: buckets_in_flight on stack

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12fc7970580000
start commit:   3a83b350b5be Add linux-next specific files for 20250530
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=11fc7970580000
console output: https://syzkaller.appspot.com/x/log.txt?x=16fc7970580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=28859360c84ac63d
dashboard link: https://syzkaller.appspot.com/bug?extid=cbc79a37b5fa23efd23b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=106ebed4580000

Reported-by: syzbot+cbc79a37b5fa23efd23b@syzkaller.appspotmail.com
Fixes: 82067c916994 ("bcachefs: buckets_in_flight on stack")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
