Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9A018E3F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 15:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744471025; cv=none; b=iMByJlVVJupsz53S0Vc3kjFxEEpN1wHldkTuBQshThfFoFEOX5Q1gMjWnlOWw9/AMrgwUUPqjaZcYIyaGSXy++/g2HN0LvERbvjDs+3foMiQhb8zuawhOIdk29q4qSvlaybAJ4+FPc5RArl48xhT6yUu3z9gz3CVhNtKOGallz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744471025; c=relaxed/simple;
	bh=xFhFns5/OpONhDD/wdpC6H0rPMauAfL8K34lB0J+0Rw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cAdkg7gD3owtzB204XZ7R+PFySgdgtxOUTOefbQD9FldddsrFIh7OYroBHVm6bck9IS6GRBOzcn0vbL9rdkIGFJ1mtsqLTQSImoGXcawIfElL1pjts1qeF1m2UhlP0iiRc6Q1cwux8P30CDs55RTLtLs7c3bBgOFDx+gey7Gr40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d586b968cfso22283615ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 08:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744471023; x=1745075823;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LkcIB33QyUmP9a2poFNREDfTihC4P2a6WpKzZvlmcUA=;
        b=RRSWJOzxxRF0Rs/o3wqNAoAbVV44NSBJj4rmuuneEw5lPMyjsEIGpce9LUJdf6s9de
         HJUnRGYalAPW8ZgzZ2qdhLVX7kV2kEDUj1Qbo4AeMg0B92r8q8RgA21krZS/9hwFgUyt
         DIGNDBBiDf1wwdJSs+q/iIQA3pN+DDJvmtjvGPke9ue33/cB+s+kYlOwBlSLX+zLiNtD
         lRJmsAio1VJeVMsOyROF5LrtxO055RzgUEEfjvKvEuq6Fxm4XOB0pzc9zY7nHYBDdG3t
         Oo5Wuj+4yUCZpl//RymSvfhyNuR37IfIuI+U7YskTBQDyHDNbcao4BgmwMn0iR7RIVMN
         Pghw==
X-Forwarded-Encrypted: i=1; AJvYcCVB0NDZZaw72e7ukWOfyO/BZFrPPcBN3KCoYywsGm/+yZwvHVHWzsM4xF71e8M9ZRfDk6D9kVk1lvgkIr8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy7e4GeAasTISpPdICdBkGeCCtiP+KgHN/A+tG6kd6f6bTGTkc
	/6Ba4aYPKENl/Ew+rcQ1h6xU9WKlt6aAq+Uw5eYFtjTjIVTGr+Z8/5fwnb21/5PV5jLFHqaC/y+
	b3y/yM6nhLlTdvVd+tICRwgoRnOyGQqVbw73qy27nLRO5N1x5H4A+A+A=
X-Google-Smtp-Source: AGHT+IGoqKXx7MWN7WmGkbPYwYBHTjry4VYi0/IS9ZlyPB9zXqR3G082tcbd8/gFBqeUWkvYH1FTLTy44kwi1t7oWawtuaVuYZjF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:378f:b0:3cf:c9ad:46a1 with SMTP id
 e9e14a558f8ab-3d7ec21c324mr61704795ab.13.1744471022837; Sat, 12 Apr 2025
 08:17:02 -0700 (PDT)
Date: Sat, 12 Apr 2025 08:17:02 -0700
In-Reply-To: <67fa0c0c.050a0220.379d84.0007.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fa83ee.050a0220.379d84.000f.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] kernel BUG in bch2_fs_initialize
From: syzbot <syzbot+d10151bf01574a09a915@syzkaller.appspotmail.com>
To: edumazet@google.com, kent.overstreet@linux.dev, 
	linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mmpgouride@gmail.com, sven@narfation.org, sw@simonwunderlich.de, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 00b35530811f2aa3d7ceec2dbada80861c7632a8
Author: Eric Dumazet <edumazet@google.com>
Date:   Thu Feb 6 14:04:22 2025 +0000

    batman-adv: adopt netdev_hold() / netdev_put()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12c41f4c580000
start commit:   29e7bf01ed80 Add linux-next specific files for 20250410
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=11c41f4c580000
console output: https://syzkaller.appspot.com/x/log.txt?x=16c41f4c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a554d15459e77547
dashboard link: https://syzkaller.appspot.com/bug?extid=d10151bf01574a09a915
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14634398580000

Reported-by: syzbot+d10151bf01574a09a915@syzkaller.appspotmail.com
Fixes: 00b35530811f ("batman-adv: adopt netdev_hold() / netdev_put()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
