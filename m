Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC74426BD85
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739238544; cv=none; b=EEBYvzjONwzxe/nOxOVVN2QruMlctliCyto0peyuegt8u0G7P4T0tbgac2MLb90v1Aibz1drXbSq3oNZ/Mf9ygVUVNPLbMx4ttBlKnJM2SX6fFB51UOVwdHHdaKvQXv+IKBfOCG8KOW5AEuttmZ3LE8pZep9TwQLWRHZL5uSheQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739238544; c=relaxed/simple;
	bh=SsnG9T5lCnLpM/h2BMCue4tlHmHUfag1ncnQCShJZSk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=am2HnQWIxcyS2iD19+vSu3dVA013lFo/WshfbxqvoPLAw8y/LvkiTQS+tO3z0Ob6vA4aFM6HXa57guSwhVtnZvdXV/1fvpL3bD9OHBQLtX218BLggj7Qnk+aRbkkjN/ujsFWAkgigiFJB3jOSWZFpa2SAbd2axlcmkwiMk8Z7wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d13fb2256fso25828285ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:49:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739238542; x=1739843342;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WLhYcKiBe24Tl9YiIDD6yldfDa+nM+2pELGQ1R5P+q4=;
        b=DQM/MFg4a7Kr48qcJwJDbE7PaKKUPCNquq/qo+Zv8C4Dg9/JdZcpTesUp1ts0uALJ3
         cadVfUTm1psw/sW35j850Ou+rhnjG6fCNYns30AU8E61tyNHIanZsQENINI0zMvMAuwx
         XGkYLgvtuY28bgCUYu3+PKZz8INp2iQopRvA9v9AHkNxNHc8VDvm7ld05EyiYbra9dl4
         yS4BiZvBI7qZw/AQLiynnzpX3LNWKhuA1bxNkZkQEKqRYOf01Ec7ztc9X+OOecEcPjDo
         ttFy/+f38HvClo0hMd6K+FhBDQWnfBsypR+2I66Bpgj7+1aTs78wxgM/T0RIfccIAU+c
         38dQ==
X-Gm-Message-State: AOJu0Yw9nxWeOF6hFflrISyHXvEY1LozIzI4qYyWtbkweyUon6zAW6sy
	Yc+V5U59PiILFJZyX0MlvaLJmpTW/ckjzzTaR3R+oEbBLGeV2X9qTDIBE1Mnx5wlBRuvmvhyrRa
	lJ9bvUY44QRnmIltwySeS8tU+kFk//MdFIX0GHqQZd+gP7Wp1RcHxe0c=
X-Google-Smtp-Source: AGHT+IEEZ1+4oxDrm2h3eVXMZVGOl96zWyh2aEkOe6MLh4nVn5HqZknIaWZcG7P4dAFmHl+LkXNYVqAlelo+Kya2peDfSxxrYUlB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12c5:b0:3d0:17d2:a02c with SMTP id
 e9e14a558f8ab-3d13df7927amr109862835ab.20.1739238542083; Mon, 10 Feb 2025
 17:49:02 -0800 (PST)
Date: Mon, 10 Feb 2025 17:49:02 -0800
In-Reply-To: <Z6qg-424enAcBWZl@qasdev.system>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67aaac8e.050a0220.3d72c.005a.GAE@google.com>
Subject: Re: [syzbot] [isofs?] KMSAN: uninit-value in isofs_readdir
From: syzbot <syzbot+812641c6c3d7586a1613@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, qasdev00@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+812641c6c3d7586a1613@syzkaller.appspotmail.com
Tested-by: syzbot+812641c6c3d7586a1613@syzkaller.appspotmail.com

Tested on:

commit:         febbc555 Merge tag 'nfsd-6.14-1' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1710c3f8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=48f90cac5eea091a
dashboard link: https://syzkaller.appspot.com/bug?extid=812641c6c3d7586a1613
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10bf7b18580000

Note: testing is done by a robot and is best-effort only.
