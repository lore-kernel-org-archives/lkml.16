Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49907B66E
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 02:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738375386; cv=none; b=ii2hyKhlC9w6irxKfkS39W6adm3k9O00H+Zl5IHErorJjVylsxGug4htDBDxvE33Vnxc9wyJLH4esfKwOFk2NqLacSYsC/ei8dzV00HdbXdPPbVpX+aY7bEV4zp7KLvAa/RHVhCik+v5Eqi8Ox8hfELHziYyPy6M5x8nSq03AnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738375386; c=relaxed/simple;
	bh=1cTgalSvXlYYnGS+PP20n9EYAzkWY1gkh0rgNXKaEec=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=L3G3vr5Gf0a9h4wZjR1KH8CN7kXfhINdq9XJDMz4MopXZY+AGtQSUDG3gaTfTQrn3ZwHPzBa082F0KLPn+oLDAfQiV4kGrhvJnn+za+2YwEJ5rbdfovokQ2RrfPUpCo43kvDIflr2ziqnrjVWFNwEExo6hbQRGNR6g3TCQBcmxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3cffc8affa1so16173635ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 18:03:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738375384; x=1738980184;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kae9X08JQFleTz1hJG9mClkg911OTDuftctl0CHRdHA=;
        b=O00+v9+G7WpDclq0Hy9eGqjo/kdGx662HuBZdbfXW0nxYlAyW9qkJEGJxFFHFZGOJm
         KllBDF+Qyu/8El7WkzrzgIFQra0rDt37CljpTSwQhGiQyQeuqRhHshr3Ff/6qbCRTNDT
         KeFOGOXWNVyA7+XARp1J6HQetmrmPjhtOe3YOGCxE9nGOO3nLsFNYHomSZZh/mf8VTfR
         ockVSUdveXAu2pFAh2gWMfB22i+5V7tLNhki3bGU2gx3Lcwo4nn9NTp6/SaRroyo6TZc
         T5Gmwbh+9GiSFNNoqQemRgvOj/bgugAXi4HGsa47JkADgKxRtqgL23UXBYHNtbgCbNXg
         uwcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMHTHDWz9WyQ9o6xnG6p2ggTjXY72lB5eGXmrFDdWfAduKXk8hJ0BNbVkW2Ufdv0alY+dv3jQCWmxcU+I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Ka/KFu6+vceTixe1z45xqEn7RQgoECwFR2HB/Bkh0VaFUKv4
	tLtRlxqbIx60QpwGH38SWV6pKUPCGabKCuZV1U4HOgwZMBRPuwDHvPLb9jF249Mrym9KEkUF3OL
	Q9tM0AzBBZGg/9/imfH/q0/2pRdexyXTuUa5poDh47fc72GNa5ch4/lo=
X-Google-Smtp-Source: AGHT+IH3bYXXbzV9r19XuBrS3hDwhBLpZNl8u2zruMNUL3T2ZZ3Sb+EkSSzBEOrMzJdDxNAyANYdnqmehTwe7+7DiBQOiRG4MWOq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:148a:b0:3d0:1360:55b6 with SMTP id
 e9e14a558f8ab-3d013605692mr50506985ab.0.1738375384424; Fri, 31 Jan 2025
 18:03:04 -0800 (PST)
Date: Fri, 31 Jan 2025 18:03:04 -0800
In-Reply-To: <tencent_58E8BAED46CE2479A26D8C2E716D5895940A@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679d80d8.050a0220.163cdc.0014.GAE@google.com>
Subject: Re: [syzbot] [fs?] WARNING: bad unlock balance in seq_read_iter
From: syzbot <syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com
Tested-by: syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com

Tested on:

commit:         9b08ba49 tracing: dbg seq stop
git tree:       https://github.com/ea1davis/linux ftr/syz
console output: https://syzkaller.appspot.com/x/log.txt?x=15b1c518580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7acebde734703260
dashboard link: https://syzkaller.appspot.com/bug?extid=c041985778e4069e1ce3
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
