Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBED127FB31
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775228; cv=none; b=B6ITpqQZRh54hIPGGH9PhjJztwdxwQMPCp5nxSUZkQpArofCq3tcRECr8D5D8v8Ye5L9CK3XkNJDLXUCZ8gMUFMgG0j3V1zxWNilRBv8p7PPWH9kudiD6wagZqZduAJusWxttnQV9N7pUln3swZ+wMtJ9N93twFQXDttlJIghSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775228; c=relaxed/simple;
	bh=Ym+AyIhDCfxEOpGyRdJJRwm0g7sAfUEVEl5RitTEg0g=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=StgLO39+BRsIZ6xn6hh2OiMEnS8YTKxtaMTlEKGXnhhzWl8A8Mh803QyyFaDo4OhgRwwwlqOk2V2Q6BiJ97BG8AoO36ztNv0a9a5+oXAq+a3L1FG2crS2AsmCz013TVqTnASUT18zyq1EzFJ+1mfXj2EYPw40oG76VpkFkK+TKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddcc7e8266so48829085ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775225; x=1751380025;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9tDc1o+NdcWe240Vyf7q5n8BpOM6noGp+EFBfP6FkcI=;
        b=hEcIbEqMuoonD08f6JZyAMrd34aRM1QGDkGukby49oDc/GAKadlIQTLl84KO3jfGMS
         /+NvVUWTVZrbEdmC9nwfO7hbQEkkvAouxhM0dQSkdcsB0Tg7FjOAYkmzqOjEtcJQy/aa
         1UyNmUEk+LP2CzwNhZeGc4+f87rIV9jj7T6S/tL0uJKn9CMY7vErkAOyN+BUx3ePo2B4
         8AfpOOTfCGYDLh5VdZV3bEKlmAFvdBxvEtk8wrcTcSgyqFwFo5Bw/c8DB2J1Y4HR6srd
         EC3KZTD7ddqFxy+8Opr3vIf1NGEM2VO/gMrg1OjCd2V3gbPLmNWu4WOvTS7z7WjFV50O
         V1Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWVwPf7H7PzcYo2YerSVPMaeY6KVQSazHQfC3Qtc81KmhwJI9K21Zly1l6uQtPvkNZ2p1ioGpOaMIFXTy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaMysOKOgxnHtutVHQPNbeRYmEMYW3HL0axuuzlwpvH9lPNqCI
	IZj/XUMYW+HsBWDJ7IeRSxBkTR7hnzFcA3j9CNmHoNdrL2cpqAVWhyyVanUBLnq/fpriQkYOqT9
	rBWitG8czTqqLrpT9UrRtucgCge8BXqYb8mdfy48SW9GSORrdwPp8SQ9hwkw=
X-Google-Smtp-Source: AGHT+IHB36nK2w8B1icKaiQIghtOVnBWxRiXXLQonx0ituyppVwAbhAuEs3kzmq4d0b77P1StODmyC9vmVvudDhqpuGFWds4nmgR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1648:b0:3d4:2ea4:6b87 with SMTP id
 e9e14a558f8ab-3df289d0264mr35720865ab.11.1750775224898; Tue, 24 Jun 2025
 07:27:04 -0700 (PDT)
Date: Tue, 24 Jun 2025 07:27:04 -0700
In-Reply-To: <tencent_86C09604E922EC06CE1479EA6C582EC56C0A@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685ab5b8.a00a0220.2e5631.007f.GAE@google.com>
Subject: Re: [syzbot] [btrfs?] possible deadlock in btrfs_read_chunk_tree
From: syzbot <syzbot+fa90fcaa28f5cd4b1fc1@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+fa90fcaa28f5cd4b1fc1@syzkaller.appspotmail.com
Tested-by: syzbot+fa90fcaa28f5cd4b1fc1@syzkaller.appspotmail.com

Tested on:

commit:         2ae2aaaf Add linux-next specific files for 20250624
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=11b96b70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=16ab4ce1313fe0b0
dashboard link: https://syzkaller.appspot.com/bug?extid=fa90fcaa28f5cd4b1fc1
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1198370c580000

Note: testing is done by a robot and is best-effort only.
