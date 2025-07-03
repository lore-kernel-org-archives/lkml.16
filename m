Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433272DE70B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751540887; cv=none; b=DhaFJ5cA3cRZyocZ2AXcmaWhcsvarv8FMUUKXlen2aJvPWTRnmWxNxPnDFZ1mymtLkjqWaiY7WyPl82T7OdRnllwD5XnBBVrC+7o4kUOpqD1nSrhxgdLd3mxA4u65QxMjWXcXDgqw4LaC+ulYrEUeSG8MDxKWSfg+CiN9TNdHUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751540887; c=relaxed/simple;
	bh=MPSNj8tWw+VyxLZS+h/0hvZHLTe44L3A2V+Y/Oyilck=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Z+pgAWUJwiwfDRZhnJzYThZbD/SCZ1mGv9CYP+0nW0KTd8S4ZYT0yImLJrL+YVrj02y1lMf1SYht1tZ6Iosxt2hiKtktkPD+1W83s2xOIjs8tgd3Duy0CbpXJ+7wVGFdyoRg4bNDoAHDEqiI5I24dmld493uI80XrUICeCCT5Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3df4d2a8b5eso59276525ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 04:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751540885; x=1752145685;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U4NOZMlABcLY/rRXPDEgzMXy+AfZ4u/sPTCtTPJWoXo=;
        b=VIgZCIxDvQxbDeLEdXVaJutiLDS3zFpjlOI9or7Y18yVZQh/0ObYtr7Ki8iXo9sm2E
         cUAnUbhVdg5HD+39qLD/hm/l3f8iop7bwN7xsduNIzkkVvOqewdxXf1ENUoY8xploup9
         PHHGkg8qM3uwwuYSWq39qc7ABTmw4gePUiO1abd6xfXOCnjcCmmOCZWZ8dmiPrWv9n7B
         piI0k64eBpo7XxvqZaCc4P579jo+gN4K5Z+Y7bc1U2BfNaKRMmxWgocH4emm6NrGDfTZ
         q50mTpMHlP1siQspQXfPNOI/go0f/RvdIYmjCbDq7TR2GNwrag+w1DR1UVViBCFHUYRj
         VlOA==
X-Gm-Message-State: AOJu0YzN5vlh0ad4lck9xhLXuLJUI40XJdf0CLQm/zlsi+dT+ZeeKsCT
	Jqf/NZG58isU1CedKLUJEsOTRDutLGHkhtplURdqHesGTPdAaieGR9gU3Nq08SwMsaquZsY87Vq
	65jXtSMgg68HDEck2rtR1AtA/4XaVJ++lAicrm5GH0topvXIs+aknB5/wNBA=
X-Google-Smtp-Source: AGHT+IGjfCTIqp1nGBlW2xfdPPDOGHzxZNhNTr2JKAqarzF+tInjrXMTgjqlwOEpagmjMezHd13oA8r+n2mVLV3mH05dbvjwpqi8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2167:b0:3df:3271:6aba with SMTP id
 e9e14a558f8ab-3e0549ea181mr64021555ab.15.1751540885402; Thu, 03 Jul 2025
 04:08:05 -0700 (PDT)
Date: Thu, 03 Jul 2025 04:08:05 -0700
In-Reply-To: <20250703092137.1888114-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68666495.050a0220.37fcff.0001.GAE@google.com>
Subject: Re: [syzbot] [fs?] possible deadlock in __simple_recursive_removal
From: syzbot <syzbot+6d7771315ecb9233f395@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+6d7771315ecb9233f395@syzkaller.appspotmail.com
Tested-by: syzbot+6d7771315ecb9233f395@syzkaller.appspotmail.com

Tested on:

commit:         8d6c5833 Add linux-next specific files for 20250703
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17e40582580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=223eb69834aa2df6
dashboard link: https://syzkaller.appspot.com/bug?extid=6d7771315ecb9233f395
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=127ff982580000

Note: testing is done by a robot and is best-effort only.
