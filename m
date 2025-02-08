Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D6B1E4A9
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 12:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739017985; cv=none; b=CZ7/UArpyBOT15NfU8uVHFOwA8CLm3qhOv6OvEFxwTXfI+K8ZTj0XN46T9PjpIWa/otxcyQk8ev0mL53q8ANvR36U5ulwdF+3ByMjqkXYkUkHYC9tQFp5RmSfO5dLVIbvjhZ58eFE8ICIhiLgoYKsk6J/dqBEoDitZTD4HDWJ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739017985; c=relaxed/simple;
	bh=gnAf0oxD+ABqcCWkZm9AZ+oQK7K6LRG0Ib+IKWJmmeQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jPL2AZyyRtlMu/ODiltfBLenheqjlM5TU32bhZ7fe0BXQLZooidmgtJbxBESPnzFIclplwNda7XnIJdUJyVUrwemeLPZKp6xXMyszUTzdS1mH3M9fBYIZxfQWY/nJ9Uqz9hflkSYMfTCFC9khhXo3J/2HdfUJ/V/0sJ6P6SoWNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d060cfe752so16343075ab.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 04:33:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739017983; x=1739622783;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ckiJJFIUMtQZLd0IgPbcIfCLKNQXEmTvD78+8lxDvKI=;
        b=UJAnN+AuHhFXZKubCcsSp+HWZquZV6vT3r/K9wp1Gp8kFKdHQFsgxZQst+HfoZBtSF
         TLtFZq3kpGVkJckPbHlstynG/K6WreGKVJWNjHFwUQ1QGDHbM15HqqzZWKVJ33IgQe0j
         hVAQlHRQILzCvGISPM6i249ueFceJe8Qb48sJ7IV2GISasfr3V1ZkaKiMXtdxGaxURml
         vc8nmqwjfNgMSsEqEAKMH2nWQm37WBwybFcVNTwu0U/OAvt5NbDg7PA2CKkqCcck5vVL
         kDeeFNphzD/nex5xzOYGgFzDFJCPIdchRNuPqE+inVDvP5VFPSiLJ3TIJd8cSyumPHdU
         6dTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXro7FlJ6b/qLHMaNjOxpjMYf2b7TWLUHK1zw7o+RiRf3CeeV4thlIT/PneXcTfuAZ19subIUladHj2ofM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDTQqKrJrsHwiwt/u17rGUYPdF5n1CMHsPqSViC39/b0dgTRwm
	qO5HFS4TtDKWYR7QGp1vaRaEVVr4gSlWsi+MO+XJ/hB4jGW6kkCWhoEvxg70Nn9ywuZVQnd/hSZ
	nZZxDY8MXuBhgk9TznnGa2ViAMHjqa0sMuupkADXmP/I42q/zV/c4VoY=
X-Google-Smtp-Source: AGHT+IGTfrR+12PEw4Ctdq0/pJunjd+5wCzhpOYj5NP8mIPtjZi79jLVejQ9tJ/7dxB+EMXYzZelIpTH9rB+Zrw82xYzGRStZzGF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:480b:b0:3d1:4b97:4f2d with SMTP id
 e9e14a558f8ab-3d14b974f97mr22390295ab.5.1739017983118; Sat, 08 Feb 2025
 04:33:03 -0800 (PST)
Date: Sat, 08 Feb 2025 04:33:03 -0800
In-Reply-To: <20250208115825.2077-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a74eff.050a0220.3d72c.0026.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] general protection fault in __timer_delete_sync
From: syzbot <syzbot+1eaee1ec18b9d18ca3b8@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+1eaee1ec18b9d18ca3b8@syzkaller.appspotmail.com
Tested-by: syzbot+1eaee1ec18b9d18ca3b8@syzkaller.appspotmail.com

Tested on:

commit:         ed58d103 Add linux-next specific files for 20250207
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1447f0e4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=244a34ec1429746
dashboard link: https://syzkaller.appspot.com/bug?extid=1eaee1ec18b9d18ca3b8
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1768dca4580000

Note: testing is done by a robot and is best-effort only.
