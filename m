Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEA1263C95
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101665; cv=none; b=t4QY2I0tjMj6xsJEP4lcQtVRy5r9Z9ft/YqAgzZHNM33kS+S/Y/GgXbGihTqKiaxEYTchHO3MGmIlZW2bouTN274qGESLwlb83F6A1xBpPgG2jzLHSOmIGreoYmy81J72wICNnXAtNYPCGDN5PcXZheGN74jwM0NLs0/shiOl/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101665; c=relaxed/simple;
	bh=SlDbiuoYIedZstX15tQvYCFIOLJTh2teoyOwY4O2Fgw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QcIcjuMSQMguqAlStOnsVCZOu2OjOXfXNXmTVCTdtdQx+13ZPAGHo2dD1eFoDCwbX/i9VWz0MJiDpsRaoRZTujgLFw7OVSDONmyk32tMMnO4oK6UnRUSNAVpUh0ZAqEiIM+xS8YaULPmuXwS2DZnufmtHq8ZI+WPME3+OBDDTok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-851a991cf8bso555393039f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 01:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101663; x=1744706463;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DFxw0IIuBP5M906d9PbBpExGapOGcyT94nzv7ktzd3Y=;
        b=P+dz8srH/m/DPYcHPEyLaio5DyasLW2BGai3zK7Q16n+zYItflNHME4r1tQKKxodB8
         LPz7hmlWu9K6/KOP03niY3ApXQsnh3DPMyT/HkY852zmZhtMuojsWxgEUB526n2wZE6l
         7dI5GdqEit6FfpAdRi85NcpgBVBbdOub3JG5z1m/lJK2r1Y1yH2b766oRE9qTzAGfF0c
         9jYOE/HVLoj+ktAahQzUm16S7QqSw+JapeYtyB+6xS1KmXIb0RJn2mprJVO0cXh+pplo
         2emnW50JqvkUNZ2zmguRuYGzF6te2FcvJcGC1Z02qyFqeNTtDn44+hxKs7nEB1mrrhA7
         wzTA==
X-Forwarded-Encrypted: i=1; AJvYcCXydDkxjNQmFnctRFmgCojejWMMtIbWGrlOSfTBJbx3Y3JggaYgdy8YxopuANuUV08d9xiGa20QqiWR0Qw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3SpblAi2k61SBTxf7bLmbfOnWRWA/4yQxODQPw/MtOTRIySIc
	3vdiAIHyIju64TCa6+cMG57Sfgu6b0iBgISwQfvEja7fB5idRV1DeRO2VkMr/SY7qv2Qnr9hCWv
	NXj2jx7QPZ/nJoIMilEAVuqlCNWvdb8qTtKMt8F27H7LtjYakpRy6nqA=
X-Google-Smtp-Source: AGHT+IHCiaf971JXRLG0SAxxWGrKuZEYwiVkN3X0+LNLpVOTJeUT4Wz1k0EYEr/tmbmPBS+DDXdAUMajBQeBUwl7zrdjaj9v8hpx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3288:b0:3d3:f72c:8fd8 with SMTP id
 e9e14a558f8ab-3d7036bce59mr26236625ab.6.1744101662937; Tue, 08 Apr 2025
 01:41:02 -0700 (PDT)
Date: Tue, 08 Apr 2025 01:41:02 -0700
In-Reply-To: <66f53709.050a0220.211276.0068.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f4e11e.050a0220.396535.055a.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] INFO: task hung in bch2_fs_read_only
From: syzbot <syzbot+c7aacacf99dcfd3475a7@syzkaller.appspotmail.com>
To: bfoster@redhat.com, kent.overstreet@linux.dev, 
	linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 8b22abb4c84058e9533d71a4814e54316ba2621f
Author: Kent Overstreet <kent.overstreet@linux.dev>
Date:   Sat Oct 12 02:53:09 2024 +0000

    bcachefs: -o norecovery now bails out of recovery earlier

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=106bd23f980000
start commit:   aa486552a110 Merge tag 'memblock-v6.12-rc1' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=bad8b2899350fd0b
dashboard link: https://syzkaller.appspot.com/bug?extid=c7aacacf99dcfd3475a7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=102b699f980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=151ccaa9980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: bcachefs: -o norecovery now bails out of recovery earlier

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
