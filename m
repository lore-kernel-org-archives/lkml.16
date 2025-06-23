Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E937922DA0A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667764; cv=none; b=Tk5wa3ZVasCOC+vzkbaV30qAs6HzF1YASm48gw3a0TqzpbrPkLuswU18OC2ENmFSPYBVtooghGC8CdUxYgVzpSxrEKerqmawMxg2j2ctTDTKTo408gFoGLtgy7iWvJa9AGGCq6SvgPtSnzw9EHPLnEb3kgqFkn4Qw7k3tWO2GPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667764; c=relaxed/simple;
	bh=uDUMgzEBp5JV3JZQ+f9mdHo7Wo//lw43FkAxNI1p1to=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rAz9aVo2D2Wgr4NJPxOi1NDludSydioHkFeGg2qaSf1MX8WLKl503mtyCN8gMRwmwQWyUSn7UVqCNExfKGUM4R3PbLlxH0Zn++LvYIpRINzhmawFY9OLthJc6SBRD5gyr8E4V+r2Z1IooUQ4rfU36SMWHQQt8PV6oT0ZaoGw4gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddc0a6d4bdso45688595ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 01:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750667762; x=1751272562;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vflh0wMpfs9YIwAtX7H9KdsrcvCKuFQ3cK3z1R6CAv4=;
        b=vPCdlKsi/DlI+HKoZYYSpm+x/eJeZWap+XtOBxgoFqkJ8aqqkwD2bQSIjfx2Lb/evb
         ae/2H4J7eOzPJlE7J3pfhGM1jXOyCGmvO3+6Dn2J8eacTVXU8GSNPCou4jGkQ6sxJPXP
         suKpOLZNNRQaNWktLD/mF9l0ZAoY/ldjPPdhPSUrUgKI7tbjjDdI8zPrFy8RW4oB/BMT
         AZGEr+3F3vN56InqRm6eUZIMzW5rthWDJvAk7sQZ4o/R2aq0R7V0FfRT3aumQzuah1BT
         Por68l5MRkjBRrJQHtndrCu/hUDhKETEbGlfKtuEiuvzjPngwye4Ov20iILpkg142yZP
         41rg==
X-Gm-Message-State: AOJu0YxWQUchQf9wJClySb8sKl6gkDXFkfYeBzcK3ssR26MfwDzrhaWM
	fFAGcFZ3o32POimPeOUg1dZnn1iq8H06Avo+nG6RMVBN/Rcr+9pbGrvqjTMMPSuG83cEN0Qk9Ve
	hbrqwOCpHVYJjzl08JlN0OHPwxgyGHXjp7Mx6AmkuJLIvBFNB4SZAuuZ1fsA=
X-Google-Smtp-Source: AGHT+IFdlB7lPmWeJwCRxZZTOlngrs2RuNSP2aQtGuEvTiX3l25+/vt3mowsV38KLRvWRKdH+6aKTNB0JqXPGIxlt2LntVnY/u/9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c241:0:b0:3dd:dd39:324c with SMTP id
 e9e14a558f8ab-3de38c35458mr116735775ab.9.1750667762128; Mon, 23 Jun 2025
 01:36:02 -0700 (PDT)
Date: Mon, 23 Jun 2025 01:36:02 -0700
In-Reply-To: <20250623080347.3056823-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685911f2.050a0220.d71a0.0004.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl
 (3)
From: syzbot <syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com
Tested-by: syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com

Tested on:

commit:         86731a2a Linux 6.16-rc3
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10eff370580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=595d344ff0b23ac5
dashboard link: https://syzkaller.appspot.com/bug?extid=9b9124ae9b12d5af5d95
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11a46182580000

Note: testing is done by a robot and is best-effort only.
