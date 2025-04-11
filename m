Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9BE20FA90
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744386726; cv=none; b=t640rZ81Ytv8zk6etUYm+l6pwOpTKIcmCV3xT8jE504Mj7O8GGR0LeQYQGmY4x74ut+JLBENiJpd7CyxdTR0GuDSyhM0qsFCup+w3aXzJ1znl2OVnyHMDVh8bqnkim/QjAvfcVy7FOCgEIZ4S2lJlW3AsMrgflu3Wcd/+Uvqs74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744386726; c=relaxed/simple;
	bh=Cm1S8n4HvXkNg3M7+x98S/klYnfkLdVLWBGBf4WpcLo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=e5K6WlLi5ZsDuVL1U4OKHgv29DItVy/hlKKV7bc2te9BIuZyk2MQN6zYrnzAhZ/9WuCNIxFapKuM8eFP1dwuP/HK8HVZ7HoZnggKsjP7pe5lvqoX+GFZp5st12Ycx8RVcAVZGG/k4aoEtIyLu8gdgw4C6/nFanTeYnDiuMXlOho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d4578fbaf4so43956455ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744386724; x=1744991524;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j9Rm20tgPIVlasLY5+mlUVDiqqosCGRBLcfWz2QKiWw=;
        b=fipKXvL26XVejh95D8z2jUHVEyy/2NzaNufffyZYcgTB8RkunczijajBD8dso9j+eK
         TVeQW7UXJ0kUjZ0vsj3mdz8wqsu1PjOB6pOTC/ipORUZ0HJN1MObYJgn5GD6kiI6ZZzJ
         ci4xmt1vfL8oOBAvkYWaMncZTnH0wiSi5BH+juf0GdcFymBEOoNgEHjA8TkPbmFYWkcg
         6i+Uk70qMzVQZE6CQ5P7tZ5Uy4NuTMV/YbW+rK21oWpTZXIgvugPHYR/CtPqORq+6r37
         xj80zp7yv0wclj5iTGDc0B9xQ3b5MEZoYdY2BxmKxrSLF7+0jZVCWsIomKD9MseduP0o
         /4jg==
X-Forwarded-Encrypted: i=1; AJvYcCXhy2VqeCFLrgTRSSLaN2CseaO3Uhbk7T+m3M4DZpCzd2tFa8AJ9f2sywpxWrxcMiIHvBpmpnNFrTU05KA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfOAzOie3c801GkE5FPZKrCornfeg9SRkzxEy0NX5DzB80HOUW
	batrmCkBy+msGOSbYv3Is2fq1kqLoldJbAzCsiqiF5MrwU3bTc3c0n2nDXWPlAOWdlsL4yC/Awk
	XwIf69bQKtxV1wGJEp2cAuT/XTM1N2YTzY4PkLVlw1J+LUixh8t4OLYc=
X-Google-Smtp-Source: AGHT+IGl5gBtzIhGcLfzPKV03qwQ0UJaaZQFsriMvDyR9hHnL1GiKpgBiHaW2VNixnElsnhBjWSXs8jCrtNIC+BjcGXAyHE412g6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b25:b0:3d4:244b:db1d with SMTP id
 e9e14a558f8ab-3d7ec2033cbmr31096595ab.6.1744386723815; Fri, 11 Apr 2025
 08:52:03 -0700 (PDT)
Date: Fri, 11 Apr 2025 08:52:03 -0700
In-Reply-To: <m2o6x2r9s1.fsf@posteo.net>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f93aa3.050a0220.2c5fcf.0000.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] general protection fault in bch2_snapshot_tree_oldest_subvol
From: syzbot <syzbot+baee8591f336cab0958b@syzkaller.appspotmail.com>
To: charmitro@posteo.net, kent.overstreet@linux.dev, 
	linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         900241a5 Merge tag 'drm-fixes-2025-04-11-1' of https:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1314c870580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fb8650d88e9fb80f
dashboard link: https://syzkaller.appspot.com/bug?extid=baee8591f336cab0958b
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16f08870580000

