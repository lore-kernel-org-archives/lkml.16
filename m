Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EB4142E83
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 14:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744467126; cv=none; b=aQmujqkjeICYzbNoVIX2/kWAwUfFahXa7pL6ArYW64ySPs3K7+3GIMmjCLs8oJcOz2bkJ950aNqXjbJS25Vol5IfiSJeLqXQXehB/rVYCjKQ3/7L4CptDNyd3rsrB2UTFHdG37FGQ3J+Wcyb9hdGdrTS82eHK6kL40R1GkFPdzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744467126; c=relaxed/simple;
	bh=SW9baJwU90rv2J08hxwWTXYAPDJHnlNUogyQNt3kCn0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jTR58mHC+gvTXDPhQif1D9uH8E8LbgXCEIhCpNpiRIsRdCQbQnmBklAEGx9MEZSHwZb7efticedrv4joHULS4rF3IWCyPw1H1EWrRqJne3nvLRJq/mouws+f+xaqAAqS45DaNyDEsCAXzJm7IZI8ds30Z8InVDwByGEUTofmRB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d586b968cfso21523005ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 07:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744467124; x=1745071924;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vVtPfFRZtMU+7c6m3Lu81ACxShZ6xV2tolYQ458rPJE=;
        b=cHccgwfm+lON4QJ+2PZOKSjEhAxJ54q3n04FZV+yGN01u86Cp5OTV7yB+SD7xuKkh3
         b62HDWTYWO21yAYMsuipSdniDD2VAmv43dNvF7O95L5K4GJyvk85aBSPudPFYixfWsdh
         OR8YsUvMrrQJ6r0/hserZooAnxaoGEQrmyEJoeCKPOqtmL6Mg4x8WRYRi+oFReEpT+o2
         syFha50ltjDqcChXq3LS5L2wbx68f2ZbTuYXPtsj5dfzXnt13915bx2rJ5MI9L2InKpP
         inQOvE3/mFvMY4fKOPrL8V6BuJVecYfk+85dYCIaTSt8y7w72kRQZwSPBfDZYAV8AVLR
         fvZg==
X-Forwarded-Encrypted: i=1; AJvYcCU0sWCdUyTxCm/fG85EDUrKVtzrZubM9IygCv+M2jpb3qeH4hBvActsN5HWxI39PKw9os8gaCQZxRon/vE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywub3H8D1NHhmecxms7Q2xV7Ozx1ctgBXKuRp+mFF+fvr/YP6S9
	3xAmPIgV3qVA4FN3Djagdvn66oaQDrXopQ88yR2m5D5g+pU8+477UfozLSSfbqRwf83nziT3V60
	kEXws/vcYd3ucQ+xIJlxONAzQUEG2+zP3qpw1xxjHB8W+O9c6n68Z+2w=
X-Google-Smtp-Source: AGHT+IG7VQEkjMn9Fh81REVLoIjtUnO2qusesDv6QWiP6EtGelZywJ0/A6uJ9MaxHB1wgUUFcIRhP/tzWHTQpVud7sauboNK6hLB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:338f:b0:3d4:3fbf:966e with SMTP id
 e9e14a558f8ab-3d7ec265c39mr67322365ab.14.1744467123757; Sat, 12 Apr 2025
 07:12:03 -0700 (PDT)
Date: Sat, 12 Apr 2025 07:12:03 -0700
In-Reply-To: <6702c4bb.050a0220.49194.04d9.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fa74b3.050a0220.379d84.000e.GAE@google.com>
Subject: Re: [syzbot] [ext4?] KASAN: use-after-free Read in
 __ext4_check_dir_entry (3)
From: syzbot <syzbot+09921540dd04aba82a35@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, jack@suse.cz, libaokun1@huawei.com, 
	linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tytso@mit.edu, yi.zhang@huawei.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 26343ca0df715097065b02a6cddb4a029d5b9327
Author: Baokun Li <libaokun1@huawei.com>
Date:   Wed Jan 22 11:05:27 2025 +0000

    ext4: reject the 'data_err=abort' option in nojournal mode

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15734870580000
start commit:   e32cde8d2bd7 Merge tag 'sched_ext-for-6.12-rc1-fixes-1' of..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=1f009dd80b3799c2
dashboard link: https://syzkaller.appspot.com/bug?extid=09921540dd04aba82a35
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=102f23d0580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1082e580580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: ext4: reject the 'data_err=abort' option in nojournal mode

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
