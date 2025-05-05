Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D409F139E
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 04:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746419466; cv=none; b=q4LpKRqapSiY76GKZnN0k1imNdeAv43Nijrp7z5anZKLKk4MnR+MJxlSgcEzLnaHSA++gfAqJpVlEQSWVaDpYU913Uw1v2C4SFcCnIdC+ymPS7kXGHJhKYFTrvgeW+MxzHXNKEKS54eeVYM9kpBLOolABzXvcwwnxT4JosGTEow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746419466; c=relaxed/simple;
	bh=F41dN5yLIjXDCVatJrb/xWeaKmnsyma+xNM9h+PHygM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hJZhg9mKmWnDsMNFSjJqRgkIUb4aMkx0rdH42nK4K/cxozt9jwOt4qPdtKgb09pwCdtcXCho82O1kSiwVYezeR+tbTo1gT+thZ55ToO76msUVW6/4GKgfIgb60EOxiooHOMYE7+pSCaGKXVOfYgc+papBeptg/4Jl+bG9NKfXyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d458e61faaso39994605ab.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 21:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746419464; x=1747024264;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZ9KabnFb/FDmPl5mN7PEmDhkOdIrxUaOKUXGXW8dG4=;
        b=k2hV4MPuGPkMEOuu1DoGB7n8FFBVJSv9U0e4um9yFHK79zj/nC+vN4VXIW8HLJ3TKJ
         zZmyi3AkgEU+alsCMlO84I6yoQs/S+tNZK4J8KOwxkTX2a/sFmuzySjMWB9Xatbm6zUi
         yqET9l9HV91IFhCXRagAgFQGo1J0ILTBu+VeikfCybFlypG1mbVZbtt5ktEd6f+mCJh4
         YX7DzoaR5ne9NShnlPw3fO+gkyBP2W5nORi4dGOj3tNnJPkDmnw+CL/XYmWIxv1qZjUk
         hMAnV/wpVpdIo9MWseRPUOCQEaxAvvG08CP23w93JpaovPcaAFiV8r6w5b24LghdGqia
         8huQ==
X-Gm-Message-State: AOJu0Ywx5pa3RDikJ0HLZdeMNXg5R9XK9yu6Oa5LIisu2bX+GK8hViVB
	Axi0p+9AoKTH/to5nqztMLp/jYwARCSCglABWvbW6IUNF6iuD+iqgUcR32FqmjuZpqiQFMLZr3e
	Fob6SO2KdBUwdTcFHWq9aRoUsh/O2JlArF1cJEW0QO3STD80ATXMnAZQ=
X-Google-Smtp-Source: AGHT+IFxPiYPkvC5w6UOE9r7lad9zoKDYtcAGXdk/faC6iJwAr5ujf3/BRA3tNstSwsOJKMhalKK4FVrdd077UgfqBmaBddDV0SN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:5c2:b0:3d3:d08d:d526 with SMTP id
 e9e14a558f8ab-3d970bab314mr116891615ab.11.1746419463971; Sun, 04 May 2025
 21:31:03 -0700 (PDT)
Date: Sun, 04 May 2025 21:31:03 -0700
In-Reply-To: <2408d5e8-e974-4c20-953d-3b41f7d05493@magd.ox.ac.uk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68183f07.a70a0220.254cdc.0040.GAE@google.com>
Subject: Re: [syzbot] [i2c?] KMSAN: kernel-infoleak in i2cdev_ioctl_smbus
From: syzbot <syzbot+08b819a87faa6def6dfb@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, praveen.balakrishnan@magd.ox.ac.uk, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+08b819a87faa6def6dfb@syzkaller.appspotmail.com
Tested-by: syzbot+08b819a87faa6def6dfb@syzkaller.appspotmail.com

Tested on:

commit:         92a09c47 Linux 6.15-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1227f0f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=15842c2411221d70
dashboard link: https://syzkaller.appspot.com/bug?extid=08b819a87faa6def6dfb
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1365b8d4580000

Note: testing is done by a robot and is best-effort only.
