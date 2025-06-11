Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E48D1A9B32
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 18:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749666315; cv=none; b=C2WiCtPv2JRmqJDS8EZFphYPINqCtkEUnCCtRojE/OrX38EC8U7bNM5I/b8wwmEWhtQfLpEqj57sTVLMjhPOFcXfPraMs71efskx4a4V5JGL9/KWgjNBtDdCCg6KfzufI9aBt9htKgTy9h+F/THGTmwD6Y/uejWRmIH5cuxXrMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749666315; c=relaxed/simple;
	bh=WkIP6q09/kO639/VA+9jUW8hJ/jqp3VXSXt+kXeZWyI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=iH5o9YgRn+IZ7AF4O8bAwhgxPo9uyVfMi20FrYna/tMipo/kChQg5aBIYkKl1haWrRwsT1wLP5kwzHnhWouEGe/F4rzrSFR3HMFa0lhAxnDoHDJTMjOMJjFNa+Gp0XdzNOUyNXnOITCkAwu5ZGyOKzk71Pccycpus8mi7uZTJ2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-408e286e414so143032b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749666313; x=1750271113;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TT8U0APacSFSss4rJFpVZ2Ta8ITNyPLTp/K2FTAkN1Q=;
        b=bSRhK43GIaPQ3ns7IrecZEkeYP31OEHqmUVoUOb12bCfZDRiiOh6pcnp6sPsQeeXYk
         8ORZiZO5/t3V3t4US0sWyZdkLhtjpdcKaRGPtLHYDxh84xCjn4lOcdKeoG8uhs21Gqp4
         ZoYDyi1iBYgz1n2g6UVZPnSOAnI9MOK8uwmz9lFwdHq6gLhO5G5VDaO+cKtzItxqCeZA
         GWmYNixx5v5gu6JN1ZBtm54oS00GcuhpAetT7tDkVKjU8uOtTlyDwXcgqn6zc0dzZeYo
         YjxRwp2zV2UM4D2xai0VZEDogixg6wpiDXy5y5mJE3Dl4xApc2PXQsZMjhRhUS74aR7O
         bRGw==
X-Forwarded-Encrypted: i=1; AJvYcCXOWz68G6owquxeSiNs/Eyoo2WZ/H+6gwaKPJFo9AqvN/NMPKNzXYh4jmSJRZaUnseb87CUkZdHnbNkH5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTQ1/f0LtEJx7GoA4aH6Xjyjguf529j19hw0QIitqYe4cu4q28
	7XGO5ersPdoCQ+H0MwXzY8oSuQj9sGJsr5Q2XV12V01lFRMuHDRAN0lqxEnRprVbRmeXYymy/5/
	lBhde04BTgjUqVjA1UZcFt9uAJ0CVBStJl0aJkP6I3KSptBMwkX6WMr4hyhI=
X-Google-Smtp-Source: AGHT+IFB8AYaTkRJmjuKTdQ5okc5Om2wfzIkqdJ8+720iF+jrK+POAwGXletigkW6itSa4fOK92wADfO3HGVzJhQjgYi24gdkmwa
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a68:b0:3dc:875e:ed7e with SMTP id
 e9e14a558f8ab-3ddfa875ea0mr14392755ab.12.1749666302955; Wed, 11 Jun 2025
 11:25:02 -0700 (PDT)
Date: Wed, 11 Jun 2025 11:25:02 -0700
In-Reply-To: <68488453.a70a0220.27c366.0067.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6849c9fe.a00a0220.1eb5f5.00f4.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] KASAN: slab-out-of-bounds Read in bch2_sb_members_v1_to_text
From: syzbot <syzbot+e577022d4fba380653be@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit c5ae261c8095a37174e17eb13c5485cbd1b3bb20
Author: Kent Overstreet <kent.overstreet@linux.dev>
Date:   Sun Jun 8 15:31:23 2025 +0000

    bcachefs: Don't trust sb->nr_devices in members_to_text()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15a6ad70580000
start commit:   b27cc623e01b Add linux-next specific files for 20250610
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=17a6ad70580000
console output: https://syzkaller.appspot.com/x/log.txt?x=13a6ad70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=846e731334efc0f8
dashboard link: https://syzkaller.appspot.com/bug?extid=e577022d4fba380653be
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12a5e9d4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1766260c580000

Reported-by: syzbot+e577022d4fba380653be@syzkaller.appspotmail.com
Fixes: c5ae261c8095 ("bcachefs: Don't trust sb->nr_devices in members_to_text()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
