Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E4728FD
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 04:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748840288; cv=none; b=dEAPMDyHKsvzVKxAO3jofV6ENi5WJwJONBkKUlqLAFUSfwCynxIcJvap0LG6KwrVmNUOw98fTQ7DpLFq4kaQwx/cvxOu5iUiABVGbw8GbV7+S7IqcqTWiaKhOvmw5pmBCMsclRCD0rUyYHW1OWsNuY/o4P7EDIfL4M4w0iLfm+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748840288; c=relaxed/simple;
	bh=5TQ0qp+bxkDnuPXCx5dBto1sEgO/gX09XbvUDaTN7ps=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uAFUsDjpxAa2Q4ZteVk1bZ3GaVbLsGWdpiw8/6hfyqD6+rCOBSH5FDaG8+Ten+fvLQiKF3kG1Pp6+y6SNcDJMrXsnQHsvFjhZpxy0S7/Cj5ANWgk3wSilZaRPZMMIzXC2rvlP6Qn8iS5SLsV5sx9CdRjlzs7G4JPKUQB8/yxJ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3dd89b3a644so53477695ab.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 21:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748840284; x=1749445084;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0j9hGDEF8kRVU4tMlLi5t2D4NxA/6spXe72OnDP8DfE=;
        b=m1imWFzOda75eEMbBdf0bAYPkXrBao5Goyaj3b2ZRnoj8SBBr6TuDhpAfS5zg9HyIQ
         UabuCRHJGV1c1gE/eD5WClVlMhTvV+W5irReFy5qL7pQOwQEalMPeNyy5DpRtXJmcbtk
         K1nRi0vdoS7muYa8ol7jL+JDdZTfekUatQfRuL1VWEFfaGylJ2rgOYtKMhOsN3LXwn/2
         23DuDIu2fNbmCUz4Xf3sYp5EfqlgHnoWcE1cJa1nP3r4tsjTpNWUXMLdDqTAo2WUWYbO
         EBDNmvUFA3CdqoDjHCIBYQNUTORT1vETCOTcO/KcTdZXPqHREgxppE3z7vtq5TTDYpGO
         X1Og==
X-Forwarded-Encrypted: i=1; AJvYcCWWnCGZARykcrnn8Gzw3hXy76QY0jTBlAlJMwny/DGMzFCbj6Oz+WGg9uFG1omYY/cYFUIXI2LsohNipXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSOqtOIhevkAGsUBzb8ZPVT4OdowMU8M7E9DKvyc7ETSom/tV9
	yUrgSq5W4sdaeaQUZh7wY6fQ3wlnZjod2vhAyuQhJfh0vE9DEWW27y+25jsMIE6H01B/eLWbRXU
	LNhdhKbWnu1rK3Y/H+a0/+TKNrt8zdbmmUf0ilzj+WIeKYjn516JlM+J4oIU=
X-Google-Smtp-Source: AGHT+IEjcJ2biToV/Kq8COUkTSWb+hFbnsvEmcsRurEiab78rEhMdgcH7lY9lcj3uyCfL/IwcIg2Z+C4lRncirZrvCkcHJV77fOd
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a41:b0:3dd:8136:a687 with SMTP id
 e9e14a558f8ab-3dd9a34a5e8mr104513725ab.8.1748840284315; Sun, 01 Jun 2025
 21:58:04 -0700 (PDT)
Date: Sun, 01 Jun 2025 21:58:04 -0700
In-Reply-To: <20250602043805.2660-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683d2f5c.a00a0220.d8eae.0042.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-out-of-bounds Read in __futex_pivot_hash
From: syzbot <syzbot+0a5079ee014f4b907817@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+0a5079ee014f4b907817@syzkaller.appspotmail.com
Tested-by: syzbot+0a5079ee014f4b907817@syzkaller.appspotmail.com

Tested on:

commit:         cd2e103d Merge tag 'hardening-v6.16-rc1-fix1-take2' of..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=132bcc82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4df26174733e11f3
dashboard link: https://syzkaller.appspot.com/bug?extid=0a5079ee014f4b907817
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12af700c580000

Note: testing is done by a robot and is best-effort only.
