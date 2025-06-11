Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2DC276046
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 19:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749671826; cv=none; b=HLFA6OO6sbvzt+WJqRHVIuifRXNxtgQkhE0JUn805YQOxiDFzcDzLDGtzyJohIZVsK07rAWPAwqJhRdWfyJDqH71uOI3j4QpKL3k6WECI/WjgNImQpBPMXLblY9pEw8I26ccH2vWU2hUn8YtN5soH3wlR00yOR0f/S/M6TEVk+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749671826; c=relaxed/simple;
	bh=USvQ9wgruXH8TAOZtTOojRc6/1bENOZaHy0L6RZTwUY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=flD+0c1I1pQfzrynbhRyS9ZAG0hoFDG1CwIgtw/HvNIt1z2T4PvD4lrcUd4ADZgTbaJjK1ND4kiGpbxRzE3phjjYQFHrcFZqHWdLMq9pgub/3TWLdbAbOCByEIWahnIvk6JMmC5kC0x8br2oqKtATD1dyDu9q5blO0Pj3J9Ptvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddafe52d04so4426455ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749671824; x=1750276624;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xybNtyXqtvfuU44a4ETAFvRrnFPUW0N0SWVp+5H5Olw=;
        b=s2x/TpnRqOOyUo4iPBcTIfDVVDAk671+NfSMqX0TUB9OWnPz7Lj0lhUoS0cAGqV2MW
         6iGcYkL+z951lkPispdLs1lSQsevy+6lti3wFkjn6oO43xJzHFYeaOE6H+DdfSnB7vjC
         17SiWQAiyI+paIUyB7MMxz87kGK89ZuGks8yyPQR+Q37FUdwFvWefS/dlc31gMDT8I2R
         pppipZHmGopqdGPkwjozEFTXOoC0BWYFMSPZS3DeQ5aDU5YBXwAgvWDnG1mt5wTQONtP
         p7tdnBs/Lcu6uImASIhB04mO5f2XTKcMHL7X8exSfhYPe3OT/M8NkgDIwZRCz4lIAMq8
         /wdw==
X-Forwarded-Encrypted: i=1; AJvYcCWqHgtxfahBXG37guXDLRoCn2CcsFGdyZwIlJpaT7PB+iJZkP0TofuYIvHRH40x/wiu5ZU+lR8LOhb2ex4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt7hXX3up77NQmlurMVtLoaq/51YUSysFnAb6NTf3JKolsfKi6
	iM4PbeOP/Y7nylOznmAT4cunRqbkAr1D+TPlED8FQH3qTMCfMTsp2q6ixwm77Nhqd7hOBj571qU
	G1znF0q+TabnC2qHT8k/uR/hhh0yln3yBispIkI8grTObmVnPA2wP/SG5vBA=
X-Google-Smtp-Source: AGHT+IGaOiMEFXv47KOXSshI967qhIWt3XATRcvi4libIu+B5QOc5/g0VNunN6fwcDRO92g7JVoZgVqKP45pyMNnH4AnwbsEZal0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:218a:b0:3dd:d6c2:51fb with SMTP id
 e9e14a558f8ab-3ddfa877098mr15583135ab.10.1749671824458; Wed, 11 Jun 2025
 12:57:04 -0700 (PDT)
Date: Wed, 11 Jun 2025 12:57:04 -0700
In-Reply-To: <aEnVuzK7VhGSizWj@pc636>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6849df90.a70a0220.cc01e.058d.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] [rcu?] BUG: unable to handle kernel NULL
 pointer dereference in rcu_core (3)
From: syzbot <syzbot+80e5d6f453f14a53383a@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, josh@joshtriplett.org, 
	kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, paulmck@kernel.org, 
	rcu@vger.kernel.org, syzkaller-bugs@googlegroups.com, urezki@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+80e5d6f453f14a53383a@syzkaller.appspotmail.com
Tested-by: syzbot+80e5d6f453f14a53383a@syzkaller.appspotmail.com

Tested on:

commit:         488ef356 KEYS: Invert FINAL_PUT bit
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=129a660c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=713d218acd33d94
dashboard link: https://syzkaller.appspot.com/bug?extid=80e5d6f453f14a53383a
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=170e460c580000

Note: testing is done by a robot and is best-effort only.
