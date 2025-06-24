Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F4A223DE8
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761545; cv=none; b=W18ZqQxm4tRixh8stZKK8hN6FUrjiEQKEgO3NUAedkTEkqDENOI/g27fgS3ag/ElXINHA5D5KmOP2f5XjxftlkNCmL4qNo8Ur6vM7ExPBgh9ywJZMvG+O0NvUlqUlByzE+hVHont1wA4xaWCgA8XdwDyaBlObuBcdIzepkM2Jic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761545; c=relaxed/simple;
	bh=rphr/gilBmabSnM/0Q4jGkDtLiIwETrDvS3TjqvQIHY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HP5DNN7nWfdn0VL2Ke7xYV6H6EKGNOZWdoIIPEaa/z9GJ0nT+/wUyu4XfAK84v2lEPocSRvAsOuNPaHlOKVysnCQOfSyNBF/F83TY4Hg7kTvuio4fRTNy7zN2Ht5PIGOKRd4ENr9R5+QZVN/WR8wB6G1NA3cnGWN8kFy2SRpRqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddc147611fso115093505ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750761543; x=1751366343;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjChxfo2lLHHAf18M6IBygpThdOnehCGj0MYdl6w0bw=;
        b=pD0mZrUt8DmHF2DGwa7xkQHzejaQ26ZPJYmOwck87QQ0jUkvcctRV2BxDwRm0Fx7SZ
         CpkFMWsxFYEggnNY9pJpTaFx6rDCgdXiaFg6dpY3+t1oOWI6Keku5e9O2u3KZL5ZNmkH
         eyr2rKT7VDxIGiF2vwmlC7tyXSO4Hp45Fyva+/usdLLBTER/8zBeKo1h43z1widR8fFa
         KRZCdlAVKoxpZUd645euWYdT1pOPzTQBEcxO/aEUXvVH427+DqvX9fIoaG7TwV1beQXV
         TqPBT7MPooCp01PXR9a3mnlmuGUGkWgFnFrlDEoa/lRFdZx3dWcFaNXTp0Ts5kmGW2Ko
         Ewkw==
X-Forwarded-Encrypted: i=1; AJvYcCUFBJG1Ba5FRSfs0XTSNIhhqgMApNLxWEthKBcGJ05xO+PCcyXovOYzDwR3++reWQEOIswHpIkwBL1OKkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLnO2jRNK5pQv3uI5+/ADGB9KFPx17hLNcOpO4dtiQFA2ropaP
	B1LcGqYBreNQRCIPwnYwd8sLfpIuGdOXLTw89/7CXYI79r6vYVf9vNuOt6X6ytx14wg7HWKbEbK
	o9QVZ854POAkUkB77xIVvMao9AN50V3xQFqMlOsEbrSgtlXwEXrk5A6999iE=
X-Google-Smtp-Source: AGHT+IF1eR/bCiL7c/5fmlVP0t+h/SiOMoFpxFMZgFZNbDEKfJ/tzbqYYQXTjR9fnUkdsVKbb8YfnAA9F8qDtQMSM/rK0Q1DUhcI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c26c:0:b0:3dd:d348:715a with SMTP id
 e9e14a558f8ab-3de38c31ab0mr184528235ab.8.1750761542883; Tue, 24 Jun 2025
 03:39:02 -0700 (PDT)
Date: Tue, 24 Jun 2025 03:39:02 -0700
In-Reply-To: <20250624-volldampf-brotscheiben-70bed5ac4dba@brauner>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685a8046.a00a0220.2e5631.006b.GAE@google.com>
Subject: Re: [syzbot] [fs?] general protection fault in pidfs_free_pid
From: syzbot <syzbot+25317a459958aec47bfa@syzkaller.appspotmail.com>
To: brauner@kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+25317a459958aec47bfa@syzkaller.appspotmail.com
Tested-by: syzbot+25317a459958aec47bfa@syzkaller.appspotmail.com

Tested on:

commit:         f077638b pidfs: fix pidfs_free_pid()
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-6.17.pidfs
console output: https://syzkaller.appspot.com/x/log.txt?x=13dce70c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3a936e3316f9e2dc
dashboard link: https://syzkaller.appspot.com/bug?extid=25317a459958aec47bfa
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
